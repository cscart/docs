************************************
Установка CS-Cart с помощью консоли
************************************

.. contents::
   :backlinks: none
   :local:

======
4.0.x
======

Для консольной установки версии 4.0.x необходимо поправить файл **config.php** в папке **install**.

Все значения интуитивно понятны.

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

Из каталога **./install** запустить

::

      # php index.php

На экран будут выводиться стандартные проверки/ошибки/прогресс.

======
3.0.x
======

Для консольной установки версии 3.1.0+ необходимо поправить файл **config.php** в папке **install**.

Все значения интуитивно понятны.

::

  return array(
  // Add-on names to be installed
  // If empty will be installed only addons included by default
  'addons' => array(),

  'cart_settings' => array (
      'email' => 'admin@example.com',
      'secret_key' => 'YOURVERYSECRETCEY',
      'languages' => array (
          'en', 'ru'
      ),
      'main_language' => 'en',
      'demo_catalog' => true,
      'theme_name' => 'basic',
      'license_number' => ''
  ),
  'database_settings' => array(
      'host' => 'localhost',
      'name' => 'installer_test',
      'user' => 'root',
      'password' => 'password',
      'table_prefix' => 'cscart_',

      // Type of database driver
      'type' => 'mysql',
      'notify' => false,
  ),
  'server_settings' => array (
      'http_host' => 'localhost',
      'http_path' => '',
      'https_host' => '',
      'https_path' => '',
      'correct_permissions' => true,
  ),
  );

Из каталога **./install** запустить

::

      # php index.php

На экран будут выводиться стандартные проверки/ошибки/прогресс.

=======
2.0.8+
=======

Начиная с версии 2.0.8 появилась возможность устанавливать магазин из консоли. Для этого нужно:

Положить в каталог **./install** файл **config.install.php** следующего содержания

::

  $config['db_host'] = 'host';
  $config['db_name'] = 'db_name';
  $config['db_user'] = 'u';
  $config['db_password'] = 'p';
  $config['database_backend'] = 'mysqli';

  $config['http_host'] = 'zeke.dev.simtech';
  $config['http_path'] = '/u207';
  $config['https_host'] = 'zeke.dev.simtech';
  $config['https_path'] = '/u207';

  $config['theme_name'] = 'projection';
  $config['additional_languages'] = array('ru', 'gr');
  $config['demo_catalog'] = true;
  $config['admin_email'] = 'z@co.m';
  $config['license_number'] = '123';

Из каталога **./install** запустить

::

  # php index.php

На экран будут выводиться стандартные проверки/ошибки/прогресс.

