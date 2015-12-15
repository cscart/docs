***********
Discussions
***********

.. important::

    This entity first appeared in **CS-Cart 4.3.5**.

====
URLs
====

*   http://example.com/api/2.0/**discussions/** — refer to all reviews and comments. Supports only ``GET`` and ``POST``.

*   http://example.com/api/2.0/**discussions/:id** — refer to a particular review or comment. Supports ``GET``, ``PUT``, and ``DELETE``.

*   http://example.com/api/2.0/**products/:p_id/discussions/** — refer to all reviews and comments related to specific product. Supports only ``GET`` and ``POST``.

*   http://example.com/api/2.0/**products/:p_id/discussions/:id** — refer to a particular review or comment related to specific product. Supports ``GET``, ``PUT``, and ``DELETE``.


========================
Pagination and Filtering
========================

Use the following parameters to find reviews an comments with specific properties and display them in a way you need.

==================  =================  ==========================================================
**Parameter**       **Default value**  **Description**
**page**            ``1``              Show all reviews and comments on the output page with the specified number.
**items_per_page**  ``10``             The number of reviews and comments displayed on the output page.
**sort_by**         ``timestamp``      Sort reviews and comments by ``name``, ``ip_address``, ``timestamp`` or ``status``.
**sort_order**      ``desc``           Ascending or descending sorting order: ``asc`` or ``desc``.
**status**          ``desc``           Filter reviews and comments by status. Possible values: ``A`` or ``D``.
**name**                               Filter reviews and comments by names.
**message**                            Filter reviews and comments by their content.
**type**                               Filter reviews and comments by type. Possible values: 
                                       ``C`` - commentaries

                                       ``R`` - reviews

                                       ``B`` - both
**ip_address**                         Filter reviews and comments by IP address.
**rating_value**                       Filter reviews and comments by rating.
**object_type**                        Filter reviews and comments by their object. Possible values: 

                                       ``P`` - product

                                       ``C`` - category

                                       ``A`` - page

                                       ``O`` - order

                                       ``E`` - home page
**object_id**                          Filter reviews and comments by object ID.
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
==================  =================  ==========================================================

**Examples:**

*   *http://example.com/api/2.0/discussions?items_per_page=20*

Response is an array with 20 reviews and comments from the 1st page.

*   *http://example.com/api/2.0/discussions?items_per_page=20*

Response is an array with 20 reviews from the 5th output page.

*   *http://example.com/api/2.0/products/167/discussions*

Response is an array with reviews and comments about the product with ``product_id=167``.

======
Fields
======

Reviews and comments have a number of properties represented by fields. See the list of supported fields below (mandatory fields are marked with \*\).

.. note::

    Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 20 10 20

    *   -   Field name
        -   Description
        -   Available for methods
        -   Supported values
    *   -   object_type* (also requires object_id)
        -   Type of the object.
        -   | ``GET``
            | ``POST``
        -   | One of the following strings:
            | ``P`` - product 
            | ``C`` - category 
            | ``A`` - page 
            | ``O`` - order 
            | ``E`` - home page
    *   -   object_id* (also requires object_type) 
        -   ID of the object.
        -   | ``GET``
            | ``POST``
        -   integer
    *   -   thread_id* (instead of object_type & object_id) 
        -   ID of the thread.
        -   | ``GET``
            | ``POST``
        -   integer
    *   -   name
        -   Name of the customer who posted the review/comment.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   message
        -   Content of the customer's message.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   rating_value
        -   Rating value.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   integer
    *   -   timestamp
        -   Creation timestamp.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   A valid timestamp in seconds
    *   -   status 
        -   Status of a review or comment.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``A`` - approved
            | ``D`` - disapproved
    *   -   post_id 
        -   ID of the post.
        -   | ``GET``
        -   integer
    *   -   user_id 
        -   ID of the user.
        -   | ``GET``
        -   integer
    *   -   ip_address
        -   IP address of the user.
        -   | ``GET``
        -   string
    *   -   type
        -   Type of the discussion.
        -   | ``GET``
        -   | ``C`` - comment
            | ``R`` - review
            | ``B`` - both
    *   -   company_id 
        -   ID of the company.
        -   | ``GET``
        -   A valid company ID.

=============
Example Usage
=============

-----------------
GET /discussions/
-----------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/discussions/'

This example command returns the list of reviews and comments with their properties.

--------------------
GET /discussions/:id
--------------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/discussions/18'

This example command returns the review or comment with ``post_id=18``.

------------------
POST /discussions/
------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

If you successfully create a review or comment, you will receive **HTTP/1.1 201 Created**.

If the review or comment couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Required fields:** *object_type + object_id*  or *thread_id*

**Available fields:** *object_type*, *object_id*, *thread_id*, *name*, *message*, *rating_value*, *timestamp*, *status*

.. code-block:: bash

    curl -H "Content-Type: application/json" -X POST http://example.com/api/2.0/discussions -d '{"object_type":"P", "object_id":242, "name":"John Doe", "rating_value":4, "message":"Hi, I use the API!"}'

The example request creates a comment from **John Doe**. He reviews the product with ``product_id=242`` and rates it *4 out of 5*. He also leaves a message: *“Hi, I use the API!”*.
 
In response you receive the ID of the post.

.. code-block:: bash

    {post_id: 22}

---------------------
PUT /discussions/:id/
---------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

**Available fields:** *name*, *message*, *rating_value*, *timestamp*, *status*

.. code-block:: bash

    curl -H "Content-Type: application/json" -X PUT http://example.com/api/2.0/discussions/22 -d '{"rating_value":5, "message":"Changed message via API", "status":"D"}'

The example request sets the **status** of the comment with ``post_id=22`` to *disapproved*, changes the **rating** of the associated object (``product_id=242`` in this case) to *5* and modifies the **message** to *“Changed the message via API”*. 

In response you receive the ID of the comment.

.. code-block:: bash

    {post_id: 22}

-----------------------
DELETE /discussions/:id
-----------------------

If you successfully delete a comment, you will receive **HTTP/1.1 204 No Content**.

If the comment couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.

If the comment doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

.. code-block:: bash

    curl -X DELETE 'http://example.com/api/2.0/discussions/22'

The example request deletes the comment with the ``post_id=22``.
