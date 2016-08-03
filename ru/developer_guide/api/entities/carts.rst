*****
Carts
*****

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 10
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /carts
        -   Получить список корзин
    *   -   GET /carts/:id
        -   Получить данные о корзине конкретного пользователя
    *   -   DELETE /carts/:id  
        -   Удалить данные о корзине конкретного пользователя

==========
GET /carts
==========

::

  curl -X GET 'http://example.com/api/2.0/carts'

::

  {
    "carts": {
      "49663684": {
        "user_id": "49663684",
        "firstname": null,
        "lastname": null,
        "date": "1444116507",
        "ip_address": "172.17.0.1",
        "company_id": "1",
        "user_data": []
      },
      "2421474427": {
        "user_id": "2421474427",
        "firstname": null,
        "lastname": null,
        "date": "1444118275",
        "ip_address": "172.17.0.1",
        "company_id": "1",
        "cart_products": "3",
        "total": "85.93",
        "order_id": null,
        "user_data": []
      }
      "3": {
        "user_id": "3",
        "firstname": "Customer",
        "lastname": "Customer",
        "date": "1444116486",
        "ip_address": "172.17.0.1",
        "company_id": "1",
        "cart_products": "5",
        "total": "2054.40",
        "order_id": null,
        "user_data": {
          "user_id": "3",
          "status": "A",
          "user_type": "C",
          ...
        }
      }
    },
    "params": {
      "page": 1,
      "items_per_page": "10",
      "company_id": "1",
      "sort_order": "asc",
      "sort_by": "customer",
      "sort_order_rev": "desc",
      "total_items": "3"
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
        -   ``customer``
	-   Сортировать по: ``customer``, ``date``
    *   -   **sort_order**  
        -   ``desc``
	-   Порядок сортировки: ``asc`` или ``desc``
    *   -   **cname**
        -
	-   Фильтрация по имени
    *   -   **email**
        -
	-   Фильтрация по Email
    *   -   **user_id**
        -
	-   Фильтрация по User ID
    *   -   **with_info_only**
        -   ``false``
	-   Если true, то будут выбраны только пользователи с контакнтной информацией
    *   -   **users_type**
        -
	-   Фильтрация по типу пользователя: ``R`` - зарегистрированный, ``G`` - гость
    *   -   **total_from**
        -
	-   Фильтрация по общей сумме: минимальное значение
    *   -   **total_to**
        -
	-   Фильтрация по общей сумме: максимальное значение
    *   -   **product_type_c** 
        -   ``false``
	-   Если true, то будут выбраны только пользователи с содержимым в корзине
    *   -   **product_type_w**
        -   ``false``
	-   Если true, то будут выбраны только пользователи с содержимым в wishlist
    *   -   **period**
        -   ``A``
	-   Фильтрация по периоду: ``A`` - за все время, ``D`` - сегодняшний день, ``LD`` - предыдущий день, ``W`` - текущая неделя, ``LW`` - предыдущая неделя, ``M`` - текущий месяц, ``LM`` - предыдущий месяц, ``Y`` - текущий год, ``LY`` - предыдущий год, ``HH`` - Последние 24 часа, ``HW`` - Последние 7 дней, ``HM`` - Последние 30 дней, ``C`` - заданный период (используется совместно с полями ``time_from`` и ``time_to``)
    *   -   **time_from**  
        -
	-   Фильтрация по времени: начальная дата
    *   -   **time_to**
        -
	-   Фильтрация по времени: конечная дата
    *   -   **p_ids**
        -
	-   Фильтрация по Product IDs
    *   -   **view_id** 
        -
	-   Фильтрация по продуктам, используя сохраненный поиск продуктов

==============
GET /carts/:id
==============

::

  curl -X GET 'http://example.com/api/2.0/carts/1'

::

  {
    "user_id": "2421474427",
    "firstname": null,
    "lastname": null,
    "date": "1444118275",
    "ip_address": "172.17.0.1",
    "company_id": "1",
    "cart_products": "3",
    "total": "85.93",
    "order_id": null,
    "user_data": [],
    "products": [
      {
        "item_id": "140116777",
        "item_type": "P",
        "product_id": "130",
        "amount": "1",
        "price": "49.95",
        "extra": {
          "product_id": 130,
          "product_code": "T0130501N7",
          "product": "Casio DR-210TM",
          "amount": 1,
          "product_options": [],
          "price": 49.95,
          "stored_price": "N",
          "main_pair": {
            "pair_id": "503",
            "image_id": "0",
            "detailed_id": "559",
            "position": "0",
            "detailed": {
              "image_path": "http://gvs.u.simtech/cscart/images/detailed/0/dr-210tmbk_xlarge.jpg",
              "alt": "",
              "image_x": "1175",
              "image_y": "1166",
              "http_image_path": "http://gvs.u.simtech/cscart/images/detailed/0/dr-210tmbk_xlarge.jpg",
              "https_image_path": "https://gvs.u.simtech/cscart/images/detailed/0/dr-210tmbk_xlarge.jpg",
              "absolute_path": "/var/www/html/cscart/images/detailed/0/dr-210tmbk_xlarge.jpg",
              "relative_path": "detailed/0/dr-210tmbk_xlarge.jpg"
            }
          },
          "extra": {
            "product_options": [],
            "unlimited_download": "N"
          },
          "stored_discount": "N",
          "company_id": "1",
          "amount_total": 1,
          "options_type": "P",
          "exceptions_type": "F",
          "modifiers_price": 0,
          "is_edp": "N",
          "edp_shipping": "N",
          "discount": 0,
          "promotions": [],
          "base_price": 49.95,
          "category_ids": [
            251
          ],
          "display_price": 49.95
        },
        "product": "Casio DR-210TM"
      },
      {
        "item_id": "530233946",
        "item_type": "P",
        "product_id": "128",
        "amount": "2",
        "price": "17.99",
        "extra": {
          "product_id": 128,
          "product_code": "K0128RATX3",
          "product": "Casio FX-115ES",
          "amount": 2,
          "product_options": [],
          "price": 17.99,
          "stored_price": "N",
          "main_pair": {
            "pair_id": "498",
            "image_id": "0",
            "detailed_id": "554",
            "position": "0",
            "detailed": {
              "image_path": "http://gvs.u.simtech/cscart/images/detailed/0/fx-115es_xlarge.jpg",
              "alt": "",
              "image_x": "500",
              "image_y": "529",
              "http_image_path": "http://gvs.u.simtech/cscart/images/detailed/0/fx-115es_xlarge.jpg",
              "https_image_path": "https://gvs.u.simtech/cscart/images/detailed/0/fx-115es_xlarge.jpg",
              "absolute_path": "/var/www/html/cscart/images/detailed/0/fx-115es_xlarge.jpg",
              "relative_path": "detailed/0/fx-115es_xlarge.jpg"
            }
          },
          "extra": {
            "product_options": [],
            "unlimited_download": "N"
          },
          "stored_discount": null,
          "company_id": "1",
          "amount_total": 1,
          "options_type": "P",
          "exceptions_type": "F",
          "modifiers_price": 0,
          "is_edp": "N",
          "edp_shipping": "N",
          "discount": 0,
          "promotions": [],
          "base_price": 17.99,
          "category_ids": [
            251
          ],
          "display_price": 17.99
        },
        "product": "Casio FX-115ES"
      }
    ]
  }

=====================
DELETE /carts/:id
=====================

В случае, если корзину удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/carts/3'

