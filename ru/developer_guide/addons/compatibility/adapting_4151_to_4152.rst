*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.15.2
*******************************************************

.. contents::
    :local:
    :backlinks: none

================
Изменения в ядре
================

----------------
Удалённые классы
----------------

#. ``\Tygh\Addons\YandexCheckout\Api\Client``

------------------
Изменённые функции
------------------

#. ::

       // Было:
       function fn_get_image_pairs($object_ids, $object_type, $pair_type, $get_icon = true, $get_detailed = true, $lang_code = CART_LANGUAGE);
       // Стало:
       function fn_get_image_pairs($object_ids, $object_type, $pair_type, $get_icon = true, $get_detailed = true, $lang_code = CART_LANGUAGE, $get_all = false);

#. ::

       // Было:
       public function asPrice($price, $currency_code = CART_SECONDARY_CURRENCY, $show_symbol = true, $check_alternative_currency = false);
       // Стало:
       public function asPrice($price, $currency_code = CART_SECONDARY_CURRENCY, $show_symbol = true, $check_alternative_currency = false, $is_rtl = false);

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется при установленном типе фильтра и после того, как отфилтруются параметров запроса. Позволяет изменять параметры::

       fn_set_hook('vendor_locations_get_products', $params, $filter_types, $fields, $sortings, $condition, $join);

#. Выполняется после добавления товара в корзину для создания заказа по API-запросу. Позволяет изменять данные корзины::

       fn_set_hook('api_orders_create_after_add_product_to_cart', $params, $status, $data, $valid_params, $this->auth, $cart);

#. Выполняется после создания отзыва на товар. Позволяет работать с созданным отзывом::

       fn_set_hook('product_reviews_create_post', $product_review_data, $product_review_id);

#. Выполняется перед проверкой количества товара в корзине. Позволяет изменить логику проверки количества товара в наличии::

       fn_set_hook('check_amount_in_stock_before_cart_amount_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $skip_error_notification);

---------------
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('get_image_pairs_pre', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code);
       // Стало:
       fn_set_hook('get_image_pairs_pre', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $get_all);

#. ::

       // Было:
       fn_set_hook('get_image_pairs_post', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $pairs_data, $detailed_pairs, $icon_pairs);
       // Стало:
       fn_set_hook('get_image_pairs_post', $object_ids, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code, $pairs_data, $detailed_pairs, $icon_pairs, $get_all);

#. ::

       // Было:
       fn_set_hook('product_bundle_service_update_links', $bundle_id, $product_data, $data);
       // Стало:
       fn_set_hook('product_bundle_service_update_links', $bundle_id, $products_data, $data);

#. ::

       // Было:
       fn_set_hook('get_block_pre', $block_id, $snapping_id, $lang_code);
       // Стало:
       fn_set_hook('get_block_pre', $block_id, $snapping_id, $lang_code, $dynamic_object);

#. ::

       // Было:
       fn_set_hook('get_block_post', $block, $snapping_id, $lang_code);
       // Стало:
       fn_set_hook('get_block_post', $block, $snapping_id, $lang_code, $dynamic_object).


