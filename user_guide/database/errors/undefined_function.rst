**************************************************
Call to Undefined Function mysqli_connect() In ...
**************************************************

A possible cause of this problem is that MySQL has been updated on the server where your CS-Cart is installed. The MySQL version is defined during the CS-Cart installation, and it is not redefined automatically for CS-Cart after MySQL update.

To redefine the MySQL version manually, complete the following steps:

1. Go to your root CS-Cart directory.

2. Open the **config.local.php** file.

3. Find the following line of code in the file:

::

  $config['database_backend'] = 'mysqli';

4. Replace that line with this one:

::

  $config['database_backend'] = 'mysql';

5. Save the file.
