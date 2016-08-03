******
Stores
******

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /stores
        -   Получить список витрин
    *   -   GET /stores/:id
        -   Получить данные о витрине
    *   -   POST /stores/
        -   Создать витрину
    *   -   PUT /stores/:id
        -   Обновить данные витрины
    *   -   DELETE /stores/:id
        -   Удалить витрину

===========
GET /stores
===========

::

  curl -X GET 'http://example.com/api/2.0/stores'

::

  [
    {
      "company_id": "2",
      "lang_code": "en",
      "email": "acme_corp@example.com",
      "company": "ACME Corp",
      "timestamp": "1269610461",
      "status": "A"
    },
    {
      "company_id": "1",
      "lang_code": "en",
      "email": "simtech@example.com",
      "company": "Simtech",
      "timestamp": "1269610461",
      "status": "A"
    }
  ]

===============
GET /stores/:id
===============

::

  curl -X GET 'http://example.com/api/2.0/stores/2'

::

  {
    "company_id": "2",
    "lang_code": "en",
    "email": "acme_corp@example.com",
    "company": "ACME Corp",
    "timestamp": "1269610461",
    "status": "A"
  }

=============
POST /stores/
=============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если витрину создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **company**, **storefront**.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/stores' --data-binary '...'

::

  {
    "company": "API company", // Base company name (like LOGIN)
    "storefront": "apitest.com",
    "secure_storefront": "apitest.com",
    "company_description": "", // ????
    "redirect_customer": "Y", // N/Y
    "entry_page": "index", // all_pages/none/index // Entry page
    "countries_list": [
        "DZ", "AS", "AQ", "AG", "AR"
    ],
    "company_name": "My new company",
    "company_address": "41 Avenue",
    "company_city": "New York",
    "company_country": "US",
    "company_state": "NY",
    "company_zipcode": "10001",
    "company_phone": "1234-123-12345",
    "company_phone_2": "",
    "company_fax": "",
    "company_website": "http://example.com",
    "company_start_year": "2004",
    "company_users_department": "users@example.com",
    "company_site_administrator": "admin@example.com",
    "company_orders_department": "orders@example.com",
    "company_support_department": "support@example.com",
    "company_newsletter_email": "news@example.com",

    "clone_from": 1, // Source store ID
    "clone": [
      "layouts": "Y",
      "settings": "Y",
      "profile_fields": "Y",
      "pages": "Y",
      "promotions": "Y",
      "shippings": "Y",
      "payments": "Y",
      "product_filters": "Y",
      "product_features": "Y",
      "sitemap": "Y",
      "static_data_clone": "Y",
      "products": "Y",
      "categories": "Y"
    ]
  }

**Результат**

::

  {
    "store_id": "7"
  }

===============
PUT /stores/:id
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если витрину обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/stores/6' --data-binary 'storefront=example.com'

::

  {
     "store_id": "6",
  }    

==================
DELETE /stores/:id
==================

В случае, если витрину удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такая витрина не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/stores/3'

