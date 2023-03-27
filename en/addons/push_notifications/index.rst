******************
Push Notifications
******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000143" class="btn buy-now__btn">Buy now</a>
    </div>
 
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The `Push Notifications <https://www.simtechdev.com/addons/site-management/push-notifications.html>`_ add-on integrates the `Pusher <https://pusher.com/>`_ service with your CS-Cart store, enabling you to alert administrators about valuable information in real time, such as a new order placement or a new review submitted.
    
    A push notification will pop up in the top right corner and stay there until the administrator closes it or goes to another page in the admin panel.

    .. fancybox:: img/Push_notifications_009.png
        :alt: Two-factor authentication add-on

    Another useful feature of the add-on is that it shows you which of your administrators are currently viewing this or that page in the admin panel.

    .. fancybox:: img/Push_notifications_015.png
        :alt: Two-factor authentication add-on

    Clicking on the particular administrator will open its detailed page.

    .. fancybox:: img/Push_notifications_016.png
        :alt: Two-factor authentication add-on

    Thus, you will see the number of administrators on the following pages:

    - product editing page

    - order details page

    - user details page

    - category editing page

============
How it works
============

    **Case 1. New order notification.**

    Customer Karl places an order in your store.

    .. fancybox:: img/Push_notifications_008.png
        :alt: Two-factor authentication add-on

    The administrator gets a push notification of the newly placed order right away:

    .. fancybox:: img/Push_notifications_009.png
        :alt: Two-factor authentication add-on

    Clicking on the link in the notification opens the order details page:

    .. fancybox:: img/Push_notifications_010.png
        :alt: Two-factor authentication add-on

    **Case 2. New review notification.**

    Customer Jude leaves a new review for the product in your store.

    .. fancybox:: img/Push_notifications_011.png
        :alt: Two-factor authentication add-on
        :width: 545px

    The administrator sees a push notification of the newly submitted review right away:

    .. fancybox:: img/Push_notifications_012.png
        :alt: Two-factor authentication add-on

    Clicking on the link in the notification opens the review on the Comments and reviews page:

    .. fancybox:: img/Push_notifications_013.png
        :alt: Two-factor authentication add-on

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Getting started with Pusher
---------------------------

=======================
Creating an application
=======================

    1. Sign up for a `Pusher account <https://pusher.com/>`_.

    2. Go to the `Dashboard <https://dashboard.pusher.com/>`_ and click **Create new app**.

    .. fancybox:: img/Push_notifications_003.png
        :alt: Two-factor authentication add-on

    3. Make the necessary settings and click **Create my app**.

    .. fancybox:: img/Push_notifications_005.png
        :alt: Two-factor authentication add-on
        :width: 733px

===================================================================================
Getting application ID, application key, application secret and application cluster
===================================================================================

   To set up the add-on in the admin panel, you'll need to get some account details.

    .. fancybox:: img/Push_notifications_002.png
        :alt: settings of the Two-factor authentication add-on

   Open the app you've created from the **Your apps** section on the left and locate the **Keys** section on the page. You will see your **application ID, application key**, and **application secret**.

    .. fancybox:: img/Push_notifications_006.png
        :alt: Two-factor authentication add-on

    As for the **application cluster**, you can see it right next to the app name.

    .. fancybox:: img/Push_notifications_007.png
        :alt: Two-factor authentication add-on

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Push Notifications” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Push_notifications_001.png
        :alt: Two-factor authentication add-on

=====================
Setting up the add-on
=====================

    In the settings of the “Push Notifications” add-on, enter the details of your Pusher account (see the `Getting application ID, application key, application secret and application cluster`_ section):

    .. fancybox:: img/Push_notifications_002.png
        :alt: settings of the Two-factor authentication add-on

    * **Enable new order notification**—Select the checkbox if you want to get notifications when a new order is placed in the store.

    * **Enable new review notification**—Select the checkbox if you want to get notifications when a new review is left in the store.
