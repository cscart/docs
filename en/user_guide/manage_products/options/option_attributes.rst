*****************************************
Properties of Options and Option Variants
*****************************************

=================
Option Properties
=================

Product options appear on the product details page on the storefront as parameters that a customer can select or enter. Options can have the following properties:

* **Name**—the name of the product option as it appears on the storefront.

* **Internal name**—the name of the global option that only appears in the Administration panel to help you distinguish between multiple options that have the same displayed name.

  For example, if you sell shoes and T-shirts, you probably have 2 separate global options called *Size*. Without the internal name they'd look the same in the administration panel, and it'd be hard to guess which of these options to apply to your newly-created product.

* **Position**—the position of the product option relatively to other options in the list.

* **Store**—the storefront to which the option originally belongs.

* **Inventory** (obsolete)—if you tick this checkbox, you'll be able to track the quantity of a product with this option selected via :doc:`option combinations <option_combinations>`.

* **Type**—the type of the product option: *Select box*, *Radio group*, *Check box*, *Text*, *Text area*, or *File*. Depending on the type, options may have :doc:`additional properties </user_guide/manage_products/options/option_settings>`.

* **Description**—the description of the product option as it appears on the storefront under the question mark sign next to the option name.
   
* **Comment**—the comment to be displayed below the option on the storefront.

* **Required**—if you tick this checkbox, customers will have to select/enter the variant of this option.

* **Missing variants handling**—this setting determines what happens when all the variants of the option are disabled or not specified at all: 

  * *Display message*—the option will appear on the product page, but will be marked as not available. If the option is mandatory (see the previous setting), customers will not be able to add the product to cart. 

  * *Hide option completely*—the option will be hidden; even if the option is mandatory (see the previous setting), customers will still be able to add the product to cart.

==================
Variant Properties
==================

Options of the *Select box*, *Radio group*, or *Check box* types have variants that a customer can choose from. Option variants can be configured on a separate tab called **Variants** and have the following properties:

* **Position**—the position of the variant relatively to other variants in the list.

* **Name**—the name of the option variant. For example, if the option is titled *Size*, the variants to the option can be *Small*, *Medium*, *Large*, etc.

* **Modifier/Type**—a positive or negative value that will be added to or subtracted from the original product price. The modifier can be either an absolute value or a percentage.

* **Weight modifier/Type**—a positive or negative value that will be added to or subtracted from the original product weight. The modifier can be either an absolute value or a percentage.

* **Status**—the status of the variant (*Active* or *Disabled*).

* **Icon**—a thumbnail to represent the option variant. You can also specify alternative text for this thumbnail, it's good for SEO.

  These icons are shown on the product details page on the storefront.

  .. image:: img/option_variants.png
      :align: center
      :alt: Option variants on the storefront

* **Earned point modifier/Type**—a positive or negative value that will be added to or subtracted from the original number of reward points that customers receive when they buy the product. The modifier can be either an absolute value or a percentage.
