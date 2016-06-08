******
Orders
******

Orders are what an online store is about. Customers submit orders at checkout after adding at least one product to cart. Administrators can work with the submitted orders and add new orders themselves.

.. contents::
   :backlinks: none
   :local:

===============
List All Orders
===============

To get a list of orders, send a GET request to ``/api/orders/``::

  GET /api/orders/

This request returns 10 orders with a short list of details for each order.

----------------------------------
Pagination, Sorting, and Filtering
----------------------------------

Add these parameters to the path to specify what orders will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/orders/`` is a page with a limited number of orders. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of orders on a page.
    *   -   sort_by
        -   ``date``
        -   Determines the parameter by which the orders are sorted in the response.
    *   -   sort_order
        -   ``desc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   status
        -   
        -   | Searches only for the orders with the specified :doc:`status <statuses>`. Status names and functions are configured by store owners and may vary from store to store.
            |
            | These default order statuses can be edited, but can’t be deleted:
            | ``P``—processed
            | ``C``—complete
            | ``O``—open
            | ``F``—failed
            | ``D``—declined
            | ``B``—backordered
            | ``I``—cancelled
            | ``Y``—awaiting call
    *   -   user_id
        -   
        -   Searches only for the orders placed the customer with the specified ID.
    *   -   company_id
        -   
        -   Searches only for the orders placed on the specific storefront (in CS-Cart) or at the specific vendor (in Multi-Vendor). 
    *   -   email
        -   
        -   Searches only for the orders placed by the customer with the specified email.
    *   -   invoice_id
        -   
        -   Searches only for the orders with the specified invoice ID. 
    *   -   credit_memo_id
        -   
        -   Searches only for the orders with the specified credit memo ID.

**Examples:**

* ``GET /api/orders/?page=5&items_per_page=5&status=C``

  Response is an array with 5 orders from the 5th page of the list of complete orders.

* ``GET /api/orders/?email=customer@example.com&company_id=2``

  Response is an array with 10 orders placed by the customer with the specified email at the storefront (in CS-Cart) or with the vendor (in Multi-Vendor) with ``company_id=2``.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/orders/?items_per_page=2

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
    "orders": [
    {
      "order_id": "97",
      "issuer_id": null,
      "user_id": "3",
      "is_parent_order": "N",
      "parent_order_id": "0",
      "company_id": "1",
      "timestamp": "1456917981",
      "firstname": "George",
      "lastname": "Nills",
      "email": "dsds@example.com",
      "phone": "+1 646-386-3600",
      "status": "O",
      "total": "677.95",
      "invoice_id": null,
      "credit_memo_id": null,
      "points": null
     },
     {
      "order_id": "96",
      "issuer_id": null,
      "user_id": "3",
      "is_parent_order": "N",
      "parent_order_id": "0",
      "company_id": "1",
      "timestamp": "1456917981",
      "firstname": "Customer",
      "lastname": "Customer",
      "email": "customer@example.com",
      "phone": "",
      "status": "C",
      "total": "972.00",
      "invoice_id": null,
      "credit_memo_id": null,
      "points": null
    }
  ],
  "params": {
      "page": 1,
      "items_per_page": "2",
      "ajax_custom": "1",
      "include_incompleted": false,
      "sort_order": "desc",
      "sort_by": "date",
      "sort_order_rev": "asc",
      "total_items": "64"
   }
  }

====================
Get a Specific Order
====================

To get the full list of details of a specific order, send a GET request to ``/api/orders/<order_id>/``. For example::

  GET /api/orders/100

---------------
Response Format
---------------

* The order exists: **HTTP/1.1 200 OK** and JSON with order details.

* The order doesn't exist: **HTTP/1.1 404 Not Found**.

-------------
Order Details
-------------

The fields below represent various order details.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   order_id
        -   *integer*
        -   A unique identifier of the order.
    *   -   is_parent_order
        -   | ``Y``—yes
            | ``N``—no
        -   Multi-Vendor uses parent orders internally to process the initial order via the payment processor. Parent orders don’t appear on the order list in the Administration panel.
    *   -   parent_order_id
        -   *integer*
        -   If an order includes products from several vendors, then a parent order and separate orders for each vendor are created. These separate orders are linked to the ID of the parent order.
    *   -   status
        -   *string*
        -   The :doc:`status <statuses>` of the order. A unique letter of the English alphabet is assigned to every order status as a means to refer to it.
    *   -   timestamp
        -   *integer*
        -   The `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ when the order was placed.
    *   -   company_id
        -   *integer*
        -   ID of the associated storefront (in CS-Cart) or vendor (in Multi-Vendor). 
    *   -   issuer_id
        -   *integer*
        -   ID of the administrator who created the order via the admin panel.
    *   -   user_id
        -   *integer*
        -   A unique identifier of the user who placed the order. Orders placed by guests have ``user_id=0``.
    *   -   firstname
        -   *string*
        -   Customer’s first name.
    *   -   lastname
        -   *string*
        -   Customer’s last name.
    *   -   email
        -   *string*
        -   Customer’s email.
    *   -   phone
        -   *string*
        -   Customer’s phone number.
    *   -   ip_address 
        -   *string*
        -   Customer’s IP address.
    *   -   lang_code
        -   *string*
        -   The code of the language which the customer selected when placing the order, for example ``en``.
    *   -   localization_id
        -   *integer*
        -   ID of the localization. **Note:** localizations are deprecated and disabled by default.
    *   -   total
        -   *float*
        -   The sum to be paid by the customer.
    *   -   discount
        -   *float*
        -   Total discount.
    *   -   subtotal
        -   *float*
        -   The order subtotal.
    *   -   subtotal_discount
        -   *float*
        -   Discount on the order subtotal.
    *   -   display_subtotal 
        -   *float*
        -   The subtotal that will be displayed.
    *   -   invoice_id
        -   *integer*
        -   ID of the invoice.
    *   -   credit_memo_id
        -   *integer*
        -   ID of the credit memo.
    *   -   payment_id 
        -   *integer*
        -   ID of the payment method.
    *   -   payment_info 
        -   *array*
        -   An array with payment information.
    *   -   payment_method
        -   *array*
        -   An array with the settings of the :doc:`payment method <payments>`.
    *   -   payment_surcharge
        -   *float*
        -   The amount of payment surcharge.
    *   -   repaid
        -   | ``0``—no
            | ``1``—yes
        -   Defines if the order was repaid.
    *   -   products
        -   *array*
        -   An array with the information about the ordered :doc:`products <products>`.
    *   -   promotion_ids
        -   *string*
        -   A string of promotion IDs separated by commas.
    *   -   promotions
        -   *array*
        -   An array with the data of applicable promotions.
    *   -   need_shipping
        -   | ``true``
            | ``false``
        -   Defines if the order requires shipping.
    *   -   shipping_ids
        -   *string*
        -   IDs of the shipping methods.
    *   -   shipping
        -   *array*
        -   An array with the data of the shipping methods used in the order.
    *   -   shipping_id
        -   *integer*
        -   ID of the shipping method.
    *   -   need_shipment
        -   | ``true``
            | ``false``
        -   Defines if the order requires :doc:`shipments <shipments>`.
    *   -   shipment_ids
        -   *string*
        -   A string of shipment IDs separated by commas.
    *   -   shipping_cost
        -   *float*
        -   The shipping cost.
    *   -   display_shipping_cost
        -   *float*
        -   The shipping cost that will be displayed.
    *   -   tax_exempt
        -   | ``Y``—yes
            | ``N``—no
        -   Determines if the customer is exempt from taxes.
    *   -   tax_subtotal
        -   *float*
        -   Subtotal tax.
    *   -   taxes
        -   *array*
        -   An array with the data of the applicable taxes.
    *   -   notes
        -   *string*
        -   Customer’s notes about the order.
    *   -   details
        -   *string*
        -   Administrator’s notes about the order.
    *   -   s_address
        -   *string*
        -   Shipping address (the first field).
    *   -   s_address_2
        -   *string*
        -   Shipping address (the second field).
    *   -   s_city
        -   *string*
        -   City (shipping address).
    *   -   s_country
        -   *string*
        -   A 2-letter country code (shipping address).
    *   -   s_country_descr
        -   *string*
        -   Country name (shipping address).
    *   -   s_firstname
        -   *string*
        -   First name (shipping address).
    *   -   s_lastname
        -   *string*
        -   Last name (shipping address).
    *   -   s_phone
        -   *string*
        -   Phone number (shipping address).
    *   -   s_state
        -   *string*
        -   State code (shipping address).
    *   -   s_state_descr
        -   *string*
        -   State name (shipping address).
    *   -   s_zipcode
        -   *string*
        -   Zip code (shipping address).
    *   -   b_address
        -   *string*
        -   Billing address (the first field).
    *   -   b_address_2
        -   *string*
        -   Billing address (the second field).
    *   -   b_city
        -   *string*
        -   City (billing address).
    *   -   b_country
        -   *string*
        -   A 2-letter country code (billing address).
    *   -   b_country_descr
        -   *string*
        -   Country name (billing address).
    *   -   b_firstname
        -   *string*
        -   First name (billing address).
    *   -   b_lastname
        -   *string*
        -   Last name (billing address).
    *   -   b_phone
        -   *string*
        -   Phone number (billing address).
    *   -   b_state
        -   *string*
        -   State code (billing address).
    *   -   b_state_descr
        -   *string*
        -   State name (billing address).
    *   -   b_zipcode
        -   *string*
        -   Zip code (billing address).


===============
Create an Order
===============

.. list-table::
    :stub-columns: 1
    :widths: 5 15

    *   -   CS-Cart
        -   Send a POST request to ``/api/stores/<company_id>/orders/``
    *   -   Multi-Vendor
        -   Send a POST request to ``/api/orders/``

.. important::

    A newly-created order will always have ``"status": "O"``. You can change it only when you update an order.

Pass the following fields with order details in the HTTP request body in accordance with the ``Content-Type``. Required fields are marked with *****:

* **user_id***—the unique identifier of the user. Can be omitted or set to 0 only if the request includes ``user_data``.

* **payment_id***—ID of the payment method. The payment method must be available in the store.

* **shipping_id***—ID of the shipping method. The shipping method must be available in the store and configured to calculate the cost of shipping to the address you pass in the request.

  Beginning with version 4.3.7, you can specify an array of shipping method IDs as the value of ``shipping_id``. The keys of the array would be the keys of the product groups in the cart.

  This comes useful when you create an order with the products from multiple vendors (in Multi-Vendor), or from multiple suppliers, or whenever else the products in the cart are separated into groups.

* **products***—an associative array of products. Product IDs serve as the keys, and the values are product details::

    "products": {
        "241": {
            "amount": "1",
            "product_options": {
               "12": "44", 
               "13": "48" 
            }         
        }
    }

  .. note::

       Product price is taken from the :doc:`product settings <products>`, not from the JSON data.

  * **amount***—the amount of this particular product that is being ordered.

  * **product_options**—an associative array describing the options and option variants of the product. Option ID serves as the key, and option variant serves as the value.

* **user_data**—an associative array with the customer’s data. If you specify a ``user_id`` other than 0, this parameter won’t be considered and can be omitted. If ``user_id`` is omitted or set to 0, ``user_data`` is required::

    "user_data": {
      "email": "email@example.com",
      "b_firstname": "John",
      "b_lastname": "Doe",
      "b_address": "44 Main street",
      "b_city": "Boston",
      "b_state": "MA",
      "b_country": "US",
      "b_zipcode": "02134",
      "b_phone": "",
      "s_firstname": "John",
      "s_lastname": "Doe",
      "s_address": "44 Main street",
      "s_city": "Boston",
      "s_state": "MA",
      "s_country": "US",
      "s_zipcode": "02134",
      "s_phone": ""
    }

  * **email***—customer’s e-mail
  * **b_firstname***—first name (billing address)
  * **b_lastname***—last name (billing address)
  * **b_address***—address (billing address)
  * **b_city***—city (billing address)
  * **b_state***—2-symbol state code (billing address)
  * **b_country***—2-letter country code (billing address) 
  * **b_zipcode***—zip code (billing address)
  * **b_phone***—phone number (billing address)
  * **s_firstname***—first name (shipping address)
  * **s_lastname***—last name (shipping address)
  * **s_address***—address (shipping address)
  * **s_city***—city (shipping address)
  * **s_state***—2-symbol state code (shipping address)
  * **s_country***—2-symbol country code (shipping address)
  * **s_zipcode***—zip code (shipping address)
  * **s_phone***—phone number (shipping address)

  .. note::

      You can view the available country and state codes in the Administration panel of your store under **Administration → Shipping & Taxes → States**.

------------------------------------------
Way 1: Create an Order as an Existing User
------------------------------------------

.. list-table::
    :stub-columns: 1
    :widths: 5 15

    *   -   CS-Cart
        -   Send a POST request to ``/api/stores/<company_id>/orders/``
    *   -   Multi-Vendor
        -   Send a POST request to ``/api/orders/``

**Required fields:** ``user_id``, ``payment_id``, ``shipping_id``, ``products``

**Example JSON:**

::

  {
    "user_id": "3",
    "shipping_id": "1",
    "payment_id": "2",
    "products": {
        "12": {
          "product_id": "12",
          "amount": "1"
         }, 
        "13": {
          "product_id": "13",
          "amount":"2"
        }
    }
  }

This request places an order with the following properties:

* Order was placed by the customer with ``user_id=3``.

* The shipping method with ``shipping_id=1`` was chosen.

* The payment method with ``payment_id=2`` was chosen.

* One product with ``product_id=12`` and two products with ``product_id=13`` were ordered.

---------------------------------
Way 2: Create an Order as a Guest
---------------------------------

.. list-table::
    :stub-columns: 1
    :widths: 5 15

    *   -   CS-Cart
        -   Send a POST request to ``/api/stores/<company_id>/orders/``
    *   -   Multi-Vendor
        -   Send a POST request to ``/api/orders/``

**Required fields:** ``user_data``, ``payment_id``, ``shipping_id``, ``products``

**Example JSON:**

::

  {
   "user_id": "0",
   "payment_id": "2",
   "shipping_id": "1",
   "products": {
       "12": {
         "product_id": "12",
         "amount": "1"
       },
       "13": {
         "product_id":"13",
         "amount":"2"
       }
   }, 
   "user_data": {
      "email":"guest@example.com",
      "firstname": "Guest",
      "lastname": "Guest", 
      "s_firstname": "Guest",
      "s_lastname": "Guest",
      "s_country": "US",
      "s_city": "Boston",
      "s_state": "MA",
      "s_zipcode": "02125",
      "s_address": "44 Main street",
      "b_firstname": "Guest",
      "b_lastname": "Guest",
      "b_country":"US",
      "b_city": "Boston",
      "b_state": "MA",
      "b_zipcode":"02125",
      "b_address": "44 Main street"
   }
  }

This request is similar to the previous example, but the order is placed on behalf of a guest with the specified contact details.

.. note::

    Guests specify their address and contact information at checkout. That’s why you must pass the ``user_data`` array in the JSON when you place an order on behalf a guest.

---------------
Response Format
---------------

* The order has been created successfully: **HTTP/1.1 201 Created** and the order ID::

    {
     "order_id": "98"
    }

* The order couldn’t be created: **HTTP/1.1 400 Bad Request**.

===============
Update an Order
===============

To update an existing order, send the PUT request to ``/api/orders/<order_id>/``. For example::

  PUT /api/orders/98

Pass the fields with order details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

---------------------------------------------
Example JSON: Change Status & Notify by Email 
---------------------------------------------

By default, when you change the order status via REST API, no email notifications are sent. However, you can use additional fields when updating an order:

* **notify_user**—this flag determines whether or not to send the notification to the customer.

* **notify_department**—this flag determines whether or not to send the notification to the order department.

* **notify_vendor**—this flag determines whether or not to send the notification to the vendor.

.. note::

    The **notify_vendor** flag is available only in Multi-Vendor.

::

  {
   "status": "P",
   "notify_user": "Y",
   "notify_department": "Y",
   "notify_vendor": "Y"
  }

This request sets the status of the order to ``P`` (*Processed* by default) and sends email notifications to the customer, the vendor, and the order department.

-----------------------------
Example JSON: Change Products
-----------------------------

::

  {
   "products": {
       "13": {
         "product_id": "13",
         "amount": "1"
       },
       "241": {
         "product_id": "241",
         "amount": "1",
          "product_options": {
             "12": "44", 
             "13": "48" 
          }         
         }
        }
  }

This request changes the products assigned to the order. When we created order 98, it had one product with ``product_id=12`` and two products with ``product_id=13``. After this request the order will have one product with ``product_id=13``, and one product with ``product_id=241``.

Product 241 also has the option variants specified:

* variant 44 of option 12.

* variant 48 of option 13.

.. note::

    If an order has multiple products, make sure to specify them all when you update the ``products`` array with the PUT request. Products that are not specified in the PUT request will be removed from the order. The same applies to product option variants.

-------------------------------------------------
Example JSON: Change User Details and Order Total
-------------------------------------------------

::

  {
   "total": "100"
   "user_data": {
     "email": "customer@example.com",
     "b_firstname": "John",
     "b_lastname": "Doe",
     "s_firstname": "John",
     "s_lastname": "Doe"
   }
  }

This request:

* changes the name of the customer in the billing and shipping address to *John Doe*;

* changes the customer's email to *customer@example.com*;

.. note::

    This won't change the name or email of the :doc:`user <users>`—only the name and email on the order page will change.

* sets the order total to $100 (if U.S. dollar is the primary currency of your store).

.. note::

    If you try to specify the ``total`` and other parameters that can affect it (like ``discount`` or ``subtotal_discount``) in the JSON at the same time, then ``total`` will always take priority. You can specify ``total``, but not ``subtotal`` in the JSON. 

---------------
Response Format
---------------

* The order has been updated successfully: **HTTP/1.1 200 OK** and the order ID::

    {
     "order_id": "98"
    }

* The order couldn’t be updated: **HTTP/1.1 400 Bad Request**.

* The order doesn’t exist: **HTTP/1.1 404 Not Found**.

===============
Delete an Order
===============

To delete an order, send the DELETE request to ``/api/orders/<order_id>/``. For example::

  DELETE /api/orders/98/

This request will delete an order with ``order_id=98``.

---------------
Response Format
---------------

* The order has been deleted successfully: **HTTP/1.1 204 No Content**.

* The order couldn’t be deleted: **HTTP/1.1 400 Bad Request**.
 
* The order doesn’t exist: **HTTP/1.1 404 Not Found**.
