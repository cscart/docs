**********************************************
How To: Give Discounts to Specific User Groups
**********************************************

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add catalog promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

   .. image:: img/discount_for_usergroups.png
       :align: center
       :alt: The promotion creation page in CS-Cart

#. Switch to the **Conditions** tab and click the **Add condition** button.

#. Select the **User group** condition from the dropdown list. Then choose *equal* and select the user group. For example, the **Wholesale** user group in the picture below.

   .. hint::

       If you change *equal* to *not equal*, then every user, except for the members of the selected group, will get a discount.

   .. image:: img/discount_for_usergroups_01.png
       :align: center
       :alt: The Conditions tab determines when the promotion is applied.

#. Switch to the **Bonuses** tab and click the **Add bonus** button.

#. Select the **Product discount** bonus from the dropdown list. Choose how the discount will be applied and enter the size of the discount. For example, let's enter *5*. Here's the various ways of how the discount will work in that case:

   * **To percentage of the original price**: products will cost 5% of their original price.

   * **By percentage of the original price**: products will cost 95% of their original price (price with discount = original price - 5%).

   * **To fixed amount**: the price of products will be set to 5 units of the primary currency of your store, unless those products already have prices lower than 5.

   * **By fixed amount**: the price of products will be lower by 20 units of the primary currency of your store (price with discount = original price - 5).

     .. important::

         Unless you specify other conditions, the discount will apply to all products in your store.

#. Click the **Create** button. Now the members of the selected user group will see the discount on product and category pages.

   .. image:: img/discount_for_usergroups_02.png
       :align: center
       :alt: The Bonuses tab determines what happens when the promotion is applied.
