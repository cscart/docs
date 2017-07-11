***************************
CS-Cart System Requirements
***************************

======================
Web Server Environment
======================

CS-Cart is developed to meet most server configurations, ranging from shared hosting accounts to dedicated servers. 

There are two core requirements for your host to run CS-Cart:

* `PHP <http://www.php.net/>`_ version 5.3.6, 5.4, 5.5, 5.6, or 7. CS-Cart supports SAPI mod_php, FPM, FastCGI. We recommend PHP 5.6 for CS-Cart/Multi-Vendor 4.3.x. 

  .. note::

      PHP 7.0 is supported and recommended only starting with CS-Cart/Multi-Vendor 4.3.6. 

* `MySQL <http://www.mysql.com/>`_ version 4.1 or higher (**MySQLi** or **pdo_mysql** should be supported). CS-Cart also supports MariaDB 5.5 or higher, and PerconaServer 5.5 or higher.

We recommend a **Unix-like operating system** for your server, such as FreeBSD, Linux, or OS X. These systems are scalable, more secure, and offer better performance.

.. note::

    CS-Cart is compatible with almost every server that supports PHP and MySQL. However, we recommend **Apache** or **Nginx** as the most robust and stable servers for your web store.

=================================
Server Configuration Requirements
=================================

* **SELinux** and **AppArmor** should be disabled (on Linux servers).

* **safe_mode** PHP directive should be disabled.

* **file_uploads, allow_url_fopen** PHP directives should be enabled.

* **magic_quotes_gpc, magic_quotes_runtime, magic_quotes_sybase** PHP directives should be disabled in PHP 5.3 (ignore this if you have PHP 5.4 or higher).

* The following PHP commands should be enabled:

  .. list-table::
    :widths: 10 10 10 10 10

    *   -   ``ini_set`` 
        -   ``ftp_exec``
        -   ``ftp_connect``
        -   ``ftp_login``
        -   ``ftp_get``
    *   -   ``ftp_put``
        -   ``ftp_nb_fput``
        -   ``ftp_raw``
        -   ``ftp_rawlist``
        -   ``mysql_pconnect``
    *   -   ``eva``
        -   ``system``
        -   ``exec``
        -   ``shell_exec``
        -   ``passthru``
    *   -   ``escapeshellarg``
        -   ``escapeshellcmd``
        -   ``set_time_limit``
        -
        -   

* Either **GD** or **Imagick** PHP extension must be installed. These extensions are used for image manipulation, such as creating thumbnails, applying watermarks, etc. We recommend **Imagick**, because it offers much better quality of the processed images.

  * **GD** is included in PHP, however PHP should be compiled with the ``--with-gd`` flag. The official PHP documentation has `detailed installation instructions for GD <http://php.net/manual/en/image.installation.php>`_. Please make sure your GD configuration includes the **FreeType** font library.

  * **Imagick** is a `PECL extension <https://pecl.php.net/package/imagick>`_. The official PHP documentation has `detailed installation instructions for Imagick <http://php.net/manual/en/imagick.setup.php>`_. `ImageMagick <http://www.imagemagick.org/script/index.php>`_ version 6.5.3-10+ and PHP 5.4.0+ must be installed on your server.

    .. important::

        We strongly recommend using at least **ImageMagick 6.9.3-10** or higher, as it includes a critical vulnerability fix. **ImageMagick 7 is not supported yet**.

* **cURL support** should be enabled. You need this PHP extension to ensure support of secure connections, some payment systems such as PayPal and Authorize.Net, and real-time shipping rate calculators for FedEx and DHL/Airborne.

* **mbstring** extension should be enabled, especially if you plan to use a language with non-Latin alphabet. This extension allows CS-Cart to work properly with multi-byte strings (for example, strings that contain Cyrillic symbols).

* **Phar** extension should be enabled (built into PHP since v5.3.0).

* **ZipArchive** extension should be enabled (built into PHP since v5.2.0).

* If you use Apache as your web server:

  * **mod_rewrite** should be enabled (for SEO to work);

  * **mod_headers** should be enabled (for `CORS <https://en.wikipedia.org/wiki/Cross-origin_resource_sharing>`_ and widget mode to work);

  * **mod_ssl** should be enabled (for SSL to work);

  * **mod_security** should be disabled; if you don't want to disable it fully, configure it to work with CS-Cart as described in :download:`this file <files/mod_security.txt>`;

  * the **.htaccess** file should allow the following directives: 

    .. list-table::
      :widths: 10 10 10 10 10

      *   -   ``DirectoryIndex``
          -   ``Deny``
          -   ``Allow``
          -   ``Options``
          -   ``Order``
      *   -   ``AddHandler``
          -   ``RewriteEngine``
          -   ``RewriteBase``
          -   ``RewriteCond``
          -   ``RewriteRule``

* If PHP was compiled with the `Suhosin <https://en.wikipedia.org/wiki/Suhosin>`_ extension, then configure it in the **php.ini** file as follows::

    suhosin.memory_limit = 0
    suhosin.post.max_vars = 3000
    suhosin.get.max_totalname_length = 3000
    suhosin.session.encrypt = Off
    suhosin.session.cryptua = Off
    suhosin.cookie.cryptdocroot = Off
    suhosin.session.cryptdocroot = Off

  .. note::

      Suhosin is a PHP extension intended for protection. However, it can cause :doc:`various issues <possible_issues/suhosin>` with CS-Cart/Multi-Vendor.

=======================================
CS-Cart Architects Team Recommends This
=======================================

* Use a **virtual** or **dedicated** private server instead of a shared hosting; this allows for smoother upgrades.
 
* Install and enable **Openssl** PHP extension to generate more secure session keys.

* Install **Redis** or **APCu** and set it as a CS-Cart cache backend.

* Install **OPcache**.

* Install the **mod_deflate** Apache mod.

============================
Compatible Hosting Providers
============================

As you can see, the requirements for the web server environment are quite typical. Thousands of hosting providers meet them. But if you can’t decide on the hosting for your web store, please consider a compatible hosting provider from our `Compatible Hosting <https://www.cs-cart.com/compatible-hosting.html>`_ list.

============================
Server Hardware Requirements
============================

Requirements to server hardware depend on multiple factors. The more products, customers, and functionality your store has, the higher-performing server you'll need.

Here's an example of the server hardware sufficient for 50 visitors per hour:

.. list-table::
   :widths: 5 30
   :stub-columns: 1

   *    -   HDD

        -   10 Gb

   *    -   CPU

        -   One core, 2.4 GHz

   *    -   RAM

        -   1024 Mb
