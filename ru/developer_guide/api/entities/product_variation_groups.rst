******************************************
Группы вариаций: product_variations_groups
******************************************

Допустим, в магазине есть определённая футболка, доступная в 3 цветах и 15 размерах. Это означает, что у нас есть 15 похожих товаров. Мы хотим сделать на витрине переключатель цвета и размера.

Для этого такие похожие товары нужно объединить в группу вариаций; в этом случае товар будет считаться :doc:`вариацией </user_guide/manage_products/products/product_variations>`. Каждый товар может одновременно относиться только к одной группе вариаций, но заменить группу у товара легко. Если вариацию отцепить от группы вариаций, она станет обычным товаром.

.. contents::
   :backlinks: none
   :local:
 
    
URL
===

* http://example.com/api/**product_variations_groups** — обращается ко всем группам вариаций. 
  
  Поддерживает только  ``GET`` и ``POST``.

* http://example.com/api/**product_variations_groups/:id** — обращается только к одной группе вариаций. 
  
  Поддерживает ``GET``, ``PUT`` и ``DELETE``.
  
  .. important::
  
      Метод ``DELETE`` удаляет только группу вариаций, т.е. распускает её. Сами вариации из этой группы не удаляются, а становятся обычными товарами.
 
* http://example.com/api/**product_variations_groups/:code** — обращается только к одной группе вариаций. 
  
  Поддерживает ``GET``, ``PUT`` и ``DELETE``.


Вложенные объекты
=================

* :doc:`Вариации: product variations </developer_guide/api/entities/product_variations>`


Постраничная навигация
======================

.. list-table::
    :header-rows: 1
    :widths: 4 10

    *   -   Параметр 
        -   Описание
    *   -   ``page``
        -   Отображает группы вариаций на странице с определенным номером
    *   -   ``items_per_page``
        -   Отображает N групп вариаций, где N — число, указанное в параметре


Фильтрация
==========

.. list-table::
    :header-rows: 1
    :widths: 3 10

    *   -   Параметр 
        -   Описание
    *   -   ``product_ids``
        -   Фильтр по идентификаторам товаров. Если указан, то в результате запроса будут группы вариаций, в которых есть хотя бы один из перечисленных товаров.
    *   -   ``feature_ids``
        -   Фильтр по характеристикам товара. Если указан, то в результате запроса будут группы вариаций, в которых используется хотя бы одна из перечисленных характеристик товара.
  
        
Поля
====

* ``id`` — идентификатор группы вариаций;

* ``code`` — код группы вариаций;

* ``features`` — список характеристик товаров, на основе которых была создана группа вариаций;

  * ``feature_id`` — идентификатор характеристики товара;

  * ``purpose`` — цель характеристики товара;

    * ``group_catalog_item`` — вариации как отдельные товары;
  
    * ``group_variation_catalog_item`` — вариации как один товар;
    
  * ``is_purpose_create_catalog_item`` — флаг; если принимает значение true, то целью характеристики является: *Вариации как отдельные товары*;
  
  * ``is_purpose_create_variation_of_catalog_item`` — флаг; если принимает значение true, то целью характеристики является: *Вариации как один товар*;
  
* ``products`` — список товаров в группе вариаций;

  * ``product_id``  — идентификатор товара;

  * ``parent_product_id`` — идентификатор родительского товара;

  * ``company_id`` — идентификатор продавца/витрины, которой принадлежит товар;

  * ``feature_values`` — список значений характеристик товара;

    * ``feature_id`` — идентификатор характеристики товара;

    * ``variant_id`` — идентификатор варианта характеристики товара;

* ``created_at`` — временная метка создания группы вариаций;

* ``updated_at`` — временная метка последнего обновления группы вариаций.


Формат ответа
=============

#. Ответ на запрос списка групп вариаций::

       {
	      "groups":[
	         {
	            "id":10,
	            "code":"PV-27186628F",
	            "features":[
	               {
	                  "feature_id":548,
	                  "purpose":"group_variation_catalog_item",
	                  "is_purpose_create_catalog_item":false,
	                  "is_purpose_create_variation_of_catalog_item":true
	               },
	               {
	                  "feature_id":549,
	                  "purpose":"group_catalog_item",
	                  "is_purpose_create_catalog_item":true,
	                  "is_purpose_create_variation_of_catalog_item":false
	               }
	            ],
	            "products":[
	               {
	                  "product_id":278,
	                  "parent_product_id":0,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1195"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1201"
	                     }
	                  ]
	               },
	               {
	                  "product_id":279,
	                  "parent_product_id":278,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1194"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1201"
	                     }
	                  ]
	               },
	               {
	                  "product_id":280,
	                  "parent_product_id":0,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1195"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1200"
	                     }
	                  ]
	               },
	               {
	                  "product_id":281,
	                  "parent_product_id":280,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1194"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1200"
	                     }
	                  ]
	               },
	               {
	                  "product_id":282,
	                  "parent_product_id":0,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1195"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1199"
	                     }
	                  ]
	               },
	               {
	                  "product_id":284,
	                  "parent_product_id":282,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1193"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1199"
	                     }
	                  ]
	               },
	               {
	                  "product_id":283,
	                  "parent_product_id":282,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1194"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1199"
	                     }
	                  ]
	               }
	            ],
	            "created_at":1545294915,
	            "updated_at":1545294915
	         },
	         {
	            "id":11,
	            "code":"MY_GROUP_1",
	            "features":[
	               {
	                  "feature_id":549,
	                  "purpose":"group_catalog_item",
	                  "is_purpose_create_catalog_item":true,
	                  "is_purpose_create_variation_of_catalog_item":false
	               },
	               {
	                  "feature_id":548,
	                  "purpose":"group_variation_catalog_item",
	                  "is_purpose_create_catalog_item":false,
	                  "is_purpose_create_variation_of_catalog_item":true
	               }
	            ],
	            "products":[
	               {
	                  "product_id":286,
	                  "parent_product_id":0,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1193"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1198"
	                     }
	                  ]
	               },
	               {
	                  "product_id":287,
	                  "parent_product_id":0,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1193"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1199"
	                     }
	                  ]
	               },
	               {
	                  "product_id":288,
	                  "parent_product_id":287,
	                  "company_id":1,
	                  "feature_values":[
	                     {
	                        "feature_id":548,
	                        "variant_id":"1194"
	                     },
	                     {
	                        "feature_id":549,
	                        "variant_id":"1199"
	                     }
	                  ]
	               }
	            ],
	            "created_at":1585052457,
	            "updated_at":1585052457
	         }
	      ],
	      "params":{
	         "items_per_page":10,
	         "page":1,
	         "total_items":2
	      }
       
       }
	    
	
#. Ответ на запрос группы вариаций по идентификатору либо коду группы вариаций::
	   
	   {
	      "id":11,
	      "code":"MY_GROUP_1",
	      "features":[
	         {
	            "feature_id":549,
	            "purpose":"group_catalog_item",
	            "is_purpose_create_catalog_item":true,
	            "is_purpose_create_variation_of_catalog_item":false
	         },
	         {
	            "feature_id":548,
	            "purpose":"group_variation_catalog_item",
	            "is_purpose_create_catalog_item":false,
	            "is_purpose_create_variation_of_catalog_item":true
	         }
	      ],
	      "products":[
	         {
	            "product_id":286,
	            "parent_product_id":0,
	            "company_id":1,
	            "feature_values":[
	               {
	                  "feature_id":548,
	                  "variant_id":"1193"
	               },
	               {
	                  "feature_id":549,
	                  "variant_id":"1198"
	               }
	            ]
	         },
	         {
	            "product_id":287,
	            "parent_product_id":0,
	            "company_id":1,
	            "feature_values":[
	               {
	                  "feature_id":548,
	                  "variant_id":"1193"
	               },
	               {
	                  "feature_id":549,
	                  "variant_id":"1199"
	               }
	            ]
	         },
	         {
	            "product_id":288,
	            "parent_product_id":287,
	            "company_id":1,
	            "feature_values":[
	               {
	                  "feature_id":548,
	                  "variant_id":"1194"
	               },
	               {
	                  "feature_id":549,
	                  "variant_id":"1199"
	               }
		            ]
 	        }
	      ],
	      "created_at":1585052457,
	      "updated_at":1585052457
	   }


Примеры
=======


Создание группы вариаций
++++++++++++++++++++++++

::

	curl -X POST "http://example.com/api/product_variations_groups" \
	-H "Content-Type: application/json" \
	-H "Authorization: Basic ******" \
	-d '{"product_ids":[286,287,288],"code":"MY_GROUP_1"}'

	   
Получение списка групп вариаций
+++++++++++++++++++++++++++++++

::

	curl -X GET "http://example.com/api/product_variations_groups" \
	-H "Content-Type: application/json" \
	-H "Authorization: Basic ******"
 
 	   
Получение группы вариаций
+++++++++++++++++++++++++

* Пример 1::
  
	  curl -X GET "http://example.com/api/product_variations_groups/:id" \
	  -H "Content-Type: application/json" \
	  -H "Authorization: Basic ******"
        
  Где ``:id`` — идентификатор группы вариаций.
    
* Пример 2::
  
	  curl -X GET "http://example.com/api/product_variations_groups/:code" \
	  -H "Content-Type: application/json" \
	  -H "Authorization: Basic ******"
        
  Где ``:code`` — символьный идентификатор группы вариаций.


Обновление символьного кода группы вариаций
+++++++++++++++++++++++++++++++++++++++++++

::

	curl -X PUT "http://example.com/api/product_variations_groups/:code" \
	-H "Content-Type: application/json" \
	-H "Authorization: Basic ******" \
	-d '{"code":"MY_GROUP_NEW"}'

Где ``:code`` — символьный идентификатор группы вариаций.
  
  
Удаление группы вариаций
++++++++++++++++++++++++

::

	curl -X DELETE "http://example.com/api/product_variations_groups/:code" \
	-H "Content-Type: application/json" \
	-H "Authorization: Basic ******" \
	-d '{}'

Где ``:code`` — символьный идентификатор группы вариаций.




