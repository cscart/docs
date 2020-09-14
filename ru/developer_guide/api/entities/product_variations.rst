****************************
Вариации: product_variations
****************************

:doc:`Вариации </user_guide/manage_products/products/product_variations>` — это похожие товары, которые отличаются друг от друга одной или несколькими характеристиками. Например, у одной футболки может быть 3 цвета, и каждый цвет доступен в 5 размерах. В этом случае у нас 15 товаров. Если объединить эти товары в группу вариаций, то на витрине на странице каждого из них появится переключатель цвета и размера.

Каждый товар может одновременно относиться только к одной группе вариаций. Но заменить группу у товара легко. Если вариацию отцепить от группы вариаций, она станет обычным товаром.

.. contents::
   :backlinks: none
   :local:

URL
===

* http://example.com/api/**product_variations** — обращается ко всем вариациям. 

  Поддерживает только  ``GET`` и ``POST``.

* http://example.com/api/**product_variations/:id** — обращается к конкретной вариации. 

  Поддерживает ``GET``, ``PUT`` и ``DELETE``. 

* http://example.com/api/**product_variations_groups/:id/product_variations** — обращается ко всем вариациям из конкретной группы вариаций.

* http://example.com/api/**product_variations_groups/:id/product_variations/:id** — обращается к конкретной вариации из конкретной группы вариаций.

* http://example.com/api/**product_variations_groups/:code/product_variations** — обращается ко всем вариациям из конкретной группы вариаций.

* http://example.com/api/**product_variations_groups/:code/product_variations/:id** — обращается к конкретной вариации из конкретной группы вариаций.

Вложенные объекты
=================

* :ref:`DetachProductVariation <detach_product_variation>`

* :ref:`SetDefaultProductVariation <Set_Default_Product_Variation>`

* :ref:`GenerateProductVariations <Generate_Product_Variations>`

Постраничная навигация и сортировка
===================================

Параметры сортировки и постраничной навигации полностью наследуются от :doc:`API товаров </developer_guide/api/entities/products>`.

Фильтры
=======

Параметры фильтрации полностью наследуются от :doc:`API товаров </developer_guide/api/entities/products>`. Модуль :doc:`Вариации товаров </user_guide/addons/product_variations/index>` добавляет следующие новые параметры фильтрации, доступные как через API товаров, так и через API вариаций:

* ``product_type`` *(enum[P|V])* — фильтр по типу товара, позволяет получить только дефолтные вариации или только дочерние вариации *(product_type=V)*.

* ``variation_group_id`` *(int)* — фильтр по группе вариаций, позволяет получить все вариации из группы.

* ``variations_by_product_id`` *(int)* — фильтр для получения вариаций по идентификатору товара.

* ``parent_product_id`` *(int)* — фильтр для получения дочерних вариаций.

* ``include_child_variations`` *(enum[0|1])* — фильтр для включения в выборку дочерних вариаций. По умолчанию для витрины дочерние вариации не включаются в выборку.

* ``group_child_variations`` *(enum[0|1])* — фильтр для группировки дочерних вариаций. По умолчанию для витрины дочерние вариации группируются, а для панели администратора — нет.

Дополнительные параметры
========================

Дополнительные параметры для выборки товаров полностью наследуются от :doc:`API товаров </developer_guide/api/entities/products>`. Модуль :doc:`Вариации товаров </user_guide/addons/product_variations/index>` добавляет следующие новые параметры выборки, доступные как через API товаров, так и через API вариаций:

* ``get_variation_features_variants`` *(enum[0|1])* — флаг расширения данных о товаре. Если параметр указан, то для каждой вариации будет определен массив ``variation_features_variants``, указывающий на возможные варианты характеристик вариации. В ядре эти данные используются для отображения переключателя между вариациями.

* ``get_variation_info`` *(enum[0|1])* — флаг расширения данных о товаре. Если параметр указан, то для каждой вариации будут определены следующие данные:

  * ``variation_feature_ids`` — идентификаторы характеристик, на основе которых была создана группа вариаций текущего товара;

  * ``variation_feature_collection`` — коллекция характеристик с целями этих характеристик, на основе которых была создана группа вариаций текущего товара;

  * ``variation_group_id`` — идентификатор группы вариаций;

  * ``variation_group_code`` — символьный код группы вариаций;

  * ``variation_parent_product_id`` — идентификатор родительского товара;

  * ``variation_sub_group_id`` — символьный идентификатор подгруппы;

  * ``variation_features`` — значения вариационных характеристик текущего товара.

* ``get_variation_name`` *(enum[0|1])* — флаг расширения данных о товаре. Если параметр указан, то для каждой вариации будут определено название товара с лейблом в свойстве ``variation_name``. Пример значения: *T-shirt, Color: Blue (Medium)*.

Поля
====

Поля товаров полностью наследуются от :doc:`API товаров </developer_guide/api/entities/products>`. Модуль :doc:`Вариации товаров </user_guide/addons/product_variations/index>` добавляет следующие новые поля, доступные как через API товаров, так и через API вариаций:

* ``variation_group_id`` — идентификатор группы вариаций;

* ``variation_group_code`` — символьный код группы вариаций;

* ``variation_parent_product_id`` — идентификатор родительского товара;

* ``variation_sub_group_id`` — символьный идентификатор подгруппы;

* ``variation_features`` — значения вариационных характеристик текущего товара;

* ``variation_feature_ids`` — идентификаторы характеристик, на основе которых была создана группа вариаций текущего товара;

* ``variation_feature_collection`` — коллекция характеристик с целями этих характеристик, на основе которых была создана группа вариаций текущего товара.

Создание/обновление товаров
===========================

Логика создания обновления товаров в группе вариаций полностью наследуется от :doc:`API товаров </developer_guide/api/entities/products>`. Модуль :doc:`Вариации товаров </user_guide/addons/product_variations/index>` учитывает следующие поля при создании/обновлении:

* ``variation_feature_values`` — cписок значения характеристик вариационного товара в формате ``feature_id: variant_id``. Позволяет менять значение характеристик, на основе которых была создана группа вариаций.

* ``variation_group_id`` — идентификатор группы вариаций, позволяет добавлять или перемещать товар в группу вариаций.

Примеры
=======

* Получение списка товаров по группе вариаций:

  * Пример 1::

    	curl -X GET "http://example.com/api/product_variations?variation_group_id=:id" \
     	-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Где ``:id`` — идентификатор группы вариаций.

  * Пример 2::

		curl -X GET "http://example.com/api/product_variations_groups/:id/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Где ``:id`` — идентификатор группы вариаций.

  * Пример 3::

		curl -X GET "http://example.com/api/product_variations_groups/:code/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Где ``:code`` — символьный код группы вариаций.

  * Пример 4::

		curl -X GET "http://example.com/api/products?variation_group_id=:id" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Где ``:id`` — идентификатор группы вариаций.

* Получение только вариаций:

  * Пример 1::

		curl -X GET "http://example.com/api/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

  * Пример 2::

		curl -X GET "http://example.com/api/products?has_variation_group=1" \
		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

* Добавление товара в группу вариаций::

      curl -X PUT "http://example.com/api/product_variations/:id" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******" \
      -d '{"variation_group_id":11}'

  Где ``:id`` — идентификатор товара.
  
* Создание товара и добавление созданного товара в группу вариаций::

      curl -X POST "http://example.com/api/product_variations_groups/:code/product_variations" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******" \
      -d '{"product":"Штаны","price":150,"product_features":{"549":1199,"548":1195},"category_ids":[224]}'

  Где ``:code`` — символьный код группы вариаций.

.. _detach_product_variation:

DetachProductVariation
======================

API-сущность для удаления вариации из группы вариаций.

URL
+++

http://example.com/api/**product_variations/:id/detach_product_variation** — поддерживает только ``POST``-запросы.

Пример запроса
++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/:id/detach_product_variation" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ******" \
       -d '{}'
 
Где ``:id`` — идентификатор товара, который должен быть удален группы вариаций.

Результат ответа
++++++++++++++++

В случае успешного выполнения операции возвращается статус **201 HTTP**.

.. _Set_Default_Product_Variation:

SetDefaultProductVariation
==========================

API-сущность для установки вариации как вариации по умолчанию.

URL
+++

http://example.com/api/**product_variations/:id/set_default_product_variation** — поддерживает только ``POST``-запросы.

Пример запроса
++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/292/set_default_product_variation" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ******" \
       -d '{}'
 
Где ``:id`` — идентификатор нового товара по умолчанию в группе вариаций.

Результат ответа
++++++++++++++++

В случае успешного выполнения операции возвращается статус **201 HTTP**.

.. _Generate_Product_Variations:

GenerateProductVariations
=========================

API-сущность для генерации вариаций на основе комбинаций вариантов характеристик товара.

URL
+++

http://example.com/api/**product_variations/:id/generate_product_variations** — поддерживает только ``POST``-запросы.

Пример запроса
++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/:id/generate_product_variations" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ****" \
       -d '{"combinations":[{"548":1193,"549":1200},{"548":1197,"549":1199}]}'

Где:

* ``:id`` — идентификатор товара, на основе которого будут созданы вариации;

* ``combinations`` — список комбинаций вариантов характеристик товара в формате ``feature_id: variant_id``

Результат ответа
++++++++++++++++

::

	{
	   "group":{
	      "id":13,
	      "code":"PV-93ECD34F4",
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
	            "product_id":295,
	            "parent_product_id":0,
	            "company_id":1,
 	           "feature_values":[
	               {
	                  "feature_id":549,
	                  "variant_id":"1199"
	               },
	               {
	                  "feature_id":548,
	                  "variant_id":"1194"
	               }
	            ]
	         },
	         {
	            "product_id":296,
	            "parent_product_id":0,
	            "company_id":1,
	            "feature_values":[
	               {
 	                 "feature_id":549,
	                  "variant_id":"1200"
	               },
	               {
	                  "feature_id":548,
	                  "variant_id":"1193"
	               }
	            ]
	         },
	         {
	            "product_id":297,
	            "parent_product_id":295,
	            "company_id":1,
	            "feature_values":[
	               {
	                  "feature_id":549,
	                  "variant_id":"1199"
	               },
	               {
	                  "feature_id":548,
	                  "variant_id":"1197"
	               }
	            ]
	         }
	      ],
	      "created_at":1585055941,
	      "updated_at":1585055941
	   },
	   "products_status":{
	      "295":1,
	      "296":1,
	      "297":1
	   }
	}

Где:

* ``group`` — объект, описывающий группу вариаций. Подробное описание структуры группы вариаций можно увидеть в :doc:`этой статье </developer_guide/api/entities/product_variation_groups>`.

* ``products_status`` — статусы результата добавления товара в группу вариаций в формате ``product_id: result``. Результат может принимать следующие значения:

  * *0* — нет изменений;

  * *1* — товар добавлен в группу вариаций;

  * *2* — товар обновлен в группе вариаций;

  * *253* — продавец или витрина, которой принадлежит товар, не соответствуют другим товарам в группе вариаций;

  * *254* — комбинация вариантов характеристик товара уже есть в группе вариаций;

  * *255* — товар не имеет подходящий значений характеристик для группы вариаций;

  * *200* — неизвестная ошибка.


