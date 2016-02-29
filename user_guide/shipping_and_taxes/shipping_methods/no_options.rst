*****************************************
No Shipping Methods Displayed at Checkout
*****************************************

There are two possible scenarios:

* You see the following message in the **Select shipping method** section on the **Checkout** page: *Unfortunately no shipping options are available for your location. Please contact us and we will see about delivering to you.*

* The **Select shipping method** section doesn't appear on the **Checkout** page at all.

===============================================
No Shipping Options Available for Your Location
===============================================

* Check the location settings in your store. Open the Administration panel and go to **Administration → Shipping & Taxes → Locations**. Click on the name of the desired location. Check whether the address selected in the **Shipping** section on the **Checkout** page in the storefront is included in the location.

* If you set up a manual shipping method, follow :doc:`this article <manual_shipping_methods/shipping_not_displayed>`.

* If you set up a realtime shipping method follow :doc:`this article <realtime_shipping_methods/not_displayed>`.

* If the **Suppliers** functionality is enabled in your CS-Cart, check whether it is :doc:`set up properly <../../users/suppliers/configure_suppliers>`.

=============================================
Select Shipping Method Section Doesn't Appear
============================================= 

* Make sure the **Disable shipping** setting is not enabled:

  * Go to the **Settings → General** section.
  * Find the **Disable shipping** setting the **Users/cart** section. Disable this setting if necessary.

.. note::

    The **Disable shipping** setting has been **removed since version 4.3.5.**

* Check whether the **Free shipping** option is disabled for the products you are trying to order:

  * Go to the **Products → Products** section.
  * Find the necessary product and click on its link.
  * Open the **Shipping Properties**  tab and check whether the **Free shipping** option is disabled for the product.
