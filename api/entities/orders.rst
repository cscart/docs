******
Orders
******

URLs
====

*   http://example.com/api/**orders**—refer to all orders. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**orders/<id>**—refer to a particular order. ``GET``, ``PUT``, and ``DELETE`` are supported.

Pagination
==========

To get a specific number of orders or list of orders from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows orders on a page with the defined number
    *   -   items_per_page
        -   Shows N orders, where N - is a number defined in the parameter

**Examples:**

*   *http://example.com/api/orders?page=5*

Response is an array with 10 orders from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/orders?items_per_page=20*

Response is an array with 20 orders from the first page.

*   *http://example.com/api/orders?page=5&items_per_page=20*

Response is an array with 20 orders from the 5th page.

Fields
======

An order has a number of properties, represented by fields.

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
    *   -   b_address
        -   Billing address
        -   ''
        -   string
    *   -   b_address_2
        -   Billing address (line 2)
        -   ''
        -   string
    *   -   b_city
        -   City (billing address)
        -   ''
        -   string
    *   -   b_country
        -   Country code (billing address)
        -   ''
        -   2-letter country code
    *   -   b_country_descr
        -   Country (billing address)
        -   ''
        -   string
    *   -   b_firstname
        -   First name (billing)
        -   ''
        -   string
    *   -   b_lastname
        -   Last name (billing)
        -   ''
        -   string
    *   -   b_phone
        -   Phone (billing)
        -   ''
        -   string
    *   -   b_state
        -   State ID (billing address)
        -   ''
        -   integer
    *   -   b_state_descr
        -   State (billing address)
        -   ''
        -   string
    *   -   b_zipcode
        -   Zip code (billing address
        -   ''
        -   string
    *   -   discount
        -   Calculated discount value
        -   0.00
        -   float
    *   -   display_shipping_cost
        -   Shipping cost to be displayed
        -   0.00
        -   float
    *   -   display_subtotal
        -   Subtotal to be displayed
        -   0
        -   float
    *   -   doc_ids
        -   IDs of credit memo and invoice
        -   {}
        -   JSON object
    *   -   ip_address
        -   Customer IP addess
        -   ''
        -   valid IP address
    *   -   is_parent_order
        -   Multi-Vendor only: Flag, defines if the order is a parent order
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   issuer_id
        -   ID of the admin who created the order via the admin panel
        -   —
        -   integer
    *   -   lang_code
        -   Language code
        -   Default language code
        -   | ``en``
            | ``ru``
            | etc.
    *   -   localization_id
        -   Localization ID
        -   0
        -   integer
    *   -   need_shipment
        -   Flag, defines if the order needs shipment
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   notes
        -   Notes
        -   ''
        -   string
    *   -   order_id
        -   Order ID
        -   Set automatically
        -   integer
    *   -   parent_order_id
        -   Multi-Vendor only: ID of the parent order
        -   0 (no parent)
        -   integer
    *   -   payment_id
        -   Payment ID
        -   —
        -   integer
    *   -   payment_info
        -   Payment info
        -   ''
        -   string
    *   -   payment_method
        -   Payment method
        -   —
        -   See :doc:`Payment methods <payments>`
    *   -   payment_surcharge
        -   Payment surcharge
        -   0.00
        -   float
    *   -   products
        -   Products in the order
        -   {}
        -   See :doc:`Products <products>`
    *   -   promotion_ids
        -   Comma-separated promotion list
        -   ''
        -   string
    *   -   promotions
        -   Promotion list
        -   []
        -   array of promotions
    *   -   repaid
        -   For repayable orders: Flag, defines if the order is repaid
        -   0
        -   | 1
            | 0
    *   -   s_address
        -   Shipping address
        -   ''
        -   string
    *   -   s_address_2
        -   Shipping address (line 2)
        -   ''
        -   string
    *   -   s_city
        -   City (shipping address)
        -   ''
        -   string
    *   -   s_country
        -   Country code (shipping address)
        -   ''
        -   2-letter country code
    *   -   s_country_descr
        -   Country (shipping address)
        -   ''
        -   string
    *   -   s_firstname
        -   First name (shipping)
        -   ''
        -   string
    *   -   s_lastname
        -   Last name (shipping)
        -   ''
        -   string
    *   -   s_phone
        -   Phone (shipping)
        -   ''
        -   string
    *   -   s_state
        -   State ID (shipping address)
        -   ''
        -   integer
    *   -   s_state_descr
        -   State (shipping address)
        -   ''
        -   string
    *   -   s_zipcode
        -   Zip code (shipping address
        -   ''
        -   string
    *   -   shipment_ids
        -   Shipment IDs
        -   ''
        -   Comma-separated list of shipment IDs
    *   -   shipping
        -   Shipping
        -   {}
        -   See :doc:`Shipping methods <shippings>`
    *   -   shipping_cost
        -   Shipping cost
        -   0.00
        -   float
    *   -   shipping_ids
        -   Comma-separated list of shipping IDs
        -   ''
        -   string
    *   -   status
        -   Order status (single letter)
        -   'O'
        -   See :doc:`Statuses <statuses>`
    *   -   subtotal
        -   Subtotal
        -   0.00
        -   float
    *   -   subtotal_discount
        -   Subtotal discount
        -   0.00
        -   float
    *   -   tax_exempt
        -   Flag, defines if tax exempt is on
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   tax_subtotal
        -   Subtotal tax
        -   0.00
        -   float
    *   -   taxes
        -   Array of tax IDs
        -   empty array
        -   array
    *   -   timestamp
        -   UNIX-format timestamp
        -   Set automatically
        -   integer
    *   -   total
        -   Total
        -   0.00
        -   float
    *   -   user_id
        -   Customer ID
        -   0 (guest customer)
        -   integer
