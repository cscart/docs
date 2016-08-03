*****
Taxes
*****

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /taxes
        -   Получить список налогов
    *   -   GET /taxes/:id
        -   Получить данные о налоге
    *   -   POST /taxes/
        -   Создать налог
    *   -   PUT /taxes/:id
        -   Обновить налог
    *   -   DELETE /taxes/:id
        -   Удалить налог

==========
GET /taxes
==========

::

  curl -X GET 'http://example.com/api/2.0/taxes'

::

  [
    {
      "tax_id": "6",
      "address_type": "S",
      "status": "A",
      "price_includes_tax": "Y",
      "display_including_tax": "N",
      "display_info": "",
      "regnumber": "1234242",
      "priority": "0",
      "tax": "VAT"
    },
    {
      "tax_id": "7",
      "address_type": "S",
      "status": "A",
      "price_includes_tax": "Y",
      "display_including_tax": "N",
      "display_info": "",
      "regnumber": "1234242",
      "priority": "0",
      "tax": "VAT2"
    }
  ]

==============
GET /taxes/:id
==============

::

  curl -X GET 'http://example.com/api/2.0/taxes/6'

::

  {
    "tax_id": "6",
    "address_type": "S",
    "status": "A",
    "price_includes_tax": "Y",
    "display_including_tax": "N",
    "display_info": "",
    "regnumber": "1234242",
    "priority": "0",
    "tax": "VAT"
  }

============
POST /taxes/
============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если налог создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **tax**.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/payments' --data-binary '...'

::

  {
    "address_type": "S",
    "status": "A",
    "price_includes_tax": "Y",
    "display_including_tax": "N",
    "display_info": "",
    "regnumber": "1234242",
    "priority": "0",
    "tax": "VAT2"
  }

**Результат**

::

  {
    "tax_id": "7"
  }

==============
PUT /taxes/:id
==============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если налог обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/taxes/6' --data-binary 'status=D'

::

  {
     "tax_id": "6",
  }    

=================
DELETE /taxes/:id
=================

В случае, если налог удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой налог не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/taxes/3'

