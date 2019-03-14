******************
Product Variations
******************

.. note::

    Product variations are a part of :doc:`the add-on with the same name </user_guide/addons/product_variations/index>`.

Variations are similar products that differ from each other only in one or a few :doc:`features </user_guide/manage_products/features/index>`, for example: "green M-sized T-shirt" and "red S-sized T-shirt". This kind of product requires 3 things:

#. Let customers choose the feature values on the product page.

#. Show some of the variations (for example, different colors) as separate catalog items. That way customers will see the color they need on the product list.

#. Hide some of the variations (for example, sizes) from the product list. That way customers wouldn't be confused by multiple T-shirts of different sizes with the same image.

   .. image:: /user_guide/addons/product_variations/img/variation_selection.png
       :align: center
       :alt: Switching between product variations on the storefront.

.. contents::
    :backlinks: none
    :local:

===========
Terminology
===========

**Variation group**—a few similar products that differ from each other only in one or several features.

**Variation**—a product that belongs to a variation group. A product can belong only to one group at the same time, but it's easy to change the product's group. If a variation is removed from the group, it becomes a standard product.

**Catalog item** — a single spot on the product list. Until variations existed, "catalog item" meant the same thing as "product". But now variations may or may not occupy a place on the product list, hence the new term.

.. hint::

    Every variation is a product, but not every product is a variation. Use the **Advanced search** on the product list in the admin panel. For example, it can let you find only variations, or only catalog items.

---------------

A T-shirt comes in 3 colors, and each color has 5 sizes. That means 15 *products*. If we want to add switching between these products, we'll put these products into a *variation group* that is based on the "Color" and "Size" features. Now we have 15 *variations*, and customers can switch between them on the product page.

Depending on how your features are configured, these 15 variations can be:

* *1 catalog item*—the color and size selection is available only on the product page.

* *3 catalog items*—T-shirts of different colors appear on the storefront as separate products, but sizes can be selected only on the product page.

* *5 catalog items*—if someone decides to show sizes on the product list and leave the color selection on the product page. It doesn't suit T-shirts, but may be appropriate for other products.

* *15 catalog items*—when colors and sizes appear on the list as separate products; every variation has its own catalog item.

  .. note::

      This scheme works even when the number of features is more than two. You can edit the features at any time, but the number of catalog items will change only if you disband and recreate the variation group. More on that below.

=======================
Working with Variations
=======================

--------------------------
Creating a Variation Group
--------------------------

#. Go to the editing page of a :doc:`product feature </user_guide/manage_products/features/index>` (either a new one, or existing one) and choose one of the two **Purposes** that allow creating variations.

   .. hint::

      The selected **Purpose** determines if variations with different values of this features will become separate catalog items. Every purpose has a description; it should help you find the purpose that is right for you.

   If variations differ by more features than one, then create multiple features, not necessarily with the same **Purpose**. Then CS-Cart will automatically determine, which variations should get their own catalog items, and which should only be selectable on the product page.

#. Go to the editing page of any :doc:`product </user_guide/manage_products/products/index>` that you want to turn into a variation. Make sure that the product has a value for all the  features that distinguish it from other similar products.

#. Switch to the **Variations** tab.

   .. image:: img/product_variations_tab.png
       :align: center
       :alt: You can manage the entire variation group from the page of any product that is a part of the group.

   There are 2 ways to let customers switch from this product's page to other similar products:

   * **Create a variation group.**

     To do it, use the **Add variations** button. You'll be able to add any products that have the values for the distinguishing features. You'll also be able to create new products automatically, based on features.

   * **Add this product to an existing group as a variation.**

     Start entering the variation group code into the field on the left. CS-Cart will automatically offer appropriate groups. If you know there is a group, but CS-Cart doesn't offer it, then please make sure that the product has values for all the features that the group is based on.

----------------------
Management and Removal
----------------------

Once a variation group is created, all products from the group will appear on the **Variations** tab of any product in the group. On this tab you can:

* See which variations have their own catalog item, and which don't. A variation that doesn't appear on the product list has a smaller icon.

* Choose which of the variations to display by default as the catalog item.

* Remove a variation from the group; this will turn the variation into an independent product.

* Delete the variation.

* Change the group code — you can use it later to add other products to this group as variation. A group code can contain only digits, Latin characters, and the following signs: ``-`` and ``_``.

* Add more variations to the group.

* Switch to the product list to edit variations there—that way you'll be able to edit and remove variations in bulk.

* Disband the group—turn all its variations into independent products and remove the ability to switch between them on the product page.

  .. image:: img/product_variations_list.png
      :align: center
      :alt: Catalog items have bigger pictures than variations that can be selected only on the product page.
