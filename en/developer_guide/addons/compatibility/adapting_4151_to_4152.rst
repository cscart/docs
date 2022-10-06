***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.15.2
***********************************************

.. contents::
    :local:
    :backlinks: none

============
Core Changes
============

---------------
Removed Classes
---------------

#. ``\Tygh\Addons\YandexCheckout\Api\Client``

-----------------
Changed Functions
-----------------

#. ::

       // Old:
       function fn_get_image_pairs($object_ids, $object_type, $pair_type, $get_icon = true, $get_detailed = true, $lang_code = CART_LANGUAGE);
       // New:
       function fn_get_image_pairs($object_ids, $object_type, $pair_type, $get_icon = true, $get_detailed = true, $lang_code = CART_LANGUAGE, $get_all = false);

#. ::

       // Old:
       public function asPrice($price, $currency_code = CART_SECONDARY_CURRENCY, $show_symbol = true, $check_alternative_currency = false);
       // New:
       public function asPrice($price, $currency_code = CART_SECONDARY_CURRENCY, $show_symbol = true, $check_alternative_currency = false, $is_rtl = false);

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed after query parameters are filtered and when the filter type is set. Allows to modify parameters::

       fn_set_hook('vendor_locations_get_products', $params, $filter_types, $fields, $sortings, $condition, $join);

#. This hook is executed after adding a product to cart for creating an order through API request. Allows you to modify cart data::

       fn_set_hook('api_orders_create_after_add_product_to_cart', $params, $status, $data, $valid_params, $this->auth, $cart);

#. This hook is executed after creating a product review. Allows you to work with the created review::

       fn_set_hook('product_reviews_create_post', $product_review_data, $product_review_id);

#. This hook is executed before before checking the product quantity in the cart. Allows you to change the logic of checking product quantity in stock::

       fn_set_hook('check_amount_in_stock_before_cart_amount_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $skip_error_notification);

-------------
Changed Hooks
-------------

#. ::

       // Old:
       fn_set_hook('get_image_pairs_pre', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code);
       // New:
       fn_set_hook('get_image_pairs_pre', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $get_all);

#. ::

       // Old:
       fn_set_hook('get_image_pairs_post', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $pairs_data, $detailed_pairs, $icon_pairs);
       // New:
       fn_set_hook('get_image_pairs_post', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $pairs_data, $detailed_pairs, $icon_pairs, $get_all);

#. ::

       // Old:
       fn_set_hook('product_bundle_service_update_links', $bundle_id, $product_data, $data);
       // New:
       fn_set_hook('product_bundle_service_update_links', $bundle_id, $products_data, $data);

#. ::

       // Old:
       fn_set_hook('get_block_pre', $block_id, $snapping_id, $lang_code);
       // New:
       fn_set_hook('get_block_pre', $block_id, $snapping_id, $lang_code, $dynamic_object);

#. ::

       // Old:
       fn_set_hook('get_block_post', $block, $snapping_id, $lang_code);
       // New:
       fn_set_hook('get_block_post', $block, $snapping_id, $lang_code, $dynamic_object).   

