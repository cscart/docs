********
Products
********

Products are what customers come for to an online store or marketplace. Administrators can create, update, or delete products; customers see those products on the storefront (not through API) and can buy them. In API, a product can become a part of :doc:`Cart<carts>` or :doc:`Order<orders>`.

Some similar products (those that have different variants of a specific :doc:`Product Feature<product_features>`) can become :doc:`Product Variations<product_variations>` through :doc:`Product Variation Groups<product_variation_groups>`. That allows customers to select the desired product feature on the storefront, and go to the page of specific variation.

.. contents::
   :backlinks: none
   :local:

   
=================
List All Products
=================

To get a list of products, send a ``GET`` request to ``/api/products/``::

  GET /api/products/


The number of the returned products is determined by the ``items_per_page`` parameter. It's value can be changed in Admin panel in **Settings → Appearance** in the **Elements per page** setting or through an API request. 


To refer to all products of a particular :doc:`Category <categories>` send a ``GET`` request to  ``/api/categories/:id/products/``::

  GET /api/categories/166/products/
  

---------------------------------
Pagination, Sorting and Filtering
---------------------------------


Add these parameters to the path to specify which products will be returned in the response and how they will be organized.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Default value** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/products/`` is a page with a limited number of products. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   "Elements per page" value
        -   Determines the number of products on a page.
    *   -   sort_by
        -   ``product``
        -   Determines the parameter by which the products are sorted in the response:
            ``date``,
            ``status``,
            ``list_price``,
            ``product``,
            ``price``,
            ``code``,
            ``amount``
    *   -   sort_order
        -   ``asc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   list_price
        -   | 
        -   List price—searches products with a specific "List price". If a product has a higher list price than price, then the difference will be considered a discount.
    *   -   price
        -   | 
        -   Price—searches only base product price in your store’s primary currency. 
    *   -   product
        -   | 
        -   Product name—searches the name of the product as it appears on the storefront and in the Administration panel. 
    *   -   code
        -   | 
        -   Product code—a **sorting** parameter that searches the identifier of the product that you use in your store.
    *   -   amount
        -   | 
        -   In stock—searches the number of products in the stock.
    *   -   pname
        -   | 
        -   Product name—searches the name of the product as it appears on the storefront and in the Administration panel.
    *   -   pshort
        -   | 
        -   Searches a short product description which appears on the product list on the storefront.
    *   -   pfull
        -   | 
        -   Searches for products with a specific word or a part of phrase in their "Full description". 
    *   -   pkeywords
        -   | 
        -   Meta keywords—searches for a list of search keywords that appear on the product page.
    *   -   pcode
        -   | 
        -   A parameter used to **filter** the identifier of the product that you use in your store.
    *   -   cid
        -   | 
        -   A parameter used to **filter** the categories that the product will be assigned to. 
    *   -   subcats
        -   | 
        -   | Include subcategories of the given category (the ``cid`` filter must be used) in the search scope:
            | ``Y``—Yes
            | ``N``—No
    *   -   amount_from
        -   | 
        -   Searches only for products that have an equal or lower "amount" (product quantity).
    *   -   amount_to
        -   | 
        -   Searches only for products that have an equal or higher "amount" (product quantity).
    *   -   price_from
        -   | 
        -   Searches only for products that have an equal or higher "Price".
    *   -   price_to
        -   | 
        -   Searches only for products that have an equal or lower "Price".
    *   -   order_ids
        -   | 
        -   | Comma-separated list of of the order IDs to search the products in:
            ``1,13,24``
    *   -   free_shipping
        -   | 
        -   | Searches only for Products with enabled or disabled Free shipping.
            | ``Y``—Yes
            | ``N``—No
    *   -   status
        -   | 
        -   | Searches for product with statuses:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
    *   -   age_limit
        -   | 
        -   Searches for products with the specified age limit only.
    *   -   age_verification
        -   | 
        -   | Searches for products with the age verification and allows to filter them based on the values:
            | ``Y``—Enabled
            | ``N``—Disabled
    *   -   age_warning_message
        -   | 
        -   Searches for products with a specific age warning message.
    *   -   product_type
        -   | 
        -   | Filters products:
            | ``P``—a Product which appears on the storefront as separate products 
            | ``V``—a main Product Variation which appears on the storefront as one product 
    *   -   is_returnable
        -   | 
        -   | Searches only for returnable or non-returnable products.
            | ``Y``—The product is labeled as available for the return.
            | ``N``—The product is not available for the return.



Examples
--------

.. list-table::
    :stub-columns: 1
    :widths: 5 15
    
    *   -   Store Builder
        -   Send a GET request to ``/api/stores/<company_id>/products/``
    *   -   Multi-Vendor
        -   Send a GET request to ``api/vendors/<vendor_id>/products``
    

*   ``GET /api/stores/1/products?price_from=10&sort_by=product&sort_order=asc&pname=foo``

    Response is an array of all products of the 1st store, with 'foo' in their full description, costing over $10, and sorting by product name from A to Z.


*   ``GET /api/vendors/1/products?page=5&items_per_page=20``

    Response is an array of 20 products of a particular vendor from the 5th Products page.
    
*   ``GET api/products?sort_by=amount&sort_order=desc``

    Response is an array of all products sorted by quantity in a descending order.

---------------
Response Format
---------------

Let's make a test request::

    GET /api/products?items_per_page=2

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
                    "image_path": "https://example.com/stores/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "alt": "",
                    "image_x": "500",
                    "image_y": "500",
                    "http_image_path": "http://example.com/stores/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "https_image_path": "https://example.com.com/stores/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
                    "absolute_path": "/srv/projects/example.com/web/stores/images/detailed/0/173283_0113298267324f438bac97eaf.jpg",
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
                                    "image_path": "https://example.com/stores/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "alt": "",
                                    "image_x": "200",
                                    "image_y": "133",
                                    "http_image_path": "http://example.com/stores/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "https_image_path": "https://example.com/stores/images/feature_variant/1/Adidas_Logo.svg.png",
                                    "absolute_path": "/srv/projects/example.com/web/stores/images/feature_variant/1/Adidas_Logo.svg.png",
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
                    "image_path": "https://example.com/stores/images/detailed/0/Z6595.jpg",
                    "alt": "",
                    "image_x": "510",
                    "image_y": "680",
                    "http_image_path": "http://example.com/stores/images/detailed/0/Z6595.jpg",
                    "https_image_path": "https://example.com/stores/images/detailed/0/Z6595.jpg",
                    "absolute_path": "/srv/projects/example.com/web/stores/images/detailed/0/Z6595.jpg",
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

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30

    *   -   Field name
        -   Values
        -   Description
    *   -   product
        -   string
        -   Product name
    *   -   category_ids
        -   Array of valid category IDs
        -   IDs of the categories to which the product belongs
    *   -   main_category
        -   Existing category ID
        -   ID of the main category
    *   -   price
        -   float
        -   The base product price in your store’s primary currency 
    *   -   company_id
        -   integer
        -   ID of the store or vendor the product belongs to
    *   -   status
        -   | ``A``
            | ``D``
            | ``H``
        -   | Product status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
    *   -   amount
        -   integer
        -   The number of products in the stock
    *   -   avail_since
        -   Date in UNIX format
        -   Date from which the product is available
    *   -   box_height
        -   integer
        -   Box height
    *   -   box_length
        -   integer
        -   Box length
    *   -   box_width
        -   integer
        -   Box width
    *   -   details_layout
        -   Valid product template name
        -   Product details page layout
    *   -   edp_shipping
        -   | ``Y``
            | ``N``
        -   Only for a downloadable product: Enable/disable shipping
    *   -   exceptions_type
        -   | ``A``
            | ``F``
        -   Exception type (``A``\ llow/ ``F``\ orbid products with certain option combinations)
    *   -   free_shipping
        -   | ``Y``
            | ``N``
        -   Determines if the Free shipping is allowed
    *   -   full_description
        -   string
        -   Full product description
    *   -   image_pairs
        -   object with image pair ID as key and image pair as value (see :ref:`below <main-pair>`)
        -   Additional image pairs
    *   -   is_edp
        -   | ``Y``
            | ``N``
        -   Determines if the product is downloadable or not
    *   -   lang_code
        -   | ``en``
            | etc.
        -   Language code
    *   -   list_price
        -   float
        -   Manufacturer suggested price
    *   -   list_qty_count
        -   integer
        -   Number of items in the quantity select box
    *   -   localization
        -   string
        -   String of comma-separated localization IDs
    *   -   low_avail_limit
        -   integer
        -   Minimal availability in stock value
    *   -   main_pair
        -   Main pair object
        -   Product image and thumbnail pair
    *   -   max_items_in_box
        -   integer
        -   Maximal number of items per box
    *   -   max_qty
        -   integer
        -   Maximal order quantity
    *   -   meta_description
        -   string
        -   Meta description
    *   -   meta_keywords
        -   string
        -   Meta keywords
    *   -   min_items_in_box
        -   integer
        -   Minimal number of items per box
    *   -   min_qty
        -   integer
        -   Minimal order quantity
    *   -   options_type
        -   | ``S``
            | ``P``
        -   Apply options simultaneously (``P``) or sequentially (``S``)
    *   -   out_of_stock_actions
        -   | ``N``
            | ``B``
            | ``S``
        -   | Out of stock action:
            | ``N`` for None
            | ``B`` for Buy in advance
            | ``S`` for Sign up for notification
    *   -   page_title
        -   string
        -   Product page title
    *   -   point_price
        -   float
        -   Price in reward points
    *   -   popularity
        -   integer
        -   Product popularity rating based on views, adding to cart, and purchases
    *   -   product_code
        -   string
        -   Product code
    *   -   product_features
        -   object that contains :doc:`product features <product_features>` with feature ID as key and feature data as value
        -   Product features
    *   -   product_id
        -   integer
        -   Product ID
    *   -   promo_text
        -   string
        -   Promo text that appears on the product page on the storefront 
    *   -   qty_step
        -   integer
        -   Quantity step
    *   -   return_period
        -   integer
        -   Return period in days
    *   -   sales_amount
        -   integer
        -   Sales amount
    *   -   search_words
        -   string
        -   Search keywords for the product
    *   -   seo_name
        -   string
        -   SEO name for the product page
    *   -   shared_product
        -   | ``Y``
            | ``N``
        -   Only for the Store Builder Ultimate: determines if the Product is shared on storefronts
    *   -   shipping_freight
        -   float
        -   Shipping freight
    *   -   shipping_params
        -   string
        -   Aggregated shipping data
    *   -   short_description
        -   string
        -   Short description
    *   -   tax_ids
        -   array
        -   Array of tax IDs which are selected for the Product
    *   -   timestamp
        -   Valid timestamp in UNIX format
        -   Creation timestamp
    *   -   tracking
        -   | ``B``
            | ``D``
        -   | Inventory tracking mode
            | ``B`` for "Track" 
            | ``D`` for "Do not track"
    *   -   unlimited_download
        -   | ``Y``
            | ``N``
        -   For EDP (downloadable products): determines if a product can be downloaded a limited number of times (N), or as many times as needed (Y)
    *   -   updated_timestamp
        -   Valid timestamp in UNIX format
        -   Last update timestamp
    *   -   usergroup_ids
        -   String of comma-separated user group IDs
        -   IDs of user groups that can see this product
    *   -   weight
        -   float
        -   Weight
    *   -   zero_price_action
        -   | ``R``
            | ``P``
            | ``A``
        -   | Zero price action
            | ``R`` for "Do not allow customers to add product to cart"
            | ``P`` for "Allow customers to add product to cart"
            | ``A`` for "Ask customer to enter the price"
  

.. _main-pair:


Product Images (Pairs)
----------------------

A pair of the full product image and (optionally) a thumbnail.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 10 30

    *   -   Field name
        -   Values
        -   Description
    *   -   detailed_id
        -   integer
        -   ID of the full image
    *   -   image_id
        -   integer
        -   ID of the thumbnail
    *   -   pair_id
        -   integer
        -   ID of the image pair
    *   -   position
        -   integer
        -   Position of the image pair among others
    *   -   icon
        -   object (similar to ``detailed``)
        -   Thumbnail data
    *   -   detailed
        -   object
        -    Full image data
    *   -   absolute_path
        -   Valid filesystem path
        -   Absolute filesystem path to the image
    *   -   alt
        -   string
        -   Alternative text (show if the image fails to load)
    *   -   http_image_path
        -   Valid HTTP URL pointing to the image
        -   HTTP path to the image
    *   -   image_path
        -   Valid URL pointing to the image
        -   Actual image path (HTTP or HTTPS; may be the same as ``http_image_path``)
    *   -   image_x
        -   integer
        -   Image width in pixels
    *   -   image_y
        -   integer
        -   Image height in pixels
  
---------------
Response Format
---------------

Let's make a test request::

    GET request to /api/products/12

The response is JSON with the following data:

::

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
    }




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


To create a new product, send a ``POST`` request with required fields in JSON:  ``category_ids``, ``product``.

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

:doc:`Vendors <vendors>` are independent companies that sell their own products in your marketplace. To create a product for a specific Vendor you will need to add their **vendor_id** in a request.
 
Send a POST request to   ``api/vendors/1/products``::

    {
    "product": "Vendor's Product Name",
    "category_ids": "166",
    "price": "1000"
    }
    
This request creates a product for the Vendor with a ``vendor_id=1`` and minimum Product Details.

--------------------------------------------
Example JSON: Create a Product with Images
--------------------------------------------

.. important::
    To add several additional images, specify them in the ``image_pairs`` parameter before the ``main_pair`` parameter, unless the main product image will be replaced.




::

    {
    "product": "Product Name",
    "category_ids": "166",
    "price": "1000",
    "image_pairs":
    {
            "object_type": "product",
            "detailed": {
                "object_type": "product",
                "type": "A",
                "absolute_path": "/srv/projects/example.com/images/detailed/additional_image1.jpg", // Absolute filesystem path to the image
                "alt": "This is where the alt text for the image goes.",
            },
            {
            "object_type": "product",
            "detailed": {
                "object_type": "product",
                "type": "A",
                "alt": "This is where the alt text for the image goes.",
                "relative_path": "detailed/0/additional_image2.jpg" // Relative filesystem path to the image
            }
        },
    "main_pair": {
        "object_type": "product",
        "detailed": {
            "object_type": "product",
            "type": "M",
            "image_path": "https://example.com/images/detailed/main_image.jpg", // Valid URL pointing to the image
            "alt": "This is where the alt text for the image goes."
        }
    }
    }


This request creates a product with a price, the *Active* status, a main and 2 additional images. Images must be already uploaded on your server, or available somewhere on the Internet.
    
It this example we have uploaded 3 images:

* The main_image.jpg in the **main_pair** parameter is the main product image. It was uploaded from with the **image_path** parameter, which means it is added with a URL from the Internet.
* The additional_image1.jpg  is the additional image of a product. It was uploaded on the server via FTP. The path to the image is specified in the **absolute_path** parameter of the **detailed** object.
* The additional_image2.jpg is also an additional image, but it was uploaded in the Files section in the Admin panel. That's why it can be specified in the **relative_path** parameter.




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

This request updates the Product Name, the List Price, the Price, and the Quantity of the particular Product.


------------------------------------
Example JSON: Update a Product Image
------------------------------------

::

    "image_pairs":
    {
        "6759": {
            "pair_id": "6759",
            "image_id": "0",
            "detailed_id": "8665",
            "position": "1",
            "object_id": "180",
            "object_type": "product",
            "detailed": {
                "object_id": "180",
                "object_type": "product",
                "type": "A",
                "image_path": "https://example.com/images/detailed/0/additional_image.jpg", // Valid URL pointing to the image
                "alt": "This is where the alt text for the image goes.",
                "image_x": "600",
                "image_y": "396",
                "absolute_path": "/srv/projects/example.com/images/detailed/0/additional_image.jpg", // Absolute filesystem path to the image
                "relative_path": "detailed/0/additional_image.jpg",
            }
        }
        },
    "main_pair": {
        "pair_id": "650",
        "image_id": "0",
        "detailed_id": "706",
        "position": "0",
        "object_id": "180",
        "object_type": "product",
        "detailed": {
            "object_id": "180",
            "object_type": "product",
            "type": "M",
            "image_path": "https://example.com/stores/images/detailed/0/main_image.jpg", // Valid URL pointing to the image
            "alt": "This is where the alt text for the image goes.",
            "image_x": "600",
            "image_y": "600",
            "absolute_path": "/srv/projects/example.com/web/stores/images/detailed/0/main_image.jpg", // Absolute filesystem path to the image
            "relative_path": "detailed/0/main_image.jpg",
        }
    }


.. important::
    To add several additional images, specify them in the ``image_pairs`` parameter before the ``main_pair`` parameter, unless the main product image will be replaced.
    
This request updates the Main image and the Additional image of the particular Product. It replaces the already existent images of the product with new ones. Images can be updated separately: for example, to update the additional image, you will need to specify the corresponding field - **image_pairs**. The image of the product can be uploaded on your server or added with URL. 
  
* To specify the image uploaded to your server, use the **absolute_path** parameter of the **detailed** object. 
* To specify the image hosted on another server, use the **image_url** parameter of the **detailed** object.
* To create a product with the main image, use the **main_pair** object.
* To add the additional image of the product, use the **image_pairs** object.


-----------------------------------------------
Example JSON: Update a Product to Add a Feature
-----------------------------------------------

To add an existing :doc:`Product Feature <product_features>` to a product, send a ``PUT`` request to ``api/products/<product_id>``::


    {
    "product_features":
    {
        "18":
        {
            "feature_id": "18",
            "variant_id": "86",
            "variants":
            {
                "86":
                {
                    "variant_id": "86",
                    "variant": "Adidas"
                }
            }
        }
    }
    }

This request adds the existing feature Brand with ``feature_id=18`` and a feature variant Adidas with ``variant_id=86`` to the product. 


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

