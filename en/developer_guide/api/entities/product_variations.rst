******************
Product Variations
******************

:doc:`Variations </user_guide/manage_products/products/product_variations>` are similar products that differ from each other only in one or a few features. For example, a T-shirt comes in 3 colors, and each color has 5 sizes. That means 15 products. If we put these products into a variation group, we will have the ability to switch between their colors and sizes on the storefront.

A product can belong only to one group at the same time, but it’s easy to change the product’s group. If a variation is removed from the group, it becomes a standard product. 

.. contents::
   :backlinks: none
   :local:


URLs
====

* http://example.com/api/**product_variations**—refer to all product variations. 

  Only ``GET`` and ``POST`` are supported.

* http://example.com/api/**product_variations/:id**—refer to a particular product variation. 

  ``GET``, ``PUT``, and ``DELETE`` are supported.

* http://example.com/api/**product_variations_groups/:id/product_variations**—refer to all product variations of a particular product variation group.

* http://example.com/api/**product_variations_groups/:id/product_variations/:id**—refer to a particular product variation of a particular product variation group.

* http://example.com/api/**product_variations_groups/:code/product_variations**—refer to all product variations of a particular product variation group.

* http://example.com/api/**product_variations_groups/:code/product_variations/:id**—refer to a particular product variation of a particular product variation group.


Nested Objects
==============

* :ref:`DetachProductVariation <detach_product_variation>`

* :ref:`SetDefaultProductVariation <Set_Default_Product_Variation>`

* :ref:`GenerateProductVariations <Generate_Product_Variations>`


Pagination and Sorting
======================

Sorting and pagination parameters are inherited from :doc:`Products </developer_guide/api/entities/products>`.


Filters
=======

Filtering parameters are inherited from :doc:`Products </developer_guide/api/entities/products>`. The :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on adds the following filtering parameters, available via Products API or Product Variations API:

* ``product_type`` *(enum[P|V])*—filter by product type. Allows you to get only default variations or child variations (product_type=V).

* ``variation_group_id`` *(int)*—filter by variation group. Allows you to get all variations from a particular variation group.

* ``variations_by_product_id`` *(int)*—filter that allows you to get variations by product ID.

* ``parent_product_id (int)``—filter that allows you to get child variations.

* ``include_child_variations`` *(enum[0|1])*—filter that allows you to include child variations to the selection. By default, child variations are not included in the selection for the storefront.

* ``group_child_variations`` *(enum[0|1])*—filter that allows you to combine child variations in groups. By default, child variations are combined in groups for the storefront, and not combined for the admin panel.


Additional Params
=================

Additional parameters for product selection are inherited from :doc:`Products </developer_guide/api/entities/products>`. The :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on adds the following new parameters, available via Products API or Product Variations API:

* ``get_variation_features_variants`` *(enum[0|1])*—flag for expanding product data. If the parameter is specified, each variation will have a ``variation_features_variants`` array with all the possible feature variants. CS-Cart and Multi-Vendor use that data to show feature variant selectors.

* ``get_variation_info`` *(enum[0|1])*—flag for expanding product data. If this parameter is specified, the following data will be defined for each variation:

  * ``variation_feature_ids``—IDs of features that were used to create the product variation group;

  * ``variation_feature_collection``—collection of features and their purposes that were used to create the product variation group;

  * ``variation_group_id``—variation group ID;

  * ``variation_group_code``—symbol code of the variation group;

  * ``variation_parent_product_id``—parent product ID;

  * ``variation_sub_group_id``—subgroup symbol ID;

  * ``variation_features``—the values of all variation-capable features of the product; 

* ``get_variation_name`` *(enum[0|1])*—flag for expanding product data. If the parameter is specified, the product name with the label will be defined for each variation in the ``variation_name`` property. Example: *T-shirt, Color: Blue (Medium)*.


Fields
======

Fields are inherited from :doc:`Products </developer_guide/api/entities/products>`. The :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on adds the following new fields, available via Products API or Product Variations API:

* ``variation_group_id``—variation group ID; 

* ``variation_group_code``—symbol code of the variation group;

* ``variation_parent_product_id``—parent product ID;

* ``variation_sub_group_id``—subgroup symbol ID;

* ``variation_features``—variants of the feature which purpose allows to create variations;

* ``variation_feature_ids``—IDs of features that were used to create the product variation group;

* ``variation_feature_collection``—collection of features and their purposes that were used to create the product variation group.


Creating/Updating Products
==========================

The logics of creation/updating products in a variation group is inherited from :doc:`Products </developer_guide/api/entities/products>`. The :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on considers the following fields when creating/updating products:

* ``variation_feature_values``—list of the product feature values in the ``feature_id: variant_id`` format. Allows you to change the values of those features that were used to create variation groups. 

* ``variation_group_id``—variation group ID. Allows you to add the product to the variation group.


Examples
========

* Get the list of the products by variation group:

  * Example 1::

    	curl -X GET "http://example.com/api/product_variations?variation_group_id=:id" \
     	-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Where ``:id`` is a variation group ID.

  * Example 2::

		curl -X GET "http://example.com/api/product_variations_groups/:id/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Where ``:id`` is a variation group ID.

  * Example 3::

		curl -X GET "http://example.com/api/product_variations_groups/:code/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Where ``:code`` is a symbol code of the variation group.

  * Example 4::

		curl -X GET "http://example.com/api/products?variation_group_id=:id" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

    Where ``:id`` is a variation group ID.

* Get only variations:

  * Example 1::

		curl -X GET "http://example.com/api/product_variations" \
 		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

  * Example 2::

		curl -X GET "http://example.com/api/products?has_variation_group=1" \
		-H "Content-Type: application/json" \
 		-H "Authorization: Basic ******"

* Add a product to the variation group::

      curl -X PUT "http://example.com/api/product_variations/:id" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******" \
      -d '{"variation_group_id":11}'

  Where ``:id`` is the product ID.
  
* Create a product and add it to the variation group::

      curl -X POST "http://example.com/api/product_variations_groups/:code/product_variations" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******" \
      -d '{"product":"Pants","price":150,"product_features":{"549":1199,"548":1195},"category_ids":[224]}'

  Where ``:code`` is a symbol code of the variation group.

.. _detach_product_variation:


DetachProductVariation
======================

API entity for removing a variation from the variation group.


URL
+++

http://example.com/api/**product_variations/:id/detach_product_variation**—only ``POST`` requests are supported.


Request Example
+++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/:id/detach_product_variation" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ******" \
       -d '{}'
 
Where ``:id`` is a product ID that has to be deleted from the product variation group.


Response
++++++++

If the request is successful, you’ll receive **201 HTTP**.

.. _Set_Default_Product_Variation:


SetDefaultProductVariation
==========================

API entity for setting a variation as the default one.


URL
+++

http://example.com/api/**product_variations/:id/set_default_product_variation**—only ``POST`` requests are supported.


Request Example
+++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/292/set_default_product_variation" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ******" \
       -d '{}'
 
Where ``:id`` is the ID of the new default product in the variation group.


Response
++++++++

If the request is successful, you’ll receive **201 HTTP**.

.. _Generate_Product_Variations:


GenerateProductVariations
=========================

API entity for generating variations based on combinations of product features.

URL
+++

http://example.com/api/**product_variations/:id/generate_product_variations**—only ``POST`` requests are supported.


Request Example
+++++++++++++++

::

      curl -X POST "http://example.com/api/product_variations/:id/generate_product_variations" \
       -H "Content-Type: application/json" \
       -H "Authorization: Basic ****" \
       -d '{"combinations":[{"548":1193,"549":1200},{"548":1197,"549":1199}]}'

Where:

* ``:id`` is the ID of the product to create variations for;

* ``combinations`` is the list of the feature variants combinations in the ``feature_id: variant_id`` format.


Response
++++++++

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

Where:

* ``group``—object that describes a variation group. Check :doc:`this article </developer_guide/api/entities/product_variation_groups>` to find out more about the variation groups.

* ``products_status``— statuses of the result of adding the product to the variation group in the ``product_id: result`` format. The result can take on the following values:

  * *0*—no changes;

  * *1*—the product has been added to the variation group;

  * *2*—the product has been updated in the variation group;

  * *253*—the vendor/storefront the product belongs to does not match other products in the variation group;

  * *254*—the combination of feature variants already exists in the variation group;

  * *255*—the product does not have the feature that matches the variation group;

  * *200*—unknown error.

