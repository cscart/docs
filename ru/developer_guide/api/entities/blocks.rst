******
Blocks
******

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 10 10

    *   -   Ресурс 
        -   Описание
    *   -   GET /blocks
        -   Получить список блоков
    *   -   GET /blocks/:id
        -   Получить данные блока
    *   -   POST /blocks/
        -   Создать блок
    *   -   PUT /blocks/:id
        -   Обновить блок
    *   -   DELETE /blocks/:id
        -   Удалить блок

===========
GET /blocks
===========

::

  curl -X GET 'http://example.com/api/2.0/blocks'

::

  [
    {
      "block_id": "16",
      "type": "smarty_block",
      "properties": {
        "template": "blocks/smarty_block.tpl"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "About us"
    },
    {
      "block_id": "1",
      "type": "breadcrumbs",
      "properties": {
        "template": "common/breadcrumbs.tpl"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "Breadcrumbs"
    },
    {
      "block_id": "5",
      "type": "cart_content",
      "properties": {
        "template": "blocks/cart_content.tpl",
        "display_bottom_buttons": "Y",
        "display_delete_icons": "Y",
        "products_links_type": "thumb",
        "generate_block_title": "Y"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "Cart content"
    },
    {
      "block_id": "8",
      "type": "currencies",
      "properties": {
        "template": "blocks/currencies.tpl",
        "text": "",
        "format": "symbol",
        "dropdown_limit": "3"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "Currencies"
    },
    {
      "block_id": "9",
      "type": "my_account",
      "properties": {
        "template": "blocks/my_account.tpl"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "My Account"
    },
    {
      "block_id": "30",
      "type": "products",
      "properties": {
        "template": "blocks/products/products_multicolumns.tpl",
        "item_number": "N",
        "number_of_columns": "4",
        "hide_add_to_cart_button": "Y"
      },
      "company_id": "1",
      "lang_code": "en",
      "name": "On Sale"
    },
    ...
  ]

===============
GET /blocks/:id
===============

::

  curl -X GET 'http://example.com/api/2.0/blocks/16'

::

  {
    "block_id": "16",
    "type": "smarty_block",
    "properties": {
      "template": "blocks/smarty_block.tpl"
    },
    "company_id": "1",
    "lang_code": "en",
    "name": "About us",
    "content": {
      "content": "\n<ul id=\"about_cs_cart_links\">\n<li class=\"ty-footer-menu__item\"><a href=\"{\"pages.view?page_id=1\"|fn_url}\">Our team</a></li>\n<li class=\"ty-footer-menu__item\"><a href=\"{\"pages.view?page_id=3\"|fn_url}\">Privacy policy</a></li>\n</ul>"
    }
  }

=============
POST /blocks/
=============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если блок создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **type**, **name**, **properties**.

Возможные варианты для **type**: *menu*, *my_account*, *our_brands*, *cart_content*, *breadcrumbs*, *template*, *main*, *html_block*, *smarty_block*, *checkout*, *products*, *categories*, *pages*, *payment_methods*, *shipping_methods*, *currencies*, *languages*, *product_filters*. 

Есть еще дополнительные типы блоков для MVE: *vendor_information*, *vendor_logo*, *vendor_categories*, *vendor_search*.

Передаваемые параметры полностью соответствуют ключу ``block_data`` передаваемому через форму в панели администратора на странице редактирования блока. Детали можно смотреть через дебаггер браузера.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/blocks' -d '
  {
    "type": "template",
    "name": "Example template",
    "properties": {
      "template": "blocks/static_templates/my_account_links.tpl"
    },
  }'

::
  
  {
    "block_id": "37"
  }

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/blocks' -d '
  {
    "type": "html_block",
    "name": "Html block example",
    "properties": {
      "template": "blocks/html_block.tpl"
    },
    "content": {
      "content": "<p>Example text</p>"
    },
    "lang_code": "en"
  }'

::

  {
    "block_id": "38"
  }

===============
PUT /blocks/:id
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если блок обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: application/json' -X PUT 'http://example.com/api/2.0/blocks/37' -d '
  {
    "type": "template",
    "name": "Example template 2",
    "properties": {
      "template": "blocks/static_templates/my_account_links.tpl"
    }
  }'

::

  {
    "block_id": "37"
  }    

====================
DELETE /blocks/:id
====================

В случае, если такой блок не существует, будет возвращен статус **HTTP/1.1 404 Not Found**

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/blocks/37'


