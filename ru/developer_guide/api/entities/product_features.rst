********************************
Характеристики товаров: features
********************************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /features
        -   Получить список характеристик
    *   -   GET /features/:id
        -   Получить данные характеристики
    *   -   POST /features/
        -   Создать характеристику
    *   -   PUT /features/:id
        -   Обновить характеристику
    *   -   DELETE /features/:id
        -   Удалить характеристику

=============
GET /features
=============

::

  curl -X GET 'http://example.com/api/2.0/features'

::

  {
      "features": [
          {
              "feature_id": "14",
              "company_id": "1",
              "feature_type": "G",
              "parent_id": "0",
              "display_on_product": "Y",
              "display_on_catalog": "Y",
              "display_on_header": "N",
              "description": "Electronics",
              "lang_code": "en",
              "prefix": "",
              "suffix": "",
              "categories_path": "165,166,167,168,169,170,174,182,190,191,193,234,235,236,237,238,240",
              "full_description": "",
              "status": "A",
              "comparison": "N",
              "position": "0",
              "purpose": "",
              "feature_style": "",
              "filter_style": ""
          },
          {
              "feature_id": "20",
              "company_id": "1",
              "feature_type": "G",
              "parent_id": "0",
              "display_on_product": "Y",
              "display_on_catalog": "Y",
              "display_on_header": "N",
              "description": "Main features",
              "lang_code": "en",
              "prefix": "",
              "suffix": "",
              "categories_path": "248",
              "full_description": "",
              "status": "A",
              "comparison": "N",
              "position": "10",
              "purpose": "",
              "feature_style": "",
              "filter_style": ""
          },
          {
              "feature_id": "18",
              "company_id": "1",
              "feature_type": "E",
              "parent_id": "0",
              "display_on_product": "N",
              "display_on_catalog": "N",
              "display_on_header": "Y",
              "description": "Brand",
              "lang_code": "en",
              "prefix": "",
              "suffix": "",
              "categories_path": "",
              "full_description": "",
              "status": "A",
              "comparison": "N",
              "position": "0",
              "purpose": "organize_catalog",
              "feature_style": "brand",
              "filter_style": "checkbox",
              "group_position": null
          },
        ...
      ]
  }

=================
GET /features/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/features/25'

::

  {
      "feature_id": "25",
      "feature_code": "",
      "company_id": "1",
      "feature_type": "S",
      "parent_id": "24",
      "display_on_product": "Y",
      "display_on_catalog": "Y",
      "display_on_header": "N",
      "description": "RAM",
      "lang_code": "en",
      "prefix": "",
      "suffix": "",
      "categories_path": "248",
      "full_description": "",
      "status": "A",
      "comparison": "N",
      "position": "0",
      "purpose": "find_products",
      "feature_style": "text",
      "filter_style": "checkbox",
      "variants": {
          "140": {
              "variant_id": "140",
              "variant": "8192 MB, DDR3",
              "description": "",
              "page_title": "",
              "meta_keywords": "",
              "meta_description": "",
              "lang_code": "en",
              "feature_id": "25",
              "url": "",
              "color": null,
              "position": "0",
              "seo_name": null,
              "seo_path": null,
              "image_pair": null
          },
          "163": {
              "variant_id": "163",
              "variant": "512 MB, 700 MHz, GDDR3",
              "description": "",
              "page_title": "",
              "meta_keywords": "",
              "meta_description": "",
              "lang_code": "en",
              "feature_id": "25",
              "url": "",
              "color": null,
              "position": "0",
              "seo_name": null,
              "seo_path": null,
              "image_pair": null
          },
          "179": {
              "variant_id": "179",
              "variant": "2000 MB, DDR3",
              "description": "",
              "page_title": "",
              "meta_keywords": "",
              "meta_description": "",
              "lang_code": "en",
              "feature_id": "25",
              "url": "",
              "color": null,
              "position": "0",
              "seo_name": null,
              "seo_path": null,
              "image_pair": null
          },
          "185": {
              "variant_id": "185",
              "variant": "8192 MB, GDDR5",
              "description": "",
              "page_title": "",
              "meta_keywords": "",
              "meta_description": "",
              "lang_code": "en",
              "feature_id": "25",
               "url": "",
              "color": null,
              "position": "0",
              "seo_name": null,
              "seo_path": null,
              "image_pair": null
          }
      }
  }

===============
POST /features/
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если метод доставки создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **description**, **feature_type**.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/features' --data-binary '{...}'

Для версии Ultimate, если запрос выполняет root-администратор, необходимо указать ``company_id`` или создавать через сущность :doc:`Stores <stores>`.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/stores/1/features' --data-binary '{...}'

::

  {
     "description": "Test feature",
     "feature_type": "S"
  }

::

  {
    "features_id": "5"
  }

=================
PUT /features/:id
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если будут переданы неправильные параметры, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/features/2' --data-binary 'status=D'

::

  {
     "feature_id": "2",
  }    

====================
DELETE /features/:id
====================

В случае, если характеристику удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такая характеристика не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

При успехе будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/features/3'

