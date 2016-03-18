***************************************************************************
How To: Increase the Accuracy of Tax, Discount, and Total Value Calculation
***************************************************************************

By default CS-Cart rounds decimals to 2 decimal places. If a customer buys a large number of products, and product price or tax rate value has 2 decimal places, it may lead to inaccuracy in the nearest tenth or hundredth of tax, discount, and total value calculation.

You can increase the calculation accuracy in 2 steps.

.. important::

     Your **Tax calculation method based on** setting under **Settings → General** must be set to **Subtotal** for the second step to work properly. 

     If your tax calculation method is based on **Unit price**, you only need to **complete Step 1** to get the increased calculation accuracy,  but then **PayPal payment methods will not work** in your shop.

============================
Step 1. Modify fn.common.php
============================

1.1. Open the **fn.common.php** file located in the *app/functions* directory of your CS-Cart installation.

1.2. Find this line of the code::

  $price = sprintf('%.' . $decimals . 'f', round((double) $price + 0.00000000001, $decimals));

1.3. Replace this line with one of the following lines:

 * If your **Tax calculation method based on** setting under **Settings → General** is set to **subtotal**, use this line::

         $price = sprintf('%.' . $decimals . 'f', round((double) $price + 0.00000000001, 4));

 * If your tax calculation method is based on **unit price**, use this line::

         $price = sprintf('%.' . 4 . 'f', round((double) $price + 0.00000000001, 4));

1.4. Save the file.

This will make CS-Cart round decimals to 4 digits.

.. note::

    You can set any number of digits after decimal point by replacing 4 with the number you want.

===========================================
Step 2. Additional Changes for PayPal Users
===========================================

PayPal only supports **xx.xx** (2 decimal places) price format. If you want to increase the calculation accuracy and use a PayPal payment method, make the following changes:

.. important::

    The changes below will work only if you set your **Tax calculation method based on** setting under **Settings → General** to **Subtotal** and modify the **fn.common.php** file as described in Step 1.

2.1. Open the **fn.common.php** file located in the *app/functions* directory of your CS-Cart installation

2.2. Add the following piece of the code to the end of the file::

    function fn_format_price_paypal($price = 0)
    {
         return sprintf("%.2f", round((double) $price + 0.00000000001, 2));
    }
    function fn_format_price_by_currency_paypal($price, $currency_from = CART_PRIMARY_CURRENCY, $currency_to = CART_SECONDARY_CURRENCY)
    {
        $currencies = Registry::get('currencies');
        $currency_from = $currencies[$currency_from];
        $currency_to = $currencies[$currency_to];

        $result = fn_format_price_paypal($price / ($currency_to['coefficient'] / $currency_from['coefficient']), CART_SECONDARY_CURRENCY);

        /**
         * Update converted value
         *
         * @param float  $price         value to be converted
         * @param string $currency_from in what currency did we get the value
         * @param string $currency_to   in what currency should we send the result
         * @param float  $result        converted value
         */
        fn_set_hook('format_price_by_currency_paypal_post', $price, $currency_from, $currency_to, $result);

        return $result;
    }

2.3. Save the file.

2.4. Open the **paypal.php** file in the *app/addons/paypal/payments* directory of your CS-Cart installation.

2.5. Change the following line:

     .. list-table::
         :header-rows: 0
         :stub-columns: 1
         :widths: 15 50

         *   -   Find this line:
             -   $paypal_shipping = fn_order_shipping_cost($order_info);
         *   -   Replace it with:
             -   $paypal_shipping = fn_format_price_paypal(fn_order_shipping_cost($order_info));

2.6. Replace all instances of **fn_format_price** with **fn_format_price_paypal**:

     .. list-table::
         :header-rows: 0
         :stub-columns: 1
         :widths: 15 50

         *   -   Find this code:
             -   fn_format_price(
         *   -   Replace it with:
             -   fn_format_price_paypal(

2.7. Replace all instances of **fn_format_price_by_currency** with **fn_format_price_by_currency_paypal**:

     .. list-table::
         :header-rows: 0
         :stub-columns: 1
         :widths: 15 50

         *   -   Find this code:
             -   fn_format_price_by_currency(
         *   -   Replace it with:
             -   fn_format_price_by_currency_paypal(

2.8. Save the file.

2.9. Complete the steps below **for all the .php files** in the *app/addons/paypal/payments* directory of your CS-Cart installation:

  * Open the file.

  * Replace all instances of **fn_format_price** with **fn_format_price_paypal**:

    .. list-table::
        :header-rows: 0
        :stub-columns: 1
        :widths: 15 50

        *   -   Find this code:
            -   fn_format_price(
        *   -   Replace it with:
            -   fn_format_price_paypal(

  * Replace all instances of **fn_format_price_by_currency** with **fn_format_price_by_currency_paypal**:

    .. list-table::
        :header-rows: 0
        :stub-columns: 1
        :widths: 15 50

        *   -   Find this code:
            -   fn_format_price_by_currency(
        *   -   Replace it with:
            -   fn_format_price_by_currency_paypal(

  * Save the file.
