*******************************
Connecting Additional Databases
*******************************

Sometimes it is necessary to use an additional database connection to get external data, for replication, backup, or other purposes. CS-Cart has a convenient developer method to establish connections to database hosts different from the default one, which is strictly defined in the core.

Use this methods to establish a connection with a database on an external host:

* ``db_initiate``::

     db_initiate($host, $user, $password, $name, $params = array());

 *Parameters*:

 * ``$host`` - database host.
 * ``$user`` - database user.
 * ``$password`` - database password.
 * ``$name`` - database name.
 * ``$params`` - array of additional connection parameters:

     * ``dbc_name`` - local alias to determine the target database.
     * ``table_prefix`` - prefix for the target database table names. Replaces the ``?:`` placeholder.

* ``db_connect_to``::

     db_connect_to($params, $name);

 *Parameters*:

 * ``$name`` - database name.
 * ``$params`` - array of additional connection parameters:

      * ``dbc_name`` - Local alias to determine the target database.
      * ``[table_prefix]`` - Prefix for the target database table names. Replaces the ``?:`` placeholder. The default value is ``table_prefix`` used in ``$params`` in the ``db_initiate`` method.

After calling these functions, requests will be addressed to the new database, for example::

  $params = array(
  'dbc_name' => 'backup',
  'table_prefix' => 'cscart'
  );
  db_initiate('localhost', 'db_user', 'db_password', 'cscart_backup', $params);
  db_connect_to($params, 'cscart_backup');
 
  $data = db_get_array("SELECT * FROM ?:products");
 
In this example ``$data`` will contain data from the *cscart_products* table of the *cscart_backup* database, which is hosted on localhost.
