************************
Product Variation Groups
************************

Let's say we have a T-shirt available in 3 colors and 5 sizes in your store. It means we have 15 similar products. We want to switch between the colors and sizes on the storefront.

To do this, we have to put these similar products in a variation group. In this case the product will be considered as a :doc: `variation </user_guide/manage_products/products/product_variations>`. A product can belong only to one group at the same time, but it’s easy to change the product’s group. If a variation is removed from the group, it becomes a standard product.


.. contents::
   :backlinks: none
   :local:
    
    
URLs
====

* http://example.com/api/**product_variations_groups** —refer to all product variations groups. 

  Only ``GET`` and ``POST`` are supported.


* http://example.com/api/**product_variations_groups/:id** —refer to a product variations group. 

  ``GET``, ``PUT``, and ``DELETE`` are supported. 

 
* http://example.com/api/**product_variations_groups/:code** —refer to a product variations group. 

  ``GET``, ``PUT``, and ``DELETE`` are supported. 


Nested Objects
==============

* :doc:`Product Variations </developer_guide/api/entities/product_variations>`


Pagination
==========

.. list-table::
    :header-rows: 1
    :widths: 4 10

    *   -   Parameter 
        -   Description
    *   -   ``page``
        -   Shows variation groups on a page with the defined number 
    *   -   ``items_per_page``
        -   Shows N variation groups, where N is the number defined in the parameter


Filtering
=========

.. list-table::
    :header-rows: 1
    :widths: 4 10

    *   -   Parameter 
        -   Desription
    *   -   ``product_ids``
        -   Filtering by product IDs. If the parameter is specified, the response will contain those variation groups that contain at least one of the listed products.
    *   -   ``feature_ids``
        -   Filtering by features. If the parameter is specified, the response will contain those variation groups that contain at least one of the listed features.
 
        
Fields
======

* ``id``—variation group ID;

* ``code``—variation group code;

* ``features``—list of the products features that were used to create the product variation group;

  * ``feature_id``—product feature ID;

  * ``purpose``—purpose of the product feature;

    * ``group_catalog_item``—variations as separate products;
  
    * ``group_variation_catalog_item``—variations as one product;
    
  * ``is_purpose_create_catalog_item``—flag. If it takes on the value ``true``, the purpose of the feature is *Variations as separate products*;
  
  * ``is_purpose_create_variation_of_catalog_item``—flag. If it takes on the value ``true``, the purpose of the feature is *Variations as one product*;
  
* ``products``—list of the products in the variation group;

  * ``product_id``—product ID;

  * ``parent_product_id``—parent product ID;

  * ``company_id``—ID of the vendor/storefront the product belongs to;

  * ``feature_values``—list of the product feature values;

    * ``feature_id``—product feature ID;

    * ``variant_id``—ID of the product feature variant;

* ``created_at``—time when the variation group was created;

* ``updated_at``—last time when the variation group was updated.


Response Format
===============

#. Response to a request for a variation groups list::

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
	    
	
#. Response to a request for a variation group by its ID or code ::
	   
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


Examples
========


Create a Variation Group
++++++++++++++++++++++++

::

	curl -X POST "http://example.com/api/product_variations_groups" \
 	-H "Content-Type: application/json" \
 	-H "Authorization: Basic ******" \
	-d '{"product_ids":[286,287,288],"code":"MY_GROUP_1"}'
	   
	   
Get a List of Variation Groups
++++++++++++++++++++++++++++++

::

	curl -X GET "http://example.com/api/product_variations_groups" \
 	-H "Content-Type: application/json" \
	-H "Authorization: Basic ******"
 	  
 	   
Get a Variation Group
+++++++++++++++++++++

* Example 1::
  
      curl -X GET "http://example.com/api/product_variations_groups/:id" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******"
        
  Where ``:id`` is a variation group ID.
    
* Example 2::
  
      curl -X GET "http://example.com/api/product_variations_groups/:code" \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic ******"
        
  Where ``:code`` is a symbol ID of a variation group.


Update a Symbol Code of a Variation Group
+++++++++++++++++++++++++++++++++++++++++

::

	curl -X PUT "http://example.com/api/product_variations_groups/:code" \
 	-H "Content-Type: application/json" \
 	-H "Authorization: Basic ******" \
 	-d '{"code":"MY_GROUP_NEW"}'

Where ``:code`` is a symbol ID of a variation group.
  
  
Delete a Variation Group
++++++++++++++++++++++++

::

	curl -X DELETE "http://example.com/api/product_variations_groups/:code" \
  	-H "Content-Type: application/json" \
  	-H "Authorization: Basic ******" \
  	-d '{}'

Where ``:code`` is a symbol ID of a variation group.




