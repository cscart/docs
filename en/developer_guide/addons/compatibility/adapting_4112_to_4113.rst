***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.11.3
***********************************************

.. contents::
    :local:
    :backlinks: none

=========
Functions
=========

-------------
New Functions
-------------

#. Get the order statuses that consider the payment received::

     fn_get_settled_order_statuses()

#. Install add-on templates from repository to add-on directories; install add-on language variables; install add-on layouts for each theme::

     fn_reinstall_addon_files($addon)

#. Install add-on layouts for each theme::

     fn_install_addon_layouts($addon)

#. Check if the add-on exists:: 

     fn_check_addon_exists($addon_name)

#. Check if the user is an administrator::

     fn_is_admin_account_type()

#. Check if the theme is active at least on one of the storefronts::

     fn_is_theme_active($theme_name)

-----------------
Changed Functions
-----------------

#.

   ::

     // Old:
     fn_get_feature_data_with_subfeatures($feature_id, $lang_code)

     // New:
     fn_get_feature_data_with_subfeatures($feature_id, $lang_code, $params = [])

#.

   ::

     // Old:
     fn_get_discussion_company_condition($field)

     // New:
     fn_get_discussion_company_condition($field, $company_id = '')

#.

   ::

     // Old:
     fn_get_discussion($object_id, $object_type, $get_posts = false, $params = array())

     // New:
     fn_get_discussion($object_id, $object_type, $get_posts = false, $params = array(), $company_id = '')


=====
Hooks
=====

---------
New Hooks
---------

#. This hook is executed at the end of fetching the order statuses that consider the payment received::

     fn_set_hook('get_settled_order_statuses_post', $settled_order_statuses)

#. This hook is executed at the end of the function, allowing you to modify its results::

     fn_set_hook('discussion_is_user_eligible_to_write_review_for_product_post', $user_id, $product_id, $result, $need_to_buy_first)


#. This hook is executed after the stores/pickup points/warehouses are obtained, allowing you to modify their data::

     fn_set_hook('store_locator_get_store_locations_post', $params, $items_per_page, $lang_code, $data)

#. This hook is executed before SEO URL generation, allowing you to modify the SEO URL::

     fn_set_hook('seo_url_post', $url, $area, $original_url, $prefix, $company_id_in_url, $lang_code, $locations, $parsed_url, $parsed_query, $link_parts, $rewritten, $seo_object, $seo_settings)

-------------
Changed Hooks
-------------

#.

   ::

     // Old:
     fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $existing_company_ids, $product_categories_company_ids);

     // New:
     fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $existing_company_ids, $product_categories_company_ids, $added_company_ids, $deleted_company_ids);
