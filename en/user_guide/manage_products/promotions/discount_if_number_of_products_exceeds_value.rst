***************************************************************
How To: Give Discount When Cart Has Specific Number of Products
***************************************************************

CS-Cart allows you to make a promotion that applies only when a certain number of items is in the cart. These items don't have to be different, they can be identical. For example, multiple white XXL T-shirts count as separate items.

To create this promotion, follow these steps below:

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

   .. image:: img/discount_on_number.png
       :align: center
       :alt: Promotion creation page in CS-Cart.

#. Switch to the **Conditions** tab and click the **Add condition** button.

#. Select **Total products in the cart**. Then choose one of its variants from the dropdown list, and enter the number of products. For example, let's choose *greater*, then enter ``5``. A customer would have to add at least 6 items to cart, or the promotion wouldn't apply.

   .. hint::

       You can add multiple conditions that way; for example, *greater than 5* and *equal or less than 10*.

   .. image:: img/discount_on_number_01.png
       :align: center
       :alt: Set the desired number of products on the "Conditions" tab.

#. Switch to the **Bonuses** tab and click the **Add bonus** button. 

#. Choose any bonus from the dropdown menu and configure it. For example, let's choose **Order discount** with *to percentage of the original price*, then set the percentage to ``10``. That way customer will get a 90% discount on order subtotal (new subtotal = 10% of the original subtotal).

   .. important::

       The shipping cost won't be affected by this discount.

#. Click the **Create** button.

   .. image:: img/discount_on_number_02.png
       :align: center
       :alt: Discount to a percentage means that the products will cost the specified percent of their orignal price.
