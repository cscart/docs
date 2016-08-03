*************
Call Requests
*************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 15
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /call_requests
        -   Получить список заявок на обратный звонок
    *   -   GET /call_requests/:id
        -   Получить данные об обратном звонке
    *   -   POST /call_requests/
        -   Создать обратный звонок
    *   -   PUT /call_requests/:id
        -   Обновить обратный звонок
    *   -   DELETE /call_requests/:id  
        -   Удалить обратный звонок 

==================
GET /call_requests
==================

::

  curl -X GET 'http://example.com/api/2.0/call_requests'

::

  {
    "call_requests": [
      {
        "request_id": "2",
        "company_id": "1",
        "order_id": "0",
        "user_id": "0",
        "product_id": "0",
        "timestamp": "1442933097",
        "status": "new",
        "name": "Inna",
        "phone": "+7(917)000-00-00",
        "time_from": "__:__",
        "time_to": "",
        "notes": null,
        "cart_products": "",
        "order_status": null,
        "product": null
      },
      {
        "request_id": "1",
        "company_id": "1",
        "order_id": "0",
        "user_id": "0",
        "product_id": "0",
        "timestamp": "1442933072",
        "status": "new",
        "name": "Vladimir",
        "phone": "+7(917)111-11-11",
        "time_from": "10:00",
        "time_to": "20:00",
        "notes": null,
        "cart_products": "",
        "order_status": null,
        "product": null
      }
    ],
    "params": {
      "items_per_page": "10",
      "page": 1,
      "sort_order": "desc",
      "sort_by": "date",
      "sort_order_rev": "asc",
      "total_items": "2"
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
        -   ``date``
	-   Сортировать по: ``id``, ``date``, ``status``, ``name``, ``phone``, ``user_id``, ``user``, ``order``, ``order_status``
    *   -   **sort_order**  
        -   ``desc``
	-   Порядок сортировки: ``asc`` или ``desc``
    *   -   **status**
        -
	-   Фильтрация по статусу: ``new``, ``in_progress``, ``completed``, ``no_answer``
    *   -   **name**
        -
	-   Фильтрация по имени
    *   -   **phone**
        -
	-   Фильтрация по телефону
    *   -   **company_id**
        -
	-   Фильтрация по витрине (Ultimate)
    *   -   **order_status**
        -
	-   Фильтрация по статусу ордера
    *   -   **user_id**
        -
	-   Фильтрация по ответственному администратору
    *   -   **order_exists**
        -
	-   Фильтрация по существованию связанного ордера. Возможные варианты: ``Y`` или ``N``

======================
GET /call_requests/:id
======================

::

  curl -X GET 'http://example.com/api/2.0/call_requests/1'

::

  {
    "request_id": "1",
    "company_id": "1",
    "order_id": "0",
    "user_id": "0",
    "product_id": "0",
    "timestamp": "1442933072",
    "status": "new",
    "name": "Vladimir",
    "phone": "+7(917)111-11-11",
    "time_from": "10:00",
    "time_to": "20:00",
    "notes": null,
    "cart_products": "",
    "order_status": null,
    "product": null
  }

====================
POST /call_requests/
====================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае если не удалось создать обратный звонок, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **email** или **phone**.

Доступные параметры: *email*, *phone*, *user_id*, *order_id*, *product_id*, *timestamp*, *status*, *name*, *phone*, *time_from*, *time_to*, *notes*, *cart_products*.

::

  curl -H "Content-Type: application/json" -X POST http://example.com/api/2.0/call_requests -d '{"phone":"+7(999)111-22-33", "name":"Api"}'

::

  {
    "request_id": "7"
  }

======================
PUT /call_requests/:id
======================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если обратный звонок обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl -H "Content-Type: application/json" -X PUT http://example.com/api/2.0/call_requests/7 -d '{"status":"no_answer", "notes":"No answer"}'

::

  {
    "request_id": "7",
  }    

=========================
DELETE /call_requests/:id
=========================

В случае, если обратный звонок удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/call_requests/7'

