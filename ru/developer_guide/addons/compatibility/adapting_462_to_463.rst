******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.6.3
******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет изменить параметры отзыва или комментария до их обработки и записи в базу данных::

     fn_set_hook('update_discussion_pre', $data);

#. Этот хук позволяет получить доступ к отзывам и комментариям, которые уже были обработаны и записаны в базу данных::

     fn_set_hook('update_discussion_posts_post', $posts);

#. Этот хук позволяет получить доступ к данным об отзывах и комментариях после того, как эти данные были отформатированы, записаны в базу данных и отправлены пользователям по почте::

     fn_set_hook('add_discussion_post_post', $post_data, $send_notifications);

#. Этот хук позволяет изменить параметры подписки на товар до их обработки и записи в базу данных::

     fn_set_hook('update_product_notifications_pre', $data);

#. Этот хук позволяет изменить параметры подписки на товар перед удалением записи из базы данных::

     fn_set_hook('update_product_notifications_before_delete', $data, $where);

#. Этот хук позволяет добавлять или удалять поля перед получением данных о подписках на товар из базы данных::

     fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields);

#. Этот хук выполняется после того, как для выплаты была рассчитана комиссия, и позволяет изменять данные выплаты::

     fn_set_hook('vendor_plans_calculate_commission_for_payout_post', $order_info, $company_data, $payout_data);

---------------
Изменённые хуки
---------------

#.

  ::

    // Было:
    fn_set_hook('get_banners', $params, $condition, $sorting, $limit, $lang_code);

    // Стало:
    fn_set_hook('get_banners', $params, $condition, $sorting, $limit, $lang_code, $fields);

#.

  ::

    // Было:
    fn_set_hook('delete_product_option_post', $option_id, $pid, $option_deleted);

    // Стало:
    fn_set_hook('delete_product_option_post', $option_id, $pid, $option_deleted, $product_id);

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Получает авторизационный токен пользователя::

      fn_get_user_auth_token($user_id, $ttl = 604800)

#. Генерирует URN на основе параметров запроса::

      \Tygh\Tools\Url::buildUrn($dispatch, array $query_params = array())

#. Получает протокол передачи данных, который используется в URL при работе с магазином в режиме командной строки::

      fn_get_console_protocol($area)

#. Получает средний рейтинг объекта (например, товара)::

      fn_discussion_get_average_object_rating($object_id, $object_type)

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    function fn_get_product_options_data($cart_products, $_cart)

    // Стало:
    function fn_get_product_options_data($cart_products, $_cart, $params)


#.

  ::

    // Было:
    function fn_change_product_data_in_cart($cart_products, $_cart)

    // Стало:
    function fn_change_product_data_in_cart($cart_products, $_cart, $params)


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
    Tygh\Addons\ProductVariations\Product\Manager::getProductFieldValue($product_id, $field, $default = null)

    // Стало:
    Tygh\Addons\ProductVariations\Product\Manager::getProductFieldValue($product_id, $field, $default = null, $ignore_cache = false)
