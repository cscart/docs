******************************
Address Autocomplete by Google
******************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000102" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **The Address Autocomplete by Google add-on** adds an autocomplete text field to help your customers quickly fill in the shipping and billing address at checkout. 

    As the user enters text, autocomplete returns place predictions in the form of a dropdown pick list. When the user selects a place from the pick list, autocomplete will fill in the rest:

    .. fancybox:: img/Address_autocomplete.gif
        :alt: CS-Cart Address Autocomplete by Google add-on

    If you run a multi-vendor store, a useful feature for your vendors will be address autocomplete in the vendor registration form.

    .. fancybox:: img/Address_autocomplete_Selection_005.png
        :alt: vendor registration form

========
Features
========

    - Simplify the checkout process by offering address autocomplete.

    - Add a Quick address search field based on Google Places API to your checkout page.

    - Allow your customers automatically fill in the address form fields.

    - Avoid customers’ typing errors.

    - Improve the website usability and enhance user experience.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Address Autocomplete by Google add-on in our |demo_store|.

    .. |demo_store| raw:: html

       <!--noindex--><a href="http://google-autocomplete-address.demo.simtechdev.com" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

    .. note::
    
        Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Address Autocomplete by Google add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Address_autocomplete_Selection_001.png
        :alt: CS-Cart Address Autocomplete by Google add-on

=====================
Setting up the add-on
=====================

    Here are available settings of the Address Autocomplete by Google add-on.

    .. fancybox:: img/Address_autocomplete_Selection_002.png 
        :alt: Address Autocomplete by Google add-on

    * **Google API key**—Key to the Google Maps API. To get this key, visit the `Google Developers Documentation <https://developers.google.com/maps/documentation/javascript/get-api-key>`_.

    .. fancybox:: img/Address_autocomplete_Selection_004.png
        :alt: Google API key

    * **Show a bar for quick location search**—Adds a field for quick location search above the address field.

    .. fancybox:: img/Address_autocomplete_Selection_003.png
        :alt: quick location search

    * **Enable auto determination of user location**—In case the user’s location is detected automatically, Google will suggest the address nearest to the user’s location.

    * **Enable autocomplete in the admin panel**—When active, address autocomplete will be available in the "Customer information" pop-up on the Order page in the admin panel.

    * **Enable auto determination of user location in the admin panel**—In case the user’s location is detected automatically, Google will suggest the address nearest to the administrator’s location.

    * **House number in billing address**—Select the field that will be used to autocomplete the house number in the shipping address.

    * **House number in shipping address**—Select the field that will be used to autocomplete the house number in the shipping address.

    .. note:: 

       The last two settings will appear after you add a house number field. Refer to `Adding a profile field for a house number`_.

=========================================
Adding a profile field for a house number
=========================================

    By default, there's no separate field for a house number in the profile fields. You can add it in the following way:

    1. Go to **Administration > Profile fields.**

    2. Click the + button to add a new field.

    .. fancybox:: img/Address_autocomplete_Selection_006.png
        :alt: adding a profile field

    3. Add **Description** and **Field name**, select **Input field** for **Type** and **Billing address/Shipping address** for **Section**.

    .. fancybox:: img/Address_autocomplete_Selection_007.png
        :alt: adding a profile field

    4. Click **Create**.

    The created field will be available at checkout/profile. The house number will be autocompleted.

    .. fancybox:: img/Address_autocomplete_Selection_008.png
        :alt: house number in shipping address

---
FAQ
---

======================================================================================================================
The incorrect state is displayed on the checkout in the State field after auto-completing the address. What can I do?
======================================================================================================================

Try to correct states on **Administration - Shipping&Taxes - States**.

    .. fancybox:: img/Address_autocomplete_Selection_009.png
        :alt: correcting states
        :width: 550 px