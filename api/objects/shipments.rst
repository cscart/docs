*********
Shipments
*********

URLs
=====

*   http://example.com/api/**shipments**—refer to all shipments. Only GET and POST are supported.
*   http://example.com/api/**shipments/:id**—refer to a particular shipment. GET, PUT, and DELETE are supported.

Fields
======

A shipment has a number of properties, represented by fields.

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
    *   -   carrier*
        -   Carrier name
        -   ''
        -   Valid carrier name
    *   -   order_id*
        -   Order ID
        -   —
        -   Valid order ID
    *   -   products*
        -   Shipped products
        -   —
        -   JSON object with cart item ID as key and its quantity as value
    *   -   shipping*
        -   Shipping method name
        -   'Custom shipping method'
        -   Valid shipping method name
    *   -   shipping_id*
        -   Shipping method ID
        -   1
        -   Valid shipping method ID
    *   -   user_id*
        -   Customer's user ID
        -   —
        -   Valid used ID
    *   -   tracking_number
        -   Tracking number
        -   ''
        -   string
    *   -   comments
        -   ''
        -   Comments
        -   string
    *   -   group_key
        -   Supplier group key
        -   Set automatically
        -   Valid supplier grou key
    *   -   order_timestamp
        -   Order creation timestamp
        -   Set automatically
        -   Valid timestamp in UNIX format
