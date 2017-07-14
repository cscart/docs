*******************************
How To: Create a Product Option
*******************************

This article describes how to create an option for a particular product. If you sell multiple products that all have the same options (such as color or size), it may be better to use :doc:`global product options <../options/global_options>`.

#. In the Administration panel, go to **Products → Products**.

#. Open the product editing page and then switch to the **Options** tab.

#. Сlick the **Add option** button and fill in the form in a pop-up window:

   * **Name**—the name of the product option as it appears on the storefront.

   * **Position**—the position of the product option relatively to other options in the list.

   * **Store**—the storefront to which the option originally belongs.

   * **Inventory**—if you tick this checkbox, the quantity of product with this option selected will be tracked separately.

   * **Type**—the type of the product option: *Select box*, *Radio group*, *Check box*, *Text*, *Text area*, or *File*. Depending on the type, options may have :doc:`additional properties <../options/option_settings>`.

   * **Description**—the description of the product option as it appears on the storefront under the question mark sign next to the option name.
   
   * **Comment**—the comment to be displayed below the option on the storefront.

   * **Required**—if you tick this checkbox, customers will have to select/enter the variant of this option.

   * **Missing variants handling**—how forbidden and missing option combinations should be handled: 

     * *Display message*—the option will be marked as not available. If the option is mandatory (see the previous setting), customers will not be able to add the product to cart. 

     * *Hide option completely*—the option will be hidden; if the option is mandatory (see the previous setting), customers will be able to add the product to cart.

#. Click the **Create** button.

#. Now if you return to the product editing page and go to the **Options** tab, you'll be able to create :doc:`option combinations <option_combinations>`.

.. hint::

    Options for a product can also be added :doc:`via CSV import <../import_export/fields_format>`.
