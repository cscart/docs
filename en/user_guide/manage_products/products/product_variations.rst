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

**Catalog item**—a single spot on the product list. Until variations existed, "catalog item" meant the same thing as "product". But now variations may or may not occupy a place on the product list, hence the new term.

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

------------------------------
Creating a New Variation Group
------------------------------

Let's say you have added a new product to your store, and now you want to create variations for it. You can do it right on the product page:

#. Open the **Variations** tab on the page of the product.

#. Click **Add variations**.

#. Enter a name of a feature in the **Create new products** tab.

   .. important::
       
       Not all of the features are suggested. It depends on what **Purpose** has been specified in the features' settings.
       
   If the feature does not exist yet, click **Add** and specify one of the two **Purposes** for it. Specified purpose determines whether variations with different feature values will occupy separate positions in the list.
   
#. Add **Variants** for your features. The variations will be generated automatically.

   .. image:: img/add_new_variations.png
       :align: center
       :alt: Adding new variations from the product page
       
#. Click **Create**.

-----------------------------------------
Сombining Products into a Variation Group
-----------------------------------------

Let's say you have imported products to your store, and now you want to put some of them in one group. It will allow your customers to choose a product while switching between the variations, and not to get confused with identical products with different feature variants. To do this:

#. Open the page of the product, then open the **Variations** tab.

#. Click **Add variations**.

#. Specify the features that can generate variations. It helps to find the products with the same features, but with different variants.

   .. important::
   
       To help the system select the products correctly, they must have the identical features. Also the appropriate **Purpose** must be specified in the features' settings.
       
#. Go to the **Use existing products** tab. You can see all of the identical pdoducts here.

   .. image:: img/use_existing_products.png
       :align: center
       :alt: Creating a new variation group based on the existing products
       
#. Select the products you need, and click **Add variations**.

----------------------
Management and Removal
----------------------

Once a variation group is created, all products from the group will appear on the **Variations** tab of any product in the group. On this tab you can:

* See which variations have their own catalog item, and which don't. A variation that doesn't appear on the product list has a smaller icon.

* Choose which of the variations to display by default as the catalog item.

  .. important::

      Other variations will borrow many of their properties from the variation that is selected as default.

* Remove a variation from the group; this will turn the variation into an independent product.

* Delete the variation.

* Change the group code—you can use it later to add other products to this group as variation. A group code can contain only digits, Latin characters, and the following signs: ``-`` and ``_``.

* Add more variations to the group.

* Switch to the product list to edit variations there—that way you'll be able to edit and remove variations in bulk.

* Disband the group—turn all its variations into independent products and remove the ability to switch between them on the product page.

  .. image:: img/product_variations_list.png
      :align: center
      :alt: Catalog items have bigger pictures than variations that can be selected only on the product page.

.. meta::
   :description: Looking how to let customers select product color or size in CS-Cart or Multi-Vendor? Use product variations to add switching between similar products.
