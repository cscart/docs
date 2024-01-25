****************
Purchase Link
****************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000082" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The `Purchase Link add-on <https://www.simtechdev.com/addons/customer-experience/quick-purchase-link.html>`_ generates a link to quickly purchase any product in your store.

    .. fancybox:: img/Buy_product_link_08.png
        :alt: CS-Cart Purchase Link add-on

    You can send the link to the customer in a social network, or your customers can send the link to their friends or share it on Facebook, Twitter, etc. 

    .. fancybox:: img/Buy_product_link_010.png
        :alt: Purchase Link on Facebook
        :width: 500px

    Clicking on the link will take your customers either to the cart or checkout page to place the order right away.

    .. fancybox:: img/Buy_product_link_06.png
        :alt: Purchase Link leading to checkout

    To learn how to use the new functionality, follow quick and easy steps below.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported.
    Minimum required PHP version is 5.6.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Purchase Link add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://buylink.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Purchase Link” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings of the "Purchase Link" add-on:

    .. fancybox:: img/Buy_product_link_018.png
        :alt: Purchase Link add-on settings

    * **Use a SEO link**—Allows the admin to make the Purchase Link SEO-friendly.

    If the setting is enabled, the link will look like this:

    ``your_site.com/buy_product/[product_id]``

    If the setting is disabled, the link will look like this:

    ``your_site.com/index.php?dispatch=buy_link.add_product&product_id=[product_id]``

    * **SEO parameter**—Specify the parameter in the SEO link. The value should be without spaces. For example, the link looks like ``your_site.com/buy_product/[product_id]``, where ``buy_product`` is defined in this setting. The 'Use a SEO link' setting should be enabled.

    * **Redirect link**—Choose whether the user should be redirected to the cart page or checkout page once they click on the Purchase Link.
    * **Show button Buy now with 1-click**—Tick to display the Buy Now with 1 Click button on the product details page. 

    .. fancybox:: img/Buy_product_link_12.png
        :alt: Buy now button

    It will lead to a quick purchase of the product.

    .. fancybox:: img/Buy_product_link_02.png
        :alt: Buy now button

=====================================
Additional settings for version 4.2.4
=====================================

    If the version of your store is 4.2.x, you need to do some adjustments to make the add-on work correctly:

    1. In your admin panel, go to **Website -> SEO -> SEO rules**.

    2. Click the **+** button on the right to add a new SEO rule.

    3. Enter *buyproduct* to the **SEO name** field and *buy_link.add_product* to **Dispatch value**.

    .. fancybox:: img/Buy_product_link_011.png
        :alt: SEO rules

    4. Click **Create**.

    In this version, the link will look like this: /buyproduct/?product_id=12

=======================
Link for quick purchase
=======================

    The “Purchase Link” add-on generates a link to quickly purchase any product in your store. To get the link:

    1. Go to **Products - Products** in the admin panel.

    .. fancybox:: img/Buy_product_link_03.png
        :alt: Products section
        :width: 250px

    2. Open the details page of the necessary product. Use a quick search on the left if needed.

    .. fancybox:: img/Buy_product_link_04.png
        :alt: Product details page

    3. Go to the **Add-ons** tab and you should see the link for quick purchase right on this page.

    .. fancybox:: img/Buy_product_link_05.png
        :alt: link for quick purchase

    That's it! Now you are ready to send the link to a customer on Facebook or other social network.

    Clicking on this link takes the customer either to the cart page or checkout depending on the add-on settings (see "Setting up the add-on" section).

    1. Redirect to the cart page:

    .. fancybox:: img/Buy_product_link_06.png
        :alt: Redirect to the cart page

    2. Redirect to the checkout page:

    .. fancybox:: img/Buy_product_link_07.png
        :alt: Redirect to the checkout page