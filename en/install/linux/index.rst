********************************
How To: Install CS-Cart on Linux
********************************

This article describes how to install CS-Cart or Multi-Vendor on a Unix-like operating system (like Linux or Ubuntu).

.. important::

    Install Apache, MySQL, and PHP first.

#. Download the latest version of `CS-Cart <https://www.cs-cart.com/download-cs-cart.html>`_ or `Multi-Vendor <https://www.cs-cart.com/download-multivendor.html>`_.

#. Create a new directory */var/www/cscart/*. Use any other name instead of *cscart*, if you'd like.

#. Unpack the archive into the newly-created directory.

   .. image:: img/install_01.png
       :align: center
       :alt: Installing CS-Cart or Multi-Vendor on Ubuntu.

#. Set the file and directory permissions:

   .. list-table::
       :stub-columns: 1
       :widths: 10 30

       * - 777
         - For the following directories and their contents:

           * var/
           * design/
           * images/

       * - 666
         - For the following file:

           * config.local.php

   Here are the commands to set these permissions via the command line:

   .. code::

       chmod 666 config.local.php
       chmod -R 777 design images var
       find design -type f -print0 | xargs -0 chmod 666
       find images -type f -print0 | xargs -0 chmod 666
       find var -type f -print0 | xargs -0 chmod 666

#. You may also need these commands:

   .. code::

       chmod 644 design/.htaccess images/.htaccess var/.htaccess var/themes_repository/.htaccess
       chmod 644 design/index.php images/index.php var/index.php var/themes_repository/index.php

#. Run the installer. To do it, open the ``localhost/cscart`` page in your browser.

#. Click **[install]** and follow the instructions of the installer to finish the process.

   .. image:: img/install_04.png
       :align: center
       :alt: Starting CS-Cart or Multi-Vendor installation in as browser.
