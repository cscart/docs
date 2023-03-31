*************
Delivery Date
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000161" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    The `Delivery Date <https://www.simtechdev.com/addons/customer-experience/delivery-date.html>`_ add-on creates a nice date picker at the Shipping options step at checkout to let customers select a date and time when they’d like to receive the order. Customers can also leave a message if they want.

    .. fancybox:: img/Delivery-date-017.png
        :alt: delivery date picker

    Once the order is placed, the customer will see the selected delivery date and time in the order details.

    .. fancybox:: img/Delivery-date-018.png
        :alt: order details

    You can see delivery dates on the orders list page so you can very quickly see when orders are due to be fulfilled.

    .. fancybox:: img/Delivery-date-012.png
        :alt: orders list page

    You can edit the selected delivery date via the admin panel on the order details page, if needed.

    .. fancybox:: img/Delivery-date-014.png
        :alt: order editing page

    Orders can also be exported/imported with the delivery date field in the CSV format to share with shipping services.

    .. fancybox:: img/Delivery-date-015.png
        :alt: orders list page

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? |Contact us now.|
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Delivery Date add-on in our |demo_store|.

    .. |demo_store| raw:: html

       <!--noindex--><a href="http://delivery-date.demo.simtechdev.com" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

    .. note::
    
        Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Delivery Date add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

++++++++++++++
CS-Cart stores
++++++++++++++

    Click on the add-on name in the list of add-ons to open its settings.

    .. note::

        In CS-Cart Ultimate, you can set individual settings for each store. Simply select the store at the top and open the add-on settings.

    .. fancybox:: img/DD6_2.png
        :alt: settings of the Delivery Date add-on

    * **Manage delivery date**—Allows to define delivery date and time and show a comment at checkout. If disabled, this information will be hidden from the storefront.

    * **Required delivery date**—If enabled, the *Delivery date* field will be required at checkout.

    * **Unavailable days**—Select days when delivery is not available. For example, if you select *Saturday* and *Sunday*, these days will be unavailable to choose on the calendar at checkout.

    .. fancybox:: img/Delivery-date-003.png
        :alt: Unavailable days
        :width: 400px

    * **Delivery available in**—Set minimum required days (starting from today) before delivery gets available. For example, if you select *3 days*, the delivery will be available on the third day starting from today.

    .. fancybox:: img/Delivery-date-004.png
        :alt: Unavailable days
        :width: 400px

    * **Use delivery time period**—If enabled, customers will be able to select delivery time at checkout.

    .. fancybox:: img/Delivery-date-005.png
        :alt: Unavailable days
        :width: 400px

    * **Delivery time**—Define the available delivery time period that customers can select at checkout.

    * **Delivery time format**—Decide whether you want to use 12-hour clock or 24-hour clock for delivery time format. In the former case, select 3:00 PM, in the latter case, 15:00.

    * **Maximum message length**—Define the allowed number of symbols for the message. If left empty or equals 0, no restrictions on the number of symbols will be applied.

    * **Show delivery note**—Show the delivery note at the "Shipping Options" step at checkout. You can change the text of the note using the "addons.sd_delivery_date.delivery_date_notice" language variable (Administration > Languages > Translations).

    .. fancybox:: img/Delivery-date-019.png
        :alt: delivery note
        :width: 400px

+++++++++++++++++++
Multi-Vendor stores
+++++++++++++++++++

    For multi-vendor stores, the settings can be found under **Vendors > Delivery date settings** (the setting is unavailable for vendors).

    .. fancybox:: img/DDMV1.png
        :alt: Delivery date settings

    Under the **All vendors** mode, you will see only the global settings:

    .. fancybox:: img/DDMV2.png
        :alt: Delivery date settings

    To see the rest of the settings, open the add-on settings on Vendor settings tab

    .. fancybox:: img/DDMV3.png
        :alt: pick a vendor

    Vendors can also manage delivery date and time:

    .. fancybox:: img/DDMV4.png
        :alt: managing delivery date and time

=====================================================
How to allow vendors to manage delivery date settings
=====================================================

    1. Go to **Customers > User groups**.

    2. Create a user group or select an existing one.  

    3. Click the Gear icon and open Edit tab

    4. Scroll down to the **Vendor Privileges** and select one of the *Delivery Date* options 

    .. fancybox:: img/DDMV5.png
        :alt: user groups

    4. Click **Save**.

    5. Assign this user group to necessary vendors.

    .. fancybox:: img/DDMV6.png
        :alt: user group

===============
Managing orders
===============

    On the orders list page you will see a new column with delivery dates defined for each order:

    .. fancybox:: img/Delivery-date-012.png
        :alt: orders list page

    You can search for products with a specific delivery date using Advanced search:

    .. fancybox:: img/Delivery-date-013.png
        :alt: advanced search by delivery date

    On the editing order page in the **Delivery date** tab, you can edit delivery date or time or add/edit a note.

    .. fancybox:: img/Delivery-date-014.png
        :alt: delivery date tab

    Invoices will also include delivery date and time:

    .. fancybox:: img/Delivery-date-016.png
        :alt: delivery date and time on invoice

========================
Importing/Exporting data
========================

    The add-on adds new fields to available fields of order export/import.

    .. fancybox:: img/Delivery-date-015.png
        :alt: delivery date tab

=================================
How to add variables to documents
=================================

    To add these fields, you need to select the desired document in the Administration → Notifications → Documents 
    menu and insert the variables {{o.delivery_date}}, {{o.delivery_time}} and {{o.delivery_message}} in the document 
    in the required place (variables can be selected in the **order or o** drop-down list to the left of the document template).

    .. fancybox:: img/Delivery-date-020.png
        :alt: editing document