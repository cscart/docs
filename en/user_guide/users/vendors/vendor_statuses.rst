***************
Vendor Statuses
***************

Vendors can have one of the following statuses:

* **New**—when a customer :doc:`applies for a vendor account <allow_customers_to_apply_for_vendor_account>`, the newly-created vendor gets this status. The administrator can either approve, or reject the application by changing the vendor's status.

.. note::

    Once you change a vendor's status, you can't set it back to *New*.

* **Active**—vendor's administrators can work in the administration panel of the store. The products of an active vendor appear in the store, :doc:`unless they require prior approval <product_approval>`.

.. note::

    When the administrator :doc:`creates a vendor <create_vendor_account>`, the status of that vendor is set to **Active**.

* **Disabled**—vendor's products won't appear in the store, and vendor's administrators won't be able to log in to the Administration panel.

* **Pending**—vendor's administrators can work in the Administration panel of the store, but the vendor's products don't appear in the store.

.. important::

    Before Multi-Vendor 4.3.6 you couldn't change the status of a vendor from *Active* or *Disabled* to *Pending*. **This restriction was removed in 4.3.6:** now store owners can pause a vendor's sales while allowing the vendor's administrators to access the Administration panel.

.. image:: img/change_vendor_status.png
    :align: center
    :alt: You can change a vendor's status in the administration panel at any time.
