*****************************************
If No Shipping Methods Appear at Checkout
*****************************************

If shipping methods don't appear at checkout, there are two possible scenarios:

* You see the following message in the **Select shipping method** section on the checkout page: *Sorry, it seems that we have no shipping options available for your location. Please check your shipping address and contact us if everything is okay. We'll see what we can do about it.*

* The **Select shipping method** section doesn't appear on the сheckout page at all.

* The **Select shipping method** section is there, but only *No shipping required* is written there.

===============================================
No Shipping Options Available for Your Location
===============================================

* Check the rate area settings in your store. Open the Administration panel and go to **Administration → Shipping & taxes → Rate areas**. Click on the name of the desired rate area. Check whether the address selected in the **Shipping** section on the **Checkout** page in the storefront is included in the rate area.

* If you set up a manual shipping method, follow :doc:`this article <manual_shipping_methods/shipping_not_displayed>`.

* If you set up a real time shipping method, follow :doc:`this article </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/not_displayed>`.

* If you set up a real time shipping method in **Multi-Vendor**, check whether vendors' addresses are correct. An incorrect vendor's address prevents real time shipping methods from displaying on a storefront.

* If the **Suppliers** functionality is enabled in your CS-Cart, check whether it is :doc:`set up properly </user_guide/users/suppliers/configure_suppliers>`.

========================================
Shipping Method Selection Doesn't Appear
======================================== 

Go to **Design → Layouts**, switch to the **Checkout** tab, and make sure that **Checkout: Shipping methods** block (by default it's called *Shipping methods*) exists there, and isn't hidden or disabled.

.. important::

    This block must be located in a grid with the *Lite checkout* wrapper, along with other checkout-related blocks.

===========================================================
"No Shipping Required" Is Shown Instead of Shipping Methods
===========================================================

* Make sure that you have an active shipping method under **Administration → Shipping & taxes → Shipping methods**.

* Make sure that the product being purchased is not downloadable (by default, digital products are shipped for free, unless you configure the product otherwise).

.. meta::
   :description: What to do if shipping methods don't appear at checkout in CS-Cart and Multi-Vendor ecommerce platforms?
