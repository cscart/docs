***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.12.1
***********************************************

.. contents::
    :backlinks: none
    :local:


==============
Common Changes
==============

* HTMLPurifier library was updated to version 4.13.0.


--------------------------------------------------
Linking of Languages And Currencies to Storefronts
--------------------------------------------------

CS-Cart no longer uses the sharing mechanism to link languages and currencies to storefronts.


----------------------------------
Linking of Settings to Storefronts
----------------------------------

The ability to specify different settings for different storefronts was added to Multi-Vendor (in a manner similar to CS-Cart).

If you want to use this new functionality, you'll have to adapt your add-ons:

#. Change the ``edition_type`` for settings and sections from ``ROOT,VENDOR`` or ``ROOT,ULT:VENDOR`` to ``ROOT,STOREFRONT``.

#. Wherever you get or update setting values programmatically, explicitly specify ``storefront_id``. It is best to specify it when fetching an instance of the settings service::

     $settings_manager = Settings::instance(['storefront_id' => 1]);
       
       
----------------
Security Changes
----------------

Creating a password hash with ``md5`` was replaced with hashing based on the ``password_hash`` function. The ``fn_user_password_verify`` function is now used for password verification.


-----------------
Structure Changes
-----------------

The single file ``app/functions/fn.catalog.php`` was split into separate files, depending on the functions' purpose:

* ``fn.categories.php``

* ``fn.features.php``

* ``fn.filters.php``

* ``fn.options.php``

* ``fn.product_files.php``

* ``fn.products.php``


--------------------
Notification Changes
--------------------

We added the ability to set receivers of notifications: specific user groups, users, and email addresses.

If you have already developed your own notification transport or extended the event schemas, you'll need to adapt them:

#. Change the ``\Tygh\Notifications\Transports\ITransport::process()`` method in the transport class. The receiver search conditions for the event are now passed to it.

#. Implement a search for receivers of a notification. In standard classes, this mechanism is implemented using specific finder classes::

     (Tygh\Notifications\Transports\Internal\ReceiverFinders\*
       
     Tygh\Notifications\Transports\Mail\ReceiverFinders\*)
       
   and the finder factories that create these classes::
   
     (\Tygh\Notifications\Transports\Internal\ReceiverFinderFactory
       
     \Tygh\Notifications\Transports\Mail\ReceiverFinderFactory)
       
#. If you added a group of notification events, configure the displaying of the receiver editor via the ``notifications/groups`` scheme.

To avoid confusion, the vendor who is to receive internal notifications should be specified via the new ``to_company_id`` property. In email notification, the ``company_id`` property specifies the vendor who is the sender.


-----------------------
Changes in Vendor Plans
-----------------------

``commision_amount`` does not display the marketplace profit now. It can include fees and taxes (if the **Collect taxes from vendors** setting is enabled). The marketplace profit is displayed by ``marketplace_profit``.


---------------------------
Changes in Admin Panel Menu
---------------------------

Third-party add-ons can no longer create root elements in the admin panel menu. As a part of the current release, the ``validate_menu`` tweak has been added to maintain backward compatibility. This will allow you to disable such filtering.


------------------------
Changes in Add-on Scheme
------------------------ 

A new ``supplier_page`` tag was added to the add-on scheme file. Use it to specify the path to the developer page. The developer page must be written in the following fromat: ``controller.mode``.


============
Core Changes
============

---------------
Removed Classes
---------------

* ``\Tygh\Api\Entities\Combinations``

---------------      
Changed Classes
---------------

~~~~~~~~~~~~~~~~~~~~
Notification Changes
~~~~~~~~~~~~~~~~~~~~

#. ::

     //Old:
     \Tygh\Enum\RecipientSearchMethods 
     // New:
     \Tygh\Enum\ReceiverSearchMethods.
        
#. Public property removed: ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$recipient_search_method`` 

#. Public property removed: ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$recipient_search_criteria`` 

#. Public property added: ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$to_company_id``


----------- 
New Classes
-----------

#. Gets an error message of failed antibot validation::

     \Tygh\Web\Antibot\IErrorableAntibotDriver
       
#. Contains all possible setting object types::

     \Tygh\Enum\SettingTypes
       
~~~~~~~~~~~~~~~~~~~~       
Notification Changes
~~~~~~~~~~~~~~~~~~~~

#. Represents a message receiver search condition::

       \Tygh\Notifications\Receivers\SearchCondition
       
#. Provides classes that find receivers for internal notifications::

       \Tygh\Notifications\Transports\Internal\ReceiverFinderFactory 
       
#. Describes the class that is used to find receivers for internal notifications::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\ReceiverFinderInterface

#. Finds receivers of internal notifications by their email addresses::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\EmailFinder 
       
#. Finds order managers that receive internal notifications::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\OrderManagerFinder 
       
#. Finds receivers of internal notifications in the specified user group::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\UsergroupIdFinder
        
#. Finds receivers of internal notifications by user identifiers::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\UserIdFinder 
       
#. Finds main administrators of vendors that receive internal notifications::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\VendorOwnerFinder 
       
#. Describes class that is used to find receivers for e-mail notifications::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\ReceiverFinderInterface 
       
#. Finds receivers of email notifications by their email addresses::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\EmailFinder 
       
#. Finds order managers that receive email notifications::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\OrderManagerFinder 
       
#. Finds receivers of email notifications in the specified user group::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\UsergroupIdFinder 
       
#. Finds receivers of email notifications by user identifiers::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\UserIdFinder
       
#. Finds main administrators of vendors that receive email notifications::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\VendorOwnerFinder
       
       
-----------------       
Changed Functions
-----------------

#. ::

       // Old:
       \Tygh\Backend\Storage\ABackend.php::getUrl($file = '', $protocol = '');
       // New:
       \Tygh\Backend\Storage\ABackend.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::
       
       // Old:
       \Tygh\Backend\Storage\Amazon.php::getUrl($file = '', $protocol = '');
       // New:
       \Tygh\Backend\Storage\Amazon.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::
       
       // Old:
       \Tygh\Backend\Storage\File.php::getUrl($file = '', $protocol = '');
       // New:
       \Tygh\Backend\Storage\File.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::

       // Old:
       fn_get_user_name($user_id)
       // New:
       fn_get_user_name($user_id, array $user_info = null)

#. ::
       
       // Old:
       fn_exim_get_field_label($value)
       // New:
       fn_exim_get_field_label($value, $action = '')
       
#. ::
       
       // Old:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [])
       // New:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [], $url = '')

#. ::

       // Old:
       fn_image_to_display($images, $image_width = 0, $image_height = 0)
       // New:
       fn_image_to_display(array $images, $image_width = 0, $image_height = 0, $url = '')

#. ::

       // Old:
       fn_hybrid_auth_get_provider_data($provider)
       // New:
       fn_hybrid_auth_get_provider_data($provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_get_unlink_provider($user_id, $provider)
       // New:
       fn_hybrid_auth_get_unlink_provider($user_id, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_get_provider_data($provider)
       // New:
       fn_hybrid_auth_get_provider_data($provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_delete_provider($provider)
       // New:
       fn_hybrid_auth_delete_provider($provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_create_user($auth_data, $provider)
       // New:
       fn_hybrid_auth_create_user($auth_data, $provider, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_link_provider($user_id, $identifier, $provider)
       // New:
       fn_hybrid_auth_link_provider($user_id, $identifier, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_login($user_data, $auth_data, $provider)
       // New:
       fn_hybrid_auth_login($user_data, $auth_data, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_link($user_data, $auth_data, $provider)
       // New:
       fn_hybrid_auth_link($user_data, $auth_data, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_link_profile($auth_data, $provider)
       // New:
       fn_hybrid_auth_link_profile($auth_data, $provider_id)
       
#. ::
       
       // Old:
       fn_hybrid_auth_fix_old_user($auth_data, $provider)
       // New:
       fn_hybrid_auth_fix_old_user($auth_data, $provider_id)
       
#. ::
       
       // Old:
       fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false)
       // New:
       fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false, array $addons_to_load_schemas_from = null)
       
#. ::
       
       // Old:
       fn_delete_discussion($object_id, $object_type)
       // New:
       fn_delete_discussion($object_id, $object_type, $company_id = null)
       
~~~~~~~~~~~~~~~~~~~~
Notification Changes
~~~~~~~~~~~~~~~~~~~~

#. ::

       // Old:
       \Tygh\Notifications\Transports\ITransport::process(BaseMessageSchema $schema);
       // New:
       \Tygh\Notifications\Transports\ITransport::process(BaseMessageSchema $schema, array $receiver_search_conditions);


-------------------
Changes in Settings
-------------------

#. ::

       // Old:
       \Tygh\Settings::instance($company_id = null)
       // New:
       \Tygh\Settings::instance($params = [])
       
#. ::
       
       // Old:
       \Tygh\Settings::getList($section_id = 0, $section_tab_id = 0, $plain_list = false, $company_id = null, $lang_code = CART_LANGUAGE)
       // New:
       \Tygh\Settings::getList($section_id = 0, $section_tab_id = 0, $plain_list = false, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)
       
#. ::
       
       // Old:
       \Tygh\Settings::getSettingDataByName($setting_name, $company_id = null, $lang_code = CART_LANGUAGE)
       // New:
       \Tygh\Settings::getSettingDataByName($setting_name, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)

#. ::

       // Old:
       \Tygh\Settings::getValues($section_name = '', $section_type = Settings::CORE_SECTION, $hierarchy = true, $company_id = null)
       // New:
       \Tygh\Settings::getValues($section_name = '', $section_type = Settings::CORE_SECTION, $hierarchy = true, $company_id = null, $storefront_id = null)
       
#. ::      
       
       // Old:
       \Tygh\Settings::getValue($setting_name, $section_name, $company_id = null)
       // New:
       \Tygh\Settings::getValue($setting_name, $section_name, $company_id = null, $storefront_id = null)
#. ::

       // Old:
       \Tygh\Settings::getData($object_id, $company_id = null, $lang_code = CART_LANGUAGE)
       // New:
       \Tygh\Settings::getData($object_id, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)
       
#. ::
       
       // Old:
       \Tygh\Settings::updateValue($setting_name, $setting_value, $section_name = '', $force_cache_cleanup = false, $company_id = null, $execute_functions = true)
       // New:
       \Tygh\Settings::updateValue($setting_name, $setting_value, $section_name = '', $force_cache_cleanup = false, $company_id = null, $execute_functions = true, $storefront_id = null)
#. ::

       // Old:
       \Tygh\Settings::updateValueById($object_id, $value, $company_id = null, $execute_functions = true)
       // New:
       \Tygh\Settings::updateValueById($object_id, $value, $company_id = null, $execute_functions = true, $storefront_id = null)
       
#. ::
       
       // Old:
       fn_update_addon($settings)
       // New:
       fn_update_addon($settings, $storefront_id = null)
       
#. ::
       
       // Old:
       fn_update_customization_mode(array $modes)
       // New:
       fn_update_customization_mode(array $modes, $storefront_id = null)
       
#. ::

       // Old:
       fn_get_storefront_protocol($company_id = null)
       // New:
       fn_get_storefront_protocol($company_id = null, $storefront_id = null)
       
       
-----------------       
Removed Functions
-----------------

* ``fn_hybrid_auth_get_provider_id($provider)``

* ``fn_prepare_xml_product_options``

* ``fn_get_product_options_inventory_ebay``

* ``\Tygh\Commerceml\RusEximCommerceml::addNewCombination``

* ``\Tygh\Commerceml\RusEximCommerceml::addProductOptionException``

* ``fn_rus_exim_1c_look_through_variants_update_combination``

* ``fn_delete_product_combination``

* ``fn_delete_product_option_combinations``

* ``fn_look_through_variants``

* ``fn_delete_outdated_combinations``

* ``fn_rebuild_product_options_inventory``

* ``fn_update_exceptions``

* ``fn_clone_options_inventory``

* ``fn_get_product_options_inventory``

* ``fn_get_product_options_combination_data``

* ``fn_update_option_combination``

* ``fn_delete_option_combination``


-------------
New functions
-------------

#. Get the list of statuses with the specific parameters::

       fn_get_status_by_type_and_param($type, $params)
       
#. Send a notification about current return request status::

       fn_rma_send_notification 
       
#. Get the schema of event groups::

       \Tygh\Providers\EventDispatcherProvider::getEventGroupsSchema() — 

#. Get notification settings::

       \Tygh\Providers\EventDispatcherProvider::getNotificationSettings($with_receivers = false) 

#. Get the schema of events::

       \Tygh\Providers\EventDispatcherProvider::getEventsSchema()
       
#. Get the user's email::

       fn_get_user_email($user_id, array $user_info = null)
       
#. Update the promotion image for the specified language (will be uploaded for all languages if new)::

       fn_promotions_update_image($promotion_id, $lang_code = DESCR_SL) 
       
#. Delete the promotion image::

       fn_promotions_delete_image($promotion_id, $lang_code = null)

#. Clone the promotion image links for the specified languages::

       fn_promotions_copy_image_link_to_langs($promotion_id, $original_lang = CART_LANGUAGE, array $cloned_langs = [])
       
#. Clone the promotion image links to an added language::

       fn_promotions_update_language_post($language_data)
       
#. Delete the promotion images for deleted languages::

       fn_promotions_delete_languages_post($deleted_lang_codes)
       
#. Delete the image data specified for promotions::

       fn_promotions_delete_image_pre($pair_id)
       
#. Get currency information::

       fn_get_currency($currency_id, $lang_code = DESCR_SL)
       
#. Delete the file attachment by object ID::

       fn_attachments_delete_by_object_id($object_type, $object_id)
       
#. Fetch the array of paths to the directory with imported attachments::

       fn_attachments_get_import_attachments_directory($company_id, $path = '') 

#. Check if the vendor administrator can use ``order_management``::

       fn_vendor_privileges_check_permission_order_management()
       
#. Save the date of user profile fields::

       fn_store_user_profile_fields(array $profile_data, $object_id, $object_type)
       
#. Get current storefront data::

       \Tygh\Providers\StorefrontProvider::getStorefront()
       
#. Get storefront repository data::

       \Tygh\Providers\StorefrontProvider::getRepository()

#. Remove all settings values for the storefront::

       \Tygh\Settings::removeStorefrontSettings($storefront_id)

#. Remove all company- and storefront-specific values of the setting::

       \Tygh\Settings::resetAllOverrides($object_id)

#. Check whether the setting can be overridden on a per-storefront or a per-company basis::

       \Tygh\Settings::areOverriddenValuesSupportedByEdition($edition_type) 

#. Define if admin panel will be shown or not::

       fn_is_bottom_panel_available($auth)

#. Define if theme editor can be activated by a signed-in user::

       fn_is_theme_editor_available_for_user($auth)

#. Prepare data for the bottom panel::

       fn_prepare_bottom_panel_data()
       
       
--------------------       
Deprecated Functions
--------------------

#. ::

       // Deprecated function:
       \Tygh\Addons\ProductVariations\Service::onChangedProductQuantityInZero()
       // What to use instead:
       \Tygh\Addons\ProductVariations\Service::onChangedProductQuantity
       
#. ::

       // Deprecated function:
       fn_get_avail_product_features
       // What to use instead:
       fn_get_product_features
       
#. ``fn_filter_product_data``
       
#. ``fn_filters_not_found_notification``
       
#. ::       
       
       // Deprecated function:
       fn_send_return_mail
       // What to use instead:
       fn_rma_send_notification
       
#. ::       
       
       // Deprecated function:
       \Tygh\Settings::resetAllVendorsSettings
       // What to use instead:
       \Tygh\Settings::resetAllOverrides
       
#. ::       
       
       // Deprecated function:
       fn_array_column
       // What to use instead:
       array_column
       

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed before a notification about the creation of a new shipment is sent. The hook allows you to modify the shipment data in the notificaion::

       fn_set_hook('update_shipment_before_send_notification', $shipment_data, $shipment_id, $group_key, $all_products, $force_notification, $order_info, $shipment);
       
#. This hook is executed before the existing product feature variants are selected by name::

       fn_set_hook('update_product_feature_variant_before_select', $feature_id, $feature_type, $variant, $lang_code, $fields, $joins, $conditions, $limit);
       
#. This hook is executed after the ``display_language`` and the ``description_language`` parameters have been determined, and right before setting them. The hook allows you to change the languages that will be used and the list of available languages::

       fn_set_hook('init_language_post', $params, $area, $default_language, $session_display_language, $avail_languages, $display_language, $description_language, $browser_language); 

#. This hook changes parameters for selecting companies::

       fn_set_hook('get_companies_pre', $params, $items_per_page, $lang_code); 

#. This hook allows you to extend data provided to the bottom panel::

       fn_set_hook('prepare_bottom_panel_data', $bottom_panel_data);
       
#. This hook adds additional vendors activity statistic to a dashboard::

       fn_set_hook('dashboard_get_vendor_activities_post', $timestamp_from, $timestamp_to, $dashboard_vendors_activity);
       
#. This hook is executed when the cart content is calculated, after the shipping rates have been calculated. The hook allows you to modify the cart and the list of shipping methods::

       fn_set_hook('calculate_cart_content_after_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $lang_code, $area, $cart_products, $product_groups);
       
#. This POST hook allows you to update product filter::

       fn_set_hook('update_product_filter_post', $filter_data, $filter_id, $lang_code, $create);

#. This hook changes the message before it is converted::

       fn_set_hook('message_style_formatter_convert_pre', $message, $inline_css);

#. This hook changes the message after it has been converted::

       fn_set_hook('message_style_formatter_convert_post', $message); 


----------------       
Deprecated Hooks
----------------

#. ::

       // Deprecated hook:
       get_avail_product_features_pre
       // What to use instead:
       get_product_features_pre
       
#. ::

       // Deprecated hook:
       get_avail_product_features_post
       // What to use instead:
       get_product_features_post
      
#. ``get_avail_product_features_before_select``
       
#. ``filter_product_data``
       
#. ``update_product_filter``
       
       
-------------       
Changed Hooks
-------------

#. ::

       // Deprecated hook:
       fn_set_hook('get_orders_totals', $paid_statuses, $join, $condition, $group);
       // What to use instead:
       fn_set_hook('get_orders_totals', $paid_statuses, $join, $condition, $group, $totals);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('settings_update_value_by_id_pre', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);
       // What to use instead:
       fn_set_hook('settings_update_value_by_id_pre', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table, $storefront_id);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('settings_update_value_by_id_post', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);
       // What to use instead:
       fn_set_hook('settings_update_value_by_id_post', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table, $storefront_id);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('get_product_data_pre', $product_id, $auth, $lang_code, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition);
       // What to use instead:
       fn_set_hook('get_product_data_pre', $product_id, $auth, $lang_code, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition, $params);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('pre_get_cart_product_data', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $fields, $join);
       // What to use instead:
       fn_set_hook('pre_get_cart_product_data', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $fields, $join, $params);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('hybrid_auth_create_user', $auth_data, $provider, $user_data);
       // What to use instead:
       fn_set_hook('hybrid_auth_create_user', $auth_data, $provider, $user_data, $provider_id);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('delete_discussion_pre', $object_id, $object_type);
       // What to use instead:
       fn_set_hook('delete_discussion_pre', $object_id, $object_type, $company_id);
       
#. ::       
       
       // Deprecated hook:
       fn_set_hook('delete_discussion_post', $object_id, $object_type, $is_deleted);
       // What to use instead:
       fn_set_hook('delete_discussion_post', $object_id, $object_type, $is_deleted, $company_id);
       

-------------
Removed Hooks
-------------

#. ``fn_set_hook('delete_product_option_combinations', $product_id);``

#. ``fn_set_hook('look_through_variants_pre', $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('look_through_variants_update_combination', $combination, $_data, $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('look_through_variants_post', $combinations, $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('rebuild_product_options_inventory_pre', $product_id, $amount);``

#. ``fn_set_hook('rebuild_product_options_inventory_post', $product_id);``

#. ``fn_set_hook('update_exceptions_pre', $product_id, $exceptions);``

#. ``fn_set_hook('update_exceptions_post', $product_id, $exceptions);``

#. ``fn_set_hook('clone_options_inventory_pre', $from_product_id, $to_product_id, $options, $variants);``

#. ``fn_set_hook('clone_options_inventory_post', $from_product_id, $to_product_id, $options, $variants);``

#. ``fn_set_hook('get_product_options_inventory_pre', $params, $items_per_page, $lang_code);``

#. ``fn_set_hook('get_product_options_inventory_post', $params, $items_per_page, $lang_code, $inventory);``

#. ``fn_set_hook('get_product_options_combination_data_post', $combination_hash, $combination);``

#. ``fn_set_hook('update_option_combination_pre', $combination_data, $combination_hash);``

#. ``fn_set_hook('update_option_combination_post', $combination_data, $combination_hash, $inventory_amount);``

#. ``fn_set_hook('delete_option_combination_pre', $combination_hash);``