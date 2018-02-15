****************
Shipping Methods
****************

URLs
====

*   http://example.com/api/**shippings**—refer to all shipping methods. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**shippings/:id**—refer to a particular shipping method. ``GET``, ``PUT``, and ``DELETE`` are supported.

Pagination
==========

To get a specific number of shipping methods or list of shipping methods from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows shipping methods on a page with the defined number
    *   -   items_per_page
        -   Shows N shipping methods, where N - is a number defined in the parameter

**Examples:**

*   *http://example.com/api/shippings?page=5*

Response is an array with 10 shipping methods from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/shippings?items_per_page=20*

Response is an array with 20 shipping methods from the first page.

*   *http://example.com/api/shippings?page=5&items_per_page=20*

Response is an array with 20 shipping methods from the 5th page.

Fields
======

A shipping method has a number of properties, represented by fields.

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
        -   | {'rate_value': {
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
