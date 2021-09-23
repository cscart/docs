***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.13.3
***********************************************

.. contents::
    :local:
    :backlinks: none

============
Core changes
============

-----------------
Changed functions
-----------------

#. ::

       // Old:
       fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [])
       // New:
       fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [], $changed = false, $input_object_name = '')

#. ::

       // Old:
       fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, $formatter = null)
       // New:
       fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, $formatter = null, $products_subtotal = null)

#. ::

       // Old:
       fn_get_preview_url($uri, $object_data, $user_id)
       // New:
       fn_get_preview_url($uri, $object_data, $user_id, $lang_code = DESCR_SL)

#. ::

       // Old:
       fn_seo_check_redirect_url($url, $company_id = 0)
       // New:
       fn_seo_check_redirect_url($url, $company_id = 0, $is_destination_url = false)

#. ::

       // Old:
       fn_get_destinations($lang_code = CART_LANGUAGE)
       // New:
       fn_get_destinations($lang_code = CART_LANGUAGE, $params = [])

#. ::

       // Old:
       function fn_bottom_panel_get_redirect_url($from_area, $from_url, $current_area, $current_account_type)
       // New:
       function fn_bottom_panel_get_redirect_url($from_area, $from_url, $current_area, $current_account_type, $user_id)

#. :: 

       // Old:
       fn_yml_get_offers_features()
       // New:
       fn_yml_get_offers_features($company_id = 0)

#. ::

       // Old:
       fn_yml_update_offers_features($features)
       // New:
       fn_yml_update_offers_features(array $features, $company_id = 0)

#. ::

       // Old:
       function fn_mobile_app_update_settings($setting_id, array $settings, $storefront_id = 0)
       // New:
       function fn_mobile_app_update_settings($setting_id, array $settings, $storefront_id = 0, $color_preset = ColorPresets::CUSTOM)

-------------
New functions
-------------

#. Get content of the Content-disposition HTTP header for the specified filename::

       fn_get_content_disposition_header(string $filename)

#. Check if the Vendor plans add-on is active and updates usergroup status::

       fn_vendor_privileges_check_and_update_usergroup_status(array $user_data)

#. Normalize object names for SEO::

       fn_seo_normalize_object_name($_object_name)

#. Get feature purposes by feature IDs::

       fn_get_product_feature_purposes_by_feature_ids($feature_ids)

================
Template changes
================

---------
New hooks
---------

#. ``index:searchanise_init``

#. ``addons:tabs_content``

============
Hook changes
============

-------------
Changed hooks
-------------

#. ::

       // Old:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // New:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);
 
#. ::

       // Old:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // New:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

#. ::

       // Old:
       fn_set_hook('get_destinations', $lang_code, $fields, $joins, $condition, $group, $sorting, $limit);
       // New:
       fn_set_hook('get_destinations', $lang_code, $fields, $joins, $condition, $group, $sorting, $limit, $params);

#. ::
 
       // Old:
       fn_set_hook('change_company_status_before_mail', $company_id, $status_to, $reason, $status_from, $skip_query, $notify, $company_data, $user_data, $result);
       // New:
       fn_set_hook('change_company_status_before_mail', $company_id, $status_to, $reason, $status_from, $skip_query, $notify, $company_data, $user_data, $result, $account);

#. ::

       // Old:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission);
       // New:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes);

---------
New hooks
---------

#. This hook is executed before uninstalling an add-on::

       fn_set_hook('uninstall_addon_pre', $addon_name, $show_message, $allow_unmanaged, $execute_schema_queries);

#. This hook is executed after uninstalling an add-on::

       fn_set_hook('uninstall_addon_post', $addon_name, $allow_unmanaged);

#. His hook allows to change a set of vendor IDs before getting links to the vendor stores::

       fn_set_hook('google_sitemap_write_companies_to_sitemap_before_vendor_stores', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $vendor_stores);

#. This hook modifies pages data for indexing::

       fn_set_hook('se_get_pages_data_post', $pages, $data, $pages_ids, $company_id, $lang_code);

#. This hook extends product feature type mapping::

       fn_set_hook('se_get_feature_type_mapping', $types_map);

#. This hook is executed after placing an order and setting the order status. The hook allows you to process information about the placed order::

       fn_set_hook('place_order_post', $cart, $auth, $action, $issuer_id, $parent_order_id, $order_id, $order_status, $short_order_data, $notification_rules);
