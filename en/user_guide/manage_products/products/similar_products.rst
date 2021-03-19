***************************************
How To: Create Several Similar Products
***************************************

There are situations when one product has many similar variants. For example, clothes have  colors and sizes. Previously, such variants were created with :doc:`options </user_guide/manage_products/options/index/>`. But this method has disadvantages: 

* It is impossible to track the amount of each modification in the store.
 
* It is impossible to add images to each modification.

Options are good for custom-made products. For example, when a client chooses the size before a table is even made. Or when someone orders an item with engraving.

It is better to set the inseparable properties of products with :doc:`features </user_guide/manage_products/features/index/>`. For example, when you sell the tables that have already been made, you cannot change their color. But you can offer a client a similar table in a different color. For these tasks, you can use :doc:`product variations </user_guide/addons/product_variations/index/>`. In that case, each product variant will have its own SKU, price, image, shipping properties, etc.

.. contents::
    :backlinks: none
    :local:

==================================
Step 1. Create a Reference Product 
==================================

When we create new variations, firstly we create a reference product, also called a parent product. It will be the base for variants which are referred to as product variations.

#. :doc:`Create a product </user_guide/manage_products/products/add_product/>`. In this example, we will create a bike.

#. Go to the **Features** tab. Here you can :doc:`add features </user_guide/manage_products/features/product_features/>` to your product. For our bike, we’ll add "Color", "Wheel Size", and "Frame Size".

#. Be sure to click the **Advanced feature creation** button when you create each feature. There you need to set some properties for the features to create variations later by these features.

   * For the "Color" feature, set the **Purpose** to *Variations as separate products*. Then the customer will see bikes of all colors as separate products in the catalog and in the search results. To select features through pictures, set **Feature style** to *Images*.

   * For the "Wheel size" and "Frame size", set the **Purpose** to *Variations as one product*. Then the customer will choose feature variants on the product page. That way, the catalog and the search results won’t contain many similar products with the same picture. It is better to select these features through the drop-down list. For this, set the **Feature style** to *Drop-down list*. 

     .. image:: /user_guide/manage_products/products/img/features.png
            :align: center
            :alt: Features on the storefront.    

     .. note::

         To make product search easier for buyers, :doc:`add filters </user_guide/manage_products/filters/adding_filter>` by the created features.

=========================
Step 2. Generate Variants
=========================

When you have created the reference product and its features, the rest of the feature combinations (called **variations** in CS-Cart) will be created automatically. Create variations for the bike:
  
#. On the created product page, go to the **Variations** tab and click **Add variations**.

#. This page shows three created features, which are the base for bike variations. To add all combinations of colors and sizes, use the **Add all variants** button.

#. In the list of variations to be created, set an own price and quantity for each of these products.

#. Click the **Create X variations** button.

   We have created 18 different bikes. Go to any of its pages and edit the price, weight, or some other properties.

   .. image:: /user_guide/manage_products/products/img/many_variations.png
          :align: center
          :alt: Created variations.   