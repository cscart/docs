vcl 4.0;

import std;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}

acl internal {
    "127.0.0.1";
}

###############################################################
## RECV                                                      ##
##                                                           ##
## Happens before we check if we have this in cache already. ##
###############################################################
sub vcl_recv {
    if (req.method == "PURGE") {
        if (!client.ip ~ internal) {
            return(synth(405, "Not allowed."));
        }
        return (purge);
    }

    if (req.method == "BAN") {
        if (!client.ip ~ internal) {
            return(synth(405, "Not allowed."));
        }

        if (req.http.X-Cache-Tags) {
            ban("obj.http.X-Cache-Tags ~ " + req.http.X-Cache-Tags);
            return (synth(204));
        }

        return (synth(403, "X-Cache-Tags header missing."));
    }

    # We do not support SPDY or HTTP/2.0
    if (req.method == "PRI") {
        return (synth(405));
    }

    # Non-RFC2616 or CONNECT which is weird.
    if (req.method != "GET" &&
        req.method != "HEAD" &&
        req.method != "PUT" &&
        req.method != "POST" &&
        req.method != "TRACE" &&
        req.method != "OPTIONS" &&
        req.method != "DELETE"
    ) {
        return (pipe);
    }

    # We only deal with GET and HEAD by default
    if (req.method != "GET" && req.method != "HEAD") {
        return (pass);
    }

    # Not cacheable by default
    if (req.http.Authorization) {
        return (pass);
    }

    # Strip hash, server doesn't need it.
    if (req.url ~ "\#") {
        set req.url = regsub(req.url, "\#.*$", "");
    }

    # Strip a trailing ? if it exists
    if (req.url ~ "\?$") {
        set req.url = regsub(req.url, "\?$", "");
    }

    # We could add here a custom header grouping User-agent families.
    # Generic URL manipulation.
    # Remove Google Analytics added parameters, useless for our backends.
    if ( req.url ~ "(\?|&)(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=" ) {
      set req.url = regsuball(req.url, "&(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "");
      set req.url = regsuball(req.url, "\?(utm_source|utm_medium|utm_campaign|utm_content|gclid|cx|ie|cof|siteurl)=([A-z0-9_\-\.%25]+)", "?");
      set req.url = regsub(req.url, "\?&", "?");
      set req.url = regsub(req.url, "\?$", "");
    }

    # We're unable to parse this header in order to pass correct GET-parameter to PHP backend.
    # The temporary solution is to disable language autodetection feature.
    if (req.http.Accept-Language) {
        unset req.http.Accept-Language;
    }

    if (req.url ~ "\.(jpg|jpeg|png|gif|ico|tiff|tif|bmp|ppm|pgm|xcf|psd|webp|svg|css|js|html|txt|woff|eot|otf|ttf|zip|sql|tar|gz|tgz|bzip2|mp3|mp4|flv|ogg|swf)") {
        return (pass);
    }

    # Got ESI-request
    if (req.esi_level > 0 || req.url ~ "^\/esi.php") {
        set req.http.X-Varnish-ESI = true;
        return (pass);
    }

    if (req.http.Cookie ~ "fpc_disable_cache=") {
        set req.http.X-Varnish-Disable-Cache = true;
        return (pass);
    }

    # Normalize the querystring arguments
    set req.url = std.querysort(req.url);

    return (hash);
}

##############################################################
## HASH                                                     ##
##                                                          ##
## Defines what is unique about a request.                  ##
## Executed when vcl_recv returns the hash action keyword.  ##
##############################################################
sub vcl_hash {
    hash_data(req.url);

    if (req.http.host) {
        hash_data(req.http.host);
    } else {
        hash_data(server.ip);
    }

    if (req.http.Cookie ~ "fpc_sid_customer") {
        hash_data("has_session");
    }

    if (req.http.Cookie ~ "fpc_currency=") {
        set req.http.X-Currency = regsub(req.http.cookie, ".*fpc_currency=([^;]+).*", "\1");
        hash_data(req.http.X-Currency);
        unset req.http.X-Currency;
    }

    if (req.http.Cookie ~ "fpc_sl=") {
        set req.http.X-Language = regsub(req.http.cookie, ".*fpc_sl=([^;]+).*", "\1");
        hash_data(req.http.X-Language);
        unset req.http.X-Language;
    }

    return (lookup);
}

############################################################################
## BACKEND RESPONSE                                                       ##
##                                                                        ##
## Happens after we have read the response headers from the backend.      ##
## Here you clean the response headers, removing silly Set-Cookie headers ##
## and other mistakes your backend does.                                  ##
############################################################################
sub vcl_backend_response {

    # beresp = BackEnd Response

    if (beresp.http.X-ESI-Response) {
        # ESI-response shouldn't set cookies
        unset beresp.http.Set-Cookie;

        # Disable caching ESI-requests
        set beresp.ttl = 0s;
        set beresp.uncacheable = true;

        # Do not parse nested ESI
        set beresp.do_esi = false;
    } else if (beresp.http.X-Cache-TTL) {
        set beresp.uncacheable = false;
        set beresp.ttl = std.duration(beresp.http.X-Cache-TTL, 60s);

        if (beresp.http.X-Do-ESI) {
            set beresp.do_esi = true;
        }
    } else {
        set beresp.ttl = 0s;
        set beresp.uncacheable = true;
        set beresp.do_esi = false;
    }

    # Strip Set-Cookie headers and set object TTL
    # before saving page to cache
    if (beresp.ttl > 0s && !beresp.uncacheable) {
        unset beresp.http.Set-Cookie;
    }

    unset beresp.http.X-Powered-By;
    unset beresp.http.X-Cache-TTL;

    return (deliver);
}

######################################################################################################
## DELIVER                                                                                          ##
##                                                                                                  ##
## Happens when we have all the pieces we need, and are about to send the response to the client.   ##
######################################################################################################
sub vcl_deliver {
    set resp.http.X-Varnish-Hits = obj.hits;
    set resp.http.X-Req-URL = req.url;
    set resp.http.X-Req-Host = req.http.host;
    set resp.http.X-Req-Cookie = req.http.Cookie;
    set resp.http.X-Req-Language = req.http.X-Language;
    set resp.http.X-Req-Currency = req.http.X-Currency;
}