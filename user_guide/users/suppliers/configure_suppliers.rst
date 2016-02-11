**************************************
How To: Enable and Configure Suppliers
**************************************

.. note::

    **Tutorial Difficulty: 1 / 3**

The **Suppliers** user type is disabled by default. You need to activate the **Suppliers** add-on first.

========================
Step 1. Enable Suppliers
========================

To enable **Suppliers** in your store, complete the following steps:

* In the Administration panel go to **Add-ons → Manage add-ons**.

* Find the **Suppliers** add-on and make it active. If it is not installed yet, switch to the **Browse all available add-ons** tab and click the **Install** button.

* Click the name of the add-on to configure it.

* If you want your customers to see the supplier of the product, tick the **Display product supplier company** checkbox.

* Click the **Save** button.

=========================
Step 2. Create a Supplier
=========================

You need to create a supplier before you continue:

* Go to **Customers → Suppliers**.

* Click the **+** button to add a supplier. 

* Specify the supplier's information in the mandatory fields:

 * name
 * email

 .. note::

     When a customer places an order on a supplier's product, the supplier will receive a notification to the specified email.

 * phone
 * address from where his/her products are shipped: city, country, state/province, zip/postal code

.. important::

	This address is used when calculating the realtime shipping.

.. image:: img/supplier_creation.png
    :align: center
    :alt: Use the Advanced search and save your search patterns to optimize your workflow.

* Click the **Create and close** button.

====================================
Step 3. Assign Suppliers to Products
====================================

The last step is to assign a supplier to products:

* Go to **Products → Products**. 

* Click on the name of a product you want to assign a supplier to.

* Select the desired supplier in the **Supplier** select box.

.. image:: img/supplier_add.png
    :align: center
    :alt: Select the desired supplier in the Supplier select box.

* Click the **Save** button.

.. important::

    You won't see the **Supplier** select box if your store doesn't have any suppliers created.

======================================
Step 4. Suppliers and Shipping Methods
======================================

You can select what shipping methods are available to suppliers:

* Go to **Customers → Suppliers**.

* Click the name of the supplier.

* Switch to the **Shippings** tab.

* Tick the checkboxes next to the shipping methods you want to make available for the supplier.

* Click the **Save** button.

.. image:: img/supplier_shipping.png
    :align: center
    :alt: Tick the checkboxes to enable the corresponding shipping methods for the selected supplier.

.. important::

    When customers order a product assigned to a supplier, they can only select the shipping methods available to this supplier. If the cart has products from different suppliers, several shipping methods assigned to those suppliers will be used in the order. The shipping cost will be summed.
