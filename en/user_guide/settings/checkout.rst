********
Checkout
********

Use this section to configure the appearance and functionality of the checkout page.

* **Disable anonymous checkout**—if you enable this setting, only registered customers will be allowed to place orders in your store.

* **Offer guest to create an account after successful order**—if you enable this setting, the buyer who placed an order as a guest will be offered to register an account afterwards.

* **Initial order ID value**—an integer number to open the order ID numbering. The value you enter here will be used as the ID of the next order placed in your store. With every new order, its ID will increase by 1. The value of this field cannot be lower than any order ID that already exists in the database.

* **Tax calculation method based on**—select whether taxes should apply to individual products in the order (*Unit price*) or to the order subtotal, which also considers all discounts (*Subtotal*).

  .. note::

      Here is a complex example of how taxes are calculated if the tax calculation method is based on the order subtotal.

      Provided the order contains three products:
 
      Product A - $100 x 2       (tax1 = 10%)

      Product B - $50 x 3        (tax2 = 5%)

      Product C - $70 x 4        (tax1 + tax2 = 10% + 5%)
 
      Order total = $630

      Order discount = $60

      **Step 1:** Calculating the discounted subtotal

      630 - 60 = 570
 
      **Step 2:** Allocating the discount by the tax group subtotal

      $570 / $630 = $0.904762

      tax1 subtotal = (($100 * 2) + ($70 * 4)) * $0.904762 = $434.29

      tax2 subtotal = (($50 * 3) + ($70 * 4)) * $0.904762 = $389.05
 
      **Step 3:** Calculating taxes

      tax1 (10%) = $434.29 * 0.1 = $43.43

      tax2 (5%) = $389.05 * 0.05 = $19.45
 
      **Step 4:** Calculating the total (discounted subtotal + taxes)

      570 + 43.43 + 19.45 = $632.88

* **Minimum order amount**—the minimum order cost of the entire cart required for placing an order.

* **Allow shopping for unlogged customers**—determines if the store visitors will be able to add products to their carts and see product prices even if they haven't signed in.

* **Allow checkout only from the Cart content page**—if you enable this setting, a customer will be redirected to the cart page after clicking the **Checkout** button. Otherwise, the customer will go directly to the checkout page.

* **Estimate shipping cost on cart page**—if you enable this setting, a form for estimating shipping cost will be displayed on the cart page.

================
Default Location
================

The values you enter here are automatically considered as the geographic location of all unregistered store visitors.

You can define the following details:

* **Default address**

* **Default zipcode**

* **Default city**

* **Default country**

* **Default state**

* **Default phone**

  .. note::

      This information is also used as a :doc:`default customer address </user_guide/shipping_and_taxes/address>` for testing the rate calculation of :doc:`realtime shipping methods </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index>`.

