********
Products
********

Products are what customers come for to an online store or marketplace. Administrators can create, update, or delete products; customers see those products on the storefront (not through API) and can buy them. In API, a product can become a part of :doc:`Cart<carts>` or :doc:`Order<orders>`.

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

    
To refer to all products of a particular :doc:`Category <categories>` send a GET request to  ``/api/categories/:id/products/``::

  GET /api/categories/166/products/
  


---------------------------------
Pagination, Sorting and Filtering
---------------------------------


To get a specific number of products or list of products from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 30 15

    *   -   Pagination param
        -   Description
        -   Supported values (if any)
    *   -   page
        -   Shows products on a page with the defined number
        -   | 
    *   -   items_per_page
        -   Shows N products, where N - is a number defined in the parameter
        -   | 
    *   -   Sorting Param
        -   |
        -   |
    *   -   status
        -   Product status
        -   | 
    *   -   list_price
        -   List price
        -   | 
    *   -   product
        -   Product name
        -   | 
    *   -   price
        -   Price
        -   | 
    *   -   code
        -   Product code
        -   | 
    *   -   amount
        -   In stock amount
        -   | 
    *   -   Filtering Param
        -   |
        -   | 
    *   -   pname
        -   Product name
        -   | 
    *   -   pshort
        -   Short description
        -   | 
    *   -   pfull
        -   Full description
        -   | 
    *   -   pkeywords
        -   Meta keywords
        -   | 
    *   -   pcode
        -   Product code
        -   | 
    *   -   cid
        -   Category ID
        -   | 
    *   -   amount_from
        -   In stock lower range
        -   | 
    *   -   amount_to
        -   In stock higher range
        -   | 
    *   -   price_from
        -   Price lower range
        -   | 
    *   -   price_to
        -   Price higher range
        -   | 
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
    *   -   Add-ons Param
        -   |
        -   |

    *   -   age_limit
        -   Age access restriction value in years
        -   integer
    *   -   age_verification
        -   Activate/disable age verification
        -   | ``Y``
            | ``N``
    *   -   age_warning_message
        -   Forbidden age warning message
        -   string

    *   -   product_type
        -   Product type
        -   P
    *   -   is_returnable
        -   Returnable or not
        -   | ``Y``
            | ``N``


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
    
  
To refer to a specific product in a particular category, send a GET request to ``/api/categories/:id/products/:id``::


  GET /api/categories/229/products/12
  

.. _api-products-fields:

--------------
Product Fields
--------------

A product has a number of properties, represented by fields.


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 10

    *   -   Field name
        -   Description
        -   Supported values
    *   -   product
        -   Product name
        -   string
    *   -   category_ids
        -   IDs of the categories to which the product belongs
        -   Array of valid category IDs
    *   -   main_category
        -   ID of the main category
        -   Existing category ID
    *   -   price
        -   Price
        -   float
    *   -   company_id
        -   ID of the store or vendor the product belongs to
        -   integer
    *   -   status
        -   | Product status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
        -   | ``A``
            | ``D``
            | ``H``
    *   -   amount
        -   Product amount in stock
        -   integer
    *   -   avail_since
        -   Date from which the product is available
        -   Date in UNIX format
    *   -   box_height
        -   Box height
        -   integer
    *   -   box_length
        -   Box length
        -   integer
    *   -   box_width
        -   Box width
        -   integer
    *   -   details_layout
        -   Product details page layout
        -   Valid product template name
    *   -   edp_shipping
        -   Only for a downloadable product: Enable/disable shipping
        -   | ``Y``
            | ``N``
    *   -   exceptions_type
        -   Exception type (``A``\ llow/ ``F``\ orbid products with certain option combinations)
        -   | ``A``
            | ``F``
    *   -   feature_comparison
        -   Enable/disable adding the product to a feature comparison list
        -   | ``Y``
            | ``N``
    *   -   free_shipping
        -   Allow free shipping
        -   | ``Y``
            | ``N``
    *   -   full_description
        -   Full product description
        -   string
    *   -   image_pairs
        -   Additional image pairs
        -   object with image pair ID as key and image pair as value (see :ref:`below <main-pair>`)
    *   -   is_edp
        -   Downloadable or not
        -   | ``Y``
            | ``N``
    *   -   lang_code
        -   Language code
        -   | ``en``
            | ``ru``
            | etc.
    *   -   list_price
        -   Manufacturer suggested price
        -   float
    *   -   list_qty_count
        -   Number of items in the quantity select box
        -   integer
    *   -   localization
        -   String of comma-separated localization IDs
        -   string
    *   -   low_avail_limit
        -   Minimal availability in stock value
        -   integer
    *   -   main_pair
        -   Full image and thumbnail pair
        -   Main pair object (see :ref:`below <main-pair>`)
    *   -   max_items_in_box
        -   Maximal number of items per box
        -   integer
    *   -   max_qty
        -   Maximal order quantity
        -   integer
    *   -   meta_description
        -   Meta description
        -   string
    *   -   meta_keywords
        -   Meta keywords
        -   string
    *   -   min_items_in_box
        -   Minimal number of items per box
        -   integer
    *   -   min_qty
        -   Minimal order quantity
        -   integer
    *   -   options_type
        -   Apply options simultaneously (``P``) or sequentially (``S``)
        -   | ``S``
            | ``P``
    *   -   out_of_stock_actions
        -   | Out of stock action:
            | ``N`` for None
            | ``B`` for Buy in advance
            | ``S`` for Sign up for notification
        -   | ``N``
            | ``B``
            | ``S``
    *   -   page_title
        -   Product page title
        -   string
    *   -   point_price
        -   Price in reward points
        -   float
    *   -   popularity
        -   Product popularity rating based on views, adding to cart, and purchases
        -   integer
    *   -   product_code
        -   Product code
        -   string
    *   -   product_features
        -   Product features
        -   object that contains :doc:`product features <product_features>` with feature ID as key and feature data as value
    *   -   product_id
        -   Product ID
        -   integer
    *   -   promo_text
        -   Promo text
        -   string
    *   -   qty_step
        -   Quantity step
        -   integer
    *   -   return_period
        -   Return period in days
        -   integer
    *   -   sales_amount
        -   Sales amount
        -   integer
    *   -   search_words
        -   Search keywords for the product
        -   string
    *   -   seo_name
        -   SEO name for the product page
        -   string
    *   -   shared_product
        -   Shared or not
        -   | ``Y``
            | ``N``
    *   -   shipping_freight
        -   Shipping freight
        -   float
    *   -   shipping_params
        -   Aggregated shipping data
        -   string
    *   -   short_description
        -   Short description
        -   string
    *   -   tax_ids
        -   Array of tax IDs
        -   array
    *   -   timestamp
        -   Creation timestamp
        -   Valid timestamp in UNIX format
    *   -   tracking
        -   | Inventory tracking mode
            | ``B`` for Track 
            | ``D`` for do not track
        -   | ``B``
            | ``D``
    *   -   unlimited_download
        -   For EDP products: allow or not unlimited downloads
        -   | ``Y``
            | ``N``
    *   -   updated_timestamp
        -   Last update timestamp
        -   Valid timestamp in UNIX format
    *   -   usergroup_ids
        -   User group IDs
        -   String of comma-separated user group IDs
    *   -   weight
        -   Weight
        -   float
    *   -   zero_price_action
        -   | Zero price action
            | ``R`` for Do not allow customers to add product to cart
            | ``P`` for Allow customers to add product to cart
            | ``A`` for Ask customer to enter the price
        -   | ``R``
            | ``P``
            | ``A``
  

.. _main-pair:


Product Images (Pairs)
----------------------

A pair of the full product image and (optionally) a thumbnail.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 10

    *   -   Field name
        -   Description
        -   Supported values
    *   -   detailed_id
        -   ID of the full image
        -   integer
    *   -   image_id
        -   ID of the thumbnail
        -   integer
    *   -   pair_id
        -   ID of the image pair
        -   integer
    *   -   position
        -   Position of the image pair among others
        -   integer
    *   -   icon
        -   Thumbnail data
        -   object (similar to ``detailed``, see below)
    *   -   detailed
        -   Full image data
        -   object (content explained below)
    *   -   absolute_path
        -   Absolute filesystem path to the image
        -   Valid filesystem path
    *   -   alt
        -   Alternative text (show if the image fails to load)
        -   string
    *   -   http_image_path
        -   HTTP path to the image
        -   Valid HTTP URL pointing to the image
    *   -   image_path
        -   Actual image path (HTTP or HTTPS; may be the same as ``http_image_path``)
        -   Valid URL pointing to the image
    *   -   image_x
        -   Image width in pixels
        -   integer
    *   -   image_y
        -   Image height
        -   integer  
  
---------------
Response Format
---------------

* The product exists: **HTTP/1.1 200 OK**. 

Let's make a test ``GET`` request to **/api/products?page=1&items_per_page=2**
 
The response is JSON with the following data::

    {
    "products":
    [
        {
            "product_id": "12",
            "product": "100g Pants",
            "product_type": "P",
            "parent_product_id": "0",
            "product_code": "U0012O5AF0",
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
            "tax_ids": "6",
            "age_verification": "N",
            "age_limit": "0",
            "options_type": "P",
            "exceptions_type": "F",
            "details_layout": "default",
            "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
            "price": "30.00",
            "category_ids":
            [
                224
            ],
            "seo_name": "100g-pants",
            "seo_path": "223/224",
            "main_category": 224,
            "options_type_raw": null,
            "exceptions_type_raw": null,
            "tracking_raw": null,
            "zero_price_action_raw": null,
            "min_qty_raw": null,
            "max_qty_raw": null,
            "qty_step_raw": null,
            "list_qty_count_raw": null,
            "details_layout_raw": "default",
            "variation_features":
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
                    "image_path": "https://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "alt": "",
                    "image_x": "500",
                    "image_y": "500",
                    "http_image_path": "http://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "https_image_path": "https://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "absolute_path": "/srv/projects/example.com/web/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "relative_path": "detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "is_high_res": false
                }
            },
            "base_price": "30.00",
            "selected_options":
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
                                    "image_path": "https://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "alt": "",
                                    "image_x": "200",
                                    "image_y": "133",
                                    "http_image_path": "http://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "https_image_path": "https://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "absolute_path": "/srv/projects/example.com/web/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "relative_path": "feature_variant/1/Adidas_Logo.svg.png",
                                    "is_high_res": false
                                }
                            }
                        }
                    }
                }
            },
            "qty_content":
            []
        },
        {
            "product_id": "17",
            "product": "101 Things Everyone Should Know About Economics A Down and Dirty Guide to Everything from Securities and Derivatives to Interest Rates and Hedge Funds—And What They Mean For You",
            "product_type": "P",
            "parent_product_id": "0",
            "product_code": "G0017HS88V",
            "status": "A",
            "company_id": "1",
            "list_price": "0.00",
            "amount": "19",
            "weight": "0.000",
            "length": "0",
            "width": "0",
            "height": "0",
            "shipping_freight": "0.00",
            "low_avail_limit": "0",
            "timestamp": "1328558400",
            "updated_timestamp": "1328684302",
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
            "tax_ids": "6",
            "age_verification": "N",
            "age_limit": "0",
            "options_type": "P",
            "exceptions_type": "F",
            "details_layout": "default",
            "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
            "price": "11.16",
            "category_ids":
            [
                222
            ],
            "seo_name": "101-things-everyone-should-know-about-economics-a-down-and-dirty-guide-to-everything-from-securities-and-derivatives-to-interest-rates-and-hedge-fundsand-what-they-mean-for-you",
            "seo_path": "219/222",
            "main_category": 222,
            "options_type_raw": null,
            "exceptions_type_raw": null,
            "tracking_raw": null,
            "zero_price_action_raw": null,
            "min_qty_raw": null,
            "max_qty_raw": null,
            "qty_step_raw": null,
            "list_qty_count_raw": null,
            "details_layout_raw": "default",
            "variation_features":
            [],
            "main_pair":
            {
                "pair_id": "229",
                "image_id": "0",
                "detailed_id": "285",
                "position": "0",
                "object_id": "17",
                "object_type": "product",
                "detailed":
                {
                    "object_id": "17",
                    "object_type": "product",
                    "type": "M",
                    "image_path": "https://example.com/images/detailed/0/Z6595.jpg",
                    "alt": "",
                    "image_x": "510",
                    "image_y": "680",
                    "http_image_path": "http://example.com/images/detailed/0/Z6595.jpg",
                    "https_image_path": "https://example.com/images/detailed/0/Z6595.jpg",
                    "absolute_path": "/srv/projects/example.com/web/images/detailed/0/Z6595.jpg",
                    "relative_path": "detailed/0/Z6595.jpg",
                    "is_high_res": false
                }
            },
            "base_price": "11.16",
            "selected_options":
            [],
            "has_options": false,
            "product_options":
            [],
            "discounts":
            {
                "A": 0,
                "P": 0
            },
            "product_features":
            [],
            "qty_content":
            []
        }
    ],
    "params":
    {
        "area": "A",
        "use_caching": true,
        "extend":
        [
            "product_name",
            "prices",
            "categories",
            "categories"
        ],
        "custom_extend":
        [],
        "pname": "Y",
        "pshort": "Y",
        "pfull": "Y",
        "pkeywords": "Y",
        "feature":
        [],
        "type": "simple",
        "page": 1,
        "action": "",
        "filter_variants":
        [],
        "features_hash": "",
        "limit": 0,
        "bid": 0,
        "match": "all",
        "tracking":
        [],
        "get_frontend_urls": false,
        "items_per_page": 2,
        "apply_disabled_filters": "",
        "load_products_extra_data": true,
        "storefront": null,
        "company_ids": "",
        "subcats": "Y",
        "pcode_from_q": "Y",
        "search_performed": "Y",
        "ajax_custom": "1",
        "hide_out_of_stock_products": false,
        "sort_by": "product",
        "sort_order": "asc",
        "usergroup_ids":
        [],
        "include_child_variations": true,
        "group_child_variations": false,
        "sort_order_rev": "desc",
        "total_items": "247"
    }
    }


    
* The products doesn't exist: **HTTP/1.1 404 Not Found**.



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
Example JSON: Create a Product for a Particular Vendor 
------------------------------------------------------    
Vendors are independent companies that sell their own products in your store. To create a product for a Particular Vendor you will need to specify their vendor_id in a request. Learn more about Vendors entity in :doc:`this article<vendors>`.
 
Send a POST request to   ``api/vendors/1/products``
 
::

    {
    "product": "Vendor's Product Name",
    "category_ids": "166",
    "price": "1000"
    }
    
This request creates a product for the Vendor with a ``vendor_id=1`` and minimum Product Details.

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
            "image_url": "https://example.com/image.jpg"
        }
    }
    }


  
This request creates a product with a price, the Active Status, and a main image. The ``main_pair`` array stands for the main image of the product. The image must be already uploaded on your server, or available somewhere on the Internet. Once an image is specified, CS-Cart downloads it and saves it.
  

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
        "image_path": "https://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "alt": "",
        "http_image_path": "http://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "https_image_path": "https://example.com/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "absolute_path": "/srv/projects/example.com/web/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "relative_path": "detailed/0/173283_0113298267324f438bac97eaf.jpg",
        "is_high_res": false
        }
    }
    }

This request updates the Main image of the particular Product. In this example the field ``main_pair`` represents the main image of the product and can be uploaded on your server or added with URL. To specify the image hosted somewhere other than your server, use the ``image_path`` field of the ``detailed`` object to specify the URL of the image.
  


-----------------------------------------------
Example JSON: Update a Product to Add a Feature
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
                            "image_path": "https://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                            "alt": "",
                            "image_x": "200",
                            "image_y": "133",
                            "http_image_path": "http://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                            "https_image_path": "https://example.com/images/feature_variant/1/Adidas_Logo.svg.png",
                            "absolute_path": "/srv/projects/example.com/web/images/feature_variant/1/Adidas_Logo.svg.png",
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

