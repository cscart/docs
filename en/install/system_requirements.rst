***************************
CS-Cart System Requirements
***************************

Web Server Environment
======================
CS-Cart is developed to meet most server configurations, ranging from shared hosting accounts to dedicated servers. 

There are two core requirements for your host to run CS-Cart:

* `PHP <http://www.php.net/>`_ version 5.3, 5.4, 5.5, or 5.6 (we recommend **version 5.6 for CS-Cart and Multi-Vendor 4.3.x**)

* `MySQL <http://www.mysql.com/>`_ version 4.1 or higher (MySQLi or pdo_mysql should be supported)

.. note::

    CS-Cart is compatible with almost every server that supports PHP and MySQL. However, we recommend **Apache** or **Nginx** as the most robust and stable servers for your web store.

We recommend a **Unix-like operating system** for your server, such as FreeBSD, Linux, or OS X. These systems are scalable, more secure, and offer better performance.

Server Configuration Requirements
=================================

* **safe_mode** PHP directive should be disabled
* **file_uploads, allow_url_fopen** PHP directives should be enabled
* **magic_quotes_gpc, magic_quotes_runtime, magic_quotes_sybase** PHP directives should be disabled in PHP 5.3 (ignore this if you have PHP 5.4 or higher)
* the following PHP commands should be **enabled**: ini_set, ftp_exec, ftp_connect, ftp_login, ftp_get, ftp_put, ftp_nb_fput, ftp_raw, ftp_rawlist, mysql_pconnect, eva, system, exec, shell_exec, passthru, escapeshellarg, set_time_limit
* **GD library** or **Imagick library** should be installed. Please make sure your GD configuration includes the **FreeType** font library.
* **cURL support** should be enabled. You need this PHP extension to ensure support of secure connections, some payment systems such as PayPal and Authorize.Net, and real-time shipping rate calculators for FedEx and DHL/Airborne.
* **Phar extension** should be enabled (built into PHP since v5.3.0)
* **ZipArchive extension** should be enabled (built into PHP since v5.2.0)
* **.htaccess** file (if supported) should have the following directives allowed: DirectoryIndex, Deny, Allow, Options, Order, AddHandler, RewriteEngine, RewriteBase, RewriteCond, and RewriteRule

CS-Cart Architects Team Recommends This
=======================================

* use a **virtual** or **dedicated** private server instead of a shared hosting; this allows for smoother upgrades 
* install and enable **Openssl** PHP extension to generate more secure session keys
* install **Redis** or **APCu** and set it as a CS-Cart cache backend
* install **OPcache**
* install the **mod_deflate** Apache mod

Compatible Hosting Providers
============================
As you can see, the requirements for the web server environment are quite typical. Thousands of hosting providers meet them. But if you can’t decide on the hosting for your web store, please consider a compatible hosting provider from our `Compatible Hosting <http://www.cs-cart.com/compatible-hosting.html>`_ list.
