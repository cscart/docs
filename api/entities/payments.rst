***************
Payment Methods
***************

URLs
====

*   http://example.com/api/**payments**—refer to all products. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**payments/<id>**—refer to a particular product. ``GET``, ``PUT``, and ``DELETE`` are supported.

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
    *   -   payment*
        -   Payment name
        -   —
        -   string
    *   -   a_surcharge
        -   Absolute surcharge
        -   0.000
        -   float
    *   -   company_id
        -   Company ID
        -   Default company ID
        -   integer
    *   -   description
        -   Payment description
        -   ''
        -   string
    *   -   image
        -   Payment icon
        -   {}
        -   See :ref:`Main pair <main-pair>`
    *   -   instructions
        -   Payment instructions
        -   ''
        -   string
    *   -   lang_code
        -   Language code
        -   ``en``
        -   | ``en``
            | ``ru``
            | etc.
    *   -   localization
        -   String of comma-separated localization IDs
        -   ''
        -   string
    *   -   p_surcharge
        -   Per cent surcharge
        -   0.000
        -   float
    *   -   payment_category
        -   Payment category
        -   ``tab1``
        -   | ``tab1``—Credit card
            | ``tab2``—Internet payments
            | ``tab3``—Other payment options
    *   -   payment_id
        -   Payment ID
        -   Set automatically
        -   integer
    *   -   position
        -   Payment position in the payment list
        -   0
        -   integer
    *   -   processor
        -   Payment processor name
        -   —
        -   | One of the supported payment gateways or checkout providers
            | Leave empty for ``Offline``
    *   -   processor_id
        -   Payment processor ID
        -   0 (offline)
        -   integer
    *   -   processor_params
        -   Processor-specific parameters
        -   —
        -   JSON object
    *   -   processor_type
        -   Processor type
        -   —
        -   | ``C`` for Checkout
            | ``P`` for Payment gateway
            | Leave empty for the ``Offline`` processor
    *   -   status
        -   | Payment status
        -   ``A``
        -   | ``A`` for active
            | ``D`` for disabled
            | ``H`` for hidden
    *   -   surcharge_title
        -   Surcharge title
        -   ''
        -   | string
    *   -   tax_ids
        -   Tax IDs
        -   ''
        -   String of comma-separated tax IDs
    *   -   template
        -   Payment template
        -   ``views/orders/components/payments/business_check.tpl``
        -   Valid path to a payment template
    *   -   usergroup_ids
        -   User group IDs
        -   '0'
        -   String of comma-separated user group IDs
