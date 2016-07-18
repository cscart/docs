********************************************
Using Placeholders to Build Database Queries
********************************************

Database queries in CS-Cart/Multi-Vendor are formed with the help of placeholders.

Different placeholders serve different purposes. For example, when you refer to database fields with integer values (``order_id``, ``product_id``, etc.),  use the **?i** or **?n** placeholders. If a field can store text values, use **?s** and **?a** instead.



======================
Available Placeholders
====================== 

--
?u
--

This placeholder forms a structure for updating data. 

* Accepted data: *array*

* Example usage::

    $data = array (
        'payment_id' => 5
        );
    $order_id = 3;

    db_query('UPDATE ?:orders SET ?u WHERE order_id = ?i', $data, $order_id);

* Resulting query:

  .. code-block:: mysql
   
      UPDATE cscart_orders SET payment_id = '5' WHERE order_id = 3;

--
?e
--

This placeholder forms a structure for inserting data.

* Accepted data: *array*

* Example usage::

    $data = array (
        'payment_id' => 5,
        'order_id' => 3
    );

    db_query('INSERT INTO ?:orders ?e', $data);

* Resulting query:

  .. code-block:: mysql

      INSERT INTO cscart_orders (payment_id, order_id) VALUES ('5', '3');

--
?i
--

This placeholder converts the accepted data to an *integer*.

* Accepted data: *string*, *number*

* Example usage::

    $order_id = 4;
    db_query('SELECT * FROM ?:orders WHERE order_id = ?i', $order_id);
  
* Resulting query:*

  .. code-block:: mysql

      SELECT * FROM cscart_orders WHERE order_id = 4;

--
?s
--

This placeholder converts the accepted data to a *string* (adds slashes).

* Accepted data:* *string*, *number*

* Example usage::

    $order_id = 'adasd';
    db_query('SELECT * FROM ?:orders WHERE order_id = ?s', $order_id);

* Resulting query:

  .. code-block:: mysql

      SELECT * FROM cscart_orders WHERE order_id = 'foo';

--
?l
--

This placeholder converts data to a *string* for substitution into the ``LIKE`` operator (replaces backslashes with double backslashes and then adds slashes).

* Accepted data: *string*.

* Example usage::

    $piece = '%black\white%';
    db_query('SELECT * FROM ?:product_descriptions WHERE product LIKE ?l', $piece);
 
* Resulting query:

  .. code-block:: mysql

      SELECT * FROM cscart_product_descriptions WHERE product LIKE '%black\\\\white%';

--
?d
--

This placeholder converts data to a fractional number.

* Accepted data: *string*, *number*

* Example usage::

    $order_id = '123.345345';
    db_query('SELECT * FROM ?:orders WHERE order_id = ?d', $order_id);

* Resulting query:

  .. code-block:: mysql

      SELECT * FROM cscart_orders WHERE order_id = '123.35';

--
?a
--

This placeholder prepares data to be used in the ``IN ()`` structure  as a set of strings.

* Accepted data: *string*, *number*, *array*

* Example usage::

    $product_codes = array('EAN123', 'EAN234');
    db_query('SELECT * FROM ?:products WHERE product_code IN (?a)', $product_codes);
 
* Resulting query:

  .. code-block:: mysql
        
      SELECT * FROM cscart_products WHERE product_code IN ('EAN123', 'EAN234');

--
?n
--

This placeholder prepares data to be used in the ``IN ()`` structure  as a set of integers. 

* Accepted data: *string*, *number*, *array*

* Example usage::

    $order_id = '123.45';
    db_query('SELECT * FROM ?:orders WHERE order_id IN (?n)', $order_id);

* Resulting query:

  .. code-block:: mysql
        
      SELECT * FROM cscart_orders WHERE order_id IN (123);

--
?p
--

This placeholder inserts a prepared value::

* Example usage::

    $order_id = 'order_id = 4';
    db_query('SELECT * FROM ?:orders WHERE ?p', $order_id);

* Resulting query:

  .. code-block:: mysql

      SELECT * FROM cscart_orders WHERE order_id = 4;

--    
?w
--

This placeholder prepares data to be used in the ``WHERE`` structure.

* Accepted data: *array*

* Example usage::

    $data = array (
        'payment_id' => 5,
        'order_id' => 3
    );

    db_query('SELECT * FROM ?:orders WHERE ?w', $data);
 
* Resulting query:

  .. code-block:: mysql
        
      SELECT * cscart_orders WHERE payment_id = '5' AND order_id = '3';

--
?f
--

This placeholder checks whether the value of the variable is a valid field name. If not, it returns an empty string.

* Example usage::

    $data = 'payment@id';
   
    db_query('SELECT * FROM ?:orders WHERE ?f = 5', $data);

* Resulting query:

  .. code-block:: mysql
        
      SELECT * FROM cscart_orders WHERE  = 5;

--
?m
--

This placeholder allows to insert multiple new records in a table.

* Example usage::

    $data = array(
        array(
            'payment_id' => 5,
            'order_id' => 3
        ),
        array(
            'payment_id' => 5,
            'order_id' => 4
        ),
    );
   
    db_query('INSERT INTO ?:orders ?m', $data);

* Resulting query:

  .. code-block:: mysql
        
      INSERT INTO cscart_orders (payment_id, order_id) VALUES ('5', '3'),('5', '4');
