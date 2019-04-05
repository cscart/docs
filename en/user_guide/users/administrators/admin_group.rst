****************************************
How To: Create a New Administrator Group
****************************************


You may want to limit what a certain administrator can do. This can be done by creating a new administrator group with limited rights and assigning it to the administrator.

----------

.. important::

    Only a root administrator can assign user groups to other administrators. The root administrator account is created automatically during CS-Cart or Multi-Vendor installation, or manually as described below.


If your administrator can't assign user groups, make sure that the root administrator account isn't a part of any user group itself. Then check the ``cscart_users`` table in the database and make sure that the ``is_root`` field for your administrator account is set to **Y**.

===========================
Step 1. Create a User Group
===========================

1.1. In the Administration panel go to **Customers → User groups**.

1.2. Click the **+** button on the right side of that page to open group creation pop-up.

1.3. Name your user group and set its **Type** to *Administrator*.

1.4. Click **Create**.

.. image:: img/admin_group.png
    :align: center
    :alt: Specify the name and the type of the new user group.

1.5. Open the newly created administrator group and adjust its privileges as you see fit.

1.6. Click **Save**.

.. image:: img/admin_privileges.png
    :align: center
    :alt: Set the privileges for the selected administrator group.

=======================================
Step 2. Add Administrators to the Group
=======================================

2.1. Go to **Customers → Administrators**.

2.2. Click the desired name to open the user's profile.

2.3. Switch to the **User groups** tab. 

2.4. Set the status to **Active** for the group you've just created.

.. important::

    After this administrator logs in, he/she will have the privileges enabled for his/her user group only.
