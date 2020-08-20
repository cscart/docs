***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.11.5
***********************************************

.. contents::
    :local:
    :backlinks: none

Common changes
==============

* A context menu has been added to the View orders page and the **Customers** page. All tools that involve selecting multiple elements and working with them, have been moved from GearButton to the **Actions** section of the new menu. GearButton now has only general tools that are not linked to any specific elements. (For example, importing eBay orders).

* If you previously added some tool to work with selected items using the ``'[dir_name]:list_tools'`` hook, now to add an item to the **Actions** menu you should use:

  * ``'[dir_name]:list_tools_for_selected'``—to add it to the end of the menu;
  
  * ``'[dir_name]:export_tools_list_for_selected'``—to add it to the export section;
  
  * ``'[dir_name]:view_tools_list_for_selected'``—to add it to the section, that contains viewing actions. If you need a tool that doesn't involve selecting specific elements, the hook will remain the same: ``'[dir_name]:list_tools'``.
  
* The loading animation (for example, when data is loaded in the background) now uses CSS animation instead of the SVG file. If you previously used SVG in your add-ons, replace the ``backgroud: url(...)`` with the classes inside the class styles of the *.less files:

  * ``. ajax-loader``—to add a preloader;
  
  * ``. ajax-loader--horizontal-center`` —to center the element horizontally;

  * ``. ajax-loader--vertical-center``—to center the element vertically;

  * ``. ajax-loader--vertical-top``—to make an indent half the height of the preloader from the upper border.
  
* Or you can add the same classes to the preloader block.

Core changes
============

New classes
+++++++++++

#. Enumerates possible item availability values::

       \Tygh\Enum\Addons\Seo\ItemAvailability

Changed functions
+++++++++++++++++

#. ::

       //Old:
       fn_check_amount_in_stock($product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, &$cart, $update_id = 0)
       // New:
       fn_check_amount_in_stock($product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, &$cart, $update_id = 0, $skip_error_notification = false)

#. ::

       //Old:
       fn_get_available_shippings($company_id = null, $get_service_params = false)
       // New:
       fn_get_available_shippings($company_id = null, $get_service_params = false, $storefront_id = null)

#. ::

       //Old:
       \Tygh\Addons\RusOnlineCashRegister\Service::getReceiptFromOrder(array $order, $type)
       // New:
       \Tygh\Addons\RusOnlineCashRegister\Service::getReceiptFromOrder(array $order, $type, $payment_method = Receipt::PAYMENT_METHOD_FULL_PAYMENT)

Removed functions
+++++++++++++++++

#. ::

       // Removed function:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeByToken 
       // What to use instead:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeWithout3DSecure

#. ::

       // Removed function:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::charge
       // What to use instead:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeWith3DSecure

Deprecated functions
++++++++++++++++++++

#. ::

       // Deprecated function:
       fn_expand_weight($weight) 
       // What to use instead:
       fn_convert_weight_to_imperial_units

New functions
+++++++++++++

#. Check whether string is UTF-16BE encoded::

       fn_is_utf16be($str)

#. Check whether string is UTF-16LE encoded::

       fn_is_utf16le($str)

#. Check whether terms and conditions must be accepted by a customer during checkout::

       fn_checkout_is_terms_and_conditions_agreement_required()
       
#. Check whether order status is prepaid::

       \Tygh/Addons/RusOnlineCashRegister/OrderData::isStatusPrepaid()
       
#. Set payment method for the receipt::

       \Tygh/Addons/RusOnlineCashRegister/Receipt/Receipt::setPaymentMethod($payment_method) 
       
#. Get payment method for the receipt::

       \Tygh/Addons/RusOnlineCashRegister/Receipt/Receipt::getPaymentMethod() 
       
#. Convert weight to pounds/ounces::

       fn_convert_weight_to_imperial_units($weight)
       
#. Convert weight to kilograms/grams::

       fn_convert_weight_to_metric_units($weight)
       
#. Stripe configuration data and redundant information from cart data::

       fn_storefront_rest_api_strip_service_data(array $cart)
       
#. Change status of specified user::

       fn_change_user_status($user_id, $status_to, $is_notification_required = false) 
       
#. Change status of the specified category::

       fn_change_category_status($category_id, $status_to) 
       
#. Make a string uppercase::

       fn_strtoupper($string, $charset = CHARSET) 
       
Hook changes
============

Changed hooks
+++++++++++++

#. ::

       // Old:
       fn_set_hook('check_amount_in_stock', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart);
       // New:
       fn_set_hook('check_amount_in_stock', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $skip_error_notification);

#. ::

       // Old:
       fn_set_hook('check_amount_in_stock_before_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $current_amount);
       // New:
       fn_set_hook('check_amount_in_stock_before_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $current_amount, $skip_error_notification);

#. ::

       // Old:
       fn_set_hook('update_user_pre', $user_id, $user_data, $auth, $ship_to_another, $notify_user);
       // New:
       fn_set_hook('update_user_pre', $user_id, $user_data, $auth, $ship_to_another, $notify_user, $can_update)

New hooks
+++++++++

#. This hook is executed before actually sending a message via PHPMailer. The hook allows you to perform low-level manipulations on the PHPMailer itself::

       fn_set_hook('phpmailertransport_send_message_before_send', $this, $message); 
       
#. This hook is executed when checking whether Terms and conditions must be accepted by a customer during checkout. The hook allows you to set requirement directly::

       fn_set_hook('checkout_is_terms_and_conditions_agreement_required_pre', $is_agreement_required); 
       
#. * This hook is executed when checking whether Terms and conditions must be accepted by a customer during checkout, after requirement is determined. The hook allows you to modify the check result::

       fn_set_hook('checkout_is_terms_and_conditions_agreement_required_post', $is_agreement_required); 
       
#. This hook is executed before starting the search for payment methods at Stripe add-on. The hook allows you to change search parameters::

       fn_set_hook('stripe_data_loader_get_supported_payments_before', $params); 
       
#. This hook is executed when the cart content is calculated, after the calculation of shipping rates.  The hook allows you to modify the cart and the list of shipping methods::

       fn_set_hook('calculate_cart_content_after_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $lang_code, $area, $cart_products, $product_groups);
       
#. This hook is executed after prices for an order were formatted. The hook allows you to format additional prices::

       fn_set_hook('storefront_rest_api_format_order_prices_post', $order, $currency); 
       
#. This hook is executed after configuration data and redundant information were stripped from cart data. The hook allows you to remove additional data::

       fn_set_hook('storefront_rest_api_strip_service_data_post', $cart);
       
#. This hook is executed before building child cart contents. The hook allows you to modify the child cart contents::

       fn_set_hook('place_suborders_pre', $order_id, $cart, $auth, $action, $issuer_id, $suborder_cart, $key_group, $group)



