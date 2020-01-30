*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.11.3
*******************************************************

.. contents::
    :local:
    :backlinks: none

=======
Функции
=======

-------------
Новые функции
-------------

#. Получает статусы заказов, которые подразумевают, что оплата получена::

     fn_get_settled_order_statuses()

#. Устанавливает шаблоны модуля из репозитория в директории модуля; устанавливает языковые переменные модуля; устанавливает макеты модуля для каждой темы::

     fn_reinstall_addon_files($addon)

#. Устанавливает макеты модуля для каждой темы::

     fn_install_addon_layouts($addon)

#. Проверяет, существует ли модуль::

     fn_check_addon_exists($addon_name)

#. Проверяет, является ли пользователь администратором::

     fn_is_admin_account_type()

#. Проверяет, включена ли тема хотя бы на одной витрине::

     fn_is_theme_active($theme_name)

------------------
Изменённые функции
------------------

#.

   ::

     // Было:
     fn_get_feature_data_with_subfeatures($feature_id, $lang_code)

     // Стало:
     fn_get_feature_data_with_subfeatures($feature_id, $lang_code, $params = [])

#.

   ::

     // Было:
     fn_get_discussion_company_condition($field)

     // Стало:
     fn_get_discussion_company_condition($field, $company_id = '')

#.

   ::

     // Было:
     fn_get_discussion($object_id, $object_type, $get_posts = false, $params = array())

     // Стало:
     fn_get_discussion($object_id, $object_type, $get_posts = false, $params = array(), $company_id = '')


====
Хуки
====

----------
Новые хуки
----------

#. Хук выполняется в конце получения статусов заказов, которые подразумевают, что заказ оплачен::

     fn_set_hook('get_settled_order_statuses_post', $settled_order_statuses)

#. Хук выполняется в конце функции, позволяя изменить результат её работы::

     fn_set_hook('discussion_is_user_eligible_to_write_review_for_product_post', $user_id, $product_id, $result, $need_to_buy_first)

#. Хук выполняется после получения магазинов/пунктов самовывоза/складов и позволяет изменять их данные::

     fn_set_hook('store_locator_get_store_locations_post', $params, $items_per_page, $lang_code, $data)

#. Хук выполняется при генерации SEO URL и позволяет его изменять::

     fn_set_hook('seo_url_post', $url, $area, $original_url, $prefix, $company_id_in_url, $lang_code, $locations, $parsed_url, $parsed_query, $link_parts, $rewritten, $seo_object, $seo_settings)

---------------
Изменённые хуки
---------------

#.

   ::

     // Было:
     fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $existing_company_ids, $product_categories_company_ids)

     // Стало:
     fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $existing_company_ids, $product_categories_company_ids, $added_company_ids, $deleted_company_ids)
