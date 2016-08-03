**********
Categories
**********

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 10
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /categories
        -   Получить список категорий
    *   -   GET /categories/:id
        -   Получить данные категории
    *   -   POST /categories/
        -   Создать категорию
    *   -   PUT /categories/:id
        -   Обновить категорию
    *   -   DELETE /categories/:id
        -   Удалить категорию

===============
GET /categories
===============

::

  curl -X GET 'http://example.com/api/2.0/categories'

::

  [
    {
      "category_id": "255",
      "parent_id": "254",
      "id_path": "254/255",
      "category": "Men",
      "position": "0",
      "status": "A",
      "product_count": "6",
      "company_id": "1"
    },
    {
      "category_id": "254",
      "parent_id": "0",
      "id_path": "254",
      "category": "Apparel",
      "position": "40",
      "status": "A",
      "product_count": "0",
      "company_id": "1"
    },
    ...
  ]

===================
GET /categories/:id
===================

::

  curl -X GET 'http://example.com/api/2.0/categories/255'

::

  {
    "category_id": "255",
    "parent_id": "254",
    "id_path": "254/255",
    "company_id": "1",
    "usergroup_ids": "0",
    "status": "A",
    "product_count": "6",
    "position": "0",
    "timestamp": "1328475600",
    "is_op": "N",
    "localization": "",
    "age_verification": "N",
    "age_limit": "0",
    "parent_age_verification": "N",
    "parent_age_limit": "0",
    "selected_views": [],
    "default_view": "",
    "product_details_view": "",
    "product_columns": "0",
    "lang_code": "en",
    "category": "Men",
    "description": "",
    "meta_keywords": "",
    "meta_description": "",
    "page_title": "",
    "age_warning_message": "",
    "main_pair": []
  }

=================
POST /categories/
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае если категорию создать не удалось будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **category**, **company_id** (если версия Ultimate). **company_id** также инициализируется через сущность :doc:`Stores <stores>`.

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/categories' --data-binary 'category=tesst&status=A&company_id=1'

::

  {
    "category_id": "256"
  }

===================
PUT /categories/:id
===================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если категорию обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/catogories/255' --data-binary 'status=D'

::

  {
     "category_id": "2",
  }    

======================
DELETE /categories/:id
======================

В случае, если категорию удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такая категория не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён **статус HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/categories/255'

