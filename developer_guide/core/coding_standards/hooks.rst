*****
Hooks
*****

Each :doc:`hook <../../addons/hooking/index>` must have a comment with the description of the hook itself (e.g. entry point or the purpose of this hook) and the description of its parameters (for :doc:`PHP-hooks <../../addons/hooking/index>` only).

Hooks base is available at http://www.cs-cart.com/api.

===================
General Information
===================

1. Hooks are used by developers to extend functions. So it is best to include as much parameters as possible into hooks.

2. The name of the hook must include the name of the function.

3. Prefixes are prohibited. Only suffixes are allowed.

4. If you have a complex function that includes lots of hooks, you can name hooks using this example:

   Function::

     get_cart_product_data

   Hook::

     fn_set_hook('get_cart_product_data_post_options', $product['product_id'], $_pdata, $product);

5. Parameters in a hook must always begin with the parameters accepted by the function. The exception is SQL-hooks where everything required is included into the ``params`` variable.

6. As their first parameter hooks in the classes must pass the class instance.

==========================
How and Where to Add Hooks
==========================

Let's assume that each function must contain at least two hooks:

1. **pre hook** of the ``get_product_name_pre`` type at the beginning of the function. All parameters accepted by the function must be passed to this hook.

2. **post hook** of the ``get_product_name_post`` type at the end of the function. First, this hook receives all parameters accepted by the function; second, a parameter returned by the function; and third, other auxiliary parameters.

Also there are might be other extra hooks:

3. **sql hook** of the ``get_product_name`` type. All SQL-variables are passed in this hook. It is recommended to create all ``$fields``, ``$condition``, ``$sorting``, ``$limit``, etc. values even if you think that it is unnecessary. You can leave them empty. For example::

     fn_set_hook('get_product_name', $product_id, $lang_code, $as_array, $field_list, $join, $condition);

4. **extra hooks**. As an example we will use products selection::

     fn_set_hook('get_products_before_select', $params, $join, $condition, $u_condition, $inventory_condition, $sortings, $total, $items_per_page, $lang_code, $having);

Some of the hooks do not fit the standards mentioned. In this case the comment like this one is used::

  /**
   * Deprecated: This hook will be removed in version 4.x or 3.3.x. Use get_product_price_pre instead.
   */

Also the hook with the new format is added, in our case it's ``get_product_price_pre``.

.. note::

    If a new argument was added to a function, do NOT create new and deprecate old hooks in this function! Instead we add an argument to the end of already existing hooks. In this case, it's okay to break the correct order of arguments in the function.

====================
Hook Format Standard
====================

The formats for comments from `the hooks base <http://www.cs-cart.com/api>`_ are provided below.

-----------------------
PHP-hooks and Functions
-----------------------

The format of comments was borrowed from PHPDocumentor. This format of comments must be applied everywhere and to all functions.

The Doxygen program is used to generate documentation (here's `the manual <http://cs.swan.ac.uk/%7Ecsoliver/ok-sat-library/internet_html/doc/doc/Doxygen/1.7.1/html/index.html>`_).

How to write comments: main rules and recommendations:

1. A comment starts with a capital letter. No period at the end of the comment.

2. A verb to describe a purpose of function is used in the third-person singular, e.g. *Gets user data*.

3. Names and values of variables, file paths, file names and other personal names are highlighted with italics with HTML-tag. For example: Function *foo* (in *foo/bar/functions*) accepts parameter *$bar*

4. In the description the function is defined as ``class::function``; the function without class is defined as ``::function``. For example::

     <?php

     /** ...
     *      - period - If defined, get pages by time period. ::fn_create_periods</li>
     * ...
     */
     ?>

5. Describe the variable so that it was clear why it is used in this function.

For example::

  <?php

  /**
   * Processes cart data after calculating all prices and other data (taxes, shippings etc)
   *
   * @param array  $cart               Cart data
   * @param array  $cart_products      Cart products
   * @param array  $auth               Auth data
   * @param string $calculate_shipping // 1-letter flag
   *      A - calculate all available methods
   *      E - calculate selected methods only (from cart[shipping])
   *      S - skip calculation
   * @param bool $calculate_taxes       Flag determines if taxes should be calculated
   * @param bool $apply_cart_promotions Flag determines if promotions should be applied to the cart
   */
  fn_set_hook('calculate_cart', $cart, $cart_products, $auth, $calculate_shipping, $calculate_taxes, $apply_cart_promotions);
  ?>

  <?php

  /**
   * Change SQL parameters for product data select
   *
   * @param int $product_id Product ID
   * @param string $field_list List of fields for retrieving
   * @param string $join String with the complete JOIN information (JOIN type, tables and fields) for an SQL-query
   * @param mixed $auth Array with authorization data
   * @param string $lang_code Two-letter language code (e.g. 'en', 'ru', etc.)
   * @param string $condition Condition for selecting product data
   */
  fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition);
  ?>


.. important::

    The comment must be placed right before the hook

---------
TPL-hooks
---------

Smarty-templates:

.. code-block:: smarty

    {** Dynamic menu item (on the navigation) *}
    {hook name="index:dynamic_menu_item"}
    ...
    {/hook}

    {** Hooks for CSS styles *}
    {hook name="index:styles"}{/hook}

.. important::

    The opening tag must always be used with two star signs and the closing tag—with one star. This way the ordinary comments are distinguished from the hook comments. 

--------
JS-hooks
--------

For example:

.. code-block:: javascript


    /**
     * Hook description
     */
    var hook_data = {
        'append_obj_content': append_obj_content, // int Id of bla bla
        'var_prefix': prefix, // string Prefix of var
        'object_html': unescape(append_obj.html()), // string Object
        'var_id': id, // int ID of var
        'item_id': js_items[id] // int Item ID
    };

    $.ceEvent('trigger', 'ce.picker_add_js_item', [hook_data]);

First goes the comment with the event description, second—the variable of the object with parameters, and third—calling of the event.

In the comments to the passed parameters the first word is the type of a variable, and everything else is the description.

