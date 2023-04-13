********************************
Marketings Notice
********************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/marketing-web-push-notifications.html" class="btn buy-now__btn">Buy now</a>
    </div>
  
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **The Marketings Notice add-on** allows you to send notifications via the Google Firebase service, to devices that support Web Push technology. Web Push Notifications is an important marketing communication and sales channel. Push notifications are much more effective than newsletters and advertising in search and social networks.

    As of April 2019, sending Web Push notifications is free.

    Web push notifications have several advantages over other content delivery channels to customers:

    - The notifications spring up at the customers' desktop. Independently of any interfaces.

    - The notification redirects the buyer directly to the store page without distracting actions.

    - Subscribing to notifications requires only 1 click.

    .. fancybox:: img/marketing_web_push_notification_main.gif
        :alt: Marketings Notice add-on

    How web push notifications are shown on mobile devices:

    .. fancybox:: img/marketing_web_push_notification_mobile.jfif
        :alt: Marketings Notice add-on
        :width: 350px

========
Features
========

    - It's multilingual - notifications support content for all languages ​​of the store, and tokens have a language identifier.

    - It supports multiple storefronts - different storefronts have separate sets of notifications, tokens, and automatic distribution settings.

    - Automatic permission requests to deliver notifications when the add-on is turned on and the settings are filled.

    - Sending Web Push Notifications.

    - Automatic distribution of new Web Push notifications (Cron must be configured).

    - Automatic distribution of Web Push notifications for abandoned carts (you need to configure the Cron).

    - Automatic distribution of Web Push notifications for new users (you need to configure the Cron).

    - Automatic shutdown of tokens for which there is no possibility to deliver a notification (you need to configure the Cron).

    - Statistics for the latest campaign.

    - Statistics on the number of leads.

    - Ability to send notifications by vendors whose pages have been visited.

    - Browsers that support Web Push API: Chrome 42+, Firefox 44+.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

-----------------------------
Getting started with Firebase
-----------------------------

================
Creating account
================

    To create an account follow the link https://console.firebase.google.com/ and click **Add project**.

    .. fancybox:: img/marketing_web_push_notification_creating_firebase_account.jpg
        :alt: Marketings Notice add-on
        :width: 651px

=================================================
Getting Server key and Messaging sender ID
=================================================

    After you have created a project (or if there is an existing one), go to the project settings: **Project overview > Project settings > Cloud messaging**.

    .. fancybox:: img/marketing_web_push_notification_project_settings.jpg
        :alt: Marketings Notice add-on

    On this tab, we need *Server Key* and *Messaging sender ID*, which will be needed later when configuring the add-on. 

    .. fancybox:: img/marketing_web_push_notification_project_data.png   
        :alt: Marketings Notice add-on
    
---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Marketings Notice add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.
    
=====================
Setting up the add-on
=====================

    Here are available settings of the Marketings Notice add-on.

    .. fancybox:: img/marketing_web_push_notification_settings.jpg
        :alt: Marketings Notice add-on

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. 

    * **Server Key**—Enter you Server Key (See the details in `Getting Server key and Messaging sender ID`_).

    * **Messaging sender ID**—Enter your Messaging sender ID (See the details in `Getting Server key and Messaging sender ID`_).

    .. note::

        Until you don’t enter Server key and Messaging sender ID customers will not be offered to subscribe to Push notifications.

======================
Creating notifications
======================

    After the basic settings have been completed, you can start creating notifications.

    1. To create a notification go to to **Marketing > Web Push Notifications > Notifications** and click + in the top right corner.

    .. fancybox:: img/marketing_web_push_notification_creating_notification.jpg
        :alt: Marketings Notice add-on

    A window will be opened to add a new notification.    

    2. Fill in the following fields:

    .. fancybox:: img/marketing_web_push_notification_creating_notification2.jpg
        :alt: Marketings Notice add-on

    * **Title notifications** — 30 characters limit, message header (shown depending on the platform and browser version).

    * **Text notifications** — 120 characters limit, message body.

    * **Url** — A link to the landing page on which the customer will get after clicking on the notification.

    * **Image** — Notification image.

    * **Store/Vendor** — Storefront/Vendor to which the notification is attached. For Ultimate: messages will be shown in the choosen store. For Multi-Vendor: if you select a separate vendor, messages will be sent to those customers who visited the vendor page after agreeing to deliver notifications, if you do not select a vendor, then all active tokens will be sent.

    * **Status** — Notification status, there are 5 types:

        **New** — A new notification will be sent by the cron task when the corresponding setting is turned on, after sending it will switch to the Executed status.

        **Service** — The Service notification is available for selection in the add-on settings. It is used for sending out abandoned carts and sending to new users when the corresponding settings are enabled.

        **Deferred** — Deferred notifications are used to create messages that do not yet need to be sent. In the future, for distribution, you'll have to transfer them to the status New.

        **Executed** — The notifications with the New status get into this Executed status after the automatic distribution.

        **Reusable** — Notifications for repeated use, these notifications will be sent every time you start the cron (it is recommended to use it with extreme caution as if the cron is incorrectly configured then customers will take it for spam).

    * **Only registered users** — Mailing will be carried out only to tokens that are associated with registered users (in order for the token to link to an existing account, you must at least once authorize after you allow the delivery of notifications).

    3. After filling in the fields, click **Create**. 

    .. note::
        Since the add-on supports multilingualism, then at the time of creating the notification, versions are created for all the store languages, filling identically to the main notification. If you need to edit notifications for different languages, then switch to the desired language and make necessary changes. Fields supporting multilingualism:  Title notifications, Text notifications, Url, Image.

        .. fancybox:: img/marketing_web_push_notification_multilingualism.jpg
            :alt: Marketings Notice add-on

======================
Managing notifications
======================

    Notifications are managed in **Marketing > Web Push Notifications > Notifications**.

    .. fancybox:: img/marketing_web_push_notification_managing_notification.jpg
        :alt: Marketings Notice add-on

    There are 3 main blocks on this page:

    1. Notifications list

    This block displays the list of campaigns with the possibility of editing, forcing, deleting and changing the status.

    .. fancybox:: img/marketing_web_push_notification_list.jpg
        :alt: Marketings Notice add-on

    It also displays statistics on the latest campaign and the total number of transitions for all the time for notifications from this mailing (for the notifications sent out once, the statistics are displayed in the context of a campaign, while for Service campaign, the statistics are displayed in the context of periodic mailings and the total number of transitions will grow without dropping).

    .. fancybox:: img/marketing_web_push_notification_list2.jpg
        :alt: Marketings Notice add-on
    
    2. Multi-select control buttons and adding new notification

    If you select multiple notifications, you can force to send and delete them.

    .. fancybox:: img/marketing_web_push_notification_control_block.jpg
        :alt: Marketings Notice add-on

    3. Search block

    The search for notifications is implemented by 3 fields: Title, Text and Status.

    .. fancybox:: img/marketing_web_push_notification_search.jpg
        :alt: Marketings Notice add-on
        :width: 225px

===============
Managing tokens
===============

    Tokens are managed in **Marketing > Web Push Notifications > Tokens**. On this page there are 3 main blocks.

    .. fancybox:: img/marketing_web_push_notification_managing_tokens.jpg
        :alt: Marketings Notice add-on

    1. Tokens list

    This block displays a list of tokens with the possibility of their activation, deactivation and deletion.

    .. fancybox:: img/marketing_web_push_notification_token_list.jpg
        :alt: Marketings Notice add-on

    Each token has a field *Failed amount* which shows how many notifications failed to get delivered. It's used to automatically disable the token when the corresponding setting is enabled.

    .. fancybox:: img/marketing_web_push_notification_managing_failed_amount.jpg
        :alt: Marketings Notice add-on

    2. Multi-select control buttons

    When selecting multiple tokens, their activation, deactivation and deletion is available.

    .. fancybox:: img/marketing_web_push_notification_tokens_control_block.jpg
        :alt: Marketings Notice add-on

    3. Search block

    Search for tokens implemented by 2 fields User id and Status.

    .. fancybox:: img/marketing_web_push_notification_tokens_search.jpg
        :alt: Marketings Notice add-on
        :width: 239px

    See common steps for configuring **Marketings Notice add-on** in our video: https://youtu.be/JgNmlFtmfYA

===================================================
Managing the permission of vendors to make mailings
===================================================

    The functionality of the Marketings Notice add-on allows vendors to be able to send out notifications to customers who came to their page after being allowed to deliver notifications to them.

    Collection of tokens for vendors is carried out only when the setting is enabled. Enable web push notifications for vendors:

    .. fancybox:: img/marketing_web_push_notification_vendors.jpg
        :alt: Marketings Notice add-on

    After enabling this setting, the main administrator must configure the ability to send campaigns for certain vendors: **Vendors > Choose a Vendor > Web Push notifications > Allow Web Push notifications**.

    .. note::
        It is recommended to provide the ability to send notifications only to trusted vendors, since if the customer forbids receiving notifications (as spammy), then notifications will not be delivered from the entire marketplace.

    .. fancybox:: img/marketing_web_push_notification_vendors2.jpg
        :alt: Marketings Notice add-on

------------------------------
Setting up Crons on the server
------------------------------

    To automatically send notifications, you must configure the cron on the server. The command for the cron is in the add-on settings in the tab Cron:

    .. fancybox:: img/marketing_web_push_notification_cron.jpg
        :alt: Marketings Notice add-on

    In this command, you need to replace the password with the cron from the store settings: **Settings > Security settings > Access key to cron script**.

    .. fancybox:: img/marketing_web_push_notification_managing_cron_password.jpg
        :alt: Marketings Notice add-on

.. note:: The recommended cron frequency is once per day.

==============================================
Configuring Cron Mailing for New Notifications
==============================================

    After setting the cron, if you want the new notifications to be sent out automatically, without forced sending, you need to enable the setting **New notification sent** in the Cron tab.

    .. fancybox:: img/marketing_web_push_notification_new_notifications.jpg
        :alt: Marketings Notice add-on

    When this setting is enabled, new notifications that the administrator will create will be automatically sent the next time the cron is executed.
 
============================================
Configuring Cron Mailing for New Subscribers
============================================

    If you want to send notifications to new subscribers, you need to enable the setting **Use notification for new subscribers** in Cron tab and choose the message which will be sent. In order for the notification to appear in the list, you need to create a new notification with the status Service (see `Creating notifications`_).

    .. fancybox:: img/marketing_web_push_notification_managing_new_subscribers.jpg
        :alt: Marketings Notice add-on

    Subscribers are considered as new if their tokens, after allowing the delivery of notifications were not sent a notification for new subscribers.

============================================
Configuring Cron Mailing for Abandoned Carts
============================================

    If you want to launch a campaign for abandoned carts, you need to enable the setting **Use notification for abandoned carts** in Cron tab and choose the message which will be sent. In order for the notification to appear in the list, you need to create a new notification with the status Service (see `Creating notifications`_).

    .. fancybox:: img/marketing_web_push_notification_managing_abandoned_carts.jpg
        :alt: Marketings Notice add-on

    The cron collects abandoned carts for the latest 24 hours.

==========================================================
Configuring Cron Mailing for automatic Bad Tokens Shutdown
==========================================================

    It is recommended to enable the setting **Use bad tokens shutdown**, as disabling tokens for which it is impossible to deliver a notification will reduce the load on the server at the time of sending notifications.

    After enabling this setting, you will need to configure the number of unsuccessful deliveries, after which the token will be disabled (default 20).

    .. fancybox:: img/marketing_web_push_notification_managing_bad_tokens.jpg
        :alt: Marketings Notice add-on
