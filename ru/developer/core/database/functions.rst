Функции для работы с базой данных
---------------------------------

.. contents:: Содержание
    :local: 
    :depth: 3


db_query — любой SQL запрос
===========================

Пример:

::

    db_query('UPDATE ?:users SET status = ?s WHERE user_id = ?i', 'A', 1);


Для запросов DELETE, UPDATE и мульти INSERT , функция возвращает количество затронутых записей.

Для обычного INSERT запроса, функция вернёт ID созданного объекта

Пример:

::  

    // Создадим нового покупателя
    $user_data = array(
        'email' => 'user@dbazhenov.ru',
        'user_type' => 'C',
        'status' => 'A',
    );

    $user_id = db_query('INSERT INTO ?:users ?e', $user_data);

    // Распечатаем результат
    fn_print_r($user_id);


Результат:

.. note::

    id нового покупателя в переменной $user_id, в моём случае:

    ::

        17



db_quote — валидация SQL запроса
================================

Можно использовать склеивания больших запросов с различными условиями, а также для быстрой проверки плейсхолдеров.

Функция возвращает готовый SQL запрос в виде строки.

Пример:

::
    
    $sql_string = db_quote('UPDATE ?:products SET list_price = ?d WHERE product_id = ?i', 123.45678910, '12 OR true');

    fn_print_r($sql_string);


Результат:

.. note::

    ::

        UPDATE cscart_products SET list_price = 123.46 WHERE product_id = 12



db_get_field — получить значение ячейки
=======================================

Пример:

::  

    // Получим email пользователя с ID = 1.
    $email = db_get_field("SELECT email FROM ?:users WHERE user_id = ?i", 1);

    // Распечатаем результат
    fn_print_r($email);

Результат:

.. note::

    ::

        dbazhenov@cs-cart.ru


db_get_row — получить строку данных по значению
===============================================

Пример:

::

    // Получим массив данных пользователя с user_id = 1.
    $user_data = db_get_row("SELECT user_id, user_type, email FROM ?:users WHERE user_id = ?i", 1);

    // Распечатаем результат
    fn_print_r($user_data);


Результат:

.. note::

    ::

        Array
        (
            [user_id] => 1
            [user_type] => A
            [email] => dbazhenov@cs-cart.ru
        )


db_get_fields — получить список данных
======================================

Пример:

::

    // Получим список email активных покупателей.
    $active_emails = db_get_fields("SELECT email FROM ?:users WHERE status = ?s", 'A');

    // Распечатаем результат
    fn_print_r($active_emails);


Результат:

.. note::

    ::

        Array
        (
            [0] => dbazhenov@cs-cart.ru
            [1] => customer@example.com
            [2] => user1@example.com
        )

db_get_array — получить массив данных
=====================================

Пример:

::

    // Получим массив данных всех активных покупателей.
    $active_users = db_get_array("SELECT user_id, user_type, email FROM ?:users WHERE status = ?s", 'A');

    // Распечатаем результат
    fn_print_r($active_users);


Результат:

.. note::

    ::

        Результат:

        Array
        (
            [0] => Array
                (
                    [user_id] => 1
                    [user_type] => A
                    [email] => dbazhenov@cs-cart.ru
                )

            [1] => Array
                (
                    [user_id] => 3
                    [user_type] => C
                    [email] => customer@example.com
                )

            [2] => Array
                (
                    [user_id] => 4
                    [user_type] => C
                    [email] => user1@example.com
                )

        )


db_get_hash_array — получить массив данных c особыми ключами
============================================================

Вторым аргументов в функцию передаётся название поля значение которого будет ключом.

Пример:

::

    // Получим массив заказов, ключами массива будут ID заказов, для этого передаём в функцию вторым параметром: 'order_id'.
    $orders = db_get_hash_array("SELECT order_id, total, subtotal, status FROM ?:orders WHERE user_id = ?i", 'order_id', 7);

    // Распечатаем результат
    fn_print_r($orders);


Результат:

.. note::

    ::


        Array
        (
            [52] => Array
                (
                    [order_id] => 52
                    [total] => 2099.35
                    [subtotal] => 1869.35
                    [status] => C
                )

            [63] => Array
                (
                    [order_id] => 63
                    [total] => 2425.00
                    [subtotal] => 1925.00
                    [status] => C
                )

            [67] => Array
                (
                    [order_id] => 67
                    [total] => 2779.90
                    [subtotal] => 2279.90
                    [status] => C
                )

        )

db_get_hash_single_array — получить массив вида "ключ => значение"
==================================================================

Вторым аргументом необходимо передать в функцию массив вида ``array('[field_for_key]', '[field_for_value]')``

Пример 1.

::

    // Получим массив email => имя
    $emails = db_get_hash_single_array("SELECT email, firstname FROM ?:users", array('email', 'firstname'));

    // Распечатаем результат.
    fn_print_r($emails);

Результат:

.. note::

    ::

        Array
        (
            [customer@example.com] => Покупатель
            [user1@example.com] => Анна
            [user2@example.com] => Мария
        )


Пример 2.

::

    // Получим массив order_id => код статуса
    $order_statuses = db_get_hash_single_array("SELECT order_id, status FROM ?:orders", array('order_id', 'status'));

    // Распечатаем результат.
    fn_print_r($order_statuses);

Результат:

.. note::

    ::

        Array
        (
            [1] => C
            [2] => C
            [3] => B
            [4] => C
            [5] => C
            [6] => F
            ...
        )



db_get_hash_multi_array — массив данных (группировка и заданные ключи)
======================================================================

Пример:

::

    // Получим список заказов, заказы будут сгруппированы по статусу, 
    // в массиве будут все поля указанные в запросе по каждому заказу
    // Для группировки передаём в плейсхолдер первым параметром: array('status','order_id')

    $extra_orders_group = db_get_hash_multi_array("SELECT order_id, total, subtotal, status FROM ?:orders WHERE user_id = ?i", array('status','order_id'), 7);

    // Распечатаем результат
    fn_print_r($extra_orders_group);


Результат:

.. note::

    ::

        Array
        (
            [C] => Array
                (
                    [52] => Array
                        (
                            [order_id] => 52
                            [total] => 2099.35
                            [subtotal] => 1869.35
                            [status] => C
                        )

                    [63] => Array
                        (
                            [order_id] => 63
                            [total] => 2425.00
                            [subtotal] => 1925.00
                            [status] => C
                        )

                    ...
                )

            [D] => Array
                (
                    [68] => Array
                        (
                            [order_id] => 68
                            [total] => 3298.25
                            [subtotal] => 2798.25
                            [status] => D
                        )

                )

        )


db_get_hash_multi_array — массив данных (группировка, фильтрация, заданные ключи)
=================================================================================

Вторым аргументом передаётся массив c полями по которым будет осуществляться группировка и фильтрация информации.

Пример:

::

    // Получим список заказов, заказы будут сгрупированы по статусу, 
    // в массиве будет информация только о общей сумме заказа
    // Для группировки передаём в плейсхолдер первым параметром: array('status','order_id', 'total')
    $orders_group = db_get_hash_multi_array("SELECT order_id, total, subtotal, status FROM ?:orders WHERE user_id = ?i", array('status','order_id', 'total'), 7);

    // Распечатаем результат
    fn_print_r($orders_group);


Результат:

.. note::

    ::

        Array
        (
            [C] => Array
                (
                    [52] => 2099.35
                    [63] => 2425.00
                    [67] => 2779.90
                    [69] => 2600.00
                    [73] => 10499.65
                    [85] => 2232.50
                    [86] => 1399.30
                )

            [D] => Array
                (
                    [68] => 3298.25
                )

        )