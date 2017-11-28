******************************************************************
How To: Set up Product Price in Points According to Specific Ratio
******************************************************************

To configure the prices in points of your products so that they would depend on a specific ratio, follow these steps:

#. Open the Administration panel of your store. 

#. Go to **Add-ons → Manage add-ons**.

#. Click on the name of the **Reward points** add-on.

#. Enter the number of reward points in the **Points Exchange Rate (PER - the number of points equal to 1 conventional unit)** input field.

<<<<<<< HEAD
5. Save your changes by clicking the **Save** button.
=======
   .. note::

        The price in points is always rounded to the next highest integer. With the point exchange ratio set to 1, it would take 7 points to fully cover a $6.99 or a $6.33 order.

#. Save your changes by clicking the **Save** button.
>>>>>>> 4537539... En: User Guide: Add-ons: Reward Points: Articles updated.

#. Go to **Products → Products**.

#. Click on the name of the product.

#. The product editing page will opnen. Switch to the **Reward points** tab.

#. Tick the **Allow payment by points** checkbox.

#. Click the **Save and close** button.

   .. image:: img/reward_points_07.png
       :align: center
       :alt: Allow payment in points on the Reward points tab.

   .. note::

<<<<<<< HEAD
    To enable the **Allow payment by points** option for all the products at once, use the **Edit selected** functionality. Please refer to `this article <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/products/same_value_all_products.html>`_.
=======
       To enable the **Allow payment by points** option for all the products at once, use the **Edit selected** functionality. For more information, please refer to :doc:`this article </user_guide/manage_products/products/same_value_all_products>`.
>>>>>>> 4537539... En: User Guide: Add-ons: Reward Points: Articles updated.

   .. important::

<<<<<<< HEAD
    Make sure that the **Override global PER** option is disabled for the products for which you want to set up price in points according to ratio.

==========================================
Changes in Point Exchange Rate Calculation
==========================================

--------------------
Before Version 4.3.6
--------------------

The price in points on a product page was rounded upward ($6.3 = 7 points), but at checkout it was rounded downward ($6.3 = 6 points).

.. note::

    The examples above assume that the **point exchange rate** is set to *1*.

If a customer had 6 reward points, the order total was $6.99, and point exchange rate was set to 1, then applying 6 reward points would result in the price of the order being $0, rather than $0.99.

-------------------
After Version 4.3.6
-------------------
 
The price in points is always rounded to the next highest integer. With point exchange ratio set to 1 it would take 7 points to fully cover a $6.99 or a $6.33 order.

To make earlier versions of CS-Cart calculate prices in points the same way as in version 4.3.6, complete the following steps:

1. Open the **func.php** file in the *app/addons/reward_points* directory of your store installation.

2. Make adjustments to this file as described in `this diff file <https://gist.github.com/alpharder/34cffa92e65bf3e50736>`_.

The lines you need to remove from the file are marked in red and with a minus at the beginning of the line. The lines you need to add are marked in green and with a plus at the beginning of the line.

.. note::

    If you have any difficulties when applying the changes from the diff file, please `contact our technical support via Customer Help Desk <https://www.cs-cart.com/helpdesk>`_.


=======
       Make sure that the **Override global PER** setting is disabled on the **Reward points** tab of the product editing page. Otherwise the price in points for that particular product will not depend on the ratio you specified globally.
>>>>>>> 4537539... En: User Guide: Add-ons: Reward Points: Articles updated.
