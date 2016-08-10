*******************
Пользователи: users
*******************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /users
        -   Получить список пользователей
    *   -   GET /users/:id
        -   Получить данные о пользователе
    *   -   POST /users/
        -   Создать пользователя
    *   -   PUT /users/:id
        -   Обновить пользователя
    *   -   DELETE /users/:id
        -   Удалить пользователя

Чтобы не засорять примеры, в них нет лишних заголовков типа авторизации и формата ввода/вывода.

Вместо *example.com* следует подставить адрес своего магазина.

==========
GET /users
==========

::

  curl -X GET 'http://example.com/api/2.0/users'

::

  {
      {
         "user_id": "3",
         "user_login": "customer",
         "is_root": "N",
         "timestamp": "1116709280",
         "user_type": "C",
         "status": "A",
         "firstname": "Customer",
         "lastname": "Customer",
         "email": "customer@example.com",
         "company": "Simtech",
         "company_id": "1",
         "company_name": "Simtech"
     },
     {
        "user_id":"1",
        "user_login":"admin",
        "is_root":"Y",
        "timestamp":"1112556008",
        "user_type":"A",
        "status":"A",
        "firstname":"John",
        "lastname":"Doe",
        "email":"admin@example.com",
        "company":"Your company",
        "company_id":"0",
        "company_name":null
     }
  }

------------------------
Параметры для фильтрации
------------------------

.. list-table::
    :header-rows: 1
    :widths: 7 7 30

    *   -   Параметр 
        -   По умолчанию
	-   Описание
    *   -   **page**
        -   ``1``	
	-   Запрашиваемая страница
    *   -   **items_per_page** 
        -   ``Глобальное значение``
	-   Кол-во элементов на странице
    *   -   user_ids
        -   
	-   Массив идентификаторов пользователей 
    *   -   company
        -   
	-   Идентификатор компании
    *   -   name
        -
	-   Имя пользователя
    *   -   user_login
        -
	-   Логин
    *   -   usergroup_id
        -
	-   Идентификатор группы пользователей
    *   -   status
        -
	-   Статус ``A``, ``H`` или ``D``
    *   -   email
        -
	-   
    *   -   address	 
        -
	-   Адрес
    *   -   zipcode	
        -
	-   Почтовый индекс
    *   -   country
        -
	-   Страна
    *   -   state
        -
	-   Штат
    *   -   city
        -
	-   Город
    *   -   user_type
        -
	-   Включить пользователей определённого типа
    *   -   user_types
        -
	-   Включить пользователей определённых типов
    *   -   exclude_user_types
        -
	-   Исключить пользователей определённых типов
    *   -   compact
        -   ``N``
	-   Соединять фильтры по ``OR``, иначе ``AND``
	
::

  curl -X GET 'http://example.com/api/2.0/users?user_login=customer'

::

  {
     {
        "user_id":"3",
        "user_login":"customer",
        "is_root":"N",
        "timestamp":"1116709280",
        "user_type":"C",
        "status":"A",
        "firstname":"Customer",
        "lastname":"Customer",
        "email":"customer@example.com",
        "company":"Simtech",
        "company_id":"1",
        "company_name":"Simtech"
     }
  }

==============
GET /users/:id
==============

::

  curl -X GET 'http://example.com/api/2.0/users/1'

::

  {
     {
        "user_id":"1",
        "user_login":"admin",
        "is_root":"Y",
        "timestamp":"1112556008",
        "user_type":"A",
        "status":"A",
        "firstname":"John",
        "lastname":"Doe",
        "email":"admin@example.com",
        "company":"Your company",
        "company_id":"0",
        "company_name":null
     }
  }

============
POST /users/
============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если пользователя создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **email** (должен быть уникальным), **user_type**, **company_id** (если версия Ultimate).

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/users' --data-binary 'user_login=tesst&user_type=C&status=A&firstname=Customer&lastname=Customer&email=test%40example.com&company_id=1'

::

  {
     "user_id": 11,
     "profile_id": "12"
  }

==============
PUT /users/:id
==============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если пользователя обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/users/2' --data-binary 'status=D'

::

  {
     "user_id": "2",
     "profile_id":false
  }    

=================
DELETE /users/:id
=================

В случае, если пользователя удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/users/3'

