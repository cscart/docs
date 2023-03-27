*********************
Vendor Schedule
*********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000103" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Make sure your customers know when you are open with our **Vendor Schedule** add-on. 

    It allows vendors to show whether their store is currently open or closed. If it's closed, all products will be hidden from the storefront and search results and a note will be displayed below the company logo.

    .. fancybox:: img/Vendor_business_hours_004.png
        :alt: Vendor Schedule add-on. Store is closed

    Vendors can set their days off using a nice calendar in the vendor panel.

    .. fancybox:: img/Vendor_business_hours_007.png
        :alt: Vendor Schedule add-on. managing a calendar

    They can also set opening time and closing time of their store.

    .. fancybox:: img/Vendor_business_hours_008.png
        :alt: Vendor Schedule add-on. managing a calendar

    The admin gets a notification when a vendor goes on vacation and is back from vacation and the products become available on the storefront again.

    Simply install the add-on, make a few adjustments, and you’re all set!

=============
Compatibility
=============

    The add-on is compatible with Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Vendor Schedule add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://vendor-business-hours.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Vendor Schedule add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings of the Vendor Schedule add-on.

    .. fancybox:: img/Vendor_business_hours_001.png
        :alt: Vendor Schedule add-on

    * **Number of previous months**—Specify the number of previous months to display in the calendar.

    * **Number of following months**—Specify the number of following months to display in the calendar.

    .. fancybox:: img/Vendor_business_hours_003.png
        :alt: calendar of the Vendor Schedule add-on

    * **Notify admin**—If selected, an email notification will be sent to the admin when a vendor is leaving for vacation.

    .. note::

        It's required to set up a cron script to automatically send email notifications.

    * **Key to the CRON system**—This key is used to verify the authenticity of the script that sends email notifications. Use the link specified in the settings to send email notifications via the CRON system.

=====================
Managing the calendar
=====================

    The Vendor Schedule add-on allows the admin and vendors to select vacation days on the calendar during which all vendor's products will be hidden from the storefront and search results and a corresponding note will be displayed below the store logo:

    .. fancybox:: img/Vendor_business_hours_004.png
        :alt: Vendor Schedule add-on. Store is closed

    To do this, in the vendor panel the vendor should navigate to **Vendors - Vendors**.

    There will be a new column added to see which of the vendors are currently on vacation. 

    .. fancybox:: img/Vendor_business_hours_005.png
        :alt: Vendor Schedule add-on. Store is closed

    Click on the vendor name and open the **Business hours** tab.

    The vendor can select the dates when their storefront will be unavailable.

    .. fancybox:: img/Vendor_business_hours_006.png
        :alt: managing calendar

    By selecting **Unlimited vacation** option, products on the vendor's storefront will get unavailable for an unlimited period of time. The admin will be notified of this immediately.

    The vendor can also set opening hours for their store by using the **The store opens at** and **The store closes at** settings.

    .. note::

        The time and dates are set in accordance with the vendor's time zone.