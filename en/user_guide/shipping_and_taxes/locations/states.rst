******
States
******

Use the **Administration → Shipping and taxes → States** page to edit the list of states and provinces (per country) that are supported in your store.

You can add missing states/provinces, or delete and modify existing ones for each :doc:`active country <countries>`.

.. note::

    Starting with CS-Cart 4.13.1, the fact that the fields at checkout are required depends on whether the country has regions or not:

    * If a customer's country for the delivery has states, then the *State/Province* field is required.

    * If a customer's country for the delivery doesn't have states, then the *State/Province* field isn't required.

.. image:: img/states_list.png
    :align: center
    :alt: The list of states in CS-Cart and Multi-Vendor.

================
State Properties
================

* **Code**—a unique code to identify the state or province.

* **State/Province**—the name of the state or province.

* **Status**—the status of the state/province: *Active* or *Disabled*.

  .. note::

      If you disable a state, users won't be able to select it in their accounts or at checkout.

.. meta::
   :description: How to add, edit, and delete states and regions in CS-Cart and Multi-Vendor ecommerce software?
