***************************
CS-Cart System Requirements
***************************

======================
Web Server Environment
======================

CS-Cart is developed to meet most server configurations, ranging from shared hosting accounts to dedicated servers.

There are two core requirements for your host to run CS-Cart:

* `PHP <http://www.php.net/>`_ version 5.6 or 7. CS-Cart supports SAPI mod_php, FPM, FastCGI.

  * PHP 7.0 is supported starting with CS-Cart/Multi-Vendor 4.3.6.

  * PHP 7.1 is supported starting with CS-Cart/Multi-Vendor 4.6.1.

  * PHP 7.2 is supported starting with CS-Cart/Multi-Vendor 4.7.2.
  
  * PHP 7.3 is supported starting with CS-Cart/Multi-Vendor 4.11.1.

* `MySQL <http://www.mysql.com/>`_ version 4.1 or higher (**MySQLi** or **pdo_mysql** should be supported). CS-Cart also supports MariaDB 5.5 or higher, and PerconaServer 5.5 or higher.

We recommend a **Unix-like operating system** for your server, such as FreeBSD, Linux, or OS X. These systems are scalable, more secure, and offer better performance. Both 64-bit and 32-bit operating systems are supported, but we recommend 64-bit systems: they don't limit the maximum amount of RAM to 4 gigabytes, among other advantages.

.. note::

    CS-Cart is compatible with almost every server that supports PHP and MySQL. However, we recommend **Apache** or **Nginx** as the most robust and stable servers for your web store.

=================================
Server Configuration Requirements
=================================

* **SELinux** and **AppArmor** should be disabled (on Linux servers).

* **safe_mode** PHP directive should be disabled.

* **file_uploads, allow_url_fopen** PHP directives should be enabled.

------------------------------

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
    *   -   ``eval``
        -   ``system``
        -   ``exec``
        -   ``shell_exec``
        -   ``passthru``
    *   -   ``escapeshellarg``
        -   ``escapeshellcmd``
        -   ``set_time_limit``
        -
        -   

------------------------------

* The following PHP extensions should be installed (required extensions are marked with *****):

  .. list-table::
    :widths: 5 10 5
    :stub-columns: 1

    *   -   MySQL support*
        -   Required for storing the data of your store in a database.
        -   ``mysqli`` OR ``pdo_mysql``
    *   -   Network requests support*
        -   Required for proper functioning of several payment gateways (such as PayPal, Authorize Net, etc.) and real-time shipping services (FedEx, UPS, DHL), for sending e-mails via SMTP, and for upgrading your store.
        -   ``curl``, ``sockets``
    *   -   Graphics library*
        -   Required for creating smaller versions (thumbnails) of product images. If you don't have a graphics library, you won't be able to upload images for products.
        -   ``imagick`` OR ``gd``
    *   -   EXIF support*
        -   Required for making sure that the thumbnails generated from images shot in landscape mode will be rotated correctly.
        -   ``exif``
    *   -   JSON support*
        -   Required for proper functioning of CS-Cart and Multi-Vendor; even some aspects of core functionality rely on `JSON <https://www.json.org/>`_.
        -   ``json``
    *   -   XML support*
        -   Required for proper functioning of CS-Cart and Multi-Vendor; even some aspects of core functionality rely on `XML <https://www.w3schools.com/xml/>`_.
        -   ``xml``, ``libxml``, ``SimpleXML``, ``dom``, ``xmlreader``, ``xmlwriter``
    *   -   SOAP support*
        -   Required for proper functioning of several real-time shipping services (for example, Temando).
        -   ``soap``
    *   -   Multibyte string support*
        -   Required for proper handling of multibyte strings (for example, strings that contain Cyrillic symbols).
        -   ``mbstring`` OR ``iconv``
    *   -   Character type checking support*
        -   Required for proper checking whether a character or string falls into a certain character class according to the current locale.
        -   ``ctype``
    *   -   GZIP archives support*
        -   Required for unpacking TAR and GZIP archives. Otherwise you won't be able to install add-ons and themes from such archives.
        -   ``Phar``
    *   -   ZIP archives support*
        -   Required for unpacking ZIP archives. Otherwise you won't be able to upgrade your store and install add-ons and themes from such archives.
        -   ``zip``
    *   -   File information support*
        -   Required for proper detection of the file type.
        -   ``fileinfo``
    *   -   Cryptography support*
        -   Required for proper functioning of several payment gateways (such as Servired and SagePay) and for interacting with third-party services (such as Facebook).
        -   ``openssl``
    *   -   FTP support
        -   Required for setting correct file and directory permissions during the installation and upgrades of the store, and during the installation of add-ons and themes. An FTP server must be installed on your server.
        -   ``ftp``
    *   -   Cache and session backend
        -   Required for storing cache and PHP sessions in a high-performance storage rather than on the disk.
        -   ``redis`` OR ``sqlite3`` OR ``xcache`` OR ``apcu`` OR ``apc``

  Notes:

  * We recommend **Imagick** over **GD**, because it offers better performance and quality of the processed images. Using **GD** can lead to crashes due to the lack of memory when large product images are uploaded.

    **Imagick** is a `PECL extension <https://pecl.php.net/package/imagick>`_. The official PHP documentation has `detailed installation instructions for Imagick <http://php.net/manual/en/imagick.setup.php>`_. `ImageMagick <http://www.imagemagick.org/script/index.php>`_ version 6.5.3-10+ and PHP 5.4.0+ must be installed on your server.

    .. important::

        We strongly recommend using at least **ImageMagick 6.9.3-10** or higher, as it includes a critical vulnerability fix. **ImageMagick 7** is only supported starting with CS-Cart/Multi-Vendor 4.7.2.

    **GD** is included in PHP, however PHP should be compiled with the ``--with-gd`` flag. The official PHP documentation has `detailed installation instructions for GD <http://php.net/manual/en/image.installation.php>`_. Please make sure your GD configuration includes the **FreeType** font library.

------------------------------

* If you use Apache as your web server:

  * **mod_rewrite** should be enabled (for SEO to work);

  * **mod_headers** should be enabled (for `CORS <https://en.wikipedia.org/wiki/Cross-origin_resource_sharing>`_  to work);

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

------------------------------

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

As you can see, the requirements for the web server environment are quite typical. Thousands of hosting providers meet them. But if you can’t decide on the hosting for your web store, please consider a compatible hosting provider from our `compatible hosting list <https://www.cs-cart.com/compatible-hosting.html>`_.

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

.. meta::
   :description: System requirements of CS-Cart store or Multi-Vendor marketplace: supported PHP versions and databases, operating systems, required PHP extensions and web server settings, hardware requirements.
