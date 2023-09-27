**********************
Amazon Synchronization
**********************

.. important:: 

    The following integration supports the registered in the **Amazon Marketplace Web Service** clients only. Selling Partner-API profiles support is **temporarily** unavailable.

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000153" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    **The Amazon Synchronization add-on** lets you synchronize products and orders in your CS-Cart store and Amazon.com in minutes. Product names, in-stock quantity and prices, as well as order information, users will be synchronized. The **Available at Amazon** button will appear on the product page.

    .. fancybox:: img/amazon-synchronization-013.png
        :alt: Amazon Synchronization add-on for CS-Cart

    If you do not have an Amazon seller account yet, `sign up <https://services.amazon.com/selling/getting-started.html/>`_ for it. Check out the `pricing <https://services.amazon.com/selling/pricing.html>`_.

    .. important::

        The add-on comes with installation and configuration of the default settings of the add-on. We can also provide you with the custom development service on a paid basis if any modification is required. Contact us for a `free quote <https://www.simtechdev.com/quote.html>`_ for the Amazon integration service.

    .. note::

        The add-on synchronizes CS-Cart product-related data with Amazon.com: product name, product quantity, and product price. It does not import or export products.

    Here's a video showing how it works:

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/sEPUrEFyKL8" frameborder="0" allowfullscreen></iframe>
 
============
Key features
============
 
    * Automatic products synchronization between CS-Cart and Amazon.com.
    * Ability to import Amazon orders.
    * Bulk synchronization of products.
    * detailed reports on the previously synchronized products.
    * Availability for: USA, UK, Germany, and Japan.
    * Quick editing of SKU and UPC/EAN barcodes via export.
    * Synchronization of product names, prices, and inventory.
    * Automated currency conversion.
    * Multiple values support (ASIN, EAN, UPC, ISBN).
    * Amazon icon on synchronized products at the storefront.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart Ultimate and Multi-Vendor 4.5 and above, but only versions 4.11.x, 4.12.x and 4.13.x are supported.

    Don't know what archive to download to install the add-on? Read `here <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_.

=======
Support
=======

    You are guaranteed the ability to buy quality add-ons to support future versions. If you need help, please contact us via our `help desk system <https://www.simtechdev.com/helpdesk>`_.

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the **Amazon Synchronization** add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click **Upload & install**. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    1. Click on the add-on to open its settings.

    2. In the **General tab**, you will see commands that you can use to run a cron script according to a schedule. These commands will **sync all the products** and **automatically import Amazon orders**. *path/to/cart* is the path to your website and *CRON_KEY* is the access key specified in the **Cron key** field below.

    .. note::

        A cron script should be set up on your server. If you have any difficulties with it, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

    .. fancybox:: img/amazon-synchronization-01.png
        :alt: settings of the add-on

    **Cron key**—Specify a cron key and replace *CRON_KEY* from the cron line with it.

    **Your marketplace**—Select the region of your business. Available options are: UK, USA, Germany, Japan.

    **Synchronization period**—Select the period of synchronization with Amazon. If you have more than 100 orders per month, choose *Week* of *Day*.

    3. Select the attibutes you want to synchronize: product name, quantity, price.

    4. Select the **Import orders** checkbox if you want to import orders from the Amazon store. If you want to skip order import, move to step 6. 

    5. Configure the settings for the order import:

    .. note::

        The orders are imported via the LIstOrders API. Fore more details, refer to: `ListOrders API <http://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_ListOrders.html>`_.

    **Default shipping**—Select the shipping method that will be used by default for orders imported from Amazon.

    **Unshipped status**—Select the order status that matches the Unshipped status on Amazon. (Payment has been authorized and order is ready for shipment, but no items in the order have been shipped.)

    **Shipped status**—Select the order status that matches the Shipped status on Amazon. (All items in the order have been shipped.)

    **Canceled status**—Select the order status that matches the Canceled status on Amazon. (The order was canceled.)

    **Import users**—Select the checkbox if you want to import users from Amazon to CS-Cart store. The users will be matched by email address. The user first name, shipping address and billing address will be imported. If you clear the checkbox, the user will be displayed as a guest in the order.

    **Default category**—Select the category that should be assigned to products by default if the order contains products from Amazon that are unavailable in your CS-Cart store.

    6. Switch to the tab that corresponds to the region of your business. Here, select the **Active** box and enter the account details from your Amazon Merchant Account.

    .. fancybox:: img/amazon-synchronization-003.png
        :alt: settings of the add-on

    7. Once you specify all the account details, click **Check connectivity** to make sure everything's correct.

    8. One more thing you will need to do to make order import go smoothly is to match payment methods in your Amazon and CS-Cart stores. To do so, go to **Administration > Payment methods**. Open a payment method and define the **Amazon payment method**. Click **Save**.

    .. fancybox:: img/amazon-payment-method.png
        :alt: settings of the add-on

    .. important::

        If you do not match payment methods, orders will NOT be imported.

==================
Importing products
==================

++++++++++++++++++++++++++++++++++++
Importing/exporting a single product
++++++++++++++++++++++++++++++++++++

    1. Go to **Products > Products**.

    2. Open a desired product.

    3. Switch to the **Amazon** tab. You will see available settings for importing/exporting a product, which are divided into General and Advanced.

    .. fancybox:: img/amazon-synchronization-004.png
        :alt: general product settings

    * **Synchronization with Amazon**—The checkbox is selected for the products synchronized with Amazon.

    * **SKU**—(Stock keeping unit) Product id code. Each product must have an SKU, and each SKU must be unique. If SKU is empty, the product CODE is used instead.

    * **ASIN**—(Amazon Standard Identification Number) 10-character alphanumeric unique identifier assigned by Amazon.com. It's optional.

    .. fancybox:: img/amazon-synchronization-014.png
        :alt: ASIN and SKU

    * **EAN**—(European Article Number) This type of bar code is specific to Europe and Japan, but is widely used internationally. It is a superset of the UPC code: all products marked with an EAN will be accepted in North America.

    * **UPC**—(Universal Product Code) This type of bar code is widely used in the United States, the United Kingdom, Canada, Australia and in other countries.

    * **ISBN**—(International Standard Book Number) 13-digit number that uniquely identifies books and book-like products published internationally.

    .. fancybox:: img/amazon-synchronization-005.png
        :alt: general product settings
        :width: 662px

    * **Amazon item type**—Pre-defined value that specifies where the product should appear within the Amazon browse structure.

    * **Recommended browse node**—Value used to classify an item. Mandatory for Canada, Europe, and Japan; not used in the US. Use a comma to separate nodes.

    Use the `product classifier <https://sellercentral.amazon.com/listing/classify?>`_ to get these values.

    .. fancybox:: img/product-classifier.png
        :alt: Amazon product classifier

    * **Redefine price on Amazon**—If selected, the price set in the CS-Cart store will be overwritten.

    * **Amazon product price ($)**—Price of a product on Amazon. This value will overwrite the price in the CS-Cart store.

    * **Product condition**—The condition of the product. Select the necessary one from the list.

    4. Once you specify the necessary settings, click **Save**.

    5. In the top right corner, click the gear button and select **Export to Amazon** or **Import from Amazon**.

    .. fancybox:: img/amazon-synchronization-007.png
        :alt: exporting a product

    The process will start.

    .. fancybox:: img/amazon-synchronization-008.png
        :alt: processing

    Once the process is complete, you will see a brief report.

    .. fancybox:: img/amazon-synchronization-009.png
        :alt: complete import
        :width: 696px

    To view a detailed report, click on the **report** link. It will bring you to the Amazon reports page.

     .. fancybox:: img/amazon-synchronization-010.png
        :alt: complete import

+++++++++++++++++++++++++++++++++++++
Importing/exporting multiple products
+++++++++++++++++++++++++++++++++++++

    1. Go to **Products > Products**.

    2. Decide which of the products you want to export and prepare them for import/export. See the explained settings above.

    Instead of configuring each product separately, you can select the necessary products, click **Edit selected** under the gear button.

    Then, select the checkboxes assosiated with Amazon.

    .. fancybox:: img/amazon-synchronization-012.png
        :alt: complete import

    On the opened page, enter the necessary values and click **Save**.

    3. Go back to the products list page, click the gear button in the top right and select **Export from Amazon** or **Import to Amazon**.

    The process will start.

    .. fancybox:: img/amazon-synchronization-008.png
        :alt: processing

    Once the process is complete, you will see a brief report.

    .. fancybox:: img/amazon-synchronization-009.png
        :alt: complete import
        :width: 696px

    To view a detailed report, click on the **report** link. It will bring you to the Amazon reports page.

    .. fancybox:: img/amazon-synchronization-010.png
        :alt: complete import

================
Importing orders
================

    To import orders from your Amazon store to your CS-Cart one, follow these steps:

    1. Go to **Orders > View Amazon orders**.

    2. Select the store location, period and dates for orders you want to see. Click **Search**.

    .. fancybox:: img/searching-orders.png
        :alt: searching Amazom orders

    3. Select the orders you want to import to your store and under the gear button select **Import**.

    .. fancybox:: img/importing-orders-from-amazon.png
        :alt: importing Amazom orders

    Alternatively, you can select multiple orders and select **Import** from the top right corner under the gear button:

    .. fancybox:: img/importing-several-orders.png
        :alt: importing Amazom orders

    .. note::

        You can import orders with **Shipped** and **Unshipped** statuses only. Also, make sure you have matched the payment methods. For details, see `Setting up the add-on`_.

    4. Once you import orders, you will see a corresponding notification:

    .. fancybox:: img/import-complete.png
        :alt: importing Amazom orders

    5. That's it. Imported orders will aquire order IDs. Clicking on the order ID will take you to the order editing page. 

    On the list of orders, orders imported from Amazon will have the **Amazon Order** checkbox selected.

    .. fancybox:: img/amazon-orders-list.png
        :alt: importing Amazom orders