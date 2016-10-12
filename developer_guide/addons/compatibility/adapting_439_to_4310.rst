***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.10
***********************************************

==============
Common Changes
==============

* *design/themes/responsive/templates/buttons/multiple_buttons.tpl* is no longer supported, but still exists for backwards compatibility. Please don't use it.
    
* Component ``Tygh::$app['server.env']`` was implemented to store the information about the environment the product runs in.

============
Hook Changes
============

---------
New Hooks
---------

1. This hook is executed after the calculation of shipping rates, allowing you to modify them::
    
     fn_set_hook('shippings_calculate_rates_post', $shippings, $rates);

2. This hook is executed before reward points are applied::

     fn_set_hook('set_point_payment', $cart, $cart_products, $auth, $user_info, $cost_covered_by_applied_points, $point_exchange_rate, $user_points);

3. This hook is executed before the reward point data is gathered::

     fn_set_hook('gather_reward_points_data_pre', $product, $auth, $get_point_info);

4. This hook is executes after removing the usage of deleted and disabled languages::

     fn_set_hook('save_languages_integrity_post', $default_lang, $settings_changed);

5. This hook is executed before merging the payment processor response with the order payment info in the store, allowing you to modify the processor response::

     fn_set_hook('update_order_payment_info_before_processing_response', $order_id, $pp_response, $payment_info);

6. This hook is executed right before putting the order payment info in the database, allowing you to modify the SQL query::

     fn_set_hook('update_order_payment_info', $order_id, $pp_response, $payment_info, $data);

7. This hook is executed before changing the order's child order status, allowing you to modify the child order status or prevent the status from being changed::

     fn_set_hook('change_order_status_child_order', $order_id, $status_to, $status_from, $force_notification, $place_order, $child_order_id, $child_status_to, $change_child_status); 

8. This hook modifies filters::

     fn_set_hook('get_filters_products_count_post', $params, $lang_code, $filters); 

-------------
Changed Hooks
-------------

1.

  ::

    // old:
    fn_set_hook('update_image', $image_data, $image_id, $image_type, $images_path, $_data, $mime_type)

    // new:
    fn_set_hook('update_image', $image_data, $image_id, $image_type, $images_path, $_data, $mime_type, $is_clone)

2.

  ::

    // old:
    fn_set_hook('image_zoom_check_image_post', $file_path, $image_data, $images);

    // new:
    fn_set_hook('image_zoom_check_image_post', $file_path, $image_data, $images, $use_original_image_format);

3.

  ::

    // old:
    fn_set_hook('update_destination_pre', $data, $destination_id);

    // new:
    fn_set_hook('update_destination_pre', $data, $destination_id, $lang_code);

==============
Core Functions
==============

-------------
New Functions
-------------

1. Fill empty/missing fields of location data::

     fn_fill_location_fields($location = array(), $prefix = '') 

2. Return image subdirectory::

     fn_get_image_subdir($image_id = 0)

3. Decode the domain name from Punycode::

     \Tygh\Tools\Url::punyDecode()

4. Encode the domain name to Punycode::

     \Tygh\Tools\Url::punyEncode()

5. Get URL port if it exists, return null otherwise::

     \Tygh\Tools\Url::getPort()

6. Set URL port::

     \Tygh\Tools\Url::setPort()

7. Remove a location by identifier::

    fn_delete_destinations($destination_ids)

8. Add or update a location::

    fn_update_destination($data, $destination_id, $lang_code = DESCR_SL)

9. Get the states and countries of locations::

    fn_destination_get_states($lang_code)

10. Get the parameters of the features page::

      fn_get_paginated_product_features($request, $auth, $product_data = array(), $lang_code = DESCR_SL)

--------------------
New Smarty Modifiers
--------------------

``puny_decode``—it decodes the domain name from Punycode and returns the URL. Usage::

  {$url|puny_decode}

-----------------
Changed Functions
-----------------

1.

  ::

    // old:
    function fn_update_image_pairs($icons, $detailed, $pairs_data, $object_id = 0, $object_type = 'product_lists', $object_ids = array (), $update_alt_desc = true, $lang_code = CART_LANGUAGE)

    // new:
    function fn_update_image_pairs($icons, $detailed, $pairs_data, $object_id = 0, $object_type = 'product_lists', $object_ids = array (), $update_alt_desc = true, $lang_code = CART_LANGUAGE, $from_exist_pairs = false)

2.

  ::

    // old:
    function fn_update_image($image_data, $image_id = 0, $image_type = 'product', $lang_code = CART_LANGUAGE)

    // new:
    function fn_update_image($image_data, $image_id = 0, $image_type = 'product', $lang_code = CART_LANGUAGE, $is_clone = false)

3.

  ::

    // old:
    \Tygh\Tools\Url::decode($url)

    // new:
    \Tygh\Tools\Url::decode($url, $return_url = false)

4.

  ::

    // old:
    fn_image_zoom_check_image(&$image_data, &$images);

    // new:
    fn_image_zoom_check_image(&$image_data, &$images, $use_original_image_format = false);
