******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.8.1
******************************************************

===============
Общие изменения
===============

-----------------------------------------------------------------------
Технические изменения в обработке уведомлений об оплате (IPN) от PayPal
-----------------------------------------------------------------------

PayPal отправляет в магазин служебные уведомления об оплате (т.н. Instant Payment Notifications или IPN). Они автоматически меняют статус заказа в CS-Cart по правилам, которые вы задаёте в настройках модуля **Платежи через PayPal**.

**Раньше** CS-Cart полностью пересчитывал заказ после получения IPN по этому заказу. Это приводило к ряду побочных эффектов и могло вызывать проблемы в сторонних модулях.

**Теперь** CS-Cart обрабатывает IPN проще и быстрее, а пересчёта заказа не происходит. Если в своём модуле вы использовали обходные пути, чтобы избавиться от побочных эффектов пересчёта заказа, то теперь эти обходные пути больше не нужны.

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук изменяет значения в массиве идентификаторов товаров, прежде чем статус одобрения этих товаров (см. модуль **Премодерация товаров продавцов**) будет изменён::

     fn_set_hook('change_approval_status_pre', $product_ids, $status);

#. Этот хук выполняется при применении промо-акций перед получением списка применимых промо-акций::

     fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions);

#. Этот хук выполняется перед получением списка способов доставки в панели администратора::

     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition);

#. Этот хук выполняется для каждого фильтра товаров и может использоваться для расширения параметров поиска, чтобы искать товары по определённым полям::

     fn_set_hook('generate_filter_field_params', $params, $filters, $selected_filters, $filter_fields, $filter, $structure);

#. Этот хук позволяет расширить или изменить стандартные параметры фильтров товаров, такие как ``$variant_values``, ``$range_values``, ``$field_variant_values``, ``$field_range_values``::

     fn_set_hook('get_current_filters_post', $params, $filters, $selected_filters, $area, $lang_code, $variant_values, $range_values, $field_variant_values, $field_range_values);

#. Этот хук позволяет изменять значения, на основе которых рассчитываются выплаты продавцов в Multi-Vendor::

     fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission);

---------------
Изменённые хуки
---------------

::

  // Было:
  fn_set_hook('get_filters_products_count_post', $params, $lang_code, $filters);

  // Стало:
  fn_set_hook('get_filters_products_count_post', $params, $lang_code, $filters, $selected_filters);

--------------
Удалённые хуки
--------------

#. ``fn_set_hook('amazon_validate_cart', $items, $cart, $cart_items_amount);``

#. ``fn_set_hook('amazon_calculate_promotions', $callback_response, $cart, $processor_data);``

#. ``fn_set_hook('amazon_validate_cart_item', $cart, $sku, $qty, $cart_id, $is_valid);``

#. ``fn_set_hook('amazon_products', $amazon_products, $cart);``


====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Получает электронный адрес подписчика по идентификатору::

     fn_newsletters_get_subscriber_email_by_user_id($user_id)

#. Получает опции товара по умолчанию::

     Tygh\Addons\ProductVariations\Product\Manager::getDefaultVariationOptions($product_id);

#. Обновляет вариацию товара, установленную по умолчанию::

     Tygh\Addons\ProductVariations\Product\Manager::getDefaultVariationOptions\Product\Manager::updateDefaultVariation($variation_product_id = 0, $parent_product_id = 0)

#. Получает простой список категорий по предоставленным идентификаторам, а также их родительские категории (в формате ``array('parent_id' => 'parent_name')``)::

     function fn_get_categories_list_with_parents(array $category_ids, $lang_code = CART_LANGUAGE)

#. Обновляет цены вариаций товаров::

     Tygh\Addons\ProductVariations\Product\Manager::updateProductVariationsPrices($product_id, $price, $prices, $auth)

------------------
Изменённые функции
------------------

::

  // Было:
  \Tygh\Shippings\RusPickpoint::zonesPickpoint($url_zone, $data_zone, $data_url)

  // Стало:
  \Tygh\Shippings\RusPickpoint::zonesPickpoint($url_zone, $data_zone, $data_url, $delivery_mode = '')


------------------
Устаревшие функции
------------------

#. Функция ``fn_check_addon_permission`` устарела; связанный с ней раздел ``addons`` в схеме ``permissions/vendor`` был удалён.

----------------------------------
Удалённые функции в русской версии
----------------------------------

#. ``fn_yml_export_import_ym($params)``

#. ``fn_yml_export_import_products($price_ids)``

#. ``fn_yml_export_import_categories($price_ids)``

#. ``fn_yml_export_import_settings()``
