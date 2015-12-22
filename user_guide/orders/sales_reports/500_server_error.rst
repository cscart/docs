***************************************************
500 Internal Server Error on the Sales Reports Page
***************************************************

If you get the **500 Internal Server Error** message on the **Orders → Sales reports** page in the administration panel of your store, it may be because a lot of orders are stored in your database. As a result, it takes much time and resources to retrieve the necessary information from the database, the server cannot handle it and returns the 500 Internal Server Error.

To resolve this problem, run the following SQL queries on your server.

::

  UPDATE `cscart_sales_reports` SET `period` = 'D';
  UPDATE `cscart_sales_reports_table_elements` SET `limit_auto` = '20';

.. note::

    You can use **phpMyAdmin** to run those queries.

If the provided information does not help you, please contact `CS-Cart support team <http://www.cs-cart.com/helpdesk>`_.


