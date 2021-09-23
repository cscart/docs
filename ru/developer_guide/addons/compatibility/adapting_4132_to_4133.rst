*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.13.3
*******************************************************

.. contents::
    :local:
    :backlinks: none

================
Изменения в ядре
================

------------------
Изменённые функции
------------------

#. ::

       // Было:
       fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [])
       // Стало:
       fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [], $changed = false, $input_object_name = '')

#. ::

       // Было:
       fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, $formatter = null)
       // Стало:
       fn_vendor_categories_fee_calculate_payout($order_total, $payout_data, $products, $main_categories_fee, $parent_categories_fee, $payouts_history, $formatter = null, $products_subtotal = null)

#. ::

       // Было:
       fn_get_preview_url($uri, $object_data, $user_id)
       // Стало:
       fn_get_preview_url($uri, $object_data, $user_id, $lang_code = DESCR_SL)

#. ::

       // Было:
       fn_seo_check_redirect_url($url, $company_id = 0)
       // Стало:
       fn_seo_check_redirect_url($url, $company_id = 0, $is_destination_url = false)

#. ::

       // Было:
       fn_get_destinations($lang_code = CART_LANGUAGE)
       // Стало:
       fn_get_destinations($lang_code = CART_LANGUAGE, $params = [])

#. ::

       // Было:
       function fn_bottom_panel_get_redirect_url($from_area, $from_url, $current_area, $current_account_type)
       // Стало:
       function fn_bottom_panel_get_redirect_url($from_area, $from_url, $current_area, $current_account_type, $user_id)

#. ::

       // Было:
       fn_yml_get_offers_features()
       // Стало:
       fn_yml_get_offers_features($company_id = 0)

#. ::

       // Было:
       fn_yml_update_offers_features($features)
       // Стало:
       fn_yml_update_offers_features(array $features, $company_id = 0)

#. ::

       // Было:
       function fn_mobile_app_update_settings($setting_id, array $settings, $storefront_id = 0)
       // Стало:
       function fn_mobile_app_update_settings($setting_id, array $settings, $storefront_id = 0, $color_preset = ColorPresets::CUSTOM)

-------------
Новые функции
-------------

#. Получает содержимое HTTP-заголовка *Content-disposition* для указанного имени файла::

       fn_get_content_disposition_header(string $filename)

#. Проверяет, включен ли модуль “Тарифные планы для продавцов” и обновляет статус группы пользователей::

       fn_vendor_privileges_check_and_update_usergroup_status(array $user_data)

#. Нормализует названия объектов для SEO::

       fn_seo_normalize_object_name($_object_name)

#. Получает цели характеристик по идентификаторам характеристик::

       fn_get_product_feature_purposes_by_feature_ids($feature_ids)

====================
Изменения в шаблонах
====================

----------
Новые хуки
----------

#. ``index:searchanise_init``

#. ``addons:tabs_content``


=================
Изменения в хуках
=================

---------------
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // Стало:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

#. ::

       // Было:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // Стало:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

#. ::

       // Было:
       fn_set_hook('get_destinations', $lang_code, $fields, $joins, $condition, $group, $sorting, $limit);
       // Стало:
       fn_set_hook('get_destinations', $lang_code, $fields, $joins, $condition, $group, $sorting, $limit, $params);

#. ::

       // Было:
       fn_set_hook('change_company_status_before_mail', $company_id, $status_to, $reason, $status_from, $skip_query, $notify, $company_data, $user_data, $result);
       // Стало:
       fn_set_hook('change_company_status_before_mail', $company_id, $status_to, $reason, $status_from, $skip_query, $notify, $company_data, $user_data, $result, $account);

#. ::

       // Было:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission);
       // Стало:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes);

----------
Новые хуки
----------

#. Выполняется перед удалением модуля::

       fn_set_hook('uninstall_addon_pre', $addon_name, $show_message, $allow_unmanaged, $execute_schema_queries); 

#. Выполняется после удаления модуля::

       fn_set_hook('uninstall_addon_post', $addon_name, $allow_unmanaged);

#. Позволяет изменить набор идентификаторов продавцов до получения ссылок на их магазины::

       fn_set_hook('google_sitemap_write_companies_to_sitemap_before_vendor_stores', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $vendor_stores); 

#. Преобразует информацию на странице для её индексации::

       fn_set_hook('se_get_pages_data_post', $pages, $data, $pages_ids, $company_id, $lang_code);

#. Расширяет отображение типов характеристик::

       fn_set_hook('se_get_feature_type_mapping', $types_map);

#. Выполняется до размещения заказа и присвоения статуса заказу. Позволяет обработать информацию о размещённом заказе::

       fn_set_hook('place_order_post', $cart, $auth, $action, $issuer_id, $parent_order_id, $order_id, $order_status, $short_order_data, $notification_rules);

