*******************
Option Combinations
*******************

:doc:`Product options <options>` in CS-Cart and Multi-Vendor can be grouped in **option combinations**—this is useful for tracking products. For example, clothes come in various colors and sizes. It’s convenient to track separately, how many blue XL T-shirts and white M T-shirts you have. You can also separate code and image for the combination.

.. important::

    A product option must have the **Inventory** checkbox ticked (``inventory=Y``) to be a part of the combination. Only the options of the *Checkbox*, *Select box*, and *Radiogroup* type have that checkbox.

=====================================
View Option Combinations of a Product
=====================================

To view the option combination of a specific product, send a GET request to ``/api/combinations/?product_id=:id``. For example::

  GET /api/combinations/?product_id=12

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with all the option combinations of the product.

----------
Pagination
----------

Add these parameters to the path to specify what how many option combinations should be returned in the response:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Values
        -   Description
    *   -   items_per_page
        -   *integer*
        -   This parameter separates the list of option combinations into pages. It also limits the number of the option combinations that you receive in the response.
    *   -   Parameter
        -   *integer*
        -   This parameter works only if you specify ``items_per_page``. It determines the number of the page that will be sent in the response. 

**Example:**

::

  GET /api/combinations/?product_id=12&items_per_page=2&page=3

Response is an array with 2 option combinations of the product with ``product_id=12`` from the 3rd page.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/combinations/?product_id=12&items_per_page=2

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  [
   {
    "product_id": "12",
    "product_code": "",
    "combination_hash": "822274303",
    "combination": {
          "3": "12",
          "4": "17"
    },
    "amount": "50",
    "temp": "N",
    "position": "0",
    "image_pairs": {
          "pair_id": "808",
          "image_id": "0",
          "detailed_id": "864",
          "position": "0",
          "detailed": {
              "object_id": "822274303",
              "object_type": "product_option",
              "image_path": "http://localhost/images/detailed/0/173283_01.jpg",
              "alt": "",
              "image_x": "500",
              "image_y": "500",
              "http_image_path": "http://localhost/images/detailed/0/173283_01.jpg",
              "https_image_path": "https://localhost/images/detailed/0/173283_01.jpg",
              "absolute_path": "/var/www/html/images/detailed/0/173283_01.jpg",
              "relative_path": "detailed/0/173283_01.jpg"
          }
    }
   },
   {
    "product_id": "12",
    "product_code": "",
    "combination_hash": "2310967194",
    "combination": {
          "3": "13",
          "4": "17"
    },
    "amount": "50",
    "temp": "N",
    "position": "1",
    "image_pairs": {
          "pair_id": "809",
          "image_id": "0",
          "detailed_id": "865",
          "position": "0",
          "detailed": {
              "object_id": "2310967194",
              "object_type": "product_option",
              "image_path": "http://localhost/images/detailed/0/173283_0113298248354f43844356dc9.jpg",
              "alt": "",
              "image_x": "500",
              "image_y": "500",
              "http_image_path": "http://localhost/images/detailed/0/173283_0113298248354f43844356dc9.jpg",
              "https_image_path": "https://localhost/images/detailed/0/173283_0113298248354f43844356dc9.jpg",
              "absolute_path": "/var/www/html/images/detailed/0/173283_0113298248354f43844356dc9.jpg",
              "relative_path": "detailed/0/173283_0113298248354f43844356dc9.jpg"
          }
    }
   }
  ]

==================================
View a Specific Option Combination
==================================

To view a specific option combination, send a GET request to ``/api/combinations/<combination_hash>``. For example::

  GET /api/combinations/822274303

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the details of the option combination.

--------------------------
Option Combination Details
--------------------------

The fields below represent various details of an option combination.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Values
        -   Description
    *   -   product_id
        -   *integer*
        -   The unique identifier of the product that the option combination is associated with.
    *   -   product_code
        -   *integer*
        -   The product code of the option combination.
    *   -   combination_hash
        -   *integer*
        -   The hash of the option combination.
    *   -   combination
        -   *array*
        -   The array with the information about options and variants that comprise the combination.
    *   -   amount
        -   *integer*
        -   Determines how many items of this combination are in stock.
    *   -   position
        -   *integer*
        -   The lower this number, the higher the option combination appears on the list in the Administration panel.
    *   -   image_pairs
        -   *array*
        -   The array with the information about the image of the option combination.


============================
Create an Option Combination
============================

To create an option combination, send a POST request to ``/api/combinations/``.

Pass the fields with the option combination details in the HTTP request body in accordance with the passed ``Content-Type``. Required fields are marked with *****:

* **product_id***—the unique identifier of the product that the option combination is associated with.

* **amount**—how many items of this combination are in stock.

  .. note::

      This parameter appears in the Administration panel only if the product is tracked with options.

* **position**—the lower this number, the higher the option combination appears on the list in the Administration panel.

* **combination**—the array with the information about options and variants that comprise the combination.

  .. important::

    The options you specify in the combination array should be available for the product and should have ``inventory=Y``.

  You can’t set **image_pairs** or **product_code** with the POST request.

**Example JSON:**

::

  {
   "product_id": "4",
   "combination": {
       "24": "74",
       "25": "80",
       "26": "86"
   },
   "amount": "34",
   "position": "10"
  }

This request creates a new option combination for the product with ``product_id=4``. This combination consists of:

* Variant 74 of option 24
* Variant 80 of option 25
* Variant 86 of option 26

There are 34 items of this particular combination in stock.

If the option combination is created successfully, you will receive **HTTP/1.1 201 Created** and the combination hash in the response::

  {
   "combination_hash": "2822626827"
  }

If the option couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

==========================
Edit an Option Combination
==========================

To edit an existing option combination, send the PUT request to ``/api/combinations/<combination_hash>/``. For example::

  PUT /api/combinations/2822626827

Pass the fields with option combination details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

You can’t update the combination field directly with the PUT request.

**Example JSON:**

::

  {
   "product_code": "Product 34214",
   "amount": "42",
   "position": "0"
  }

This request modifies the product code of the option combination. It changes the amount of items in stock, the product code of the combination, and the position of the combination on the list.

============================
Delete an Option Combination
============================

To delete an option combination, send the DELETE request to ``/api/combinations/<combination_hash>?product_id=:id``.

.. note::

    Product ID is specified to check if the user has permission to delete this combination.

::

  DELETE /api/combinations/2822626827?product_id=4

This request deletes the specified option combination of the product. 

**Possible responses:**

* **HTTP/1.1 204 No Content**—the option combination has been deleted successfully.
* **HTTP/1.1 400 Bad Request**—the option combination couldn’t be deleted.
* **HTTP/1.1 404 Not Found**—the option combination doesn’t exist.

