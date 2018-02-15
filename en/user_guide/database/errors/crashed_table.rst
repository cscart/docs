*************************************************
Table is Marked as Crashed and Should be Repaired
*************************************************

You'll see this error, if a table has been corrupted and needs to be repaired. For example, if that happens to the **cscart_sessions** table, you'll see the following error:

::

  Database error: Table 'cscart_sessions' is marked as crashed and should be repaired

.. note::

    A PHP script like CS-Cart cannot crash a MySQL database table. Usually, MyISAM tables can get corrupted after a system failure.

To solve this these problem, complete the steps below:

1. :download:`Download the repair4.php file <files/repair4.php>`. 

2. Upload **repair4.php** to the root CS-Cart directory on your server.

3. Launch the script by opening an URL like this in your browser:

*http://www.your_domain.com/your_cscart_directory/repair4.php?table=cscart_table_name*

Remember to replace the parts of the URL with your details:

* Replace *your_domain.com* with the name of your domain, like *example.com*.

* Replace *your_cscart_directory* with the name of the directory where CS-Cart is installed on your server; for example, if your store is available at *example.com/shop*, then replace *your_cscart_directory* with *shop*. If your store is available directly at *example.com*, then remove */your_cscart_directory* from the URL.

* Replace *cscart_table_name* with the name of the crashed table, like *cscart_sessions* in the example above.

.. note::

    If your store is available directly at *www.example.com*, and the crashed table is *cscart_sessions*, the URL you use will be as follows: *http://www.example.com/repair4.php?table=cscart_sessions*

