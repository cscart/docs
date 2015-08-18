****************
Product Features
****************

URLs
====

*   http://example.com/api/**features**—refer to all product features. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**features/:id**—refer to a particular product feature. ``GET``, ``PUT``, and ``DELETE`` are supported.
*   http://example.com/api/**products/:id/features**—refer to all features of a particular :doc:`product <products>`.
*   http://example.com/api/**products/:id/features/:id**—refer to a particular feature in a particular product.

Pagination
==========

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows all features on a page with the defined number
    *   -   items_per_page
        -   Shows N first features, where N - is a number defined in the parameter

Fields
======

A product feature has a number of properties, represented by fields.

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
    *   -   company_id*
        -   Store or vendor to which the feature belongs
        -   Default company ID
        -   Valid company ID
    *   -   description*
        -   Feature name
        -   ''
        -   string
    *   -   feature_type*
        -   Feature type
        -   —
        -   | ``C`` for Check box:Single
            | ``M`` for Check box:Multiple
            | ``S`` for Select box:Text
            | ``N`` for Select box:Number
            | ``E`` for Select box:Brand/Manufacturer
            | ``T`` for Others:Text
            | ``O`` for Others:Number
            | ``D`` for Others:Date
            | ``G`` for features group
    *   -   categories_path
        -   Categories to which the feature can be applied
        -   ''
        -   Comma-separated string of category IDs
    *   -   comparison
        -   Flag, take the feature into account on product comparison or not
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   display_on_catalog
        -   Flag, show feature in product catalog or not
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   display_on_product
        -   Flag, show feature on detailed product page
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   display_on_header
        -   Flag, if enabled, the feature is shown under the product header
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   feature_id
        -   Feature ID
        -   Set automatically
        -   integer
    *   -   full_description
        -   Feature description
        -   ''
        -   string
    *   -   group_position
        -   Position in group
        -   0
        -   integer
    *   -   parent_id
        -   ID of the parent group (``0`` if no parent group)
        -   0
        -   integer
    *   -   position
        -   Feature position in the feature list
        -   0
        -   integer
    *   -   prefix
        -   Feature name prefix
        -   ''
        -   string
    *   -   status
        -   Status
        -   ``A``
        -   | ``A`` for active
            | ``D`` for disabled
            | ``H`` for hidden
    *   -   suffix
        -   Feature name suffix
        -   ''
        -   string
    *   -   value
        -   Feature value
        -   —
        -   Value depending on the feature type
    *   -   value_int
        -   Feature integer value
        -   —
        -   integer
    *   -   variant_id (only for types with variants)
        -   ID of the selected variant
        -   —
        -   integer
    *   -   variants (only for types with variants)
        -   Available feature value variants
        -   —
        -   array with variant ID as key and variant data as value (content explained :ref:`below <product-feature-variants>`)


.. _product-feature-variants:

Product Feature Variants
------------------------

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   description
        -   Variant description
        -   ''
        -   string
    *   -   feature_id
        -   ID of the feature the variant is assigned to
        -   —
        -   integer
    *   -   feature_type
        -   Type of the feature the variant is assigned to
        -   —
        -   Valid feature type (see above)
    *   -   image_pair
        -   ``Brand/Manufacturer`` only: Images
        -   NULL
        -   Valid :ref:`image pair <main-pair>`
    *   -   lang_code
        -   Language code
        -   Default language code
        -   Valid language code (see above)
    *   -   meta_description
        -   ``Brand/Manufacturer`` only: Meta description
        -   ''
        -   string
    *   -   meta_keywords
        -   ``Brand/Manufacturer`` only: Meta keywords
        -   ''
        -   string
    *   -   page_title
        -   ``Brand/Manufacturer`` only: Page title
        -   ''
        -   string
    *   -   position
        -   Variant position
        -   0
        -   integer
    *   -   selected
        -   ID of the selected variant
        -   Set automatically
        -   integer
    *   -   url
        -   ``Brand/Manufacturer`` only: URL
        -   ''
        -   string
    *   -   variant
        -   Variant name
        -   —
        -   string
    *   -   variant_id
        -   Variant ID
        -   Set automatically
        -   integer
