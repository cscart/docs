*****
Carts
*****

.. important::

    This entity first appeared in **CS-Cart/Multi-Vendor 4.3.5.**

A customer adds a product to his/her cart before buying it. You can see the list of carts that haven’t been purchased in the Administration panel of your store under :doc:`Marketing →Abandoned/Live carts <../../../user_guide/marketing/abandoned_live_carts>`. Carts will appear there in two cases:

* A customer has added products to cart, but is still browsing the store.

* A customer added products to cart and then left the store without purchasing those products or removing them from cart.

.. contents::
   :backlinks: none
   :local:

==============
List All Carts
==============

To get a list of carts, send a GET request to ``/api/carts/``::

  GET /api/carts/

This request returns 10 carts with their details.

----------------------------------
Pagination, Sorting, and Filtering
----------------------------------

Add these parameters to the request path to specify what carts will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/carts/`` is a page with a limited number of carts. This parameter determines the number of the carts that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of carts on a page.
    *   -   sort_by
        -   ``name``
        -   Sort carts by ``customer`` or ``date``.
    *   -   sort_order
        -   ``desc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   cname
        -   
        -   | Filter carts by the name of the user. You don’t have to use full names—sequences of letters from any part of the first name/last name are enough. 
            |
            | For example, if you use ``cname=do``, you’ll find carts that belong to *John Doe*, *Dorian Gray*, etc.
    *   -   email
        -   
        -   Show only the cart that belongs to the user with the specified email.
    *   -   user_id
        -   
        -   Show only the cart that belongs to the user with the specified user ID.
    *   -   with_info_only
        -   ``false``
        -   Set this to ``true``, and the response will include only the carts that belong to the users who provided contact information.
    *   -   users_type
        -   
        -   | Show only the carts that belong to users of the specified type. Possible values: 
            | ``R``—registered users.
            | ``G``—guests.
    *   -   total_from
        -   
        -   Hide the carts with the total lower than specified here.
    *   -   total_to
        -   
        -   Hide the carts with the total higher than specified here.
    *   -   product_type_c
        -   ``false``
        -   Set this to ``true``, and the response will include only those users who have something in their carts.
    *   -   product_type_w
        -   ``false``
        -   Set this to ``true``, and the response will include only those users who have something on their wishlist.
    *   -   period
        -   
        -   | Filter carts by time period:
            | ``A``—all the time 
            | ``D``—today
            | ``LD``—previous day
            | ``W``—current week
            | ``LW``—last week
            | ``M``—current month
            | ``LM``—last month
            | ``Y``—current year
            | ``LY``—last year
            | ``HH``—last 24 hours
            | ``HW``—last 7 days
            | ``HM``—last 30 days
            | ``C``—specified time period (use with the **time_from** and **time_to fields**)
    *   -   time_from
        -   
        -   Hide the carts that were created before the `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ specified here.
    *   -   time_to
        -   
        -   Hide the carts that were created after the `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ specified here.
    *   -   p_ids
        -   
        -   | Show carts with the specified product IDs. There are two ways to use **p_ids**:
            | 1. An array: ``p_ids[]=1&p_ids[]=2&p_ids[]=3`` 
            | 2. A string: ``p_ids=1,2,3,4,5``

**Examples:**

* ``http://example.com/api/carts/?items_per_page=20``

  Response is an array with 20 carts from the 1st page.

* ``http://example.com/api/carts/?page=5&items_per_page=20&period=D&user_type=G``

  Response is an array with 20 today’s guests’ carts by from the 5th page.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/carts/

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
   "carts": [
      {
       "user_id": "3810267128",
       "firstname": null,
       "lastname": null,
       "date": "1466409032",
       "ip_address": "127.0.0.1",
       "company_id": "1",
       "cart_products": "1",
       "total": "30.00",
       "order_id": null,
       "user_data": []
      },
      {
       "user_id": "3",
       "firstname": "John",
       "lastname": "Doe",
       "date": "1466409025",
       "ip_address": "127.0.0.1",
       "company_id": "1",
       "cart_products": "1",
       "total": "30.00",
       "order_id": null,
       "user_data": {
           "user_id": "3",
           "status": "A",
           "user_type": "C",
           "user_login": "customer",
           "referer": "",
           "is_root": "N",
           "company_id": "1",
           "last_login": "1466408989",
           "timestamp": "1466408289",
           "firstname": "John",
           "lastname": "Doe",
           "company": "Simtech",
           "email": "customer@example.com",
           "phone": "77 77 777 7777",
           "fax": "",
           "url": "",
           "tax_exempt": "N",
           "lang_code": "en",
           "birthday": "",
           "purchase_timestamp_from": "",
           "purchase_timestamp_to": "",
           "responsible_email": "",
           "janrain_identifier": "",
           "usergroups": [],
           "profile_id": "2",
           "profile_type": "P",
           "b_firstname": "John",
           "b_lastname": "Doe",
           "b_address": "44 Main street",
           "b_address_2": "",
           "b_city": "Boston",
           "b_county": "",
           "b_state": "MA",
           "b_country": "US",
           "b_zipcode": "02134",
           "b_phone": "",
           "s_firstname": "John",
           "s_lastname": "Doe",
           "s_address": "44 Main street",
           "s_address_2": "",
           "s_city": "Boston",
           "s_county": "",
           "s_state": "MA",
           "s_country": "US",
           "s_zipcode": "02134",
           "s_phone": "",
           "s_address_type": "",
           "profile_name": "Main",
           "fields": [],
           "b_country_descr": "United States",
           "s_country_descr": "United States",
           "b_state_descr": "Massachusetts",
           "s_state_descr": "Massachusetts",
           "points": 0
       }
   }
   ],
   "params": {
      "page": 1,
      "items_per_page": 10,
      "company_id": "1",
      "sort_order": "asc",
      "sort_by": "customer",
      "sort_order_rev": "desc",
      "total_items": "2"
   }
  }

===================
Get a Specific Cart
===================

To get the full list of details of a specific cart, send a GET request to ``/api/carts/<user_id>/``. For example::

  GET /api/carts/3

---------------
Response Format
---------------

* The cart exists: **HTTP/1.1 200 OK** and JSON with cart details::

    {
     "user_id": "3",
     "firstname": "John",
     "lastname": "Doe",
     "date": "1466521318",
     "ip_address": "127.0.0.1",
     "company_id": "1",
     "cart_products": "1",
     "total": "30.00",
     "order_id": null,
     "user_data": {
         "user_id": "3",
         "status": "A",
         "user_type": "C",
         "user_login": "customer",
         "referer": "",
         "is_root": "N",
         "company_id": "1",
         "last_login": "1466521090",
         "timestamp": "1466408289",
         "firstname": "John",
         "lastname": "Doe",
         "company": "Simtech",
         "email": "customer@example.com",
         "phone": "77 77 777 7777",
         "fax": "",
         "url": "",
         "tax_exempt": "N",
         "lang_code": "en",
         "birthday": "",
         "purchase_timestamp_from": "",
         "purchase_timestamp_to": "",
         "responsible_email": "",
         "janrain_identifier": "",
         "usergroups": [],
         "profile_id": "2",
         "profile_type": "P",
         "b_firstname": "John",
         "b_lastname": "Doe",
         "b_address": "44 Main street",
         "b_address_2": "",
         "b_city": "Boston",
         "b_county": "",
         "b_state": "MA",
         "b_country": "US",
         "b_zipcode": "02134",
         "b_phone": "",
         "s_firstname": "John",
         "s_lastname": "Doe",
         "s_address": "44 Main street",
         "s_address_2": "",
         "s_city": "Boston",
         "s_county": "",
         "s_state": "MA",
         "s_country": "US",
         "s_zipcode": "02134",
         "s_phone": "",
         "s_address_type": "",
         "profile_name": "Main",
         "fields": [],
         "b_country_descr": "United States",
         "s_country_descr": "United States",
         "b_state_descr": "Massachusetts",
         "s_state_descr": "Massachusetts",
         "points": 0
     },
     "products": [
         {
          "item_id": "822274303",
          "item_type": "P",
          "product_id": "12",
          "amount": "1",
          "price": "30.00",
          "extra": {
              "user_id": "3",
              "timestamp": "1466409025",
              "type": "C",
              "user_type": "R",
              "item_id": "822274303",
              "item_type": "P",
              "product_id": 12,
              "amount": 1,
              "price": 30,
              "session_id": "781d045d7ccfd9db6f55be14293b3f5f-1-C",
              "ip_address": "7f000001",
              "order_id": null,
              "company_id": "1",
              "product_code": "U0012O5AF0",
              "product": "100g Pants",
              "product_options": {
                  "3": "12",
                  "4": "17"
              },
              "stored_price": "N",
              "main_pair": {
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
              },
              "extra": {
                  "product_options": {
                       "3": "12",
                       "4": "17"
                  },
                  "unlimited_download": "N"
              },
              "stored_discount": null,
              "amount_total": 2,
              "options_type": "P",
              "exceptions_type": "F",
              "modifiers_price": 0,
              "is_edp": "N",
              "edp_shipping": "N",
              "discount": 0,
              "promotions": [],
              "base_price": 30,
              "category_ids": [
                  224
              ],
              "display_price": 30
          },
          "product": "100g Pants"
         }
     ]
    }

* The cart doesn’t exist: **HTTP/1.1 404 Not Found**.

------------
Cart Details
------------

The fields below represent various details of a cart.

.. note:: 

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   user_id
        -   *integer*
        -   A unique identifier of the cart owner.
    *   -   firstname
        -   *string*
        -   Cart owner’s first name.
    *   -   lastname
        -   *string*
        -   Cart owner’s last name.
    *   -   date
        -   *integer*
        -   The `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ when the cart was created.
    *   -   ip_address
        -   *integer*
        -   The IP address of the cart owner.
    *   -   company_id
        -   *integer*
        -   The ID of the :doc:`store <stores>` (in CS-Cart) or :doc:`vendor <vendors>` (in Multi-Vendor).
    *   -   cart_products
        -   *integer*
        -   The number of items in the cart. Multiple instances of one product count as separate items.
    *   -   total
        -   *float*
        -   The total price of the products in the cart.
    *   -   order_id
        -   *integer*
        -   The ID of the :doc:`order <orders>` associated with the cart.
    *   -   user_data
        -   *array*
        -   An array with the cart owner data. It is available only if the cart belongs to a registered :doc:`user <users>`.
    *   -   products
        -   *array*
        -   An array that contains the information about :doc:`products <products>` in the cart.

=============
Delete a Cart
=============

To delete a cart, send the DELETE request to ``/api/carts/<user_id>/``. For example::

  DELETE /api/carts/3

This request deletes the cart with the ``user_id=3``.

---------------
Response Format
---------------

* The cart has been deleted successfully: **HTTP/1.1 204 No Content**. 
* The cart couldn’t be deleted: **HTTP/1.1 400 Bad Request**.
* The cart doesn’t exist: **HTTP/1.1. 404 Not Found**.
