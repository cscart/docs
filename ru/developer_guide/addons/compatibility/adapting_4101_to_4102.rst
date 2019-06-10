*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.10.2
*******************************************************

===============
Общие изменения
===============

Добавлено поле ``runtime.is_restoring_cart_from_backend``. Оно используется в классе ``Registry`` во всех ситуациях восстановления содержимого корзины при переходе из ``backend`` во ``frontend``. Используется только значение ``true``.

=================
Изменения в хуках
=================

----------
Новые хуки
----------

Выполняется перед обновлением данных пользователя при оформлении заказа. Позволяет модифицировать данные пользователя::

  fn_set_hook('checkout_update_steps_before_update_user_data', $cart, $auth, $params, $user_id, $user_data);

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

Копирует в пустые поля местоположения в указанной секции значения из второстепенной секции::

  \Tygh\Location\Manager::fillEmptyLocationFields(array $array, $primary_section)

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    \Tygh\Location\Manager::storeLocation($update_profile = false)

    // Стало:
    \Tygh\Location\Manager::storeLocation()

#.

  ::

    // Было:
    \Tygh\Location\Manager::setLocationFromUserData(array $user_data, $update_profile = false)

    // Стало:
    \Tygh\Location\Manager::setLocationFromUserData(array $user_data)

#.

  ::

    // Было:
    fn_checkout_set_cart_profile_id(&$cart, $profile_id)

    // Стало:
    fn_checkout_set_cart_profile_id(&$cart, $auth, $profile_id)

#.

  ::

    // Было:
    \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

    // Стало:
    \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
