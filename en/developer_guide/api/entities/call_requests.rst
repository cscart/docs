*************
Call Requests
*************

.. important::

    This entity first appeared in **CS-Cart 4.3.5**.

====
URLs
====

*   http://example.com/api/2.0/**call_requests/** — refer to all call requests. Supports ``GET`` and ``POST``.

*   http://example.com/api/2.0/**call_requests/:id** — refer to a particular call request. Supports ``GET``, ``PUT``, and ``DELETE``.

========================
Pagination and Filtering
========================

Use the following parameters to find call requests with specific properties and display them in a way you need.

==================  =================  ==========================================================
**Parameter**       **Default value**  **Description**
**page**            ``1``              Show all call requests from the output page with the specified number.
**items_per_page**  ``10``             The number of call requests displayed on one output page.
**sort_by**         ``date``           Sort call requests by ``id``, ``date``, ``status``, ``name``, ``phone``, ``user_id``, ``user``, ``order``, ``order_status``.
**sort_order**      ``desc``           Ascending or descending sorting order: ``asc`` or ``desc``.
**status**                             Filter call requests by status. Possible values: ``new``, ``in_progress``, ``completed``, ``no_answer``.
**name**                               Filter call requests by name.
**phone**                              Filter call requests by the phone number.
**company_id**                         Filter call requests by the ID of the store (if you have multiple stores).
**order_status**                       Filter call requests by the status of the associated order (made using **Buy with 1-click**).
**user_id**                            Filter call requests by the IDs of the administrators assigned to those requests.
**order_exists**                       Filter call requests depending on whether there is an associated order. Possible values: ``Y`` (order exists), ``N`` (order doesn’t exist).
==================  =================  ==========================================================

**Examples:**

*   *http://example.com/api/2.0/call_requests?items_per_page=20*

Response is an array with 20 call requests from the 1st output page.

*   *http://example.com/api/2.0/call_requests?page=5&items_per_page=20&order_exists=N*

Response is an array with 20 call requests without associated orders from the 5th output page.


======
Fields
======
A call request has a number of properties represented by fields. See the list of supported fields below (mandatory fields are marked with \*\).

.. note::

    Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 10 10

    *   -   Field name
        -   Description
        -   Available for methods
        -   Supported values
    *   -   email* (becomes mandatory if there is no phone)
        -   Email of the customer who requested a call.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   phone* (becomes mandatory if there is no email)
        -   The phone number of the customer who requested a call.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   user_id
        -   ID of the administrator assigned to the call request.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   integer
    *   -   order_id
        -   ID of the order associated with the call request (placed with **Buy now with 1-click**).
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   integer
    *   -   product_id
        -   ID of a product from the order associated with the call request.
        -   | ``GET``
            | ``POST``
        -   integer
    *   -   timestamp
        -   Creation timestamp.
        -   | ``GET``
            | ``POST``
        -   A valid timestamp in seconds
    *   -   status
        -   Status of the call request.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | One of the following strings:
            | ``new``
            | ``in_progress``
            | ``completed``
            | ``no_answer``
    *   -   name
        -   Name of the customer who requested a call.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   time_from
        -   The beginning of the time period when the customer is ready to answer a call.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   time_to
        -   The end of the time period when the customer is ready to answer a call.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   notes
        -   Notes related to the call request.
        -   | ``GET``
            | ``POST``
        -   string
    *   -   cart_products
        -   An array with the names, IDs quantities and prices of the products in the cart.
        -   | ``GET``
            | ``POST``
        -   array
    *   -   order_status
        -   Status of the order associated with the call request.
        -   ``GET``
        -   string
    *   -   product
        -   Name of the product that the user purchased using **Buy now with 1-click**.
        -   ``GET``
        -   string

===================
Cart_Products Array
===================

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 10 10

    *   -   Field name
        -   Description
        -   Available for methods
        -   Supported values
    *   -   product_id
        -   ID of the product.
        -   ``GET``
        -   integer
    *   -   amount
        -   The amount of products of this kind in the cart.
        -   ``GET``
        -   string
    *   -   price
        -   The price of the product.
        -   ``GET``
        -   integer
    *   -   product
        -   The name of the product.
        -   ``GET``
        -   string

=============
Example Usage
=============

-------------------
GET /call_requests/
-------------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/call_requests/'

This example command returns the list of call requests with their properties.

----------------------
GET /call_requests/:id
----------------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/call_requests/1'

This example command returns the call request with the ``request_id=1``, and its properties.

--------------------
POST /call_requests/
--------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

If you successfully create a call request, you will receive **HTTP/1.1 201 Created**.
 
If the call request couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Required fields:** *email* or *phone*

**Available fields:** *email*, *phone*, *user_id*, *order_id*, *product_id*, *timestamp*, *status*, *name*, *phone*, *time_from*, *time_to*, *notes*, *cart_products*

.. code-block:: bash

    curl -H "Content-Type: application/json" -X POST http://example.com/api/2.0/call_requests -d '{"phone":"+7(999)111-22-33", "name":"John Doe", “time_from”:”9:00”, “time_to”:”10:00”}'

The example request creates a new call request from *John Doe*, who asks to contact him by the specified **phone number** *between 9:00 and 10:00*.

In the response you receive the ID of the call request.

.. code-block:: bash

    {request_id: 5}

-----------------------
PUT /call_requests/:id/
-----------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

**Available fields:** *user_id*, *order_id*, *product_id*, *status*, *notes*

.. code-block:: bash

    curl -H "Content-Type: application/json" -X PUT http://example.com/api/2.0/call_requests/5 -d '{"status":"no_answer", "notes":"John didn’t answer the call"}'

The example request sets the **status** of the call request with ``request_id=5`` to *No Answer* and adds a corresponding **note** that one can see in the admin panel next to this call request.  

In the response you receive the ID of the call request.

.. code-block:: bash

     {request_id: 5}

-------------------------
DELETE /call_requests/:id
-------------------------

If you successfully delete a call request, you will receive **HTTP/1.1 204 No Content**.

If the call request couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.

If the call request doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

.. code-block:: bash

     curl -X DELETE 'http://example.com/api/2.0/call_requests/5'

This command deletes the call request with the ``request_id=5``.

