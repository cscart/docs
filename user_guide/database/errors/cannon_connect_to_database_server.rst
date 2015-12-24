*************************************
Cannot Connect to the Database Server
*************************************

This error indicates that a PHP script cannot connect to your MySQL server. 

CS-Cart may fail to connect to the database server due to the current MySQL server overload or inaccessibility. For example, this problem may arise during the MySQL server maintenance. 

The problem may also be caused by the incorrect database credentials.

1. Check your MySQL credentials in the **config.local.php** file located in the root CS-Cart directory. You should check the values of the following variables:

::

  $config['db_host'] = 'NNNNNNNN';
  $config['db_name'] = 'NNNNNNNN';
  $config['db_user'] = 'NNNNNNNN';
  $config['db_password']= 'NNNNNNNN';

.. note::

    The *db_host* variable determines the location of the database (usually it's set to **localhost**, because the database and the CS-Cart installation are on the same server). The **db_name**, **db_user**, and **db_password** specify the name of the database, the name and the password of the database user respectively.

2. If the values in **config.local.php** are correct and you are still getting this error, contact your server administrator.
