*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.10.2
*******************************************************

===============
Общие изменения
===============

Добавлено поле ``runtime.is_restoring_cart_from_backend``. Оно используется в классе ``Registry`` во всех ситуациях восстановления содержимого корзины при переходе из ``backend`` во ``frontend``. Используется только значение ``true``.

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

::

  // Было:
  \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

  // Стало:
  \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
