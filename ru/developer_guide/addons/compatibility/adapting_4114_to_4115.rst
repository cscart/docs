*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.11.5
*******************************************************

.. contents::
    :local:
    :backlinks: none
    
Общие изменения
===============

* На странице списка заказов и на странице списка покупателей добавлено контекстное меню. Все инструменты, подразумевающие выделение нескольких элементов и работу с ними, перенесены из GearButton в раздел **Actions** нового меню. В GearButton оставлены только общие инструменты, не привязанные к конкретным элементам (например, импорт заказов с eBay).

* Если ранее вы добавляли инструмент для работы с выбранными элементами, используя хук ``'[dir_name]:list_tools'``, то теперь для добавления элемента в меню **Actions** следует использовать:

  * ``'[dir_name]:list_tools_for_selected'`` — для добавления в конец меню;
  
  * ``'[dir_name]:export_tools_list_for_selected'`` — для добавления в секцию экспорта;
  
  * ``'[dir_name]:view_tools_list_for_selected'`` — для добавления в секцию, содержащую действия по просмотру. Если же вам нужен инструмент, не подразумевающий выбор конкретных элементов, то хук останется прежним: ``'[dir_name]:list_tools'``.
  
* SVG-файл иконки загрузки, использующийся, например, при подгрузке данных в фоне, был заменен средствами анимации CSS3. Если ранее вы использовали svg в своих модулях, следует заменить в файлах ***.less** внутри стилей класса свойство ``backgroud: url(...)`` на классы:

  * ``.ajax-loader`` — для добавления прелоадера;
  
  * ``.ajax-loader--horizontal-center`` — для центрирования элемента по горизонтали;
  
  * ``.ajax-loader--vertical-center`` — для центрирования элемента по вертикали;
  
  * ``.ajax-loader--vertical-top`` — для отступа в половину высоты прелоадера от верхней границы.
  
* Либо эти же классы можно добавить блоку прелоадера.

Изменения в ядре
================

Новые классы
++++++++++++

#. Перечисляет возможные состояния доступности объекта::

       \Tygh\Enum\Addons\Seo\ItemAvailability

Изменённые функции
++++++++++++++++++

#. ::

       // Было:
       fn_check_amount_in_stock($product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, &$cart, $update_id = 0)
       // Стало:
       fn_check_amount_in_stock($product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, &$cart, $update_id = 0, $skip_error_notification = false)

#. ::

       // Было:
       fn_get_available_shippings($company_id = null, $get_service_params = false)
       // Стало:
       fn_get_available_shippings($company_id = null, $get_service_params = false, $storefront_id = null)

#. ::
   
       // Было:
       \Tygh\Addons\RusOnlineCashRegister\Service::getReceiptFromOrder(array $order, $type)
       // Стало:
       \Tygh\Addons\RusOnlineCashRegister\Service::getReceiptFromOrder(array $order, $type, $payment_method = Receipt::PAYMENT_METHOD_FULL_PAYMENT)

Удалённые функции
+++++++++++++++++

#. ::

       // Удаленная функция:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeByToken
       // Что использовать вместо неё:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeWithout3DSecure.
#. ::

       // Удаленная функция:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::charge 
       // Что использовать вместо неё:
       \Tygh\Addons\StripeConnect\Payments\StripeConnect::chargeWith3DSecure

Устаревшие функции
++++++++++++++++++

#. ::
 
       // Устаревшая функция:
       fn_expand_weight($weight)
       // Что использовать вместо неё:
       fn_convert_weight_to_imperial_units.

Новые функции
+++++++++++++

#. Проверяет, закодирована ли строка в формате UTF-16BE::
       
       fn_is_utf16be($str)
#. Проверяет, закодирована ли строка в формате UTF-16LE::

       fn_is_utf16le($str)

#. Проверяет, должны ли покупатель соглашаться с "Условиями и положениями" во время оформления заказа::

       fn_checkout_is_terms_and_conditions_agreement_required ()
       
#. Проверяет, имеет ли заказ статус “Предоплачен”::

       \Tygh/Addons/RusOnlineCashRegister/OrderData::isStatusPrepaid() 

#. Устанавливает признак способа расчета в кассовом чеке::

       \Tygh/Addons/RusOnlineCashRegister/Receipt/Receipt::setPaymentMethod($payment_method) 

#. Получает признак способа расчета в кассовом чеке::

       \Tygh/Addons/RusOnlineCashRegister/Receipt/Receipt::getPaymentMethod()

#. Конвертирует вес в фунты/унции::

       fn_convert_weight_to_imperial_units($weight) 

#. Конвертирует вес в килограммы/граммы::

       fn_convert_weight_to_metric_units($weight)

#. Удаляет конфигурационные данные и лишнюю информацию из корзины::

       fn_storefront_rest_api_strip_service_data(array $cart)

#. Меняет статус указанного пользователя::

       fn_change_user_status($user_id, $status_to, $is_notification_required = false)

#. Меняет статус указанной категории::

       fn_change_category_status($category_id, $status_to)

#. Делает символы в строке заглавными::

       fn_strtoupper($string, $charset = CHARSET)

Хуки
====

Изменённые хуки
+++++++++++++++

#. ::

       // Было:
       fn_set_hook('check_amount_in_stock', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart);
       // Стало:
       fn_set_hook('check_amount_in_stock', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $skip_error_notification);

#. ::

       // Было:
       fn_set_hook('check_amount_in_stock_before_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $current_amount);
       // Стало:
       fn_set_hook('check_amount_in_stock_before_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $current_amount, $skip_error_notification);

#. ::

       // Было:
       fn_set_hook('update_user_pre', $user_id, $user_data, $auth, $ship_to_another, $notify_user);
       // Стало:
       fn_set_hook('update_user_pre', $user_id, $user_data, $auth, 

Новые хуки
++++++++++

#. Выполняется перед отправкой сообщения по PHPMailer и позволяет выполнять низкоуровневые манипуляции с самим PHPMailer::

       fn_set_hook('phpmailertransport_send_message_before_send', $this, $message);

#. Выполняется вместе с проверкой на то, должны ли быть "Условия и положения" приняты покупателем во время оформления заказа. Позволяет установить требования непосредственно вам::

       fn_set_hook('checkout_is_terms_and_conditions_agreement_required_pre', $is_agreement_required); 
#. * Выполняется вместе с проверкой на необходимость принятия "Условий и положений" покупателем во время оформления заказа, после того, как определены требования. Позволяет менять результат проверки::

       fn_set_hook('checkout_is_terms_and_conditions_agreement_required_post', $is_agreement_required);

#. Выполняется перед началом поиска методов оплаты, работающими со Stripe модулями. Позволяет менять параметры поиска::

       fn_set_hook('stripe_data_loader_get_supported_payments_before', $params);

#. Выполняется при расчёте содержимого корзины после расчёта доставки. Позволяет менять содержимое корзины и список доставки::

       fn_set_hook('calculate_cart_content_after_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $lang_code, $area, $cart_products, $product_groups);

#. Выполняется после того, как заданы цены в заказе. Позволяет задавать дополнительные цены::

       fn_set_hook('storefront_rest_api_format_order_prices_post', $order, $currency);

#. Выполняется после того, как из корзины удалены конфигурационные данные и лишняя информация. Позволяет удалять дополнительные данные::

       fn_set_hook('storefront_rest_api_strip_service_data_post', $cart);

#. Выполняется перед сборкой содержимого дочерней корзины. Позволяет изменять содержимое дочерней корзины::

       fn_set_hook('place_suborders_pre', $order_id, $cart, $auth, $action, $issuer_id, $suborder_cart, $key_group, $group)



