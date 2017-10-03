*****************************************
If No Shipping Methods Appear at Checkout
*****************************************

If shipping methods don't appear at checkout, there are two possible scenarios:

* You see the following message in the **Select shipping method** section on the checkout page: *Sorry, it seems that we have no shipping options available for your location. Please check your shipping address and contact us if everything is okay. We'll see what we can do about it.*

* The **Select shipping method** section doesn't appear on the сheckout page at all.

* The **Select shipping method** section is there, but only *Free shipping* is written there.

===============================================
No Shipping Options Available for Your Location
===============================================

* Check the location settings in your store. Open the Administration panel and go to **Administration → Shipping & taxes → Locations**. Click on the name of the desired location. Check whether the address selected in the **Shipping** section on the **Checkout** page in the storefront is included in the location.

* If you set up a manual shipping method, follow :doc:`this article <manual_shipping_methods/shipping_not_displayed>`.

* If you set up a real time shipping method, follow :doc:`this article </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/not_displayed>`.

* If the **Suppliers** functionality is enabled in your CS-Cart, check whether it is :doc:`set up properly </user_guide/users/suppliers/configure_suppliers>`.

========================================
Shipping Method Selection Doesn't Appear
======================================== 

Go to **Settings → Checkout** and make sure that the **Display "Shipping method" step** checkbox is ticked.

====================================================
"Free Shipping" Is Shown Instead of Shipping Methods
====================================================

* Make sure that you have an active shipping method under **Administration → Shipping & taxes → Shipping methods**.

* Make sure that the product being purchased is not downloadable (by default, digital products are shipped for free, unless you configure the product otherwise).
