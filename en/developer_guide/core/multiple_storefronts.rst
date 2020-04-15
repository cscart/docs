********************
Multiple Storefronts
********************

CS-Cart allows you to create multiple storefronts and control them from one administration panel. These storefronts work with the same database, but they can have different designs, products, categories, customers, settings, and design.

You can adapt a storefront for a separate target audience. For example, if you sell clothes, you can create a separate storefront with a different design to sell kids clothes only. You can also make a storefront look like an entirely separate store to your customers.

.. hint::

    `Watch this video on YouTube <https://www.youtube.com/watch?v=eUam0Puui3M>`_ to learn more about storefronts.

=====================
Storefront Management
=====================

You can manage your storefronts under **Administration → Stores**. The main parameters of a storefront are as follows:

* **Storefront name**

* **Storefront URL**—the domain of the storefront, like *example.com*. If the storefront is situated in a subfolder, you must specify it too, for example, *example.com/stores/*. This parameter defines the storefront in the customer area.

CS-Cart uses the following database tables to store the information about storefronts:

* **cscart_companies**—the main parameters of a storefront

* **cscart_company_descriptions**—language-dependent parameters

========================
The Administration Panel
========================

The Administration panel has 3 modes of managing objects:

* **All Stores**—the administrator manages all the objects and settings of the store.

* **Selected Storefront**—the administrator manages one specific storefront.

* **Simple Ultimate**—there is only one storefront, and the administrator can manage all the objects without restrictions.

Scripts work faster in the Simple Ultimate mode, because some of the checks to determine the owner of an object are skipped. To separate the logic within the code, the value of ``Registry::get('runtime.simple_ultimate')`` in the Simple Ultimate mode is set to  ``true``.

The value of ``Registry::get('runtime.company_id')`` will be *0* in the All Stores and Simple Ultimate modes. To get the current storefront ID, use ``Registry::get('runtime.forced_company_id')``.

Some interfaces, like themes, may require the Selected Storefront mode. In this case, the administrator will be offered to choose the storefront.

============
Object Types
============

Objects can be divided in two types: they either have an owner (a specific storefront), or don’t. Below you can the lists of standard CS-Cart objects that have or don’t have an owner. Add-ons may add other objects to either of those lists.

-------------------------------
Objects that Must Have an Owner
-------------------------------

* Product categories
* Pages
* Payment methods
* Product features
* Product options
* Products
* Promotions
* Shipping methods
* Users
* Themes
* Orders
* Filters

All object tables in the database have the ``company_id`` field that defines the owner storefront of an object. Administrators can access the object in the All Stores mode, or by choosing the owner storefront in the Selected Storefront mode.

--------------------------------
Objects that Don’t Have an Owner
--------------------------------

* Languages
* Currencies
* Profile fields

You can edit these objects in the All Stores and Simple Ultimate modes only—they are not directly related to storefronts.

===============
Sharing Objects
===============

CS-Cart has the sharing mechanism to provide access to objects of a storefront from a different storefront. You can have objects specific to one storefront or shared among multiple storefronts.

.. important::

    Only the owner can edit an object. Other storefronts have read access.

------
Schema
------

There is a schema to describe the objects available for sharing. Here’s an example description::

  'shippings' => array(
      'controller' => 'shippings',
      'api' => 'shippings',
      'mode' => 'update',
      'type' => 'tpl_tabs',
      'params' => array(
          'object_id' => '@shipping_id',
          'object' => 'shippings'
      ),
      'table' => array(
          'name' => 'shippings',
          'key_field' => 'shipping_id',
      ),
      'buttons' => array(
          'type' => 'save_cancel',
          'but_name' => 'dispatch[shippings.update_shipping]',
      ),
      'request_object' => 'shipping_data',
      'have_owner' => true,
  ),

Here’s the schema explained. Required fields are marked with *****:

* **controller***—the name of the backend controller, interaction with which will trigger sharing rule processing

* **mode***—the operating mode of the controller, interaction with which will trigger sharing rule processing

* **api**—the name of the API entity, interaction with which will trigger sharing rule processing

* **type**—displaying type; currently only ``tpl_tabs`` is available

* **params**—the array or parameters to be passed to the **Sharing** tab template

* **object_id**—object identifier; you can use @ to get the value of the key from ``$_REQUEST``

* **object**—the name of the object, for example language

* **table**—the array with the information about the object’s table

* **name**—the name of the table

* **key_field**—the primary key

* **request_object**—the name of the key in ``$_REQUEST``; the value of the key will be used to find the current owner storefront

* **have_owner**—the flag that states that the object has an owner storefront and there is the ``company_id`` field in the table

* **conditions**—the array with additional conditions

  * **display_condition**—conditions for displaying the storefront selection tab

  * **skip_selection**—exception conditions for object selection

* **no_item_text**—the symbol code of the language variable, content of which will be displayed on the storefront selection tab

* **pre_processing**—the name of the function to be executed before saving the values to the sharing tables

* **post_processing**—the name of the function to be executed after saving the values to the sharing tables

* **skip_checking_status**—the flag that allows to disable the sharing mechanism when updating the object status

-----------------------------
Objects Available for Sharing
-----------------------------

Currently you can share the following objects among storefronts:

* Product features
* Product options
* Product filters
* Shipping methods
* Payment methods
* Promotions
* Currencies
* Languages
* Profile fields
* Pages

.. note::

    Add-ons can extend the sharing schema and add their own objects to it.

-------------------
The Sharing Process
-------------------

The editing pages of the shareable objects have a special **Share** tab. It will appear depending on the settings specified in the schema. The storefronts listed on the tab will have access to the object. The information about sharing is saved automatically, based on the data from the schema.

Before the query is processed by the current controller, the sharing mechanism intercepts the query and matches it against the schema. If the checks are successful, the mechanism saves the sharing data. 

Shared objects are saved in the **cscart_ult_objects_sharing** table, that has the following fields:

* ``share_company_id``—storefront identifier
* ``share_object_id``—object identifier
* ``share_object_type``—symbol code of the object type

----------------
Object Selection
----------------
When selecting objects described in the schema, the original query will be extended to check the permissions of the current storefront.

Here’s an example of page selection for the storefront with ``company_id = 3``.

**Original query**::

  SELECT cscart_pages.page_id
    FROM cscart_pages
    WHERE page_id = 2

**Extended query**::

  SELECT cscart_pages.page_id
    FROM cscart_pages
    INNER JOIN cscart_ult_objects_sharing ON (
      cscart_ult_objects_sharing.share_object_id = cscart_pages.page_id
      AND cscart_ult_objects_sharing.share_company_id = 3
      AND cscart_ult_objects_sharing.share_object_type = 'pages'
    )
    WHERE page_id = 2

If the **cscart_ult_objects_sharing** table doesn’t have the information about the shared page with ``page_id = 2``, the query will return nothing.

The query extension is done automatically on low level—that way any query made through ``db_query`` can be analyzed and extended. The logic that extends queries is located in the fn_ult_db_query_process function. That function is a processor of the standard  ``db_query_process`` hook. 

To prevent query extension, you can set the value of the ``runtime.skip_sharing_selection`` in ``Registry`` to *true*::

  Registry::set('runtime.skip_sharing_selection', true);

**Debugging tools**:

* CS-Cart Debugger displays all queries in their final form.

* If defined, the ``DEBUG_QUERIES`` constant shows the query in the final form every time the ``db_query`` function is summoned.

* `xdebug <https://xdebug.org/>`_ + `IDE <https://en.wikipedia.org/wiki/Integrated_development_environment>`_. **Xdebug** is a powerful tool for code debugging.

----------------
Sharing Products
----------------

Products are a special type of object—they don’t have their own sharing schema, but they can still be shared among categories. Products are shared via categories: any product can have multiple categories, including those from different storefronts.

You share a product with a storefront by assigning that product to any category of that storefront.

-----------------
Redefining Values
-----------------

If an object is shared with a storefront, you can change the properties of that object for that specific storefront. This is called **redefining values**. For example, a product can have different names, descriptions and prices on different storefronts.

This is implemented separately for every object type. Currently you can redefine values for these objects:

* Products
* Product option variants
* Language variables
* Statuses

""""""""
Products
""""""""

You can redefine the values of the following product properties on different storefronts:

* Name
* Short description
* Full description
* Page title (SEO)
* Meta description (SEO)
* Meta keywords(SEO)
* Search words
* Promo text
* Price

The properties available for redefinition are specified in the code. There are no schemas for simple sharing. CS-Cart uses the following tables to save the values: 

* **cscart_ult_product_prices**
* **cscart_ult_product_descriptions**

"""""""""""""""""""""""
Product Option Variants
"""""""""""""""""""""""

Every storefront can have its own option variant modifiers. CS-Cart stores them in the **cscart_ult_product_option_variants** table.

""""""""""""""""""
Language Variables
""""""""""""""""""

If you edit the values of language variables in the Selected Storefront mode, these values will only be saved for the selected storefront. CS-Cart stores these values in the **cscart_ult_language_values** table.

""""""""
Statuses
""""""""

The following status fields can have different values for different storefronts:

* Email topic
* Email header

CS-Cart uses the **cscart_ult_status_descriptions** to store these values.

----------------
Useful Functions
----------------

* ``fn_get_company_condition``—returns the line, using ``company_id`` as a condition if necessary
* ``fn_ult_get_shared_companies``—returns the identifiers of the storefronts, among which the object is shared
* ``fn_ult_is_shared_product``—checks if a product is shared with this storefront
* ``fn_ult_get_shared_product_companies``—returns the identifiers of the storefront, among which the product is shared
* ``fn_share_object``—shares objects of one storefront with another storefront
* ``fn_share_object_to_all``—shares an object with all storefronts
* ``fn_ult_update_share_object``—shares an object with a specific storefront

========
Settings
========

There are two types of settings:

* **Global setting**—can’t be specified for a particular storefront; available only in the All Stores mode.

* **Store-specific settings**—can have different values for different storefronts; available in the Selected Storefront mode. To edit these settings in the All Stores mode, you need to specify that you update them for all your storefronts.

Every setting defines its own type in the ``edition_type`` field of the **cscart_settings_objects** table. If this field has the line ``VENDOR``, the setting is store-specific, and its values are saved in the **cscart_settings_vendor_values** table.

.. note::

    In the Simple Ultimate mode the values of store-specific settings are saved in the **cscart_settings_objects** table.

You can access the values of the settings for the current storefront from the Registry, for example::

  Registry::get('settings.Appearance.frontend_default_language')

Use the ``Settings`` class to manage settings on the code level—this class has all the necessary methods.

=======================
Defining Storefront URL
=======================

Storefronts can use a separate domain or a subfolder of the main domain. This is specified in the **Storefront URL** and **Secure storefront URL** (for HTTPS) settings. All the logic that handles defining storefront URLs is located in the **fn_init_store_params_by_host** function. 

For the storefronts to work properly, configure your web server to make **index.php** process all the requests sent to nonexistent addresses.

------
Apache
------

CS-Cart comes with the properly configured **.htaccess**. Make sure to allow its use in the web server settings. This code from the **.htaccess** file redirects all the necessary queries to **index.php**::

  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . index.php [L,QSA]

-----
Nginx
-----

When nginx works directly with PHP (FastCGI, php-fpm), configure the redirection rules manually. Here is the part of the configuration file that redirects for nonexistent files and directories to **index.php**::

  location / {
      # Redirecting all requests for nonexistent files and directories to index.php
      try_files $uri $uri/ /index.php?$args;
  }

  location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
      try_files $uri =404;
  }

  location ~ \.php$ {
      include fastcgi.conf;
      fastcgi_pass unix:/var/run/php5-fpm.sock;
  }
