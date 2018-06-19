**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.8.1
**********************************************

==============
Common Changes
==============

------------------------------------------
Technical changes in PayPal IPN processing
------------------------------------------

PayPal sends Instant Payment Notifications (IPN). They automatically change the order status in CS-Cart according to the settings of the **PayPal payments** add-on.

**Previously** CS-Cart fully recalculated the relevant order when an IPN was received. It caused a few side effects and could lead to errors in third-party add-ons.

**Now** CS-Cart processes IPNs in a simpler a faster way, and no longer recalculates the order. If your third-party add-ons had custom fixes to the side effects caused by order recalculation during IPN processing, these fixes are no longer necessary.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook changes the values in the array of product identifiers before the approval status of those products (introduced by the **Vendor data premoderation** add-on) is changed::

     fn_set_hook('change_approval_status_pre', $product_ids, $status);

#. This hook is executed when promotions are applied, before the list of applicable promotions is obtained::

     fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions);

#. This hook is executed before the list of shipping methods is obtained in the administration panel::

     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition);

#. This hook is executed for each product filter and can be used for extending search parameters to search products by product fields::

     fn_set_hook('generate_filter_field_params', $params, $filters, $selected_filters, $filter_fields, $filter, $structure);

#. This hook allows you to extend/modify standard product filters parameters, such as ``$variant_values``, ``$range_values``, ``$field_variant_values``, ``$field_range_values``::

     fn_set_hook('get_current_filters_post', $params, $filters, $selected_filters, $area, $lang_code, $variant_values, $range_values, $field_variant_values, $field_range_values);

#. This hook allows you to modify the values that the payout calculation is based on::

     fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission);

-------------
Changed Hooks
-------------

::

  // Old:
  fn_set_hook('get_filters_products_count_post', $params, $lang_code, $filters);

  // New:
  fn_set_hook('get_filters_products_count_post', $params, $lang_code, $filters, $selected_filters);

-------------
Deleted Hooks
-------------

#. ``fn_set_hook('amazon_validate_cart', $items, $cart, $cart_items_amount);``

#. ``fn_set_hook('amazon_calculate_promotions', $callback_response, $cart, $processor_data);``

#. ``fn_set_hook('amazon_validate_cart_item', $cart, $sku, $qty, $cart_id, $is_valid);``

#. ``fn_set_hook('amazon_products', $amazon_products, $cart);``


==============
Core Functions
==============

-------------
New Functions
-------------

#. Get the subscriber email by identifier::

     fn_newsletters_get_subscriber_email_by_user_id($user_id)

#. Get the default product options::

     Tygh\Addons\ProductVariations\Product\Manager::getDefaultVariationOptions($product_id);

#. Update the default variation::

     Tygh\Addons\ProductVariations\Product\Manager::getDefaultVariationOptions\Product\Manager::updateDefaultVariation($variation_product_id = 0, $parent_product_id = 0)


#. Fetch plain list of categories by provided IDs, with all their parent categories (parent format is ``array('parent_id' => 'parent_name')``)::

     function fn_get_categories_list_with_parents(array $category_ids, $lang_code = CART_LANGUAGE)

#. Update the prices of product variations::

     Tygh\Addons\ProductVariations\Product\Manager::updateProductVariationsPrices($product_id, $price, $prices, $auth)

-----------------
Changed Functions
-----------------

::

  // Old:
  \Tygh\Shippings\RusPickpoint::zonesPickpoint($url_zone, $data_zone, $data_url)

  // New:
  \Tygh\Shippings\RusPickpoint::zonesPickpoint($url_zone, $data_zone, $data_url, $delivery_mode = '')


--------------------
Deprecated Functions
--------------------

#. ``fn_check_addon_permission`` is now deprecated; the related ``addons`` section of the ``permissions/vendor`` schema has been removed.

---------------------------------------------
Deleted Functions Specific to Russian Version
---------------------------------------------

#. ``fn_yml_export_import_ym($params)``

#. ``fn_yml_export_import_products($price_ids)``

#. ``fn_yml_export_import_categories($price_ids)``

#. ``fn_yml_export_import_settings()``
