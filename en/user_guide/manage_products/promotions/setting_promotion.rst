**************************
How To: Set Up a Promotion
**************************

#. In the Administration panel, go to **Marketing → Promotions**.

#. Click the **+** button in the top right corner and choose **Add cart promotion** or **Add catalog promotion**:

   * **Catalog promotions** are product discounts that are displayed on the catalog pages (the pages of products and categories).

   * **Cart promotions** include discounts on products and orders; bonus coupons; free shipping; free products; and so on. Cart promotions are displayed on the cart and checkout page.

#. The promotion creation form will open. Fill in the information on the **General** tab:

   * **Name**—the name of the promotion as it appears to customers and in the Administration panel.

   * **Detailed description**—the full description of the promotion. It appears on a special page that lists all promotions in your store (``index.php?dispatch=promotions.list``). 

   * **Short description**—the description of the promotion as it appears on the storefront when a customer views an order (**My account → Orders**).

   * **Use available period**—if you tick this checkbox, the promotion will only be available for a period of time that you specify:

     * **Available from**—the date when the promotion becomes available to customers.

     * **Available till**—the date when the promotion ends.

   * **Priority**—the order in which the promotions are applied. For example, ``1`` is a higher priority than ``10``; ``0`` is the highest priority. Promotions with higher priority will be applied first.

     .. hint::

         If two promotions have the same priority, they are applied in the same order as they are retrieved from the database.

   * **Stop other rules**—if you tick this checkbox, other promotions with lower priority won't apply to an order when the current promotion is applied.

     .. important::

         The **Stop other rules** checkbox doesn't affect the promotions with higher priority, or promotions of other types. For example, a cart promotion can't stop a catalog promotion.

   * **Status**—the status of the promotion (*Active*, *Hidden*, or *Disabled*).

   .. image:: img/promotions_01.png
       :align: center
       :alt: The General tab of the promotion creation form in CS-Cart.

#. Switch to the **Conditions** tab. This tab determines in what cases the promotion applies.

#. Click the **Add condition** button and choose the condition from the dropdown list. Most conditions require you to enter additional information.

   .. note::

       You can create multiple conditions. Please note the phrase at the top of the condition list: ``If all/any of these conditions are true/false``. By choosing between *all* and *any*, and *true* and *false*, you determine when the promotion applies.

   .. image:: img/promotions_02.png
       :align: center
       :alt: The Conditions tab determines when the promotion applies.

#. Switch the **Bonuses** tab. This tab determines what bonuses are given when a promotion applies.

#. Click the **Add bonus** button and select a bonus from the dropdown list. Most bonuses require you to enter additional information.

#. Click the **Create** button.

   .. image:: img/promotions_03.png
       :align: center
       :alt: The Bonuses tab determines what happens when the promotion applies.
