***********************************
Technical Info on Full-Page Caching
***********************************

.. important::

    This add-on doesn't come with CS-Cart and Multi-Vendor by default. You can `buy it separately in our Marketplace <https://marketplace.cs-cart.com/add-ons/integrations/marketplace-performance-booster.html>`_.

.. contents::
    :backlinks: none
    :local:

============================
About the Add-on and Varnish
============================

Marketplace Performance Booster is an add-on that brings the support of full-page cache to Multi-Vendor 4.3.6 and newer versions. Full-page caching reduces server load and makes the site respond faster.

* **Without caching**, a page needs to run its code and get data from the database whenever it loads.

* **With caching**, the page is generated once. It can then load from cache, without spending time and server resources on running the code or accessing the database.

This add-on works in combination with `Varnish Cache <https://varnish-cache.org/>`_—free software that serves as caching reverse proxy. Learn more about Varnish here:

* `Wikipedia <https://en.wikipedia.org/wiki/Varnish_%28software%29>`_

* `The Big Varnish Picture <https://varnish-cache.org/docs/trunk/users-guide/intro.html>`_

* `Varnish Startup Options <https://varnish-cache.org/docs/trunk/reference/varnishd.html#ref-varnishd-options>`_

* `Varnish and Website Performance <https://varnish-cache.org/docs/trunk/users-guide/performance.html#users-performance>`_

=====================================
How Caching Works for Different Users
=====================================

Cached data can be used for handling requests of similar types. For example, a visitor and a customer can see the same page differently. **There are 3 types of requests:**

* **From users without a session**—requests from visitors who just browse the content, but don't interact with the store. For example, they haven't added products to cart, placed an order, signed in, and so on.

  Caching is the most effective for these requests, because pages will be returned from the cache fully, without involving the backend server.

* **From users with a session**—requests from visitors who interact with the store somehow. Caching will still be used for such cases, but session-dependent blocks (such as cart) will be loaded without the cache via the `ESI <https://varnish-cache.org/docs/trunk/users-guide/esi.html>`_ mechanism. Every block that uses ESI will send a request to the backend server.

* **From users who have signed in**—requests from these users will not involve caching. That's because singed-in users can see different content (for example, different product prices depending on the user group.

.. note::

    Full-page caching works only on the storefront (not in the admin panel), and only for a specific whitelist of pages. To add more pages to that list, extend the ``full_page_cache/varnish`` schema.

===============================
How the Add-on Affects Sessions
===============================

When the add-on becomes active, the following changes take place:

* The automatic start-up of sessions is disabled. A session will start only after a POST request, or when there is a session cookie.

* The ``fpc_`` prefix is added to the session cookie name. This will end the sessions of the users who have already signed in.

===============
Caching Process
===============

-------------------
When Caching Occurs
-------------------

By default, Varnish doesn't cache content until the backend server instructs it to do so. The backend server communicates with Varnish by sending HTTP headers together with content:

* ``X-Cache-TTL``—the lifespan of the page cache. If this header is missing or equals `0`, content won't be cached.

* ``X-Cache-Tags``—the dependencies of the page cache; the list of tags associated with the page cache.

* ``X-Do-ESI``—whether or not to use `ESI <https://varnish-cache.org/docs/trunk/users-guide/esi.html>`_. If the value of this header is ``1``, then Varnish will use ESI.

------------------------------
When Cache Invalidation Occurs
------------------------------

Cache invalidation occurs:

* Automatically, when the time to live (TTL) expires.

* On request, when the cache is invalidated by tags.

Every cached page is linked to a list of tags. As a rule, this is the list of database tables used for the generation of the page. If the data in at least one of these tables changes, cache will be invalidated.

Invalidation occurs when the backend server sends an HTTP request to the Varnish server with the `BAN` method and the list of tags to be invalidated in the ``X-Cache-Tags`` header.

.. important::

    Varnish will accept invalidation requests only from the IP addresses whitelisted in thе *default.vcl* file.

--------------------------------
TTL Settings (Under Development)
--------------------------------

Eventually, the add-on will allow you to set different TTL (time to live) for different types of pages. The following settings are planned:

* Default cache TTL—will apply the same TTL to all the pages, except for those that have their own TTL.

* Homepage cache TTL.

* Category page cache TTL.

* Product page cache TTL.


============
Known Issues
============

#. Automatic language detection doesn't work. It's because browsers pass the client's preferred languages in the ``Accept-Language`` header, and it can have many possible variants. Taking this header into account would result in explosive growth of the cache and reduction of its effectiveness.


#. When you open a URL that has a path without a slash in the end, you are redirected to port 8080 and get the following error message: "No storefronts defined for this domain."

   * **Cause:** By default, when the URL is like *http://example.com/path*, the Apache web server returns a 301 redirect to *http://example.com/path/* (with a trailing slash).

     When building the redirect destination URL, Apache considers the ``UseCanonicalName`` and ``UseCanonicalPhysicalPort`` settings:

     * When they are set to *On*, Apache will use Hostname and Port specified in the virtual host settings.

     * When they are set to *Off*, Apache will take Hostname and Port from the HTTP headers sent by the browser.

     In our case, the virtual host has port ``8080`` specified, and clients address to port ``80``. When building the redirect destination URL, Apache uses the virtual host settings.

   * **Solution:** Set ``UseCanonicalName`` and ``UseCanonicalPhysicalPort`` to *Off* in the virtual host settings.

.. meta::
   :description: How to configure Varnish Cache and ESI to work with Multi-Vendor marketplace platform?
