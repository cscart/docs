********
Products
********

URLs
====

*   http://example.com/api/**products**—refer to all products. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**products/:id**—refer to a particular product. ``GET``, ``PUT``, and ``DELETE`` are supported.
*   http://example.com/api/**categories/:id/products**—refer to all products of a particular :doc:`category <categories>`.
*   http://example.com/api/**categories/:id/products/:id**—refer to a particular product in a particular category.

Nested Objects
==============

*   :doc:`Product Features <product_features>`


.. _api-products-filtering:

Filtering
=========

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

*   ``filter`` is one of the available :ref:`filters <filters>`. It is possible to use any number of filters at a time by appending the URL with ``&<another_filter>=Y``

*   ``additional_param`` is one of the available :ref:`additional params <additional-params>`. It is possible to use any number of additional params at a time by appending the URL with ``&<another_param>=<value>``

*   ``sorting`` is one of the available :ref:`sortings <sorting>`

*   ``sort_order`` is the sort direction; ``asc`` or ``desc`` for ascending and descending accordingly

*   ``query`` is the search query

In order to get results referring only to a particular store in CS-Cart Ultimate or vendor in CS-Cart Multi-Vendor, use the ``stores`` and ``vendors`` entity respectfully:

    http://example.com/api/stores/1/products

    http://example.com/api/vendors/1/products

Example
-------

Get all products of the 1st store, with 'foo' in their full description, costing over $10, and sort the result by product name from A to Z:

.. code-block:: bash

    curl --user admin@example.com:APIkey -X GET 'http://example.com/api/store/1/products?pfull=Y&price_from=10&sort_by=product&sort_order=asc&q=foo'

.. _filters:

Filters
-------

Available ``filter`` attribute values:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Filter
        -   Description
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

.. _additional-params:

Additional Params
-----------------

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

.. _sorting:

Sorting
-------

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Sort param
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

It is possible to set the sort order by defining the ``sort_order`` URL param to ``asc`` or ``desc``.

Pagination
----------

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

**Examples:**

*   *http://example.com/api/products?page=5*

Response is an array with 10 products from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/products?items_per_page=20*

Response is an array with 20 products from the first page.

*   *http://example.com/api/products?page=5&items_per_page=20*

Response is an array with 20 products from the 5th page.

Fields
======

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
        -   array with image pair ID as key and image pair as value (see :ref:`below <main-pair>`)
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
        -   Manufactorer suggested price
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
        -   Main pair array (see :ref:`below <main-pair>`)
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
        -   Apply options simultaneously (``P``) of sequentially (``S``)
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
        -   array of :doc:`product features <product_features>` with feature ID as key and feature data as value
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
            | ``O`` for Track with options
            | ``B`` for Track without options
            | ``D`` for Do not track

        -   ``B``
        -   | ``O``
            | ``B``
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

.. only:: addons

    Addons
    ------

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

.. _main-pair:

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
        -   array (similar to ``detailed``, see below)
    *   -   detailed
        -   Full image data
        -   —
        -   array (content explained below)
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
