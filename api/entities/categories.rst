**********
Categories
**********

URLs
====

*   http://example.com/api/**categories**—refer to all categories. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**categories/:id**—refer to a particular category. ``GET``, ``PUT``, and ``DELETE`` are supported..
*   http://example.com/api/**categories/:id/products**—refer to all :doc:`products <products>` of a particular category.
*   http://example.com/api/**categories/:id/products/:id**—refer to a particular product in a particular category.

Nested Objects
==============

*   :doc:`Products <products>`

Fields
======

A category has a number of properties, represented by fields.

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
    *   -   category*
        -   Category name
        -   —
        -   string
    *   -   company_id*
        -   ID of the store or vendor the category belongs to
        -   Default company ID
        -   integer
    *   -   status*
        -   | Category status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
        -   ``A``
        -   | ``A``
            | ``D``
            | ``H``
    *   -   age_limit
        -   Age access restriction value in years
        -   0
        -   integer
    *   -   age_verification
        -   Activate/disable age verification
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   age_warning_message
        -   Forbidden age warning message
        -   ''
        -   string
    *   -   category_id
        -   Category ID
        -   Set automatically
        -   integer
    *   -   default_layout
        -   Default product list layout
        -   'default'
        -   Valid product template name
    *   -   description
        -   Category description
        -   ''
        -   string
    *   -   id_path
        -   Parent category ID chain
        -   Generated automatically
        -   Comma-separated sequence of category IDs
    *   -   lang_code
        -   Language code
        -   Default language code
        -   | ``en``
            | ``ru``
            | etc.
    *   -   localization
        -   String of comma-separated localization IDs
        -   ''
        -   string
    *   -   main_pair
        -   Full image and thumbnail pair
        -   empty array
        -   Main pair array (see :ref:`description <main-pair>`)
    *   -   meta_description
        -   Meta description
        -   ''
        -   string
    *   -   meta_keywords
        -   Meta keywords
        -   ''
        -   string
    *   -   page_title
        -   Product page title
        -   ''
        -   string
    *   -   parent_age_limit
        -   Parent category age access restriction value in years
        -   0
        -   integer
    *   -   parent_age_verification
        -   Parent category activate/disable age verification
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   parent_id
        -   Parent category ID
        -   0 (root category ID)
        -   integer
    *   -   position
        -   Category position in the category list
        -   Set automatically
        -   integer
    *   -   product_columns
        -   Number of product columns displayed in a template
        -   1
        -   integer
    *   -   product_count
        -   Number of products
        -   0
        -   integer
    *   -   product_details_layout
        -   Product details page layout
        -   'default'
        -   Valid product template name
    *   -   selected_layouts
        -   Available product list layouts
        -   —
        -   Serialized array of template names
    *   -   seo_name
        -   SEO name for the category page
        -   ''
        -   string
    *   -   timestamp
        -   Creation timestamp
        -   Set automatically
        -   Valid timestamp in seconds
    *   -   usergroup_ids
        -   User group IDs
        -   '0'
        -   String of comma-separated user group IDs

.. only:: addons

    Addons
    ------

    .. list-table::
        :header-rows: 1
        :stub-columns: 1
        :widths: 5 30 5 10

        *   -   external_id
            -   ?
            -   ''
            -   string
        *   -   is_op
            -   ?
            -   ?
            -   ?
