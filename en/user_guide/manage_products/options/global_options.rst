**********************
Global Product Options
**********************

If most of your products have the same product option, you can define this option on the **Options** page in the Administration panel. You will need to create this product option only once, and then you will be able to add it to any product quickly, without the necessity to add option variants to each product one by one.

.. note::

    Just like product-specific options, global options can form :doc:`combinations <option_combinations>` and :doc:`exceptions <exceptions>`.

.. contents::
   :backlinks: none
   :local:

======================
Create a Global Option
======================

#. In the Administration panel, go to **Products → Options**.
  
#. Click the **+** button in the upper right part of the page.

#. A pop-up window for option creation will open. Fill in the fields:

   * **Name**—the name of the product option as it appears on the storefront.

   * **Position**—the position of the product option relatively to other options in the list.

   * **Store**—the storefront to which the option originally belongs.

   * **Inventory**—if you tick this checkbox, the quantity of product with this option selected will be tracked separately.

   * **Type**—the type of the product option: *Select box*, *Radio group*, *Check box*, *Text*, *Text area*, or *File*. Depending on the type, options may have :doc:`additional properties <../options/option_settings>`.

   * **Description**—the description of the product option as it appears on the storefront under the question mark sign next to the option name.
   
   * **Comment**—the comment to be displayed below the option on the storefront.

   * **Required**—if you tick this checkbox, customers will have to select/enter the variant of this option.

   * **Missing variants handling**—this setting determines what happens when all the variants of the option are disabled or not specified at all: 

     * *Display message*—the option will appear on the product page, but will be marked as not available. If the option is mandatory (see the previous setting), customers will not be able to add the product to cart. 

     * *Hide option completely*—the option will be hidden; even if the option is mandatory (see the previous setting), customers will still be able to add the product to cart.

#. Click the **Create** button.

   .. image:: img/global_options_01.png
       :align: center
       :alt: The option creation pop-up window in CS-Cart

==================================
Apply a Global Option to a Product
==================================

#. Go to **Products → Products**.

#. Open any product details page and open the **Options** tab.

#. Click the **Add global option** button, select the global option, and click **Apply**.

   .. image:: img/global_options_03.png
       :align: center
       :alt: Apply a global option to a product in CS-Cart

   .. important::

       If you tick the **Apply as link** checkbox, you won't be able to edit the option for each specific product. All the changes you make to this option will affect all products that have this option added as a link.
    
       If you do not tick the checkbox, then the option will be copied for the product. You will be able to edit the variants of the option for this particular product, without it affecting other products.

==========================================
Apply a Global Option to Multiple Products
==========================================

#. Go to **Products → Options**.

#. Click the **Apply to products** button in the upper right part of the page. This will open a new page where you'll be able to select which options to apply, and to which products.

   .. image:: img/apply_to_products_01.png
       :align: center
       :alt: Apply a global option to multiple products in CS-Cart

#. Click the **Add products** button and choose the products to which you want to apply options.

#. Tick the checkboxes of the options you'd like to apply.

   .. image:: img/apply_to_products_02.png
       :align: center
       :alt: Choosing the options to apply

#. Click the **Apply** button in the upper right part of the page.
