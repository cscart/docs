***
API
***

Starting from version 4, CS-Cart provides an API to interact with a store.

Overview
========

CS-Cart API:

*   Is `RESTful <http://en.wikipedia.org/wiki/Representational_state_transfer>`_
*   Uses :ref:`Basic HTTP authentication <auth>`, with admin e-mail as login and auto-generated API key as password
*   Relies on user group-defined privileges. User group assignment is defined directly in the objects
*   Uses HTTP 1.1 to implement REST.

    4 methods are available to view and modify objects:

    *   ``GET``—get object data
    *   ``PUT``—update object data
    *   ``POST``—create new object
    *   ``DELETE``—delete object

*   Accepts and returns data in JSON format

.. toctree::
    :maxdepth: 2
    :titlesonly:

    entities/index

.. toctree::
    :maxdepth: 2
    :titlesonly:

    errors

Useful Tools
============

*   `cURL <https://en.wikipedia.org/wiki/CURL>`_ is a cross-platform command line application that allows you to easily send HTTP requests. In UNIX-based  systems, it is usually available by default with a simple ``curl`` command.

    .. note:: All examples in this guide are given as cURL commands.

*   `REST Console <https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn>`_ is an extension for the popular Google Chrome browser. Similar extensions exist for all popular web-browsers.

.. _activate:

Activate API Access
===================

API access is activated/disabled on a per-user basis.

To activate API access for a user:

#.  Log in to the CS-Cart admin panel
#.  Go to **Customers → Administrators**
#.  Open the admin account you want to activate API access to (e.g. admin@exaple.com)
#.  Switch to the **API access** tab and check the **Yes, allow this user to use the API** box
#.  Click **Save**

The automatically generated API key will be used by this user along with their e-mail to access the API.

URLs
====

An API request is a regular HTTP request sent to a particular URL.

The URLs are built as follows:

*   **http://example.com/api/:object**—refer to all objects of a certain type
*   **http://example.com/api/:object/:id**—refer to a single object
*   **http://example.com/api/:object/:id/:nested_object:**—refer to all nested objects of a certain object
*   **http://example.com/api/:object/:id/:nested_object/:id**—refer to a single nested object of a certain object

For example, **http://example.com/api/product/1/features** refers to all the features of the product with the ID 1.

.. note::

    If ``mod_rewrite`` is disabled on the server where the target CS-Cart store is installed, you will have to use different URLs:

    *   **http://example.com/api.php?_d=:object&ajax_custom=1**—refer to all objects of a certain type
    *   **http://example.com/api.php?_d=:object/:id&ajax_custom=1**—refer to a single object
    *   **http://example.com/api.php?_d=:object/:id/:nested_object&ajax_custom=1**—refer to all nested objects of a certain object
    *   **http://example.com/api.php?_d=:object/:id/:nested_object/:id&ajax_custom=1**—refer to a single nested object of a certain object

.. _auth:

Authentication
--------------

Each request must be authenticated with user's e-mail and :ref:`API key <activate>`. There are 3 ways to submit authentication data in an API request:

*   Via the ``--user`` parameter (this is used in all the examples):

    .. code-block:: bash

        curl --user admin@example.com:APIkey -X ``GET`` 'http://example.com/api/users/'

*   Inline passing in the URL:

    .. code-block:: bash

        curl --basic -X ``GET`` 'http://admin%40example.com:APIkey@example.com/api/users/'

    .. note:: ``@`` must be replaced with ``%40``

*   In the request header:

    .. code-block:: bash

        curl --header 'Authorization: Basic <base64-encoded email:APIkey pair>=' -X ``GET`` 'http://example.com/api/users/'

    .. note::

        The *email:APIkey* pair must be encoded in **base64**.

        PHP example::

            $token = base64_encode("email:APIkey");
            $authHeaderString = 'Authorization: Basic ' . $token;

.. _get:

Get Data (``GET``)
------------------

To get object data, send a ``GET`` HTTP request to the URL that refers to the according object.

Request Example
"""""""""""""""

Get data about the product with the ID 1:

.. code-block:: bash

    curl --user admin@example.com:APIkey -X ``GET`` 'http://example.com/api/products/1'

Filtering
"""""""""

It is possible to send additional URL parameters to particularize the selection.

For example, you get all products with non-free shipping:

.. code-block:: bash

    curl --user admin@example.com:APIkey -X ``GET`` 'http://example.com/api/products?free_shipping=N'

You can combine conditions.

Get all downloadable products with ``company_id`` 1:

.. code-block:: bash

    curl --user admin@example.com:APIkey -X ``GET`` 'http://example.com/api/products?is_edp=Y&company_id=1'

Response
""""""""

JSON array of matching objects (e.g. the ``products`` key) and the search query (the ``search`` key), or an :doc:`error <errors>`.

The matching objects value is an array of object IDs as keys and object field arrays as values.

Refer to the :doc:`API objects <entities/index>` page for a complete list of supported fields for all supported objects.

.. _put:

Update Data (``PUT``)
---------------------

To update object data, send a ``PUT`` HTTP request to the URL that refers to the according object.

Only URLs referring to particular object IDs can be used (i.e. you cannot update all products at once.)

The submitted data must be a JSON array of keys and values for the object fields (e.g. ``{'fieldName1: value1, fieldName2: value2}``.)

Refer to the :doc:`API objects <entities/index>` page for a complete list of supported fields for all supported objects.

.. important::

    The header ``Content-Type`` must be declared and set to ``application/json``, otherwise the default ``text/plain`` is assumed and the request will fail.

Request Example
"""""""""""""""
Update name of the product with the ID 1:

..  code:: bash

    curl --user admin@example.com:APIkey --header 'Content-Type: application/json' -d '{"product": "New Product Name"}' -X ``PUT`` 'http://example.com/api/products/1'

Response
""""""""

Updated object ID, e.g. ``{"product_id":"1"}``, or an :doc:`error <errors>`.

.. _post:

Create Object (``POST``)
------------------------

To create an object, send a ``POST`` HTTP request to the URL that refers to the according object type.

Only URLs referring to a whole object type (without ID) can be used.

The submitted data must be a JSON array of keys and values for the object fields (e.g. ``{'fieldName1: value1, fieldName2: value2}``.)

Some fields are mandatory for object creating. Refer to the :doc:`API objects <entities/index>` page for a complete list of supported fields for all supported objects.

.. important::

    The header ``Content-Type`` must be declared and set to ``application/json``, otherwise the default ``text/plain`` is assumed and the request will fail.

Request Example
"""""""""""""""

Create a new product with the name "My Awesome Product":

.. code-block:: bash

    curl --user admin@example.com:APIkey --header 'Content-Type: application/json' -d '{"product": "My Awesome Product"}' -X ``POST`` 'http://example.com/api/products'

Response
""""""""

Created object ID, e.g. ``{"product_id":"1"}``, or an :doc:`error <errors>`.

Delete Object (``DELETE``)
--------------------------

To delete an object, send a ``DELETE`` HTTP request to the URL that refers to the according object.

Only URLs referring to particular object IDs can be used (i.e. you cannot delete all products at once.)

Request Example
"""""""""""""""

Delete the product with the id 12:

.. code-block:: bash

    curl --user admin@example.com:APIkey -X ``DELETE`` 'http://example.com/api/products/12'

Response
""""""""

Nothing in response, independently on the success of the operation.
