**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.7
**********************************************

==============
Common Changes
==============

1. Upgrade Center. The schema of a content upgrade package is now an object of ``\Tygh\UpgradeCenter\ContentSchema``. 

   Backward compatibility is preserved. You can use this schema as an object in your own upgrade validators.

2. Behaviour of the ``{btn}`` backend template function has changed:

 * Permission checks for the ``$href`` parameter now use the GET method. Permission checks for ``$dispatch`` use POST.

 * The ``method`` parameter has been added. Its value can be GET or POST. This parameter affects permission checks. Also, if ``method == "POST"``, the ``cm-post`` class will be added to the link automatically.

 * We don't recommend passing ``cm-post`` in the ``$class`` parameter.

3. All requests performed with methods of ``\Tygh\Http`` class now have default connect timeout value of 10 seconds.

============
Hook Changes
============

---------
New Hooks
---------

1. Check if an order is available for a customer::

     fn_set_hook('is_order_allowed_post', $order_id, $auth, $allowed);

2. Perform actions before order placement redirect on checkout::

     fn_set_hook('checkout_place_orders_pre_route', $cart, $auth, $params);

3. Modify the get languages list by specified parameters SQL query parameters::

     fn_set_hook('get_languages', $params, $hash_key, $field_list, $join, $condition, $group_by, $order_by, $limit);

4. Modify the all languages list SQL query parameters::

     fn_set_hook('get_all_languages', $edit, $field_list, $join, $condition, $group_by, $order_by, $limit);

5. Modify the simple languages list SQL query parameters::

     fn_set_hook('get_simple_languages', $include_hidden, $field_list, $join, $condition, $group_by, $order_by, $limit);

6. Modify the available languages list SQL query parameters::

     fn_set_hook('get_available_languages', $area, $include_hidden, $field_list, $join, $condition, $group_by, $order_by, $limit);

-------------
Changed Hooks
-------------

1. ``fn_set_hook('is_order_allowed', $order_id, $allowed);`` is now deprecated.

2. 

  ::

    // old:
    fn_set_hook('buy_together_get_chains_pre', $parms, $auth, $lang_code);

    // new:
    fn_set_hook('buy_together_get_chains_pre', $params, $auth, $lang_code);

3.

  ::

    // old:
    fn_set_hook('convert_price_pre', $price);

    // new:
    fn_set_hook('convert_price_pre', $price, $currency_code);

4.

  ::

    // old:
    fn_set_hook('convert_price_post', $result, $price);

    // new:
    fn_set_hook('convert_price_post', $result, $price, $currency_code);

5.

  ::

    // old:
    fn_set_hook('send_form', $page_data, $form_values, $result, $from, $sender, $attachments, $is_html);

    // new:
    fn_set_hook('send_form', $page_data, $form_values, $result, $from, $sender, $attachments, $is_html, $subject);


==============
Core Functions
==============

-------------
New Functions
-------------

1. Check if the table exists in the database::

     \Tygh\Database\Connection::hasTable($table_name, $set_prefix = true)

2. Short code for ``\Tygh\Database\Connection::hasTable``, check if the table exists on current connection::

     db_has_table($table_name, $set_prefix = true)

3. Gets a subscriber identifier by email::

     fn_get_subscriber_id_by_email($email = '')

4. Find a product feature group id by the name::

     fn_exim_find_feature_group_id($name, $lang_code)

5. Find a product feature id by params::
  
     fn_exim_find_feature_id($name, $type, $group_id, $lang_code)
    

6. Extract an add-on package to a temporary directory::

     fn_extract_addon_package($file_name)

7. Validate an ad-on package structure::

     fn_validate_addon_structure($addon_name, $path)

8. Get the list of subscribers::

     fn_get_subscribers($params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

9. Update subscribers and subscriptions::

     fn_update_subscriber($subscriber_data, $subscriber_id = 0)

10. Check if an order is available to view for a customer::

     fn_is_order_allowed($order_id, $auth)

11. Check access permissions to a thread object (e.g. an order)::

     fn_discussion_check_thread_permissions($thread, $auth)

12. Provide the token and handle errors for checkout with In-Context Checkout::

     fn_paypal_checkout_place_orders_pre_route(&$cart, $auth, $params)

13. Get an email subject for the submitted form::
 
     fn_form_builder_get_form_subject($form_structure, $form_data)

14. Sort the multi-level tree::

     fn_sort_tree($items, $subitems_field = 'subitems', $order_by = array('position'), $order = 'asc')

15. Return the session identifier contained in the HTTP request or nulls, if the request doesn't contain the session ID::

     \Tygh\Web\Session::requestGetSessionID()

16. Get modified files::

     \Tygh\Snapshot::getModifiedFiles($ext = 'php', array $directories = array(), array $exclude = array()) 

-----------------
Changed Functions
-----------------

1.

  ::

    // old:
    function db_paginate(&$page, $items_per_page, $total_items = 0)

    // new:
    function db_paginate(&$page, &$items_per_page, $total_items = 0)

2.

  ::

    // old:
    function fn_blog_get_pages($params, $join, $condition, $fields, $group_by, &$sortings, $lang_code)

    // new:
    function fn_blog_get_pages(&$params, $join, $condition, $fields, $group_by, &$sortings, $lang_code)
