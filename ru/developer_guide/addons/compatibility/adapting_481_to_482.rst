******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.8.2
******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет изменить консольную команду::

     fn_set_hook('fn_get_console_command', $prefix, $script, $args, $cmd)

#. Этот хук позволяет модифицировать параметры экспортируемых товаров::

     fn_set_hook('data_feeds_export_before_get_products', $datafeed_data, $pattern, $params)

---------------
Изменённые хуки
---------------

#.

  ::

    // Было:
    fn_set_hook('clone_product_options_post', $from_product_id, $to_product_id, $from_global_option_id);

    // Стало:
    fn_set_hook('clone_product_options_post', $from_product_id, $to_product_id, $from_global_option_id, $change_options, $change_variants);

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Предоставляет команду для запуска контроллера::

    function fn_get_console_command($prefix, $script, $args)

#. Получает статистику таблиц базы данных::

    function fn_get_stats_tables()

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    function fn_rma_update_order_taxes(&$taxes_list, $item_id, $old_amount, $new_amount, &$current_order)

    // Стало:
    function fn_rma_update_order_taxes(&$taxes_list, $item_id, $old_amount, $new_amount, &$current_order, $price = null, array $original_order = null)

#.

  ::

    // Было:
    function fn_find_file($prefix, $file)

    // Стало:
    function fn_find_file($prefix, $file, $company_id = null)


------------------------------
Новые функции в русской версии
------------------------------

Возвращает сохранённое местоположение покупателя из запроса на расчёт стоимости доставки или из данных пользователя в корзине::

  fn_rus_cities_get_location_from_session($stored_location = false, $customer_loc = true, $user_data = true)
