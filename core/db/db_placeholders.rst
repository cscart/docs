*********************************************
Using Placeholders to Build Database Requests
*********************************************

In CS-Cart requests to the database are formed using placeholders:

*   ``?u`` - forms a structure for updating data, receives an array::

        $data = array (
            'payment_id' => 5
            );
        $order_id = 3;

        db_query('UPDATE ?:orders SET ?u WHERE order_id = ?i', $data, $order_id);

    Converts to:

    .. code-block:: mysql

        UPDATE cscart_orders SET payment_id = '5' WHERE order_id = 3;

*   ``?e`` - forms a structure for inserting data, receives an array::

        $data = array (
            'payment_id' => 5,
            'order_id' => 3
        );
 
        db_query('INSERT INTO ?:orders ?e', $data);

    Converts to:

    .. code-block:: mysql

        INSERT INTO cscart_orders (payment_id, order_id) VALUES ('5', '3');

*   ``?i`` - converts data to an integer, receives a string, number::

        $order_id = 4;
        db_query('SELECT * FROM ?:orders WHERE order_id = ?i', $order_id);
  
    Converts to:

    .. code-block:: mysql

        SELECT * FROM cscart_orders WHERE order_id = 4;

*   ``?s`` - converts data to a string (adds slashes), receives a string, number::

        $order_id = 'adasd';
        db_query('SELECT * FROM ?:orders WHERE order_id = ?s', $order_id);

    Converts to:

    .. code-block:: mysql

        SELECT * FROM cscart_orders WHERE order_id = 'foo';

*   ``?l`` - converts data to a string for substitution into the operator LIKE (replaces backslashes with double backslashes and then adds slashes), receives a string::

        $piece = '%black\white%';
        db_query('SELECT * FROM ?:product_descriptions WHERE product LIKE ?l', $piece);
 
    Converts to:

    .. code-block:: mysql

        SELECT * FROM cscart_product_descriptions WHERE product LIKE '%black\\\\white%';

*   ``?d`` - converts data to a fractional number, receives a string, number::

        $order_id = '123.345345';
        db_query('SELECT * FROM ?:orders WHERE order_id = ?d', $order_id);

    Converts to:

    .. code-block:: mysql

        SELECT * FROM cscart_orders WHERE order_id = '123.35';

*   ``?a`` - prepares data to be used in the structure IN () as a set of strings, receives a string, number, array::

        $order_id = '123';
        db_query('SELECT * FROM ?:orders WHERE order_id IN (?a)', $order_id);
 
    Converts to:

    .. code-block:: mysql
        
        SELECT * FROM cscart_orders WHERE order_id IN ('123');

*   ``?n`` - prepares data to be used in the structure IN () as a set of integers, receives a string, number, array::

        $order_id = '123.45';
        db_query('SELECT * FROM ?:orders WHERE order_id IN (?n)', $order_id);

    Converts to:

    .. code-block: mysql
        
        SELECT * FROM cscart_orders WHERE order_id IN (123);

*   ``?p`` - inserts a prepared value::

        $order_id = 'order_id = 4';
        db_query('SELECT * FROM ?:orders WHERE ?p', $order_id);

    Converts to:

    .. code-block:: mysql

        SELECT * FROM cscart_orders WHERE order_id = 4;

*   ``?w`` - prepares data to be used in the structure WHERE, receives an array::
	
        $data = array (
            'payment_id' => 5,
            'order_id' => 3
        );
 
        db_query('SELECT * FROM ?:orders WHERE ?w', $data);
 
    Converts to:

    .. code-block:: mysql
        
        SELECT * cscart_orders WHERE payment_id = '5' AND order_id = '3';

*   ``?f`` - checks whether the variable value is a valid field name, if not returns an empty string::

        $data = 'payment_id';
   
        db_query('SELECT * FROM ?:orders WHERE ?f = 5', $data);

    Converts to:

    .. code-block:: mysql
        
        SELECT * FROM cscart_orders WHERE  = 5;

*   ``?m`` - multi insert::

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

    Converts to:

    .. code-block:: mysql
        
        INSERT INTO cscart_orders (payment_id, order_id) VALUES ('5', '3'),('5', '4');