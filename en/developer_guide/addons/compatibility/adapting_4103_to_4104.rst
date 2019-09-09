***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.10.4
***********************************************

.. contents::
   :backlinks: none
   :local:

============
Core Changes
============

-----------------
Removed Functions
-----------------

#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setDb``
#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setAddonsSettings``
#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setFormatter``

-----------------
Changed Functions
-----------------
#.

  ::

    // Old:
    Tygh\Addons\StripeConnect\Payments\StripeConnect::__construct($payment_id, $processor_data = null)

    // New:
    Tygh\Addons\StripeConnect\Payments\StripeConnect::__construct($payment_id, Connection $db, PriceFormatter $price_formatter, array $addon_settings, $processor_params = null)

#.

  ::

    // Old:
    fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history)

    // New:
    fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, Formatter $formatter = null)

#.

  ::

    // Old:
    fn_vendor_categories_fee_get_included_product_taxes_based_on_subtotal($subtotals, $taxes)

    // New:
    fn_vendor_categories_fee_get_included_product_taxes_based_on_subtotal($subtotals, $taxes, Formatter $formatter = null)


-------------
New Functions
-------------

#. Send an SMS message to customer when shipment status changes::

     fn_rus_unisender_send_sms_shipment($text_sms, $phone, $order_id = 0, $status_to = '')

#. Process the sending of an SMS message::

     fn_rus_unisender_dispatch_sms($post, $company_id, $phone)

#. Extract the Brand feature from the data of the current product::

     fn_seo_extract_feature_brand($product_features)

#. Format the amount according to the primary currency settings::

     fn_vendor_categories_fee_format_amount($amount, Formatter $formatter = null)

#. Get payment intent confirmation details::

     \Tygh\Addons\Stripe\Payments\StripeConnect::getPaymentConfirmationDetails($payment_intent_payment_method_id, $total)

#. Get payment intent confirmation details::

     \Tygh\Addons\StripeConnect\Payments\StripeConnect::getPaymentConfirmationDetails($payment_intent_payment_method_id, $total)


#. Update staff-only notes of an order::

     fn_update_order_staff_only_notes($order_id, $text = '')

--------------------
Deprecated Functions
--------------------

``fn_payment_url($protocol, $processor_script)``—use the *payment_notification* controller in your payments.

---------------
Removed Сlasses
---------------

#. ``\Tygh\Addons\Stripe\PaymentSources\SourceInterface``

#. ``\Tygh\Addons\Stripe\PaymentSources\Token``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\SourceInterface``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\Token``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\Customer``

---------------
Changed Classes
---------------

#.

  ::

    // Old:
    \Tygh\Payments\Addons\StripeConnect\StripeConnect

    // New:
    \Tygh\Addons\StripeConnect\Payments\StripeConnect


#.

  ::

    // Old:
    \Tygh\Addons\StripeConnect\Providers\OAuthHelperProvider

    // New:
    \Tygh\Addons\StripeConnect\ServiceProvider

-----------
New Сlasses
-----------

#. ``\Tygh\Addons\StripeConnect\PriceFormatter``—formats prices for Stripe Connect payments.

#. ``\Tygh\Enum\Addons\Rma\ReturnOperationStatuses``—enumerates return operation statuses in the RMA add-on.

#. ``\Tygh\Enum\Addons\Rma\RecalculateOperations``—enumerates recalculation operations in the RMA add-on.

#. ``\Tygh\Enum\Addons\Rma\InventoryOperations``—enumerates inventory operations in the RMA add-on.

============
Hook Changes
============

-------------
Changed Hooks
-------------

#.

  ::

    // Old:
    fn_set_hook('update_payment_pre', $payment_data, $payment_id, $lang_code, $certificate_file, $certificates_dir);

    // New:
    fn_set_hook('update_payment_pre', $payment_data, $payment_id, $lang_code, $certificate_file, $certificates_dir, $can_purge_processor_params);


#.

  ::

    // Old:
    fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions);

    // New:
    fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $shipping_cache_tables, $shipping_cache_key);

---------
New Hooks
---------

#. This hook is executed after the location of the user has been set. The hook allows modifying the location::

     fn_set_hook('rus_cities_geo_maps_set_customer_location_pre_post', $country_code, $state_code, $city, $zipcode);

#. This hook is executed after automatic detection of the customer's ZIP code. The hook allows you to modify the detected ZIP code::

     fn_set_hook('rus_cities_location_manager_detect_zipcode_post_post', $location, $cities);

#. This hook is executed before the initialization of Last View. The hook allows you to modify request parameters::

     fn_set_hook('last_view_init_pre', $last_view, $params);

#. This hook is executed before the calculation of the number of vendor's products. The hook allows you to modify the selection conditions::

     fn_set_hook('vendor_plans_companies_get_products_count_pre', $instance, $conditions)

#. This hook is executed after the data about product categories has been imported to the database. The hook allows changing the categories associated with the product, and how they relate to the product (primary or additional category)::

     fn_set_hook('exim_set_product_categories_post', $data, $company_id)


----------------
Deprecated Hooks
----------------

#. **Deprecated**::

     fn_set_hook('payment_url', $protocol, $processor_script, $url, $payment_dir);

   **Suggetion**: use the *payment_notification* controller in your payments instead.

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $items, $params);

   **Suggestion**: use another hook instead::

     fn_set_hook('vendor_plans_company_gather_additional_items_data_post', $this, $items, $params);

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $payout_id, $price, $time);

   **Suggetion**: use another hook instead::

     fn_set_hook('vendor_plans_company_payment', $this, $time, $payout_id, $price);

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $products_count);

   **Suggetion**: use another hook instead::

     fn_set_hook('vendor_plans_company_get_current_products_count_post', $this, $products_count);

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $notify, $can);

   **Suggetion**: use another hook instead::

     fn_set_hook('vendor_plans_company_can_add_product', $this, $notify, $can);

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $revenue, $today, $time_from, $time_to, $statuses);

   **Suggetion**: use another hook instead::

     fn_set_hook('vendor_plans_company_get_current_revenue_post', $this, $revenue, $today, $time_from, $time_to, $statuses);

#. **Deprecated**::

     fn_set_hook('plans_companies_get_list_post', $this, $notify, $can);

   **Suggetion**: use another hook instead::

     fn_set_hook('vendor_plans_company_can_get_revenue', $this, $notify, $can);
