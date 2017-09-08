**************************************************
How To: Assign Payment Methods to Shipping Methods
**************************************************

.. note::

    Before you proceed, :doc:`install the Payment Dependencies add-on </user_guide/addons/payment_dependencies/index>`.

By default, customers see all the payment methods available to them at checkout. This may be inconvenient, especially when you have many payment methods.

.. image:: img/without_dependencies.png
    :align: center
    :alt: If you don't set up payment dependencies, customers will see all the available payment methods at checkout.

The **Payment Dependencies** add-on allows you to make certain payment methods unavailable, if a customer selects a particular shipping method. In this example we will make **Phone ordering** the only payment method available for the **Custom shipping method**.

#. Open the Administration panel of your store.

#. Go to **Administration → Shipping methods**.

#. Click the name of the shipping method you want to edit (**Custom shipping method** in our case).

   .. image:: img/select_shipping_method.png
       :align: center
       :alt: Find the desired shipping method on the list and click the name of that method.

#. Scroll down to the **Extra** section on the shipping method editing page. You’ll see the **Allowed payment methods** setting.

#. Tick the checkboxes of the payment methods you want to allow for the shipping method. In our case we leave only **Phone ordering** ticked.

#. Click the **Save** button to save your changes.

   .. image:: img/phone_ordering_only.png
       :align: center
       :alt: Tick the checkboxes of the payment methods you want to make available for the shipping method.

   Now if you try to purchase a product and choose **Custom shipping method** at checkout, you will only have **Phone ordering** under **Billing options**.

   .. image:: img/with_dependencies.png
       :align: center
       :alt: The customers who choose a shipping method with payment dependencies only see the allowed payment methods at checkout.
