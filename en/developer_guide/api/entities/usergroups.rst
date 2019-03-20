**********
Usergroups
**********

====
URLs
====

* http://example.com/api/**usergroups**—refer to all user groups. Supports ``GET`` and ``POST``.

* http://example.com/api/**usergroups/:id**—refer to a particular user group. Supports ``GET``, ``PUT``, and ``DELETE``.

* http://example.com/api/**users/:id/usergroups/**—refer to the user groups that the specified user belongs to. Supports ``GET``.

* http://example.com/api/**users/:id/usergroups/:id**—refer to a particular user group that the specified user belongs to. Supports ``PUT`` and ``DELETE``.

.. important::

    Usergroup IDs **1** and **2** are reserved for **Guests** and **Registered users** respectively. These groups don't show up, unless you refer to them directly. You can't delete or modify these groups. 

=========
Filtering
=========

Use the following parameters to find user groups with specific properties.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Parameter
        -   Description
    *   -   type
        -   | Show user groups of specific type:
            | ``A``—administrator group
            | ``C``—customer group
    *   -   status
        -   | Show user groups with specific status:
            | ``A``—active
            | ``H``—hidden
            | ``D``—disabled

**Examples:**

*   *http://example.com/api/usergroups?status=A*

Response is an array with all **active** user groups.

*   *http://example.com/api/users?status=D&type=C*

Response is an array with all **customer groups** with the **Disabled** status.
       
======
Fields
======

A user group has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***).

.. note:: 

    Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 25 10 10

    *   -   Field name
        -   Description
        -   Available for methods
        -   Supported values
    *   -   usergroup_id
        -   The ID of the user group.
        -   ``GET``
        -   integer
    *   -   type*
        -   The type of the user group.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``A``—admins
            | ``C``—customers
    *   -   status*
        -   The status of the user group.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``A``—active
            | ``H``—hidden
            | ``D``—disabled
    *   -   usergroup
        -   The name of the user group.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   privileges
        -   The privileges of the members of this group. This only applies to administrator groups.
        -   | ``GET``
        -   array

=============
Example Usage
=============

----------------
GET /usergroups/
----------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/usergroups'

This example request returns the list of user groups.

--------------------
GET /usergroups/:id
--------------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/usergroups/3'

This example request returns the properties of the user group with the ``usergroup_id=3``.

-----------------
POST /usergroups/
-----------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

If you successfully create a user group, you will receive **HTTP/1.1 201 Created**.
 
If the user group couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Required fields:** *type*, *status*

**Available fields:** *status*, *type*, *usergroup*
 
.. code-block:: bash

    curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/usergroups' --data-binary 'type=A&status=D&usergroup=Managers'

This example request creates a new *administrator group* called *Managers*. The status of the user group is set to *Disabled*.

In the response you receive the ID of the user group.

.. code-block:: bash

    {usergroup_id: 5}

--------------------
PUT /usergroups/:id/
--------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

**Required fields:** *type*, *status*

**Available fields:** *status*, *type*, *usergroup*

.. code-block:: bash

    curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/usergroups/5' --data-binary 'type=A&status=A'

This example request sets the **status** of the user group with ``usergroup_id=5`` (**Managers** in our case) to *Active*.  

In the response you receive the ID of the user group.

.. code-block:: bash

    {usergroup_id: 5}

----------------------
DELETE /usergroups/:id
----------------------

If you successfully delete a user group, you will receive **HTTP/1.1 204 No Content**.

If the user group couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.

If the user group doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

.. code-block:: bash

    curl -X DELETE 'http://example.com/api/usergroups/5'

This example request deletes the user group with the ``usergroup_id=5``.

=====================
Users and User Groups
=====================

------------------
View User's Groups
------------------

Let's see what status a user with a ``user_id=3`` has in various user groups.

.. code-block:: bash

    curl -X GET 'http://example.com/api/users/3/usergroups'

In response you will receive arrays with usergroup IDs and the statuses of the user in those groups.

.. important::

    The request won't return the groups that have the **Available** status for that user.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 1 5

    *   -   Parameter
        -   Description
    *   -   link_id
        -   The ID of the link that assigns the user to the group.
    *   -   usergroup_id
        -   The ID of the user group.
    *   -   status
        -   | The status of the user in the group:
            | ``A``—**active**—the user is a part of the group
            | ``F``—**available**—the user is not a part of the group
            | ``P``—**pending**—the customer has requested to join the group
            | ``D``—**declined**—the customer's request to join the group has been declined

-------------------------------
Change User's Status in a Group
-------------------------------

If you want to add a user to a group, change the user's status in the group to **Active**. Let's add the user with ``user_id=3`` to the user group with ``usergroup_id=5``.

.. code-block:: bash

    curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/users/3/usergroups/5' --data-binary 'status=A'

This request adds the user to the specified group and sets the status to **Active**. You should receive the following message: **Status has been changed**.

If the user couldn’t be added to the group you will receive **HTTP/1.1 400 Bad Request**.

.. hint::

    You may receive **error 400** if the user group with the specified ID doesn't exist, or if you're trying to add a customer to an administrator group. 

If the user doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

------------------------
Remove User from a Group
------------------------

You can remove user from a group in two ways:

* by setting the status of the user in the group to **Available**:

  .. code-block:: bash

      curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/users/3/usergroups/5' --data-binary 'status=F'

* by using the ``DELETE`` method:

  .. code-block:: bash

          curl -X DELETE 'http://example.com/api/users/3/usergroups/5'

