**********************
Опции товаров: options
**********************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 15
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /api/2.0/options
        -   Получить список опций товара (требуется ``product_id``)
    *   -   GET /api/2.0/options/:id
        -   Получить данные о конкретной опции
    *   -   POST /api/2.0/options/
        -   Создать новое опцию
    *   -   PUT /api/2.0/options/:id
        -   Обновить опцию
    *   -   DELETE /api/2.0/options/:id
        -   Удалить опцию

=====================
GET /api/2.0/options/
=====================

::

  curl -X GET 'http://example.com/api/2.0/options/?product_id=12'

.. important::

    **product_id** - обязательное поле.

::

  {
    [
      {
          option_id: "3",
          option_type: "S",
          option_name: "Size"
          ...
          variants: {
             3: {...},
             4: {...}
          }
      },
      ...
    ]
  }

========================
GET /api/2.0/options/:id
========================

::

  curl -X GET 'http://example.com/api/2.0/options/12'

::

  {
      option_id: "3",
      option_type: "S",
      option_name: "Size"
      ...
      variants: {
         3: {...},
         4: {...}
      }
  }

======================
POST /api/2.0/options/
======================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если опцию создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created** и код нового исключения.

Обязательные параметры: **product_id**, массив **combination (option_id => variant_id)**.

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/options' --data-binary 'params...'

::

  params:
         product_id          12      (required field)
         option_name         Color
         required            Y
         allowed_extensions  jpg,png
         inventory           N
         ...                 (any field from :?product_options)
         option_type         S

         variants[1][variant_name]       Red
         variants[1][modifier_type]      P
         variants[1][modifier]           12
         ...                             (any field from :?product_option_variants)
         variants[2][variant_name]       Green

         main_pair[icon][image_path][1]  exim/backup/images/1000156675_f_icon.jpg
         main_pair[icon][alt][1]         Some ALT text
         main_pair[icon][image_path][2]  exim/backup/images/15456_icon.jpg
         main_pair[icon][alt][2]         Some ALT text2
  {
      option_id: 456
  }

========================
PUT /api/2.0/options/:id
========================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если опцию обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успешного обновления **HTTP/1.1 200 OK**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/options/123' --data-binary 'product_id=12&option_name=...'

::

  params:
         product_id          12      (required field)
         option_name         Color
         required            Y
         allowed_extensions  jpg,png
         inventory           N
         ...                 (any field from :?product_options)
         option_type         S

         variants[1][variant_name]  Red
         variants[1][modifier_type] P
         variants[1][modifier]      12
         ...                 (any field from :?product_option_variants)
         variants[2][variant_name]  Green

         ALL VARIANTS MUST BE SPECIFIED (!) otherwise unspecified variants will be removed

::  

  {
     option_id: 34
  }    

===========================
DELETE /api/2.0/options/:id
===========================

В случае, если опцию удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки. 

В случае, если такая опция не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/options/123'

