******************************
Options and Inventory Tracking
******************************

Options may or may not affect inventory:

* **Options affect inventory** when products with or without an option are physically different items. For example, the same shoes of different sizes are separate items, and usually they need to be tracked separately.

* **Options don't affect inventory** when the product is the same, regardless of the option. For example, adding a gift wrap doesn't change a product in any way, and can be added to any item. That's why it's not logical to track how many products with and without the gift wrap you have remaining.

A product has a property called **Inventory**, that has 3 values: 

* **Do not track** means that CS-Cart won't track the amount of this product in stock at all.

* **Track without options** means that CS-Cart will track the amount of this product in stock, but won't take options into account. You'll be able to specify the quantity of the product in the **In stock** field.

  When you select an option combination on the storefront, then the main image of the product will change, but **CODE** will remain the same.

* **Track with options** means that each :doc:`option combination <option_combinations>` will have its own quantity. The **In stock** field will be replaced by the link that takes you to the list of option combinations.

  When you select an option combination on the storefront, then the product code will be replaced by the combination code (if it was specified), and the main product image will be replaced replaced with the image of the combination.

======================
Low Stock Notification
======================

When a customer makes a purchase, the quantity of a product in stock decreases.

The remaining quantity may become lower than the value of the **Low stock notification threshold** setting from **Settings → General**. In this case the administrator receives an email notifying that a certain product is almost out of stock.

.. note::

    If a product is tracked with options, then the quantity of a specific combination will be sent. 
  
