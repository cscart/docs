********
Statuses
********

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /statuses
        -   Получить список статусов
    *   -   GET /statuses/:id
        -   Получить данные о статусе
    *   -   POST /statuses/
        -   Создать статус
    *   -   PUT /statuses/:id
        -   Обновить статус
    *   -   DELETE /statuses/:id
        -   Удалить статус

=============
GET /statuses
=============

::

  curl -X GET 'http://example.com/api/2.0/statuses'

::

  [
     {
         "status_id": "1",
         "status": "P",
         "type": "O",
         "is_default": "Y",
         "description": "Processed",
         "email_subj": "has been processed",
         "email_header": "Your order has been processed successfully.",
         "lang_code": "en",
         "params":
         {
             "allow_return": "N",
             "repay": "N",
             "gift_cert_status": "P",
             "notify": "Y",
             "inventory": "D",
             "color": "#97cf4d",
             "remove_cc_info": "Y"
         }
     },
     {
         "status_id": "2",
         "status": "C",
         "type": "O",
         "is_default": "Y",
         "description": "Complete",
         "email_subj": "has been completed",
         "email_header": "Your order has been completed. Thank you for choosing us.",
         "lang_code": "en",
         "params":
         {
             "allow_return": "Y",
             "repay": "N",
             "notify": "Y",
             "gift_cert_status": "A",
             "inventory": "D",
             "color": "#97cf4d",
             "remove_cc_info": "Y"
         }
     },
     ...
  ]

=================
GET /statuses/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/statuses/1'

::

  {
      "status_id": "1",
      "status": "P",
      "type": "O",
      "is_default": "Y",
      "description": "Processed",
      "email_subj": "has been processed",
      "email_header": "Your order has been processed successfully.",
      "lang_code": "en",
      "params":
      {
          "allow_return": "N",
          "repay": "N",
          "gift_cert_status": "P",
          "notify": "Y",
          "inventory": "D",
          "color": "#97cf4d",
          "remove_cc_info": "Y"
      }
  }

===============
POST /statuses/
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если статус создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Обязательные параметры: **description** и если **type** не будет указан, то по умолчанию будет установлен статус для заказа.

Статусы может создавать только администратор с доступом ко всем витринам.

::

  curl --header 'Content-type: text/json' -X POST 'http://example.com/api/2.0/statuses' --data-binary '...'

::
    
      {
         "type": "O",
         "description": "Proc",
         "email_subj": "has been processed",
         "email_header": "Your order has been processed successfully.",
         "lang_code": "en",
         "params":
         {
             "allow_return": "N",
             "repay": "N",
             "gift_cert_status": "P",
             "notify": "Y",
             "inventory": "D",
             "color": "#97cf4d",
             "remove_cc_info": "Y"
         }
      }

::

  {
    "statuses_id": "12"
  }

=================
PUT /statuses/:id
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если статус обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В Ultimate для обновления полей ``email_subj``, ``email_header`` для определенной витрины необходимо выполнять запрос через сущность ``stores/:id``.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/stores/1/statuses/2' --data-binary 'email_subj=test&email_header=header'

Для обновления остальных полей необходимо выполнять запрос без указания витрины и иметь доступ ко всем витринам.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/statuses/2' --data-binary 'description=Test'

::

  {
     "status_id": "2",
  }    

====================
DELETE /statuses/:id
====================

В случае, если статус удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой статус не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/statuses/3'

