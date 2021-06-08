***************
Vendor Statuses
***************

When a customer :doc:`applies for a vendor account <allow_customers_to_apply_for_vendor_account>`, then he or she, as a newly-created vendor, gets one of two statuses: 

* **Active**—vendor's administrators can work in the administration panel of the store. The products of an active vendor appear in the store, :doc:`unless they require prior approval. <product_approval>`

  When the administrator :doc:`creates a vendor <create_vendor_account>`, the status of that vendor is set to **Active**.

* **Pending**—vendor's administrators can work in the Administration panel of the store, but the vendor's products don't appear in the store.

  .. note::

      Starting with 4.13.1, marketplace administrators can influence on the onboarding of vendors through the vendor statuses. Newly-created vendor either will be able to appear on the storefront immediately after registration, or will have limited functionality. In any case, new vendors get access to the vendor panel and can start to work. The **Approval of newly-created vendors** parameter in the settings of the :doc:`/user_guide/addons/vendor_data_premoderation/index` add-on is responsible for the status of the newly-created vendor. By default, new vendors get the **Pending** status.

Vendors can have another statuses:

* **Suspended**—vendor and his products won't appear on the storefront. In the admin panel, the vendor receives a warning that his account has been suspended.
  
  If you have the :doc:`/user_guide/addons/vendor_debt_payout/index` add-on installed in your store, the **Suspended** status is automatically assigned to those vendors who are in debt to the marketplace. As soon as a debtor pays off his debt, his status is automatically changed to **Active**.

* **Disabled**—vendor's products won't appear in the store, and vendor's administrators won't be able to log in to the Administration panel.

  .. image:: img/change_vendor_status.png
      :align: center
      :alt: You can change a vendor's status in Multi-Vendor administration panel at any time.
      
      
.. meta::
   :description: What statuses do vendors have in a Multi-Vendor ecommerce platform and what a marketplace owner can do to them?
