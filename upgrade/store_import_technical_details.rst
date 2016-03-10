*******************************
Store Import: Technical Details
*******************************

================
Development Mode
================

If you enable the development mode and then use Store Import:

* Any PHP & MySQL errors that occur during the import process will be displayed.

* You'll see the live text log of the import process instead of the default progress bar.

To enable the development mode, find the **config.local.php** file in the root directory of your CS-Cart/Multi-Vendor 4.3.x installation and add the following code to the end of the file::

    define('DEVELOPMENT', true);

====
Logs
====

Even if you don't enable the development mode, you'll find the Store Import logs in the */var/store import/* directory. This directory is created automatically during the import process.

=============================================
Excluding Data from the Actualization Process
=============================================

The **table_replacement.php** file located in the *app/addons/store_import/schemas/store_import* directory of your CS-Cart/Multi-Vendor 4.3.x installation contains the list of all tables in the store database. The tables with the ``//`` symbols before their names will be overwritten during data actualization—**Step 5** of the :doc:`import process <importing_a_store>`.

Let's assume you made some changes in the **Website → Pages** section of the Administration panel during Step 4 of the :doc:`import process <importing_a_store>`. To prevent losing that data during actualization, open **table_replacement.php**, remove the ``//`` symbols in the following lines of the code and save the file::

  //'page_descriptions',

  //'pages',

Now these tables will not be overwritten during the data actualization.

.. warning::

    Be careful when modifying **table_replacement.php**—don't change the file, unless you know exactly what you're doing.
