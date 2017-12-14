******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.7.1
******************************************************

===============
Общие изменения
===============

#. ``\Tygh\Backend\Cache\ABackend::__construct`` теперь выдаёт ``DeveloperException``, когда кэш инициализируется раньше, чем  ``company_id``.

#. Модуль "Города" (``rus_cities``) теперь содержит всю общую информацию о городах, используемых модулями "СДЭК" (``rus_sdek``), "eDost" (``rus_edost``), "Деловые линии" (``rus_dellin``) и "ПЭК" (``rus_pecom``). Код, который работает с городами, был изменён во всех этих модулях.

#. Изменён механизм автозаполнения навзания города в СДЭК.

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет изменять параметры и результат функции после её выполнения::

     fn_set_hook('get_static_data_post', $params, $lang_code, $s_data);

#. Этот хук позволяет изменять входные параметры функции::

     fn_set_hook('delete_static_data_pre', $param_id);

#. Этот хук позволяет изменять входные параметры функции::

     fn_set_hook('get_static_data_pre', $params, $lang_code);

#. Этот хук позволяет изменять параметры и результат функции после её выполнения::

     fn_set_hook('get_static_data_post', $params, $lang_code, $s_data);

#. Этот хук позволяет изменять входные параметры функции::

     fn_set_hook('delete_static_data_pre', $param_id);

#. Этот хук позволяет изменять параметры функции после её выполнения::

     fn_set_hook('delete_static_data_post', $param_id, $delete_ids);

#. Этот хук позволяет изменять входные параметры функции::

     fn_set_hook('delete_promotions_pre', $promotion_ids);

#. Этот хук позволяет изменять идентификаторы промо-акций после выполнения SQL-запросов::

     fn_set_hook('delete_promotions_post', $promotion_ids);

#. Этот хук позволяет изменять входные параметры функции::

     fn_set_hook('update_promotion_pre', $data, $promotion_id, $lang_code);

#. Этот хук позволяет изменять параметры и результат функции после её выполнения::

     fn_set_hook('update_promotion_post', $data, $promotion_id, $lang_code);

#. Этот хук позволяет изменять параметры и результат функции после её выполнения::

     fn_set_hook('get_promotions_post', $params, $items_per_page, $lang_code, $promotions);

#. Этот хук позволяет изменять страницы до их включения в структуру ``page_tree``::

     fn_set_hook('get_pages_after_sql', $params, $items_per_page, $lang_code, $pages);

#. Этот хук позволяет изменять параметры выборки компаний и получившийся список компаний::

     fn_set_hook('get_companies_post', $params, $auth, $items_per_page, $lang_code, $companies);

#. Этот хук позволяет изменять данные товара перед инициализацией вкладок товара::

     fn_set_hook('init_product_tabs_pre', $product);

#. Этот хук позволяет изменять данные вкладок товара перед передачей этих данных в шаблон::

     fn_set_hook('init_product_tabs_post', $product, $tabs);

--------------
Изменёные хуки
--------------

#.

  ::

    // Было:
    fn_set_hook('get_statuses', $join, $condition, $type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id);

    // Стало:
    fn_set_hook('get_statuses', $join, $condition, $type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id, $order);

#.

  ::

    // Было:
    fn_set_hook('get_statuses_post', $statuses,$join, $condition,$type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id);

    // Стало:
    fn_set_hook('get_statuses_post', $statuses,$join, $condition,$type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id, $order);

#.

  ::

    // Было:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data, $rebuild);

    // Стало:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data, $rebuild, $company_id);

#.

  ::

    // Было:
    fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild);

    // Стало:
    fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id);

#.

  ::

    // Было:
    fn_set_hook('get_promotions', $params, $fields, $sortings, $condition, $join);

    // Стало:
    fn_set_hook('get_promotions', $params, $fields, $sortings, $condition, $join, $group, $lang_code);

----------------------------------
Новые хуки только в русской версии
----------------------------------

#. Этот хук служит для подготовки параметров SQL-запроса перед получением списка городов::

     fn_set_hook('get_cities_pre', $params, $items_per_page, $lang_code, $fields, $condition, $join);

#. Этот хук служит для изменения данных в списке городов::

     fn_set_hook('get_cities_post', $params, $items_per_page, $lang_code, $cities);

#. Этот хук служит для обновления данных города::

     fn_set_hook('update_city_post', $city_data, $city_id, $lang_code);


====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Проверяет наличие перевода для языковой переменной::

     fn_is_lang_var_exists($value)

#. Получает перевод для языковой переменной::

     fn_exim_get_field_label($value)

#. Получает код локали по коду языка::

     \Tygh\Languages\Languages::getLocaleByLanguageCode

#. Округляет рейтинг в отзыве::

     fn_discussion_round_rating($rating, $decimals = 2)

#. Инициализирует вкладки товара::

     fn_init_product_tabs($product)

-------------------------------------
Новые функции только в русской версии
-------------------------------------

#. Обновляет данные города в таблицах ``rus_cities`` и ``rus_city_descriptions``::

     function fn_update_city($city_data, $city_id = 0, $lang_code = DESCR_SL)

#. Ищет города по параметрам::

     function fn_rus_cities_find_cities($params, $lang_code = CART_LANGUAGE)

#. Получает список городов в правильном формате::

     function fn_rus_cities_format_to_autocomplete($cities)

#. Получает идентификаторы города по его названию::

     function fn_rus_cities_get_city_ids($city, $state, $country, $lang_code = CART_LANGUAGE)

#. Добавляет данные городов в таблицу::

     function fn_rus_cities_add_cities_in_table($rows)

#. Получает полный список городов::

     function fn_rus_cities_get_all_cities($rows)

#. Получает коды eDost для городов::

     function fn_rus_edost_get_codes($cities_ids)

#. Добавляет данные городов в таблицу ``rus_edost_cities_link``::

     function fn_rus_edost_add_cities_in_table($rows)

#. Проверяет, существует ли код региона::

     function fn_rus_sdek_check_state_code($state, $country = '', $avail_only = true)

#. Получает данные СДЭК для указанного города::

     function fn_rus_sdek_get_sdek_data($city_id)

#. Добавляет данные городов в таблицу ``rus_sdek_cities_link``::

     function fn_rus_sdek_add_cities_in_table($rows)

#. Добавляет данные городов в таблицу ``rus_pecom_cities_link``:: 

     function fn_rus_pecom_add_cities_in_table($rows)

#. Добавляет данные городов в таблицу ``rus_dellin_cities_link``:: 

     function fn_rus_dellin_add_cities_in_table($rows)

#. Считывает данные городов из CSV-файла для добавления этих данных в таблицы::

     function fn_rus_cities_read_cities_by_chunk($path, $size, $function_callback)

------------------
Изменённые функции
------------------

#. 

  ::


    // Было:
    function fn_paypal_payment_form($processor_data, $token)

    // Стало:
    function fn_paypal_payment_form($processor_data, $token, $return = false)

#.

  ::

    // Было:
    function fn_paypal_get_error($result)

    // Стало:
    function fn_paypal_get_error($result, $show_notification = true, $return_type = 'text')

#.

  ::

    // Было:
    app/controllers/backend/product_filters.php fn_update_product_filter($filter_data, $filter_id, $lang_code = DESCR_SL)

    // Стало:
    app/functions/fn.catalog.php fn_update_product_filter($filter_data, $filter_id, $lang_code = DESCR_SL)

#.

  ::

    // Было:
    function fn_update_product_categories($product_id, $product_data, $rebuild = false);

    // Стало:
    function fn_update_product_categories($product_id, $product_data, $rebuild = false, $company_id = 0)

#.

  ::

    // Было:
    function fn_ult_get_categories(&$params, &$join, &$condition, &$fields, &$group_by, &$sortings)

    // Стало:
    function fn_ult_get_categories(&$params, &$join, &$condition, &$fields, &$group_by, &$sortings, &$lang_code)

------------
Новые классы
------------

#. ``\Tygh\Enum\ProductOptionsApplyOrder`` содержит возможные порядки применения опций (или одновременно, или последовательно).


-----------------------------------------
Удалённые функции только в русской версии
-----------------------------------------

#. ``fn_edost_update_table_cities``

#. ``fn_cities_update_table_cities``
