************************************************************
How To: Install CS-Cart on a Server with Nginx and \*\nix OS
************************************************************

.. note::

    **Tutorial Difficulty: 3 / 3**

    Technical skills required.

In this tutorial, you will learn how to install CS-Cart on a virtual private or dedicated server that runs a \*\nix operating system and nginx.

.. note::

   We assume that you have registered a domain and linked it to a directory on your server. You will also need `nginx <http://nginx.org/>`_, `PHP-FPM <http://www.php.net/>`_, `MySQL <https://www.mysql.com/>`_, and `phpMyAdmin <https://www.phpmyadmin.net/>`_ to create a database.

Step 1. Configure Nginx
=======================

1.1. Connect to the your server via `SSH <https://en.wikipedia.org/wiki/Secure_Shell>`_.

Windows users have to download and install PuTTY or any other SSH client. See `this guide <https://mediatemple.net/community/products/dv/204404604/using-ssh-in-putty->`_ if you want to learn about PuTTY.

If you use a \*\nix OS (for example, Linux, FreeBSD, Ubuntu, OS X, etc.), type the following command in the **Terminal** and press Enter. Don’t forget to replace **username** and **host** with your login details. If you don’t know your username and host, contact your hosting provider or server administrator.

.. code-block:: bash

    ssh username@host

Then you will be asked to enter your password. Type it and press Enter.

.. image:: img/apache/connect_ssh.png
    :align: center
    :alt: Connecting to remote server via SSH.

.. note::

    Your cursor won’t move and you won’t see any changes while you type your password. That is normal.

1.2. Stop nginx using this command:

.. code-block:: bash

    sudo service nginx stop

We will configure nginx while it is offline.

1.3. Find out the number of processors in the system. Use this command: 

.. code-block:: bash

    cat /proc/cpuinfo | grep processor | wc -l

You will see a number you’ll need for Step 1.4. In the picture we marked the number in red.

.. image:: img/nginx/processor_number.png
    :align: center
    :alt: Finding out the number of processors in the system.


1.4. On your server find the file */etc/nginx/nginx.conf* and open it in a text/code editor of your choice.

=====================================  ====================
**Find this line:**                    worker_processes  4; 
**Change the number (see Step 1.3):**  worker_processes  2;
=====================================  ====================

1.5. Create a directory for your store. For your convenience we recommend to use your domain name for your directory. In this tutorial we create a new folder called *mynewshop.tk* with this command:

.. code-block:: bash

    mkdir -p /var/www/html/mynewshop.tk

1.6. Open the */etc/nginx/sites-available/default* file. Delete its content and copy the following code to the file. Make sure to find and replace all instances of *mynewshop.tk* with your actual folder name.

.. code-block:: php

    #######################################################################
    # A default  configuration for domains and IP address.
    #######################################################################

    server {
        listen  80;
        server_name _;
        root /var/www/empty;

        # Redirecting to our store by default
        location / {
            return 301 $scheme://mynewshop.tk$request_uri;
        }
    }

    #######################################################################
    # Description and configuration of the primary domain for the store.
    #######################################################################

    server {
        listen  80;
        #   The store’s domain
        server_name mynewshop.tk www.mynewshop.tk;

        #   Default encoding
        charset utf-8;

        #   Location of the log files
        access_log  /var/log/nginx/access.log combined;
        error_log   /var/log/nginx/error.log;

        #   The main directory of your store
        root /var/www/html/mynewshop.tk;

        #   Compression
        gzip on;
        gzip_disable "msie6";
        gzip_comp_level 6;
        gzip_min_length  1100;
        gzip_buffers 16 8k;
        gzip_proxied any;
        gzip_types text/plain application/xml
        application/javascript
        text/css
        text/js
        text/xml
        application/x-javascript
        text/javascript
        application/json
        application/xml+rss;

        #   Other settings
        client_max_body_size            100m;
        client_body_buffer_size         128k;
        client_header_timeout           3m;
        client_body_timeout             3m;
        send_timeout                    3m;
        client_header_buffer_size       1k;
        large_client_header_buffers     4 16k;

        #   The entry point of your store
        location / {
            #   The main directory of your store
            root /var/www/html/mynewshop.tk;

            #   The main script
            index  index.php index.html index.htm;

            #   For API
            rewrite ^/api/(.*)$ /api.php?_d=$1&ajax_custom=1&$args last;

            #   The script search logic uses the following order: file, directory, script
            try_files $uri $uri/ @fallback;
        }

        #   Rewrite rules for the SEO module
        location @fallback {
            rewrite  ^(.*)$ /index.php?$args last;
        }

        #  The first rule for searching static files.
        location ~* \.(jpeg|ico|jpg|gif|png|css|js|pdf|txt|tar|gz|wof|csv|zip|xml|yml) {
        access_log off;
        #   The rule for searching static files. If the server can’t find the file in the store folder, it will use the @statics rule.
        #  For example, if your store is located at mynewshop.tk/shop/
            try_files $uri @statics;
            expires 14d;
            add_header Access-Control-Allow-Origin *;
            add_header Cache-Control public;
            root /var/www/html/mynewshop.tk;
        }

        #   The rule for searching static files of the storefront. For example, when you have 2 storefronts in different directories: mynewshop.tk and mynewshop.tk/shop/
        location @statics {
            rewrite ^/(\w+)/(.*)$ /$2 break;
            access_log off;
            rewrite_log off;
            expires 14d;
            add_header Cache-Control public;
            add_header Access-Control-Allow-Origin *;
            root /var/www/html/mynewshop.tk;
         }

        #   Processing PHP scripts
        location ~ \.php$ {
            root /var/www/html/mynewshop.tk;
            proxy_read_timeout 61;
            fastcgi_read_timeout 61;
            try_files $uri $uri/ =404;
            #   The path to the PHP-FPM daemon socket
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

    #
    #  Denying the ability to run PHP in the directories for security reasons.
    #

        location /app/ {
                deny all;

                #  Allowing to run the script for 1C data exchange. 
                    location ^~ /app/addons/rus_exim_1c/exim_1c.php {
                    allow all;
                }
        }

        #   Allowing to run the payment methods scripts.
        location /app/payments/ {
            allow all;
        }

        #   Forbidding PHP in the /design directory.
        location /design/ {
        allow all;
                location ~* \.([tT][pP][lL]|[pP][hH][pP].?)$ {
                deny all;
                }
        }

        #   Forbidding PHP in the /images directory.
        location /images/ {
            allow all;
            location ~* \.([pP][hH][pP].?)$ {
                deny all;
            }
        }

        #   Allowing static files only in the /var directory.
        location /var/ {
            deny all;
            location ~* \.(js|css|png|jpg|gz|xml|yml)$ {
                allow all;
                expires 1M;
                add_header Cache-Control public;
                add_header Access-Control-Allow-Origin *;
            }
        }

        #   Blocking outside access to the store’s database backups (/var/database)
        location /var/database/ {
            deny all;
        }

        #   Denying access to the template backups
        location /var/skins_repository/ {
            allow all;
            location ~* \.([tT][pP][lL]|[pP][hH][pP].?)$ {
                deny all;
            }
        }

        #   Processing API
        location ~* api/ {
            rewrite ^/api/(.*)$ /api.php?_d=$1&ajax_custom=1&$args last;
        }

        #  Denying access to .htaccess and .htpasswd
        location ~ /\.ht {
            deny  all;
        }
    }

1.7. Use this command to restart nginx:

.. code-block:: bash

    sudo service nginx restart

1.8. Make sure you install **PHP-FPM**. If you don’t have it, nginx may give you **Error 502**, when you try to view your site. Use this command:

.. code-block:: bash

    sudo apt-get install php5-fpm php5-mysql php5-curl php5-gd php-mail -y

1.9. Let’s configure nginx for **phpMyAdmin**. We want it to open when we go to *pma.mynewshop.tk*. Open the file */etc/nginx/sites-available/default* and add the following code to the end of the file. Again, replace all instances of *mynewshop.tk* with your actual folder name.

.. code-block:: php

    #######################################################################
    # pma.mynewshop.tk
    #######################################################################

    server {
        listen  80;

        #   A subdomain for phpMyAdmin
        server_name pma.mynewshop.tk www.pma.mynewshop.tk;

        charset utf-8;

        #   The location of the log files
        access_log  /var/log/nginx/pma.mynewshop.tk_access.log combined;
        error_log   /var/log/nginx/pma.mynewshop.tk_error.log;

        #   The path for the subdomain to refer to
        root /usr/share/phpmyadmin;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            root /usr/share/phpmyadmin;
            proxy_read_timeout 61;
            fastcgi_read_timeout 61;
            try_files $uri $uri/ =404;
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    }

1.10. Restart nginx once more:

.. code-block:: bash

    sudo service nginx restart

Step 2. Upload CS-Cart
======================

2.1. `Download <https://www.cs-cart.com/download-cs-cart.html>`_ the latest version of CS-Cart.

2.2. Upload the **cscart_v4.x.x.zip** archive you downloaded nto the directory you created in Step 1.5 (*/var/www/html/mynewshop.tk* in the example).
 
Connect to the server with your FTP server. You’ll need the name of the **host**, **username**, **password** and, in some cases, **port**. Contact your hosting provider or the server administrator for your FTP account details. 

2.3. In the Terminal/SSH Client switch to the directory of your site. Use this command, and replace mynewshop.tk with the name of the directory you created in Step 1.5:

.. code-block:: bash

    cd /var/www/html/mynewshop.tk

Your command may look different if your document root is different.

.. image:: img/nginx/nginx_cd_ls_unzip.png
    :align: center
    :alt: Locating and extracting the CS-Cart archive.

2.3. Use the following command to see what’s inside the directory:

.. code-block:: bash

    ls

You should see the archive you uploaded, and any other files or directories you may have in your Document Root.

2.4. Unpack the archive:

.. code-block:: bash

    unzip cscart_v4.x.x.zip

In the example we have **cscart_v4.3.4.zip**. The name of your archive depends on the version of CS-Cart that you install.

Step 3. Change Permissions
==========================

3.1. Execute the following commands one by one:

.. code-block:: bash

    chmod 644 config.local.php
    chmod -R 755 design images var
    find design -type f -print0 | xargs -0 chmod 644
    find images -type f -print0 | xargs -0 chmod 644
    find var -type f -print0 | xargs -0 chmod 644

These commands set the right permissions for the files, so that CS-Cart can install properly. The 3 digits represent the **rights of the owner** of the file/directory, the **owner’s group**, and **other users** respectively.

For example,

.. code-block:: bash

    chmod 644 config.local.php 

means that the owner of **config.local.php** can read the file and write to it **(6)**; the group to which the owner belongs (e.g., administrators) can read the file **(4)**; all other users can also read the file **(4)**.

.. note::

    There are three types of things a user can do with a file: **read**, **write** and **execute**. The easy way to remember the numbers for the chmod command is this:

    **read = 4** 

    **write = 2**

    **execute = 1**

    A sum of the numbers represents a user’s set of rights, for example **read + write = 4 + 2 = 6**

    The types of rights for directories are the same. **Read** allows to get the list of the files and subdirectories; **write** allows to create, rename and delete files in the directory; **execute** allows to enter the directory and access files and directories inside.

Step 4. Create a Database
=========================

4.1. Open **phpMyAdmin** in your browser. In our case the link to it is located in the Document Root and is accessible by *http://pma.mynewshop.tk*. Contact your hosting provider or server administrator for phpMyAdmin login and password.

If you open it for the first time, the credentials may be as follows:

============  ===================================================
**Login**     root
**Password**  The MySQL password; it is also the password you enter during the installation of phpMyAdmin. The default password may be *mysql*, *root*, *password*, or empty field.
============  ===================================================

4.2. Switch to the **Databases** tab.

4.3. Enter the name of your database.

4.4. Press **Create**.

.. image:: img/apache/creating_database.png
    :align: center
    :alt: Creating a new database in phpMyAdmin.

Step 5. Install CS-Cart
=======================

5.1. Open your store’s URL in a browser. You’ll see a message that CS-Cart is not installed. Let's fix this by clicking the **[install]** link.

.. image:: img/apache/open_website.png
    :align: center
    :alt: Opening our store's main page in a browser.

5.2. Read and accept the **License Agreement** in order to proceed.

.. image:: img/cpanel/11_license_agreement.png
    :align: center
    :alt: Tick the checkbox to accept the License Agreement. 

5.3. Fill in the form using the details below:

============================  ===========================================================================================================
**MySQL Server Host**         Enter the DNS name or IP address of your MySQL server. Usually it’s **localhost** (because the database and the website are stored on the same server).
**MySQL Database Name**       Enter the name of the database you created in Step 4.4. 
**MySQL User**                Enter the username from Step 4.1.
**MySQL Password**            Enter the password of the MySQL user.
**Administrator's Email**     Enter your email here. CS-Cart will use it to notify you about new orders, call requests, and other important events in your store.
**Administrator's Password**  Enter the password you will use to access the CS-Cart administration panel.
**Main Language**             English (or any language of your choice).
============================  ===========================================================================================================

.. image:: img/apache/installation_parameters.png
    :align: center
    :alt: Fill in the MySQL and administrator's data to proceed. 

.. note::
    Additional languages are available under the **Advanced** tab of **Administration settings**. You can enable or disable them now or later.

5.4. If this is your first time with CS-Cart and you want to see what your store will look like once you add the details about your products, fill your store with demo products, orders, and banners. 

To do that, tick the **Install demo data** checkbox. You can always `remove demo data <http://kb.cs-cart.com/removing-demo-info>`_ later. We’d appreciate it if you helped us make CS-Cart better. Tick the **Help us improve CS-Cart** checkbox to send anonymous usage statistics.

.. image:: img/cpanel/13_checkboxes.png
    :align: center
    :alt: Choose if you want to install demo data and send anonymous statistics to CS-Cart developers. 

5.5. After you press **Install** you’ll see the progress bar running. Please, don’t close the page during the installation. This is when CS-Cart settles in on your server and unpacks various themes and add-ons. Don’t worry, it won’t be long before your new store is good to go!

.. image:: img/cpanel/14_progress_bar.png
    :align: center
    :alt: Don't close the page, wait for the progress bar to fill. 

Step 6. Choose Your Licensing Mode
==================================

The next step is to choose your licensing mode. You have 3 options:

1. Enter your license number to enable the **Full Mode**, that gives you unrestricted access to all CS-Cart features, i.e. several dozens of add-ons, multiple languages and currencies, unlimited number of product filters on the storefront, and more. You can `purchase a license <http://www.cs-cart.com/cs-cart-license.html>`_ any time.

2. If you don’t have a license yet, we offer a **free 30-day trial** with full access to all CS-Cart features. After the end of your trial period you can purchase a license or switch to the Free Mode.

3. The **Free Mode** leaves some features unavailable, but has no time restrictions. You can use this mode from the start or switch to it once your trial period is over.

.. image:: img/cpanel/15_licensing_mode.png
    :align: center
    :alt: Enter your CS-Cart license number, get a 30-day trial or use the free version. 

Once you choose your licensing mode, your online store is all set! Now you can go to the **Storefront** to view your store, or to the **Administrator panel** to manage it.

.. image:: img/cpanel/16_complete.png
    :align: center
    :alt: After the installation you can view the store and manage it. 

