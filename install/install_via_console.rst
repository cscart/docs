***************************************************
How To: Install CS-Cart or Multi-Vendor via Console
***************************************************

.. note::

    **Tutorial Difficulty: 2 / 3**

To install CS-Cart or Multi-Vendor via console, complete these steps:

1. Download CS-Cart or Multi-Vendor from `cs-cart.com <https://www.cs-cart.com/download-cs-cart.html>`_.

2. Put the downloaded archive into the web-accesible directory.

3. Extract the archive.

4. Open the **config.php** file in the *install* directory.

5. Find the following code:

::

  return array(
  // Add-on names to be installed
  // If empty will be installed only addons included by default
  'addons' => array(),

  'cart_settings' => array (
      'email' => 'admin@example.com',
      'password' => 'admin',
      'secret_key' => 'YOURVERYSECRETCEY',
      'languages' => array (
          'en', 'da', 'de', 'es', 'fr', 'el', 'it', 'nl', 'ro', 'ru', 'bg', 'no', 'sl',
      ),
      'main_language' => 'en',
      'demo_catalog' => true,
      'theme_name' => 'basic',
      'license_number' => 'CART-1111-1111-1111-1111'
  ),
 'database_settings' => array(
      'host' => 'localhost',
      'name' => '%DB_NAME%',
      'user' => '%DB_USER%',
      'password' => '%DB_PASS%',
      'table_prefix' => 'cscart_',
      'database_backend' => 'mysqli',
      'notify' => false,
      'allow_override' => 'Y',
  ),
  'server_settings' => array (
      'http_host' => '%HTTP_HOST%',
      'http_path' => '',
      'https_host' => '%HTTP_HOST%',
      'https_path' => '',
      'correct_permissions' => true,
  ),
  );

6. Replace the values of the variables in the code above with your values. To do this, replace the example values (admin@example.com, admin, etc.) between the ' ' simbols with the administrator's e-mail, password, etc.

.. note:: 

    If you want to install the Trial or Free version of CS-Cart, leave the **'license number'** field empty.

7. Set the proper file permissions.

*   On a UNIX-based server, run the following commands one by one:

::

      chmod 666 config.local.php
      chmod -R 777 design images var
      find design -type f -print0 | xargs -0 chmod 666
      find images -type f -print0 | xargs -0 chmod 666
      find var -type f -print0 | xargs -0 chmod 666

*   On a Windows-based server, you may need to give full permissions for the files and directories to the user with the IUSER_ComputerName account.

8. In a console terminal open the *install* directory and run the following comand:

::

  php index.php

The standard installation process will be launched.

Leaarn more about setting permissions, extracting an archive, choosing the installation directory, etc. :doc:`in other installation scenarios <vps_install>`.
