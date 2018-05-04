******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.7.4
******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук выполняется после создания заявки на обратный звонок::

     fn_set_hook('call_requests_do_call_request_post', $params, $product_data, $cart, $auth, $result);

#. Этот хук выполняется после обновления подписчика рассылки::

     fn_set_hook('newsletters_update_subscriptions_post', $subscriber_id, $user_list_ids, $subscriber, $params);

#. Этот хук выполняется после обновления подписки на товар::

     fn_set_hook('update_product_notifications_post', $data, $subscribed, $deleted);

#. Этот хук выполняется после того, как обработаны настройки (опции) у паттерна экспорта/импорта (паттерн — это совокупность настроек и полей экспорта/импорта)::

     fn_set_hook('exim_get_pattern_definition_options', $pattern_id, $get_for, $extra, $option_id, $option_data, $schema);


====================
Изменения в функциях
====================

-------------
Новые функции
-------------

Функция сверяет итог указанного заказа с итогом заказа в сессии чтобы удостовериться, что заказ был размещён правильно::

  fn_paypal_order_total_is_correct($order_id)

------------------
Изменённые функции
------------------

::

  // Было:
  function fn_recover_password_generate_key($user_email, $notify = true)
  // Стало:
  function fn_recover_password_generate_key($user_email, $notify = true, $company_id = '', $area = AREA)
