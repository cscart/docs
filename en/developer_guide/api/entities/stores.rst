******
Stores
******

.. important::

    Stores are available only in CS-Cart.

CS-Cart allows you to run multiple :doc:`stores <../../../user_guide/stores/index>` with one Administration panel. These stores share the same database, but have separate storefronts, settings, and checkout mechanisms, so that visitors can treat them as independent stores.

.. contents::
   :backlinks: none
   :local:

===============
List All Stores
===============

To get a list of stores, send a GET request to ``/api/stores/``::

  GET /api/stores/

This request returns the list of stores with their details.

.. note::

    The number of the returned stores depends on CS-Cart settings and can be altered by adding pagination parameters to the URL.

----------------------------------
Pagination, Sorting, and Filtering
----------------------------------

Add these parameters to the path to specify what stores will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/stores/`` is a page with a limited number of stores. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of stores on a page.
    *   -   sort_by
        -   ``name``
        -   Determines the parameter by which the stores are sorted in the response. Available parameters are ``name``, ``timestamp``.
    *   -   sort_order
        -   ``desc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   timestamp
        -   
        -   Searches only for the stores created at the specified time.
    *   -   company
        -   
        -   Searches only for the store with the specified name.

**Examples:**

* ``GET /api/stores/?page=2&items_per_page=2``

  Response is an array with the information about 2 stores from the 2nd page of the list of stores.

* ``GET /api/stores/?company=Simtech``

  Response is an array the information about the store with the specified name.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/stores/?items_per_page=1

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
   "stores": [
      {
       "company_id": "1",
       "lang_code": "en",
       "email": "simtech@example.com",
       "company": "Simtech",
       "timestamp": "1269610461",
       "status": "A",
       "storefront": "localhost",
       "secure_storefront": "localhost",
       "average_rating": null,
       "company_thread_ids": "1_0"
      }
   ],
   "params": [0]
  }

====================
Get a Specific Store
====================

To get the details of a specific store, send a GET request to ``/api/stores/<company_id>/``. For example::

  GET /api/stores/1

---------------
Response Format
---------------

* The store exists: **HTTP/1.1 200 OK** and JSON with the store details::
    
    {
     "company_id": "1"
     "lang_code": "en"
     "email": "simtech@example.com"
     "company": "Simtech"
     "timestamp": "1269610461"
     "status": "A"
     "storefront": "localhost"
     "secure_storefront": "localhost"
     "average_rating": null
     "company_thread_ids": "1_0"
    }

* The store doesn’t exist: **HTTP/1.1 404 Not Found**.

-------------
Store Details
-------------

The fields below represent various store details.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   company_id
        -   *integer*
        -   A unique identifier of the store.
    *   -   company
        -   *string*
        -   The name of the store.
    *   -   timestamp
        -   *integer*
        -   The `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ when the store was created.
    *   -   storefront
        -   *string*
        -   The URL of the storefront.
    *   -   secure_storefront
        -   *string*
        -   The secure URL of the storefront (SSL).

==============
Create a Store
==============

Send a POST request to ``/api/stores/``::

  POST /api/stores/

Pass the following fields with store details in the HTTP request body in accordance with the ``Content-Type``. Required fields are marked with *****:

* **company***—the name of the store.

* **storefront***—the URL of the store.

  .. important::

      The storefront field must have a unique value for each store.

* **secure_storefront**—the secure URL of the store.

There are other parameters that aren’t returned by CS-Cart REST API, but can be used:

* **redirect_customer**—determines whether customers can be :doc:`redirected from this store to a different store depending on their IP address <../../../user_guide/stores/redirect_regional_customers_to_storefront>`:

  * ``Y``—customers can be redirected.

  * ``N``—customers can’t be redirected.

* **entry_page**—determines the pages of the store which should take the customer to the :doc:`global entry page <../../../user_guide/stores/global_entry_point>`:

  * ``all_pages``—customers will be taken to the global entry page from any page of the store.

  * ``none``—customers won’t be taken to the global entry page from any page of the store.

  * ``index``—customers will be taken to the global entry page from the index page of the store.

  .. important::

      The **entry_page** field applies only if **redirect_customer** is ``N``.

* **countries_list**—the list of countries assigned to the store; if one of your other stores supports redirection, customers from these countries will be redirected here from that store::

    {
     ...
     "countries_list": [
            "DZ",
            "AS",
            "AQ",
            "AG",
            "AR"
        ],
     ...
    }

* **clone_from**—the ID of the store to clone data from.

* **clone**—an object with various store attributes that must be cloned, with ``Y`` values::

    {
     ...
     "clone_from": "1",
     "clone": {
        "layouts": "Y",
        "settings": "Y",
        "profile_fields": "Y",
        "pages": "Y",
        "promotions": "Y",
        "shippings": "Y",
        "payments": "Y",
        "product_filters": "Y",
        "product_features": "Y",
        "sitemap": "Y",
        "static_data_clone": "Y",
        "products": "Y",
        "categories": "Y"
     }
    }

--------------------------------
Example JSON: Create a New Store
--------------------------------

::

  {
   "company": "Example Company",
   "storefront": "example.com",
   "redirect_customer": "Y",
   "entry_page": "none",
   "countries_list": [
        "DZ", "AS", "AQ", "AG", "AR"
   ]
  }

This request creates a store with the specified properties. Customers can be redirected from this store, if they come from a country from the **countries_list** of one of your other stores.

-------------------------------------------
Example JSON: Create a Store and Clone Data
-------------------------------------------

::

  {
   "company": "Example Company 2",
   "storefront": "example2.com",
   "secure_storefront": "example2.com",
   "clone_from": "1",
   "clone": {
      "layouts": "Y",
      "settings": "Y",
      "products": "Y",
      "categories": "Y"
    }
  }

This request creates a store with the specified properties. The layouts, settings, products, and categories are cloned from the store with ``company_id=1``.

---------------
Response Format
---------------

* The store has been created successfully: **HTTP/1.1 201 Created** and the ID of the store::

    {
     "store_id": 2
    }

* The store couldn’t be created: **HTTP/1.1 400 Bad Request**.

==============
Update a Store
==============

To update an existing store, send the PUT request to ``/api/stores/<company_id>/``. For example:

  PUT /api/stores/2/

Pass the fields with the store details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

* **company**—the name of the store.

* **storefront**—the URL of the store.

  .. important::

      The **storefront** field must have a unique value for each store.

* **secure_storefront**—the secure URL of the store.

* **timestamp**—the `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ when the store was created.

You can use the PUT request to add information about the company, which isn’t returned by GET requests, such as:

* **company_name**—the name of the company.

* **company_address**—the address of the company.

* **company_city**—the city of the company.

* **company_country**—the country of the company. Must be specified as the code (for example, ``US``). 

  .. hint::

      You can find those codes under **Administration → Shipping & taxes → Countries**.

* **company_state**—the state of the company. Can be specified as a code. 

  .. hint::

      You can find those codes under **Administration → Shipping & taxes → States**.

* **company_zipcode**—the zipcode of the company.

* **company_phone**—the primary phone number of the company.

* **company_phone_2**—the second phone number of the company.

* **company_fax**—the fax number of the company.

* **company_website**—the website of the company.

* **company_start_year**—the year when the company started working.

* **company_users_department**—the email address of the user department.

* **company_site_administrator**—the email address of the site administrator.

* **company_orders_department**—the email address of the order department.

* **company_support_department**—the email address of the help/support department.

* **company_newsletter_email**—the reply-to/newsletter email address.

------------
Example JSON
------------

::

  {
   "company": "Example",
   "storefront": "example.com/store",
   "secure_storefront": "example.com/store",
   "countries_list": [
        "GB", "US"
   ],
   "company_name": "My new company",
   "company_address": "41 Avenue",
   "company_city": "New York",
   "company_country": "US",
   "company_state": "NY",
   "company_zipcode": "10001",
   "company_phone": "1234-123-12345",
   "company_phone_2": "",
   "company_fax": "",
   "company_website": "example.com",
   "company_start_year": "2005",
   "company_users_department": "users@example.com",
   "company_site_administrator": "admin@example.com",
   "company_orders_department": "orders@example.com",
   "company_support_department": "support@example.com",
   "company_newsletter_email": "news@example.com"
  }

This request:

* changes the store name to *Example*.

* sets the URLs for HTTP and HTTPS access.

* changes the countries of the store to *Great Britain* and the *United States*, so that customers from those countries will be redirected to this store.

  .. important:

      When you update **countries_list**, make sure to specify all the countries that must be there. The countries that you don’t specify won’t on the list.

* adds more information about the company.

---------------
Response Format
---------------

* The store has been updated successfully: **HTTP/1.1 200 OK** and the company ID::
    
    {
     "store_id": "2"
    }

* The store couldn’t be updated: **HTTP/1.1 400 Bad Request**.

* The store doesn’t exist: **HTTP/1.1 404 Not Found**.

==============
Delete a Store
==============

To delete a store, send the DELETE request to ``/api/stores/<company_id>/``. For example::

  DELETE /api/stores/2

This request will delete a store with ``company_id=2``.

---------------
Response Format
---------------

* The store has been deleted successfully: **HTTP/1.1 204 No Content**.

* The store couldn’t be deleted: **HTTP/1.1 400 Bad Request**.

* The store doesn’t exist: **HTTP/1.1 404 Not Found**.
