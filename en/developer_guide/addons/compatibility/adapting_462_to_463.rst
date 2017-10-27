**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.6.3
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to change discussion parameters before they are processed and recorded to the database::

     fn_set_hook('update_discussion_pre', $data);

#. This hook allows you to access the discussions that were already processed and recorded to the database::

     fn_set_hook('update_discussion_posts_post', $posts);

#. This hook allows you to access the data of discussions after that data was formatted, recorded to the database, and sent to users by email::

     fn_set_hook('add_discussion_post_post', $post_data, $send_notifications);

#. This hook allows you to change product subscription parameters before they are processed and recorded to the database::

     fn_set_hook('update_product_notifications_pre', $data);

#. This hook allows you to change product subscription parameters before deleting the record from the database::

     fn_set_hook('update_product_notifications_before_delete', $data, $where);

#. This hook allows you to add or remove fields before fetching product subscriptions data from the database::

     fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields);

#. This hook is executed after the commission amount was calculated for a payout. It allows you to modify payout data::

     fn_set_hook('vendor_plans_calculate_commission_for_payout_post', $order_info, $company_data, $payout_data);

-------------
Changed Hooks
-------------

#.

  ::

    // old:
    fn_set_hook('get_banners', $params, $condition, $sorting, $limit, $lang_code);

    // new:
    fn_set_hook('get_banners', $params, $condition, $sorting, $limit, $lang_code, $fields);

#.

  ::

    // old:
    fn_set_hook('delete_product_option_post', $option_id, $pid, $option_deleted);

    // new:
    fn_set_hook('delete_product_option_post', $option_id, $pid, $option_deleted, $product_id);

==============
Core Functions
==============

-------------
New Functions
-------------

#. Get user auth token::

      fn_get_user_auth_token($user_id, $ttl = 604800)

#. Build uniform resource name with query string::

      \Tygh\Tools\Url::buildUrn($dispatch, array $query_params = array())

#. Get the communication protocol to use for URLs when accessing a store in the console mode::

      fn_get_console_protocol($area)

#. Get the average rating of an object (a product, for example)::

      fn_discussion_get_average_object_rating($object_id, $object_type)

-----------------
Changed Functions
-----------------

#.

  ::

    // old:
    function fn_get_product_options_data($cart_products, $_cart)

    // new:
    function fn_get_product_options_data($cart_products, $_cart, $params)


#.

  ::

    // old:
    function fn_change_product_data_in_cart($cart_products, $_cart)

    // new:
    function fn_change_product_data_in_cart($cart_products, $_cart, $params)


#.

  ::

    // old:
    function fn_paypal_payment_form($processor_data, $token)

    // new:
    function fn_paypal_payment_form($processor_data, $token, $return = false)

#.

  ::

   // old:
   function fn_paypal_get_error($result)

   // new:
   function fn_paypal_get_error($result, $show_notification = true, $return_type = 'text')

#.

  ::

    // old:
    Tygh\Addons\ProductVariations\Product\Manager::getProductFieldValue($product_id, $field, $default = null)

    // new:
    Tygh\Addons\ProductVariations\Product\Manager::getProductFieldValue($product_id, $field, $default = null, $ignore_cache = false)
