**********************
Abandoned / Live Carts
**********************

.. important::

    This entity first appeared in **CS-Cart 4.3.5**.

====
URLs
====

*   http://example.com/api/2.0/**carts/** — refer to all carts. Supports ``GET`` only.

*   http://example.com/api/2.0/**carts/:id** — refer to a particular cart. Supports ``GET`` and ``DELETE`` only.

========================
Pagination and Filtering
========================

Use the following parameters to find carts with specific properties and display them in a way you need.

==================  =================  ==========================================================
**Parameter**       **Default value**  **Description**
**page**            ``1``              Show all carts on the output page with the specified number.
**items_per_page**  ``10``             The number of carts displayed on the output page.
**sort_by**         ``position``       Sort carts by ``customer`` or ``date``.
**sort_order**      ``desc``           Ascending or descending sorting order: ``asc`` or ``desc``.
**cname**                              Filter carts by their names.
**email**                              Filter carts by emails.
**user_id**                            Filter carts by User ID.
**with_info_only**  ``false``          Set to ``true`` for the response to include only those users who provided contact information.
**users_type**                         Filter carts by user type. Possible values: 

                                       ``R`` - registered user

                                       ``G`` - guest
**total_from**                         Filter carts by totals: minimum value.
**total_to**                           Filter carts by totals: maximum value.
**product_type_c**  ``false``          Set to ``true`` for the response to include only those users, who have something in their carts.
**product_type_w**  ``false``          Set to ``true`` for the response to include only those users, who have something on their wishlist.
**period**          ``A``              Filter carts by time period: 
                                       
                                       ``A`` - all the time

                                       ``D`` - today

                                       ``LD`` - previous day

                                       ``W`` - current week

                                       ``LW`` - previous week

                                       ``M`` - current month

                                       ``LM`` - last month

                                       ``Y`` - current year

                                       ``LY`` - last year

                                       ``HH`` - last 24 hours

                                       ``HW`` - last 7 days

                                       ``HM`` - last 30 days

                                       ``C`` - specified time period (use with the fields **time_from** and **time_to**)
**time_from**                          Filter carts by the specified time period: beginning of the time period.
**time_to**                            Filter carts by the specified time period: end of the time period.
**p_ids**                              Filter carts by Product IDs. There are two ways to use p_ids:

                                       1. An array: ``p_ids[]=1&p_ids[]=2&p_ids[]=3``

                                       2. A string: ``p_ids=1,2,3,4,5``
==================  =================  ==========================================================

**Examples:**

*   *http://example.com/api/2.0/carts?items_per_page=20*

Response is an array with 20 carts from the 1st page.

*   *http://example.com/api/2.0/carts?page=5&items_per_page=20&period=D&user_type=G*

Response is an array with 20 today’s guests’ carts by from the 5th output page.

======
Fields
======
A cart has a number of properties represented by fields. See the list of supported fields below (mandatory fields are marked with \*\).

.. note::

    Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 30 20

    *   -   Field name
        -   Description
        -   Available for methods
    *   -   user_id
        -   ID of the cart owner.
        -   ``GET``
    *   -   firstname
        -   Cart owner’s first name.
        -   ``GET``
    *   -   lastname
        -   Cart owner’s last name.
        -   ``GET``
    *   -   date
        -   Cart creation timestamp.
        -   ``GET``
    *   -   ip_address
        -   IP address of the cart owner.
        -   ``GET``
    *   -   company_id
        -   ID of the company.
        -   ``GET``
    *   -   cart_products
        -   The total number of items in the cart.
        -   ``GET``
    *   -   total
        -   The total value of the cart.
        -   ``GET``
    *   -   order_id
        -   The ID of the order associated with the cart.
        -   ``GET``
    *   -   user_data
        -   An array with the cart owner data (available if the cart belongs to a registered user).
        -   ``GET``
    *   -   products
        -   An array that contains the information about products in the cart.
        -   ``GET`` (only for */carts/:id*)

=============
Example Usage
=============

-----------
GET /carts/
-----------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/carts'

This example request returns the list of all carts with their properties.

--------------
GET /carts/:id
--------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/carts/1'

This example request returns the properties of the cart with the ``user_id=1``.

-----------------
DELETE /carts/:id
-----------------

.. code-block:: bash

    curl -X DELETE 'http://example.com/api/2.0/carts/3'

This example request deletes the cart with the ``user_id=3``.

If you successfully delete a cart, you will receive **HTTP/1.1 204 No Content**.

If the cart couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.


