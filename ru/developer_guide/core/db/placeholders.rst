Плейсхолдеры (Placeholders)
---------------------------

.. contents:: Содержание
    :local: 
    :depth: 3

Общая информация
================

При выполнении SQL запросов, любые данные необходимо передавать в запрос через плейсхолдеры. 

Плейсхолдеры повышают безопасность и защищают от SQL инъекций.

Для разных типов данных используются раличные плейсхолдеры. Общий принцип работы следующий:

1. Для выполнения SQL запроса используюется специальная функция ядра CS-Cart.

2. Данные которые необходимы для запроса передаются в функцию.

3. Перед выполнением запроса, CS-Cart отфильтрует данные и безопасно выполнит запрос.

.. important::

    Это не только безопасно, но и очень удобно. 

Функции для запроса к базе данных с использованием плейсхолдеров выглядят так:

::

    db_query('UPDATE ?:products SET ?u WHERE product_id = ?i', $data, $product_id);

Где:

``?:`` — автоматически заменится на префикс таблиц базы данных ``cscart_`` . В данном случае это запрос к таблице ``cscart_products``.

``?u`` — плейсхолдер, в него будут подставлены данные из ``$data``

``?i`` — плейсхолдер, в него будут подставлены данные из ``$product_id``

Данные для плейсхолдеров необходимо передавать в порядке следования плейсхолдеров в запросе.

Существует множество различных типов плейсхолдеров, для разных целей и типов данных.

Ниже вы узнаете о каждом.


?i — число
==========

Плейсхолдер ``?i`` используется для вставки чисел в запросы.

::

    $user_id = '1';

    // Пример 1. Получим строку из таблицы cscart_orders по user_id . 
    $user_array = db_get_row("SELECT * FROM ?:users WHERE user_id = ?i", $user_id);

    // Пример 2. Обновим фамилию и имя по user_id
    $update_data = array (
        'firstname' => 'Даниил',
        'lastname' => 'Баженов',
    );

    db_query("UPDATE ?:users SET ?u WHERE user_id = ?i", $updat_data, $user_id);

    // Пример 3. Как плейсхолдер повышает безопасность.

    // Если кто-то вставит SQL инъекцию, вместо ID
    $user_id = '7 OR true';

    // Перед запросом плейсхолдер отфильтрует входящие данные и оставит только 7
    db_query("SELECT * FROM ?:users WHERE user_id = ?i", $user_id);


Запрос который будет отправлен:

*   Пример 1.

    ``SELECT * FROM cscart_users WHERE user_id = 1``

*   Пример 2.

    ``UPDATE cscart_users SET `firstname` = 'Даниил', `lastname` = 'Баженов' WHERE user_id = 1``

*   Пример 3.

    ``SELECT * FROM cscart_users WHERE user_id = 7``


?s — строка
===========

Плейсхолдер ``?s`` используется для вставки строки.

::

    // Пример 1. Изменим статус пользователя 
    $email = 'dbazhenov@cs-cart.ru';
    db_query("UPDATE ?:users SET status = ?s WHERE email = ?s", 'A', $email);

    // Пример 2. Получим список email активных покупателей.
    $status = 'A';
    $active_users = db_get_fields("SELECT email FROM ?:users WHERE status = ?s", $status);

    // Пример 3. Получим данные заказов с доставкой в город Москва
    $b_city = 'Москва';
    $orders_array = db_get_array("SELECT * FROM ?:orders WHERE b_city = ?s", $b_city);


Запрос который будет отправлен:

*   Пример 1.

    ``UPDATE cscart_users SET status = 'A' WHERE email = 'dbazhenov@cs-cart.ru'``

*   Пример 2.

    ``SELECT email FROM cscart_users WHERE status = 'A'``

*   Пример 3.

    ``SELECT * FROM cscart_orders WHERE b_city = 'Москва'``


?l — LIKE
=========

Обработка конструкций LIKE с помощью ``?l``.

::  

    // Получим ID всех товаров в названии которых есть слово "Шоссейный"
    $piece = '%Шоссейный%';

    $ids = db_get_fields('SELECT product_id FROM ?:product_descriptions WHERE product LIKE ?l', $piece);

    // $ids будет содержать массив id товаров


Запрос который будет отправлен:

``SELECT product_id FROM ?:product_descriptions WHERE product LIKE '%Шоссейный%'``




?d — дробное число
==================

::

    // Обновим цену товара
    $price = 123.45678910;

    db_query('UPDATE ?:products SET list_price = ?d WHERE product_id = ?i', $price, 12);


Запрос который будет отправлен:

``UPDATE cscart_products SET list_price = 123.46 WHERE product_id = 12``


?u — массив значений для запроса UPDATE
=======================================

Плейсхолдер ``?u`` позволяет передавать данные в запрос UPDATE с помощью простого массива. Массив должен содержать пары ключ => значение , где ключ название колонки.

Пример использования:

::  

    $data = array (
        'product_code' => 'sku-1234',
        'status' => 'D',
        'amount' => '17'
    );

    $product_id = 1;

    db_query('UPDATE ?:products SET ?u WHERE product_id = ?i', $data, $product_id);


Запрос который будет отправлен:

``UPDATE cscart_products SET `product_code` = 'sku-1234', `status` = 'D', `amount` = 17 WHERE product_id = 1``



?e — массив значений для запроса INSERT INTO
============================================

Удобные запросы INSERT INTO с помощью плейсхолдера ``?e``.

Пример использования:

::  

    // Добавим нового пользователя
    $user_data = array (
        'email' => 'mail@cs-cart.ru',
        'status' => 'A',
        'user_type' => 'C'
    );

    $user_id = db_query("INSERT INTO ?:users ?e", $user_data);

    // $user_id будет содержать ID созданного пользователя.


Запрос который будет отправлен:

``INSERT INTO cscart_products (`email`, `status`, `user_type`) VALUES ('mail@cs-cart.ru', 'A', 'C')``


?a — обработка строчных данных для конструкции IN
=================================================

Данные обрабатываются и передаются в запрос как строки. 
Возможно передавать строку, число, массив.

:: 

    // Получим список ID всех покупателей со статусами Включен и Выключен.
    $status = array('A','D');
    $types = 'C';

    $user_ids = db_get_fields('SELECT email FROM ?:users WHERE status IN (?a) AND user_type IN (?a)', $status, $types);

Запрос который будет отправлен:

``SELECT email FROM cscart_users WHERE status IN ('A', 'D') AND user_type IN ('C')``


?n — обработка числовых данных для конструкции IN
=================================================

Плейсхолдер обработает данные и оставит только числа.
Возможно передавать строку, число или массив.

::

    // Выключим товары с ID из списка, специально передаются не только числа.
    $ids = array('test', 4, 5, 6, 123.4567);

    db_query('UPDATE ?:products SET status = ?s WHERE product_id IN (?n)', 'D', $ids);

Результат обработки и запрос который будет отправлен:

``UPDATE ?:products SET status = 'D' WHERE product_id IN (0, 4, 5, 6, 123.4567)``


?p — готовая SQL конструкция
============================

Если вы собираете запрос по частям или данные прошли предварительную обработку с помощью функции db_quote(), то можно использовать ``?p``

::  

    // Составим классный запрос с JOIN и разными условиями
    $user_id = 7;
    $total = 123.456789;

    // Условие , что общая сумма заказа больше $total
    $condition = db_quote('?:orders.total > ?d', $total);

    // JOIN таблицы cscart_users
    $join = db_quote(' LEFT JOIN ?:users ON ?:orders.user_id = ?:users.user_id');

    // Дописываем условие, что заказы только пользователя с нужным ID
    $condition .= db_quote(' AND ?:users.user_id = ?i', $user_id);

    // Список полей для выборки.
    $fields = array(
        '?:orders.*',
        '?:users.email',
        '?:users.status',
    );

    $fields = implode(',', $fields);

    // Красивый запрос.
    $orders = db_get_array("SELECT ?p FROM ?:orders ?p WHERE ?p ", $fields, $join, $condition);

    // В $orders нам будет доступен массив заказов нашего покупателя.

Обработанный запрос который будет отправлен в MySQL:

::  

    SELECT cscart_orders.*,cscart_users.email,cscart_users.status FROM ?:orders  LEFT JOIN cscart_users ON cscart_orders.user_id = cscart_users.user_id WHERE cscart_orders.total > 123.46 AND cscart_users.user_id = 7``


?w — подготовка конструкции WHERE
=================================

::

    // Получим информацию по Даниилу Баженову
    $where = array(
        'firstname' => 'Даниил',
        'lastname' => 'Баженов',
    );

    $user_data = db_get_row('SELECT * FROM ?:users WHERE ?w', $where);

Результат работы плейсхолдера:

``SELECT * FROM cscart_users WHERE `firstname` = 'Даниил' AND `lastname` = 'Баженов'``




?m — Мульти INSERT
==================

Позволяет добавлять несколько записей за один запрос.

::  

    $users = array(
        array(
            'email' => 'mail@dbazhenov.ru',
            'status' => 'A',
            'user_type' => 'C'
        ),
        array(
            'email' => 'video@dbazhenov.ru',
            'status' => 'A',
            'user_type' => 'C'
        )
    );

    db_query('INSERT INTO ?:users ?m', $users);


Запрос который будет отправлен в базу данных:

::

    INSERT INTO ?:users (`email`, `status`, `user_type`) VALUES ('mail@dbazhenov.ru', 'A', 'C'), ('video@dbazhenov.ru', 'A', 'C')

