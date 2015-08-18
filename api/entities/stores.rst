******
Stores
******

URLs
====

*   http://example.com/api/**stores**—refer to all stores. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**stores/:id**—refer to a particular store. ``GET``, ``PUT``, and ``DELETE`` are supported.

Examples
========

Get all stores
--------------

.. code-block:: bash

    curl --user admin@example.com:APIkey -X GET 'http://example.com/api/stores'

Response:

.. code-block:: json

	{
	    "stores": [{
	        "company_id": "2",
	        "lang_code": "",
	        "email": "",
	        "company": "Sample store",
	        "timestamp": "1438165755",
	        "status": "A",
	        "storefront": "example.com\/samplestore",
	        "secure_storefront": "example.com\/samplestore",
	        "average_rating": null,
	        "company_thread_ids": "2_0"
	    }, {
	        "company_id": "1",
	        "lang_code": "en",
	        "email": "store@example.com",
	        "company": "My Company",
	        "timestamp": "1269610461",
	        "status": "A",
	        "storefront": "example.com\/cscart_433",
	        "secure_storefront": "example.com\/cscart_433",
	        "average_rating": null,
	        "company_thread_ids": "1_0"
	    }],
	    "params": []
	}

Get store data for the store with ID 2
--------------------------------------

.. code-block:: bash

    curl --user admin@example.com:APIkey -X GET 'http://example.com/api/stores/2'

Response:

.. code-block:: json

	{
	    "company_id": "1",
	    "lang_code": "en",
	    "email": "store@example.com",
	    "company": "My Company",
	    "timestamp": "1269610461",
	    "status": "A",
	    "storefront": "example.com\/cscart_433",
	    "secure_storefront": "example.com\/cscart_433",
	    "average_rating": null,
	    "company_thread_ids": "1_0"
	}

Create a store
--------------

.. code-block:: bash

    curl --user admin@example.com:APIkey --header 'Content-Type: application/json'\
    -d '{"company": "My Awesome Store", "storefront": "http://myawesomestore.com"}'\
    -X POST 'http://example.com/api/stores'

Response:

.. code-block:: json

    {
        "store_id": "3"
    }

Create a store from an existing one cloning products and categories
-------------------------------------------------------------------

.. code-block:: bash

    curl --user admin@example.com:APIkey --header 'Content-Type: application/json'\
    -d '{"company": "Another Awesome Store", "storefront": "http://anotherawesomestore.com",\
    "clone_from": 2, "clone": {"products": "Y", "categories": "Y"}}'\
    -X POST 'http://example.com/api/stores'

Response:

.. code-block:: json

    {
        "store_id": "4"
    }

Update company description
--------------------------

.. code-block:: bash

    curl --user admin@example.com:APIkey --header 'Content-Type: application/json'
    -d '{"company_description": "This is my awesome store description"}'
    -X PUT 'http://example.com/api/stores/3'

Response:

.. code-block:: json

    {
        "store_id": "3"
    }

Pagination
==========

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows all stores on a page with the defined number
    *   -   items_per_page
        -   Shows N first stores, where N - is a number defined in the parameter
        
Fields
======

A setting has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   company*
        -   Store name
        -   —
        -   string
    *   -   storefront*
        -   Storefront URL
        -   —
        -   valid URL
    *   -   company_id
        -   Store ID
        -   Set automatically
        -   integer
    *   -   email
        -   ?
        -   —
        -   Valid e-mail address
    *   -   lang_code
        -   Language code
        -   Default language code
        -   | ``en``
            | ``ru``
            | etc.
    *   -   timestamp
        -   Store creation timestamp
        -   Set automatically
        -   Valid timestamp in UNIX format
    *   -   status
        -   Status
        -   ``A``
        -   | ``A`` for active
            | ``D`` for disabled
            | ``H`` for hidden
    *   -   secure_storefront
        -   Secure storefront URL
        -   —
        -   Valid URL
    *   -   company_description
        -   Store description
        -   ''
        -   string
    *   -   redirect_customer
        -   Redirect visitors to country-specific storefronts (IP-defined)
        -   ``Y``
        -   | ``Y``
            | ``N``
    *   -   entry_page
        -   Global entry page (if ``redirect_customer`` is ``N``)
        -   index
        -   | all_pages
            | none
            | index
    *   -   countries_list
        -   List of countries assigned to the store
        -   []
        -   Array of country codes ('DZ', 'AS', etc.)
    *   -   company_name
        -   Company name
        -   ''
        -   string
    *   -   company_address
        -   Company address
        -   ''
        -   string
    *   -   company_city
        -   Company city
        -   ''
        -   string
    *   -   company_country
        -   Company country
        -   ''
        -   string
    *   -   company_state
        -   Company state
        -   ''
        -   string
    *   -   company_zipcode
        -   Company zip code
        -   ''
        -   string
    *   -   company_phone
        -   Company phone
        -   ''
        -   string
    *   -   company_phone_2
        -   Company phone 2
        -   ''
        -   string
    *   -   company_fax
        -   Company fax
        -   ''
        -   string
    *   -   company_website
        -   Company website
        -   ''
        -   string
    *   -   company_start_year
        -   Company operation start year
        -   ''
        -   string
    *   -   company_users_department
        -   User department e-mail address
        -   ''
        -   string
    *   -   company_site_administrator
        -   Site administrator e-mail address
        -   ''
        -   string
    *   -   company_orders_department
        -   Order department e-mail address
        -   ''
        -   string
    *   -   company_support_department
        -   Help/Support department e-mail address
        -   ''
        -   string
    *   -   company_newsletter_email
        -   Reply-to newsletter e-mail address
        -   ''
        -   string
    *   -   clone_from
        -   ID of the store to clone data from
        -   —
        -   Valid store ID
    *   -   clone
        -   Store attributes to clone
        -   []
        -   | Object of store attributes as keys and ``Y`` as values.
            | Available attributes are:

            *  layouts
            *   settings
            *   profile_fields
            *   pages
            *   promotions
            *   shippings
            *   payments
            *   product_filters
            *   product_features
            *   sitemap
            *   static_data_clone
            *   products
            *   categories
