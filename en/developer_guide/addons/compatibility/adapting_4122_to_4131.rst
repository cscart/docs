***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.13.1
***********************************************

.. contents::
    :local:
    :backlinks: none
	
==============
Common Changes
==============

-----------------------
Changes in Context Menu
-----------------------

A single method for creating context menus was introduced. The method is based on schemas. Check the examples here: ``app/schemas/context_menu/profiles.php``

The context menu schema has the following structure::

    [
        'selectable_statuses' => array<string, string>                                                                             // List of statuses for selecting items.
        'items'               => [                                                                                                 // List of context menu items.
            'status'  => [                                                                                                         // Item ID.
                'name'              => ['template' => 'status'],                                                                   // Item name.
                'type'              => GroupItem::class,                                                                           // Item type (ActionItem/GroupItem/ComponentItem).
                'data'              => [                                                                                           // Data to provide to a template. Use $data in the template.
                    'menu_item_class' => 'cm-no-hide-input',                                                                       // menu_item_attributes, menu_item_class, action_attributes, action_class - used in common templates.
                    ...
                ],
                'items'             => [                                                                                           // List of embedded items in GroupItem.
                    'm_activate' => [                                                                                              // Link item.
                        'name'          => [
                            'template' => 'change_to_status',
                            'params'   => [
                                '[status]' => __('active'),
                                ...
                            ],
                        ],
                        'dispatch' => 'profiles.m_activate',                                                                       // Dispatch to which the selected items IDs will be passed. The dispatch is also used to check the item availability for an active user.
                        'position' => 10,                                                                                          // Item position in the list.
                    ],
                    'actions_divider'   => [                                                                                       // Item divider.
                        'type'     => DividerItem::class,                                                                          // Type of an item embedded to GroupItem (GroupActionItem/ComponentItem/DividerItem). The default item type is GroupActionItem..
                        'position' => 20,
                    ],
                    'notify_checkboxes' => [                                                                                       // Item with its own template.
                        'type'          => ComponentItem::class,
                        'template'      => 'views/profiles/components/context_menu/notify_checkboxes.tpl',                         // Custom template of ComponentItem.
                        'data_provider' => static function () {                                                                    // Callback function to form the data to provide it to a template. Use $data in the template.
                            return [
                                'param1' => 'value2',
                                ...
                            ];
                        },
                        'position'      => 30,
                    ],
                    ...
                ],
                'permission_callback' => static function ($request, $auth, $runtime) {                                             // Callback function to check an item availability.
                    return !(
                        UserTypes::isVendor($auth['user_type'])
                        && UserTypes::isCustomer($request['user_type'])
                        && fn_check_permissions('profiles', 'm_activate', 'admin', 'POST', ['user_type' => $request['user_type']])
                        && fn_check_permissions('profiles', 'm_disable', 'admin', 'POST', ['user_type' => $request['user_type']])
                    );
                },
                'position'            => 20,
            ],
            ...
        ],
    ]

============
Core changes
============

---------------
Changed Classes
---------------

#. ::

       // Old:
       \XMLDocument
       // New:
       \XMLDocument\XMLDocument

#. ::

       // Old:
       \XMLParser
       // New:
       \XMLDocument\XMLParser

-------------
New Functions
-------------

#. Execute an action in the context of the company specified by its ID::

       \fn_execute_as_company(callable $action, $company_id)

#. Get an event dispatcher instance::

       \Tygh\Providers\EventDispatcherProvider::getEventDispatcher()

#. Get a notification settings factory instance::

       \Tygh\Providers\EventDispatcherProvider::getNotificationSettingsFactory()

#. Get a built-in license number of an add-on downloaded from the Marketplace::

       \Tygh\Addons\XmlScheme3::getMarketplaceLicenseNumber()

================
Template Changes
================

----------------------
Removed Template Hooks
----------------------

#. ``import_presets:bulk_edit``

#. ``import_presets:bulk_edit_items``

#. ``import_presets:bulk_edit_actions``

#. ``banners:bulk_edit``

#. ``banners:bulk_edit_items``

#. ``data_feeds:bulk_edit``

#. ``data_feeds:bulk_edit_items``

#. ``em_subscribers:bulk_edit``

#. ``em_subscribers:bulk_edit_items``

#. ``reward_points:bulk_edit``

#. ``reward_points:bulk_edit_items``

#. ``reward_points:bulk_edit_actions``

#. ``seo_redirects:bulk_edit``

#. ``seo_redirects:bulk_edit_items``

#. ``seo_rules:bulk_edit``

#. ``seo_rules:bulk_edit_items``

#. ``seo_rules:context_menu``

#. ``tags:bulk_edit``

#. ``tags:bulk_edit_items``

#. ``tags:bulk_edit_actions``

#. ``block_manager:bulk_edit``

#. ``block_manager:bulk_edit_items``

#. ``block_manager:bulk_edit_actions``

#. ``cart:bulk_edit``

#. ``cart:bulk_edit_items``

#. ``cart:bulk_edit_actions``

#. ``categories:bulk_edit``

#. ``categories:bulk_edit_items``

#. ``products:bulk_edit``

#. ``companies:bulk_edit_items``

#. ``countries:bulk_edit``

#. ``countries:bulk_edit_items``

#. ``datakeeper:bulk_edit``

#. ``datakeeper:bulk_edit_items``

#. ``datakeeper:bulk_edit_actions``

#. ``destinations:bulk_edit``

#. ``destinations:bulk_edit_items``

#. ``documents:bulk_edit``

#. ``documents:bulk_edit_items``

#. ``documents:bulk_edit_actions``

#. ``languages:bulk_edit``

#. ``languages:bulk_edit_items``

#. ``languages:bulk_edit_actions``

#. ``orders:bulk_edit``

#. ``orders:bulk_edit_items``

#. ``orders:view_tools_list_for_selected``

#. ``orders:export_tools_list_for_selected``

#. ``orders:list_tools_for_selected``

#. ``pages:bulk_edit``

#. ``pages:bulk_edit_items``

#. ``pages:bulk_edit_actions``

#. ``product_features:bulk_edit``

#. ``product_features:bulk_edit_items``

#. ``product_options:bulk_edit``

#. ``product_options:bulk_edit_items``

#. ``products:bulk_edit``

#. ``products:bulk_edit_items``

#. ``products:bulk_edit_actions``

#. ``profiles:bulk_edit``

#. ``profiles:bulk_edit_items``

#. ``profiles:view_tools_list_for_selected``

#. ``profiles:export_tools_list_for_selected``

#. ``profiles:list_tools_for_selected``

#. ``promotions:bulk_edit_items``

#. ``shipments:bulk_edit``

#. ``shipments:bulk_edit_items``

#. ``shipments:bulk_edit_actions``

#. ``shippings:bulk_edit``

#. ``shippings:bulk_edit_items``

#. ``states:bulk_edit_items``

#. ``taxes:bulk_edit``

#. ``taxes:bulk_edit_items``

#. ``taxes:bulk_edit_actions``

#. ``usergroups:bulk_edit``

#. ``usergroups:bulk_edit_items``

------------------
New Template Hooks
------------------

#. ``import_presets:context_menu``

#. ``banners:context_menu``

#. ``data_feeds:context_menu``

#. ``em_subscribers:context_menu``

#. ``reward_points:context_menu``

#. ``seo_redirects:context_menu``

#. ``tags:context_menu``

#. ``block_manager:context_menu``

#. ``cart:context_menu``

#. ``categories:context_menu``

#. ``companies:context_menu``

#. ``countries:context_menu``

#. ``datakeeper:context_menu``

#. ``destinations:context_menu``

#. ``documents:context_menu``

#. ``languages:context_menu``

#. ``orders:context_menu``

#. ``pages:context_menu``

#. ``product_features:context_menu``

#. ``product_options:context_menu``

#. ``products:context_menu``

#. ``profiles.context_menu``

#. ``promotions:context_menu``

#. ``shipments:context_menu``

#. ``shippings:context_menu``

#. ``states:context_menu``

#. ``taxes:context_menu``

#. ``usergroups:context_menu``

============
Hook Changes
============

-------------
Changed Hooks
-------------

#. ::

       // Old:
       fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions);
       // New:
       fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions, $get_promotions_params);

#. ::

       // Old:
       fn_set_hook('get_profile_fields', $location, $select, $condition);
       // New:
       fn_set_hook('get_profile_fields', $location, $select, $condition, $params);

#. ::

       // Old:
       fn_set_hook('place_suborders', $cart, $suborder_cart);
       // New:
       fn_set_hook('place_suborders', $cart, $suborder_cart, $key_group);


#. ::

       // Old:
       fn_set_hook('update_product_features_value_pre', $product_id, $product_features, $add_new_variant, $lang_code, $params, $category_ids);
       // New:
       fn_set_hook('update_product_features_value_pre', $product_id, $product_features, $add_new_variant, $lang_code, $params, $product_category_ids, $product_categories_paths);

#. ::

       // Old:
       fn_set_hook('update_product_features_value_post', $product_id, $product_features, $add_new_variant, $lang_code, $params, $category_ids);
       // New:
       fn_set_hook('update_product_features_value_post', $product_id, $product_features, $add_new_variant, $lang_code, $params, $product_categories_ids);

---------
New Hooks
---------

#. This hook is executed before the review is created. The hook allows you to modify the arguments passed to the method::

       fn_set_hook('product_reviews_create_pre', $product_review_data);

#. This hook is executed after checking if the user is eligible to write a review. The hook allows you to modify the arguments passed to the method::

       fn_set_hook('product_reviews_is_user_eligible_to_write_product_review', $user_id, $product_id, $ip, $need_to_buy_first, $review_ip_check, $result);

#. This hook is executed before getting a simple list of user groups from the database. The hook allows you to modify query parameters::

       fn_set_hook('get_simple_usergroups', $type, $get_default, $lang_code, $where);

#. This hook is executed before getting a promotion data. The hook allows you to modify parameters passed to the method::

       fn_set_hook('get_promotion_data_pre', $promotion_id, $lang_code, $extra_condition);

#. This hook allows you to override "Product availability" export field values::

       fn_set_hook('export_product_availability', $availability, $export_type);

#. This hook is executed after getting user data for creating an order via API request. The hook allows you to modify a cart user data::

       fn_set_hook('api_orders_create_after_get_user_data', $params, $status, $data, $valid_params, $auth, $cart);

#. This hook is executed after a company identifier has been replaced with a new one. The hook allows you to perform additional runtime state manipulations::

       fn_set_hook('execute_as_company_after_set_company_id', $action, $company_id);

#. This hook is executed after a company identifier has been restored. The hook allows you to perform additional runtime state manipulations::

       fn_set_hook('execute_as_company_after_restore_company_id', $action, $company_id);

#. The hook is executed after retrieving information from the database. The hook allows you to modify the data::

       fn_set_hook('shippings_get_shipping_for_test_post', $shipping_info);

#. This hook is executed after a list of the file extension mappings to the file type has been formed::

       fn_set_hook('get_ext_mime_types', $key, $types);

#. This hook is executed before retrieve product shipping methods for estimation::

       fn_set_hook('geo_maps_get_product_shipping_methods_before_estimation', $product);

#. This hook is executed after access status to checkout was determined. Allows you to change it::

       fn_set_hook('get_access_to_checkout', $cart, $payment_methods, $access);

#. This hook is executed after after company orders fulfillment status has been identified. Allows you to change it's type::

       fn_set_hook('are_company_orders_fulfilled_by_marketplace', $company_id, $fulfillment_status);

#. This hook is executed at the end of determination of specified shipping sender. Allows you to change shipping sender::

       fn_set_hook('is_shipping_sent_by_marketplace', $shipping, $result).