*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.14.2
*******************************************************

.. contents::
    :local:
    :backlinks: none

================
Изменения в ядре
================

------------
Новые классы
------------

#. ``\Tygh\Enum\CategoryLinkTypes`` — содержит все типы ссылок категорий.

------------------
Изменённые функции
------------------

#. ::

       // Было:
       fn_exim_set_company($object_type, $object_key, $object_id, $company_name, &$processed_data = array())
       // Стало:
       fn_exim_set_company($object_type, $object_key, $object_id, $company_name, array &$processed_data = [], $check_runtime_company_id = true)

#. ::

       // Было:
       fn_import_product_price($product_id, $price, $is_create, $store = '')
       // Стало:
       fn_import_product_price($product_id, $price, array $object, $is_create, $store = '')

#. ::

       // Было:
       fn_exim_set_product_company($product_id, $company_name, &$processed_data)
       // Стало:
       fn_exim_set_product_company(array $object, $product_id, $company_name, array &$processed_data)

#. ::

       // Было:
       fn_import_product_descr(array $data, $product_id, $field)
       // Стало:
       fn_import_product_descr(array $data, $product_id, $field, $is_new = false, array $object = [])


#. ::

       // Было:
       fn_exim_set_product_categories($product_id, $link_type, array $categories_data, $category_delimiter, $store_name = '', array &$processed_data = [], $is_new = false)
       // Стало:
       fn_exim_set_product_categories($product_id, $link_type, array $categories_data, $category_delimiter, $store_name = '', array &$processed_data = [], $is_new = false, array $object = [])

-------------
Новые функции
-------------

#. Проверяет, выполнятся ли значение true::

     \Tygh\Enum\YesNo::isTrue($val)

#. Проверяет, выполнятся ли значение false::

     \Tygh\Enum\YesNo::isFalse($val)

#. Подготавливает данные для импорта товаров, размещеннных на текущей витрине::

     fn_ult_import_prepare_products_shared_for_current_storefront(array &$import_data)

#. Отфильтровывает поля импорта, запрещенные для общих товаров::

     fn_ult_import_filter_fields_for_shared_products(array &$object, array $pattern)

#. Получает варианты опций товара::

     fn_get_product_option_variants(array $params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

#. Получает статусы тех продавцов, которые должны отображаться в магазине::

     fn_get_available_company_statuses()

#. Проверяет, установлены ли цена и название товара. Если нет, устанавливает их равными 0 и пустому значению::

     fn_ult_import_check_product_data(array $primary_object_id, array &$object)

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется перед фильтрацией данных импорта, позволяет расширить массив разрешенных полей для общих товаров::

     fn_set_hook('ult_import_filter_fields_for_shared_products', $object, $pattern, $allowed_fields_for_shared_products);

#. Выполняется до установки параметров, меняет параметры для получения вариантов опций товара::

     fn_set_hook('get_product_option_variants_pre', $params, $items_per_page, $lang_code);

#. Выполняется перед SQL-запросом, меняет SQL-параметры для получения вариантов опций товара::

     fn_set_hook('smarty_component_configurable_page_field_before_output', $entity, $tab, $section, $field, $field_config, $params, $content, $template);

#. Выполняется после получения статусов тех продавцов, которые должны отображаться в магазине Позволяет добавить другие статусы продавцов::

     fn_set_hook('smarty_component_configurable_page_section_before_output', $entity, $tab, $section, $section_config, $params, $content, $template);

--------------
Удалённые хуки
--------------

#. Используйте хук ``get_product_option_variants_pre`` вместо хука::

     fn_set_hook('get_product_options_get_variants', $v_fields, $v_condition, $v_join, $v_sorting, $option_ids, $lang_code).