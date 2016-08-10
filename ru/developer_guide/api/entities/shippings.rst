***************************
Способы доставки: shippings
***************************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /shippings
        -   Получить список способов доставки
    *   -   GET /shippings/:id
        -   Получить данные о способе доставки
    *   -   POST /shippings/
        -   Создать способ доставки
    *   -   PUT /shippings/:id
        -   Обновить способ доставки
    *   -   DELETE /shippings/:id
        -   Удалить способ доставки

==============
GET /shippings
==============

::

  curl -X GET 'http://example.com/api/2.0/shippings'

::

  {
    {
      "shipping_id": "1",
      "min_weight": "0.00",
      "max_weight": "0.00",
      "position": "0",
      "status": "A",
      "shipping": "Custom shipping method",
      "delivery_time": "3-5 days",
      "usergroup_ids": "0"
    },
    {
      "shipping_id": "3",
      "min_weight": "0.00",
      "max_weight": "0.00",
      "position": "0",
      "status": "D",
      "shipping": "FedEx 2nd day",
      "delivery_time": "2 days",
      "usergroup_ids": "0"
    },
    ...
  }

==================
GET /shippings/:id
==================

::

  curl -X GET 'http://example.com/api/2.0/shippings/1'

::

  {
      "shipping_id": "1",
      "company_id": "1",
      "destination": "I",
      "min_weight": "0.00",
      "max_weight": "0.00",
      "usergroup_ids": "0",
      "rate_calculation": "M",
      "service_id": "0",
      "service_params": "",
      "localization": "",
      "tax_ids": [
          "6"
      ],
      "position": "0",
      "status": "A",
      "shipping": "Custom shipping method",
      "delivery_time": "3-5 days",
      "icon": [],
      "rates": [
      {
          "destination_id": "1",
          "status": "A",
          "localization": "",
          "destination": "Default destination (all countries)",
          "rate_id": "56",
          "rate_value": {
              "C": {
                  "0": {
                      "amount": "0",
                      "value": 0,
                      "type": "F",
                      "per_unit": "N"
                  },
                  "100": {
                      "amount": "100",
                      "value": 25.45,
                      "type": "F",
                      "per_unit": "N"
                  }
              },
              "W": [
                  []
              ],
              "I": [
                  []
              ]
          },
          "rates_defined": "1"
      },
      {
          "destination_id": "8",
          "status": "A",
          "localization": "",
          "destination": "Canada",
          "rate_value": {
              "C": [
                  []
              ],
              "W": [
                  []
              ],
              "I": [
                  []
              ]
          }
      },
      {
          "destination_id": "7",
          "status": "A",
          "localization": "",
          "destination": "USA",
          "rate_id": "57",
          "rate_value": {
              "C": {
                  "0": {
                      "amount": "0",
                      "value": 40,
                      "type": "F",
                      "per_unit": "N"
                  },
                  "30": {
                      "amount": "30",
                      "value": 10,
                      "type": "F",
                      "per_unit": "N"
                  },
                  "50": {
                      "amount": "50",
                      "value": 5,
                      "type": "F",
                      "per_unit": "N"
                  }
              },
              "I": {
                  "0": {
                      "amount": "0",
                      "value": 23,
                      "type": "F",
                      "per_unit": "N"
                  },
                  "10": {
                      "amount": "10",
                      "value": 15,
                      "type": "F",
                      "per_unit": "N"
                  }
              },
              "W": [
                  []
              ]
          },
          "rates_defined": "1"
      }
    ]
  }

================
POST /shippings/
================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если способ доставки создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **shipping**.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/shippings' --data-binary '{...}'

Для версии Ultimate, если запрос выполняет рутовый админ, метод доставки необходимо создавать через сущность :doc:`Stores <stores>`.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/stores/1/shippings' --data-binary '{...}'

::

  {
      "shipping":"Test shipping"
  }

  ```json
  {
    "payment_id": "12"
  }

==================
PUT /shippings/:id
==================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если способ доставки обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/shippings/2' --data-binary 'status=D'

::

  {
     "shipping_id": "2",
  }    

=====================
DELETE /shippings/:id
=====================

В случае, если способ доставки удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой метод доставки не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/shippings/3'

