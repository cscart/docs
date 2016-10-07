********************************************
Blank CS-Cart Pages or Functionality Failure
********************************************

If you see blank pages or CS-Cart simply works strange, there are several things you need to check.

===============
The PHP Version
===============

1. Check the PHP version installed on the server:

   * Open the administration panel of your store. 

   * Go to **Administration → Logs**.

   * Click the **gear button** in the top right corner of a page.

   * Choose **PHP information**.

   * The PHP version is displayed in the top part of the page.

2. If the version is **5.0.5** (or **5.0.4**), CS-Cart cannot work with it correctly: older PHP versions have serious bugs, like `this bug in PHP 5.0.5 <http://bugs.php.net/bug.php?id=31478>`_.

3. Contact your hosting administrator and ask them to :doc:`update PHP to a later version <../system_requirements>`.

========================
MySQLi Extension Missing
========================

If you see blank pages when trying to open the storefront or the Administration panel, it might be because **MySQLi** extension is not installed on your server. Here's a quick way to fix the problem:

1. Go to the root directory of the CS-Cart installation.

2. Open the **config.local.php** file.

3. Find the following line::

     $config['database_backend'] = 'mysqli';

4. Replace it with this line::

     $config['database_backend'] = 'pdo';

5. Save the file and see if that solves the problem.

=================
Not Enough Memory
=================

Another possible reason for the strange behaviour of CS-Cart is that the initial amount of memory allocated to CS-Cart is not enough. To resolve the issue, follow the instructions below:

1. Go to the root directory of the CS-Cart installation.

2. Open the **config.local.php** file.

3. Find the following part of the code in the file:

::

  // Set maximum memory limit
  if (PHP_INT_SIZE == 4 && (substr(ini_get('memory_limit'), 0, -1) < "64")) {
  // 32bit PHP
  @ini_set('memory_limit', '64M');
  } elseif (PHP_INT_SIZE == 8 && (substr(ini_get('memory_limit'), 0, -1) < "256")) {
  // 64bit PHP
  @ini_set('memory_limit', '256M');
  }

4. Replace that part of the code with this one:

::

  // Set maximum memory limit
  if (PHP_INT_SIZE == 4 && (substr(ini_get('memory_limit'), 0, -1) < "64")) {
  // 32bit PHP
  @ini_set('memory_limit', '128M');
  } elseif (PHP_INT_SIZE == 8 && (substr(ini_get('memory_limit'), 0, -1) < "256")) {
  // 64bit PHP
  @ini_set('memory_limit', '512M');
  }

5. Save the file.

=====================
The Safe Mode Setting
=====================

Another possible reason for the issues is the enabled **Safe mode** setting in your PHP configuration.

All features of CS-Cart work properly only if the **safe mode** is off. If the **safe mode** is, `the most important PHP functions do not work <http://php.net/manual/en/features.safe-mode.functions.php>`_.
