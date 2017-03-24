********************************************************
How To: Offer Free Shipping for Buying a Certain Product
********************************************************

You can offer free shipping when customer has a certain product in cart. This is done via a :doc:`cart promotion <index>`. 

.. warning::

    If the free shipping promotion applies to an order, customers won't be charged for shipping any products in that order. Additional shipping charges that you specify for individual products won't apply either.

To create this promotion, follow the steps below:

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion**.

   .. image:: img/add_cart_promotion.png
      :align: center
      :alt: Open the list of promotions and use the plus button to add a cart promotion.

#. Name your promotion and make sure that the **Status** is set to *Active*.

   .. image:: img/promotion_name.png
       :align: center
       :alt: Name your promotion and specify other parameters on the General tab.

#. Switch to the **Conditions** tab and click **Add condition**.

#. Choose **Products** in the dropdown list, then click **Add product**.

   .. image:: img/promotion_condition.png
       :align: center
       :alt: Add a "Products" condition.

#. Tick the checkboxes of one or multiple products from the list. A customer will have to add any of them to cart to be eligible for the promotion.

#. Click **Add products and close**.

   .. hint::

       If you want the promotion to apply only when a customer buys several different products, add those products as separate conditions. Make sure that the phrase above the list of conditions says ``If all of these conditions are true``.

   .. image:: img/select_product_free_shipping.png
       :align: center
       :alt: Select one or multiple products from the list.

#. Switch to the **Bonuses** tab and click **Add bonus**.

#. Select **Free shipping** from the dropdown list and choose a shipping method.

   .. hint::

      If you'd like to give free shipping for multiple shipping methods, add those methods as separate bonuses.

   .. image:: img/promotion_bonus.png
       :align: center
       :alt: Select the shipping method you want to make free.

#. Click **Create and close**.

   Congratulations! Now when customers add the specified product to cart and select the right shipping method, they won't be charged for shipping.

   .. image:: img/free_shipping_promotion.png
       :align: center
       :alt: Customers won't be charged for shipping if their orders fall under the free shipping promotion.
