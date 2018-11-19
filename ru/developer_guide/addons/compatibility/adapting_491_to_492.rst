******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.9.2
******************************************************

===============
Общие изменения
===============

Способ оплаты **FuturePay** объявлен устаревшим.

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет выполнять действия перед обработкой запроса на обратный звонок:

     fn_set_hook('do_call_request', $params, $product_data, $cart, $auth, $company_id);

#. Этот хук выполняется при получении данных товара при просмотре товара в панели администратора. Он позволяет изменять параметры, которые будут передаваться в функцию получения данных товара::

     fn_set_hook('product_variations_get_parent_product_data', $product, $auth, $lang_code, $parent_product_id, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition, $feature_variants_selected_only);

#. Этот хук выполняется после получения шаблона страницы "Магазин закрыт" из файла. Хук позволяет изменить шаблон страницы и плейсхолдеры с сообщением об ошибке::

     fn_set_hook('development_show_stub', $placeholders, $append, $content);

#. Этот хук выполняется перед получением групп пользователей, которые отображаются на странице редактирования способа оплаты. Хук позволяет изменять параметры, передаваемые в функцию ``fn_get_usergroups function``::

     fn_set_hook('get_payment_usergroups', $params, $lang_code);

---------------
Устаревшие хуки
---------------

#. ``fn_set_hook('pre_define_usergroups', $user_data, $area)`` объявлен устаревшим.

   Используйте ``fn_set_hook('define_usergroups_pre', $user_data, $area)``.

#. ``fn_set_hook('post_define_usergroups', $active_usergroups, $user_data, $area)`` объявлен устаревшим.

   Используйте ``fn_set_hook('define_usergroups_post', $user_data, $area, $active_usergroups)``.


====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Удаляет комбинации с выключенными или удалёнными опциями::

     fn_delete_outdated_combinations($product_id)

#. Предоставляет данные о родительском товаре при просмотре вариации в панели администратора::

     fn_product_variations_get_parent_product_data($product, $auth, $lang_code = CART_LANGUAGE)

#. Получает группы пользователей, которые отображаются на странице управления способом оплаты::

     fn_get_payment_usergroups($params = [], $lang_code = DESCR_SL)

#. Проверяет, все ли поля пункта назначения пустые::

     \Tygh\Addons\RusCustomerGeolocation\RusCustomerGeolocation::isLocationEmpty

#. Заполняет отсутствующие поля в ``$cart['user_data']`` данными из указанного пункта назначения::

     fn_lite_checkout_fill_user_data_from_location(array $user_data, RusCustomerGeolocation $manager = null, Location $location = null)

-----------------
Удалённые функции
-----------------

``fn_get_sms_auth_data();``
