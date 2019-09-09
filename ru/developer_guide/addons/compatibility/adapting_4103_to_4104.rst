*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.10.4
*******************************************************

.. contents::
   :backlinks: none
   :local:

==============
Изменения ядра
==============

-----------------
Удалённые функции
-----------------

#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setDb``
#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setAddonsSettings``
#. ``Tygh\Addons\StripeConnect\Payments\StripeConnect::setFormatter``

------------------
Изменённые функции
------------------
#.

  ::

    // Было:
    Tygh\Addons\StripeConnect\Payments\StripeConnect::__construct($payment_id, $processor_data = null)

    // Стало:
    Tygh\Addons\StripeConnect\Payments\StripeConnect::__construct($payment_id, Connection $db, PriceFormatter $price_formatter, array $addon_settings, $processor_params = null)

#.

  ::

    // Было:
    fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history)

    // Стало:
    fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, Formatter $formatter = null)

#.

  ::

    // Было:
    fn_vendor_categories_fee_get_included_product_taxes_based_on_subtotal($subtotals, $taxes)

    // Стало:
    fn_vendor_categories_fee_get_included_product_taxes_based_on_subtotal($subtotals, $taxes, Formatter $formatter = null)


-------------
Новые функции
-------------

#. Отпровляет СМС покупателю, когда меняется статус отгрузки::

     fn_rus_unisender_send_sms_shipment($text_sms, $phone, $order_id = 0, $status_to = '')

#. Обрабатывает отправку СМС::

     fn_rus_unisender_dispatch_sms($post, $company_id, $phone)

#. Получает характеристику "Бренд" из данных текущего товара::

     fn_seo_extract_feature_brand($product_features)

#. Форматирует сумму в соответствии с настройками главной валюты::

     fn_vendor_categories_fee_format_amount($amount, Formatter $formatter = null)

#. Получает информацию для подтверждения намерения оплаты::

     \Tygh\Addons\Stripe\Payments\StripeConnect::getPaymentConfirmationDetails($payment_intent_payment_method_id, $total)

#. Получает информацию для подтверждения намерения оплаты::

     \Tygh\Addons\StripeConnect\Payments\StripeConnect::getPaymentConfirmationDetails($payment_intent_payment_method_id, $total)

#. Обновляет примечания администратора у заказа::

     fn_update_order_staff_only_notes($order_id, $text = '')

------------------
Устаревшие функции
------------------

``fn_payment_url($protocol, $processor_script)``—use the *payment_notification* controller in your payments.

----------------
Удалённые классы
----------------

#. ``\Tygh\Addons\Stripe\PaymentSources\SourceInterface``

#. ``\Tygh\Addons\Stripe\PaymentSources\Token``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\SourceInterface``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\Token``

#. ``\Tygh\Payments\Addons\StripeConnect\PaymentSources\Customer``

-----------------
Изменённые классы
-----------------

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

------------
Новые классы
------------

#. ``\Tygh\Addons\StripeConnect\PriceFormatter`` — форматирует цены для платежей через Stripe Connect.

#. ``\Tygh\Enum\Addons\Rma\ReturnOperationStatuses`` — перечисление статусов операции возврата в модуле "Возврат товаров" (RMA).

#. ``\Tygh\Enum\Addons\Rma\RecalculateOperations`` — перечисление операций перерасчёта в модуле "Возврат товаров" (RMA).

#. ``\Tygh\Enum\Addons\Rma\InventoryOperations`` — перечисление операций с количеством товаров в модуле "Возврат товаров" (RMA).

=================
Изменения в хуках
=================

---------------
Изменённые хуки
---------------

#.

  ::

    // Было:
    fn_set_hook('update_payment_pre', $payment_data, $payment_id, $lang_code, $certificate_file, $certificates_dir);

    // Стало:
    fn_set_hook('update_payment_pre', $payment_data, $payment_id, $lang_code, $certificate_file, $certificates_dir, $can_purge_processor_params);


#.

  ::

    // Было:
    fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions);

    // Стало:
    fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $shipping_cache_tables, $shipping_cache_key);

----------
Новые хуки
----------

#. Хук выполняется после того, как задано местоположение покупателя. Позволяет изменить местоположение::

     fn_set_hook('rus_cities_geo_maps_set_customer_location_pre_post', $country_code, $state_code, $city, $zipcode);

#. Хук выполняется после автоматического определения индекса покупателя. Позволяет изменить индекс, который определился::

     fn_set_hook('rus_cities_location_manager_detect_zipcode_post_post', $location, $cities);

#. Хук выполняется перед инициализацией Last View. Позволяет модифицировать параметры запроса::

     fn_set_hook('last_view_init_pre', $last_view, $params);

#. Хук выполняется перед расчётом количества товаров продавца. Позволяет модифицировать условия выборки::

     fn_set_hook('vendor_plans_companies_get_products_count_pre', $instance, $conditions)

#. Хук выполняется после импорта данных о категориях товара в БД. Позволяет изменять категории, связанные с товаром, и тип их связи (главная или дополнительная категория)::

     fn_set_hook('exim_set_product_categories_post', $data, $company_id)


---------------
Устаревшие хуки
---------------

#. **Устаревший хук**::

     fn_set_hook('payment_url', $protocol, $processor_script, $url, $payment_dir);

   **Рекомендация**: используйте контроллер *payment_notification* в ваших способах оплаты.

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $items, $params);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_gather_additional_items_data_post', $this, $items, $params);

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $payout_id, $price, $time);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_payment', $this, $time, $payout_id, $price);

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $products_count);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_get_current_products_count_post', $this, $products_count);

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $notify, $can);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_can_add_product', $this, $notify, $can);

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $revenue, $today, $time_from, $time_to, $statuses);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_get_current_revenue_post', $this, $revenue, $today, $time_from, $time_to, $statuses);

#. **Устаревший хук**::

     fn_set_hook('plans_companies_get_list_post', $this, $notify, $can);

   **Рекомендация**: используйте другой хук::

     fn_set_hook('vendor_plans_company_can_get_revenue', $this, $notify, $can);
