********
Settings
********

URLs
=====

*   http://example.com/api/**settings**—refer to all settings. Only GET and POST are supported.
*   http://example.com/api/**settings/:id**—refer to a particular setting. GET, PUT, and DELETE are supported.

Fields
======

A setting has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **/***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   name*
        -   Setting name
        -   —
        -   string
    *   -   description
        -   Setting description?
        -   —
        -   string
    *   -   object_id
        -   Setting ID?
        -   Set automatically
        -   integer
    *   -   section_id
        -   ID of the parent section?
        -   —
        -   Valid section ID?
    *   -   section_tab_id
        -   ID of the parent tab
        -   —
        -   Valid tab ID?
    *   -   value
        -   Setting value
        -   Depends on the setting type
        -   Depends on the setting type
    *   -   edition_type
        -   Edition type
        -   —
        -   | PRO:ROOT
            | ULT:ROOT
            | ULT:VENDOR
            | MVE:ROOT
            | MVE:VENDOR
            | ROOT
            | VENDOR
    *   -   handler
        -   Name of the PHP function that generates setting variants
        -   ''
        -   string
    *   -   is_global
        -   Flag, defines whether the setting is global
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   object_type
        -   Setting type?
        -   —?
        -   ?
    *   -   position
        -   Setting position in the settings list
        -   0
        -   integer
    *   -   section_name
        -   Parent section name?
        -   ?
        -   ?
    *   -   section_tab_name
        -   Parent tab name?
        -   ?
        -   ?
    *   -   tooltip
        -   Tooltip
        -   —?
        -   string
    *   -   type*
        -   Setting type
        -   ?
        -   ?
    *   -   variants
        -   Setting variants
        -   ?
        -   List of possible setting values
