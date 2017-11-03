***************
Settings Wizard
***************

Settings wizard is a convenient post-installation tool. It allows you to set up some general preferences of your store in several steps.

.. hint::

    When :doc:`working with multiple stores in CS-Cart </user_guide/stores/index>`, use the **three people icon** to apply changes to all stores.

=================
Security Settings
=================

* **New administrator password**—we recommend changing the administrator password that you get after registration. Make sure your new password is secure enough.

  You can generate the password automatically with the **Generate** button.

* **SSL certificate**—click the **Check SSL** button to check the secure connection.

* **Enable secure connection for the storefront**—if you enable this setting, then the storefront (or some specific storefront pages) will work through the HTTPS protocol. This requires an SSL certificate to be installed on your server.

* **Enable secure connection in the administration panel**—if you enable this setting, the Administration panel will work through the HTTPS protocol. This requires an SSL certificate to be installed on your server.

* **Minimum administrator password length**—the minimum number of characters in an administrator password.

* **Administrator password must contain both letters and numbers**—if you enable this setting, the system will require an administrator password to contain both letters and numbers. This improves password strength and provides additional protection against guessing the password and brute-force attacks.

* **Force administrators to change password on the first login**—if you enable this setting, store administrators will have to change their passwords once they log in to the administration panel for the first time.

===================
Appearance Settings
===================

* **Default WYSIWYG editor**—the WYSIWYG editor to be used in the Administration panel.

  .. note::

      You can select *TinyMCE* or *Redactor*, or you can choose to disable WYSIWYG. Starting with version 4.6.3, you can also select *Redactor II*.

* **Default image previewer**—select one of the supported image previewers.

* **Primary currency**—select the primary currency of your store.

* **Backend default language**—the default language of the administration panel.

* **Frontend default language**—the default language of the storefront.

* **Estimate taxes using default address on cart/checkout pages**—if you enable this setting, customers without their own address in the database will see the taxes calculated for the default address.

* **Display prices with taxes on category/product pages if the method of calculating taxes is based on a unit's price**—if you enable this setting, product prices displayed on the product and category pages will include taxes.

* **Display prices with taxes on cart/checkout pages if the method of calculating taxes is based on a unit's price**—if you enable this setting, product prices displayed on the cart and checkout pages will include taxes.

* **Show number of available products**—if you enable this setting, the number of products available to customers will be displayed on the storefront.

* **Display mini thumbnail images as a gallery**—if you enable this setting, multiple product thumbnails will be displayed as a small gallery.

* **Use "Value changer" for the Quantity field**—if you enable this setting, the ordinary quantity field in the product list and on the product details page will be supplemented with a widget to increase/decrease the product quantity.

* **Display product details in tabs**—if you enable this setting, product details (description, features and so on) will be arranged in multiple tabs.

* **Date format**—choose the date display format both in the Administration panel and in the customer area.

* **Time format**—choose the time display format both in the Administration panel and in the customer area.

================
Company Settings
================

Use this section to specify your company details and contact information.

* **Company name**—the name of your store. The value that you enter here will be included in the copyright notes and invoices.

The following parameters are used to specify the geographical location of your business and your contact info. These details are also mentioned in invoices.

.. note::

    The :doc:`location of the company </user_guide/shipping_and_taxes/address>` is used by :doc:`realtime shipping methods </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index>` for rate calculation.

* **Company address**

* **Company city**

* **Company country**

* **Company state**

* **Company zip code**

* **Company phone**

* **Company phone 2**

* **Company fax**

* **Company website**

* **User department e-mail address**—the email address to receive notifications about newly created, modified, and deleted user profiles.

* **Site administrator e-mail address**—the email address to receive notifications about any technical issues.

* **Order department e-mail address**—the email address to receive notifications about placed orders and changed order statuses.

=============
User Settings
=============

* **Administrator must activate new user accounts**—if you enable this setting, newly created customer accounts will be inactive until the store administrator activates them manually.

* **Offer guest to create an account after successful order**—if you enable this setting, the buyer will be offered to register an account at guest checkout after the successfully placed order.

* **Quick registration**—require only contact information for registration.

* **Profile address section order**—choose which customer address should go first on the checkout page: billing address or shipping address.

* **Allow users to create multiple profiles for one account**—if you enable this setting, users will be allowed to specify multiple shipping and billing addresses for a single account. This may be useful when a user needs separate profiles for personal and business use.

* **Share users among stores**—if you enable this setting, the store will use a joint customer database where customer accounts are shared :doc:`among all storefronts </user_guide/stores/index>`. Otherwise, each store will have a separate customer base.

  .. note::

      This setting appears only in CS-Cart.

====================
Most Popular Add-ons
====================
 
This section includes the list of the most popular add-ons according to user preferences. Tick the checkbox of the add-on to install it. You can choose as many add-ons as you want.

=============
Other Add-ons
=============

This section includes the list of all available add-ons, except for the most popular ones. Tick the checkbox of the add-on to install it. You can choose as many add-ons as you want.

.. note::

    Find more information about add-ons in the **Add-ons →  Manage add-ons** section.
