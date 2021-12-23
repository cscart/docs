***************
Product Bundles
***************

.. note:: 

    This add-on replaced the :doc:`/user_guide/addons/buy_together/index` add-on in the version 4.14.1.

One of the ways to boost sales is to increase the average order receipt. To get the most out of every purchase, you need to get customers motivated to buy more. Product bundles can be such a motivation. Discounted sets of products allow customers to save their money, and administrators—to increase the average receipt.

.. contents::
    :local:
    :backlinks: none

=============
Functionality 
=============

* Either administrators or vendors can create, edit and delete product bundles.

* If there are :doc:`/user_guide/manage_products/products/product_variations` in the bundle, then you can allow customers to choose the desired variant in the "variations as one product", or create a bundle with a single variant.

* You can show the bundle in the list of promotions and on the pages of the products that are in the bundle.

* If the customer adds products from the bundle to the cart separately, then the discount for the assembled bundle will still apply.

* You can show the bundle on the storefront, even if a product included in the bundle is out of stock. Customers cannot add such a bundle to the cart until the product appears in stock.

=============
Configuration
=============

Product Bundles is installed :doc:`like any other add-on </user_guide/addons/1manage_addons>`. The add-on has no settings.

You can work with bundles on the **Marketing → Product bundles** page that appears after the add-on is installed. The page contains a list of all bundles. Here the following work with bundles takes place:

* create;

* edit;

* change status;

* delete;

* search by name, owner and products included in the bundle.

===============
Bundle Creation
===============

There are two ways to create a product bundle.

Way 1. From the Marketing → Product bundles Page
----------------------------------------------------

#. In the upper right corner of the page, click the **+** button to add a new bundle. In the opened window, fill in the fields from the *General* tab firstly.

   * Enter the **Name**.

   * Add a **Description** and **Promo image** for the bundle if needed.

   * Tick the **Display in promotions** checkbox if you want to show the bundle in the list of promotions.

   * Select the **Vendor**  who owns the bundle and whose products are in it.

     .. note:: 

         When you create a bundle in CS-Cart, a storefront is selected on this step. Products from the selected storefront will be included in the bundle.

   * Define the **Available period**—the time when the created bundle is available.

#. Open the *Products* tab. Choose the products you want to add to the bundle. Only the products of the vendor you selected on the previous tab will be displayed in the list.

   For each product:

   * set the **Quantity**, type of available **Discount** (absolute or percentage) and its **Value**;

   * tick the **Show on products page** checkbox if you want to show the bundle on the product page.

#. **Recalculate** the total cost and set the discount value in the **Share discount($)** field, if necessary.

#. Click the **Apply** button. Save the created bundle.

.. list-table::
   :widths: 30 40

   * - .. figure:: img/settings1.png
              :scale: 15 %
              :align: center
              :alt: Creation bundles, *General* tab
     - .. figure:: img/settings2.png
              :scale: 15 %
              :align: center
              :alt: Creation bundles, *Products* tab

Way 2. From the Product Detail Page
-----------------------------------

#. On the product detail page, go to the *Product bundles* tab.

#. Click **Add new bundle**. In the opened window, fill in the fields described in the first method.

   .. note:: 

      When you create a bundle from the product detail page, the product is automatically added to the bundle.

===============================
Variation-Based Bundle Creation
===============================

The add-on allows you to add different types of product variations to the bundle.

Products with Variation Choice
------------------------------

It is useful when you want to allow customers to choose the desired feature value of the product by themselves. For example, a black T-shirt in S, M or L size. To do this:

#. Create a bundle in any convenient way.

#. When choosing products on the *Products* tab, use the regular search and find the desired product with variations.

#. Add the product, then you'll see the name of the chosen product with the **Any variation** note.

#. Add other products and save.

.. list-table::
   :widths: 30 40

   * - .. figure:: img/settings_variation_choice.png
              :scale: 15 %
              :align: center
              :alt: Add products to the bundle with variation choice
     - .. figure:: img/variation_choice.png
              :scale: 15 %
              :align: center
              :alt: Bundle include products with variation choice

Products without Variation Choice
---------------------------------

It is useful when there are several variations of the product in the store, and you need to add one specific variation to the bundle. For example, a T-shirt of a certain color and size. To do this:

#. Create a bundle in any convenient way.

#. When choosing products on the *Products* tab, **Advanced products search** and find the desired product.

#. Select one desired feature value, leaving the **Any variation** checkbox empty. Add this variation.

#. Add other products and save.

.. list-table::
   :widths: 30 40

   * - .. figure:: img/settings_no_variation_choice.png
              :scale: 15 %
              :align: center
              :alt: Add products to the bundle without variation choice
     - .. figure:: img/no_variation_choice.png
              :scale: 15 %
              :align: center
              :alt: Bundle include specific variation of the product
