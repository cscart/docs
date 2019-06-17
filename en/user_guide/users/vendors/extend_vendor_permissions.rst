*******************************************
How To: Allow Vendors to Create/Edit Orders
*******************************************

.. warning::

    This article is no longer supported and will not work in newer versions of Multi-Vendor.

Vendors can’t edit orders in Multi-Vendor by default—this restriction protects the store owner from dishonest vendors. If you trust a vendor, you can extend their rights in 4 easy steps.

==================================
Step 1. Download the Modified File
==================================

The **vendor_multivendor.php** file contains information about the rights of vendors. For your convenience we created 2 modified versions of this file. Choose the version that meets your requirements:

* :download:`Download this file to allow vendors to edit orders <files/vendor_multivendor_edit_orders.php>`.

* :download:`Download this file to allow vendors to create orders <files/vendor_multivendor_create_orders.php>`.

==================================
Step 2. Rename the Downloaded File
==================================

Rename the file you have just downloaded to **vendor_multivendor.php**. 

================================================
Step 3. Replace the Original File on Your Server
================================================

Find the existing **vendor_multivendor.php** file on your server. The path to the file should look like this: 
*/app/schemas/permissions/vendor_multivendor.php*

Replace it with the file you downloaded and renamed.

.. important::

    Remember to **make a backup of the original vendor_multivendor.php**. You’ll need it to revert the changes.

===============================================
Step 4. Assign a Vendor to Administrators Group
===============================================

In the Multi-Vendor admin panel go to **Customers → Vendor's administrators →<Vendor’s name> → User groups**. Then change the vendor’s status in the **Administrators** group to **Active**.

.. image:: img/vendors_edit_orders/vendor_group.png
    :align: center
    :alt: Assign a vendor to the Administrators group.
