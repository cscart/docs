************************************************************************
How To: Give Discount on Order for Buying Two Specific Products Together
************************************************************************

CS-Cart allows you to create promotions that apply only when a customer buys specific products together. To set up this kind of promotion, follow the steps below:

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

#. Switch to the **Conditions** tab.

#. Click the **Add condition** button.

#. Select **Products** in the dropdown list, then choose *in* and click the **Add products** button.

#. A pop-up window will open. Find a product that the customer must add to cart to be eligible for the promotion, tick that product's checkbox, and click **Add products and close**.

#. Repeat steps from 5 to 7 for another product that the customer must also add to cart.

#. Make sure that the phrase at the top of the condition list is ``If all of these conditions are true``.

   .. image:: img/two_products.png
       :align: center
       :alt: The phrase at the top of the condition list determines whether all/any conditions must be true/false.

#. Switch to the **Bonuses** tab and click the **Add bonus** button. 

#. Choose any bonus from the dropdown list, and configure that bonus. For example, let's choose **Order discount** with *to fixed amount*, then set the value to ``20``. That way order subtotal will be set to 20 units in the primary currency of your store, unless the subtotal is already lower than 20.

   .. note::

       The discount will not affect the price of shipping.

#. Click the **Create** button.

   .. image:: img/two_products_01.png
       :align: center
       :alt: Giving an order a specific subtotal in CS-Cart.
