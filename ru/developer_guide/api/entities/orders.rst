******
Orders
******

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /orders
        -   Получить список заказов
    *   -   GET /orders/:id
        -   Получить данные о заказе
    *   -   POST /orders/
        -   Создать заказ
    *   -   PUT /orders/:id
        -   Обновить заказ
    *   -   DELETE /orders/:id
        -   Удалить заказ

===========
GET /orders
===========

::

  curl -X GET 'http://example.com/api/2.0/orders'

::

  {
      {
         "order_id": "25",
         "issuer_id": null,
         "user_id": "3",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790596",
         "firstname": "Customer",
         "lastname": "Customer",
         "email": "customer@example.com",
         "status": "O",
         "total": "360.99",
         "invoice_id": null,
         "credit_memo_id": null
     },
     {
         "order_id": "22",
         "issuer_id": null,
         "user_id": "7",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790496",
         "firstname": "Joseph",
         "lastname": "Cavazos",
         "email": "JosephCCavazos@example.com",
         "status": "O",
         "total": "307.99",
         "invoice_id": null,
         "credit_memo_id": null
     },
     ...
  }

------------------------
Параметры для фильтрации
------------------------

.. list-table::
    :header-rows: 1
    :widths: 20 30

    *   -   Параметр 
        -   Описание
    *   -   **user_id**
        -   id пользователя
    *   -   **status**
        -   статус заказа
    *   -   **company**
        -   идентификатор компании

::

  curl -X GET 'http://example.com/api/2.0/orders?user_id=3'

::

  {
      {
         "order_id": "25",
         "issuer_id": null,
         "user_id": "3",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790596",
         "firstname": "Customer",
         "lastname": "Customer",
         "email": "customer@example.com",
         "status": "O",
         "total": "360.99",
         "invoice_id": null,
         "credit_memo_id": null
     }
  }

=================
GET /orders/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/orders/25'

::

  {
      {
         "order_id": "25",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "issuer_id": null,
         "user_id": "3",
         "total": "360.99",
         "subtotal": 332.99,
         "discount": "0.00",
         "subtotal_discount": "0.00",
         "payment_surcharge": "0.00",
         "shipping_ids": "1",
         "shipping_cost": "28.00",
         "timestamp": "1328790596",
         "status": "O",
         "notes": "",
         "details": "",
         "promotions":
         [
         ],
         "promotion_ids": "",
         "firstname": "Customer",
         "lastname": "Customer",
         "company": "",
         "b_firstname": "Customer",
         "b_lastname": "Customer",
         "b_address": "44 Main street",
         "b_address_2": "",
         "b_city": "Boston",
         "b_county": "",
         "b_state": "MA",
         "b_country": "US",
         "b_zipcode": "02134",
         "b_phone": "",
         "s_firstname": "Customer",
         "s_lastname": "Customer",
         "s_address": "44 Main street",
         "s_address_2": "",
         "s_city": "Boston",
         "s_county": "",
         "s_state": "MA",
         "s_country": "US",
         "s_zipcode": "02134",
         "s_phone": "",
         "s_address_type": "",
         "phone": "",
         "fax": "",
         "url": "",
         "email": "customer@example.com",
         "payment_id": "1",
         "tax_exempt": "N",
         "lang_code": "en",
         "ip_address": "95.104.192.183",
         "repaid": "0",
         "validation_code": "",
         "localization_id": "0",
         "payment_method":
         {
             "payment_id": "1",
             "company_id": "1",
             "usergroup_ids": "0",
             "position": "10",
             "status": "A",
             "template": "views/orders/components/payments/cc.tpl",
             "processor_id": "0",
             "processor_params": "",
             "a_surcharge": "0.000",
             "p_surcharge": "0.000",
             "tax_ids":
             [
             ],
             "localization": "",
             "payment_category": "tab1",
             "payment": "Credit card",
             "description": "Visa, Mastercard, etc...",
             "instructions": "",
             "surcharge_title": "",
             "lang_code": "en",
             "processor": null,
             "processor_type": null,
             "image":
             [
             ]
         },
         "fields":
         [
         ],
         "products":
         {
             "4163016541":
             {
                 "item_id": "4163016541",
                 "order_id": "25",
                 "product_id": "126",
                 "product_code": "",
                 "price": "129.99",
                 "amount": "1",
                 "extra":
                 {
                     "product_options":
                     [
                     ],
                     "unlimited_download": "N",
                     "product": "Casio PRIZM fx-CG10",
                     "company_id": 0,
                     "is_edp": "N",
                     "edp_shipping": "N",
                     "discount": 0,
                     "base_price": 129.99,
                     "stored_price": "N"
                 },
                 "product": "Casio PRIZM fx-CG10",
                 "product_status": "A",
                 "deleted_product": false,
                 "discount": 0,
                 "company_id": 0,
                 "base_price": 129.99,
                 "original_price": 129.99,
                 "cart_id": "4163016541",
                 "tax_value": 0,
                 "subtotal": 129.99,
                 "display_subtotal": 129.99,
                 "shipped_amount": 0,
                 "shipment_amount": "1",
                 "is_accessible": true,
                 "shared_product": true
             },
             "2889884971":
             {
                 "item_id": "2889884971",
                 "order_id": "25",
                 "product_id": "45",
                 "product_code": "",
                 "price": "74.00",
                 "amount": "2",
                 "extra":
                 {
                     "product_options":
                     [
                     ],
                     "unlimited_download": "N",
                     "product": "The Process of Research in Psychology",
                     "company_id": 0,
                     "is_edp": "N",
                     "edp_shipping": "N",
                     "discount": 0,
                     "base_price": 74,
                     "stored_price": "N"
                 },
                 "product": "The Process of Research in Psychology",
                 "product_status": "A",
                 "deleted_product": false,
                 "discount": 0,
                 "company_id": 0,
                 "base_price": 74,
                 "original_price": 74,
                 "cart_id": "2889884971",
                 "tax_value": 0,
                 "subtotal": 148,
                 "display_subtotal": 148,
                 "shipped_amount": 0,
                 "shipment_amount": "2",
                 "is_accessible": false,
                 "shared_product": false
             },
             "336913281":
             {
                 "item_id": "336913281",
                 "order_id": "25",
                 "product_id": "27",
                 "product_code": "",
                 "price": "55.00",
                 "amount": "1",
                 "extra":
                 {
                     "product_options":
                     [
                     ],
                     "unlimited_download": "N",
                     "product": "Trefoil Logo Hoodie",
                     "company_id": 0,
                     "is_edp": "N",
                     "edp_shipping": "N",
                     "discount": 0,
                     "base_price": 55,
                     "stored_price": "N"
                 },
                 "product": "Trefoil Logo Hoodie",
                 "product_status": "A",
                 "deleted_product": false,
                 "discount": 0,
                 "company_id": 0,
                 "base_price": 55,
                 "original_price": 55,
                 "cart_id": "336913281",
                 "tax_value": 0,
                 "subtotal": 55,
                 "display_subtotal": 55,
                 "shipped_amount": 0,
                 "shipment_amount": "1",
                 "is_accessible": false,
                 "shared_product": false
             }
         },
         "taxes":
         {
             "6":
             {
                 "rate_type": "P",
                 "rate_value": "10.000",
                 "price_includes_tax": "Y",
                 "regnumber": "1234242",
                 "priority": "1",
                 "tax_subtotal": 2.55,
                 "description": "VAT",
                 "applies":
                 {
                     "P": 0,
                     "S": 2.55,
                     "items":
                     {
                         "PS":
                         [
                         ],
                         "S":
                         {
                             "1": true
                         },
                         "P":
                         [
                         ]
                     }
                 }
             }
         },
         "tax_subtotal": 0,
         "display_shipping_cost": "28.00",
         "is_root": "",
         "birthday": "",
         "purchase_timestamp_from": "",
         "purchase_timestamp_to": "",
         "responsible_email": "",
         "last_passwords": "",
         "password_change_timestamp": "",
         "api_key": "",
         "b_country_descr": "United States",
         "s_country_descr": "United States",
         "b_state_descr": "Massachusetts",
         "s_state_descr": "Massachusetts",
         "need_shipping": true,
         "shipment_ids":
         [
         ],
         "need_shipment": true,
         "secondary_currency": "USD",
         "display_subtotal": 332.99,
         "payment_info":
         {
             "card": "vis",
             "card_number": "XXXXXXXXXXXX1111",
             "cardholder_name": "Customer Customer",
             "expiry_month": "XX",
             "expiry_year": "XX",
             "cvv2": "XXX"
         },
         "shipping":
         {
             "1":
             {
                 "shipping": "Custom shipping method",
                 "rates":
                 [
                     28
                 ],
                 "packages_info":
                 {
                     "C": 332.99,
                     "W": "0.01",
                     "I": 4,
                     "origination":
                     {
                         "name": "Simtech",
                         "address": "44 Main street",
                         "city": "Boston",
                         "country": "US",
                         "state": "MA",
                         "zipcode": "02116",
                         "phone": "6175556985",
                         "fax": ""
                     }
                 }
             }
         },
         "doc_ids":
         [
         ]
      }
  }

=============
POST /orders/
=============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если заказ создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **user_id**, **payment_id**, **shipping_id**, **products**.

Заказ через API создается без проведения оплаты.

Если при создании заказа продукты будут разбиты по поставщикам, и в нем не будет доступен указаный метод доставки, то будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/orders' --data-binary '{...}'

Для версии Ultimate, если запрос выполняет root-администратор, заказ необходимо создавать через сущность :doc:`Stores <stores>`.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/stores/1/orders' --data-binary '{...}'

::

  {
      "user_id":"3",
      "payment_id":"2",
      "shipping_id":"1",
      "products" : {
           "148": {
               "amount":"1"
           }
      }
  }

::

  {
    "order_id": "26"
  }

===============
PUT /orders/:id
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если заказ обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

Допустимые параметры: *payment_id*, *shipping_id*, *user_id*, *products*.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/orders/2' --data-binary 'payment_id=2'

::

  {
     "order_id": "25",
  }    

==================
DELETE /orders/:id
==================

В случае, если заказ удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой заказ не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/orders/25'

