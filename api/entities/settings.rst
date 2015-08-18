********
Settings
********

URLs
====

*   http://example.com/api/**settings**—refer to all settings. Only ``GET`` is supported.
*   http://example.com/api/**settings/:id**—refer to a particular setting. ``GET`` and ``PUT`` are supported.

Pagination
==========

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows all settings on a page with the defined number
    *   -   items_per_page
        -   Shows N first settings, where N - is a number defined in the parameter

Fields
======

A setting has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 15

    *   -   Field name
        -   Description
        -   Supported values
    *   -   name*
        -   Setting name
        -   string
    *   -   description
        -   Setting description
        -   string
    *   -   object_id
        -   Setting ID
        -   integer
    *   -   section_id
        -   ID of the parent section
        -   Valid section ID
    *   -   section_tab_id
        -   ID of the parent tab
        -   Valid tab ID
    *   -   value
        -   Setting value
        -   Depends on the setting type
    *   -   edition_type
        -   Edition type
        -   | PRO:ROOT
            | ULT:ROOT
            | ULT:VENDOR
            | MVE:ROOT
            | MVE:VENDOR
            | ROOT
            | VENDOR
    *   -   handler
        -   Name of the PHP function that generates setting variants
        -   string
    *   -   is_global
        -   Flag, defines whether the setting is global
        -   | ``Y``
            | ``N``
    *   -   object_type
        -   Setting type
        -   —
    *   -   position
        -   Setting position in the settings list
        -   integer
    *   -   section_name
        -   Parent section name
        -   —
    *   -   section_tab_name
        -   Parent tab name
        -   —
    *   -   tooltip
        -   Tooltip
        -   string
    *   -   type*
        -   Setting type
        -   | ``I`` - input
            | ``T`` - textarea
            | ``R`` - radiogroup
            | ``S`` - selectbox
            | ``P`` - password
            | ``C`` - checkbox
            | ``M`` - multiple select
            | ``N`` - multiple checkboxes
            | ``X`` - countries list
            | ``W`` - states list
            | ``F`` - file
            | ``O`` - info
            | ``H`` - header
            | ``B`` - selectable box
            | ``E`` - template
            | ``Z`` - permanent template
            | ``D`` - hidden
    *   -   variants
        -   Setting variants
        -   List of possible setting values
