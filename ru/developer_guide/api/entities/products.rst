********
Products
********

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /products
        -   Получить список товаров
    *   -   GET /products/:id
        -   Получить данные о товаре
    *   -   POST /products/
        -   Создать товар
    *   -   PUT /products/:id
        -   Обновить товар
    *   -   DELETE /products/:id
        -   Удалить товар

=============
GET /products
=============

::

  curl -X GET 'http://example.com/api/2.0/products'

::

  [
    {
      "product_id": "12",
      "product_code": "U0012O5AF0",
      "product_type": "P",
      "status": "A",
      "company_id": "2",
      "list_price": "45.00",
      "amount": "10",
      "weight": "0.00",
      "length": "0",
      "width": "0",
      "height": "0",
      "shipping_freight": "0.00",
      "low_avail_limit": "0",
      "timestamp": "1328558400",
      "updated_timestamp": "1329219260",
      "usergroup_ids": "0",
      "is_edp": "N",
      "edp_shipping": "N",
      "unlimited_download": "N",
      "tracking": "B",
      "free_shipping": "N",
      "zero_price_action": "R",
      "is_pbp": "Y",
      "is_op": "N",
      "is_oper": "N",
      "is_returnable": "Y",
      "return_period": "10",
      "avail_since": "0",
      "out_of_stock_actions": "N",
      "localization": "",
      "min_qty": "0",
      "max_qty": "0",
      "qty_step": "0",
      "list_qty_count": "0",
      "tax_ids": "6",
      "age_verification": "N",
      "age_limit": "0",
      "options_type": "P",
      "exceptions_type": "F",
      "details_layout": "default",
      "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
      "product": "100g Pants",
      "price": "30.000000"
    },
    {
      "product_id": "17",
      "product_code": "G0017HS88V",
      "product_type": "P",
      "status": "A",
      "company_id": "2",
      "list_price": "0.00",
      "amount": "19",
      "weight": "0.00",
      "length": "0",
      "width": "0",
      "height": "0",
      "shipping_freight": "0.00",
      "low_avail_limit": "0",
      "timestamp": "1328558400",
      "updated_timestamp": "1328684302",
      "usergroup_ids": "0",
      "is_edp": "N",
      "edp_shipping": "N",
      "unlimited_download": "N",
      "tracking": "B",
      "free_shipping": "N",
      "zero_price_action": "R",
      "is_pbp": "Y",
      "is_op": "N",
      "is_oper": "N",
      "is_returnable": "Y",
      "return_period": "10",
      "avail_since": "0",
      "out_of_stock_actions": "N",
      "localization": "",
      "min_qty": "0",
      "max_qty": "0",
      "qty_step": "0",
      "list_qty_count": "0",
      "tax_ids": "6",
      "age_verification": "N",
      "age_limit": "0",
      "options_type": "P",
      "exceptions_type": "F",
      "details_layout": "default",
      "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
      "product": "101 Things Everyone Should Know About Economics A Down and Dirty Guide to Everything from Securities and Derivatives to Interest Rates and Hedge Funds—And What They Mean For You",
      "price": "11.160000"
    },
    ...

=================
GET /products/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/products/12'

::

  {
    "min_items_in_box": 0,
    "max_items_in_box": 0,
    "box_length": 0,
    "box_width": 0,
    "box_height": 0,
    "product_id": 12,
    "product_code": "U0012O5AF0",
    "product_type": "P",
    "status": "A",
    "company_id": "2",
    "list_price": "45.00",
    "amount": "10",
    "weight": "0.00",
    "length": "0",
    "width": "0",
    "height": "0",
    "shipping_freight": "0.00",
    "low_avail_limit": "0",
    "timestamp": "1328558400",
    "updated_timestamp": "1329219260",
    "usergroup_ids": "0",
    "is_edp": "N",
    "edp_shipping": "N",
    "unlimited_download": "N",
    "tracking": "B",
    "free_shipping": "N",
    "zero_price_action": "R",
    "is_pbp": "Y",
    "is_op": "N",
    "is_oper": "N",
    "is_returnable": "Y",
    "return_period": "10",
    "avail_since": "0",
    "out_of_stock_actions": "N",
    "localization": "",
    "min_qty": "0",
    "max_qty": "0",
    "qty_step": "0",
    "list_qty_count": "0",
    "tax_ids": "6",
    "age_verification": "N",
    "age_limit": "0",
    "options_type": "P",
    "exceptions_type": "F",
    "details_layout": "default",
    "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
    "lang_code": "en",
    "product": "100g Pants",
    "shortname": "",
    "short_description": "",
    "full_description": "<p>When coach calls you off the bench, you need warm-up pants that come off  in three seconds or less. That&rsquo;s why these men's adidas 100g basketball  pants have tear-away snaps down the sides, so you're ready for action  as fast as a superhero.</p>",
    "meta_keywords": "",
    "meta_description": "",
    "search_words": "",
    "page_title": "",
    "age_warning_message": "",
    "promo_text": "<p class=\"product-promo-text\"><span class=\"product-promo-header\">FREE US shipping over $100!</span><span class=\"product-promo-body\">Orders within next 2 days will be shipped on Monday</span></p>",
    "price": "30.000000",
    "category_ids": [
      255,
      224
    ],
    "popularity": null,
    "base_price": "30.000000",
    "main_category": 224,
    "main_pair": {
      "pair_id": "823",
      "image_id": "0",
      "detailed_id": "879",
      "position": "0",
      "detailed": {
        "image_path": "http://vmalyshev.u.simtech/dev_ult/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "alt": "",
        "image_x": "500",
        "image_y": "500",
        "http_image_path": "http://vmalyshev.u.simtech/dev_ult/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "absolute_path": "/home/vmalyshev/www/dev_ult/images/detailed/0/173283_0113298267324f438bac97eaf.jpg"
      }
    },
    "image_pairs": [],
    "taxes": [
      "6"
    ],
    "shared_product": "Y",
    "product_features": {
      "18": {
        "feature_id": "18",
        "company_id": "1",
        "feature_type": "E",
        "parent_id": "0",
        "display_on_product": "N",
        "display_on_catalog": "N",
        "display_on_header": "Y",
        "description": "Brand",
        "prefix": "",
        "suffix": "",
        "categories_path": "",
        "full_description": "",
        "status": "A",
        "comparison": "N",
        "position": "0",
        "group_position": null,
        "value": null,
        "variant_id": null,
        "value_int": null,
        "variants": {
          "85": {
            "variant_id": "85",
            "variant": "Apple",
            "description": "",
            "page_title": "",
            "meta_keywords": "",
            "meta_description": "",
            "lang_code": "en",
            "feature_id": "18",
            "url": "",
            "position": "0",
            "selected": null,
            "feature_type": "E",
            "image_pair": null
          }
        }
      }
    },
    "header_features": [],
    "detailed_params": {
      "info_type": "D"
    }
  }

===============
POST /products/
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если товар создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created** и ID нового продукта.

Обязательные параметры: **product** и **category_ids**. 

Главной категорией будет первый ID (в примере это 178).

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/products' --data-binary 'product=test&category_ids[]=178&category_ids[]=201'

::

  {
    "product_id": "250"
  }

=================
PUT /products/:id
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если товар обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/products/12' --data-binary 'status=D'

::

  {
     "product_id": "12",
  }    

====================
DELETE /products/:id
====================

В случае, если товар удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой товар не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/products/12'

