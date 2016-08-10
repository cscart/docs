************************
Способы оплаты: payments
************************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /payments
        -   Получить список способов оплаты
    *   -   GET /payments/:id
        -   Получить данные о способе оплаты
    *   -   POST /payments/
        -   Создать способ оплаты
    *   -   PUT /payments/:id
        -   Обновить способ оплаты
    *   -   DELETE /payments/:id
        -   Удалить способ оплаты

=============
GET /payments
=============

::

  curl -X GET 'http://example.com/api/2.0/payments'

::

  {
  [
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
      "tax_ids": "",
      "localization": "",
      "payment_category": "tab1",
      "payment": "Credit card",
      "description": "Visa, Mastercard, etc...",
      "instructions": "",
      "surcharge_title": "",
      "lang_code": "en"
    },
    {
      "payment_id": "2",
      "company_id": "1",
      "usergroup_ids": "0",
      "position": "20",
      "status": "A",
      "template": "views/orders/components/payments/phone.tpl",
      "processor_id": "0",
      "processor_params": "",
      "a_surcharge": "0.000",
      "p_surcharge": "0.000",
      "tax_ids": "",
      "localization": "",
      "payment_category": "tab3",
      "payment": "Phone ordering",
      "description": "Call to 5555555",
      "instructions": "<h2>When should I use phone ordering?</h2><p>Order by phone is useful when regular payment methods like credit card are unavailable or considered insecure.</p><p>Our operators are happy to take your order per phone every business day from 9 a.m. to 5 p.m. UTC.</p>",
      "surcharge_title": "",
      "lang_code": "en"
    },...
  }

=================
GET /paymnets/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/payments/1'

::

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
    "tax_ids": [],
    "localization": "",
    "payment_category": "tab1",
    "payment": "Credit card",
    "description": "Visa, Mastercard, etc...",
    "instructions": "",
    "surcharge_title": "",
    "lang_code": "en",
    "processor": null,
    "processor_type": null,
    "image": []
  }

===============
POST /payments/
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если способ оплаты создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **payment**, **company_id** (если версия ULTIMATE).

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/payments' --data-binary 'payments=tesst&status=A&description=Test&company_id=1'

::

  {
    "payment_id": "12"
  }

=================
PUT /payments/:id
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае если, способ оплаты обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/payments/2' --data-binary 'status=D'

::

  {
     "payment_id": "2",
  }    

====================
DELETE /payments/:id
====================

В случае, если способ оплаты удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой способ оплаты не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/payments/3'

