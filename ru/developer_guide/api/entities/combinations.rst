******************************
Комбинации опций: combinations
******************************

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 25 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /api/2.0/combinations
        -   Получить список доступных комбинаций опций (требуется product_id)
    *   -   GET /api/2.0/combinations/:id
        -   Получить данные о комбинации опций
    *   -   POST /api/2.0/combinations/
        -   Создать новую комбинацию опций
    *   -   PUT /api/2.0/combinations/:id 
        -   Обновить комбинацию опций
    *   -   DELETE /api/2.0/combinations/:id
        -   Удалить комбинацию опций

==========================
GET /api/2.0/combinations/
==========================

::

  curl -X GET 'http://example.com/api/2.0/combinations/?product_id=12'


.. important::

    **product_id** - обязательное поле.

::

  {
  [
    {
        product_id: "12",
        product_code: "BW/S"
        combination_hash: "822274303",
        combination: {
           3: "12",
           4: "17"
        },
        amount: "50",
        position: "0",
        image_pairs: { skipped }
    },
    {
        combination_hash: "345234623",
        combination: {
           3: "14",
           4: "18"
        },
        ...
        image_pairs: { skipped }
    },
    ...
  }

=============================
GET /api/2.0/combinations/:id
=============================

::

  curl -X GET 'http://example.com/api/2.0/combinations/822274303'
  
::

    {
        product_id: "12",
        product_code: "BW/S"
        combination_hash: "822274303",
        combination: {
           3: "12",
           4: "17"
        },
        amount: "50",
        position: "0",
        image_pairs: { skipped }
    }

===========================
POST /api/2.0/combinations/
===========================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если комбинацию создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created** и код новой комбинации.

Обязательные параметры: **product_id**, массив **combination (option_id => variant_id)**.

::

  curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/combinations' --data-binary 'params...'

::

  params:
    product_id          4
    combination[3]      12
    combination[4]      14
    product_code        BBM/L
    amount              34
    position            10
  {
      combination_hash: "3833095923"
  }

=============================
PUT /api/2.0/combinations/:id
=============================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если комбинацию обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае успешного обновления **HTTP/1.1 200 OK**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/combinations/1241515461' --data-binary 'amount=3&...'

::

  params:
      product_id          4
      amount              2
      product_code        'NEW_CODE'
      ...                 (any field from :?product_options_inventory, except combination. The "combination" field cannot be updated directly)\

      main_pair[icon][image_path]         exim/backup/images/1000156675_f_icon.jpg
      main_pair[icon][alt]                Icon ALT text description
      main_pair[detailed][image_path]     exim/backup/images/1000156675_f_detailed.jpg
      main_pair[detailed][alt]            Detailed image description
  {
     combination_hash: "3833095923"
  }    

================================
DELETE /api/2.0/combinations/:id
================================

В случае, если комбинацию удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request** и текст ошибки.

В случае, если такая комбинация не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/combinations/2512342351'
