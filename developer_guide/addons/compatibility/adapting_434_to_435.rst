**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.5
**********************************************


==============
Common Changes
==============

1. **New entities** added to REST API:

   * **Carts**
   * **Pages**
   * **CallRequests**
   * **Discussions**

2. Other changes to REST API:

   * **HybridAuth** library was updated to version 2.4.2
   * ``GET /api/features/:id`` will also contain variant images

3. The **Price list** add-on was totally rewritten—``Tygh\PriceList\AGenerator``, ``Tygh\PriceList\Pdf``, ``Tygh\PriceList\Xlsx`` classes were introduced. The add-on now uses the **XLS Writer** library.

4. The **Trash** category was introduced to store products from the deleted categories.

============
Hook Changes
============

---------
New Hooks
---------

1. Perform actions before setting the session name::

     fn_set_hook('session_set_name_before', $account_type, $sess_postfix);
 
2. Perform actions before processing mail content via Smarty::

     fn_set_hook('smarty_display_mail', $this, $template, $to_screen, $area, $company_id, $lang_code, $original_lang_code, $result);

3. Configure HTMLPurifier before it purifies the given HTML::

     fn_set_hook('sanitize_html', $config_instance, $raw_html);

4. Modify product order details::  

     fn_set_hook('create_order_details', $order_id, $cart, $order_details, $extra);

5. Modify product popularity::

     fn_set_hook('create_order_details_post', $order_id, $cart, $order_details, $extra, $popularity);

6. Perform actions before storing cart content in a customer's profile::

     fn_set_hook('save_cart_content_pre', $cart, $user_id, $type, $user_type);

7. Perform actions after storing cart content in a customer's profile::

     fn_set_hook('save_cart_content_post', $cart, $user_id, $type, $user_type);

8. Process user session products condition::

     fn_set_hook('user_session_products_condition', $params, $conditions);

9. Delete products from abandoned/live carts::

     fn_set_hook('delete_user_cart', $user_ids, $condition, $data);

10. Set the parameters for getting abandoned/live carts::

      fn_set_hook('get_carts', $type_restrictions, $params, $condition, $join, $fields, $group, $array_index_field);

11. Get abandoned/live carts::

      fn_set_hook('get_carts_before_select', $params, $items_per_page, $fields, $join, $condition, $group, $sorting, $limit);

12. Perform actions after getting abandoned/live carts:: 

      fn_set_hook('get_carts_post', $carts_list, $params, $user_ids, $items_per_page, $fields, $join, $condition, $group, $sorting, $limit);

13. Get products of a particular abandoned/live cart::

       fn_set_hook('get_cart_products', $user_id, $params, $fields, $conditions);

14. Perform actions after getting products of a particular abandoned/live cart::

       fn_set_hook('get_cart_products_post', $user_id, $params, $cart_products, $fields, $conditions);

15. Perform actions before getting the list of currencies::

       fn_set_hook('get_currencies_list_pre', $params, $area, $lang_code);

16. Set the parameters for the query that gets currency list::

       fn_set_hook('get_currencies_list_before_select', $params, $area, $lang_code, $join, $order_by, $cond);

17. Gets the list of currencies::

       fn_set_hook('get_currencies_list_post', $params, $area, $lang_code, $currencies);

18. Perform actions before initializing currencies::

       fn_set_hook('init_currency_pre', $params, $area);

19. Set currencies::   

       fn_set_hook('init_currency_post', $params, $area, $primary_currency, $secondary_currency);

20. Select user data::

       fn_set_hook('auth_routines', $request, $auth, $field, $condition, $user_login);

-------------
Changed Hooks
-------------

1. ``fn_set_hook('save_cart', $cart, $user_id, $type);`` is now deprecated and will be removed in version 5.x. Use the ``save_cart_content_post`` hook instead.

2.

  ::

    // old:
    fn_set_hook('is_cart_empty', $cart, $result);

    // new: 
    fn_set_hook('is_cart_empty', $cart, $result, $check_excluded);

==============
Core Functions
==============

-------------
New Functions
-------------

1. ``Tygh\Shippings\Shippings::hasEnabledShippings($company_id)``—checks if shippings are enabled for the company. Replaces the ``Registry::get('settings.General.disable_shipping')`` setting, which was removed.

2. ``Tygh\Shippings\Shippings::isFreeShipping($shipping)``—checks if a shipping method can be used with the **Free shipping** product option;
    
3. ``Tygh\Tools\Math class was added``—contains methods commonly used for mathematic operations:

    * ``floorToPrecision($x, $precision)``—floors the given number to the given precision
    * ``ceilToPrecision($x, $precision)``—ceils the given number to the given precision
    * ``floor($x)``—replaces the ``floor()`` PHP function and doesn't return floats like 1.999999...

4. ``Tygh\Tools\SecurityHelper::generateRandomString()``—generates a random string.

5. ``Tygh\Tools\Url::normalizeEmail($email)``—normalizes an email address and punycodes it.

6. ``fn_user_session_products_condition($params = array())``—gets an SQL condition to manipulate the **?:user_session_products** table.

7. ``fn_delete_user_cart($user_ids, $data = '')``—deletes products from abandoned/live carts.

8. ``fn_get_carts($params, $items_per_page = 0)``—gets abandoned/live carts.

9. ``fn_get_cart_products($user_id, $params = array())``—gets the products of a particular abandoned/live cart.

10. ``fn_get_filter_is_numeric_slider($filter_data)``—checks if the given filter appears as a numeric slider.

11. ``fn_create_trash_category($company_id)``—creates the trash category.

12. ``fn_get_trash_category($company_id)``—returns the identifier of the trash category.

13. ``fn_is_trash_category($category_id)``—checks if the category is used for trash.

14. ``fn_add_product_to_trash($product_id, $trash_category_id)``—adds a product to the trash category.

15. ``fn_trash_orphaned_products($category_ids)``—moves products that are left without categories in their store to the trash category.

16. ``fn_empty_trash($trash_category_id)``—deletes products from the trash category.

17. ``fn_promotion_generate_bonus_coupon($bonus, $bonus_id, $cart)``—generates a bonus coupon for an order.

-----------------
Changed Functions
-----------------

1. ``Tygh\Backend\Storage\ABackend::_generateName()`` was **renamed to** ``Tygh\Backend\Storage\ABackend::generateName()`` and became a public method.

2. ``Tygh\Tools\Url::build()``: ``php -public function build($encode = false) +public function build($encode = false, $puny = false)``

3.

  ::

    // old:
    function fn_cart_is_empty($cart)

    // new:
    function fn_cart_is_empty($cart, $check_excluded = true)

4.

  ::

    // old:
    function fn_get_category_data($category_id = 0, $lang_code = CART_LANGUAGE, $field_list = '', $get_main_pair = true, $skip_company_condition = false, $preview = false)

    // new: 
    function fn_get_category_data($category_id = 0, $lang_code = CART_LANGUAGE, $field_list = '', $get_main_pair = true, $skip_company_condition = false, $preview = false, $get_full_path = false)

