*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.15.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===================
Изменения в модулях
===================

--------------------------------------------------------------------
Модуль «Соответствие GDPR (Общему регламенту по защите данных в ЕС)»
--------------------------------------------------------------------

В 4.15.1 появился новый механизм, который дает возможность пользователю отказаться от необязательных cookie и ознакомиться со списком cookie, которые использует магазин.

~~~~~~~~~~~~~~~~~~~~~~~~~~~
Существующие разделы cookie
~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Strictly necessary cookies (раздел не отключается) — ``strictly_necessary``

#. Performance cookies — ``performance``

#. Functional cookies — ``functional``

#. Marketing cookies — ``marketing``

После "—" указаны имена, которые должны использоваться в схеме как ``cookie_purpose``.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Расширение списка cookie с помощью модуля
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Если ваш модуль добавляет новые cookie, и вы хотите расширить существующий список для соответствия стандарту, вам необходимо:

#. Расширить схему ``gdpr/klaro_config.php``.

   Каждый элемент схемы имеет следующую структуру::

     php
     $schema['services']['cookie_name'] = [
      'purposes' => ['cookie_purpose'],
         'name' => 'cookie_name',
         'translations' => [
             'zz' => [
                 'title' => 'langvar_identifier',
                 'description' => 'langvar_identifier'
             ],
         ],
         'required' => true/false,
         'default' => true/false
     ];
     return $schema;

#. Добавить необходимые языковые переменные в ``scripts.post.tpl``::

    <script>
        (function (_, $) {
            _.tr({
                ...
                "langvar_identifier": '{__("langvar_identifier")|escape:"javascript"}'
                ...
            });
        })(Tygh, Tygh.$);
    </script>

#. Подключить JS скрипт, который будет ставить cookie. Сделать это можно несколькими способами:

   3.1. ::

          html
          {script src="path/script.js" cookie-name="cookie_name"}

   3.2. ::

          html
          <script
              type="text/plain"
              data-type="application/javascript"
              data-src="src"
              data-name="cookie_name"
          ></script>

================
Изменения в ядре
================

------------
Новые классы
------------

#. ``\Tygh\VendorPayoutDetailsBuilder`` — создает массив элементов выплат для упрощения дополнительных расчетов.

----------------
Удалённые классы
----------------

#. ``\Tygh\Addons\VendorRating\Calculator\EvalBackend``

-------------
Новые функции
-------------

#. Создаёт параметры из запроса на получение списка товаров::

       function fn_products_form_product_list_params($request);

#. Обновляет подписчика на товар (если есть подписчик, то происходит обновление; если подписчиков не было, добавляет нового)::

       fn_update_product_subscriber($product_id, $subscriber_data);

#. Удаляет подписчиков на товар::

       fn_delete_product_subscribers($subscriber_ids);

#. Определяет, давать ли пользователю доступ к API администратора::

       fn_check_user_type_admin_area_for_api(array $user_data = []);

#. Предотвращает использование удаленных и отключенных валют::

       fn_save_currencies_integrity($primary_currency = CART_PRIMARY_CURRENCY);

#. Получает хуки Zapier::

       fn_zapier_get_hooks(array $params = []);

#. Обновляет хук Zapier::

       fn_zapier_update_hook(array $data, $hook_id = 0);

#. Удаляет хук Zapier::

       fn_zapier_delete_hook($hook_id)

#. Запускает транзакцию базы данных::

       db_transaction(Closure $closure, $attempts = 1);

------------------
Изменённые функции
------------------

#. ::

       // Было:
       function fn_get_default_product_options($product_id, $get_all = false, array $product = []);
       // Стало:
       function fn_get_default_product_options($product_id, $get_all = false, array $product = [], $only_avail = false);

#. ::

       // Было:
       function fn_is_allowed_options($product);
       // Стало:
       function fn_is_allowed_options($product, $only_avail = false);

#. ::

       // Было:
       function fn_checkout_get_shippping_calculation_type(array $cart, $is_location_changed);
       // Стало:
       function fn_checkout_get_shippping_calculation_type(array $cart, $is_location_changed, $is_shipping_method_changed = false);


====
Хуки
====

----------
Новые хуки
----------

#. Выполняется перед созданием общего товарного предложения::

       fn_set_hook('master_products_create_vendor_product_pre', $master_product_id, $company_id, $product, $result, $can_create);

#. Меняет параметры для получения списка товаров::

       fn_set_hook('products_form_product_list_params_post',  $request, $params);

#. Выполняется перед размещением заказа для создания заказа через API-запрос. Позволяет менять данные корзины::

       fn_set_hook('api_orders_create_before_place_order', $params, $status, $data, $valid_params, $cart, $customer_auth, $order_placement_action);

#. Выполняется после создания запроса на обратный звонок. Позволяет использовать данные и идентификатор созданного запроса::

       fn_set_hook('create_call_request_post', $data, $request_id;

#. Выполняется, когда исключение не было обработано, что позволяет пользователям регистрировать исключения::

       fn_set_hook('error_handler_handle_exception', $exception); 

#. Выполняется перед обновлением группы пользователей::

       fn_set_hook('update_usergroup_pre', $usergroup_data, $usergroup_id, $lang_code);

#. Выполняется перед удалением групп пользователей::

       fn_set_hook('delete_usergroups_pre', $usergroup_ids);

#. Выполняется перед получением реквизитов платежа для обновления заказа::

       fn_set_hook('vendor_payout_details_builder_create_updated_details_post', $this, $updated_order_info, $old_details, $updated_details);

#. Выполняется после создания всех частей платежа. Позволяет добавлять определенные элементы::

       fn_set_hook('vendor_payout_details_builder_create_details_post', $this, $order_info, $cart, $payout_details);

#. Позволяет выполнять дополнительные действия после установки модуля::

       fn_set_hook('install_addon_post', $addon, $show_notification, $install_demo, $allow_unmanaged);

#. Выполняется после обновления модуля::

       fn_set_hook('update_addon_post', $settings, $storefront_id); 

#. Выполняется после получения списка модулей. Позволяет менять список::

       fn_set_hook('get_addons_post', $params, $items_per_page, $lang_code, $storefront_id, $company_id, $addons, $addons_counter);

---------------
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('master_products_reindex_storefront_offers_count', $params, $conditions);
       // Стало:
       fn_set_hook('master_products_reindex_storefront_offers_count', $params, $conditions, $all_vendors_storefront_ids);

#. ::

       // Было:
       fn_set_hook('master_products_reindex_storefront_min_price', $params, $conditions);
       // Стало:
       fn_set_hook('master_products_reindex_storefront_min_price', $params, $conditions, $all_vendors_storefront_ids);

#. ::

       // Было:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes);
       // Стало:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes, $vendor_taxes).