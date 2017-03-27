******************************************************************************************
How To: Give Gift Certificate to Member of User Group if Order Subtotal Exceeds Some Value
******************************************************************************************

CS-Cart allows you to specify multiple conditions for a promotion. For example, you can give a gift certificate to members of a certain user group when the combined price of all products in the order is higher than a certain value. To set up this promotion, follow the steps below:

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

#. Switch to the **Conditions** tab and click the **Add condition** button.

#. Select **Order subtotal** from the dropdown list. Then choose *equal or greater* and enter the desired subtotal value in the primary currency of your store.

   .. note::

       By **subtotal** we mean the combined price of all products that are currently in the cart.

#. Click the **Add condition** button again. This will add a second condition that must be met before the promotion applies.

#. Select **User group** from the dropdown list. Then choose *equal* and pick the desired user group in the next select box.

#. Make sure that the phrase at the top of the condition list is ``If all of these conditions are true``.

   .. image:: img/group_discount.png
       :align: center
       :alt: The phrase at the top of the condition list determines whether all/any conditions must be true/false.

#. Switch to the **Bonuses** tab and click the **Add bonus** button.

#. Select **Gift certificate** from the dropdown list, then enter the desired value in the primary currency of your store.

#. Click the **Create** button.

   .. image:: img/group_discount_01.png
       :align: center
       :alt: Specify the sum of the gift certificate on the "Bonuses" tab of the promotion.
