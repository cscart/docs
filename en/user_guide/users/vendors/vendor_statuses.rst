***************
Vendor Statuses
***************

Vendors can have one of the following statuses:

* **Approve/Disapprove**—when a customer :doc:`applies for a vendor account <allow_customers_to_apply_for_vendor_account>`, the **Approve** (thumbs up) and **Disapprove** (thumbs down) buttons appear next to a name of newly-created vendor.

  .. note::

      If a marketplace owner clicks the **Approve** (thumbs up) button, the vendor gets the **Active** status. But if an owner decides to disapprove a vendor, this vendor gets the **Disabled** status.

* **Active**—vendor's administrators can work in the administration panel of the store. The products of an active vendor appear in the store, :doc:`unless they require prior approval. <product_approval>`

  .. note::

      When the administrator :doc:`creates a vendor <create_vendor_account>`, the status of that vendor is set to **Active**.

* **Disabled**—vendor's products won't appear in the store, and vendor's administrators won't be able to log in to the Administration panel.

* **Pending**—vendor's administrators can work in the Administration panel of the store, but the vendor's products don't appear in the store.

* **Suspended**—vendor and his products won't appear on the storefront. In the admin panel, the vendor receives a warning that his account has been suspended.

  .. note::
  
      If you have the :doc:`/user_guide/addons/vendor_debt_payout/index` add-on installed in your store, the **Suspended** status is automatically assigned to those vendors who are in debt to the marketplace. As soon as a debtor pays off his debt, his status is automatically changed to **Active**.

  .. image:: img/change_vendor_status.png
      :align: center
      :alt: You can change a vendor's status in Multi-Vendor administration panel at any time.
