***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.11.4
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Common Changes
==============

* Addons: Watermarks: The addon no longer tries to get image data from the database. It gets image data from the ``generate_thumbnail_post`` hook.

-----------------------------------
Payment Processors' Category Schema
-----------------------------------

* Adding a new category for payment processors can now be done by creating following schema structure in **payments/categories.php**::

    (string) CategoryId => [
    'id' => (string) CategoryId,
    'name' => (string) TemplateLanguageVariable,
    'position' => (int) CategoryPosition
    'criteria' => [
        (string) ProcessorField => (mixed) ProcessorFieldValue,
         ...
        ],
    ],

* Payment processors in the ``manage`` and ``update`` modes of the ``payments`` controller are now grouped by their categories. Each processor is assigned to only 1 category. 

=========
Functions
=========

-----------
New Classes
-----------

``Tygh\Enum\SiteArea``—enumeration of possible site area values.

-----------------
Changed Functions
-----------------
#.

   ::

     // Old:
     fn_get_checkout_payment_buttons(&$cart, &$cart_products, &$auth)
     // New:
     fn_get_checkout_payment_buttons(&$cart, &$cart_products, &$auth, array $checkout_payments = null)

#.

    ::
      
      // Old:
      fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false)
      // New:
      fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [])

    If you are using the ``fn_generate_thumbnail`` function directly, you need to forward the ``$image`` array to it.

#.

    ::
      
      // Old:
      fn_get_product_prices($product_id, &$product_data, $auth, $company_id = 0)
      // New:
      fn_get_product_prices($product_id, &$product_data, $auth, $company_id = 0, $get_all = false)

#.

    ::
      
      // Old:
      \Tygh\Common\OperationResult::showNotifications($translate_messages = false)
      // New:
      \Tygh\Common\OperationResult::showNotifications($translate_messages = false, $message_state = '')

#.

    ::
      
      // Old:
      fn_init_currency($params, $area = AREA)
      // New:
      fn_init_currency($params, $area = AREA, $account_type = null)

-----------------
Removed Functions
-----------------

#. ``fn_seo_get_availability_for_snippet``

#. ``fn_seo_extract_feature_brand``

#. ``fn_mobile_app_uninstall_layout``

-------------
New Functions
-------------

#. Get Schema.org markup items for a product::

     fn_seo_get_schema_org_markup_items(array $product_data, $show_price = true, $currency = CART_PRIMARY_CURRENCY)

#. Get receipt data and encode it into an appropriate form to send to Robokassa API::

     fn_rus_payments_robokassa_encode_receipt(array $receipt, array $processor_data)

#. Return full payment receipt according to Robokassa API documentation::
     
     fn_rus_payments_robokassa_get_full_payment_receipt(array $processor_data, array $order_info, array $params = [])

#. Update the position of a product in the chosen category::

     fn_update_product_position_in_category($product_id, $category_id, $position)

#. Get all payment processors sorted by their categories::

     fn_get_payment_processors_by_category($allow_multiple_categories = false)

#. Initialize an empty cart for Storefront REST API requests::

     fn_storefront_rest_api_get_empty_cart($cart_service_id, array $auth)

#. Get IDs of cart services::
     
     fn_storefront_rest_api_get_cart_service_ids(array $auth)

#. Group cart products by cart services (services that handle carts with the products of a specific vendor)::
     
     fn_storefront_rest_api_group_cart_products(array $cart_products)

#. Get IDs of vendors whose products are in customer's cart::
     
     \Tygh\Addons\DirectPayments\Cart\Service::getVendorIdsByUserId($user_id)

=====
Hooks
=====

-------------
Changed Hooks
-------------

#.

    ::
      
      // Old:
      fn_set_hook('get_checkout_payment_buttons', $cart, $cart_products, $auth, $checkout_buttons, $checkout_payment_ids, $payment_id);
      // New:
      fn_set_hook('get_checkout_payment_buttons', $cart, $cart_products, $auth, $checkout_buttons, $checkout_payment_ids, $payment_id, $payment, $checkout_payments);

#.

    ::
      
      // Old:
      fn_set_hook('generate_thumbnail_post', $th_filename, $lazy, $image_path, $width, $height);
      // New:
      fn_set_hook('generate_thumbnail_post', $th_filename, $lazy, $image_path, $width, $height, $image);

#.

    ::
      
      // Old:
      fn_set_hook('checkout_select_default_payment_method', $cart, $payment_methods, $completed_steps_legacy);
      // New:
      fn_set_hook('checkout_select_default_payment_method', $cart, $payment_methods, $completed_steps_legacy, $auth);

#.

    ::
      
      // Old:
      fn_set_hook('form_cart_pre_fill', $order_id, $cart, $auth, $order_info);
      // New:
      fn_set_hook('form_cart_pre_fill', $order_id, $cart, $auth, $order_info, $copy);

#.

    ::
      
      // Old:
      fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id);
      // New:
      fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id, $link);

#.

    ::
      
      // Old:
      fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition);
      // New:
      fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition, $price_usergroup);

---------
New Hooks
---------

#. This hook allows you to change parameters and user IDs during the process of updating client tiers::

    fn_set_hook('tier_manager_update_tier_pre', $user_ids, $type, $allow_downgrade);

#. This hook is executed when Schema.org markup items are fetched, right before returning the result. The hook allows you to modify the created markup items::

     fn_set_hook('seo_get_schema_org_markup_items_post', $product_data, $show_price, $currency, $markup_items);

#. This hook is executed when the quantity of the product in stock is updated, but before the state of the tracking settings is checked::
    
     fn_set_hook('update_product_amount_before_tracking_checking', $product_id, $amount_delta, $product_options, $sign, $notify, $order_info);

#. This hook allows you to change the code of the added status::

     fn_set_hook('update_status_new_status_code', $status, $status_data, $type, $lang_code, $existing_codes);

#. This hook is executed before creating a payment form; it allows you to modify the form data::

     fn_set_hook('create_payment_form_pre', $submit_url, $data, $payment_name, $exclude_empty_values, $method, $parse_url, $target, $connection_message);

#. This hook is executed after the change of a product position in the category::

     fn_set_hook('update_product_position_in_category_post', $product_id, $category_id, $position);

#. This hook is executed after an empty cart is initialized for the Storefront REST API request; the hook allows you to modify the initialized cart::

     fn_set_hook('storefront_rest_api_get_empty_cart_post', $cart_service_id, $auth, $cart);

#. This hook is executed after the list of available cart service IDs is initialized for the Storefront REST API request. The hook allows you to modify the cart services list::

     fn_set_hook('storefront_rest_api_get_cart_service_ids_post', $auth, $cart_service_ids);

#. This hook is executed after products are organized into groups for the Storefront REST API request. The hook allows you to modify the initialized groups::

     fn_set_hook('storefront_rest_api_group_cart_products_post', $cart_products, $groups);

#. This hook is executed when a new user logs in via a third-party account (social network, etc.). The hook allows you to change the user data before creating the new user account::

     fn_set_hook('hybrid_auth_create_user', $auth_data, $provider, $user_data);