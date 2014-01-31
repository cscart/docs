********
Debugger
********

CS-Cart ships with a convenient built-in debugger that lets you easily get access to the profiling, logging, and configuration data.

The debugger can be used to inspect HTTP requests, SQL queries, and template loading behind any page of your storefront or admin panel.


Activate Debug Mode
===================

To activate the debug mode in the admin panel, you can just add the ``debug`` param to the URL query string:

.. image:: img/debug_url_param.png
    :align: center
    :alt: debug URL param

To activate the debugger for both the admin panel and storefront, define the ``DEBUG_MODE`` constant in your *config.php* or *local_conf.php* file with the ``true`` value::

    define('DEBUG_MODE', true);

.. important::

    Do not use this method outside of your developent routine. Otherwise, your store visitors can have access to your debug data, which is not good.

Now, if you access your admin panel, you will see a semi-transparent bug icon at the top right corner of the page. Click on it to open and close the debugger sidebar. Alternatively, you can hit ``Ctrl + Alt + D``.


Debugger Sidebar
================

Server
------

In the **Server** tab, you will find general system information and information about PHP and PHP modules insalled in the system: versions, paths, config variable values, etc.


Request
-------

In the **Request** tab, you will information about the latest HTTP request and the respective server response, as well as cookie values.


Config
------

Config
""""""

Values extracted from the configuration files (*config.php* and *local_conf.php*).


Settings
""""""""

Current settings values extracted from the database (the ``cscart_settings_*`` tables).


Runtime
"""""""

...


SQL
---

In this tab, you can see which SQL queries were executed during the page loading with the execution time for each one (*Queries list* and *Queries count*).

Also, you can submit custom SQL queries in the *Queries parse* tab.


Logging
-------

In this tab, you will find data on memory consumption, number of files loaded, SQL queries executed, and time spent on every step of the page loading: before initialization, after initialization, before template loading, and after template loading.


Templates
---------

In the *Templates* tab, you will find detailed information about the template hierarchy and data behind the page.

You can find the template tree and the list of variables used by every template.