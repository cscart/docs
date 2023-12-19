*************
Follow Vendor
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000119" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Attract buyers in the exciting new way—let them follow their favorite vendors with our **Follow Vendor** add-on!

    It's a great way to keep your customers updated on the latest products added by the vendor. 

    .. fancybox:: img/FollowVendor-cover.png
        :alt: Follow Vendor add-on for CS-Cart store

    The **Follow Vendor** add-on creates a **Follow** button on the vendor products page:

    .. fancybox:: img/Follow_vendor1.png
        :alt: Vendor products page

==========================
What the customer will see
==========================

    Customers can see a list of the followed vendors in their account.

    .. fancybox:: img/Follow_vendor2.png
        :alt: Vendor products page

    The **Follow Vendor** add-on keeps your customers updated about vendor activity in the store. Whenever a new product is added, a product is back in stock, or a review is created, the customer will see updates in the vendor newsfeed. The news will be sorted chronologically and each post will contain a link to the appropriate product.

    .. fancybox:: img/vendor-news-main.png
        :alt: Vendor news

    If the customer does not want to see vendor news, the box next to the corresponding vendor should be unchecked.

    .. fancybox:: img/Follow_vendor_006.png
        :alt: Followed vendors

    Once the customer starts to follow the vendor, they will get email notifications each time a vendor posts a new event.

========================
What the vendor will see
========================

    The list of followers can be viewed on a Vendor detailed page on the Vendor or Admin Panel. 

    .. fancybox:: img/Follow_vendor_007.png
        :alt: Followers

    The list contains such data as name, email and date.

    .. fancybox:: img/Follow_vendor_008.png
        :alt: Followers

    After the vendor is followed, they will be notified about it via email.

=============
Compatibility
=============

    The add-on is compatible with Multi-Vendor 4.12 and above. 
    Minimum required PHP version is 5.6.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Follow Vendor add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://follow-vendor.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Follow Vendor add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings of the add-on:

    .. fancybox:: img/Follow_vendor3.png
        :alt: setting up the add-on

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. Log in to `HelpDesk <https://www.simtechdev.com/helpdesk>`_, and navigate to the **Licenses** section:

    .. fancybox:: img/licenses.png
        :alt: license key for add-on

    * **Display product image**—If enabled, the product image will be displayed in newsletters and subscription pages.

    .. fancybox:: img/vendor-news.png
        :alt: license key for add-on

    * **Filter products by usergroups**—If enabled, users will be notified only about products available via usergroups. It is recommended to deactivate this checkbox to increase site performance in case product availabability via usergroups is not used in your store.

    * **Show counts of subscribers**—Show the number of subscribers on the pages: All vendors, Followed vendors, Vendor Page, Vendor products.

    Appearance settings are also available in relevant tab:

    .. fancybox:: img/Follow_vendor4.png
        :alt: Appearance settings

    * **Button type**—Select the desireable type of button to be displayed on the storefront.

    * **Button color**—Select one of the 4 presented options to fit the button into the main aesthetics of the storefront

    .. table::

        +----------------+-----------------------------------+
        |   Title        |      Color                        |
        +================+===================================+
        |                | .. fancybox:: img/primary.png     |
        |Primary         |     :alt: Primary Color           |
        +----------------+-----------------------------------+
        |                | .. fancybox:: img/secondary.png   |
        |Secondary       |     :alt: Secondary Color         |
        +----------------+-----------------------------------+
        |                | .. fancybox:: img/tertiary.png    |
        |Tertiary        |     :alt: Tertiary Color          |
        +----------------+-----------------------------------+
        |                | .. fancybox:: img/transparent.png |
        |Transparent     |     :alt: Transparent             |
        +----------------+-----------------------------------+

    Cron can also be set on a relevant tab

    .. fancybox:: img/cronset.png
        :alt: Cron settings tab

    * **Cron password**—This key is used to verify the authenticity of the script sending emails.

    Use the following line to run the cron script according to a schedule:

    **php /path/to/cart/admin.php --dispatch=send_digest_by_email.send_digest --cron_password=MYPASS**

    where:

    **path/to/cart** is the path to your website.

    **MYPASS** is the access key to cron script that you can find under **Settings > Security settings**.

    .. note::

        If you have any difficulties with the cron setup, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

    * **Send newsletters on schedule**—If selected, letters containing vendor news will be sent out to customers according to a schedule. Otherwise customers will be notified of each event right away.
 
==========================
Managing vendor event list
==========================

    The admin can select what vendor events customers should see in the vendor news.

    To do that, navigate to **Vendors → Vendor event list**.

    .. fancybox:: img/Follow_vendor5.png
        :alt: Managing vendor event list
        :width: 250px

    Check the boxes of the desired events.

    .. fancybox:: img/Follow_vendor6.png
        :alt: Managing vendor event list

    Done! Enjoy functionality of the Follow Vendor add-on!