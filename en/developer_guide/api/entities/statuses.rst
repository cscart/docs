********
Statuses
********

URLs
====

*   http://example.com/api/**statuses**—refer to all products. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**statuses/:id**—refer to a particular product. ``GET``, ``PUT``, and ``DELETE`` are supported.

Pagination
==========

To get a specific number of statuses or list of statuses from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows statuses on a page with the defined number
    *   -   items_per_page
        -   Shows N statuses, where N - is a number defined in the parameter

**Examples:**

*   *http://example.com/api/statuses?page=5*

Response is an array with 10 statuses from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/statuses?items_per_page=20*

Response is an array with 20 statuses from the first page.

*   *http://example.com/api/statuses?page=5&items_per_page=20*

Response is an array with 20 statuses from the 5th page.

Fields
======

A status has a number of properties, represented by fields.

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
    *   -   description*
        -   Status title
        -   —
        -   string
    *   -   email_header
        -   Header of an e-mail sent when the status is set
        -   ''
        -   HTML
    *   -   email_subj
        -   Subject of an e-mail sent when the status is set
        -   ''
        -   string
    *   -   is_default
        -   Flag, defines if the status is default (cannot be deleted). It is not recommended to make default status not default.
        -   ``N``
        -   | ``Y``
            | ``N``
    *   -   lang_code
        -   Language code
        -   ``en``
        -   | ``en``
            | ``ru``
            | etc.
    *   -   params
        -   Status parameters
        -   {}
        -   JSON object
    *   -   status
        -   Letter identifying the status
        -   Set automatically
        -   char
    *   -   status_id
        -   Status ID
        -   Set automatically
        -   integer
    *   -   type
        -   Status type
        -   ``O``
        -   Valid status type (only ``O`` by default)
