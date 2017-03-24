*****************************
How To: Create a Bonus Coupon
*****************************

CS-Cart allows you to create bonus coupons for customers. Customers enter codes of those coupons at checkout to get various bonuses, such as discounts, free products, or free shipping. Here's how you can create a bonus coupon:

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion**.

#. Fill in the fields on the **General** tab. Make sure your promotion has a **Name**, and that the **Status** is set to *Active*.

#. Switch to the **Conditions** tab and click the **Add condition** button.

#. Select **Coupon code** from the dropdown list. 

#. Your promotion can use either one, or multiple coupon codes:

   * **To use one coupon code:** choose *equal* and enter the coupon code. Don't use commas (``,``) in the code.

   * **To use multiple coupon codes:** choose *in* and enter multiple coupon codes separated by commas without spaces after them. For example, to have codes ``test1``, ``test2``, and ``test3``, enter them like this::

       test1,test2,test3

   .. note::

       If you would like to generate coupon codes automatically, please refer to :doc:`another article <auto_coupons>`.

   .. image:: img/coupon.png
       :align: center
       :alt: Specifying a coupon code for a promotion in CS-Cart.

#. Switch to the **Bonuses** tab and click the **Add bonus** button.

#. Choose any desired bonus and configure it.

#. Click the **Create** button.
