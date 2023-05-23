********
Products
********

A substantial part of an online store. Products can be viewed, created, updated and deleted by store administrators and vendors.

.. contents::
   :backlinks: none
   :local:

   
=================
List All Products
=================

To get a list of products, send a GET request to ``/api/products/``::

  GET /api/products/


.. list-table::
    :stub-columns: 1
    :widths: 5 15
    
    *   -   Store Builder
        -   This request returns 10 products with a short list of details for each product.
    *   -   Multi-Vendor
        -   This request returns 50 products with a short list of details for each product.

    
To refer to all products of a particular :doc:`category <categories>` send a GET request to  ``/api/categories/:id/products/``::

  GET /api/categories/166/products/
  


---------------------------------
Pagination, Sorting and Filtering
---------------------------------


To get a specific number of products or list of products from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows products on a page with the defined number
    *   -   items_per_page
        -   Shows N products, where N - is a number defined in the parameter



.. _sorting:


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Param
        -   Description
    *   -   status
        -   Product status
    *   -   list_price
        -   List price
    *   -   product
        -   Product name
    *   -   price
        -   Price
    *   -   code
        -   Product code
    *   -   amount
        -   In stock amount

    *   -   pname
        -   Product name
    *   -   pshort
        -   Short description
    *   -   pfull
        -   Full description
    *   -   pkeywords
        -   Meta keywords
    *   -   pcode
        -   Product code
    *   -   cid
        -   Category ID
    *   -   amount_from
        -   In stock lower range
    *   -   amount_to
        -   In stock higher range
    *   -   price_from
        -   Price lower range
    *   -   price_to
        -   Price higher range

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5

    *   -   Param
        -   Description
        -   Supported values
    *   -   subcats
        -   Include subcategories of the given category (the ``cid`` filter must be used) in the search scope
        -   | ``Y``
            | ``N``
    *   -   order_ids
        -   IDs of the orders to search the products in
        -   Comma-separated list of order IDs, e.g. ``1,13,24``
    *   -   free_shipping
        -   Free shipping
        -   | ``Y``
            | ``N``
    *   -   status
        -   | Product status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
        -   | ``A``
            | ``D``
            | ``H``


.. only:: addons

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values

    *   -   age_limit
        -   Age access restriction value in years
        -   0
        -   integer
    *   -   age_verification
        -   Activate/disable age verification
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   age_warning_message
        -   Forbidden age warning message
        -   ''
        -   string
    *   -   is_op
        -   ?
        -   ?
        -   ?
    *   -   is_oper
        -   ?
        -   ?
        -   ?
    *   -   is_pbp
        -   ?
        -   ?
        -   ?
    *   -   product_type
        -   ?
        -   P
        -   ?
    *   -   is_returnable
        -   Returnable or not
        -   ``Y``
        -   | ``Y``
            | ``N``


--------
Examples
--------

::

   http://example.com/api/products?page=5

Response is an array with 10 products from the 5th page (10 is the default value of the ``items_per_page`` parameter).

::

   http://example.com/api/products?items_per_page=20

Response is an array with 20 products from the first page.

::

   http://example.com/api/products?page=5&items_per_page=20

Response is an array with 20 products from the 5th page.

In order to get products based on a filter, you can use one of the available filters. Product filtering is similar to the advanced search performed in the admin panel.

The request URL is as follows (separated into several lines for readability):

    | http://example.com/api/products?
    |	 <filter>=Y&
    |	 <additional_param>=<value>&
    |	 <another_param>=<value>&
    |	 ...
    |	 sort_by=<sorting>&
    |	 sort_order=<sort_order>&
    |	 q=<query>

*   **filter** is one of the available :ref:`filters <filters>`. It is possible to use any number of filters at a time by appending the URL with **&<another_filter>=Y**

*   **additional_param** is one of the available :ref:`additional params <additional-params>`. It is possible to use any number of additional params at a time by appending the URL with **&<another_param>=<value>**

*   **sorting** is one of the available :ref:`sortings <sorting>`

*   **sort_order** is the sort direction; ``asc`` or ``desc`` for ascending and descending accordingly

*   **query** is the search query

In order to get results referring only to a particular store in CS-Cart Store Builder Ultimate or vendor in CS-Cart Multi-Vendor, use the ``stores`` and ``vendors`` entity respectively:

    
.. list-table::
    :stub-columns: 1
    :widths: 5 15
    
    *   -   Store Builder
        -   Send a GET request to ``/api/stores/<company_id>/products/``
    *   -   Multi-Vendor
        -   Send a GET request to ``api/vendors/<vendor_id>/products``
    


Get all products of the 1st store, with 'foo' in their full description, costing over $10, and sort the result by product name from A to Z:

.. code-block:: bash

     GET /api/stores/1/products?pfull=Y&price_from=10&sort_by=product&sort_order=asc&q=foo


Get all products of a particular vendor and sort the result as an array with 20 products from the 5th page:

.. code-block:: bash

    GET /api/vendors/1/products?page=5&items_per_page=20


---------------
Response Format
---------------

* The product exists: **HTTP/1.1 200 OK**. The response is JSON with Products.
* The product doesn't exist: **HTTP/1.1 404 Not Found**.


======================
Get a Specific Product
======================


To get a specific product, send a GET request to ``/api/products/<product_id>/``::

  GET /api/products/12
    
  
To refer to a particular product in a particular category, send a GET request to ``/api/categories/:id/products/:id``::


  GET /api/categories/229/products/12
  

.. _api-products-fields:

--------------
Product Fields
--------------

A product has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   product*
        -   Product name
        -   —
        -   string
    *   -   category_ids*
        -   IDs of the categories to which the product belongs
        -   —
        -   Array of valid category IDs
    *   -   main_category*
        -   ID of the main category
        -   —
        -   Existing category ID
    *   -   price*
        -   Price
        -   0
        -   float
    *   -   company_id*
        -   ID of the store or vendor the product belongs to
        -   Default company ID
        -   integer
    *   -   status*
        -   | Product status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
        -   ``A``
        -   | ``A``
            | ``D``
            | ``H``
    *   -   amount
        -   Product amount in stock
        -   1
        -   integer
    *   -   avail_since
        -   Date from which the product is available
        -   —
        -   Date in UNIX format
    *   -   box_height
        -   Box height
        -   0
        -   integer
    *   -   box_length
        -   Box length
        -   0
        -   integer
    *   -   box_width
        -   Box width
        -   0
        -   integer
    *   -   details_layout
        -   Product details page layout
        -   'default'
        -   Valid product template name
    *   -   edp_shipping
        -   Only for a downloadable product: Enable/disable shipping
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   exceptions_type
        -   Exception type (``A``\ llow/ ``F``\ orbid products with certain option combinations)
        -   ``F``
        -   | ``A``
            | ``F``
    *   -   feature_comparison
        -   Enable/disable adding the product to a feature comparison list
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   free_shipping
        -   Allow free shipping
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   full_description
        -   Full product description
        -   ''
        -   string
    *   -   image_pairs
        -   Additional image pairs
        -   empty array
        -   object with image pair ID as key and image pair as value (see :ref:`below <main-pair>`)
    *   -   is_edp
        -   Downloadable or not
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   lang_code
        -   Language code
        -   Default language code
        -   | ``en``
            | ``ru``
            | etc.
    *   -   list_price
        -   Manufacturer suggested price
        -   0
        -   float
    *   -   list_qty_count
        -   Number of items in the quantity select box
        -   0
        -   integer
    *   -   localization
        -   String of comma-separated localization IDs
        -   ''
        -   string
    *   -   low_avail_limit
        -   Minimal availability in stock value
        -   0
        -   integer
    *   -   main_pair
        -   Full image and thumbnail pair
        -   empty array
        -   Main pair object (see :ref:`below <main-pair>`)
    *   -   max_items_in_box
        -   Maximal number of items per box
        -   0
        -   integer
    *   -   max_qty
        -   Maximal order quantity
        -   0
        -   integer
    *   -   meta_description
        -   Meta description
        -   ''
        -   string
    *   -   meta_keywords
        -   Meta keywords
        -   ''
        -   string
    *   -   min_items_in_box
        -   Minimal number of items per box
        -   0
        -   integer
    *   -   min_qty
        -   Minimal order quantity
        -   0
        -   integer
    *   -   options_type
        -   Apply options simultaneously (``P``) or sequentially (``S``)
        -   ``P``
        -   | ``S``
            | ``P``
    *   -   out_of_stock_actions
        -   | Out of stock action:
            | ``N`` for None
            | ``B`` for Buy in advance
            | ``S`` for Sign up for notification
        -   ``N``
        -   | ``N``
            | ``B``
            | ``S``
    *   -   page_title
        -   Product page title
        -   ''
        -   string
    *   -   point_price
        -   Price in reward points
        -   0
        -   float
    *   -   popularity
        -   Product popularity rating based on views, adding to cart, and purchases
        -   3
        -   integer
    *   -   product_code
        -   Product code
        -   ''
        -   string
    *   -   product_features
        -   Product features
        -   empty array
        -   object that contains :doc:`product features <product_features>` with feature ID as key and feature data as value
    *   -   product_id
        -   Product ID
        -   Set automatically
        -   integer
    *   -   promo_text
        -   Promo text
        -   ''
        -   string
    *   -   qty_step
        -   Quantity step
        -   0
        -   integer
    *   -   return_period
        -   Return period in days
        -   10
        -   integer
    *   -   sales_amount
        -   Sales amount
        -   0
        -   integer
    *   -   search_words
        -   Search keywords for the product
        -   ''
        -   string
    *   -   seo_name
        -   SEO name for the product page
        -   ''
        -   string
    *   -   shared_product
        -   Shared or not
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   shipping_freight
        -   Shipping freight
        -   0
        -   float
    *   -   shipping_params
        -   Aggregated shipping data
        -   Auto-generated string based on the shipping data
        -   string
    *   -   short_description
        -   Short description
        -   ''
        -   string
    *   -   tax_ids
        -   Array of tax IDs
        -   empty array
        -   array
    *   -   timestamp
        -   Creation timestamp
        -   Set automatically
        -   Valid timestamp in UNIX format
    *   -   tracking
        -   | Inventory tracking mode
            | ``B`` for Track 
            | ``D`` for do not track

        -   ``B``
        -   | ``B``
            | ``D``
    *   -   unlimited_download
        -   For EDP products: allow or not unlimited downloads
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   updated_timestamp
        -   Last update timestamp
        -   Last update timestamp in seconds
        -   Valid timestamp in UNIX format
    *   -   usergroup_ids
        -   User group IDs
        -   '0'
        -   String of comma-separated user group IDs
    *   -   weight
        -   Weight
        -   0
        -   float
    *   -   zero_price_action
        -   | Zero price action
            | ``R`` for Do not allow customers to add product to cart
            | ``P`` for Allow customers to add product to cart
            | ``A`` for Ask customer to enter the price
        -   ``R``
        -   | ``R``
            | ``P``
            | ``A``
  

.. _main-pair:

---------
Main Pair
---------

A pair of the full product image and (optionally) a thumbnail.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   detailed_id
        -   ID of the full image
        -   Set automatically
        -   integer
    *   -   image_id
        -   ID of the thumbnail
        -   0
        -   integer
    *   -   pair_id
        -   ID of the image pair
        -   Set automatically
        -   integer
    *   -   position
        -   Position of the image pair among others
        -   0
        -   integer
    *   -   icon
        -   Thumbnail data
        -   —
        -   object (similar to ``detailed``, see below)
    *   -   detailed
        -   Full image data
        -   —
        -   object (content explained below)
    *   -   absolute_path
        -   Absolute filesystem path to the image
        -   —
        -   Valid filesystem path
    *   -   alt
        -   Alternative text (show if the image fails to load)
        -   ''
        -   string
    *   -   http_image_path
        -   HTTP path to the image
        -   —
        -   Valid HTTP URL pointing to the image
    *   -   image_path
        -   Actual image path (HTTP or HTTPS; may be the same as ``http_image_path``)
        -   —
        -   Valid URL pointing to the image
    *   -   image_x
        -   Image width in pixels
        -   —
        -   integer
    *   -   image_y
        -   Image height
        -   —
        -   integer  
  
---------------
Response Format
---------------

* The product exists: **HTTP/1.1 200 OK**. The response is JSON with the following data::

    {
    "min_items_in_box": 0,
    "max_items_in_box": 0,
    "box_length": 0,
    "box_width": 0,
    "box_height": 0,
    "product_id": 12,
    "product_code": "U0012O5AF0",
    "product_type": "P",
    "status": "A",
    "company_id": "1",
    "list_price": "31.00",
    "amount": "10",
    "weight": "0.000",
    "length": "0",
    "width": "0",
    "height": "0",
    "shipping_freight": "0.00",
    "low_avail_limit": "0",
    "timestamp": "1328558400",
    "updated_timestamp": "1383893547",
    "usergroup_ids": "0",
    "is_edp": "N",
    "edp_shipping": "N",
    "unlimited_download": "N",
    "tracking": "B",
    "free_shipping": "N",
    "zero_price_action": "R",
    "is_pbp": "Y",
    "is_op": "N",
    "is_oper": "N",
    "is_returnable": "Y",
    "return_period": "10",
    "avail_since": "0",
    "out_of_stock_actions": "N",
    "localization": "",
    "min_qty": "0",
    "max_qty": "0",
    "qty_step": "0",
    "list_qty_count": "0",
    "tax_ids":
    [
        "6"
    ],
    "age_verification": "N",
    "age_limit": "0",
    "options_type": "P",
    "exceptions_type": "F",
    "details_layout": "default",
    "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
    "parent_product_id": "0",
    "lang_code": "en",
    "product": "100g Pants",
    "shortname": "",
    "short_description": "",
    "full_description": "<p>\r\n\tWhen coach calls you off the bench, you need warm-up pants that come off  in three seconds or less. That’s why these men's adidas 100g basketball  pants have tear-away snaps down the sides, so you're ready for action  as fast as a superhero.\r\n</p>",
    "meta_keywords": "",
    "meta_description": "",
    "search_words": "",
    "page_title": "",
    "age_warning_message": "",
    "promo_text": "<p class=\"product-promo-text\"><span class=\"product-promo-header\">FREE US shipping over $100!</span><span class=\"product-promo-body\">Orders within next 2 days will be shipped on Monday</span></p>",
    "price": "30.00",
    "category_ids":
    [
        224
    ],
    "popularity": null,
    "company_name": "CS-Cart",
    "sales_amount": null,
    "seo_name": "100g-pants",
    "seo_path": "223/224",
    "point_price": null,
    "discussion_type": null,
    "average_rating": null,
    "product_reviews_count": null,
    "base_price": "30.00",
    "main_category": 224,
    "image_pairs":
    [],
    "main_pair":
    {
        "pair_id": "823",
        "image_id": "0",
        "detailed_id": "879",
        "position": "0",
        "object_id": "12",
        "object_type": "product",
        "detailed":
        {
            "object_id": "12",
            "object_type": "product",
            "type": "M",
            "image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
            "alt": "",
            "image_x": "500",
            "image_y": "500",
            "http_image_path": "http://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
            "https_image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
            "absolute_path": "/srv/projects/dev.demo.mv.cs-cart.com/web/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
            "relative_path": "detailed/0/173283_0113298267324f438bac97eaf.jpg",
            "is_high_res": false
        }
    },
    "prices":
    [
        {
            "product_id": "12",
            "lower_limit": "1",
            "usergroup_id": "0",
            "percentage_discount": "0.00",
            "price": "30.00"
        }
    ],
    "product_features":
    {
        "18":
        {
            "feature_id": "18",
            "value": "",
            "value_int": null,
            "variant_id": "86",
            "feature_type": "E",
            "internal_name": "Brand",
            "description": "Brand",
            "prefix": "",
            "suffix": "",
            "variant": "Adidas",
            "parent_id": "0",
            "display_on_header": "Y",
            "display_on_catalog": "N",
            "display_on_product": "N",
            "feature_code": "",
            "purpose": "organize_catalog",
            "features_hash": "10-86",
            "variants":
            {
                "86":
                {
                    "value": "",
                    "value_int": null,
                    "variant_id": "86",
                    "variant": "Adidas",
                    "image_pairs":
                    {
                        "pair_id": "875",
                        "image_id": "1006",
                        "detailed_id": "0",
                        "position": "0",
                        "object_id": "86",
                        "object_type": "feature_variant",
                        "icon":
                        {
                            "image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "alt": "",
                            "image_x": "200",
                            "image_y": "133",
                            "http_image_path": "http://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "https_image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "absolute_path": "/srv/projects/dev.demo.mv.cs-cart.com/web/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "relative_path": "feature_variant/1/Adidas_Logo.svg.png",
                            "is_high_res": false
                        }
                    }
                }
            }
        }
    },
    "options_type_raw": null,
    "exceptions_type_raw": null,
    "tracking_raw": null,
    "zero_price_action_raw": null,
    "min_qty_raw": null,
    "max_qty_raw": null,
    "qty_step_raw": null,
    "list_qty_count_raw": null,
    "details_layout_raw": "default",
    "detailed_params":
    {
        "info_type": "D",
        "is_preview": false
    },
    "have_required": "N",
    "selected_options":
    [],
    "variation_features":
    [],
    "has_options": true,
    "product_options":
    [],
    "list_discount": 1,
    "list_discount_prc": "3",
    "discounts":
    {
        "A": 0,
        "P": 0
    },
    "qty_content":
    []
    }


    
* The products doesn't exist: **HTTP/1.1 404 Not Found**.


.. _api-products-filtering:



================
Create a Product
================     

.. list-table::
    :stub-columns: 1
    :widths: 5 15
    
    *   -   Store Builder
        -   Send a POST request to ``/api/stores/<company_id>/products/``
    *   -   Multi-Vendor
        -   Send a POST request to ``/api/products/``


To create a new product send a ``POST`` request with required fields in JSON:  ``category_ids``, ``product``.

------------------------------
Example JSON: Create a Product 
------------------------------

::

    {
    "product": "Product Name",
    "category_ids": "166",
    "price": "1000"
    }


This request creates a product with minimum required details: a name, a main category ID and a price.

------------------------------------------------------
Example JSON: Create a Product for a particular Vendor 
------------------------------------------------------    
    
 Send a POST request to   ``api/vendors/1/products``
 
 ::

    {
    "product": "Vendor's Product Name",
    "category_ids": "166",
    "price": "1000"
    }
    
This request creates a product for the Vendor with a ``vendor_id=1``.

--------------------------------------------
Example JSON: Create a Product with an Image
--------------------------------------------

::

    {
    "product": "API Product",
    "category_ids": "166",
    "price": "1000",
    "amount": "10",
    "status": "A",
    "main_pair":
    {
        "detailed":
        {
            "image_url": "http://localdomain.com/image.jpg"
        }
    }
    }


  
This request creates a product with a Price, an Active Status and a Main image. In this example we're using the ``main_pair`` field to specify the image for the product. This field represents the main image that will be displayed for the product, and can be uploaded on your server or added with URL. To specify the image hosted somewhere other than your server, use the ``image_path`` field of the ``detailed`` object to specify the URL of the image.
  

---------------
Response Format
---------------

* The product has been created successfully: **HTTP/1.1 201 Created** and the JSON with the new ``product_id``::


    {
    "product_id": 391
    }



* The product couldn’t be created: **HTTP/1.1 400 Bad Request**.

================
Update a Product
================ 

To update an existing product, send the PUT request to ``/api/products/<product_id>/``. For example::

  PUT /api/product/12


------------------------------------
Example JSON: Update Product Details
------------------------------------

::

    {
    "product": "100g Pants Updated",
    "price": "31.00",
    "list_price": "35.00",
    "amount": "15"
    }

This request updates the Product Name, the List Price and the Price, and the Quantity of the particular Product.


------------------------------------
Example JSON: Update a Product Image
------------------------------------

::


    {
    "main_pair":
    {
    "pair_id": "823",
    "image_id": "0",
    "detailed_id": "879",
    "position": "0",
    "object_id": "12",
    "object_type": "product",
    "detailed":
        {
        "object_id": "12",
        "object_type": "product",
        "type": "M",
        "image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "alt": "",
        "image_x": "500",
        "image_y": "500",
        "http_image_path": "http://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "https_image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "absolute_path": "/srv/projects/dev.demo.mv.cs-cart.com/web/stores/4a228ef46daca854/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "relative_path": "detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "is_high_res": false
        }
    }
    }

This request updates the Main image of the particular Product. In this example the field ``main_pair`` represents the main image of the product and can be uploaded on your server or added with URL. To specify the image hosted somewhere other than your server, use the ``image_path`` field of the ``detailed`` object to specify the URL of the image.
  


-----------------------------------------------
Example JSON: Update a Product to add a Feature
-----------------------------------------------

To add a feature to a product, send a PUT request to ``api/products/<product_id>``

::

    {
    "product_features":
    {
        "18":
        {
            "feature_id": "18",
            "value": "",
            "value_int": null,
            "variant_id": "86",
            "feature_type": "E",
            "internal_name": "Brand",
            "description": "Brand",
            "prefix": "",
            "suffix": "",
            "variant": "Adidas",
            "parent_id": "0",
            "display_on_header": "Y",
            "display_on_catalog": "N",
            "display_on_product": "N",
            "feature_code": "",
            "purpose": "organize_catalog",
            "features_hash": "10-86",
            "variants":
            {
                "86":
                {
                    "value": "",
                    "value_int": null,
                    "variant_id": "86",
                    "variant": "Adidas",
                    "image_pairs":
                    {
                        "pair_id": "875",
                        "image_id": "1006",
                        "detailed_id": "0",
                        "position": "0",
                        "object_id": "86",
                        "object_type": "feature_variant",
                        "icon":
                        {
                            "image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "alt": "",
                            "image_x": "200",
                            "image_y": "133",
                            "http_image_path": "http://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "https_image_path": "https://dev.demo.mv.cs-cart.com/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "absolute_path": "/srv/projects/dev.demo.mv.cs-cart.com/web/stores/4a228ef46daca854/images/feature_variant/1/Adidas_Logo.svg.png",
                            "relative_path": "feature_variant/1/Adidas_Logo.svg.png",
                            "is_high_res": false
                        }
                    }
                }
            }
        }
    }
    }

This request adds a feature Brand with ``feature_id=18`` and a feature variant Adidas with ``variant_id=86`` to the product. Here is an article about :doc:`Product Features. <product_features>`

---------------
Response Format
---------------
* The product has been updated successfully: **HTTP/1.1 200 OK** and JSON with ``product_id``.
* The product couldn’t be updated: **HTTP/1.1 400 Bad Request**.
* The product doesn’t exist: **HTTP/1.1 404 Not Found**.


================
Delete a Product
================

To delete a product, send a DELETE request to the ``/api/products/<product_id>``. For example::

    DELETE /api/products/12/

This request will delete the product with ``product_id=12``.


---------------
Response Format
---------------


* The product has been deleted successfully: **HTTP/1.1 204 No Content**.

* The product couldn’t be deleted: **HTTP/1.1 400 Bad Request**.
 
* The product doesn’t exist: **HTTP/1.1 404 Not Found**.

