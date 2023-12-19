*****************
Shipping Estimate
*****************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000089" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **The CS-Cart Shipping Estimate add-on** allows to automatically calculate the time and cost of delivery of a product for customers based on the destination and service. It enables you to inform your customers as to how long each shipping method takes to ship an order and how much it costs. The location of the user is retrieved from the user data.

    .. fancybox:: img/Shipping_estimate_Overview.png
        :alt: The CS-Cart Shipping Estimate add-on

    .. tip::

        We recommend using the `Geolocation by Google <http://docs.simtechdev.com/addons/geolocation_by_google/index.html>`_ or `IP Geolocation <http://docs.simtechdev.com/addons/geo_maxmind/index.html>`_ add-on to determine the location of a user automatically and provide accurate shipping estimates. It will be particularly necessary if the user has not provided shipping address information.

        MaxMind also allows customers to change destination by clicking on it and calculate shipping cost.

            .. fancybox:: img/Shipping_estimate_011.png
                :alt: MaxMind shipping calculation

    The add-on places a block on the product page with the lowest shipping cost. 

    .. fancybox:: img/Shipping_estimate_002.png
        :alt: Amount of shipping methods in block

    Clicking on the **Show all shipping methods** link will open a table containing all available shipping methods and their shipping costs and time of delivery:

    .. fancybox:: img/Shipping_estimate_007.png
        :alt: table of shipping estimates

    The add-on also allows to add a tab to the product page to display the shipping cost for each shipping method available in the store.

    .. fancybox:: img/Shipping_estimate_008.png
        :alt: table of shipping estimates

========
Features
========

    - Estimate shipping cost for the product on its detailed page.

    - Choose the location of the block with shipping cost.

    - Display the lowest shipping cost for the product.
    
    - Display shipping costs for each shipping method in a tab on the product page.

    - Works well with all shipping methods.

    - Simple installation and setup.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. 
    Minimum required PHP version is 7.1.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Shipping Estimate add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://shippingestimates.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state. 

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Shipping Estimate” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

==================
Available settings
==================

    Here are available settings of the add-on.

    .. fancybox:: img/Shipping-estimate-settings.png
        :alt: settings of the Shipping Estimation add-on

    * **Number of shipping methods in the block**—Determine how many shipping methods will be shown immediately after the product page is loaded. The rest methods will be available by the **Show all shipping methods** link.

    .. fancybox:: img/Shipping_estimate_002.png
        :alt: Amount of shipping methods in block

    * **Block position on the product page**—Select the position of the block on the product page.

    **Right**—Show the block to the right of the product description.

    .. fancybox:: img/Shipping_estimate_002.png
        :alt: shipping estimate on the right

    **Bottom**—Show the block right after the product description.

    .. fancybox:: img/Shipping_estimate_003.png
        :alt: shipping estimate at the bottom

    **Don't show**—Select this option if you do not want to display the block on the product page.

    * **Calculate shipping automatically**—If disabled, the shipping options will be calculated by click.

    * **Select minimum shipping method automatically**—If enabled, the shipping method with the minimum rates will be selected automatically on the cart page.

    * **Show delivery time in the block**—Specify if the delivery time should be displayed in the block with the shipping estimate.

    * **Timeout**—Enter the maximum time in seconds that you allow for calculating shipping cost. If the timeout is exceeded, an email notification will be sent to the administrator. The email will include the shipping methods which took to long to calculate the shipping cost. Leave empty if you do not want the notification to be sent.

==================================
Creating the Shipping estimate tab
==================================

    You can also display the shipping estimate of the product in a tab on the product page: 
    
    .. fancybox:: img/Shipping_estimate_006.png
        :alt: shipping estimate tab

    1. Go to **Design - Product tabs**.

    2. Click the **+** button to add a new tab.

    3. Enter a name for the tab.

    .. fancybox:: img/Shipping_estimate_004.png
        :alt: adding a new tab

    4. Click the **Select block** button.

    5. Go to the **Create new block** tab and select the **Shipping estimate** block.

    .. fancybox:: img/Shipping_estimate_005.png
        :alt: creating Shipping estimate block

    6. Click **Create**.

    The created block will look like this:

    .. fancybox:: img/Shipping_estimate_009.png
        :alt: Shipping estimate block

    That's it! Go to the storefront to see the changes.