********************
Social Proof
********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000171" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    The **Social Proof** add-on is a useful tool for your online store that will help you boost conversions and drive sales.

    You can display customer activity in real-time. Show proof that your store is a popular venue for shoppers by displaying:

    - Number of times this product was bought

    - Number of people looking at this product

    - Number of products left

    - Custom message

    - Recent sales

    .. fancybox:: img/social-proof-product-page-new.png
        :alt: Social Proof product page

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

==========
Demo store
==========

    Check out the Social Proof add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://sales-and-social-proof.demo.simtechdev.com" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Social Proof add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/social-proof-add-on-install.png
        :alt: Social Proof add-on

==================
Available settings
==================

    Here are available settings of the Social Proof add-on.

    .. tip::

        If your store runs on CS-Cart Ultimate, you can configure the add-on settings for each storefront individually.

+++++++
General
+++++++

    .. fancybox:: img/sales-and-social-proof-general-settings.png
        :alt: Social Proof add-on

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. Log in to `HelpDesk <https://www.simtechdev.com/helpdesk>`_, and navigate to the **Licenses** section:

    .. fancybox:: img/licenses.png
        :alt: Social Proof add-on

    * **Show real-time stats**—If enabled, real-time messages showing the number of times a product was bought, number of people watching a product, quantity of a product left in stock, and a custom message on a product page.

    .. fancybox:: img/social-proof-real-time-stats-new.png
        :alt: Social Proof real-time stats

    * **Show pop-ups**—If enabled, a message showing a recently bought product will pop up on a product page. The message will contain the link to the product.

    .. fancybox:: img/social-proof-popup-new.png
        :alt: Social Proof pop-ups

+++++++++++++++
Real-time stats
+++++++++++++++

    Real-time messages show the number of times a product was bought, number of people watching a product, quantity of a product left in stock, and a custom message on a product page.

    .. fancybox:: img/social-proof-product-page-11.png
        :alt: Social Proof product page

    Here are the settings:

    **Number of times this product was bought**

    .. image:: img/social-proof-products-purchased.png
        :alt: Social Proof add-on

    .. fancybox:: img/sales-and-social-proof-real-time-stats-1.png
        :alt: Social Proof add-on

    * **Active**—Enables the *Purchased X times in the last 24 hours* message on the product page. The number of purchases will be counted for the last 24 hours.
    
    * **Use fake data**—If enabled, the system will use untrue data created by cron to show numbers in real-time stats. The number of purchases will be a random value between the **Minimum purchase count with fake enabled** value and **Maximum purchase count with fake enabled** value.

    * **Count purchases**—Select the period of time within which the number of purchased products will be counted. Available values are: per day/per week/per month/for all time/

    * **Show on category page**—If enabled, the number of times the product was purchased will be shown on the category page.

    .. fancybox:: img/sales-and-social-proof-category-page-1.png
        :alt: Social Proof add-on

    * **Show if product is out of stock**—If enabled, the number of times the product was purchased will be shown even if the product is out of stock. Clear the checkbox if you do not want to show this information when the product is out of stock.

    * **Display probability**—Define how frequent the message should be displayed. Enter the value from 0 to 100 in percentage. The lower the number, the less likely the message is to be shown. Probability of 100 means that the message will be shown all the time. Probability of 50 means that the message is half as likely to be shown.

    * **Minimum purchase count with fake enabled**—If you use fake data generated by cron, enter the minimum possible number of purchased products to display. The system will randomly pick a number between this value and the value from the field below to show in the message. For example, if you enter *20* here and *25* in the field below, the number of purchased products will be a random number between 20 and 25.

    * **Maximum purchase count with fake enabled**—If you use fake data generated by cron, enter the maximum possible number of purchased products to display. The system will randomly pick a number between the value above and this value to show in the message. For example, if you enter *20* in the field above and *25* in this field, the number of purchased products will be a random number between 20 and 25.

    **Number of people watching this product**

    .. image:: img/social-proof-people-watching.png
        :alt: Social Proof add-on

    .. fancybox:: img/sales-and-social-proof-real-time-stats-2.png
        :alt: Social Proof add-on

    * **Active**—Enables the *X people are looking at this product right now* message on the product page. The number of people will be counted for the last 30 minutes including the current customer.

    * **Use fake data**—If enabled, the system will use untrue data created by cron to show numbers in real-time stats. The number of people will be a random value between the **Minimum online users with fake enabled** and **Maximum online users with fake enabled** values.

    * **Show number of people looking now**—Enables the X people are looking at this product right now message on the product page.
 
    .. image:: img/message-a.png

    * **Show number of views per period**—Enables the X people viewed this product per day message on the product page.

    .. image:: img/message-b.png

    * **Count views**—Define the time period within which the number of product views will be calculated.

    * **Display probability**—Define how frequent the message should be displayed. Enter the value from 0 to 100 in percentage. The lower the number, the less likely the message is to be shown. Probability of 100 means that the message will be shown all the time. Probability of 50 means that the message is half as likely to be shown.

    * **Minimum online users with fake enabled**—If you use fake data generated by cron, enter the minimum number of online users to display. The system will randomly pick a number between this value and the value from the field below to show in the message. For example, if you enter *10* here and *15* in the field below, the number of users looking at this product will be a random number between 10 and 15.

    * **Maximum online users with fake enabled**—If you use fake data generated by cron, enter the maximum number of online users to display. The system will randomly pick a number between the value from the field above and this value to show in the message. For example, if you enter *10* in the field above and *15* here, the number of users looking at this product will be a random number between 10 and 15.

    **Products left (if quantity is less than the value below)**

    .. image:: img/social-proof-products-left.png

    .. fancybox:: img/sales-and-social-proof-real-time-stats-3.png
        :alt: Social Proof add-on

    **Active**—Enables the *In high demand – only X products left!* message on the product page.

    * **Show on category page**—If enabled, the number of products left will be shown on the category page.

    .. fancybox:: img/show-on-category-page.png
        :alt: Social Proof add-on

    * **Use fake data**—If enabled, the system will use untrue data created by cron to show numbers in real-time stats.

    * **Quantity**—Define the in-stock quantity that will be displayed in the 'In high demand – only X products left!' message on the product page.

      If you enter 3 and product quantity equals 2 (lower than the value defined), the message will say 'In high demand – only 2 products left!'
      If you enter 3 and the product quantity is 4 (higher than the value defined), 2 options are possible:
    
        - the message will not be shown if real data is used;
        
        - the message will contain the random value of 1-3 if fake data is used.

    * **Display probability**—Define how frequent the message should be displayed. Enter the value from 0 to 100 in percentage. The lower the number, the less likely the message is to be shown. Probability of 100 means that the message will be shown all the time. Probability of 50 means that the message is half as likely to be shown.

    * **Display probability if fake data enabled**—Define how frequent the message containing fake data should be displayed. Enter the value from 0 to 100 in percentage like in the setting above. This value will be used in case the product in-stock quantity is higher than the Quantity value defined above.

    **Custom label**

    You can use custom labels for promotions or anything else your heart desires.

    .. image:: img/social-proof-custom-label.png

    .. fancybox:: img/sales-and-social-proof-real-time-stats-4.png
        :alt: Social Proof add-on

    * **Active**—Enables a custom message on the product page. 

    To add a custom message:

    1. Go to **Products > Products**.

    2. Choose the necessary product.

    3. Switch to the **Add-ons** tab.

    4. Enter the text into the **Custom string** text area.

    5. Click **Save**.

    To add a custom message to multiple products, follow `this guide <Adding a custom message to multiple products>`_.

++++++
Pop-up
++++++

    The pop-up shows the recently purchased product.

    .. image:: img/social-proof-popup-small.png

    Here are the settings:

    .. fancybox:: img/sales-and-social-proof-real-time-stats-5.png
        :alt: Social Proof add-on

    * **Use fake data**—If enabled, the system will use untrue data created by cron to show numbers in pop-ups.

    * **Show product picture**—Decide whether you want to show a product thumbnail in the pop-up. Check the box if you do, or leave it empty if you don't.

    * **Display time (seconds)**—Define how long the pop-up should stay on a page. Enter the number in seconds.

    * **Position**—Define where the pop-up should appear: bottom left, bottom, center, or bottom right.

++++
Cron
++++

    You can use a cron job to update the number of purchased products. Otherwise, you will need to update the number of purchased products manually using the **Number of times this product was bought** field in the **Add-ons** tab on the products editing page in the admin panel.

    .. note::
        Cron generates fake data only

    .. fancybox:: img/sales-and-social-proof-real-time-stats-6.png
        :alt: Social Proof add-on

    * **Active**—Enables cron.

    .. fancybox:: img/social-proof-number-of-purchased-products.png
        :alt: Social Proof cron settings

    * **Cron key**—Enter the password to the cron script.

    * **When to execute (times per day)**—Define how often the cron script will update the number of purchased products.

    **Command to run:**

    .. code::

        http://demostore.com/index.php?dispatch=social_proof_cron.update_purchase_qty&cron_key=XXXXXXXX

    where

    **http://demostore.com/** is the path to your website

    **XXXXXXXX** is the access key to the cron script that you can find in the field above.

    .. note::

        A cron script should be run on your server. If you have any difficulties with it, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

    If you run the cron script in the browser, you will see the following notifications:

    - when it's too early for the cron launch

    .. fancybox:: img/social-proof-cron-notification.png
        :alt: Social Proof cron settings

    - when the cron is launched

    .. fancybox:: img/social-proof-cron-notifications2.png
        :alt: Social Proof cron settings

    - when the cron key is not correct

    .. fancybox:: img/social-proof-cron-notifications3.png
        :alt: Social Proof cron settings

+++++++++++++++++++++
Product Page Settings
+++++++++++++++++++++

Additional add-on setting are available at the **Add-on** tab of the Product page on Admin Panel 

.. fancybox:: img/SSP.png
    :alt: Product Page add-on Settings

* **Custom String** - Allows to create a special message for a pop-up window.

* **Number of times this product was bought** - The number of purchases will be counted for the last 24 hours.

* **Display the product in the pop-up** - Display a recently purchased product in a pop-up window.

============================================
Adding a custom message to multiple products
============================================

    To add a custom message:

    1. Go to **Products > Products**.

    2. Choose the necessary products and click **Edit selected**.

    3. Click **Unselect all** and then select the **Custom string** box. Click **Modify selected**.

    .. fancybox:: img/social-proof-editing-products.png
        :alt: editing multiple products

    3. Click **Apply values to all the selected products**, select the **Custom string** box and input your text. Click **Apply**.

    .. fancybox:: img/social-proof-custom-string.png
        :alt: editing multiple products

    4. The value will be applied to all the selected products. Click **Save**.

    .. fancybox:: img/social-proof-click-save.png
        :alt: editing multiple products