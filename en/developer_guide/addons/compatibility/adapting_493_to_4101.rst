***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.10.1
***********************************************

==============
Common Changes
==============

#. Deprecated payment method **FuturePay** was deleted.

#. The functionality of the ``rus_pickup`` add-on (previously exclusive to Russian version) was transferred to the ``store_locator`` add-on, which was renamed to **Stores and pickup points**.

#. The ``rus_customer_geolocation`` add-on was removed. Its functionality was split between the new checkout and the ``geo_maps`` (**Maps and geolocation**) add-on.

#. The functionality of searching for *New orders* was removed along with the ``new_orders`` table.

#. New microformat ``cm-mask-phone`` that allows you to add a phone number mask to a field was added. The mask is automatically determined from the first characters of the number entered.

#. New setting type ``L`` was added. It is an input field that has microformat ``cm-mask-phone``.

#. A new shipping service interface called ``IPickupService`` was added. The interface declares methods that are specific to shipping methods with pickup points. The method called ``getPickupPoints`` is reserved for future use, since there is no unified data structure to represent the list of pickup points yet.

#. A new ``Tygh::$app['location']`` service for working with the current customer location (country, state, city, address and ZIP code) was added.

#. A new ``Tygh::$app['storefront']`` service for fetching the data of the current storefront was added. 

   To manage storefronts (create, update, find, or remove them), use Storefronts Repository. It can be accessed via the ``Tygh::$app['storefront.repository']`` service.

#. The ``\Tygh\Http`` class now allows you to specify the execution time for a request. To do that, set a value for the ``execution_timeout`` key in the ``extra`` array::

     \Tygh\Http::get('http://example.com', [], ['execution_timeout' => 5]); // Setting the timeout to 5 seconds

   If no value is passed, the default value of 90 seconds will be used (180 seconds in the console mode).

   The ``timeout`` key of the ``extra`` array was renamed to ``connection_timeout``, because it sets the timeout for the confirmation of connection; backward compatibility was preserved.

------------------------
Add-on Schema: Version 4
------------------------

New schema for describing add-ons was added. Schema v4 aims to allow writing add-ons in object-oriented style. This version of the schema is still being developed, but you can already use the following improvements:

* **autoload**. This section serves for declarative description of directories that will be registered in the auto-loader of classes. Learn more about PSR-4 at `the website of PHP Framework Interoperability Group <https://www.php-fig.org/psr/psr-4/>`_.

  Example of use:

  .. code-block:: xml

    <autoload>
        <psr4 prefix="Tygh\Addons\ProductVariations\">src</psr4>
        <psr4 prefix="Tygh\Addons\ProductVariations\Tests\Unit\">tests</psr4>
    </autoload>

* **bootstrap**. This section is meant for specifying the loader class of the add-on. It's the equivalent of init.php in schema v3.

  The class must implement the ``\Tygh\Core\BootstrapInterface`` interface with the ``boot`` method, that will be called during every initialization of the add-on. Usually, the ``boot`` method should include only the code that handles the registration of services. Additionally, the bootstrap class may implement ``\Tygh\Core\HookHandlerProviderInterface``, that is used for describing hook handlers. ``\Tygh\Core\HookHandlerProviderInterface`` requires implementation of the ``getHookHandlerMap`` method, that must return an array with the description of hook handlers.

  Formats for describing hook handlers:

  * **Simplified format:** *hook => callable*. Key is hook name, and value is either any callable construction, or a method from a service in the container of dependencies. Examples:

    *

      ::

        'get_products' => ['Tygh\Addons\MyChanges\ProductsHookHandler', 'onGetProducts']

      It expects the presence of static method ``Tygh\Addons\MyChanges\ProductsHookHandler::onGetProducts``.

    *

      ::

        'get_products' => function ($params, $products) { //... }

      Anonymous function is used.

    *

      ::

        'get_products' => ['addons.my_changes.products_hook_handler', 'onGetProducts']

      It expects the ``addons.my_changes.products_hook_handler`` service registered in ``Tygh::$app``, along with the ``'onGetProducts'`` method.

    The simplified format also allows specifying priority of the hook handler as the third element of the array. For example::

      'get_route' => [
          'addons.product_variations.hook_handlers.seo',
          'onGetRoute',
          1900
      ],

  * **Extended format:** *hook_key => hook_handler_definition*. For example::

      'discussions_variation_group_mark_product_as_main_post' => [
          'hook'     => 'variation_group_mark_product_as_main_post',
          'handler'  => [
              'addons.product_variations.hook_handlers.discussions',
              'onVariationGroupMarkProductAsMainPost',
          ],
          'addon'    => 'discussion',
          'priority' => 790
      ],

    Any meaningful code can serve as the array key.
    
    * ``hook``—hook name.

    * ``handler``—the description of the hook handler. The value can be any callable construction, or a method from a service in the container of dependencies.

    * ``addon``—the code of the add-on on behalf of which the handler is registered. This parameter can be skipped; in that case, the hook handler will be registered on behalf of the current add-on.

    * ``priority``—priority of the handler. This parameter can be skipped; int hat case, the priority from the add-on will be used. 

* **installer**. This section is meant for specifying the class that will be used when the add-on is installed or uninstalled. The class must implement the ``\Tygh\Addons\InstallerInterface`` interface with the following methods:

  * ``factory(ApplicationInterface $app)`` — a static method that returns the instance of a class. The method will be called when the class is necessary.

  * ``onBeforeInstall()``—the equivalent of ``before_install`` from schema 3.0; will be called before add-on installation.

  * ``onInstall()``—the equivalent of ``install`` from schema 3.0; will be called during add-on installation.

  * ``onUninstall()``—the equivalent of ``uninstall`` from schema 3.0; will be called before the add-on is uninstalled.

------------
New Checkout
------------

* New single-page checkout was integrated into the core.

* The **Lite checkout** add-on that provided this functionality earlier in the Russian version was removed.

* The old checkout functionality was moved to a separate add-on called **Step-by-Step Checkout**.

* The layout of the new checkout is now based on separate blocks. The blocks will be created automatically when the **Step-by-Step Checkout** add-on is disabled or uninstalled. On new installations, the necessary blocks will exist by default. Their names start with ``Checkout: ...``.

* The **Main content** block must be disabled when the new checkout is used.

* The new **Lite checkout** wrapper must be applied to the grid that contains all the blocks. Without that wrapper, the new checkout will not function properly.

-------------
Block Manager
-------------

The ability to specify a grid wrapper was added. If a wrapper is selected for a grid, then the corresponding template will be included, and the content of all blocks will be passed inside.

-------------------
Call Request Add-on
-------------------

The functionality associated with the masks of phone numbers was transferred to the core. Add-on settings that affect phone number masks are now deprecated; we don't recommended using them.

-----------------------------
HiDPI Displays Support Add-on
-----------------------------

The add-on was significantly reworked: it will not shrink the images during the uploading process. The JS code for loading 2x images was removed, and now the ``srcset`` attribute is used for this task.

-----------------------------------------
Pickup Point Data in E-Mail Notifications
-----------------------------------------

Information about the pickup point chosen for the order is now available in the templates of e-mail notifications and documents in the ``pickup_point`` variable and in the ``pickup_point`` snippet.

To specify the pickup point data with your add-on, use the ``pickup_point_variable_init`` hook.

----------------------
jQuery Version Upgrade
----------------------

CS-Cart and Multi-Vendor now use jQuery v3.3.1 instead of the legacy v1.9.1. The primary goal of this is to patch CS-Cart against the CVE-2015-9251 vulnerability that affects old versions of jQuery.

We will include the **jQuery Migrate** plugin to keep the backward compatibility with existing add-ons and themes. However, if your add-ons or themes depend on legacy features of jQuery, it's time to upgrade them now.

------------------------------------
Spectrum Colorpicker Library Upgrade
------------------------------------

CS-Cart now uses Spectrum Colorpicker v1.8.0 instead of the legacy v1.0.9.

--------------------
Shipping Calculation
--------------------

Before CS-Cart / Multi-Vendor 4.10.1, the ``$calculate_shipping`` parameter of the ``fn_calculate_cart_content`` function wasn't working as described: the shipping calculation process within the function didn't depend on its value.

Starting with version 4.10.1 this parameter will affect the function behavior as described.

.. note::

    **Backward compatibility note:** the ``fn_calculate_cart_content`` function will check the ``$cart['calculate_shipping']`` field. If its value is set to ``true``, then shipping calculation will be forced.

------------------------------------
Multiple Storefronts in Multi-Vendor
------------------------------------

The ability to have multiple storefronts was added to Multi-Vendor. Each storefront can have a subset of countries, languages, currencies and vendors associated with it.

Only products of the selected vendors will appear on a storefront, and only selected languages and currencies will be available to customers.

Redirection based on customer's region is now possible in Multi-Vendor; it works the same way as in CS-Cart.

General settings ``store_mode`` and ``store_access_key`` were moved to storefronts.

+++++++++++++++++++++++++++++++++++++
Storefront-Related Changes in CS-Cart
+++++++++++++++++++++++++++++++++++++

The following fields of the ``companies`` table will be moved to storefronts: 

* *countries_list*

* *storefront*

* *redirect_customer*

To keep the backward compatibility, we will keep these fields in the ``companies`` table and will keep them updated, but their direct use is highly discouraged.

--------------------------------------
Separate Secure Storefront URL Removed
--------------------------------------

The **Secure storefront URL** field was removed from the store configuration page and won't be used in checks. All storefronts will function as if they use the same URL for non-secure and secure connection.

To keep the backward compatibility, we will keep this field in the ``companies`` table, but its direct use is highly discouraged.

------------------------------------
Introducing the Notifications Center
------------------------------------

A new way to display notifications for administrators was added: the Notifications Center.
It can be used as a replacement for the notifications shown with the ``fn_set_notification`` function.

To add notifications into the Notification Center, use the ``Tygh::$app['notifications_center']`` service. This service provides the ``\Tygh\NotificationsCenter\NotificationsCenter`` class instance configured for the current user.

To manually manage notifications (create, update, find, or remove them), use the ``Tygh::$app['notifications_center.repository']`` service. This service provides the configured ``\Tygh\NotificationsCenter\Repository`` class instance.

All the tabs that are displayed in the Notifications Center are described in the *notifications/notifications_center.php* schema; feel free to extend them for your needs.

-------------------------
Image Zoom Add-on Changes
-------------------------

The **Image Zoom** add-on no longer uses the **CloudZoom** JavaScript library due to its incompatibility with jQuery 3.3.1. **EasyZoom** is used instead.

Also, the proper support of RTL languages was implemented for the add-on.

============
Hook Changes
============

-------------
Removed Hooks
-------------

#.

   ::

     fn_set_hook('checkout_step_needs_shipping_calculation_post', $cart, $completed_steps, $needs_calculation);

#.

   ::

     fn_set_hook('prepare_direct_payments_payment_methods', $cart, $auth, $payment_groups[$vendor_id]);

---------
New Hooks
---------

#. This hook is executed after shipping taxes are retrieved; it allows you to modify the shipping taxes::

     fn_set_hook('get_shipping_taxes_post', $shipping_id, $shipping_rates, $cart, $taxes);

#. This hook is executed when the document template is being rendered and the ``pickup_point`` variable is being filled. The hook allows you to specify that a pickup point is selected as the shipping destination, and to set the pickup point data such as its address, phone, open hours, etc.::

     fn_set_hook('pickup_point_variable_init', $this, $order, $lang_code, $is_selected, $name, $phone, $full_address, $open_hours_raw, $open_hours, $description_raw, $description);

#. This hook allows you to modify shipping data after it has been fetched::

     fn_set_hook('get_shipping_info_after_select', $shipping_id, $lang_code, $shipping);

#. This hook is executed before the location of the user is set; it allows you to modify the location::

     fn_set_hook('geo_maps_set_customer_location_pre', $location);

#. This hook is executed before the data of companies is merged. The hook allows you to exclude tables from merging::

     fn_set_hook('chown_company', $from, $to, $excluded_tables, $tables);

#. This hook changes the additional parameters for calculating the number of new vendors on the dashboard::

     fn_set_hook('dashboard_new_vendors_before_sql_select', $fields, $joins, $conditions, $params);

#. This hook changes the additional parameters for calculating the number of vendors who haven't logged in on the dashboard::

     fn_set_hook('dashboard_vendors_not_logged_before_sql_select', $fields, $joins, $conditions, $params);

#. This hook changes the additional parameters for calculating the number of vendors with new sales on the dashboard::

     fn_set_hook('dashboard_vendor_with_sales_before_sql_select', $fields, $joins, $conditions, $params);

#. This hook changes the additional parameters for calculating the number of vendors with new products on the dashboard::

     fn_set_hook('dashboard_get_vendors_with_new_products_before_sql_select', $fields, $joins, $conditions, $params);

#. This hook changes the additional parameters for calculating the number of products on the dashboard::

     fn_set_hook('dashboard_get_new_products_before_sql_select', $fields, $joins, $conditions, $params);

#. This hook is executed during the generation of a fake email address for a customer when an order is being placed. The hook allows you to change the local-part and the domain of the generated email address::

     fn_set_hook('checkout_generate_fake_email', $user_data, $unique_id, $local_part, $domain);

#. This hook is executed during the check whether the customer's email address was generated automatically. The hook allows you to modify the result of the check::

     fn_set_hook('checkout_is_email_address_fake_post', $email_address, $is_fake);

#. This hook is executed during the automatic detecting of a customer's ZIP code, after the ZIP code has been detected. The hook allows you to modify the detected ZIP code::

     fn_set_hook('location_manager_detect_zipcode_post', $country_code, $state_code, $city, $zipcode);

#. This hook is executed before the checkout steps are updated. The hook allows you to modify the function parameters::

     fn_set_hook('checkout_update_steps_pre', $cart, $auth, $params, $redirect_params);

#. This hook is executed when the checkout steps are updated, and a user with the same email as the one provided by a customer is found. The hook allows you to modify the redirection parameters::

     fn_set_hook('checkout_update_steps_user_exists', $cart, $auth, $params, $redirect_params);

#. This hook is executed when the checkout steps are updated, and the shipping cost changes. The hook allows you to modify the redirection parameters::

     fn_set_hook('checkout_update_steps_shipping_changed', $cart, $auth, $params, $redirect_params);

#. This hook is executed after the customer's user data has been updated on checkout. The hook allows you to modify the returned values of the function::

     fn_set_hook('checkout_update_user_data_post', $cart, $auth, $user_data, $ship_to_another, $user_id);

#. This hook is executed when cart content is being saved, right before product data is saved. The hook allows you to modify the stored data::

     fn_set_hook('save_cart_content_before_save', $cart, $user_id, $type, $user_type, $product_data);

#. This hook is executed when a user logs out. The hook allows you to specify whether or not the cart content should be saved::

     fn_set_hook('user_logout_before_save_cart', $auth, $save_cart);

#. This hook is executed when a user logs out. The hook allows to specify whether or not the cart content should be cleared::

     fn_set_hook('user_logout_before_clear_cart', $auth, $clear_cart);

#. This hook is executed before payment methods on the checkout page are fetched. The hook allows you to modify the parameters passed to the function that obtains payments::

     fn_set_hook('prepare_checkout_payment_methods_before_get_payments', $cart, $auth, $lang_code, $get_payment_groups, $payment_methods, $get_payments_params);

#. This hook is executed after payment methods for checkout have been fetched. The hook allows you to modify the fetched payment methods::

     fn_set_hook('prepare_checkout_payment_methods_after_get_payments', $cart, $auth, $lang_code, $get_payment_groups, $payment_methods, $get_payments_params, $cache_key);

#. This hook is executed during the search for storefronts, before the query is executed. The hook allows you to modify parts of the SQL query::

     fn_set_hook('storefront_repository_find', $params, $items_per_page, $fields, $join, $conditions, $group_by, $having, $order_by, $limit);

#. This hook is executed when storefronts are being counted, before the query is executed. The hook allows you to modify parts of the SQL query::

     fn_set_hook('storefront_repository_get_count', $params, $fields, $join, $conditions);

#. This hook is executed during storefront deletion. The hook allows you to clear additional storefront data::

     fn_set_hook('storefront_repository_delete_post', $storefront, $operation_result);

#. This hook is executed before the stores available for shipping are fetched::

     fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions);

#. This hook is executed before the feature variants are deleted::

     fn_set_hook('delete_product_feature_variants_pre', $feature_id, $variant_ids);

#. This hook allows you to change the table item context for the render of the data table snippet::

     fn_set_hook('template_snippet_table_item_context_init', $this, $context, $item, $counter);

#. This hook is executed before a new product is created from a combination of feature values. The hook allows you to modify the data before the product is saved:: 

     fn_set_hook('variation_group_create_products_by_combinations_item', $service, $parent_product_id, $combination_id, $combination, $product_data);

#. This hook is executed before products are added to variation group. It allows you to run additional checks before products are added to the group::

     fn_set_hook('variation_group_add_products_to_group', $service, $result, $products, $group, $products_status);

#. This hook is executed after a parent product is changed. It allows you to perform additional actions::

     fn_set_hook('variation_group_mark_product_as_main_post', $service, $group, $from_group_product, $to_group_product);

#. This hook is executed after a variation group has been created. It allows you to perform additional actions and react to the events that occur in the variation group::

     fn_set_hook('variation_group_save_group', $service, $group, $events);

#. This hook is executed after the syncing events have been processed. The hook allows you to implement reaction to synced data::

     fn_set_hook('variation_sync_flush_sync_events', $sync_service, $events);

#. This hook is executed after a global option has been linked to a product::

     fn_set_hook('add_global_option_link_post', $product_id, $option_id);

#. This hook is executed after a global option has been unlinked from a product::

     fn_set_hook('delete_global_option_link_post', $product_id, $option_id);

#. This hook allows you to perform actions after a product tab has been updated::

     fn_set_hook('update_product_tab_post', $tab_id, $tab_data);

#. This hook is executed at the beginning of the function and allows you to modify the arguments passed to the function::

     fn_set_hook('get_attachments_pre', $object_type, $object_id, $type, $lang_code);

#. This hook processes location data after it has been updated::

     fn_set_hook('update_location_post', $location_data, $lang_code, $location_id);

#. This hook processes block data after it has been updated::

     fn_set_hook('update_block_post', $block_data, $description, $block_id);

#. This hook processes snapping data before it is updated::

     fn_set_hook('update_snapping_pre', $snapping_data);

#. This hook processes snapping data after it has been updated::

     fn_set_hook('update_snapping_post', $snapping_data);

#. This hook processes block status data it has been updated::

     fn_set_hook('update_block_status_post', $status_data);

#. This hook is executed when storefront is saved. The hook allows to perform additional actions::

     fn_set_hook('storefront_repository_save_post', $storefront, $save_result);


-------------
Changed Hooks
-------------

#.

   ::

     // Old:
     fn_set_hook('get_cart_product_data_pre', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount);

     // New:
     fn_set_hook('get_cart_product_data_pre', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $lang_code);

#.

  ::

    // Old:
    fn_set_hook('get_cart_product_data_post', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $_pdata);

    // New:
    fn_set_hook('get_cart_product_data_post', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $_pdata, $lang_code);

#.

  ::

    // Old:
    fn_set_hook('gather_additional_products_data_pre', $products, $params);

    // New:
    fn_set_hook('gather_additional_products_data_pre', $products, $params, $lang_code);

#.

  ::

    // Old:
    fn_set_hook('gather_additional_products_data_post', $product_ids, $params, $products, $auth);

    // New:
    fn_set_hook('gather_additional_products_data_post', $product_ids, $params, $products, $auth, $lang_code);

#.

  ::

    // Old:
    fn_set_hook('get_product_feature_variants', $fields, $join, $condition, $group_by, $sorting, $lang_code, $limit);

    // New:
    fn_set_hook('get_product_feature_variants', $fields, $join, $condition, $group_by, $sorting, $lang_code, $limit, $params);

#.

  ::

    // Old:
    fn_set_hook('development_show_stub', $placeholders, $append, $content);

    // New:
    fn_set_hook('development_show_stub', $placeholders, $append, $content, $is_error);

#.

  ::

    // Old:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify);

    // New:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify, $order_info, $amount_delta, $current_amount, $original_amount, $sign);

#.

  ::

    // Old:
    fn_set_hook('delete_company', $company_id, $result);

    // New:
    fn_set_hook('delete_company', $company_id, $result, $storefronts);

#.

  ::

    // Old:
    fn_set_hook('reorder_product', $order_info, $cart, $auth, $product, $amount, $price, $zero_price_action);

    // New:
    fn_set_hook('reorder_product', $order_info, $cart, $auth, $product, $amount, $price, $zero_price_action, $k);

==============
Core Functions
==============

-----------------
Removed Functions
-----------------

#. ``fn_hidpi_generate_hidpi_name``

#. ``fn_hidpi_generate_absolute_hidpi_name``

#. ``fn_hdpi_form_name``

#. ``fn_hdpi_delete``

#. ``fn_hdpi_copy``

#. ``fn_hdpi_shrink_original``

#. ``fn_checkout_step_needs_shipping_calculation``

#. ``fn_lite_checkout_get_name``

#. ``fn_lite_checkout_set_name``

#. ``fn_lite_checkout_backup_chosen_shipping``

#. ``fn_lite_checkout_restore_chosen_shipping``

#. ``fn_lite_checkout_flatten_payments_list``

#. ``fn_lite_checkout_is_shipping_recalculation_required``

#. ``fn_lite_checkout_fill_user_data_from_location``

#. ``fn_prepare_direct_payments_payment_methods``

#. ``fn_direct_payments_em_get_subscriber_name``

#. ``fn_direct_payments_user_logout``

----------------------------
Removed Deprecated Functions
----------------------------

#. ``fn_companies_change_status``

#. ``fn_get_usergroups_deprecated``

#. ``fn_discussion_parse_datetime``

#. ``fn_seo_cache_name``

#. ``fn_seo_parced_query_unset``

#. ``fn_create_image_from_file``

#. ``\Tygh\Shippings\Services\Yandex::processCms``

#. ``fn_put_csv``

#. ``fn_export_image``

#. ``fn_import_images``

#. ``fn_import_build_groups``

#. ``fn_get_csv``

#. ``fn_get_pattern_definition``

#. ``fn_update_language``

#. ``fn_delete_language_variables``

#. ``fn_get_language_variables``

#. ``fn_get_payment_methods``

#. ``fn_get_simple_payment_methods``

#. ``fn_get_carriers``

#. ``fn_get_product_details_layout``

#. ``fn_is_allow_to_translate_language_object``

#. ``fn_prepare_lang_objects``

#. ``fn_remove_trailing_slash``

#. ``fn_clean_url``

#. ``fn_create_logo``

#. ``fn_exim_set_quotes``

#. ``fn_check_gd_formats``

#. ``fn_parse_rgb``

#. ``fn_check_addon_permission``

#. ``fn_companies_get_payouts``

#. ``fn_companies_delete_payout``

#. ``fn_promotion_check``

#. ``\Tygh\DataKeeper::createZipArchive``

#. ``\Tygh\DataKeeper::getCompressedFilesList``

#. ``fn_format_price_by_currency_depricated``

#. ``fn_parse_urn``

#. ``fn_build_urn``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::isLocationEmpty``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::setPredefinedLocations``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getPredefinedLocations``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getStates``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getCountries``

--------------------
Deprecated Functions
--------------------

#. ``fn_need_shipping_recalculation``

#. ``fn_get_default_credit_card``

#. ``fn_rus_payments_payanyway_format_item_name($name)`` (use ``fn_rus_payments_truncate_item_name`` instead)

-----------
New Classes
-----------

#. ``\Tygh\Template\Document\Variables\PickpupPointVariable`` provides pickup point data storage for templates of e-mail notifications and documents.

#. ``\Tygh\BlockManager\TDeviceAvailabiltiy`` provides a set of methods to determine a block visibility on different devices.

#. ``\Tygh\Vendors\Invitations\Repository`` provides an interface for working with vendor invitations.

#. ``\Tygh\Vendors\Invitations\Sender`` provides an interface for sending invitations to potential vendors.

#. ``\Tygh\Location\Location`` provides customer location storage.

#. ``\Tygh\Location\Manager`` provides the means to work with the customer location object.

#. ``\Tygh\Location\IUserDataStorage`` describes an interface of the user data storage object for the customer location manager.

#. ``\Tygh\Location\CartUserDataStorage`` provides a user data storage that modifies the cart object that is stored in the current session.

#. ``\Tygh\Storefront\Storefront`` represents a separate storefront with a unique URL. Each storefront displays a part of the whole catalog.

#. ``\Tygh\Storefront\Repository`` fetches, saves and removes storefronts.

#. ``\Tygh\Storefront\Normalizer`` provides the tools to normalize storefront data for SQL queries and object creation.

#. ``\Tygh\Storefront\Factory`` creates storefronts.

#. ``\Tygh\Storefront\DataLoader``  provides lazy-loading functionality for storefronts.

#. ``\Tygh\Enum\YesNo`` contains possible values of boolean type used in the database.

#. ``\Tygh\NotificationsCenter\Notification`` represents a notification of the Notifications Center.

#. ``\Tygh\NotificationsCenter\IFactory`` describes the class that creates notifications.

#. ``\Tygh\NotificationsCenter\Factory`` creates notifications.

#. ``\Tygh\NotificationsCenter\IRepository`` describes the class that fetches, saves and removes notifications.

#. ``\Tygh\NotificationsCenter\Repository`` saves notifications in the store database, and also fetches and removes notifications.

#. ``\Tygh\NotificationsCenter\NotificationsCenter`` provides the means to work with notifications in the Notifications Center.

-------------
New Functions
-------------

#. Format eDost pickup point address::

     fn_rus_edost_format_pickup_point_address($order_info, $pickup_point_address, $lang_code)

#. Get the data of a PickPoint parcel locker from the database::

     \Tygh\Shippings\RusPickpoint::getPickpointPostamatById

#. Format the address of a PickPoint pickup point::

     fn_rus_pickpoint_format_pickpoint_format_pickup_point_address($pickup_point)

#. Format the open hours of a PickPoint pickup point::

     fn_rus_pickpoint_format_pickup_point_open_hours($work_time, $lang_code)

#. Format the store address::

     fn_store_locator_format_pickup_point_address($pickup_data)

#. Format the open hours of a Yandex.Delivery pickup point::

     fn_yandex_delivery_format_pickup_point_open_hours($schedules_list, $lang_code)

#. Set the default value for connection/execution timeout::

     \Tygh\Http::setDefaultTimeout($execution_timeout = null, $connection_timeout = null)

#. Fetch the delivery time value for the provided rate::

     \Tygh\Shippings\Shippings::getRateDeliveryTime($rate_info, $lang_code = CART_LANGUAGE)

#. Fetch the rate amount by provided destination::

     \Tygh\Shippings\Shippings::getRateByDestination(array $shipping, $destination_id)

#. Fetch shipping destination data::

     fn_get_shipping_destinations($shipping_id, array $shipping, $lang_code = CART_LANGUAGE)

#. Update shipping delivery time by destination and selected language::

     fn_update_shipping_destination_delivery_time($shipping_id, $deliveries, $lang_code)

#. Fetch delivery time for specified destinations and language::

     fn_get_shipping_destination_delivery_time($shipping_id, $destination_ids, $lang_code = CART_LANGUAGE)

#. Attempt to find the state ISO code by the provided location data::

     fn_geo_maps_get_state_code_by_location($location, $states, $similarity_threshold = 70, $same_country_similarity_threshold = 55)

#. Generate the hash of a user's API key::

     fn_generate_api_key_hash($api_key)

#. Check if the provided key is valid::

     fn_verify_api_key($api_key, $encrypted_key)

#. Return a filtered list of phone masks in international format::

     fn_get_phone_masks

#. Fill cart array with data from abandoned cart by specified customer identifier::

     fn_form_cart_from_abandoned($customer_id)

#. Update payment method in the cart::

     fn_checkout_update_payment($cart, $auth, $payment_id, $payment_info = [])

#. Update customer's user data in the cart::

     fn_checkout_update_user_data($cart, $auth, $user_data, $ship_to_another, $user_id)

#. Get the hash of location fields that are important for shipping::

     fn_checkout_get_location_hash(array $user_data)

#. Flatten the list of payment methods for the checkout page::

     fn_checkout_flatten_payments_list(array $payment_methods)

#. Generate a fake email address when an order is placed without an email address::

     fn_checkout_generate_fake_email_address(array $user_data, $unique_id)

#. Check if the customer's email is a fake generated automatically::

     fn_checkout_is_email_address_fake($email_address)

#. Get the value of the *$calculate_shipping* parameter for the ``fn_calculate_cart_content`` function::

     fn_checkout_get_shippping_calculation_type($cart, $is_location_changed)

#. Return the latest value of the auto-incremented column::

     \Tygh\Database\Connection::getInsertId()

#. Set profile identifier to the cart::

     fn_checkout_set_cart_profile_id(&$cart, $profile_id)

#. Fetch user profiles for checkout::

     fn_checkout_get_user_profiles($auth)

#. Check if multiple profiles are allowed for current user::

     fn_checkout_is_multiple_profiles_allowed($auth)

-----------------
Changed Functions
-----------------

#.

  ::

    // Old:
    fn_get_cart_product_data($hash, &$product, $skip_promotion, &$cart, &$auth, $promotion_amount = 0)

    // New:
    fn_get_cart_product_data($hash, &$product, $skip_promotion, &$cart, &$auth, $promotion_amount = 0, $lang_code = CART_LANGUAGE)

#.

  ::

    // Old:
    fn_extract_cart_content(&$cart, $user_id, $type = 'C', $user_type = 'R')

    // New:
    fn_extract_cart_content(&$cart, $user_id, $type = 'C', $user_type = 'R', $lang_code = CART_LANGUAGE)

#.

  ::

    // Old:
    fn_calculate_cart_content(&$cart, $auth, $calculate_shipping = 'A', $calculate_taxes = true, $options_style = 'F', $apply_cart_promotions = true)

    // New:
    fn_calculate_cart_content(&$cart, $auth, $calculate_shipping = 'A', $calculate_taxes = true, $options_style = 'F', $apply_cart_promotions = true, $lang_code = CART_LANGUAGE, $area = AREA)

#.

  ::

    // Old:
    fn_gather_additional_products_data(&$products, $params)

    // New:
    fn_gather_additional_products_data(&$products, $params, $lang_code = CART_LANGUAGE)

#.

  ::

    // Old:
    fn_get_contents($location, $base_dir = '');

    // New:
    fn_get_contents($location, $base_dir = '', $timeout = null);

#.

  ::

    // Old:
    \Tygh\Shippings\Shippings::_getRateInfoByLocation($shipping_id, $location);

    // New:
    \Tygh\Shippings\Shippings::_getRateInfoByLocation($shipping_id, $location, $lang_code = CART_LANGUAGE);

#.

  ::

    // Old:
    \Tygh\Shippings\Shippings::_calculateManualRealRate($shipping);

    // New:
    \Tygh\Shippings\Shippings::_calculateManualRealRate($shipping, $rate);

#.

  ::

    // Old:
    fn_create_periods($params);

    // New:
    fn_create_periods($params, $prefix = '');

#.

  ::

    // Old:
    \Tygh\Development::showStub($placeholders, $append)

    // New:
    \Tygh\Development::showStub($placeholders, $append, $is_error)

#.

  ::

    // Old:
    \Tygh\Shippings\Shippings::getShippingsList($group, $lang = CART_LANGUAGE, $area = AREA)

    // New:
    \Tygh\Shippings\Shippings::getShippingsList($group, $lang = CART_LANGUAGE, $area = AREA, $params = [])

#.

  ::

    // Old:
    fn_prepare_checkout_payment_methods(&$cart, &$auth, $lang_code = CART_LANGUAGE)

    // New:
    fn_prepare_checkout_payment_methods(&$cart, &$auth, $lang_code = CART_LANGUAGE, $get_payment_groups = true)

#.

  ::

    // Old:
    \Tygh\Languages\Languages::getAvailable($area = AREA, $include_hidden = false)

    // New:
    \Tygh\Languages\Languages::getAvailable($params = [])

#.

  ::

    // Old:
    \Tygh\UpgradeCenter\App::__construct($params)

    // New:
    \Tygh\UpgradeCenter\App::__construct($params, $config = null, $settings = null, $storefront_repository = null)

#.

  ::

    // Old:
    fn_set_store_mode($store_mode, $company_id = null, $clear_cache = true)

    // New:
    fn_set_store_mode($store_mode, $company_id = null)

#.

  ::

    // Old:
    fn_update_product_amount($product_id, $amount_delta, $product_options, $sign, $notify = true)

    // New:
    fn_update_product_amount($product_id, $amount_delta, $product_options, $sign, $notify = true, $order_info = [])

#.

  ::

    // Old:
    fn_check_admin_permissions(&$schema, $controller, $mode, $request_method = '', $request_variables = array())

    // New:
    fn_check_admin_permissions(&$schema, $controller, $mode, $request_method = '', $request_variables = array(), $user_id = null)


================
Template Changes
================

------------------
Deprecated Capture
------------------

Capture ``$discount_label`` in *design/themes/responsive/templates/common/product_data.tpl* is now deprecated and will be removed in next version. Use ``product_labels`` instead.

Here are the parameters of ``product_labels``:

* ``product_labels_position``: *top-right* | *top-left* | *bottom-right* | *bottom-left*. Default: `top-right`. The position of the label on the product image.

Here are the parameters of the *views/products/components/product_label.tpl* template:

* ``label_href``—render the label as a link

* ``label_extra``—HTML attributes of the label

* ``label_meta``—CSS class of the label

* ``label_icon``—the icon to display to the left of the label content

* ``label_text``—the text of the label
