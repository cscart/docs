*****
Users
*****

URLs
=====

*   http://example.com/api/**users**—refer to all users. Only GET and POST are supported.
*   http://example.com/api/**users/:id**—refer to a particular user. GET, PUT, and DELETE are supported.

Fields
======

A user has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***, mandatory only for an Affiliate account are marked with **\*\***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   email*
        -   User's e-mail
        -   —
        -   Valid e-mail address
    *   -   user_type*
        -   | User type:
            | ``A`` for Admin
            | ``C`` for Customer
            | ``P`` for Affiliate
        -   —
        -   | ``A``
            | ``C``
            | ``P``
    *   -   company_id*
        -   ID of the store or vendor the user belongs to
        -   Default company ID
        -   integer
    *   -   status*
        -   | Product status:
            | ``A`` for Active
            | ``D`` for Disabled
            | ``H`` for Hidden
        -   ``A``
        -   | ``A``
            | ``D``
            | ``H``
    *   -   firstname**
        -   User's first name
        -   —
        -   string
    *   -   lastname**
        -   User's last name
        -   —
        -   string
    *   -   company
        -   User company
        -   'Your company'
        -   string
    *   -   company_name
        -   Same as ``company``
        -   —
        -   string
    *   -   is_root
        -   | If ``Y``, the user is a root administrator,
            | if ``N``, the user is not a root administrator
        -   | ``Y`` for an administrator account
            | ``N`` for a non-administrator account
        -   | ``Y``
            | ``N``
    *   -   user_id
        -   User ID
        -   Set automatically
        -   integer
    *   -   user_login
        -   User login
        -   —
        -   string
    *   -   timestamp
        -   Creation timestamp
        -   Set automatically
        -   Valid timestamp in seconds

.. only:: addons

    Addons
    ------

    .. list-table::
        :header-rows: 0
        :stub-columns: 1
        :widths: 5 30 5 10

        *   -   points
            -   ?
            -   0
            -   integer
