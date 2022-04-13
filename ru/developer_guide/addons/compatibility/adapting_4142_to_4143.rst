*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.14.3
*******************************************************

.. contents::
    :local:
    :backlinks: none

===============
Общие изменения
===============

----------------------------------------------------
Правила по использованию Smarty-модификатора 'strip'
----------------------------------------------------

Использование тэга ``strip`` позволяет избавиться от пробелов между атрибутами, когда внутри тэга есть перенос строки.
Чтобы этого избежать, необходимо избавиться от переносов строк внутри атрибута при использовании тэга  ``strip``; добавить пустую переменную в конце строки с переносом; или использовать ``render_tag_attrs`` вместо ``strip``.

Пример правильного использования тэга ``strip``::

    {strip}
        <div attr1="val1" {""}
            attr2="val2" {""}
            attr3="val3">
            Text
        </div>
    {/strip}

================
Изменения в ядре
================

------------
Новые классы
------------

#. ``\Tygh\Enum\ShipmentStatuses`` — содержит статусы отгрузок по умолчанию.

------------------
Изменённые функции
------------------

#. ::

       // Было:
       fn_send_product_notifications($product_id)
       // Стало:
       fn_send_product_notifications($product_id, $params = [])
    
#. ::

       // Было:
       function fn_get_product_subscribers($params, $items_per_page = 0)
       // Стало:
       function fn_get_product_subscribers($params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

#. ::

       // Было:
       \Tygh\Addons\CommerceML\Commands\CreateImportCommand::create(array $xml_file_paths, array $auth, $import_key, $import_type)
       // Стало:
       \Tygh\Addons\CommerceML\Commands\CreateImportCommand::create(array $xml_file_paths, array $auth, $import_key, $import_type, $company_id)

-------------
Новые функции
-------------

#. Обновляет информацию о подписчике товара (обновляет, если подписчик существует, и добавляет информацию, если нет)::

       fn_update_product_subscriber($product_id, $subscriber_data)

#. Удаляет подписчиков товара::

       fn_delete_product_subscribers($subscriber_ids)

#. Определяет, разрешать ли пользователю доступ к API администратора::

       fn_check_user_type_admin_area_for_api(array $user_data = [])

=================
Изменения в хуках
=================

---------------
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields);
       // Стало:
       fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields, $params, $conditions);

#. ::

       // Было:
       fn_set_hook('get_product_subscribers_pre', $params);
       // Стало:
       fn_set_hook('get_product_subscribers_pre', $params, $items_per_page, $lang_code);

----------
Новые хуки
----------

#. Меняет параметры SQL для поиска подписчиков::

       fn_set_hook('get_product_subscribers', $params, $joins, $conditions, $fields, $lang_code);

#. Выполняется перед обновлением информации о подписчике товара::

       fn_set_hook('update_product_subscriber_pre', $product_id, $subscriber_data);

#. Выполняется внутри обработчика хука  ``pre_place_order`` после того, как группе товаров присвоен способ доставки маркетплейса. Позволяет управлять информацией о доставке по заказам с доставкой от маркетплейса::

       fn_set_hook('order_fulfillment_set_marketplace_shipping_to_product_group', array $cart, $group_key, $marketplace_group_key, array $chosen_shipping_data);

#. Позволяет изменять информацию в ссылках до их создания::

       fn_set_hook('product_bundle_service_update_links', $bundle_id, $product_data, $data);

#. Выполняется после расчёта количества товаров в корзине. Позволяет изменять рассчитанное количество::

       fn_set_hook('get_products_amount_post', $cart, $cart_products, $type, $amount);

#. Выполняется перед тем, как стоимость доставки будет заменена отформатированным значением. Позволяет изменять значение::

       fn_set_hook('normalized_shipping_rate_reformat_value', $normalized_data, $rate, $rate_type, $formatted_value);

#. Обновляет SEO-имя импортированного товара после обновления названия товара::

       fn_set_hook('import_product_descr', $data, $product_id, $prod_company_id, $field, $is_new, $object);

#. Выполняется перед актуализацией информации об основном количестве товара::

       fn_set_hook('master_products_actualize_master_product_quantity_pre', $product_id, $master_product_id, $quantity);

#. Выполняется перед поиском лучшего товарного предложения. Позволяет изменять информацию о товарах продавца::

       fn_set_hook('master_products_get_best_product_offer_pre', $master_product_id, $vendor_product_ids);

#. Добавляет дополнительные действия перед удалением назначений::

       fn_set_hook('delete_destinations', $destination_ids, $can_delete);