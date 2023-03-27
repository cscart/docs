*******
Payeezy
*******

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000097" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    **The CS-Cart Payeezy add-on** lets you accept payments via Payeezy Gateway. Offer your customers a great experience on your website with high security, features and easy integration. Payeezy accepts major credit cards and lets your customers pay in many local currencies. Payments are processed directly in the store, the customer is not redirected to the payment gateway site.

    .. fancybox:: img/Payeezy_Selection_010.png
        :alt: Paying by credit card. Payeezy

    To learn more about Payeezy, have a look at the `frequently asked questions <https://developer.payeezy.com/faq-page>`_.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.5 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

========
Features
========

    - Accept payments via Payeezy Gateway

    - Offer more payment options

    - Process payments directly on your site

    - Enjoy impressive security features

    - Accept payments in `50+ currencies <https://developer.payeezy.com/faqs/what-currencies-does-payeezy-support>`_

    - Accept all major credit card types: Visa, Mastercard, American Express, Discover, JCB, Diners Club, and more

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    You can check out the Payeezy Gateway in our |live_demo_url|.

    .. |live_demo_url| raw:: html

        <!--noindex--><a href="http://payeezy.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

--------------------------
Start selling with Payeezy
--------------------------

    Details of creating a Payeezy account will be described in this section. You will also learn how to get API Key, API Secret, and Token required at creating the Payeezy payment method.

    Log into `Payeezy <https://developer.payeezy.com/>`_ or create a new account.

    .. fancybox:: img/Payeezy_Selection_006.png
        :alt: Payeezy. Creating an account
        :width: 400px

    Then you will receive an e­mail with the link to set a password.

    Add a new API.

    .. fancybox:: img/Payeezy_Selection_007.png
        :alt: Payeezy. adding a new API

    Now that you've created an API, API credentials should get available to you.

==============================
Getting API Key and API Secret
==============================

    To get API Key and API Secret, select your API and open the **Keys** tab:

    .. fancybox:: img/Payeezy_Selection_008.png
        :alt: Payeezy. Getting API Key and API Secret

=============
Getting Token
=============

    To get Token, click **Merchants** in the top right and you should see the generated Token:

    .. fancybox:: img/Payeezy_Selection_009.png
        :alt: Payeezy. Getting Token

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the Payeezy add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Payeezy_Selection_001.png
        :alt: Payeezy. Manage add-ons 

=====================
Setting up the add-on
=====================

    To set up the add-on, you'll want to select statuses for Processed and Failed orders:

    .. fancybox:: img/Payeezy_Selection_002.png
        :alt: Payeezy. Addon settings

    * **Processed order status**—The status that will be assigned to the order if the transaction has been successful.

    * **Failed order status**—The status that will be assigned to the order if the transaction has been failed.
    
=========================
Creating a payment method
=========================

    A payment method is created on the payment methods list page (Administration → Payment methods). 

    Please use this button 
    
    .. fancybox:: img/Payeezy_Selection_003.png
        :alt: plus button
        :width: 52px

    to create a new payment method.

    To use the Payeezy Gateway, it is necessary to select the appropriate value in the **Processor** field in the **General** tab.

    .. fancybox:: img/Payeezy_Selection_004.png
        :alt: Payeezy general settings

    In the **Configure** tab, the store administrator should enter the data of their Payeezy account: API Key, API Secret, and Token. To get these credentials, have a look at the `Getting API Key and API Secret`_ and `Getting Token`_ sections.

    .. fancybox:: img/Payeezy_Selection_005.png
        :alt: Payeezy general settings

--------------------------
What the customer will see
--------------------------

    Once you've set up the Payeezy Gateway in the store, it will get available to your customers.

    So the customer adds products to cart and proceeds to checkout. At the Billing Options step, they will see the Payeezy payment method available.

    To pay for the order via Payeezy, the customer should enter the credit card details:

    .. fancybox:: img/Payeezy_Selection_010.png
        :alt: Paying by credit card. Payeezy

    Once the payment is made successfully, the customer will see the following notification:

    .. fancybox:: img/Payeezy_Selection_011.png
        :alt: payment is made successfully

    In the backend, the admin will see new parameters on the order details page (Orders - View orders):

    .. fancybox:: img/Payeezy_Selection_012.png
        :alt: viewing orders

    These parameters are necessary to identify orders on the Payeezy end. 
