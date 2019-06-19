*******
General
*******

Settings and preferences in this section affect different aspects of your store.
 
* **Alternative currency display format**—this setting determines whether product prices are shown in one currency (selected by the customer) or in two currencies (the default store currency and the currency selected by the customer).

* **Weight symbol**—the symbol of the unit of weight that you use in your store (e.g., *lb*, *kg*, etc.)

* **Grams in the unit of weight defined by the weight symbol**—the number of grams in the unit of weight that you use in your store.

* **Close storefront**—make the storefront unavailable to customers.

* **Access key to temporarily closed store**—the key to access the temporarily closed storefront. For example, if the key is ``123456``, the closed store can be accessed through the following URL only: ``http://www.example.com/index.php?store_access_key=123456`` (replace *www.example.com* with the domain name of your store).

* **Help us improve software**—select whether you want to send snapshots of your store to the development team automatically or manually. Snapshots include no personal data; they reflect the current condition of the store: its settings and configuration, the add-ons that you use, etc. This information allows the development team to learn what CS-Cart features and options are used most intensively, and to adjust the development processes accordingly.

* **Check for updates automatically**—select whether you want to check for software updates automatically.

* **Monitor changes in core files**—if you enable this setting, you'll be notified about changes in core files whenever you open the Administration panel. We have a separate article that explains :doc:`why modifying core files isn't a good practice </developer_guide/getting_started/guidelines>`.

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

=====
Users
=====

* **Allow users to create multiple profiles for one account**—if you enable this setting, users will be allowed to specify multiple shipping and billing addresses for a single account. This may be useful when a user needs separate profiles for personal and business use, for example.

* **Allow customer to sign up for user group**—if you enable this setting, customers will be able to sign up for user groups on the storefront.

* **Administrator must activate new user accounts**—if you enable this setting, newly created customer accounts will be inactive until the store administrator activates them manually.

* **Quick registration**—if you enable this setting, customers will only need to provide contact information for registration.

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
