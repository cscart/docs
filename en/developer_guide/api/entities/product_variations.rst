******************
Product Variations
******************

.. note::

    This entity first appeared in **CS-Cart & Multi-Vendor 4.6.1** as a part of the :doc:`Product Variations (Beta) </user_guide/addons/product_variations/index>` add-on. The add-on must be installed and active, or you won't be able to use this entity.

:doc:`Product variations </user_guide/manage_products/products/product_variations>` are a way to group some specific :doc:`option variants <options>`. For example, let’s assume that you sell T-shirts. They come in 3 colors (red, green, blue) and 3 sizes (small, medium, large). In this case *T-shirt* would be a product, and *large blue T-shirt* would be one of the product variations.

When you create a product, you decide whether that product will have variations or :doc:`option combinations <combinations>`. Variations and combinations look similar on the storefront, but :doc:`variations can be configured to a greater extent in the Administration panel </user_guide/manage_products/products/simple_versus_configurable>`.

.. contents::
   :backlinks: none
   :local:

.. important::

    The **Product Variations** add-on is currently in the beta stage. The article describes how the REST API works now, but the add-on and the way how variations are handled by the REST API may change in future versions.

===========================
List All Product Variations
===========================

To get a list of product variations, send a GET request to ``/api/product_variations/``::

  GET /api/product_variations/

This request returns 10 variations with their details.

----------------------------------
Pagination, Sorting, and Filtering
----------------------------------

Add these parameters to the path to specify what variations will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/product_variations/`` is one of the many pages with a limited number of variations. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines how many product variations appear on a page.
    *   -   sort_by
        -   ``product``
        -   Determines the parameter by which the variations are sorted in the response.
    *   -   sort_order
        -   ``desc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   status
        -   
        -   | Searches only for the variations with the specified status: 
            | ``A``—active
            | ``H``—hidden
            | ``D``—disabled
    *   -   company_id
        -   
        -   Searches only for the variations that belong to specific storefront (in CS-Cart) or vendor (in Multi-Vendor).
    *   -   parent_product_id
        -   
        -   Searches only for the variations of the product with the specified identifier.


.. note::

    :ref:`The filtering rules from the "products" entity <api-products-filtering>` apply to product variations as well.

**Examples:**

* ``GET /api/product_variations/?page=2&items_per_page=5``

  Response is an array with 5 variations from the 2nd page of the list of product variations.

* ``GET /api/product_variations/?parent_product_id=249&status=D``

  Response is an array with 10 disabled variations of product with ``product_id=249``.

* ``GET /api/product_variations/?pname=Y&pfull=Y&pshort=Y&q=red``

  Response is an array of 10 variations that have ``red`` in their names, full descriptions, or short descriptions.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/product_variations/?items_per_page=1

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
      "products": [
          {
              "product_id": "251",
              "product": "T-shirt, Size: Medium, Color: Blue",
              "product_code": "TS-M-B",
              "product_type": "V",
              "status": "A",
              "company_id": "1",
              "list_price": "0.00",
              "amount": "8",
              "weight": "0.000",
              "length": "0",
              "width": "0",
              "height": "0",
              "shipping_freight": "0.00",
              "low_avail_limit": "0",
              "timestamp": "1497426528",
              "updated_timestamp": "1497426586",
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
              "tax_ids": "",
              "age_verification": "N",
              "age_limit": "0",
              "options_type": "P",
              "exceptions_type": "F",
              "details_layout": "default",
              "shipping_params": "a:5:{s:16:\"min_items_in_box\";i:0;s:16:\"max_items_in_box\";i:0;s:10:\"box_length\";i:0;s:9:\"box_width\";i:0;s:10:\"box_height\";i:0;}",
              "facebook_obj_type": "activity",
              "buy_now_url": "",
              "parent_product_id": "249",
              "variation_code": "249_181_185",
              "variation_options": "{\"27\":\"185\",\"26\":\"181\"}",
              "price": "28.000000",
              "seo_name": "t-shirt-size-medium-color-blue",
              "seo_path": "",
              "main_pair": {
                  "pair_id": "1152",
                  "image_id": "0",
                  "detailed_id": "1397",
                  "position": "0",
                  "detailed": {
                      "object_id": "251",
                      "object_type": "product",
                      "image_path": "http://example.com/images/detailed/1/Blue_Tshirt.jpg",
                      "alt": "",
                      "image_x": "350",
                      "image_y": "350",
                      "http_image_path": "http://example.com/images/detailed/1/Blue_Tshirt.jpg",
                      "https_image_path": "https://example.com/images/detailed/1/Blue_Tshirt.jpg",
                      "absolute_path": "/var/www/html/images/detailed/1/Blue_Tshirt.jpg",
                      "relative_path": "detailed/1/Blue_Tshirt.jpg"
                  }
              },
              "image_pairs": {
                  "1153": {
                      "pair_id": "1153",
                      "image_id": "0",
                      "detailed_id": "1398",
                      "position": "0",
                      "detailed": {
                          "object_id": "251",
                          "object_type": "product",
                          "image_path": "http://example.com/images/detailed/1/Blue_Tshirt_umyg-y1.jpg",
                          "alt": "",
                          "image_x": "350",
                          "image_y": "350",
                          "http_image_path": "http://example.com/images/detailed/1/Blue_Tshirt_umyg-y1.jpg",
                          "https_image_path": "https://example.com/images/detailed/1/Blue_Tshirt_umyg-y1.jpg",
                          "absolute_path": "/var/www/html/images/detailed/1/Blue_Tshirt_umyg-y1.jpg",
                          "relative_path": "detailed/1/Blue_Tshirt_umyg-y1.jpg"
                      }
                  }
              },
              "base_price": "28.000000",
              "selected_options": [],
              "has_options": false,
              "product_options": [],
              "discounts": {
                  "A": 0,
                  "P": 0
              },
              "product_features": [],
              "qty_content": []
          }
      ],
      "params": {
          "area": "A",
          "use_caching": true,
          "extend": [
              "product_name",
              "prices",
              "categories",
              "categories"
          ],
          "custom_extend": [],
          "pname": "",
          "pshort": "",
          "pfull": "",
          "pkeywords": "",
          "feature": [],
          "type": "simple",
          "page": 1,
          "action": "",
          "filter_variants": [],
          "features_hash": "",
          "limit": 0,
          "bid": 0,
          "match": "",
          "tracking": [],
          "get_frontend_urls": false,
          "items_per_page": 1,
          "apply_disabled_filters": "",
          "ajax_custom": "1",
          "product_type": [
              "V"
          ],
          "parent_product_id": [],
          "variation_code": null,
          "sort_by": "product",
          "sort_order": "asc",
          "sort_order_rev": "desc",
          "total_items": "4"
      }
  }

========================
Get a Specific Variation
========================

To get the details of a specific product variation, send a GET request to ``/api/product_variations/<product_id>/``. For example::

  GET /api/product_variations/251

.. note::

    Basically, variations are products. That's why if you pass an ID of a product (not a variation), the details of that product will be returned.

---------------
Response Format
---------------

* The product or variation exists: **HTTP/1.1 200 OK** and JSON with details.

* The product or variation doesn't exist: **HTTP/1.1 404 Not Found**.

-------------------------
Product Variation Details
-------------------------

Most of the details of a product variation are similar to the details of a product. That's why in this article we'll only be describing the details that are associated with the **Product Variations** add-on. For the description of other details, please refer to :ref:`the article about the "products" entity <api-products-fields>`.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   product_type
        -   *string*
        -   | The type of the product:
            | ``P``—a simple product that can have option combinations, but not variations.
            | ``C``—a configurable product that can have variations, but not option combinations.
            | ``V``—a product variation.
    *   -   parent_product_id
        -   *integer*
        -   The identifier of the configurable product that serves as a parent product for this variation.
    *   -   variation_code
        -   *string*
        -   The unique code of the variation that consists of identifiers of the parent product and all the option variants that comprise the product variation: ``[parent_product_id]_[variant_id_for_option_1]_[variant_id_for_option_2]``. For example: ``249_181_185``.
    *   -   variation_options
        -   *object*
        -   The identifiers of options and variants that comprise the variation. For example: ``{\"27\":\"185\",\"26\":\"182\"}``.

==================
Create a Variation
==================

To create a product variation, send a POST request to ``/api/product_variations/``.

Pass the following fields with variation details in the HTTP request body in accordance with the ``Content-Type``. All these fields are required:

* **product**—the name of the product variation as it appears on the storefront and in the Administration panel.

* **price**—the price of the product variation in the primary currency of your store.

* **parent_product_id**—the identifier of the parent product of the variation.  Variations are supposed to belong to the same category as their parent product. If a parent product is moved to another category, its variations are also moved to that category.

* **variation_options**—the options and variants that comprise a variation::

    "variation_options": {
        "27":"183",
        "26":"184"
    }

.. note::

    Basically, variations are products. That's why you can refer to :ref:`the article about the "products" entity <api-products-fields>` to learn more about other fields.

------------
Example JSON
------------

::

  {
    "product": "T-shirt, Color: Red, Size: Small",
    "price": "33",
    "parent_product_id": "249",
    "variation_options": {
        "27":"183",
        "26":"184"
    }
  }

This request creates a new variation of the product with ``product_id=249``. This variation consists of:

* Variant 184 of option 26.

* Variant 183 of option 27.

.. hint::

    Learn more about :doc:`working with options via REST API <options>`.

---------------
Response Format
---------------

* The product variation has been created successfully: **HTTP/1.1 201 Created** and the product ID::

    {
     "product_id": "254"
    }

* The product variation couldn’t be created: **HTTP/1.1 400 Bad Request**.

==================
Update a Variation
==================

To update an existing product variation, send the PUT request to ``/api/product_variations/<product_id>/``. For example::

  PUT /api/product_variations/254

Pass the fields with variation details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

------------
Example JSON 
------------

::

  {
    "amount": "10",
    "main_pair": {
        "detailed": {
            "image_path":"http://example.com/var/files/1/exim/backup/images/red_tshirt.jpg"
        }
    },
    "image_pairs": {
    	"1": {
            "detailed": {
                "image_path":"http://example.com/var/files/1/exim/backup/images/red_tshirt_back.jpg"
            }
    	},
    	"2": {
            "detailed": {
                "image_path":"http://example.com/var/files/1/exim/backup/images/red_tshirt_angle.jpg"
            }
    	}       
    }
  }


This request:

* sets the number of items in stock to *10*;

* loads the image from *http://example.com/var/files/1/exim/backup/images/red_tshirt.jpg* and makes it the main image of the variation;

* loads additional images for the variation from:

  * *http://example.com/var/files/1/exim/backup/images/red_tshirt_back.jpg*

  * *http://example.com/var/files/1/exim/backup/images/red_tshirt_angle.jpg*

---------------
Response Format
---------------

* The product or variation has been updated successfully: **HTTP/1.1 200 OK** and the product ID::

    {
     "product_id": "254"
    }

* The product or variation couldn’t be updated: **HTTP/1.1 400 Bad Request**.

* The product or variation doesn’t exist: **HTTP/1.1 404 Not Found**.

==================
Delete a Variation
==================

To delete a product variation, send the DELETE request to ``/api/product_variations/<product_id>/``. For example::

  DELETE /api/product_variations/254/

This request will delete a product or variation with ``product_id=254``.

---------------
Response Format
---------------

* The product or variation has been deleted successfully: **HTTP/1.1 204 No Content**.

* The product or variation couldn’t be deleted: **HTTP/1.1 400 Bad Request**.
 
* The product or variation doesn’t exist: **HTTP/1.1 404 Not Found**.
