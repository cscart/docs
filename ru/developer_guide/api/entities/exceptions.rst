*************************
Product Option Exceptions
*************************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 20
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /api/2.0/exceptions 
        -   Получить список доступных исключений (требуется ``product_id``)
    *   -   GET /api/2.0/exceptions/:id
        -   Получить данные об исключении
    *   -   POST /api/2.0/exceptions/
        -   Создать новое исключение
    *   -   PUT /api/2.0/exceptions/:id
        -   Обновить исключение
    *   -   DELETE /api/2.0/exceptions/:id
        -   Удалить исключение

========================
GET /api/2.0/exceptions/
========================

::

  curl -X GET 'http://example.com/api/2.0/exceptions/?product_id=12'


**product_id** - обязательное поле

::

  {
    [
      {
          exception_id: "1",
          product_id: "12",
          combination: {
             3: "12",
             4: "17"
          }
      },
      {
          exception_id: "2",
          product_id: "12",
          combination: {
              3: "13",
              4: "17"
          }
      }
      ...
    ]
  }

===========================
GET /api/2.0/exceptions/:id
===========================

::

  curl -X GET 'http://example.com/api/2.0/exceptions/12'

::

  {
     exception_id: "2",
     product_id: "12",
     combination: {
         3: "13",
         4: "17"
     }
  }

=========================
POST /api/2.0/exceptions/
=========================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если исключение создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created** и код нового исключения.

Обязательные параметры: **product_id**, массив **combination (option_id => variant_id)**.

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/exceptions' --data-binary 'params...'

::

  params:
     product_id          4
     combination[3]      12
     combination[4]      14
     combination[7]      -2
  -1 - Any variant

  -2 - No variants can be selected

  {
      exception_id: 456
  }

===========================
PUT /api/2.0/exceptions/:id
===========================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если исключение обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успешного обновления **HTTP/1.1 200 OK**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/exceptions/123' --data-binary 'combination[3]=12&...'

::

  params:
      product_id          4
      combination[3]      12
      combination[4]      14
      combination[7]      -2
  {
     exception_id: 34
  }    

==============================
DELETE /api/2.0/exceptions/:id
==============================

В случае, если исключение удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки. 

В случае, если такое исключение не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/exceptions/123'

