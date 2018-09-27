***********************************************
How To: Enable Reviews for All Products at Once
***********************************************

==========================================
Enable Reviews by Default for New Products
==========================================

If you have the same rules for all the products in your store (only comments, only ratings, or always both), you can set those rules in the settings of the **Comments and reviews** add-on. Please note that it will only affect newly-created products. Comments and reviews for existing products will remain as they were.

#. Go to **Add-ons → Manage add-ons**.

#. Find the **Comments and reviews** add-on and click on its name.

#. The add-on settings will open. Find the **Default value** setting on the **Products** tab.

#. Change the value of this setting as you wish (*Communication*, *Rating*, or *All*).

#. Click **Save**. Now any new products will have comments and/or reviews enabled by default.

   .. image:: img/comments_03.png
       :align: center
       :alt: Enabling comments for new products.

====================================
Enable Reviews for Existing Products
====================================

The settings of the **Comments and reviews** add-on don't affect the products that may already exist in your store. You'll have to edit those products manually.

#. In the Administration panel, go to **Products → Products**.

#. You'll see the number of products that are displayed per page. Choose the maximum allowed number (250).

   .. hint:

       The ``items_per_page=X`` parameter in the URL determines how many items are displayed on one page. For example, *admin.php?dispatch=products.manage&items_per_page=250* will show 250 products on one page. That way you can select more products at once.

   .. image:: img/reviews_01.png
       :align: center
       :alt: Selecting the number of items displayed on a page.

#. Select all the products displayed on the page.

#. Click **Edit selected**.

   .. image:: img/reviews_02.png
       :align: center
       :alt: Editing selected products in bulk.

#. The window where you can select what product properties to modify will open. For convenience, leave only the **Reviews** checkbox ticked, then click **Modify selected**.

#. A new page will open. Click the **Apply values to all selected products** link.

#. Tick **Reviews** check box and select *Communication* (*Rating* or *All*) in the select box.

#. Click **Apply**. The selected value will be applied to all the products.

#. Repeat these steps for other products, if necessary.

   .. image:: img/reviews_03.png
       :align: center
       :alt: Applying a value to all selected products.
