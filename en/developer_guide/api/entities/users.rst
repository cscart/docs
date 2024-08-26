*****
Users
*****

URLs
====

*   http://example.com/api/**users**—refer to all users. Only ``GET`` and ``POST`` are supported.
*   http://example.com/api/**users/:id**—refer to a particular user. ``GET``, ``PUT``, and ``DELETE`` are supported.

Pagination
==========

To get a specific number of users or list of users from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows users on a page with the defined number
    *   -   items_per_page
        -   Shows N users, where N - is a number defined in the parameter

**Examples:**

*   *http://example.com/api/users?page=5*

Response is an array with 10 users from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/users?items_per_page=20*

Response is an array with 20 users from the first page.

*   *http://example.com/api/users?page=5&items_per_page=20*

Response is an array with 20 users from the 5th page.
       
Fields
======

A user has a number of properties, represented by fields.

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
    *   -   email*
        -   User's e-mail
        -   —
        -   Valid e-mail address
    *   -   user_type*
        -   | User type:
            | ``A`` for Admin
            | ``C`` for Customer
        -   —
        -   | ``A``
            | ``C``
    *   -   company_id*
        -   ID of the store or vendor the user belongs to
        -   Default company ID
        -   integer
    *   -   status*
        -   | User status:
            | ``A`` for Active
            | ``D`` for Disabled
        -   ``A``
        -   | ``A``
            | ``D``
    *   -   firstname
        -   User's first name
        -   —
        -   string
    *   -   lastname
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
        -   User ID. Used only if the *Use email as login* setting is disabled
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
    *   -   password
        -   The value of this field is `md5 hash <http://www.gohacking.com/what-is-md5-hash/>`_ of user password. Used only when creating and updating a user
        -   —
        -   string

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
