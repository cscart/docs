*******
Vendors
*******

.. important::

    Vendors are available only in Multi-Vendor.

Multi-Vendor allows you to run an online shopping mall, where multiple independent :doc:`vendors <../../../user_guide/users/vendors/index>` can sell their products.

.. contents::
   :backlinks: none
   :local:

================
List All Vendors
================

To get a list of vendors, send a GET request to ``/api/vendors/``::

  GET /api/vendors/

This request returns the list vendors with their details.

.. note::

    The number of the returned vendors depends on Multi-Vendor settings and can be altered by adding pagination parameters to the URL.

----------------------------------
Pagination, Sorting, and Filtering
----------------------------------

Add these parameters to the path to specify what vendors will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/vendors`` is a page with a limited number of vendors. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of vendors on a page.
    *   -   sort_by
        -   ``name``
        -   Determines the parameter by which the vendors are sorted in the response. Available parameters are ``name``, ``timestamp``, ``email``, ``status``.
    *   -   sort_order
        -   ``desc``
        -   | Determines the sorting order:
            | ``asc``—ascending
            | ``desc``—descending
    *   -   email
        -
        -   Searches only for the vendors with the specified email address.
    *   -   timestamp
        -   
        -   Searches only for the vendors created at the specified time.
    *   -   status
        -   
        -   | Searches only for the vendors with the specified status.
            | ``N``—new
            | ``A``—active
            | ``P``—pending
            | ``D``—disabled
    *   -   company
        -   
        -   Searches only for the vendor with the specified name.

**Examples:**

* ``GET /api/vendors/?page=2&items_per_page=2``

  Response is an array with the information about 2 vendors from the 2nd page of the list of vendors.

* ``GET /api/vendors/?email=vendor@example.com``

  Response is an array the information about the vendor with the specified email.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/vendors/

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
   "vendors": [
      {
       "company_id": "2",
       "lang_code": "en",
       "email": "acme_corp@example.com",
       "company": "ACME Corp",
       "timestamp": "1269610461",
       "status": "A",
       "seo_name": "acme-corp",
       "seo_path": "",
       "average_rating": null,
       "company_thread_ids": "2_0"
      },
      {
       "company_id": "1",
       "lang_code": "en",
       "email": "simtech@example.com",
       "company": "Simtech",
       "timestamp": "1269610461",
       "status": "A",
       "seo_name": "simtech",
       "seo_path": "",
       "average_rating": null,
       "company_thread_ids": "1_0"
      }
   ],
   "params": [0]
  }

=====================
Get a Specific Vendor
=====================

To get the details of a specific vendor, send a GET request to ``/api/vendors/<company_id>/``. For example::

  GET /api/vendors/1

---------------
Response Format
---------------

* The vendor exists: **HTTP/1.1 200 OK** and JSON with the vendor details::
    
    {
     "company_id": "1",
     "lang_code": "en",
     "email": "simtech@example.com",
     "company": "Simtech",
     "timestamp": "1269610461",
     "status": "A",
     "seo_name": "simtech",
     "seo_path": "",
     "average_rating": null,
     "company_thread_ids": "1_0"
    }

* The vendor doesn’t exist: **HTTP/1.1 404 Not Found**.

--------------
Vendor Details
--------------
The fields below represent various vendor details.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   company_id
        -   *integer*
        -   A unique identifier of the vendor.
    *   -   lang_code
        -   *string*
        -   The language code, for example, ``en``.
    *   -   email
        -   *string*
        -   The email address of the vendor.
    *   -   company
        -   *string*
        -   The name of the vendor.
    *   -   timestamp
        -   *integer*
        -   The `UNIX time <https://en.wikipedia.org/wiki/Unix_time>`_ when the vendor was created.
    *   -   status
        -   *string*
        -   | The :doc:`status of the vendor <../../../user_guide/users/vendors/vendor_statuses>`:
            | ``N``—new
            | ``A``—active
            | ``P``—pending
            | ``D``—disabled
    *   -   seo_name
        -   *string*
        -   | The SEO name of the vendor’s microstore.
            | **Note:** This field is added by the :doc:`SEO <../../../user_guide/addons/seo/index>` add-on.
    *   -   average_rating
        -   *float*
        -   | The average rating of the company.
            |
            | **Note:** This field is added by the :doc:`Comments and Reviews <../../../user_guide/addons/comments_and_reviews/index>` add-on.
    *   -   company_thread_ids
        -   *string*
        -   | The thread ID to which the reviews about the vendor are linked. It appears as ``<company_id>_<thread_id>``, for example *2_27*.
            |
            | **Note:** This field is added by the :doc:`Comments and Reviews <../../../user_guide/addons/comments_and_reviews/index>` add-on. The add-on creates this field via the hook every time the ``fn_get_companies`` function is executed. The add-on also adds grouping by this field.

===============
Create a Vendor
===============

Send a POST request to ``/api/vendors/``::

  POST /api/vendors/

Pass the following fields with vendor details in the HTTP request body in accordance with the ``Content-Type``. Required fields are marked with *****.

.. note::

    Some of the fields below are not returned by GET requests, but can be used in POST or PUT requests nonetheless.

* **company***—the name of the vendor.

* **storefront***—this field is required by REST API, but it doesn’t serve any purpose in Multi-Vendor. Pass any value here, for example, ``api``::

    {
     ...
     "storefront": "api",
     ...
    }

  .. important::

      The **storefront** field must have a unique value for each vendor you create via REST API.

* **company_description**—the description of the vendor. You can use HTML code here.

* **status**—the :doc:`status of the vendor <../../../user_guide/users/vendors/vendor_statuses>`:

  * ``N``—new

  * ``A``—active (the default status)

  * ``P``—pending

  * ``D``—disabled

* **lang_code**—a two-letter language code, for example, ``en``.

* **email***—vendor’s email address.

* **phone***—vendor’s phone number

* **url**—vendor’s website.

* **fax**—vendor’s fax number.

* **address***—vendor’s address.

* **city***—vendor’s city.

* **country***—vendor’s country. Must be specified as the code (for example, ``US``). 

  .. hint::

      You can find those codes under **Administration → Shipping & taxes → Countries**.

* **state***—vendor’s state. Can be specified as a code. 

  .. hint::

      You can find those codes under **Administration → Shipping & taxes → States**.

* **zipcode***—vendor’s zip code.

* **pre_moderation**—if you set it to ``Y``, any new products from the vendor will require approval by the store administrator.

* **pre_moderation_edit**—if you set it to ``Y``, any updates of product information by the vendor will require approval by the store administrator.

* **pre_moderation_edit_vendors**—if you set it to ``Y``, any updates of the vendor’s profile will require prior approval by the store administrator.

  .. note::

      The pre_moderation fields will apply only if you configure the :doc:`Vendor Data Premoderation <../../../user_guide/addons/vendor_data_premoderation/index>` add-on accordingly.


* **categories**—the list of categories where the vendor is allowed to create products, separated by commas. If you leave it empty or don’t specify this parameter, the vendor will be able to create products in any category.

* **shippings**—the array with the shipping methods available to the vendor. For example, if you want to allow the vendor to use shipping methods with shipping IDs 3 and 4, this is how the array will look like::

    {
     ...
     "shippings": {
         "1": "3",
         "2": "4"
     },
     ...
    }

  .. important::

      This array includes only the shipping methods created by the store administrator, not by a vendor’s administrator.

* **commission**—the size of the commission taken from vendor on every sale. It uses *xx.xx* format.

* **commission_type**—the type of the commission taken from the vendor:

  * ``A``—the commission is a certain amount specified in the store’s primary currency.

  * ``P``—the commission is a percentage taken from the vendor’s sales.

  .. note::

      Starting with Multi-Vendor 4.3.6, **commission** and **commission_type** are part of the **Vendor Commission** add-on.

* **terms**—the text of vendor’s terms and conditions. You can use HTML code here.

  .. note::

      This field is added by the **Vendor’s Terms and Conditions** add-on.

------------
Example JSON
------------

::

  {
    "company": "New Vendor",
    "company_description": "<p>This is the description of the new vendor.</p>",
    "storefront": "example.com",
    "status": "N",
    "lang_code": "en",
    "email": "test_vendor@example.com",
    "phone": "555555555",
    "url": "http://example.com",
    "fax": "+555555555",
    "address": "Boston street",     
    "city": "Boston",     
    "state": "MA",
    "country": "US",
    "zipcode": "02125",     
    "pre_moderation": "Y",
    "pre_moderation_edit": "Y",
    "pre_moderation_edit_vendors": "N",
    "categories": "253,252",
    "shippings": {
       "1": "1",
       "2": "3"
    },
    "commission": "10.55",
    "commission_type": "A",
    "terms": "<p>These are the terms and conditions you must accept before you can buy products from New Vendor.</p>"
  }

---------------
Response Format
---------------

* The vendor has been created successfully: **HTTP/1.1 201 Created** and the ID of the vendor::

    {
     "store_id": 2
    }

* The vendor couldn’t be created: **HTTP/1.1 400 Bad Request**.

===============
Update a Vendor
===============

To update an existing vendor, send the PUT request to ``/api/vendors/<company_id>/``. For example::

  PUT /api/vendors/2/

Pass the fields with the vendor details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

------------
Example JSON
------------

::

  {
   "company": "Example",
   "email": "test@example.com",
   "shippings": {
       "1": "1"
    },
    "commission": "0",
    "commission_type": "A"
  }

This request:

* changes the vendor’s name to *Example*.

* changes the vendor’s email address to *test@example.com*.

* makes only the shipping method with ``shipping_id=1`` available to the vendor.

  .. note:

      When you update **shippings**, make sure to specify all the global shipping methods that must be available to the vendor. The methods you don't specify will not be available.

* sets the commission taken from the vendor’s sales to 0.

---------------
Response Format
---------------

* The vendor has been updated successfully: ``HTTP/1.1 200 OK`` and the company ID::
    
    {
     "store_id": "2"
    }

* The vendor couldn’t be updated: **HTTP/1.1 400 Bad Request**.

* The vendor doesn’t exist: **HTTP/1.1 404 Not Found**.

===============
Delete a Vendor
===============

To delete a vendor, send the DELETE request to ``/api/vendors/<company_id>/``. For example::

  DELETE /api/vendors/2

This request will delete a vendor with ``company_id=2``.

---------------
Response Format
---------------

* The vendor has been deleted successfully: **HTTP/1.1 204 No Content**.

* The vendor couldn’t be deleted: **HTTP/1.1 400 Bad Request**.

* The vendor doesn’t exist: **HTTP/1.1 404 Not Found**.
