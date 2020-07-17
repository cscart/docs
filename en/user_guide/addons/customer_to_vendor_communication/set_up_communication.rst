******************************************
How to Configure the Message Center Add-on
******************************************

.. contents::
    :backlinks: none
    :local:

Basic Add-on Settings
=====================

#. Install the :doc:`Message center </user_guide/addons/customer_to_vendor_communication/index>` add-on just like :doc:`any other add-on </user_guide/addons/1manage_addons>` .

#. Click the add-on name to open it's settings.

   * **General**:
   
     * **Customer-to-seller communication** — tick the box, if you want to allow your vendors to communicate with customers.
     
     * **Vendor-to-admin communication** — tick the box, if you want to allow your vendors to communicate with you.
     
   * **For customers:**
   
     * **Contact button on product pages** — tick the box, if you want to allow your customer to send you messages from the product pages.
     
     * **Contact button in vendor microstore** —  tick the box, if you want the **Ask a question** button to appear on the vendor's microstore page.

       .. important::

           This setting is only affects those vendors who have their microstore enabled in the :doc:`vendor plan </user_guide/users/vendors/manage_vendor_plans>`.

How to Restrict the Communication between Vendors and Other CS-Cart Users?
==========================================================================

The **Message center** add-on in conjunction with the :doc:`Vendor privileges </user_guide/addons/vendor_privileges/index>` add-on allows the marketplace owner to decide how and with whom to communicate.

.. important::

    The :doc:`Vendor privileges </user_guide/addons/vendor_privileges/index>` add-on is only available for Multi-Vendor Plus and Multi-Vendor Ultimate users.

How to Restrict the Communication between Vendors and Customers?
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Let's say you want your vendors to read the messages from customers, but only you could answer them. To do this:

#. Open the **Customers → User groups** page.

#. Click the name of the **Vendor** user group.

#. In the **Customer privileges** set the **Message center: customer-to-vendor communication** to *Can view only*. If you choose the *No access* option, the vendors will not even be able to read messages from the customers.

#. Click **Save**.

   .. image:: img/vendor_priviledges_customers.png
       :align: center
       :alt: Restricting the access to dialogues with customers to vendors
      
How to Forbid Your Vendors to Answer Your Messages?
+++++++++++++++++++++++++++++++++++++++++++++++++++

If you want to use the **Message center** add-on only as a tool for announcments, but do not want your vendors to answer your messages:

#. Open the **Customers → User groups** page.

#. Click the name of the **Vendor** user group.

#. In the **Administration privileges** section, set the **Message center: vendor-to-admin communication** to *Can view only*. If you choose the *No access* option, the vendors will not even be able to read messages from you.

#. Click **Save**.

   .. image:: img/vendor_priviledges_administration.png
       :align: center
       :alt: Restricting the access to dialogues with you to vendors

How to Set Restrictions for Specific Vendors?
+++++++++++++++++++++++++++++++++++++++++++++

Let's say you want to forbid specific vendors to read or answer messages, not all of them.

#. Open the **Customers → User groups** page.

#. Create a new user group and set it's **Type**.

#. Click the **Create** button.

   .. image:: img/add_group.png
       :align: center
       :alt: Adding a new group

#. In the user group settings, next to the **Message center: customer-to-vendor communication** and **Message center: vendor-to-admin communication** fields choose the options you need.

#. Open the **Vendors → Vendors** page.

#. Choose a vendor you want to set restrictions to, and click his name.

#. The vendor's settings will open. Click **View vendor users**.

#. In the new window click the user's name, and go to the **User groups** tab.

#. Enable only the group you want to set restrictions for.

#. Click **Save changes**.

   .. image:: img/choose_group.png
       :align: center
       :alt: Choosing a user group for the vendors users


.. meta::
   :description: An add-on that lets customers send a message to the seller from a product page in CS-Cart and Multi-Vendor software.
