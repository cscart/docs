***********
Discussions
***********

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 10
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /discussions 
        -   Получить список отзывов и комментариев
    *   -   GET /discussions/:id
        -   Получить данные отзыва/комментария
    *   -   POST /discussions/
        -   Создать отзыв/комментарий
    *   -   PUT /discussions/:id
        -   Обновить отзыв/комментарий
    *   -   DELETE /discussions/:id
        -   Удалить отзыв/комментарий



Сущность может использоваться как дочерняя сущность у сущности :doc:`Products <products>` **(/products/:p_id/discussions)**. 

Стоит отметить, что в MVE вендору сущность доступна только в качестве дочерней сущности к *Products*.

================
GET /discussions
================

::

  curl -X GET 'http://example.com/api/2.0/discussions'

::

  {
    "discussions": [
      {
        "post_id": "18",
        "thread_id": "26",
        "name": "Alex",
        "timestamp": "1383914729",
        "user_id": "0",
        "ip_address": "10.7.7.93",
        "status": "A",
        "message": "You guys have the BEST customer service known to man!!! I have always been impressed with how fast you help us out!",
        "rating_value": "4",
        "object_id": "0",
        "object_type": "E",
        "type": "B",
        "company_id": "1"
      },
      {
        "post_id": "17",
        "thread_id": "25",
        "name": "John",
        "timestamp": "1383914729",
        "user_id": "0",
        "ip_address": "10.7.7.93",
        "status": "A",
        "message": "I’ve been using an iPhone 5 daily for the past year, and the iPhone 5s seems to feel exactly the same: the same curved edges, same dimensions, same everything. It's only an updated Home button and the new camera flash which make you realize that this is not an iPhone 5.  Many people think that releasing the same design twice is bad, and there are others who realize that sometimes there's no need for change. Apple might want to understand that the competition is strong, and it needs to stay relevant. ",
        "rating_value": "3",
        "object_id": "239",
        "object_type": "P",
        "type": "B",
        "company_id": "1"
      },
      ...
    ],
    "params": {
      "page": 1,
      "items_per_page": "10",
      "sort_order": "desc",
      "sort_by": "timestamp",
      "sort_order_rev": "asc",
      "total_items": "17"
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
	-   запрашиваемая страница
    *   -   **items_per_page** 
        -   ``Глобальное значение``
	-   кол-во элементов на странице
    *   -   **sort_by**
        -   ``timestamp``
	-   Сортировать по: ``name``, ``ip_address``, ``timestamp``, ``status``
    *   -   **sort_order**  
        -   ``desc``
	-   Порядок сортировки: ``asc`` или ``desc``
    *   -   **status**
        -
	-   Фильтрация по статусу: ``A`` или ``D``
    *   -   **name**
        -
	-   Фильтрация по имени
    *   -   **message**
        -
	-   Фильтрация по тексту комментария
    *   -   **type**
        -   
	-   Фильтрация по типу: ``C`` - Обсуждение, ``R`` - Оценки, ``B`` - Обсуждение и оценки
    *   -   **ip_address**
        -
	-   Фильтрация по IP-адресу
    *   -   **rating_value**
        -
	-   Фильтрация по оценке
    *   -   **object_type**
        -
	-   Фильтрация по типу объекта: ``P`` - product, ``C`` - category, ``A`` - page, ``O`` - order, ``E`` - home_page
    *   -   **object_id** 
        -   
	-   Фильтрация по ID объекта
    *   -   **period**
        -   ``A``
	-   Фильтрация по периоду: ``A`` - за все время, ``D`` - сегодняшний день, ``LD`` - предыдущий день, ``W`` - текущая неделя, ``LW`` - предыдущая неделя, ``M`` - текущий месяц, ``LM`` - предыдущий месяц, ``Y`` - текущий год, ``LY`` - предыдущий год, ``HH`` - Последние 24 часа, ``HW`` - Последние 7 дней, ``HM`` - Последние 30 дней, ``C`` - заданный период (используется совместно с полями ``time_from`` и ``time_to``)
    *   -   **time_from**  
        -
	-   Фильтрация по времени: начальная дата
    *   -   **time_to**
        -
	-   Фильтрация по времени: конечная дата

====================
GET /discussions/:id
====================

::

  curl -X GET 'http://example.com/api/2.0/discussions/18'

::

  {
      "post_id": "18",
      "thread_id": "26",
      "name": "Alex",
      "timestamp": "1383914729",
      "user_id": "0",
      "ip_address": "10.7.7.93",
      "status": "A",
      "message": "You guys have the BEST customer service known to man!!! I have always been impressed with how fast you help us out!",
      "rating_value": "4",
      "object_id": "0",
      "object_type": "E",
      "type": "B",
      "company_id": "1"
  }

==================
POST /discussions/
==================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если не удалось создать комментарий/отзыв, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Доступные параметры: *object_type*, *object_id*, *thread_id*, *name*, *message*, *rating_value*, *timestamp*, *status*. 
Обязательные параметры: группа из **object_type** и **object_id** или **thread_id**.

::

  curl -H "Content-Type: application/json" -X POST http://example.com/api/2.0/discussions -d '{"object_type":"P", "object_id":242, "name":"Api", "rating_value":4, "message":"Message via API"}'

::

  {
    "post_id": "20"
  }

====================
PUT /discussions/:id
====================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если комментарий/отзыв обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl -H "Content-Type: application/json" -X PUT http://example.com/api/2.0/discussions/20 -d '{"rating_value":5, "message":"Changed message via API", "status":"D"}'

::

  {
    "post_id": "20",
  }    

=======================
DELETE /discussions/:id
=======================

В случае, если комментарий/отзыв удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/discussions/20'

