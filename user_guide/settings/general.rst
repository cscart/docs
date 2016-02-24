*******
General
*******

Settings and preferences in this section affect different aspects of your store.
 
* **Alternative currency display format**—this option determines whether product prices are shown in one currency (selected by the customer) or in two currencies (the default store currency and the currency selected by the customer).

* **Weight symbol**—the symbol of the unit of weight that you use in your store (e.g., *lb*, *kg*, etc.)

* **Grams in the unit of weight defined by the weight symbol**—the number of grams in the unit of weight that you use in your store.

* **Close storefront**—make the storefront unavailable for customers.

* **Access key to temporarily closed store**—the key to access the temporarily closed storefront. For example, if the key is ``123456``, the closed store can be accessed through the following URL only: ``http://www.example.com/index.php?store_access_key=123456``, where replace *www.example.com* with the address of your store.

* **Initial order ID value**—an integer number to open the order ID numbering. The value you enter here will be used as the ID of the next order placed in your store. With every new order, its ID will increase by 1. The value of this field cannot be less than any order ID number that is already in the database.

* **Allow multiple shipments for a single user**——if you enable this setting, products from one order will be able to be shipped separately, in different shipments.

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

* **Help us improve software**—select whether you want to send snapshots of your store to the development team automatically or manually. Snapshots include no personal data; they reflect the current condition of the store: its settings and configuration, the modules that you use, etc. This information allows the development team to learn what CS-Cart features and options are used most intensively, and to adjust the development processes accordingly.

* **Check for updates automatically**—select whether you want to check for software updates automatically.

================
Default Location
================

The values you enter here are automatically considered as the geographic location of all unregistered store visitors.

You can define the following details:

* **Default address**;

* **Default zipcode**;

* **Default city**;

* **Default country**;

* **Default state**;

* **Default phone**.

This information is also used when setting the `realtine shipping methods <http://docs.cs-cart.com/4.3.x/user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index.html>`_.

=======
Catalog
=======

* **Enable inventory tracking**—if you enable this setting, the system will automatically update the product inventory every time products are ordered or returned.

* **Allow negative amount in inventory**—if you enable this setting, customers will be able to order products that are out of stock.

* **Enable selling downloadable products**—if you enable this setting, the **Downloadable** checkbox will be added to product details page. It means that a product can be distributed by download.

* **Download key TTL**—the number of hours before the link for a downloadable product sent to a customer expires and becomes invalid. It is the time period, during which the customer can download the product.

* **Low stock notification threshold**—the minimum quantity of items in stock; the order department will be notified when this quantity is reached.

* **Show products from subcategories of the selected category**—if you enable this setting, products from subcategories will be displayed on the parent category page.

* **Display modifiers for product options**—if you enable this setting, product option and variant selectors will show how choosing a particular variant/option will change the original product price (if at all).

* **Exception style**—the way the system must handle product option exceptions (unavailable combinations of options): hide unavailable combinations or just show a warning message saying that the chosen combination cannot be ordered.

* **Show out of stock products**—if you enable this setting, products will be displayed on the storefront even if they are out of stock.

==========
Promotions
==========

* **Allow customers to use single discount coupon only**—if you enable this setting, customers will be able to apply only one discount coupon per order.

==========
Users/Cart
==========

* **Allow users to create multiple profiles for one account**—if you enable this setting, users will be allowed to specify multiple shipping and billing addresses for a single account. This may be useful when a user needs separate profiles for personal and business use, for example.

* **Minimum order amount**—the minimum amount of order subtotal required to place an order.

* **Define minimum order amount by**—choose whether the minimum order amount should include the shipping cost (*Products with shipping*) or be a bare cost of products in the order (*Products*).

* **Allow shopping for unlogged customers**—if you enable this setting, store visitors will be able to add products to their carts even if they are not logged in.

* **Allow checkout only from the Cart content page**—if you enable this setting, a customer will be redirected to the cart after clicking the **Checkout** button. Otherwise, the customer will go directly to the checkout page.

* **Allow customer to sign up for user group**—if you enable this setting, customers will be able to sign up for user groups on the storefront.

* **Administrator must activate new user accounts**—if you enable this setting, newly created customer accounts will be inactive until the store administrator activates them manually.

* **Quick Registration**—if you enable this setting, customers will only need contact information for registration.

* **Estimate shipping cost on cart page**—if you enable this setting, a form for estimating shipping cost will be displayed on the cart page.

* **Disable shipping**—if you enable this setting, customers won't be allowed to choose shipping methods at checkout. Shipping will be deactivated in the store.

.. note::
    The **Disable shipping** checkbox was removed in version 4.3.5; see the details :doc:`in the related article <../shipping_and_taxes/shipping_methods/free_shipping>`.

* **Disregard product options when calculating quantity discounts**—this setting determines how CS-Cart counts the number of product items in order to apply a quantity discount. If you enable this setting, product options and option combinations will be regarded as the same product, and CS-Cart will simply count the number of ordered items. Otherwise, CS-Cart product options will be regarded as separate products.

.. note::
    For example, a customer buys a $10 T-shirt that has two color options—red and blue. The quantity discount rule for the T-shirt is to sell each item at $8 if there are 5 or more T-shirts in the order.

    When the **Disregard product options when calculating quantity discounts** setting is disabled, a customer needs to order 5 red or 5 blue T-shirts to qualify for the quantity discount.

    When the setting is enabled, a customer can order 2 blue and 3 red T-shirts to get the discount as 2 plus 3 gives 5 in total.

=====================================
Proxy Server for Outgoing Connections
=====================================

If your store works under a proxy-server, specify your connection details here.

* **Proxy host**—the name of the proxy server (e.g., *example.com*).

* **Proxy port**—the proxy server port number (e.g., *8080*).

* **Proxy user**—the username to connect to the proxy server.

* **Proxy password** - Password to connect to the proxy server.

==============
Search Options
==============

* **Search also in**—if you enable this setting, the search will also be conducted in **Pages** and/or **Site News**.
