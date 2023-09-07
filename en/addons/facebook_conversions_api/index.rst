************************
FB conversions
************************
.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000291" class="btn buy-now__btn">Buy now</a>
    </div>

.. contents::
    :local:
    :depth: 2

--------
Overview
--------

The add-on provides the ability to transfer the site events information directly to Facebook via Conversions API service.

This system allows collecting and tracking analytical, event and order data from your server, evading the browser limitations. Event transferred via Conversions API are connected to Facebook Pixel and processed the same way. That means that Conversions API events can be used in analytics, reports and optimization processes just as Facebook Pixel ones.

Observe the more detailed information about FB conversions `here <https://www.facebook.com/business/help/2041148702652965?id=818859032317965>`_.

============
Key Features
============

    * Evade browser and ad block limitations

    * Use Conversions API to collect data directly from the server

    * The add-on is compatible with Facebook Pixel 

    * Data transfer to Facebook Ads

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 7.2.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

===============
Add-on Settings
===============

There are three tabs in the add-on settings:

    1. General

    2. Conversions Tracking

+++++++
General
+++++++

.. fancybox:: img/capi.png
    :alt: FB conversions

**Identifier Facebook Pixel** - identification number of your Facebook Pixel the event information is sent to. Observe the detailed instruction for Facebook Pixel here.

**FB conversions token** - token for event data transferring to Facebook Pixel via Conversions API. Token can be generated in Facebook Pixel settings in the Conversions API paragraph.

**Display personalized Facebook Pixel and Conversions API for vendors** - this setting allows vendors to insert their Identifier Facebook Pixel and FB conversions token, so they could receive data concerning their products

**Log requests** - option allows logging of the requests to and answers from Conversions API into the event log. 

+++++++++++++++++++++++
Conversion Tracking Tab
+++++++++++++++++++++++

.. fancybox:: img/capi1.png
    :alt: Conversion Tracking Tab

.. fancybox:: img/capi2.png
    :alt: Conversion Tracking Tab 2

The tab contains the list of events to be tracked and sent to Facebook.

+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Event title          |Activated when                                      |Transferring to vendor                  |Note                                                                                                                                                    |
+=====================+====================================================+========================================+========================================================================================================================================================+
|One Click Buy        |One Click Buy form is sent from the product page    |Yes                                     |“Purchase“ event type in Facebook Pixel                                                                                                                 |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Initiate Checkout    |The Checkout Page is opened                         |Yes                                     |When the option is activated, the initiation stages can be selected for tracking                                                                        |
|                     |                                                    |                                        |                                                                                                                                                        |
|                     |                                                    |                                        |“All stages“ - the event will be transferred every time                                                                                                 |
|                     |                                                    |                                        |                                                                                                                                                        |
|                     |                                                    |                                        |“After authorizing or filling out the address only“ - the event will be transferred if the customer is authorized or filled out  the address only       |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Request call         |The Request Call form is  sent                      |Yes (when is sent from the product page)|The event data will be classified as “Purchase“ type in case it was sent from the product page. In any other case the event will be classified as “Lead“|
|                     |                                                    |No (in any other case)                  |                                                                                                                                                        |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Add to Cart          |The product is added to the cart                    |No                                      |Quantity of the products in the cart is not tracked                                                                                                     |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Page View            |Viewing any page                                    |No                                      |Isn’t displayed in the add-on settings, always activated                                                                                                |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|View Content         |Product Page is viewed                              |Yes                                     |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Search               |The product is searched                             |No                                      |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Add to Wishlist      |The Product is added to Wishlist                    |Yes                                     |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Add Payment Info     |The checkout is fixed and payment data are inserted |Yes                                     |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Purchase             |The checkout is complete                            |Yes                                     |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Lead                 |The product page is viewed                          |Yes                                     |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
|Complete registration|The user is registered                              |No                                      |--                                                                                                                                                      |
+---------------------+----------------------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+

============================================
Interaction with the “Facebook Pixel” add-on
============================================

Facebook Pixel and FB conversions add-on are similar in purpose and different in the data transferring method

In order to prevent data duplication, the FB conversions add-on includes the Facebook made event deduplication mechanism. Hence, the simultaneous use of two add-ons is possible.