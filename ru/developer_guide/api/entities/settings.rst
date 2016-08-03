********
Settings
********

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /settings
        -   Получить список настроек
    *   -   GET /settings/:id
        -   Получить данные об одной настройке
    *   -   PUT /settings/:id
        -   Обновить значение настройки

Создание и удаление настроек через API невозможно.

Чтобы не засорять примеры, в них нет лишних заголовков типа авторизации и формата ввода/вывода.

Вместо *example.com* следует подставить адрес своего магазина.

=============
GET /settings
=============

::

  curl -X GET 'http://example.com/api/2.0/settings?section_id=1'

::

  {
     "settings":{
        "main":{
           "108":{
              "object_id":"108",
              "name":"mailer_send_method",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"S",
              "edition_type":"ROOT",
              "position":"10",
              "is_global":"N",
              "handler":"",
              "description":"Method of sending e-mails",
              "tooltip":"",
              "object_type":"O",
              "value":"mail",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":{
                 "smtp":"via SMTP server",
                 "mail":"via php mail function",
                 "sendmail":"via sendmail program"
              }
           },
           "206":{
              "object_id":"206",
              "name":"header_10003",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"H",
              "edition_type":"ROOT",
              "position":"20",
              "is_global":"N",
              "handler":"",
              "description":"SMTP server settings",
              "tooltip":"",
              "object_type":"O",
              "value":"",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "109":{
              "object_id":"109",
              "name":"mailer_smtp_host",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"I",
              "edition_type":"ROOT",
              "position":"30",
              "is_global":"N",
              "handler":"",
              "description":"SMTP host",
              "tooltip":"",
              "object_type":"O",
              "value":"",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "111":{
              "object_id":"111",
              "name":"mailer_smtp_username",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"I",
              "edition_type":"ROOT",
              "position":"40",
              "is_global":"N",
              "handler":"",
              "description":"SMTP username",
              "tooltip":"",
              "object_type":"O",
              "value":"",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "112":{
              "object_id":"112",
              "name":"mailer_smtp_password",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"I",
              "edition_type":"ROOT",
              "position":"50",
              "is_global":"N",
              "handler":"",
              "description":"SMTP password",
              "tooltip":"",
              "object_type":"O",
              "value":"",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "110":{
              "object_id":"110",
              "name":"mailer_smtp_auth",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"C",
              "edition_type":"ROOT",
              "position":"60",
              "is_global":"N",
              "handler":"",
              "description":"Use SMTP authentication",
              "tooltip":"",
              "object_type":"O",
              "value":"N",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "209":{
              "object_id":"209",
              "name":"header_10004",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"H",
              "edition_type":"ROOT",
              "position":"70",
              "is_global":"N",
              "handler":"",
              "description":"Sendmail settings",
              "tooltip":"",
              "object_type":"O",
              "value":"",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           },
           "113":{
              "object_id":"113",
              "name":"mailer_sendmail_path",
              "section_id":"1",
              "section_tab_id":"0",
              "type":"I",
              "edition_type":"ROOT",
              "position":"80",
              "is_global":"N",
              "handler":"",
              "description":"Path to sendmail program",
              "tooltip":"",
              "object_type":"O",
              "value":"\/usr\/sbin\/sendmail",
              "section_name":"Emails",
              "section_tab_name":"main",
              "variants":[

              ]
           }
        }
     },
     "search":{
        "section_id":"1"
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
    *   -   **company_id**
        -   ``null``	
	-   Идентификатор компании
    *   -   **lang_code** 
        -   ``CART_LANGUAGE``
	-   Язык
    *   -   **section_id**
        -   
	-   Идентификатор секции нстроек 
    *   -   **section_tab_id**	  
        -  
	-   Идентификатор подсекции настроек

=================
GET /settings/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/settings/192'

::

  {
     "settings":{
        "192":{
           "object_id":"192",
           "section_id":"Thumbnails",
           "section_tab_id":"main",
           "name":"category_lists_thumbnail_width",
           "description":"category_lists_thumbnail_width",
           "value":"120"
        }
     },
     "search":{
        "setting_id":"192"
     }
  }

=================
PUT /settings/:id
=================

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если настройку обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/settings/192' --data-binary 'value=20'

::

  {
      "setting_id": "192"
  }

