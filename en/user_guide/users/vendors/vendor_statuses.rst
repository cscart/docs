***************
Vendor Statuses
***************

Starting from the version 4.14.1, the administrator can allow and prevent vendor registration. When a customer :doc:`applies for a vendor account <allow_customers_to_apply_for_vendor_account>`, then he or she, as a newly-created vendor, gets one of the three statuses: 

* **New**—vendor's administrators can't work in the administration panel of the store, vendor’s products don’t appear on the storefront.

  The **New** status is not displayed anywhere. Instead of it, the *Approve* (thumbs up) and *Disapprove* (thumbs down) buttons appear next to a name of newly-created vendor. If a marketplace administrator approves a vendor, the vendor gets the **Active** status. But if an administrator decides to disapprove a vendor, this vendor gets the **Disabled** status.

  .. note::  

      The newly-created vendors will get the **New** status if the **Review new vendors before granting access to the admin panel** is checked in the :doc:`Settings → Vendors </user_guide/settings/vendors>` section of the store.

* **Active**—vendor's administrators can work in the administration panel of the store. The products of an active vendor appear on the storefront, :doc:`unless they require prior approval. <product_approval>`

  When the administrator :doc:`creates a vendor <create_vendor_account>`, the status of that vendor is set to **Active**.

* **Pending**—vendor's administrators can work in the administration panel of the store, but the vendor's products don't appear on the storefront.

  .. note::

      The newly-created vendors will get the **Pending** status if the **Approval of newly-created vendors** parameter in the settings of :doc:`/user_guide/addons/vendor_data_premoderation/index` add-on is enabled.

Vendors can have other statuses:

* **Suspended**—vendor and his products won't appear on the storefront. In the admin panel, the vendor receives a warning that his account has been suspended.
  
  If you have the :doc:`/user_guide/addons/vendor_debt_payout/index` add-on installed in your store, the **Suspended** status is automatically assigned to those vendors who are in debt to the marketplace. As soon as a debtor pays off his debt, his status is automatically changed to **Active**.

* **Disabled**—vendor's products won't appear on the storefront, and vendor's administrators won't be able to log in to the administration panel.

  .. image:: img/change_vendor_status.png
      :align: center
      :alt: You can change a vendor's status in Multi-Vendor administration panel at any time.

 
.. meta::
   :description: What statuses do vendors have in a Multi-Vendor ecommerce platform and what a marketplace owner can do to them?
