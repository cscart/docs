**************************
The Main Schema—blocks.php
**************************

This is the format to describe the block types available for use:

::

   $schema = array(
       // Unique identifier of the block type => an array with parameters
       'unique_block_type' => array(
           'settings' => array(),
           'templates' => array(),
           'cache' => array(),
           ...
       ),
   );

================
Settings (Array)
================

-----------
Description
-----------

The **settings** array includes the settings of the block that can be specified on the block editing page under **Design → Layouts → Block options**.

The settings are a list of ``key - value`` pairs: the ``key`` serves as the identifier of the setting, and the ``value`` is an array that describes the type and behaviour of the setting. A key must have a corresponding language variable to define the name of the setting on the block editing page.

This is how a list of settings of the block looks like:

::

    'settings' => array(
    	    'ip_address' => array(
       	     'type' => 'text',
        	    'default_value' => '127.0.0.1',
    	    ),
    	    ...
	    ),

--------------------
Available Parameters
--------------------

* **type** (string)—one of the following types of the setting

  * **checkbox**—a checkbox

  * **input**—an input field

  * **selectbox**—a <select> field

  * **input_long**—an input field with the ``input-text-long`` class

  * **multiple_checkboxes**—a list of checkboxes

  * **text**—a WYSIWYG text input field

  * **simple_text**—a simple non-WYSIWYG text input field

  * **picker**—a picker

  * **template**—instead of the setting you’ll see the template you specify here
  
  * **enum**—enumeration of objects; used only in the content section

* **required** (bool)—if true, this field of the block settings will be mandatory

* **option_name** (string)—the name of the language variable of the setting; if the name is not specified, the identifier of the setting will be used instead

* **default_value** (mixed)—the default value of the setting

* **values** (array)—the list of the possible options for the settings like **selectbox** and **multiple_checkboxes**. It is an array of ``key - value`` pairs: the ``key`` is the name of the option that is stored in the database; the ``value`` is the name of the language variable that stores the name of the option; or, if **no_lang** is ``true``, it is the actual name of the option

* **no_lang** (bool)—if ``true``, the list of the values of the options will be displayed in the admin panel as is; if ``false``, values will be treated as language variables

* **values_settings** (array)—this parameter specifies the list of options and other settings that will appear if certain options of the parent list are chosen; works only with the **selectbox** type

**Example usage:**

::

    'settings' => array(
        'foo' => array(
            'type' => 'selectbox',
            'values' => array (
                'products' => 'products',
            ),
            'values_settings' => array(
                'products' => array(
                    'settings' => array(
                        'rss_sort_by' => array(
                            'type' => 'selectbox',
                            'values' => array(
                                'A' => 'rss_created',
                                'U' => 'rss_updated'
                            ),
                        ),
                        'rss_display_sku' => array (
                            'type' => 'checkbox',
                        ),
                    )
                )
            )
        )
    );

* **picker** (string)—the path to the template of the picker; use with the **picker** type only

* **picker_params** (array)—the settings of the picker; use with the picker type only

* **remove_indent** (bool)—if true, the setting won’t have the indent on the right in the admin panel

* **template** (string)—the path to the template; use with the **template** type only

=================
Templates (Array)
=================

The **templates** array includes the list of the templates.

::

  'path to the template' => array (
    'settings' => 'A list of settings (see below)',
    'fillings' => 'An array of fillings available for the template. Other fillings are excluded from the list automatically.',
    'params' => 'An array of parameters to be passed to the block elements retrieval function.',
    'bulk_modifier' => 'A bulk modifier—a function that applies to all the elements of the block before the output.'
   ),

When a schema is generated, all the information included in the ``template`` parameter of the block schema will be added to the parameters specified in **templates.php**. The path to the template serves as the key.

The **template** parameter in the block schema may include:

A. The list of paths to the templates with all their parameters—this way no information from the templates.php file is required.

B. The list of paths to the templates—all the parameters for the corresponding keys are specified in the templates.php file.

C. The path to the directory with the templates—all the parameters for the corresponding keys are specified in the templates.php file.

D. The name of the function that returns the list of the templates—all the parameters for the corresponding keys are specified in the templates.php file or returned by the function.

================
Wrappers (Array)
================

The **wrappers** array may include the list of wrappers or the path to the folder with wrappers. Wrappers don’t have additional parameters.

===============
Content (Array)
===============

A block may include any number of variables, that are later passed to the template. For example, we have a block like this: 

::

    'test_block' => array (
            'content' => array(
                'some_value' => array(
                    'type' => 'text',
                )
            )
        )

Then the block settings in the admin panel will include the text input field. In the customer area, the template of this block will have the ``{$some_value}`` variable, which you can specify in the admin panel.

You can specify any setting (see above), enumeration or function in the **content** array.

Settings work simple: the user specifies them in the admin panel and they are passed to the template.

Use the **enum** (enumeration) setting type to define lists of elements with different fillings, for example, the list of products or categories.

See the list of **enum** parameters below:

::

     'name_of_the_variable' => array (
          'type' => 'enum',
          'object' => 'The name of the dynamic object in the schema.'
          'items_function' => 'Item generation function'
          'fillings' => array ( // Filling types.
              'manually' => array ( // Manual filling. Requires picker parameters.
                  'picker' => 'pickers/companies/picker.tpl',
                  'picker_params' => array (
                      'multiple' => true,
                  ),
              ),
              'some_other_filling' => array (
                  'params' => array (

                  ),
              ),
          ),
      ),

You can create the ``params`` section to store the parameters of a non-manual filling. These parameters will be passed to the item generation function. You can also specify the **settings** of a filling, just like you do it for templates or blocks. 

If you use a function as an element of **content**, then the result returned by the function will be the value of this variable:

::

     'name_of_the_variable' => array (
          'type' => 'function',
          'function' => array('fn_get_languages'[, 'param1'][, 'param2'][..]),
      ),

==================
Cache (Bool/Array)
==================

The **cache** (bool/array) includes general caching settings of the block. If the parameter is set to ``false`` or not specified, and there is no entry in the **cache_overrides_by_dispatch** section for the current parameter, the block won’t cache.

---------------
Possible Values
---------------

* ``false``—the block won’t cache

* ``true``—the block will cache according to the global block caching settings from the **block_cache_properties** scheme

* ``array``—an array with the caching settings of the block; the parameters specified in this array will be added to the global block caching settings from the **block_cache_properties** scheme

--------------------
Available Parameters
--------------------

There are several parameters that specify how a block is cached. The parameters are not required, unless stated otherwise.

* **update_handlers** (array)—the list of database tables (without prefixes), changes to which will invalidate the cache of the block. By changes we mean adding, editing or removing entries and modifying the structure of the tables with the CS-Cart tools, like functions and methods for working with databases. For example, a block that displays the list of users should have the ``users`` and ``user_profiles`` tables as **update_handlers**.

When generating the entry key in the cache, you can use serialized values of different variables and parameters for this block. List the required parameters in the arrays described below:

* **request_handlers** (array)—the list of the names of the HTTP-request parameters (the keys in the ``$_REQUEST`` array). For example, if you specify the ``category_id`` and ``sort_by`` parameters, then the line like ``...|category_id=10|sort_by=price;`` will be added to the key—that allows to use different entries in the cache for every combination of the values of these parameters.

* **session_handlers** (array)—the list of the names of the variables in the user’s session (the keys in the ``$_SESSION`` array). For example, if you specify the ``items_per_page`` parameter here, there will be a separate entry in the cache for every value of ``$_SESSION['items_per_page']``

* **cookie_handlers** (array)—the list of the parameter names in the user’s cookies (the keys in the array returned by ``fn_get_session data()``)

* **auth_handlers** (array)—the list of the keys in the ``$_SESSION['auth']`` array

Use special forms to enter the values for **request_handlers**, **session_handlers**, **cookie_handlers**, and **auth_handlers**

    * Use Dot-syntax to access the nested elements. For example, use ``'session_handlers' => array('auth.user_id')`` to select ``$_SESSION['auth']['user_id']``

    * Select all values with *****: for example, ``'session_handlers' => array('*')`` selects all the values in the ``$_SESSION`` array. When the cache key is generated, the entire serialized ``$_SESSION`` array will be used

    * Comparison operators

::

  'auth_handlers' => array(
      'user_id' => array('gt', 0),
  ),

The entry above selects the value of ``$_SESSION['auth']['user_id']`` and adds it to the cache key, but only if the value is above 0. 

**Available Comparison Operators**

    * ``gt``—greater than

    * ``eq``—equal to

    * ``neq``—not equal to

    * ``lte``—less than or equal

    * ``lt``—less than

    * ``gte``—greater than or equal

    * ``cont``—contains this substring

    * ``ncont``—doesn’t contain this substring

    * ``in``—in the array

    * ``nin``—not in the array

The cache key can also include the results of the summoned functions and methods:

* **callable_handlers** (array)—the list of the parameter names and corresponding functions. The results of the summoned functions will be used as the values for these parameters.

::

  'callable_handlers' => array(
      'currency' => array('fn_get_secondary_currency'),
  ),

The entry above adds ``|currency=RUB`` to the cache key.

This is how to describe the function to be summoned: ``array(Callable[, Args])``. 

**Callable** is the string with the name of the function, or any other value expression that can be summoned with ``call_user_func()`` (`learn about Callables at php.com <http://php.net/manual/en/language.types.callable.php>`_). 

**Args** is a non-mandatory array that lists the arguments to be passed to the function. If an argument is a string that begins with ``$``, it will be treated as the name of the variable, if it is a global variable (``$_REQUEST``, …) or one of the variables from $block_schema and $block_data.

  * ``$block_schema``—contains the schema of the block

  * ``$block_data``—contains the information about the block from the database

::

  'callable_handlers' => array(
      'layout' => array('fn_get_products_layout', array('$_REQUEST')),
      'settings' => array('fn_foo_addon_cache_key_handlers', array('$block_data')),
  ),

The code above adds the results of all summoned functions to the entry key in the cache.

* **disable_cache_when** (array)—specifies the rules for disabling cache for this block. You can use the **request_handlers**, **session_handlers**, **cookie_handlers**, **auth_handlers** and **callable_handlers** in the same format, as in the cache settings section, but these parameters work differently:

::

  'cache' => array(
      'request_handlers' => array('sort_by', 'items_per_page'),
      'auth_handlers' => array(
          'user_id' => array('gt', 0)
      ),
      'disable_cache_when' => array(
          'request_handlers' => array('sort_by', 'items_per_page'),
          'auth_handlers' => array(
              'user_id' => array('gt', 0)
          ),
      ),
  ),

Here’s what different about the work of these parameters in the cache and disable_cache_when sections:

 * **cache**: the values of ``$_REQUEST['sort_by']`` and ``$_REQUEST['items_per_page']`` will be serialized and added to the cache key of the block. The value ``$auth['user_id']`` will be serialized and added to the key only if the value is greater than 0 

 * **cache.disable_cache_when**: if the ``$_REQUEST`` array has ``sort_by`` or ``items_per_page``, the block won’t cache; the block also won’t cache, if the ``$auth`` array has the ``user_id`` key with the value greater than 0

 The **callable_handlers** parameter also behaves differently in the **cache.disable_cache_when** section: if the function returns ``true``, the block won’t cache, and the other way round.

* **regenerate_cache_when** (array)—describes the rules of cache invalidation for this block; it works the same way as **cache.disable_cache_when**.

* **cache_overrides_by_dispatch** (array)—describes the parameters of block cache for every separate dispatch as 		array('dispatch' => cache_params, ...)``

  The **cache_params** array stores caching parameters for the specified dispatch. If the array has an entry for the current ``dispatch``, then the caching parameters will come from this entry, rather than from the general block caching settings in the **cache** section. Every nested array of caching parameters for a ``dispatch`` may use the same parameters, as the cache section.

For example:

::

  'cache' => array(
      // These caching parameters will be used everywhere, except for the category page
      'update_handlers' => array('users'),
  ),
  'cache_overrides_by_dispatch' => array(
      // These caching parameters will be used on the category page
      'categories.view' => array(
          'update_handlers' => array('users', 'products'),
      ),    
  ),

* **hide_on_locations** (array)—the list of dispatches where the block can’t be used. For example, use the following piece of code to forbid adding the block on the cart page:

::

  'hide_on_locations' => array('checkout.cart'),

* **single_for_location** (bool)—if ``true``, then every dispatch can only have one block of this kind; if this parameter is not specified, it is interpreted as false

* **multilanguage** (bool)—determines if this block needs multi-language support. If ``true``, the content of the block will be determined by the language. If this parameter is not specified, it is interpreted as ``false``.
