******
Orders
******

.. contents::
   :backlinks: none
   :local:

.. list-table::
    :header-rows: 1
    :widths: 20 30
    
    *   -   Ресурс 
        -   Описание
    *   -   GET /orders
        -   Получить список заказов
    *   -   GET /orders/:id
        -   Получить данные о заказе
    *   -   POST /orders/
        -   Создать заказ
    *   -   PUT /orders/:id
        -   Обновить заказ
    *   -   DELETE /orders/:id
        -   Удалить заказ

===========
GET /orders
===========

::

  curl -X GET 'http://example.com/api/2.0/orders'

::

  {
      {
         "order_id": "25",
         "issuer_id": null,
         "user_id": "3",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790596",
         "firstname": "Customer",
         "lastname": "Customer",
         "email": "customer@example.com",
         "status": "O",
         "total": "360.99",
         "invoice_id": null,
         "credit_memo_id": null
     },
     {
         "order_id": "22",
         "issuer_id": null,
         "user_id": "7",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790496",
         "firstname": "Joseph",
         "lastname": "Cavazos",
         "email": "JosephCCavazos@example.com",
         "status": "O",
         "total": "307.99",
         "invoice_id": null,
         "credit_memo_id": null
     },
     ...
  }

------------------------
Параметры для фильтрации
------------------------

.. list-table::
    :header-rows: 1
    :widths: 20 30

    *   -   Параметр 
        -   Описание
    *   -   **user_id**
        -   id пользователя
    *   -   **status**
        -   | Один из символьных статусов заказа:
            | ``P`` - Обработан
            | ``C`` - Выполнен
            | ``O`` - Открыт
            | ``F`` - Неудача
            | ``D`` - Отклонен
            | ``B`` - Отложен
            | ``I`` - Аннулирован
            | Обратите внимание, что статусы заказа можно изменять в панели администратора.
    *   -   **company**
        -   Идентификатор витрины (в CS-Cart) или продавца (в Multi-Vendor).
    *   -   **items_per_page**
        -   Количество заказов, возвращаемое в ответе. По умолчанию равно 10. Значение по умолчанию можно изменить в панели администратора.
    *   -   **page**
        -   Номер страницы. По умолчанию равен 1.

::

  curl -X GET 'http://example.com/api/2.0/orders?user_id=3'

::

  {
      {
         "order_id": "25",
         "issuer_id": null,
         "user_id": "3",
         "is_parent_order": "N",
         "parent_order_id": "0",
         "company_id": "1",
         "timestamp": "1328790596",
         "firstname": "Customer",
         "lastname": "Customer",
         "email": "customer@example.com",
         "status": "O",
         "total": "360.99",
         "invoice_id": null,
         "credit_memo_id": null
     }
  }

=================
GET /orders/:id
=================

::

  curl -X GET 'http://example.com/api/2.0/orders/96'

::

  {
    "order_id": "96",
    "is_parent_order": "N",
    "parent_order_id": "0",
    "company_id": "1",
    "issuer_id": null,
    "user_id": "3",
    "total": "972.00",
    "subtotal": 972,
    "discount": "0.00",
    "subtotal_discount": "0.00",
    "payment_surcharge": "0.00",
    "shipping_ids": "",
    "shipping_cost": "0.00",
    "timestamp": "1448517775",
    "status": "P",
    "notes": "",
    "details": "",
    "promotions": [],
    "promotion_ids": "",
    "firstname": "Customer",
    "lastname": "Customer",
    "company": "",
    "b_firstname": "Customer",
    "b_lastname": "Customer",
    "b_address": "44 Main street",
    "b_address_2": "",
    "b_city": "Boston",
    "b_county": "",
    "b_state": "MA",
    "b_country": "US",
    "b_zipcode": "02134",
    "b_phone": "",
    "s_firstname": "Customer",
    "s_lastname": "Customer",
    "s_address": "44 Main street",
    "s_address_2": "",
    "s_city": "Boston",
    "s_county": "",
    "s_state": "MA",
    "s_country": "US",
    "s_zipcode": "02134",
    "s_phone": "",
    "s_address_type": "",
    "phone": "",
    "fax": "",
    "url": "",
    "email": "customer@example.com",
    "payment_id": "2",
    "tax_exempt": "N",
    "lang_code": "en",
    "ip_address": "127.0.0.1",
    "repaid": "0",
    "validation_code": "",
    "localization_id": "0",
    "profile_id": "2",
    "payment_method": {
      "payment_id": "2",
      "company_id": "1",
      "usergroup_ids": "0",
      "position": "20",
      "status": "A",
      "template": "views\/orders\/components\/payments\/phone.tpl",
      "processor_id": "0",
      "processor_params": "",
      "a_surcharge": "0.000",
      "p_surcharge": "0.000",
      "tax_ids": [],
      "localization": "",
      "payment_category": "tab3",
      "payment": "Phone ordering",
      "description": "Call to 5555555",
      "instructions": "<h2>When I should use phone ordering?<\/h2><p>Order by phone is useful when regular payment methods like credit card are unavailable or considered insecure.<\/p><p>Our operators are happy to take your order per phone every business day from 9 a.m. to 5 p.m. UTC.<\/p>",
      "surcharge_title": "",
      "lang_code": "en",
      "processor": null,
      "processor_type": null,
      "processor_status": null,
      "image": []
    },
    "fields": [],
    "products": {
      "1061624811": {
        "item_id": "1061624811",
        "order_id": "96",
        "product_id": "214",
        "product_code": "K02149B2ZX",
        "price": "972.00",
        "amount": "1",
         "extra": {
          "product_options": [],
          "unlimited_download": "N",
          "product": "ASUS CP6130",
          "company_id": "1",
          "is_edp": "N",
          "edp_shipping": "N",
          "discount": 0,
          "base_price": 972,
          "stored_price": "N"
        },
        "product": "ASUS CP6130",
        "product_status": "A",
        "deleted_product": false,
        "discount": 0,
        "company_id": "1",
        "base_price": 972,
        "original_price": 972,
        "cart_id": "1061624811",
        "tax_value": 0,
        "subtotal": 972,
        "display_subtotal": 972,
        "shipped_amount": 0,
        "shipment_amount": "1",
        "is_accessible": true,
        "shared_product": true
      }
    },
    "taxes": {
      "6": {
        "rate_type": "P",
        "rate_value": "10.000",
        "price_includes_tax": "Y",
        "regnumber": "1234242",
        "priority": 0,
        "tax_subtotal": 88.36,
        "description": "VAT",
        "applies": {
          "P": 88.36,
          "S": 0,
          "items": {
            "S": [],
            "P": {
              "1061624811": true
            }
          }
        }
      }
    },
    "tax_subtotal": 0,
    "display_shipping_cost": "0.00",
    "is_root": "",
    "birthday": "",
    "purchase_timestamp_from": "",
    "purchase_timestamp_to": "",
    "responsible_email": "",
    "last_passwords": "",
    "password_change_timestamp": "",
    "api_key": "",
    "b_country_descr": "United States",
    "s_country_descr": "United States",
    "b_state_descr": "Massachusetts",
    "s_state_descr": "Massachusetts",
    "need_shipping": true,
    "shipping": [
      {
        "shipping_id": "1",
        "shipping": "Custom shipping method",
        "delivery_time": "3-5 days",
        "rate_calculation": "M",
        "service_params": [],
        "destination": "I",
        "min_weight": "0.00",
        "max_weight": "0.00",
        "service_id": "0",
        "module": null,
        "service_code": null,
        "rate_info": {
          "rate_id": "55",
          "rate_value": {
            "C": {
              "0": {
                "amount": "0",
                "value": 40,
                "type": "F",
                "per_unit": "N"
              },
              "30": {
                "amount": "30",
                "value": 10,
                "type": "F",
                "per_unit": "N"
              },
              "50": {
                "amount": "50",
                "value": 5,
                "type": "F",
                "per_unit": "N"
              }
            },
            "I": {
              "0": {
                "amount": "0",
                "value": 23,
                "type": "F",
                "per_unit": "N"
              },
              "10": {
                "amount": "10",
                "value": 15,
                "type": "F",
                "per_unit": "N"
              }
            }
          }
        },
        "group_key": 0,
        "rate": 28,
        "group_name": "Simtech",
        "need_shipment": true
      }
    ],
    "shipment_ids": [],
    "secondary_currency": "USD",
    "display_subtotal": 972,
    "payment_info": [],
    "product_groups": [
      {
        "name": "Simtech",
        "company_id": 1,
        "products": {
          "1061624811": {
            "product_id": 214,
            "product_code": "K02149B2ZX",
            "product": "ASUS CP6130",
            "amount": 1,
            "product_options": [],
            "price": 972,
            "stored_price": "Y",
            "main_pair": {
              "pair_id": "709",
              "image_id": "0",
              "detailed_id": "765",
              "position": "0",
              "detailed": {
                "image_path": "http:\/\/localhost\/git\/work\/images\/detailed\/0\/P_50013287768924f3386bc5fe80.jpg",
                "alt": "",
                "image_x": "500",
                "image_y": "500",
                "http_image_path": "http:\/\/localhost\/git\/work\/images\/detailed\/0\/P_50013287768924f3386bc5fe80.jpg",
                "absolute_path": "\/Users\/alexions\/www\/git\/work\/images\/detailed\/0\/P_50013287768924f3386bc5fe80.jpg",
                "relative_path": "detailed\/0\/P_50013287768924f3386bc5fe80.jpg"
              }
            },
            "original_amount": "1",
            "original_product_data": {
              "cart_id": "1061624811",
              "amount": "1"
            },
            "extra": {
              "product_options": [],
              "unlimited_download": "N",
              "product": "ASUS CP6130",
              "company_id": "1",
              "is_edp": "N",
              "edp_shipping": "N",
              "discount": 0,
              "base_price": 972,
              "stored_price": "N"
            },
            "stored_discount": "N",
            "discount": 0,
            "company_id": "1",
            "amount_total": 1,
            "options_type": "P",
            "exceptions_type": "F",
            "modifiers_price": 0,
            "is_edp": "N",
            "edp_shipping": "N",
            "promotions": [],
            "base_price": 972,
            "display_price": 972
          }
        },
        "package_info": {
          "C": 972,
          "W": "0.01",
          "I": 1,
          "shipping_freight": 0,
          "packages": [
            {
              "products": {
                "1061624811": 1
              },
              "amount": 1,
              "weight": 0.1,
              "cost": 972
            }
          ],
          "origination": {
            "name": "Simtech",
            "address": "44 Main street",
            "city": "Boston",
            "country": "US",
            "state": "MA",
            "zipcode": "02116",
            "phone": "6175556985",
            "fax": ""
          },
          "location": {
            "firstname": "Customer",
            "lastname": "Customer",
            "address": "44 Main street",
            "address_2": null,
            "city": "Boston",
            "county": null,
            "state": "MA",
            "country": "US",
            "zipcode": "02134",
            "phone": "6175556985",
            "address_type": "residential",
            "country_descr": "United States",
            "state_descr": "Massachusetts"
          }
        },
        "all_edp_free_shipping": false,
        "all_free_shipping": false,
        "free_shipping": false,
        "shipping_no_required": false,
        "shippings": {
          "1": {
            "shipping_id": "1",
            "shipping": "Custom shipping method",
            "delivery_time": "3-5 days",
            "rate_calculation": "M",
            "service_params": [],
            "destination": "I",
            "min_weight": "0.00",
            "max_weight": "0.00",
            "service_id": "0",
            "module": null,
            "service_code": null,
            "rate_info": {
              "rate_id": "1",
              "rate_value": {
                "C": {
                  "0": {
                    "value": 40,
                    "type": "F"
                  },
                  "30": {
                    "value": 10,
                    "type": "F"
                  },
                  "50": {
                    "value": 5,
                    "type": "F"
                  }
                },
                "I": {
                  "0": {
                    "value": 23,
                    "type": "F"
                  },
                  "10": {
                    "value": 15,
                    "type": "F"
                  }
                }
              }
            },
            "group_key": 0,
            "rate": 28,
            "taxed_price": 0,
            "taxes": {
              "6": {
                "rate_type": "P",
                "rate_value": "10",
                "price_includes_tax": "Y",
                "regnumber": "1234242",
                "priority": 0,
                "tax_subtotal": 2.549,
                "description": "VAT"
              }
            }
          },
          "3": {
            "shipping_id": "3",
            "shipping": "FedEx Home Delivery",
            "delivery_time": "2 days",
            "rate_calculation": "R",
            "service_params": {
              "user_key": "JAHR7R8oMgMFRH55",
              "user_key_password": "YxIJQaZt7Qx3Qt904ibYPhuDa",
              "account_number": "510087089",
              "meter_number": "118530569",
              "test_mode": "Y",
              "package_type": "YOUR_PACKAGING",
              "drop_off_type": "REGULAR_PICKUP",
              "max_weight_of_box": "70",
              "height": "10",
              "width": "10",
              "length": "10"
            },
            "destination": "I",
            "min_weight": "0.00",
            "max_weight": "0.00",
            "service_id": "216",
            "module": "fedex",
            "service_code": "GROUND_HOME_DELIVERY",
            "rate_info": [],
            "group_key": 0,
            "rate": 9.74,
            "taxed_price": 0,
            "taxes": {
              "6": {
                "rate_type": "P",
                "rate_value": "10",
                "price_includes_tax": "Y",
                "regnumber": "1234242",
                "priority": 0,
                "tax_subtotal": 0.89,
                "description": "VAT"
              }
            }
          }
        },
        "chosen_shippings": [
          {
            "shipping_id": "1",
            "shipping": "Custom shipping method",
            "delivery_time": "3-5 days",
            "rate_calculation": "M",
            "service_params": [],
            "destination": "I",
            "min_weight": "0.00",
            "max_weight": "0.00",
            "service_id": "0",
            "module": null,
            "service_code": null,
            "rate_info": {
              "rate_id": "1",
              "rate_value": {
                "C": {
                  "0": {
                    "value": 40,
                    "type": "F"
                  },
                  "30": {
                    "value": 10,
                    "type": "F"
                  },
                  "50": {
                    "value": 5,
                    "type": "F"
                  }
                },
                "I": {
                  "0": {
                    "value": 23,
                    "type": "F"
                  },
                  "10": {
                    "value": 15,
                    "type": "F"
                  }
                }
              }
            },
            "group_key": 0,
            "rate": 28,
            "group_name": "Simtech"
          }
        ]
      }
    ],
    "doc_ids": []
  }

=============
POST /orders/
=============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если заказ создать не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

В случае успеха будет возвращён статус **HTTP/1.1 201 Created**.

Если при создании заказа продукты будут разбиты по поставщикам, и в нем не будет доступен указаный метод доставки, то будет возвращен статус **HTTP/1.1 400 Bad Request**.

.. note::

    Заказ через API создается без проведения оплаты.

Параметры (обязательные отмечены *****):

* **user_id*** — идентификатор пользователя. Если заказ оформляется от имени гостя, нужно передавать ``"user_id": "0"`` и параметр **user_data**.
   
* **payment_id*** — идентификатор платежной системы. Платежная система должна быть доступна в магазине.

* **shipping_id*** — идентификатор службы доставки. Служба доставки должна быть доступна в магазине и настроена соответствующим образом для расчета стоимости доставки на передаваемый адрес. 

  В качестве значения может быть указан массив идентификаторов служб доставки, ключами которого должны быть ключи групп товаров в корзине. Это может быть необходимо при создании заказа с разными продавцами (в Multi-Vendor), либо создании/обновлении заказа с разными поставщиками (модуль "Поставщики"), либо в любом другом случае, когда товары в корзине разбиваются на более чем одну группу товаров.

* **products*** — ассоциативный массив товаров, ключами которого являются идентификаторы товаров, а значения параметрами товара в заказе::

    "products": {
        "241":{
            "amount":"1",
            "product_options":{
               "12":"44", 
               "13":"48" 
            }         
        }
    }

  * **amount*** — количество товара.

  * **product_options** — ассоциативный массив описывающий комбинацию опций товара. В ключах — идентификатор опции, в значении — идентификатор варианта.

* **user_data** — ассоциативный массив с описание данных покупателя. Обязателен, если ``"user_id": "0"``. Параметр не будет учитываться, если в запросе есть **user_id**, не равный нулю::

    "user_data": {
      "email": "email@example.com",
      "b_firstname":"John",
      "b_lastname":"Doe",
      "b_address":"44 Main street",
      "b_city":"Boston",
      "b_state":"MA",
      "b_country":"US",
      "b_zipcode":"02134",
      "b_phone":"",
      "s_firstname":"John",
      "s_lastname":"Doe",
      "s_address":"44 Main street",
      "s_city":"Boston",
      "s_state":"MA",
      "s_country":"US",
      "s_zipcode":"02134",
      "s_phone":""
    }

  * **email*** — электронный адрес покупателя.

  * **b_firstname*** — имя плательщика.

  * **b_lastname*** — фамилия плательщика.

  * **b_address*** — адрес плательщика.

  * **b_city*** — город плательщика.

  * **b_state*** — 2х-символьный код региона плательщика. Список доступных значений можно увидеть в панели администратора в разделе **Администрирование → Доставка и налоги → Штаты**.

  * **b_country*** — 2х-символьный код страны плательщика. Список доступных значений можно увидеть в панели администратора в разделе **Администрирование → Доставка и налоги → Страны**.

  * **b_zipcode*** — почтовый индекс плательщика.

  * **b_phone** — номер телефона плательщика.

  * **s_firstname*** — имя получателя.

  * **s_lastname*** — фамилия получателя.

  * **s_address*** — адрес получателя.

  * **s_city*** — город получателя.

  * **s_state*** — 2х-символьный код региона плательщика. Список доступных значений можно увидеть в панели администратора в разделе **Администрирование → Доставка и налоги → Регионы**.

  * **s_country*** — 2х-символьный код страны плательщика. Список доступных значений можно увидеть в панели администратора в разделе **Администрирование → Доставка и налоги → Регионы**.

  * **s_zipcode*** — почтовый индекс получателя.

  * **s_phone** — номер телефона получателя.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/orders' --data-binary '{...}'

Для версии Ultimate, если запрос выполняет root-администратор, заказ необходимо создавать через сущность :doc:`Stores <stores>`.

::

  curl --header 'Content-type: application/json' -X POST 'http://example.com/api/2.0/stores/1/orders' --data-binary '{...}'

::

  {
      "user_id":"3",
      "payment_id":"2",
      "shipping_id":"1",
      "products" : {
           "148": {
               "amount":"1"
           }
      }
  }

::

  {
    "order_id": "26"
  }

===============
PUT /orders/:id
===============

Данные должны приходить в теле HTTP запроса в соответствии с переданным ``Content-type``.

В случае, если заказ обновить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**.

Можно передавать все те же параметры, что и в POST-запросе, но ни один из них не является обязательным. Но поддерживаются и другие параметры:

* **status** — новый статус заказа.
* **notify_user** — флаг, сообщающий о необходимости послать письмо клиенту в случае смены статуса заказа.
* **notify_department** — флаг, сообщающий о необходимости послать письмо в отдел обработки заказов в случае смены статуса заказа.

* **notify_vendor** — флаг, сообщающий о необходимости послать письмо продавцу в случае смены статуса заказа (работает в Multi-Vendor).

::

  curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/orders/2' --data-binary 'payment_id=2'

::

  {
     "order_id": "25",
  }    

==================
DELETE /orders/:id
==================

В случае, если заказ удалить не удалось, будет возвращен статус **HTTP/1.1 400 Bad Request**. 

В случае, если такой заказ не существует, будет возвращен статус **HTTP/1.1 404 Not Found**.

В случае успеха будет возвращён статус **HTTP/1.1 204 No Content**.

::

  curl -X DELETE 'http://example.com/api/2.0/orders/25'
