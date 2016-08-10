***************
Страницы: pages
***************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /pages
        -   Получить список страниц
    *   -   GET /pages/:id
        -   Получить данные страницы
    *   -   POST /pages/
        -   Создать страницу
    *   -   PUT /pages/:id
        -   Обновить страницу
    *   -   DELETE /pages/:id
        -   Удалить страницу

==========
GET /pages
==========

::

  curl -X GET 'http://example.com/api/2.0/pages'

::

  {
    "pages": [
      {
        "page_id": "2",
        "company_id": "1",
        "parent_id": "0",
        "id_path": "2",
        "status": "A",
        "page_type": "T",
        "position": "0",
        "timestamp": "1208808000",
        "usergroup_ids": "0",
        "localization": "",
        "new_window": "0",
        "use_avail_period": "N",
        "avail_from_timestamp": "0",
        "avail_till_timestamp": "0",
        "lang_code": "en",
        "page": "About our company",
        "description": "Put your company description here. HTML tags can be used in this description.",
        "meta_keywords": "",
        "meta_description": "",
        "page_title": "",
        "link": "",
        "level": 0
      },
      {
        "page_id": "30",
        "company_id": "1",
        "parent_id": "0",
        "id_path": "30",
        "status": "A",
        "page_type": "F",
        "position": "0",
        "timestamp": "1208808000",
        "usergroup_ids": "0",
        "localization": "",
        "new_window": "0",
        "use_avail_period": "N",
        "avail_from_timestamp": "0",
        "avail_till_timestamp": "0",
        "lang_code": "en",
        "page": "Contact us",
        "description": "You can send us a message using the form below.",
        "meta_keywords": "",
        "meta_description": "",
        "page_title": "",
        "link": "",
        "level": 0
      },
      ...
    ],
    "search": {
      "page": 1,
      "total_items": 15,
      ...
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
	-   Запрашиваемая страница
    *   -   **items_per_page** 
        -   ``Глобальное значение``
	-   Количество элементов на странице
    *   -   **sort_by**
        -   ``position``
	-   Сортировать по: ``position``, ``name``, ``timestamp``, ``type``, ``multi_level``
    *   -   **sort_order**  
        -   ``desc``
	-   | Порядок сортировки: 
            | ``asc`` — по возрастанию
            | ``desc`` — по убыванию
    *   -   **parent_id**
        -
	-   ID родительского элемента
    *   -   **page_type**
        -
	-   | Тип страницы: 
            | ``T`` - страница 
            | ``L`` - ссылка
            | ``F`` - форма 
            | ``B`` - пост в блоге
    *   -   **simple**
        -
	-   Если параметр передан, то страницы вернутся в упрощенном варианте (без содержимого)
    *   -   **q**
        -
	-   Полнотекстовая фильтрация
    *   -   **status**
        -
	-   | Статус: 
            | ``A`` - Вкл. 
            | ``H`` - Скрыто
            | ``D`` - Выкл.
    *   -   **item_ids**
        -
	-   Выборка только конкретного список страниц. ID через запятую
    *   -   **get_tree**
        -
	-   Вернуть в виде дерева. Варианты: ``true``, ``plain``

==============
GET /pages/:id
==============

::

  curl -X GET 'http://example.com/api/2.0/pages/2'

::

  {
    "page_id": "2",
    "company_id": "1",
    "parent_id": "0",
    "id_path": "2",
    "status": "A",
    "page_type": "T",
    "position": "0",
    "timestamp": "1208808000",
    "usergroup_ids": "0",
    "localization": "",
    "new_window": "0",
    "use_avail_period": "N",
    "avail_from_timestamp": "0",
    "avail_till_timestamp": "0",
    "lang_code": "en",
    "page": "About our company",
    "description": "Put your company description here. HTML tags can be used in this description.",
    "meta_keywords": "",
    "meta_description": "",
    "page_title": "",
    "link": ""
  }

============
POST /pages/
============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если страницу создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **page_type**, **page**.

Параметры такие же, как в ключе ``page_data`` при отправке формы из панели администратора.

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/pages' --data-binary 'page_type=T&page=tesst&status=A'

::

  {
    "page_id": "12"
  }

==============
PUT /pages/:id
==============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если страницу обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/pages/12' --data-binary 'status=D'

::

  {
    "page_id": "12",
  }    

====================
DELETE /pages/:id
====================

В случае, если страницу удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае, если такая страница не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/pages/12'
