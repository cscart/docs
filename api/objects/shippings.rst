================
Shipping Methods
================

URLs
=====

*   http://example.com/api/**shippings**—refer to all products. Only GET and POST are supported.
*   http://example.com/api/**shippings/<id>**—refer to a particular product. GET, PUT, and DELETE are supported.

Fields
======

A product has a number of properties, represented by fields.

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
    *   -   shipping*
        -   Shipping name
        -   —
        -   string
    *   -   company_id
        -   Company ID
        -   Default company id
        -   integer
    *   -   delivery_time
        -   Delivery time
        -   ''
        -   string
    *   -   icon
        -   Shipping icon
        -   {}
        -   See :ref:`Main pair <main-pair>`
    *   -   localization
        -   String of comma-separated localization IDs
        -   ''
        -   string
    *   -   max_weight
        -   Maximal deliverable weight
        -   0.00
        -   float
    *   -   min_weight
        -   Minimal deliverable weight
        -   0.00
        -   float
    *   -   position
        -   Payment position in the payment list
        -   0
        -   integer
    *   -   rate_calculation
        -   Rate calculation
        -   ``M``
        -   | ``M`` for Manual
            | ``R`` for Real-time
    *   -   rates
        -   Rates
        -   {'rate_value': {
            | 'C': {},
            | 'I': {},
            | 'W': {}
            | },
        -   Array of rates
    *   -   service_id
        -   Shipping service ID
        -   0
        -   Valid shipping service ID
    *   -   service_params
        -   Shipping service parameters
        -   {}
        -   JSON object
    *   -   shipping_id
        -   Shipping ID
        -   Set automatically
        -   integer
    *   -   status
        -   | Shipping status
        -   ``A``
        -   | ``A`` for active
            | ``D`` for disabled
            | ``H`` for hidden
    *   -   tax_ids
        -   Tax IDs
        -   ''
        -   String of comma-separated tax IDs
    *   -   usergroup_ids
        -   User group IDs
        -   '0'
        -   String of comma-separated user group IDs

.. only:: addons

    Addons
    ------

    .. list-table::
        :header-rows: 0
        :stub-columns: 1
        :widths: 5 30 5 10

        *   -   supplier_id
            -   Supplier ID?
            -   —
            -   integer
