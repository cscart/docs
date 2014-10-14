<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta charset="utf-8">
  <title>
  cs-cart / docs.cs-cart.ru 
  / source  / developer / themes / top_panel_header / files / css / cart_content_before.tpl
 &mdash; Bitbucket
</title>
  <link rel="icon" type="image/png" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/img/favicon.png">
  <meta id="bb-canon-url" name="bb-canon-url" content="https://bitbucket.org">
  
  
    
      
<link rel="stylesheet" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/compressed/css/b8a7f2a81a56.css" type="text/css" />
<link rel="stylesheet" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/compressed/css/9b21819d0165.css" type="text/css" />

    
  
  <!--[if lte IE 9]><link rel="stylesheet" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/bower_components/fd-slider/css/fd-slider.css" media="all"><![endif]-->
  <!--[if IE 9]><link rel="stylesheet" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/bower_components/bb-aui/aui-next/css/aui-ie9.css" media="all"><![endif]-->
  <!--[if IE]><link rel="stylesheet" href="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/css/aui-overrides-ie.css" media="all"><![endif]-->
  <meta name="description" content=""/>
  <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="Bitbucket" />
  
  
    <link href="/cs-cart/docs.cs-cart.ru/rss" rel="alternate nofollow" type="application/rss+xml" title="RSS feed for docs.cs-cart.ru" />
  

<script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"VwMGVVZSGwIIUFBQDwU="};window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var o=e[n]={exports:{}};t[n][0].call(o.exports,function(e){var o=t[n][1][e];return r(o?o:e)},o,o.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({QJf3ax:[function(t,e){function n(t){function e(e,n,a){t&&t(e,n,a),a||(a={});for(var c=s(e),u=c.length,f=i(a,o,r),d=0;u>d;d++)c[d].apply(f,n);return f}function a(t,e){u[t]=s(t).concat(e)}function s(t){return u[t]||[]}function c(){return n(e)}var u={};return{on:a,emit:e,create:c,listeners:s,_events:u}}function r(){return{}}var o="nr@context",i=t("gos");e.exports=n()},{gos:"7eSDFh"}],ee:[function(t,e){e.exports=t("QJf3ax")},{}],3:[function(t){function e(t,e,n,i,s){try{c?c-=1:r("err",[s||new UncaughtException(t,e,n)])}catch(u){try{r("ierr",[u,(new Date).getTime(),!0])}catch(f){}}return"function"==typeof a?a.apply(this,o(arguments)):!1}function UncaughtException(t,e,n){this.message=t||"Uncaught error with no additional information",this.sourceURL=e,this.line=n}function n(t){r("err",[t,(new Date).getTime()])}var r=t("handle"),o=t(4),i=t("ee"),a=window.onerror,s=!1,c=0;t("loader").features.err=!0,window.onerror=e,NREUM.noticeError=n;try{throw new Error}catch(u){"stack"in u&&(t(5),t(3),"addEventListener"in window&&t(1),window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&t(2),s=!0)}i.on("fn-start",function(){s&&(c+=1)}),i.on("fn-err",function(t,e,r){s&&(this.thrown=!0,n(r))}),i.on("fn-end",function(){s&&!this.thrown&&c>0&&(c-=1)}),i.on("internal-error",function(t){r("ierr",[t,(new Date).getTime(),!0])})},{1:4,2:7,3:5,4:18,5:6,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],4:[function(t,e){function n(t){i.inPlace(t,["addEventListener","removeEventListener"],"-",r)}function r(t){return t[1]}var o=(t(1),t("ee").create()),i=t(2)(o),a=t("gos");if(e.exports=o,n(window),"getPrototypeOf"in Object){for(var s=document;s&&!s.hasOwnProperty("addEventListener");)s=Object.getPrototypeOf(s);s&&n(s);for(var c=XMLHttpRequest.prototype;c&&!c.hasOwnProperty("addEventListener");)c=Object.getPrototypeOf(c);c&&n(c)}else XMLHttpRequest.prototype.hasOwnProperty("addEventListener")&&n(XMLHttpRequest.prototype);o.on("addEventListener-start",function(t){if(t[1]){var e=t[1];"function"==typeof e?this.wrapped=t[1]=a(e,"nr@wrapped",function(){return i(e,"fn-",null,e.name||"anonymous")}):"function"==typeof e.handleEvent&&i.inPlace(e,["handleEvent"],"fn-")}}),o.on("removeEventListener-start",function(t){var e=this.wrapped;e&&(t[1]=e)})},{1:18,2:19,ee:"QJf3ax",gos:"7eSDFh"}],5:[function(t,e){var n=(t(2),t("ee").create()),r=t(1)(n);e.exports=n,r.inPlace(window,["requestAnimationFrame","mozRequestAnimationFrame","webkitRequestAnimationFrame","msRequestAnimationFrame"],"raf-"),n.on("raf-start",function(t){t[0]=r(t[0],"fn-")})},{1:19,2:18,ee:"QJf3ax"}],6:[function(t,e){function n(t,e,n){var r=t[0];"string"==typeof r&&(r=new Function(r)),t[0]=o(r,"fn-",null,n)}var r=(t(2),t("ee").create()),o=t(1)(r);e.exports=r,o.inPlace(window,["setTimeout","setInterval","setImmediate"],"setTimer-"),r.on("setTimer-start",n)},{1:19,2:18,ee:"QJf3ax"}],7:[function(t,e){function n(){c.inPlace(this,d,"fn-")}function r(t,e){c.inPlace(e,["onreadystatechange"],"fn-")}function o(t,e){return e}var i=t("ee").create(),a=t(1),s=t(2),c=s(i),u=s(a),f=window.XMLHttpRequest,d=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"];e.exports=i,window.XMLHttpRequest=function(t){var e=new f(t);try{i.emit("new-xhr",[],e),u.inPlace(e,["addEventListener","removeEventListener"],"-",function(t,e){return e}),e.addEventListener("readystatechange",n,!1)}catch(r){try{i.emit("internal-error",[r])}catch(o){}}return e},window.XMLHttpRequest.prototype=f.prototype,c.inPlace(XMLHttpRequest.prototype,["open","send"],"-xhr-",o),i.on("send-xhr-start",r),i.on("open-xhr-start",r)},{1:4,2:19,ee:"QJf3ax"}],8:[function(t){function e(t){if("string"==typeof t&&t.length)return t.length;if("object"!=typeof t)return void 0;if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if("undefined"!=typeof FormData&&t instanceof FormData)return void 0;try{return JSON.stringify(t).length}catch(e){return void 0}}function n(t){var n=this.params,r=this.metrics;if(!this.ended){this.ended=!0;for(var i=0;c>i;i++)t.removeEventListener(s[i],this.listener,!1);if(!n.aborted){if(r.duration=(new Date).getTime()-this.startTime,4===t.readyState){n.status=t.status;var a=t.responseType,u="arraybuffer"===a||"blob"===a||"json"===a?t.response:t.responseText,f=e(u);if(f&&(r.rxSize=f),this.sameOrigin){var d=t.getResponseHeader("X-NewRelic-App-Data");d&&(n.cat=d.split(", ").pop())}}else n.status=0;r.cbTime=this.cbTime,o("xhr",[n,r,this.startTime])}}}function r(t,e){var n=i(e),r=t.params;r.host=n.hostname+":"+n.port,r.pathname=n.pathname,t.sameOrigin=n.sameOrigin}if(window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent)){t("loader").features.xhr=!0;var o=t("handle"),i=t(2),a=t("ee"),s=["load","error","abort","timeout"],c=s.length,u=t(1);t(4),t(3),a.on("new-xhr",function(){this.totalCbs=0,this.called=0,this.cbTime=0,this.end=n,this.ended=!1,this.xhrGuids={}}),a.on("open-xhr-start",function(t){this.params={method:t[0]},r(this,t[1]),this.metrics={}}),a.on("open-xhr-end",function(t,e){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&e.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),a.on("send-xhr-start",function(t,n){var r=this.metrics,o=t[0],i=this;if(r&&o){var u=e(o);u&&(r.txSize=u)}this.startTime=(new Date).getTime(),this.listener=function(t){try{"abort"===t.type&&(i.params.aborted=!0),("load"!==t.type||i.called===i.totalCbs&&(i.onloadCalled||"function"!=typeof n.onload))&&i.end(n)}catch(e){try{a.emit("internal-error",[e])}catch(r){}}};for(var f=0;c>f;f++)n.addEventListener(s[f],this.listener,!1)}),a.on("xhr-cb-time",function(t,e,n){this.cbTime+=t,e?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof n.onload||this.end(n)}),a.on("xhr-load-added",function(t,e){var n=""+u(t)+!!e;this.xhrGuids&&!this.xhrGuids[n]&&(this.xhrGuids[n]=!0,this.totalCbs+=1)}),a.on("xhr-load-removed",function(t,e){var n=""+u(t)+!!e;this.xhrGuids&&this.xhrGuids[n]&&(delete this.xhrGuids[n],this.totalCbs-=1)}),a.on("addEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-added",[t[1],t[2]],e)}),a.on("removeEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-removed",[t[1],t[2]],e)}),a.on("fn-start",function(t,e,n){e instanceof XMLHttpRequest&&("onload"===n&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=(new Date).getTime()))}),a.on("fn-end",function(t,e){this.xhrCbStart&&a.emit("xhr-cb-time",[(new Date).getTime()-this.xhrCbStart,this.onload,e],e)})}},{1:"XL7HBI",2:9,3:7,4:4,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],9:[function(t,e){e.exports=function(t){var e=document.createElement("a"),n=window.location,r={};e.href=t,r.port=e.port;var o=e.href.split("://");return!r.port&&o[1]&&(r.port=o[1].split("/")[0].split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=e.hostname||n.hostname,r.pathname=e.pathname,"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname),r.sameOrigin=!e.hostname||e.hostname===document.domain&&e.port===n.port&&e.protocol===n.protocol,r}},{}],gos:[function(t,e){e.exports=t("7eSDFh")},{}],"7eSDFh":[function(t,e){function n(t,e,n){if(r.call(t,e))return t[e];var o=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:o,writable:!0,enumerable:!1}),o}catch(i){}return t[e]=o,o}var r=Object.prototype.hasOwnProperty;e.exports=n},{}],D5DuLP:[function(t,e){function n(t,e,n){return r.listeners(t).length?r.emit(t,e,n):(o[t]||(o[t]=[]),void o[t].push(e))}var r=t("ee").create(),o={};e.exports=n,n.ee=r,r.q=o},{ee:"QJf3ax"}],handle:[function(t,e){e.exports=t("D5DuLP")},{}],XL7HBI:[function(t,e){function n(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:i(t,o,function(){return r++})}var r=1,o="nr@id",i=t("gos");e.exports=n},{gos:"7eSDFh"}],id:[function(t,e){e.exports=t("XL7HBI")},{}],loader:[function(t,e){e.exports=t("G9z0Bl")},{}],G9z0Bl:[function(t,e){function n(){var t=p.info=NREUM.info;if(t&&t.agent&&t.licenseKey&&t.applicationID&&c&&c.body){p.proto="https"===d.split(":")[0]||t.sslForHttp?"https://":"http://",a("mark",["onload",i()]);var e=c.createElement("script");e.src=p.proto+t.agent,c.body.appendChild(e)}}function r(){"complete"===c.readyState&&o()}function o(){a("mark",["domContent",i()])}function i(){return(new Date).getTime()}var a=t("handle"),s=window,c=s.document,u="addEventListener",f="attachEvent",d=(""+location).split("?")[0],p=e.exports={offset:i(),origin:d,features:{}};c[u]?(c[u]("DOMContentLoaded",o,!1),s[u]("load",n,!1)):(c[f]("onreadystatechange",r),s[f]("onload",n)),a("mark",["firstbyte",i()])},{handle:"D5DuLP"}],18:[function(t,e){function n(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,o=n-e||0,i=Array(0>o?0:o);++r<o;)i[r]=t[e+r];return i}e.exports=n},{}],19:[function(t,e){function n(t){return!(t&&"function"==typeof t&&t.apply&&!t[i])}var r=t("ee"),o=t(1),i="nr@wrapper",a=Object.prototype.hasOwnProperty;e.exports=function(t){function e(t,e,r,a){function nrWrapper(){var n,i,s,u;try{i=this,n=o(arguments),s=r&&r(n,i)||{}}catch(d){f([d,"",[n,i,a],s])}c(e+"start",[n,i,a],s);try{return u=t.apply(i,n)}catch(p){throw c(e+"err",[n,i,p],s),p}finally{c(e+"end",[n,i,u],s)}}return n(t)?t:(e||(e=""),nrWrapper[i]=!0,u(t,nrWrapper),nrWrapper)}function s(t,r,o,i){o||(o="");var a,s,c,u="-"===o.charAt(0);for(c=0;c<r.length;c++)s=r[c],a=t[s],n(a)||(t[s]=e(a,u?s+o:o,i,s,t))}function c(e,n,r){try{t.emit(e,n,r)}catch(o){f([o,e,n,r])}}function u(t,e){if(Object.defineProperty&&Object.keys)try{var n=Object.keys(t);return n.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(r){f([r])}for(var o in t)a.call(t,o)&&(e[o]=t[o]);return e}function f(e){try{t.emit("internal-error",e)}catch(n){}}return t||(t=r),e.inPlace=s,e.flag=i,e}},{1:18,ee:"QJf3ax"}]},{},["G9z0Bl",3,8]);</script></head>
<body class="production aui-page-sidebar aui-sidebar-expanded"
      data-base-url="https://bitbucket.org"
      data-no-avatar-image="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/img/default_avatar/16/user_blue.png"
      data-current-user="{&quot;isKbdShortcutsEnabled&quot;: true, &quot;isSshEnabled&quot;: false, &quot;isAuthenticated&quot;: false}"
      data-atlassian-id="{&quot;loginStatusUrl&quot;: &quot;https://id.atlassian.com/profile/rest/profile&quot;}"
      
      data-flag-upload-image="true"
      data-flag-pr-tasks="true"
       data-current-repo="{&quot;scm&quot;: &quot;git&quot;, &quot;readOnly&quot;: false, &quot;mainbranch&quot;: {&quot;name&quot;: &quot;4.1.x&quot;}, &quot;language&quot;: &quot;&quot;, &quot;creator&quot;: {&quot;username&quot;: &quot;dbazhenov&quot;}, &quot;owner&quot;: {&quot;username&quot;: &quot;cs-cart&quot;, &quot;isTeam&quot;: true}, &quot;fullslug&quot;: &quot;cs-cart/docs.cs-cart.ru&quot;, &quot;slug&quot;: &quot;docs.cs-cart.ru&quot;, &quot;id&quot;: 6513863, &quot;pygmentsLanguage&quot;: null}"
       data-current-cset="4967dd072e7182621ce79f60cde9e56a2637eff2"
      
      
      
      >

  <script type="text/javascript" src="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/compressed/js/9f0feb819aab.js"></script>


<div id="page">
  <div id="wrapper">
    
  


    <header id="header" role="banner" data-modules="header/tracking">
      
  
  


      <nav class="aui-header aui-dropdown2-trigger-group" role="navigation">
        <div class="aui-header-inner">
          <div class="aui-header-primary">
            
  

            
              <h1 class="aui-header-logo aui-header-logo-bitbucket logged-out" id="logo">
                <a href="/">
                  <span class="aui-header-logo-device">Bitbucket</span>
                </a>
              </h1>
            
            
  
<script id="repo-dropdown-template" type="text/html">
    

[[#hasViewed]]
  <div class="aui-dropdown2-section">
    <strong class="viewed">Recently viewed</strong>
    <ul class="aui-list-truncate">
      [[#viewed]]
        <li class="[[#is_private]]private[[/is_private]][[^is_private]]public[[/is_private]] repository">
          <a href="[[url]]" title="[[owner]]/[[name]]" class="aui-icon-container recently-viewed repo-link">
            <img class="repo-avatar size16" src="[[{avatar}]]" alt="[[owner]]/[[name]] avatar"/>
            [[owner]] / [[name]]
          </a>
        </li>
      [[/viewed]]
    </ul>
  </div>
[[/hasViewed]]
[[#hasUpdated]]
<div class="aui-dropdown2-section">
  <strong class="updated">Recently updated</strong>
  <ul class="aui-list-truncate">
    [[#updated]]
    <li class="[[#is_private]]private[[/is_private]][[^is_private]]public[[/is_private]] repository">
      <a href="[[url]]" title="[[owner]]/[[name]]" class="aui-icon-container recently-updated repo-link">
        <img class="repo-avatar size16" src="[[{avatar}]]" alt="[[owner]]/[[name]] avatar"/>
        [[owner]] / [[name]]
      </a>
    </li>
    [[/updated]]
  </ul>
</div>
[[/hasUpdated]]

  </script>
<ul class="aui-nav">
  
    <li>
      <a href="/features">
        Features
      </a>
    </li>
    <li>
      <a href="/plans">
          Pricing
      </a>
    </li>
  
</ul>

          </div>
          <div class="aui-header-secondary">
            
  

<ul role="menu" class="aui-nav">
  
  <li>
    <form action="/repo/all" method="get" class="aui-quicksearch">
      <label for="search-query" class="assistive">owner/repository</label>
      <input id="search-query" class="bb-repo-typeahead" type="text"
             placeholder="owner/repository" name="name" autocomplete="off"
             data-bb-typeahead-focus="false">
    </form>
  </li>
  <li>
    <a class="aui-dropdown2-trigger" id="help-dropdown-trigger"
       aria-controls="header-help-dropdown" aria-owns="header-help-dropdown"
       aria-haspopup="true" data-container="#header .aui-header-inner" href="#header-help-dropdown">
      <span class="aui-icon aui-icon-small aui-iconfont-help">Help</span><span class="aui-icon-dropdown"></span>
    </a>
    <nav id="header-help-dropdown" class="aui-dropdown2 aui-style-default aui-dropdown2-in-header" aria-hidden="true">
      <div class="aui-dropdown2-section">
        <ul>
          <li>
            <a href="/whats-new" id="features-link">
              Latest features
            </a>
          </li>
        </ul>
      </div>
      <div class="aui-dropdown2-section">
        <ul>
          <li>
            <a class="support-ga"
               data-support-gaq-page="DocumentationHome"
               href="https://confluence.atlassian.com/x/bgozDQ"
               target="_blank">
              Documentation
            </a>
          </li>
          <li>
            <a class="support-ga"
               data-support-gaq-page="Documentation101"
               href="https://confluence.atlassian.com/x/cgozDQ"
               target="_blank">
              Bitbucket 101
            </a>
          </li>
          <li>
            <a class="support-ga"
               data-support-gaq-page="GitTutorials"
               href="https://www.atlassian.com/git?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=help_dropdown&amp;utm_content=learn_git"
               target="_blank">
              Learn Git
            </a>
          </li>
          <li>
            <a class="support-ga"
               data-support-gaq-page="DocumentationKB"
               href="https://confluence.atlassian.com/x/2w4zDQ"
               target="_blank">
              Knowledge base
            </a>
          </li>
        </ul>
      </div>
      <div class="aui-dropdown2-section">
        <ul>
          <li>
            <a class="support-ga"
               data-support-gaq-page="Answers"
               href="https://answers.atlassian.com/tags/bitbucket/"
               target="_blank">
              Bitbucket on Atlassian Answers
            </a>
          </li>
          <li>
            <a class="support-ga"
               data-support-gaq-page="Home"
               href="/support">
            Support
          </a>
          </li>
        </ul>
      </div>
    </nav>
  </li>
    
      
        <li>
          <a class="aui-dropdown2-trigger" href="#header-language"
            aria-controls="header-language" aria-owns="header-language"
            aria-haspopup="true" data-container="#header .aui-header-inner">
            <span>English</span></a>
          <nav id="header-language" class="aui-dropdown2 aui-style-default aui-dropdown2-radio aui-dropdown2-in-header"
              aria-hidden="true">
            <form method="post" action="/account/language/setlang/"
                data-modules="i18n/header-language-form">
              <input type="hidden" name="language" value="">
              <ul>
              <li><a class="aui-dropdown2-radio interactive checked"
                    data-value="en" href="#en">English</a></li>
              
              <li><a class="aui-dropdown2-radio interactive "
                    data-value="ja" href="#ja">日本語</a></li>
              </ul>
            </form>
          </nav>
        </li>
      
    
  
      <li id="header-signup-button">
        <a id="sign-up-link" class="aui-button aui-button-primary aui-style" href="/account/signup/">
          Sign up
        </a>
      </li>
    <li id="user-options">
      
        
          <a href="/account/signin/?next=/cs-cart/docs.cs-cart.ru/src/4967dd072e7182621ce79f60cde9e56a2637eff2/developer/themes/top_panel_header/files/css/cart_content_before.tpl%3Fat%3D4.1.x" class="aui-nav-link login-link">Log in</a>
        
      
    </li>
  
</ul>

          </div>
        </div>
      </nav>
    </header>

    
  <header id="account-warning" role="banner" data-modules="header/account-warning"
        class="aui-message-banner warning
        ">
  <div class="aui-message-banner-inner">
    <span class="aui-icon aui-icon-warning"></span>
    <span class="message">
    
    </span>
  </div>
</header>

    
  
<header id="aui-message-bar" data-modules="disappearing-messages">
  
</header>


    <div id="content" role="main">
      
  

<div class="aui-sidebar repo-sidebar" data-modules="components/repo-sidebar"
     >
  <div class="aui-sidebar-wrapper">
    <div class="aui-sidebar-body">
      <header class="aui-page-header">
        <div class="aui-page-header-inner">
          <div class="aui-page-header-image">
            <a href="/cs-cart/docs.cs-cart.ru" id="repo-avatar-link" class="repo-link">
              <span class="aui-avatar aui-avatar-large aui-avatar-project">
                <span class="aui-avatar-inner">
                    <img src="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/img/language-avatars/default_64.png" alt="" data-modules="utils/retina">
                </span>
              </span>
            </a>
          </div>
          <div class="aui-page-header-main">
            <ol class="aui-nav aui-nav-breadcrumbs">
              <li>
                <a href="/cs-cart" id="repo-owner-link">cs-cart</a>
              </li>
            </ol>
            <h1>
              
              <a href="/cs-cart/docs.cs-cart.ru" title="docs.cs-cart.ru" class="entity-name">docs.cs-cart.ru</a>
            </h1>
          </div>
        </div>
      </header>
      <nav class="aui-navgroup aui-navgroup-vertical">
        <div class="aui-navgroup-inner">
          
            
              <div class="aui-sidebar-group aui-sidebar-group-actions repository-actions forks-enabled">
                <div class="aui-nav-heading">
                  <strong>Actions</strong>
                </div>
                  <ul id="repo-actions" class="aui-nav">
                    <li>
                      <a id="repo-clone-button" class="aui-nav-item"
                          href="#clone" data-modules="components/clone/clone-dialog">
                        <span class="aui-icon icon-clone"></span>
                        <span class="aui-nav-item-label">Clone</span>
                      </a>
                    </li>
                    
                    <li>
                      <a href="/cs-cart/docs.cs-cart.ru/branches/compare"
                         id="repo-compare-link" class="aui-nav-item">
                        <span class="aui-icon aui-icon-small aui-iconfont-devtools-compare"></span>
                        <span class="aui-nav-item-label">Compare</span>
                      </a>
                    </li>
                    
                      <li>
                        <a href="/cs-cart/docs.cs-cart.ru/fork"
                           id="repo-fork-link" class="aui-nav-item">
                          <span class="aui-icon icon-fork"></span>
                          <span class="aui-nav-item-label">Fork</span>
                        </a>
                      </li>
                    
                  </ul>
              </div>
            
          
          <div class="aui-sidebar-group aui-sidebar-group-tier-one repository-sections">
            <div class="aui-nav-heading">
              <strong>Navigation</strong>
            </div>
            <ul class="aui-nav">
              
                <li>
                  <a href="/cs-cart/docs.cs-cart.ru/overview" id="repo-overview-link" class="aui-nav-item">
                    <span class="aui-icon icon-overview"></span>
                    <span class="aui-nav-item-label">Overview</span>
                  </a>
                </li>
              
              
                <li class="aui-nav-selected">
                  <a href="/cs-cart/docs.cs-cart.ru/src" id="repo-source-link" class="aui-nav-item">
                    <span class="aui-icon icon-source"></span>
                    <span class="aui-nav-item-label">Source</span>
                  </a>
                </li>
              
              
                <li>
                  <a href="/cs-cart/docs.cs-cart.ru/commits" id="repo-commits-link" class="aui-nav-item">
                    <span class="aui-icon icon-commits"></span>
                    <span class="aui-nav-item-label">Commits</span>
                  </a>
                </li>
              
              
                <li>
                  <a href="/cs-cart/docs.cs-cart.ru/branches" id="repo-branches-link" class="aui-nav-item">
                    <span class="aui-icon icon-branches"></span>
                    <span class="aui-nav-item-label">Branches</span>
                  </a>
                </li>
              
              
                <li>
                  <a href="/cs-cart/docs.cs-cart.ru/pull-requests" id="repo-pullrequests-link" class="aui-nav-item">
                    
                      
                    
                    <span class="aui-icon icon-pull-requests"></span>
                    <span class="aui-nav-item-label">Pull requests</span>
                  </a>
                </li>
              
              
                
              
                <li id="issues-tab" class="
                  
                ">
                  <a href="/cs-cart/docs.cs-cart.ru/issues?status=new&amp;status=open" id="repo-issues-link" class="aui-nav-item">
                    
                      
                      <span class="aui-badge" title="2 active issues " id="issue-count">2</span>
                      
                    
                    <span class="aui-icon icon-issues"></span>
                    <span class="aui-nav-item-label">Issues</span>
                  </a>
                </li>
                <li id="wiki-tab" class="
                    
                      hidden
                    
                  ">
                  <a href="/cs-cart/docs.cs-cart.ru/wiki" id="repo-wiki-link" class="aui-nav-item">
                    <span class="aui-icon icon-wiki"></span>
                    <span class="aui-nav-item-label">Wiki</span>
                  </a>
                </li>
              
                <li>
                <a href="/cs-cart/docs.cs-cart.ru/downloads" id="repo-downloads-link" class="aui-nav-item">
                  
                    
                  
                  <span class="aui-icon icon-downloads"></span>
                  <span class="aui-nav-item-label">Downloads</span>
                </a>
                </li>
              
              
            </ul>
          </div>
          
          
            
              <div class="hidden kb-shortcut-actions">
                <a id="repo-create-issue" href="/cs-cart/docs.cs-cart.ru/issues/new"></a>
              </div>
            
          
        </div>
      </nav>
    </div>
    <div class="aui-sidebar-footer">
      <a class="aui-sidebar-toggle aui-sidebar-footer-tipsy aui-button aui-button-subtle"><span class="aui-icon"></span></a>
    </div>
  </div>
  
  

<div id="repo-clone-dialog" class="clone-dialog hidden">
  
<div class="clone-url" data-modules="components/clone/clone-url-dropdown">
  <div class="aui-buttons">
    <a href="https://bitbucket.org/cs-cart/docs.cs-cart.ru.git"
       class="aui-button aui-style aui-dropdown2-trigger" aria-haspopup="true"
       aria-owns="clone-url-dropdown-header">
      <span class="dropdown-text">HTTPS</span>
    </a>
    <div id="clone-url-dropdown-header" class="aui-dropdown2 aui-style-default">
      <ul class="aui-list-truncate">
        <li>
          <a href="https://bitbucket.org/cs-cart/docs.cs-cart.ru.git"
            
              data-command="git clone https://bitbucket.org/cs-cart/docs.cs-cart.ru.git"
            
            class="item-link https">HTTPS
          </a>
        </li>
        <li>
          <a href="ssh://git@bitbucket.org/cs-cart/docs.cs-cart.ru.git"
            
              data-command="git clone git@bitbucket.org:cs-cart/docs.cs-cart.ru.git"
            
            class="item-link ssh">SSH
          </a>
        </li>
      </ul>
    </div>
    <input type="text" readonly="readonly" class="clone-url-input"
           value="git clone https://bitbucket.org/cs-cart/docs.cs-cart.ru.git">
  </div>
  
  <p>Need help cloning? Visit
     <a href="https://confluence.atlassian.com/x/cgozDQ" target="_blank">Bitbucket 101</a>.</p>
  
</div>

  

<div class="sourcetree-callout clone-in-sourcetree"
     data-modules="components/clone/clone-in-sourcetree"
     data-https-url="https://bitbucket.org/cs-cart/docs.cs-cart.ru.git"
     data-ssh-url="ssh://git@bitbucket.org/cs-cart/docs.cs-cart.ru.git">

  <div>
    <button class="aui-button aui-style aui-button-primary">
      
        Clone in SourceTree
      
    </button>
  </div>

  <p class="windows-text">
      
        <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_win" target="_blank">Atlassian SourceTree</a>
        is a free Git and Mercurial client for Windows.
      
  </p>
  <p class="mac-text">
      
        <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_mac" target="_blank">Atlassian SourceTree</a>
        is a free Git and Mercurial client for Mac.
      
  </p>
</div>

</div>

</div>


      
  <div class="aui-page-panel">
    



    <div class="aui-page-panel-inner">
      <div id="repo-content" class="aui-page-panel-content">
        <div class="aui-group">
          <div class="aui-item section-title">
            <h1>Source</h1>
          </div>
          <div class="aui-item page-actions">
            
          </div>
        </div>
        
  <div id="source-container" class="maskable" data-modules="repo/source/index">
    



<header id="source-path">
  <div class="labels labels-csv">
    
      <div class="aui-buttons">
        <button data-branches-tags-url="/api/1.0/repositories/cs-cart/docs.cs-cart.ru/branches-tags"
                data-modules="components/branch-dialog"
                class="aui-button branch-dialog-trigger" title="4.1.x">
          
            
              <span class="aui-icon aui-icon-small aui-iconfont-devtools-branch">Branch</span>
            
            <span class="name">4.1.x</span>
          
          <span class="aui-icon-dropdown"></span>
        </button>
        <button class="aui-button" id="checkout-branch-button"
                title="Check out this branch">
          <span class="aui-icon aui-icon-small aui-iconfont-devtools-clone">Check out branch</span>
          <span class="aui-icon-dropdown"></span>
        </button>
      </div>
      <script id="branch-checkout-template" type="text/html">
  

<div id="checkout-branch-contents">
  <div class="command-line">
    <p>
      Check out this branch on your local machine to begin working on it.
    </p>
    <input type="text" class="checkout-command" readonly="readonly"
        
           value="git fetch && git checkout [[branchName]]"
        
        >
  </div>
  
    

<div class="sourcetree-callout clone-in-sourcetree"
     data-modules="components/clone/clone-in-sourcetree"
     data-https-url="https://bitbucket.org/cs-cart/docs.cs-cart.ru.git"
     data-ssh-url="ssh://git@bitbucket.org/cs-cart/docs.cs-cart.ru.git">

  <div>
    <button class="aui-button aui-style aui-button-primary">
      
        Check out in SourceTree
      
    </button>
  </div>

  <p class="windows-text">
      
        <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_win" target="_blank">Atlassian SourceTree</a>
        is a free Git and Mercurial client for Windows.
      
  </p>
  <p class="mac-text">
      
        <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_mac" target="_blank">Atlassian SourceTree</a>
        is a free Git and Mercurial client for Mac.
      
  </p>
</div>

  
</div>
</script>
    
  </div>
  <div class="secondary-actions">
    <div class="aui-buttons">
      
        <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=4.1.x"
           class="aui-button aui-style pjax-trigger" aria-pressed="true">
          Source
        </a>
        <a href="/cs-cart/docs.cs-cart.ru/diff/developer/themes/top_panel_header/files/css/cart_content_before.tpl?diff2=4967dd072e71&at=4.1.x"
           class="aui-button aui-style pjax-trigger"
           title="Diff to previous change">
          Diff
        </a>
        <a href="/cs-cart/docs.cs-cart.ru/history-node/4967dd072e71/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=4.1.x"
           class="aui-button aui-style pjax-trigger">
          History
        </a>
      
    </div>
  </div>
  <h1>
    
      
        <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71?at=4.1.x"
          class="pjax-trigger root" title="cs-cart/docs.cs-cart.ru at 4967dd072e71">docs.cs-cart.ru</a> /
      
      
        
          
            
              <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/?at=4.1.x"
                class="pjax-trigger directory-name">developer</a> /
            
          
        
      
        
          
            
              <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/themes/?at=4.1.x"
                class="pjax-trigger directory-name">themes</a> /
            
          
        
      
        
          
            
              <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/themes/top_panel_header/?at=4.1.x"
                class="pjax-trigger directory-name">top_panel_header</a> /
            
          
        
      
        
          
            
              <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/themes/top_panel_header/files/?at=4.1.x"
                class="pjax-trigger directory-name">files</a> /
            
          
        
      
        
          
            
              <a href="/cs-cart/docs.cs-cart.ru/src/4967dd072e71/developer/themes/top_panel_header/files/css/?at=4.1.x"
                class="pjax-trigger directory-name">css</a> /
            
          
        
      
        
          
            
              <span class="file-name">cart_content_before.tpl</span>
            
          
        
      
    
  </h1>
  
    
    
  
  <div class="clearfix"></div>
</header>


    
      
    

    <div id="editor-container" class="maskable"
         data-modules="repo/source/editor"
         data-owner="cs-cart"
         data-slug="docs.cs-cart.ru"
         data-is-writer="false"
         data-has-push-access="true"
         data-hash="4967dd072e7182621ce79f60cde9e56a2637eff2"
         data-branch="4.1.x"
         data-path="developer/themes/top_panel_header/files/css/cart_content_before.tpl"
         data-source-url="/api/1.0/repositories/cs-cart/docs.cs-cart.ru/src/4967dd072e7182621ce79f60cde9e56a2637eff2/developer/themes/top_panel_header/files/css/cart_content_before.tpl">
      <div id="source-view" class="file-source-container"
           data-modules="repo/source/view-file">
        <div class="toolbar">
          <div class="primary">
            <div class="aui-buttons">
              
                <button id="file-history-trigger" class="aui-button aui-style changeset-info"
                        data-changeset="4967dd072e7182621ce79f60cde9e56a2637eff2"
                        data-path="developer/themes/top_panel_header/files/css/cart_content_before.tpl"
                        data-current="4967dd072e7182621ce79f60cde9e56a2637eff2">
                  
                     

  <div class="aui-avatar aui-avatar-xsmall">
    <div class="aui-avatar-inner">
      <img src="https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2014/Mar/31/dbazhenov-avatar-4220059201-0_avatar.png">
    </div>
  </div>
  <span class="changeset-hash">4967dd0</span>
  <time datetime="2014-07-29T09:29:26+00:00" class="timestamp"></time>
  <span class="aui-icon-dropdown"></span>

                  
                </button>
              
            </div>
          <a href="/cs-cart/docs.cs-cart.ru/full-commit/4967dd072e71/developer/themes/top_panel_header/files/css/cart_content_before.tpl" id="full-commit-link"
              title="View full commit 4967dd0">Full commit</a>
          </div>
            <div class="secondary">
              <div class="aui-buttons">
                
                  <a href="/cs-cart/docs.cs-cart.ru/annotate/4967dd072e7182621ce79f60cde9e56a2637eff2/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=4.1.x"
                  class="aui-button aui-style pjax-trigger">Blame</a>
                
                
                  
                  <a id="embed-link" href="https://bitbucket.org/cs-cart/docs.cs-cart.ru/src/4967dd072e7182621ce79f60cde9e56a2637eff2/developer/themes/top_panel_header/files/css/cart_content_before.tpl?embed=t"
                    class="aui-button aui-style" data-modules="repo/source/embed">Embed</a>
                
                <a href="/cs-cart/docs.cs-cart.ru/raw/4967dd072e7182621ce79f60cde9e56a2637eff2/developer/themes/top_panel_header/files/css/cart_content_before.tpl"
                  class="aui-button aui-style">Raw</a>
              </div>
              
            </div>
          <div class="clearfix"></div>
        </div>

        
          
            


  <div class="file-source">
    <table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><a href="#cl-1"> 1</a>
<a href="#cl-2"> 2</a>
<a href="#cl-3"> 3</a>
<a href="#cl-4"> 4</a>
<a href="#cl-5"> 5</a>
<a href="#cl-6"> 6</a>
<a href="#cl-7"> 7</a>
<a href="#cl-8"> 8</a>
<a href="#cl-9"> 9</a>
<a href="#cl-10">10</a>
<a href="#cl-11">11</a>
<a href="#cl-12">12</a>
<a href="#cl-13">13</a>
<a href="#cl-14">14</a>
<a href="#cl-15">15</a></pre></div></td><td class="code"><div class="highlight"><pre><a name="cl-1"></a><span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">&quot;sw_dropdown_</span><span class="cp">{</span><span class="nv">$dropdown_id</span><span class="cp">}</span><span class="s">&quot;</span> <span class="na">class=</span><span class="s">&quot;ty-dropdown-box__title cm-combination&quot;</span><span class="nt">&gt;</span>
<a name="cl-2"></a>    <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">&quot;</span><span class="cp">{</span><span class="s2">&quot;checkout.cart&quot;</span><span class="o">|</span><span class="na">fn_url</span><span class="cp">}</span><span class="s">&quot;</span><span class="nt">&gt;</span>
<a name="cl-3"></a>        <span class="cp">{</span><span class="nf">hook</span> <span class="na">name</span><span class="o">=</span><span class="s2">&quot;checkout:dropdown_title&quot;</span><span class="cp">}</span>
<a name="cl-4"></a>            <span class="cp">{</span><span class="nf">if</span> <span class="nv">$smarty.session.cart.amount</span><span class="cp">}</span>
<a name="cl-5"></a>                <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">&quot;ty-minicart__icon ty-icon-basket filled&quot;</span><span class="nt">&gt;&lt;/i&gt;</span>
<a name="cl-6"></a>                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">&quot;ty-minicart-title ty-hand&quot;</span><span class="nt">&gt;</span><span class="cp">{</span><span class="nv">$smarty.session.cart.amount</span><span class="cp">}</span><span class="ni">&amp;nbsp;</span><span class="cp">{</span><span class="nf">__</span><span class="o">(</span><span class="s2">&quot;items&quot;</span><span class="o">)</span><span class="cp">}</span> <span class="cp">{</span><span class="nf">__</span><span class="o">(</span><span class="s2">&quot;for&quot;</span><span class="o">)</span><span class="cp">}</span><span class="ni">&amp;nbsp;</span><span class="cp">{</span><span class="nf">include</span> <span class="na">file</span><span class="o">=</span><span class="s2">&quot;common/price.tpl&quot;</span> <span class="na">value</span><span class="o">=</span><span class="nv">$smarty.session.cart.display_subtotal</span><span class="cp">}</span><span class="nt">&lt;/span&gt;</span>
<a name="cl-7"></a>                <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">&quot;ty-icon-down-micro&quot;</span><span class="nt">&gt;&lt;/i&gt;</span>
<a name="cl-8"></a>            <span class="cp">{</span><span class="nf">else</span><span class="cp">}</span>
<a name="cl-9"></a>                <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">&quot;ty-minicart__icon ty-icon-basket empty&quot;</span><span class="nt">&gt;&lt;/i&gt;</span>
<a name="cl-10"></a>                <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">&quot;ty-minicart-title empty-cart ty-hand&quot;</span><span class="nt">&gt;</span><span class="cp">{</span><span class="nf">__</span><span class="o">(</span><span class="s2">&quot;cart_is_empty&quot;</span><span class="o">)</span><span class="cp">}</span><span class="nt">&lt;/span&gt;</span>
<a name="cl-11"></a>                <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">&quot;ty-icon-down-micro&quot;</span><span class="nt">&gt;&lt;/i&gt;</span>
<a name="cl-12"></a>            <span class="cp">{</span><span class="nf">/if</span><span class="cp">}</span>
<a name="cl-13"></a>        <span class="cp">{</span><span class="nf">/hook</span><span class="cp">}</span>
<a name="cl-14"></a>    <span class="nt">&lt;/a&gt;</span>
<a name="cl-15"></a><span class="nt">&lt;/div&gt;</span>
</pre></div>
</td></tr></table>
  </div>


          
        
      </div>
    </div>




  
  
    <script id="branch-dialog-template" type="text/html">
  

<div class="tabbed-filter-widget branch-dialog">
  <div class="tabbed-filter">
    <input placeholder="Filter branches" class="filter-box" autosave="branch-dropdown-6513863" type="text">
    [[^ignoreTags]]
      <div class="aui-tabs horizontal-tabs aui-tabs-disabled filter-tabs">
        <ul class="tabs-menu">
          <li class="menu-item active-tab"><a href="#branches">Branches</a></li>
          <li class="menu-item"><a href="#tags">Tags</a></li>
        </ul>
      </div>
    [[/ignoreTags]]
  </div>
  
    <div class="tab-pane active-pane" id="branches" data-filter-placeholder="Filter branches">
      <ol class="filter-list">
        <li class="empty-msg">No matching branches</li>
        [[#branches]]
          
            [[#hasMultipleHeads]]
              [[#heads]]
                <li class="comprev filter-item">
                  <a class="pjax-trigger" href="/cs-cart/docs.cs-cart.ru/src/[[changeset]]/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=[[safeName]]"
                     title="[[name]]">
                    [[name]] ([[shortChangeset]])
                  </a>
                </li>
              [[/heads]]
            [[/hasMultipleHeads]]
            [[^hasMultipleHeads]]
              <li class="comprev filter-item">
                <a class="pjax-trigger" href="/cs-cart/docs.cs-cart.ru/src/[[changeset]]/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=[[safeName]]" title="[[name]]">
                  [[name]]
                </a>
              </li>
            [[/hasMultipleHeads]]
          
        [[/branches]]
      </ol>
    </div>
    <div class="tab-pane" id="tags" data-filter-placeholder="Filter tags">
      <ol class="filter-list">
        <li class="empty-msg">No matching tags</li>
        [[#tags]]
          <li class="comprev filter-item">
            <a class="pjax-trigger" href="/cs-cart/docs.cs-cart.ru/src/[[changeset]]/developer/themes/top_panel_header/files/css/cart_content_before.tpl?at=[[safeName]]" title="[[name]]">
              [[name]]
            </a>
          </li>
        [[/tags]]
      </ol>
    </div>
  
</div>

</script>
  



  </div>

        

<form id="file-search-form" action="#"
  
  data-revision="4967dd072e7182621ce79f60cde9e56a2637eff2"
  data-branch="4.1.x">
  <input type="text" id="file-search-query" class="loading">
  <div id="filtered-files"></div>
  <div class="tip"><em>Tip:</em> Filter by directory path e.g. <strong>/media app.js</strong> to search for public<strong>/media/app.js</strong>.</div>
  <div class="tip"><em>Tip:</em> Use camelCasing e.g. <strong>ProjME</strong> to search for <strong>ProjectModifiedE</strong>vent.java.</div>
  <div class="tip"><em>Tip:</em> Filter by extension type e.g. <strong>/repo .js</strong> to search for all <strong>.js</strong> files in the <strong>/repo</strong> directory.</div>
  <div class="tip"><em>Tip:</em> Separate your search with spaces e.g. <strong>/ssh pom.xml</strong> to search for src<strong>/ssh/pom.xml</strong>.</div>
  <div class="tip"><em>Tip:</em> Use ↑ and ↓ arrow keys to navigate and <strong>return</strong> to view the file.</div>
  <div class="tip mod-osx"><em>Tip:</em> You can also navigate files with <strong>Ctrl+j</strong> <em>(next)</em> and <strong>Ctrl+k</strong> <em>(previous)</em> and view the file with <strong>Ctrl+o</strong>.</div>
  <div class="tip mod-win"><em>Tip:</em> You can also navigate files with <strong>Alt+j</strong> <em>(next)</em> and <strong>Alt+k</strong> <em>(previous)</em> and view the file with <strong>Alt+o</strong>.</div>
  <script id="filtered-files-template" type="text/html">
  

<table class="aui aui-table-interactive bb-list">
  <thead>
    <tr class="assistive">
      <th class="name">Filename</th>
    </tr>
  </thead>
  <tbody>
    [[#files]]
    <tr class="iterable-item">
      <td class="name [[#isDirectory]]directory[[/isDirectory]]">
        <span class="aui-icon aui-icon-small[[#isDirectory]] aui-iconfont-devtools-folder-closed[[/isDirectory]][[^isDirectory]] aui-iconfont-devtools-file[[/isDirectory]]"></span>
        <a href="/cs-cart/docs.cs-cart.ru/src/[[node]]/[[name]][[#branch]][[#isDirectory]]/[[/isDirectory]]?at=[[branch]][[/branch]]"
           title="[[name]]" class="execute" tabindex="-1">
          [[&highlightedName]]
        </a>
      </td>
    </tr>
    [[/files]]
  </tbody>
</table>

</script>
</form>

        
          
          
          
        
      </div>
    </div>
  </div>

    </div>
  </div>

  <footer id="footer" role="contentinfo" data-modules="components/footer">
    <section class="footer-body">
      
  <ul>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="Blog"
       href="http://blog.bitbucket.org">Blog</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="Home"
       href="/support">Support</a>
  </li>
  <li>
    <a class="support-ga"
       data-support-gaq-page="PlansPricing"
       href="/plans">Plans &amp; pricing</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="DocumentationHome"
       href="//confluence.atlassian.com/display/BITBUCKET">Documentation</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="DocumentationAPI"
       href="//confluence.atlassian.com/x/IYBGDQ">API</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="SiteStatus"
       href="http://status.bitbucket.org/">Server status</a>
  </li>
  <li>
    <a class="support-ga" id="meta-info"
       data-support-gaq-page="MetaInfo"
       href="#">Version info</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="EndUserAgreement"
       href="//www.atlassian.com/end-user-agreement?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=footer">Terms of service</a>
  </li>
  <li>
    <a class="support-ga" target="_blank"
       data-support-gaq-page="PrivacyPolicy"
       href="//www.atlassian.com/company/privacy?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=footer">Privacy policy</a>
  </li>
</ul>
<div id="meta-info-content" style="display: none;">
  <ul>
    
      
        <li>English</li>
      
    
    <li>
      <a class="support-ga" target="_blank"
         data-support-gaq-page="GitDocumentation"
         href="http://git-scm.com/">Git 2.1.1</a>
    </li>
    <li>
      <a class="support-ga" target="_blank"
         data-support-gaq-page="HgDocumentation"
         href="http://mercurial.selenic.com/">Mercurial 2.9</a>
    </li>
    <li>
      <a class="support-ga" target="_blank"
         data-support-gaq-page="DjangoDocumentation"
         href="https://www.djangoproject.com/">Django 1.6.5</a>
    </li>
    <li>
      <a class="support-ga" target="_blank"
         data-support-gaq-page="PythonDocumentation"
         href="http://www.python.org/">Python 2.7.3</a>
    </li>
    <li>
      <a class="support-ga" target="_blank"
         data-support-gaq-page="DeployedVersion"
         href="#">9275c3e51c9a / 5f43bd71022b @ app19</a>
    </li>
  </ul>
</div>
<ul class="atlassian-links">
  <li>
    <a id="atlassian-jira-link" target="_blank"
       title="Track everything – bugs, tasks, deadlines, code – and pull reports to stay informed."
       href="http://www.atlassian.com/software/jira?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">JIRA</a>
  </li>
  <li>
    <a id="atlassian-confluence-link" target="_blank"
       title="Content Creation, Collaboration & Knowledge Sharing for Teams."
       href="http://www.atlassian.com/software/confluence/overview/team-collaboration-software?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">Confluence</a>
  </li>
  <li>
    <a id="atlassian-bamboo-link" target="_blank"
       title="Continuous integration and deployment, release management."
       href="http://www.atlassian.com/software/bamboo/overview?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">Bamboo</a>
  </li>
  <li>
    <a id="atlassian-stash-link" target="_blank"
       title="Git repo management, behind your firewall and Enterprise-ready."
       href="http://www.atlassian.com/software/stash?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">Stash</a>
  </li>
  <li>
    <a id="atlassian-sourcetree-link" target="_blank"
       title="A free Git and Mercurial desktop client for Mac or Windows."
       href="http://www.sourcetreeapp.com/?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">SourceTree</a>
  </li>
  <li>
    <a id="atlassian-hipchat-link" target="_blank"
       title="Group chat and IM built for teams."
       href="http://www.hipchat.com/?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=bitbucket_footer">HipChat</a>
  </li>
</ul>
<div id="footer-logo">
  <a target="_blank"
     title="Bitbucket is developed by Atlassian in San Francisco."
     href="http://www.atlassian.com?utm_source=bitbucket&amp;utm_medium=logo&amp;utm_campaign=bitbucket_footer">Atlassian</a>
</div>



<div data-modules="components/mentions/index">
  <script id="mention-result" type="text/html">
    
<div class="aui-avatar aui-avatar-small">
  <div class="aui-avatar-inner">
    <img src="[[avatar_url]]">
  </div>
</div>
[[#display_name]]
  <span class="display-name">[[&display_name]]</span> <small class="username">[[&username]]</small>
[[/display_name]]
[[^display_name]]
  <span class="username">[[&username]]</span>
[[/display_name]]
[[#is_teammate]][[^is_team]]
  <span class="aui-lozenge aui-lozenge-complete aui-lozenge-subtle">teammate</span>
[[/is_team]][[/is_teammate]]

  </script>
  <script id="mention-call-to-action" type="text/html">
    
[[^query]]
<li class="bb-typeahead-item">Begin typing to search for a user</li>
[[/query]]
[[#query]]
<li class="bb-typeahead-item">Continue typing to search for a user</li>
[[/query]]

  </script>
  <script id="mention-no-results" type="text/html">
    
[[^searching]]
<li class="bb-typeahead-item">Found no matching users for <em>[[query]]</em>.</li>
[[/searching]]
[[#searching]]
<li class="bb-typeahead-item bb-typeahead-searching">Searching for <em>[[query]]</em>.</li>
[[/searching]]

  </script>
</div>

<div data-modules="components/repo-typeahead/index">
  <script id="repo-typeahead-result" type="text/html">
    <span class="aui-avatar aui-avatar-project aui-avatar-xsmall">
  <span class="aui-avatar-inner">
    <img src="[[avatar]]">
  </span>
</span>
<span class="owner">[[&owner]]</span>/<span class="slug">[[&slug]]</span>

  </script>
</div>
<script id="share-form-template" type="text/html">
    

<div class="error aui-message hidden">
  <span class="aui-icon icon-error"></span>
  <div class="message"></div>
</div>
<form class="aui">
  <table class="widget bb-list aui">
    <thead>
    <tr class="assistive">
      <th class="user">User</th>
      <th class="role">Role</th>
      <th class="actions">Actions</th>
    </tr>
    </thead>
    <tbody>
      <tr class="form">
        <td colspan="2">
          <input type="text" class="text bb-user-typeahead user-or-email"
                 placeholder="Username or email address"
                 autocomplete="off"
                 data-bb-typeahead-focus="false"
                 [[#disabled]]disabled[[/disabled]]>
        </td>
        <td class="actions">
          <button type="submit" class="aui-button aui-style" disabled>Add</button>
        </td>
      </tr>
    </tbody>
  </table>
</form>

  </script>
<script id="share-detail-template" type="text/html">
    

[[#username]]
<td class="user
           [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]"
    [[#error]]data-error="[[error]]"[[/error]]>
  <div title="[[displayName]]">
    <a href="/[[username]]" class="user">
      <img class="avatar avatar16" src="[[avatar]]" />
      <span>[[displayName]]</span>
    </a>
  </div>
</td>
[[/username]]
[[^username]]
<td class="email
           [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]"
    [[#error]]data-error="[[error]]"[[/error]]>
  <div title="[[email]]">
    <span class="aui-icon aui-icon-small aui-iconfont-email"></span>
    [[email]]
  </div>
</td>
[[/username]]
<td class="role
           [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]">
  <div>
    [[#group]]
      [[#hasCustomGroups]]
        <select class="group [[#noGroupChoices]]hidden[[/noGroupChoices]]">
          [[#groups]]
            <option value="[[slug]]"
                    [[#isSelected]]selected[[/isSelected]]>
              [[name]]
            </option>
          [[/groups]]
        </select>
      [[/hasCustomGroups]]
      [[^hasCustomGroups]]
      <label>
        <input type="checkbox" class="admin"
               [[#isAdmin]]checked[[/isAdmin]]>
        Administrator
      </label>
      [[/hasCustomGroups]]
    [[/group]]
    [[^group]]
      <ul>
        <li class="permission aui-lozenge aui-lozenge-complete
                   [[^read]]aui-lozenge-subtle[[/read]]"
            data-permission="read">
          read
        </li>
        <li class="permission aui-lozenge aui-lozenge-complete
                   [[^write]]aui-lozenge-subtle[[/write]]"
            data-permission="write">
          write
        </li>
        <li class="permission aui-lozenge aui-lozenge-complete
                   [[^admin]]aui-lozenge-subtle[[/admin]]"
            data-permission="admin">
          admin
        </li>
      </ul>
    [[/group]]
  </div>
</td>
<td class="actions
           [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]">
  <div>
    <a href="#" class="delete">
      <span class="aui-icon aui-icon-small aui-iconfont-remove">Delete</span>
    </a>
  </div>
</td>

  </script>
<script id="share-team-template" type="text/html">
    

<div class="clearfix">
  <span class="team-avatar-container">
    <img src="[[avatar]]" alt="[[display_name]]" title="[[display_name]]" class="avatar avatar32" />
  </span>
  <span class="team-name-container">
    [[display_name]]
  </span>
</div>
<p class="helptext">
  
    Existing users are granted access to this team immediately.
    New users will be sent an invitation.
  
</p>
<div class="share-form"></div>

  </script>

    </section>
  </footer>
</div>

<script src="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/jsi18n/en/djangojs.js"></script>

  
  <script id="require-js"
          src="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/amd/build/main.js"
          data-main="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/amd/build/main"
          data-page-module="repo/index"></script>




<script>
  (function () {
    var ga = document.createElement('script');
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    ga.setAttribute('async', 'true');
    document.documentElement.firstChild.appendChild(ga);
  }());
</script>


  

<script id="source-changeset" type="text/html">
  

<a href="/cs-cart/docs.cs-cart.ru/src/[[raw_node]]/[[path]]?at=4.1.x"
   class="[[#selected]]highlight[[/selected]]"
   data-hash="[[node]]">
  [[#author.username]]
    <img class="avatar avatar16" src="[[author.avatar]]"/>
    <span class="author" title="[[raw_author]]">[[author.display_name]]</span>
  [[/author.username]]
  [[^author.username]]
    <img class="avatar avatar16" src="https://d3oaxc4q5k2d6q.cloudfront.net/m/5f43bd71022b/img/default_avatar/16/user_blue.png"/>
    <span class="author unmapped" title="[[raw_author]]">[[author]]</span>
  [[/author.username]]
  <time datetime="[[utctimestamp]]" data-title="true">[[utctimestamp]]</time>
  <span class="message">[[message]]</span>
</a>

</script>
<script id="embed-template" type="text/html">
  

<form class="aui embed">
  <label for="embed-code">Embed this source in another page:</label>
  <input type="text" readonly="true" value="&lt;script src=&quot;[[url]]&quot;&gt;&lt;/script&gt;" id="embed-code">
</form>

</script>
<script id="edit-form-template" type="text/html">
  


<form class="edit-form aui"
      data-repository="[[owner]]/[[slug]]"
      data-destination-repository="[[destinationOwner]]/[[destinationSlug]]"
      data-local-id="[[localID]]"
      data-is-writer="[[#isWriter]]true[[/isWriter]][[^isWriter]]false[[/isWriter]]"
      data-has-push-access="[[#hasPushAccess]]true[[/hasPushAccess]][[^hasPushAccess]]false[[/hasPushAccess]]"
      data-is-pull-request="[[#isPullRequest]]true[[/isPullRequest]][[^isPullRequest]]false[[/isPullRequest]]"
      data-hash="[[hash]]"
      data-branch="[[branch]]"
      data-path="[[path]]"
      data-is-create="[[isCreate]]"
      data-preview-url="/xhr/[[owner]]/[[slug]]/preview/[[hash]]/[[encodedPath]]"
      data-preview-error="We had trouble generating your preview."
      data-unsaved-changes-error="Your changes will be lost. Are you sure you want to leave?">
  <div class="toolbar clearfix">
    <div class="primary">
      <h2>
        [[#isCreate]]
          
            Creating <span class="edit-path">[[path]]</span> on branch: <strong>[[branch]]</strong>
          
        [[/isCreate]]
        [[^isCreate]]
          
            Editing <span class="edit-path">[[path]]</span> on branch: <strong>[[branch]]</strong>
          
        [[/isCreate]]
      </h2>
    </div>
    <div class="secondary">
      <div class="hunk-nav aui-buttons">
        <button class="prev-hunk-button aui-button aui-button aui-style"
              disabled="disabled" aria-disabled="true" title="previous change">&#x25B2;</button>
        <button class="next-hunk-button aui-button aui-button aui-style"
              disabled="disabled" aria-disabled="true" title="next change">&#x25BC;</button>
      </div>
    </div>
  </div>
  <div class="file-editor">
    <textarea id="id_source"></textarea>
  </div>
  <div class="preview-pane"></div>
  <div class="toolbar footer-toolbar clearfix">
    <div class="primary">
      <div id="syntax-mode" class="field">
        <label for="id_syntax-mode">Syntax mode:</label>
        <select id="id_syntax-mode">
          [[#syntaxes]]
            <option value="[[#mime]][[mime]][[/mime]][[^mime]][[mode]][[/mime]]">[[label]]</option>
          [[/syntaxes]]
        </select>
      </div>
      <div id="indent-mode" class="field">
        <label for="id_indent-mode">Indent mode:</label>
        <select id="id_indent-mode">
          <option value="tabs">Tabs</option>
          <option value="spaces">Spaces</option>
        </select>
      </div>
      <div id="indent-size" class="field">
        <label for="id_indent-size">Indent size:</label>
        <select id="id_indent-size">
          <option value="2">2</option>
          <option value="4">4</option>
          <option value="8">8</option>
        </select>
      </div>
    </div>
    <div class="secondary">
      [[^isCreate]]
        <button class="preview-button aui-button aui-style"
                disabled="disabled" aria-disabled="true"
                data-preview-label="View diff"
                data-edit-label="Edit file">View diff</button>
      [[/isCreate]]
      <button class="save-button aui-button aui-button-primary aui-style"
              disabled="disabled" aria-disabled="true">Commit</button>
      [[^isCreate]]
        <a class="cancel-link" href="#">Cancel</a>
      [[/isCreate]]
    </div>
  </div>
</form>

</script>
<script id="commit-form-template" type="text/html">
  

<form class="aui commit-form"
      data-title="Commit changes"
      [[#isDelete]]
        data-default-message="[[filename]] deleted online with Bitbucket"
      [[/isDelete]]
      [[#isCreate]]
        data-default-message="[[filename]] created online with Bitbucket"
      [[/isCreate]]
      [[^isDelete]]
        [[^isCreate]]
          data-default-message="[[filename]] edited online with Bitbucket"
        [[/isCreate]]
      [[/isDelete]]
      data-fork-error="We had trouble creating your fork."
      data-commit-error="We had trouble committing your changes."
      data-pull-request-error="We had trouble creating your pull request."
      data-update-error="We had trouble updating your pull request."
      data-branch-conflict-error="A branch with that name already exists."
      data-forking-message="Forking repository"
      data-committing-message="Committing changes"
      data-merging-message="Branching and merging changes"
      data-creating-pr-message="Creating pull request"
      data-updating-pr-message="Updating pull request"
      data-cta-label="Commit"
      data-cancel-label="Cancel">
  [[#isDelete]]
    <div class="aui-message info">
      <span class="aui-icon icon-info"></span>
      <span class="message">
        
          Committing this change will delete [[filename]] from your repository.
        
      </span>
    </div>
  [[/isDelete]]
  <div class="aui-message error hidden">
    <span class="aui-icon icon-error"></span>
    <span class="message"></span>
  </div>
  [[^isWriter]]
    <div class="aui-message info">
      <span class="aui-icon icon-info"></span>
      <p class="title">
        
          You don't have write access to this repository.
        
      </p>
      <span class="message">
        
          We'll create a fork for your changes and submit a
          pull request back to this repository.
        
      </span>
    </div>
  [[/isWriter]]
  [[#isRename]]
    <div class="field-group">
      <label for="id_path">New path</label>
      <input type="text" id="id_path" class="text" value="[[path]]"/>
    </div>
  [[/isRename]]
  <div class="field-group">
    <label for="id_message">Commit message</label>
    <textarea id="id_message" class="long-field textarea"></textarea>
  </div>
  [[^isPullRequest]]
    [[#isWriter]]
      <fieldset class="group">
        <div class="checkbox">
          [[#hasPushAccess]]
            <input id="id_create-pullrequest" class="checkbox" type="checkbox">
            <label for="id_create-pullrequest">Create a pull request for this change</label>
          [[/hasPushAccess]]
          [[^hasPushAccess]]
            <input id="id_create-pullrequest" class="checkbox" type="checkbox" checked="checked" aria-disabled="true" disabled="true">
            <label for="id_create-pullrequest" title="Branch restrictions do not allow you to update this branch.">Create a pull request for this change</label>
          [[/hasPushAccess]]

        </div>
      </fieldset>
      <div id="pr-fields">
        <div id="branch-name-group" class="field-group">
          <label for="id_branch-name">Branch name</label>
          <input type="text" id="id_branch-name" class="text long-field">
        </div>
        <div id="reviewers-group" class="field-group"
              data-api-url="/cs-cart/docs.cs-cart.ru/pull-request/xhr/reviewer/cs-cart/docs.cs-cart.ru/:reviewer_name">
          <label for="participants">Reviewers</label>
          <select id="participants" class="long-field" name="reviewers" multiple></select>
          <div class="error"></div>
          
        </div>
      </div>
    [[/isWriter]]
  [[/isPullRequest]]
  <button type="submit" id="id_submit">Commit</button>
</form>

</script>
<script id="merge-message-template" type="text/html">
  Merged [[hash]] into [[branch]]

[[message]]

</script>
<script id="commit-merge-error-template" type="text/html">
  



  We had trouble merging your changes. We stored them on the <strong>[[branch]]</strong> branch, so feel free to
  <a href="/[[owner]]/[[slug]]/full-commit/[[hash]]/[[path]]?at=[[encodedBranch]]">view them</a> or
  <a href="#" class="create-pull-request-link">create a pull request</a>.


</script>






  

<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"beacon-4.newrelic.com","queueTime":0,"licenseKey":"a2cef8c3d3","agent":"js-agent.newrelic.com/nr-476.min.js","transactionName":"Z11RZxdWW0cEVkYLDV4XdUYLVEFdClsdAAtEWkZQDlJBGgRFQhFMQl1DXFcZQ10AQkFYBFlUVlEXWEJHAA==","userAttributes":"SxpaQDpWQEANUFwWC1NZR1YBFQ9SBFlBB04SUUBsBEdcFl9TUw4RVRQRRhZSR2sLVF8HQAoacl0KWUxZCkBBQB8=","applicationID":"1841284","errorBeacon":"bam.nr-data.net","applicationTime":116}</script></body>
</html>
