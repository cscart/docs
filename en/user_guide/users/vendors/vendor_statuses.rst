***************
Vendor Statuses
***************

Vendors can have one of the following statuses:

* **New**—when a customer :doc:`applies for a vendor account <allow_customers_to_apply_for_vendor_account>`, the newly-created vendor gets this status. The administrator can either approve, or reject the application by changing the vendor's status.

  .. note::

      Once you change a vendor's status, you can't set it back to **New**.

* **Active**—vendor's administrators can work in the administration panel of the store. The products of an active vendor appear in the store, :doc:`unless they require prior approval. <product_approval>`

  .. note::

      When the administrator :doc:`creates a vendor <create_vendor_account>`, the status of that vendor is set to **Active**.

* **Disabled**—vendor's products won't appear in the store, and vendor's administrators won't be able to log in to the Administration panel.

* **Pending**—vendor's administrators can work in the Administration panel of the store, but the vendor's products don't appear in the store.

  .. image:: img/change_vendor_status.png
      :align: center
      :alt: You can change a vendor's status in Multi-Vendor administration panel at any time.
