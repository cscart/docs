*******
General
*******

Settings and preferences in this section affect different aspects of your store.
 
* **Alternative currency display format**—this setting determines whether product prices are shown in one currency (selected by the customer) or in two currencies (the default store currency and the currency selected by the customer).

* **Weight symbol**—the symbol of the unit of weight that you use in your store (e.g., *lb*, *kg*, etc.)

* **Grams in the unit of weight defined by the weight symbol**—the number of grams in the unit of weight that you use in your store.

* **Close storefront**—make the storefront unavailable to customers.

* **Access key to temporarily closed store**—the key to access the temporarily closed storefront. For example, if the key is ``123456``, the closed store can be accessed through the following URL only: ``http://www.example.com/index.php?store_access_key=123456`` (replace *www.example.com* with the domain name of your store).

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

* **Help us improve software**—select whether you want to send snapshots of your store to the development team automatically or manually. Snapshots include no personal data; they reflect the current condition of the store: its settings and configuration, the add-ons that you use, etc. This information allows the development team to learn what CS-Cart features and options are used most intensively, and to adjust the development processes accordingly.

* **Check for updates automatically**—select whether you want to check for software updates automatically.

* **Monitor changes in core files**—if you enable this setting, you'll be notified about changes in core files whenever you open the Administration panel. We have a separate article that explains :doc:`why modifying core files isn't a good practice </developer_guide/getting_started/guidelines>`.

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

=======
Catalog
=======

* **Enable inventory tracking**—if you enable this setting, the system will automatically update the product inventory every time products are ordered or returned.

* **Allow customers to compare products**—if you enable this setting, customers will be able to add products to comparison list. We have a separate article about :doc:`comparing products and their features </user_guide/manage_products/features/feature_comparison>`.

* **Allow negative amount in inventory**—if you enable this setting, customers will be able to order products that are out of stock.

  .. important::

      Even when this setting is disabled, a product can still have a negative amount in stock, but only when that product has :ref:`"Buy in advance" as an out-of-stock action <buy-in-advance>`. 

* **Enable selling downloadable products**—if you enable this setting, the **Downloadable** checkbox will be added to the product editing page. It means that a product can be distributed by download.

* **Download key TTL**—the number of hours before the link for a downloadable product sent to a customer expires and becomes invalid. It is the time period, during which the customer can download the product.

* **Low stock notification threshold**—the minimum quantity of items in stock when the order department will be notified about the low quantity of items.

* **Show products from subcategories of the selected category**—if you enable this setting, products from subcategories will be displayed on the parent category page.

* **Display modifiers for product options**—if you enable this setting, product option and variant selectors will show how choosing a particular variant/option will change the original product price (if at all).

* **Exception style**—the way the system must handle :doc:`product option exceptions </user_guide/manage_products/options/exceptions>` (unavailable combinations of options). You can:

  * Hide unavailable combinations.

  * Show a warning message saying that the chosen combination cannot be purchased.

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

* **Allow shopping for unlogged customers**—determines if the store visitors will be able to add products to their carts and see product prices even if they haven't signed in.

* **Allow checkout only from the Cart content page**—if you enable this setting, a customer will be redirected to the cart page after clicking the **Checkout** button. Otherwise, the customer will go directly to the checkout page.

* **Allow customer to sign up for user group**—if you enable this setting, customers will be able to sign up for user groups on the storefront.

* **Administrator must activate new user accounts**—if you enable this setting, newly created customer accounts will be inactive until the store administrator activates them manually.

* **Quick registration**—if you enable this setting, customers will only need to provide contact information for registration.

* **Estimate shipping cost on cart page**—if you enable this setting, a form for estimating shipping cost will be displayed on the cart page.

* **Disregard product options when calculating quantity discounts**—this setting determines how CS-Cart and Multi-Vendor count the number of product items to apply a :doc:`quantity discount </user_guide/manage_products/products/wholesale>`. 

  If you enable this setting, then different variants of :doc:`product options </user_guide/manage_products/options/index>` and :doc:`option combinations </user_guide/manage_products/options/index>` will be regarded as the same product, and CS-Cart will simply count the number of ordered items. Otherwise, different variants of product options will be regarded as separate products.

  For example, a T-shirt that has two variants for the **Color** option—*Red* and *Blue*. The quantity discount applies when there are 5 or more T-shirts in the order.

  * When options are taken into account (the setting is disabled), a customer will need to order 5 red or 5 blue T-shirts to qualify for the quantity discount.

  * When options are disregarded (the setting is enabled), then a customer will be able to order 2 blue and 3 red T-shirts and still get the quantity discount.

  .. important::

      This setting doesn't affect :doc:`product variations </user_guide/manage_products/products/product_variations>`, because each variation is considered a separate product and has its own quantity discounts.

=====================================
Proxy Server for Outgoing Connections
=====================================

If your store works under a proxy-server, specify your connection details here.

* **Proxy host**—the name of the proxy server (e.g., *example.com*).

* **Proxy port**—the proxy server port number (e.g., *8080*).

* **Proxy user**—the username to connect to the proxy server.

* **Proxy password**—the password to connect to the proxy server.

==============
Search Options
==============

* **Search also in**—determines which types of objects apart from products are covered by the built-in search on the storefront. The objects you select will also be displayed in the search results, if they match the search criteria.
