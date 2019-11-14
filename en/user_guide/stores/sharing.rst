**********************************
How To: Share Objects Among Stores
**********************************

.. important::

    This article applies only to CS-Cart, not Multi-Vendor.

======================
How Does Sharing Work?
======================

When you create an object (product, page, promotion, shipping method, etc.) in CS-Cart, you must assign it to a particular storefront. However, you can share objects among different storefronts.

.. note::

    You can't share categories, because :doc:`categories determine the storefronts to which products belong. <many_stores_one_catalog>`

CS-Cart has two types of sharing rules depending on the object type:

* **Invariable sharing**: objects are shared among storefronts without any changes. This rule applies to such objects as product features and filters, global product options, promotions, CMS content, languages, currencies, and shipping methods.

* **Configurable sharing**: objects are shared among storefronts and can have different properties on each storefront. For example, when you share a product, you can define a different price, description, and other properties for different storefronts.

.. note::

    CS-Cart also allows to :doc:`share customer accounts among storefronts. <customer_accounts>`

CS-Cart has a number of global objects that apply to all storefronts and cannot have unit-specific values. These include the tax calculation rules, order statuses, locations, states and countries, user groups, user profile fields, etc.

=================================
Sharing Objects Among Storefronts
=================================

-------------------------------------
Share Products (Configurable Sharing)
-------------------------------------

#. Go to **Products → Products**.

#. Make sure that **All stores** are selected in the upper right part of the page.

   .. image:: img/switch_modes.png
       :align: center
       :alt: Select all stores to switch to the root administrator mode.

#. Click on the product you want to share.

#. On the **General** tab, add the product to one or more categories under a different storefront.

#. Click **Save** to apply the changes.

   The product will appear on the storefront under the selected categories. Now you can switch to the store administrator mode and define the storefront-specific properties for the product.

   .. image:: img/store_categories.png
       :align: center
       :alt: Select a category from the different store for the product.

----------------------------------------
Share Other Objects (Invariable Sharing)
----------------------------------------

#. Choose an object that you need to share. For example, go to **Administration → Shipping & Taxes → Shipping methods** to share a shipping method.

#. Make sure that **All stores** are selected in the upper right part of the page.

   .. image:: img/switch_modes.png
       :align: center
       :alt: Select all stores to switch to the root administrator mode.

#. Click the **gear** button of the object. This opens the object configuration page.

#. Switch to the **Share** tab. This opens a list of storefronts that already share the object (if any).

   .. note::
       You won't see the **Share** tab if you only have one storefront: in that case there is nothing to share.

   .. image:: img/share_tab.png
       :align: center
       :alt: Use the Share tab to share objects among storefronts.

#. Click the **+** button (*Add stores*) to open a list of all storefronts.

#. From the list, select the storefronts that will share the object. Then click **Add stores and close** to update the list of stores that should share the object.

#. Click **Save** to apply the changes.

.. meta::
   :description: How to have the 
