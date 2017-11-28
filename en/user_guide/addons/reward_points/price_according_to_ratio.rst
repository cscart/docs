******************************************************************
How To: Set up Product Price in Points According to Specific Ratio
******************************************************************

To configure the prices in points of your products so that they would depend on a specific ratio, follow these steps:

#. Open the Administration panel of your store. 

#. Go to **Add-ons → Manage add-ons**.

#. Click on the name of the **Reward points** add-on.

#. Enter the number of reward points in the **Points Exchange Rate (PER - the number of points equal to 1 conventional unit)** input field.

   .. note::

        The price in points is always rounded to the next highest integer. With the point exchange ratio set to 1, it would take 7 points to fully cover a $6.99 or a $6.33 order.

#. Save your changes by clicking the **Save** button.

#. Go to **Products → Products**.

#. Click on the name of the product.

#. The product editing page will opnen. Switch to the **Reward points** tab.

#. Tick the **Allow payment by points** checkbox.

#. Click the **Save and close** button.

   .. image:: img/reward_points_07.png
       :align: center
       :alt: Allow payment in points on the Reward points tab.

   .. note::

       To enable the **Allow payment by points** option for all the products at once, use the **Edit selected** functionality. For more information, please refer to :doc:`this article </user_guide/manage_products/products/same_value_all_products>`.

   .. important::

       Make sure that the **Override global PER** setting is disabled on the **Reward points** tab of the product editing page. Otherwise the price in points for that particular product will not depend on the ratio you specified globally.
