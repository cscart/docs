**************************************************
How To: Assign Payment Methods to Shipping Methods
**************************************************

.. note::

    Before you proceed, install the :doc:`Payment Dependencies </user_guide/addons/payment_dependencies/index>` add-on.

By default, customers see all the payment methods available to them at checkout. This may be inconvenient when you have many payment methods. The **Payment Dependencies** add-on allows you to make certain payment methods unavailable when a customer selects a particular shipping method.

In this example we will make *Phone ordering* the only payment method available for the *Custom shipping method*.

#. In the Administration panel of your store, go to **Administration → Shipping & taxes → Shipping methods**.

#. Click the name of the shipping method you want to edit (in our example it's *Custom shipping method*).

#. Find the **Allowed payment methods** setting, and set what payment methods you want to allow for the shipping method. In our case we leave only *Phone ordering* as available.

#. Save your changes. Now, if you try to buy a product and choose *Custom shipping method* at checkout, you will only have *Phone ordering*.

   .. image:: img/phone_ordering_only.png
       :align: center
       :alt: Select the payment methods you want to make available for the shipping method.

.. meta::
   :description: How to allow only specific payment methods available for a shipping method in CS-Cart and Multi-Vendor ecommerce software?
