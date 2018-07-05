*****************************
Database Structure and Naming
*****************************

===========
Table Names
===========

* A table that stores the basic information of some entity is named after that entity **in plural**. For example, the ``products`` table stores the primary information about the products of the shop.

* A table that stores additional data of the entity or a child entity is named like **entity_suffix**. The suffix is **in plural**. For example, the table that stores product prices is called ``product_prices``.

* This example shows a more complicated table dependency:

  * products—the basic information about products
  * product_features—the features that can be assigned to products
  * product_feature_variants—the variants of the features
  * product_feature_variant_descriptions—the multi-language fields of feature variant descriptions for every language

.. important::

    As the dependencies go deeper, **only the last suffix in the table name retains the plural form**.

============
Table Prefix
============

During the installation you can specify **a prefix** that will be used for all tables. The default prefix is ``cscart_``. 

The functions that work with the database have the ``?:`` **placeholder** to replace the table prefix in the SQL queries. Therefore, if you use a table name in an SQL query, you must add the ``?:`` placeholder before the name of the table. For example:

::

  $products = db_get_array(
      'SELECT * FROM ?:products LEFT JOIN ?:product_popularity USING(product_id)'
  );

=========================
Primary Key Column Naming
=========================

The names of the fields that belong to primary and foreign keys have the name of the entity **as a prefix**. For example, the field with the unique primary key in the products table is called ``product_id``. We suggest you follow this convention to maintain the integrity of the code when you modify CS-Cart.

=======================
Multi-Language Entities
=======================

Entities stored in the database may have fields with different content for different languages. For example, products may have names and descriptions in different languages. This is how CS-Cart stores these fields:

* A separate table is created. This table is called  **entity_descriptions** (for example, ``product_descriptions``).

* The table must have columns that refer to the primary key of the entity which needs multi-language support. In our case this column is ``product_id``.

* The table must also have a column to store the codes of the languages, for which the entries are added. This column is usually called ``lang_code`` and has the **CHAR(2)** type.

* Then the columns for the fields with multi-language support are added to the table. In our example these fields would be ``product`` (the name of the product) and ``full_description`` (detailed description of the product), as well as some others.

The logic of working with this table is handled by the PHP code. We’ll use the product_descriptions table to describe the logic:

* When saving the data about a new product to the ``product_descriptions`` table, also save the value of the ``DESCR_SL`` constant (the language chosen to edit the product) to the ``lang_code`` field.

* When extracting the data to display in the customer area, join the table with the multi-language data with the condition that the value of the ``lang_code`` field equals the value of the ``CART_LANGUAGE`` constant (the language that a user has chosen in the customer area).

* Here’s the example of an SQL query:

  ::

    SELECT products.*, product_descriptions.* FROM products
    INNER JOIN product_descriptions
        ON product_descriptions.product_id = products.product_id
        AND product_descriptions.lang_code = 'en'

====================
Table Storage Engine
====================

All tables in CS-Cart use **MyISAM**. However, you can change the type of tables to **InnoDB**, should you need it—CS-Cart will still work properly. 

InnoDB has many advantages over MyISAM:

* foreign constraints
* advanced use of indexes in the latest MySQL versions
* transactions support

.. note::

    Due to the architecture of InnoDB, it may take longer to process the queries that change data or table schema, than in MyISAM.

When you migrate to InnoDB, the foreign constraints you add to the tables may handle the order of changing and removing data in CS-Cart incorrectly.

CS-Cart uses PHP code to update and delete linked entities. For example, if you delete a category, CS-Cart will delete all the child products and subcategories. In that case you may have problems with cascading referential integrity constraints like ``ON UPDATE CASCADE``/``ON DELETE CASCADE``, because MySQL will try to to the same.

.. important::

    We highly suggest you to implement the cascading update and removal of data in the PHP code.

=====================
Logic in the Database
=====================

Don't use logic in the database. Not all servers provide the MySQL privileges to create triggers, stored procedures, etc. Furthermore, the logic added in the database may duplicate or conflict with the logic implemented via the PHP code.

