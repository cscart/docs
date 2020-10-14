************************************************************
How To: Create Discount on Products from Specific Categories
************************************************************

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add catalog promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

#. Switch to the **Conditions** tab and click the **Add condition** button.

#. Select **Categories** from the dropdown list. 

#. Choose *in* or *not in*, then click the **Add categories** button:

   * If you choose *in*, all products that belong to any added category will have a discount.

   * If you choose *not in*, all products will have a discount, except for the products in any of the added categories.

     .. image:: img/categories_discount.png
         :align: center
         :alt: The "Conditions" tab of the promotion in CS-Cart.

#. Switch to the **Bonuses** tab and click the **Add bonus** button.

#. Select the **Product discount** bonus from the dropdown list. Choose how the discount will be applied and enter the size of the discount. For example, let's enter *20*. Here's the various ways of how the discount will work in that case:

   * **To percentage of the original price**: the eligible products will cost 20% of their original price.

   * **By percentage of the original price**: the eligible products will cost 80% of their original price (price with discount = original price - 20%).

   * **To fixed amount**: the price of the eligible products will be set to 20 units of the primary currency of your store, unless those products already have lower prices.

   * **By fixed amount**: the price of the eligible products will be lower by 20 units of the primary currency of your store (price with discount = original price - 20).

#. Click the **Create** button.
