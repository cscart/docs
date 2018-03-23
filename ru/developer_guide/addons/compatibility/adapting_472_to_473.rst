******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.7.3
******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет изменять параметры сообщения, прежде чем создавать экземпляр объекта сообщения::

     fn_mve_mailer_create_message_before($mailer, $message, $area, $lang_code, $transport, $builder)

---------------
Изменённые хуки
---------------

#. ``fn_set_hook('send_mail_pre', $transport, $message, $area, $lang_code);`` не рекомендуется к использованию и будет удалён в версии 5.x.x. Рекомендуем использовать **mailer_create_message_before**.

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Функция скрывает важные данные (номер карты и CVC/CVV2) в информации об оплате у заказов::

     fn_batch_cleanup_payment_info(array $params = array())

------------------------------------------
Изменённые функции только в русской версии
------------------------------------------

#. 

  ::

    // Было:
    \Tygh\Commerceml\RusEximCommerceml::setDataProductByOptions($product_id, $product_options, &$external_id, &$product_name)

    // Стало:
    \Tygh\Commerceml\RusEximCommerceml::setDataProductByOptions(&$product_id, $product_options, &$external_id, &$product_name)
