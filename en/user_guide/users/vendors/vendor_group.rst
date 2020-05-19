***********************************************************
How To: Create a New User Group for Vendors' Administrators
***********************************************************

.. note::

    This functionality first appeared in Multi-Vendor 4.9.1. It is available only in Multi-Vendor Plus as a part of the :doc:`/user_guide/addons/vendor_privileges/index` add-on.

Marketplace owners can determine what :doc:`vendors' administrators </user_guide/users/vendors/index>` can do in their admin panels. To this end, they can:

* Create user groups with limited privileges for vendors' administrators.

* Set the user group as default, so that all newly-created vendors' administrators would end up in that group.

  .. hint::

      This change won't affect existing administrators. You can assign user groups to them manually, if necessary. That's why Step 3 in this instruction is optional.

===================================================
Step 0. Make Sure That Vendor Privileges Are Active
===================================================

By default, Multi-Vendor doesn't have user groups for vendors' administrators. That functionality is available only in Multi-Vendor Plus, and only if the **Vendor Privileges** add-on is active. :doc:`The article about the add-on </user_guide/addons/vendor_privileges/index>` explains what the add-on does and how to set it up.

===========================
Step 1. Create a User Group
===========================

#. In the Administration panel, go to **Customers → User groups**.

#. Click the **+** button on the right.

#. Enter the name your user group in the **User group** field.

#. Set the **Type** to *Vendor*.

#. Click the **Create** button.

   .. image:: img/vendor_group.png
       :align: center
       :alt: Specify the name and the type of the new customer group.

#. Open the newly-created group.

#. Configure the group's privileges as you see fit.

#. Click the **Save** button.

   .. image:: img/vendor_privileges.png
       :align: center
       :alt: Set the privileges for the selected group.

=======================================================
Step 2. Set a Default Group for Vendors' Administrators
=======================================================

#. Go to **Add-ons → Manage add-ons**.

#. Find the :doc:`/user_guide/addons/vendor_privileges/index` add-on and click on its name.

#. The settings of the add-on will open. The **Default user group for vendors' administrators** setting automatically assigns all newly-created vendor administrators to the user group of your choice.

#. Change the setting as you see fit. That way you won't need to manually change a user group every time when someone creates a vendor's administrator.

#. Once you've selected the user group, click **Save**.

   .. image:: img/default_vendor_group.png
       :align: center
       :alt: Choose the default user group for all newly-created vendor admins.

=================================================================
Step 3. Add a Group to Vendor's Administrator Manually (Optional)
=================================================================

#. Go to **Customers → Vendor's administrators**.

#. Click on the desired name to open the profile.

#. Switch to the **User groups** tab.

#. Set the status to **Active** for the group you've just created.

   .. note::

       Only the root administrator can assign user groups to other administrators. The root administrator is the administrator that is created by the system after the Multi-Vendor installation process is finished.

   .. image:: img/add_vendor_to_group.png
       :align: center
       :alt: Add a vendor's administrator to the group.
       
.. meta::
   :description: How to set permissions for vendors and what they can do in a Multi-Vendor marketplace?