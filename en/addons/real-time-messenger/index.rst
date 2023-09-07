*******************
Real-Time Chat
*******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000173" class="btn buy-now__btn">Buy now</a>
    </div>


.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    The **Real-Time Chat** add-on allows your customers to securely exchange messages with vendors in real time (no need to refresh the page). Customers can contact vendors by clicking **Contact vendor** on the product details page or by clicking **Contact vendor** on the vendor products page.

    .. fancybox:: img/real-time-messenger-overview.png
        :alt: Messenger add-on for CS-Cart

    It will definitely come in handy when customers want to clarify details about a product, know more about your promotions, ask questions about shipping or payment or anything else.

    .. fancybox:: img/rtm1.png
        :alt: Messenger add-on for CS-Cart

    Your customers will find it especially convenient to exchange messages from their mobile devices.

    .. fancybox:: img/rtm2.png
        :alt: Messenger add-on for CS-Cart
        :width: 329px

    The add-on introduces the **Forbidden words** feature. You can forbid certain text in outgoing messages. Such words will be replaced with \***. Forbidding certain words could help store owners control communication of vendors with customers, for example, you don't want vendors to give out their contact info to customers directly, so you may want to forbid words like 'email, 'phone number', etc.

    .. fancybox:: img/rtm3.png
        :alt: Messenger add-on for CS-Cart

    Messages containing forbidden words will be marked with exclamation icon in the list of messages in the admin panel.

    .. fancybox:: img/Messenger_035.png
        :alt: Messenger add-on for CS-Cart

    Stay helpful to your customers and increase sales with our **Real-Time Chat** add-on.

    .. important::

        The add-on configuration is provided on a paid basis. Please `contact us <sales@simtechdev.com>`_ for help.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

============
Requirements
============

    - SSL certificate and HTTPS enabled.

    - PHP extension ``zmq`` is required.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

--------------------------
What the customer will see
--------------------------

    The add-on allows customers to **contact a seller from the product details page** in case they have any questions or need any clarification about the product.

    .. fancybox:: img/real-time-messenger-product-page-edited.png
        :alt: Messenger add-on for CS-Cart

    Clicking the **Contact seller** button will take the customer to the Messages page to start a conversation. **Text messages are exchanged in real-time**.

    .. fancybox:: img/rtm6.png
        :alt: Messenger add-on for CS-Cart

    Anyway, the customer will be **notified of new messages by email**.

    .. fancybox:: img/Messenger_013.png
        :alt: Messenger add-on for CS-Cart
        :width: 600px

    The communication history can be viewed on the Messages page (My account > Messages). New messages are highlighted.

    .. fancybox:: img/real-time-messenger-new-message.png
        :alt: Messenger add-on for CS-Cart

    The customer can **contact the vendor from the vendor page** as well.

    .. fancybox:: img/real-time-messenger-vendor-store.png
        :alt: Messenger add-on for CS-Cart

    The **Contact vendor** button is also available on **the order details page**.

    .. fancybox:: img/real-time-messenger-order-details.png
        :alt: Messenger add-on for CS-Cart

------------------------
What the vendor will see
------------------------

    The vendor can manage messages by going to **Website > Messages**. Unread messages are a light blue.

    .. fancybox:: img/rtm10.png
        :alt: Messenger add-on for CS-Cart

    Clicking the Ticket ID will open the conversation.

    .. fancybox:: img/rtm11.png
        :alt: Messenger add-on for CS-Cart

    The vendor can also contact the customer from the order details page (Orders > View orders).

    .. fancybox:: img/rtm12.png
        :alt: Messenger add-on for CS-Cart

    .. note::

        Vendors are not notified of new messages, only **vendor's administrators**. See `Vendor's administrator notifications`_ for more details.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Real-Time Chat add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. note::

        When you install the add-on, the default Customer-to-Vendor Communication add-on will be disabled.

=====================
Setting up the add-on
=====================

    Here are available settings for the add-on:

    .. fancybox:: img/real-time-messenger-settings.png
        :alt: settings of Messenger add-on

    The first three settings, **Websocket Port, Pusher Port and Websocket URL**, are related to the implementation of a special WebSocket protocol on the server. These parameters are necessary to correctly exchange messages between the recipient and the sender.

    .. note::

        The Websocket protocol implementation requires developer skills. We will take it upon ourselves to configure it on your server. Please `contact us for help <http://www.simtechdev.com/helpdesk>`_.

    Decide where you want to show the **Contact vendor** button. The settings concern the storefront.

    * **Show the "Contact vendor" button on the order details page**

    .. fancybox:: img/real-time-messenger-order-details.png
        :alt: Contact vendor button on order details page

    * **Show the "Contact vendor" button on the product details page**

    .. fancybox:: img/real-time-messenger-product-page.png
        :alt: Contact vendor button on product details page

    * **Show the "Contact vendor" button on the company page**

    .. fancybox:: img/real-time-messenger-vendor-store.png
        :alt: Contact vendor button on company page

    * **"Contact vendor" button type**—Select the button type that will be displayed on the product details page. The options are:

    **1. Icon**

    .. image:: img/Messenger_icon.png

    **2. Icon and text**

    .. image:: img/Messenger_icon-and-text.png

    **3. Text**

    .. image:: img/Messenger_text.png

    * **Button color**—Select the color you would like to apply for the **Contact vendor** button on the product details page (primary, secondary, tertiary) or choose text.

    .. tip::

        You can check the colors in the Theme Editor.

        .. fancybox:: img/theme-editor.png
            :alt: Theme editor
            :width: 299px

    * **Message length**—The maximum number of characters in the message shown on the conversation history page before it will be truncated with ellipses(…).

    .. fancybox:: img/Messenger_003.png
        :alt: Message length

=================
Managing messages
=================

    All the messages exchanged between customers and vendors are available under **Website > Messages**. 

    The administrator can view any message, search for a particular message, or reply to any message, if needed.

    .. fancybox:: img/Messenger_007.png
        :alt: Messages

==================================================
Providing access to messages to admins and vendors
==================================================

    The root administrator can allow other administrators to manage messages by selecting the **Allow to manage messages** setting on the administrator's details page.

    .. fancybox:: img/Messenger_008.png
        :alt: allowing to manage messages

    The administrator can also restrict access to messages to vendors. To do so, go to **Vendors > Vendors**, select the necessary vendor, then switch to the **Add-ons** tab and set **Status** to **Disabled**.

    .. fancybox:: img/Messenger_030.png
        :alt: allowing to manage messages

    The ability to send and receive messages can be provided within a vendor plan. To enable it, go to **Vendors > Vendor plans**, select the necessary plan and select the **Messenger** box.

    .. fancybox:: img/Messenger_031.png
        :alt: allowing to manage messages

========================
Managing forbidden words
========================

    You can specify forbidden words by going to **Website > Messenger: Forbidden words**. Here, you can add new words or phrases, edit them or delete them.

    .. fancybox:: img/Messenger_032.png
        :alt: forbidden words in messenger
    
    The forbidden words will be replaced with “\***” (3 stars) in the messages on the storefront and in the admin panel.

    .. fancybox:: img/forbidden-word-customer.png
        :alt: forbidden words in messenger

    The same concerns messages in the admin panel. Such messages will also be highlighted red.

    .. fancybox:: img/forbidden-word-admin.png
        :alt: forbidden words in messenger

    In the list of messages, the exclamation mark icon will appear next to the message if it contains any of the forbidden words.

    .. fancybox:: img/Messenger_035.png
        :alt: forbidden words in messenger

===================================
Editing layout of the Messages page
===================================

    The add-on creates a **Messages page** for customers. It can be accessed by going to **My account > Messages** and selecting a particular thread.

    .. fancybox:: img/real-time-messenger-customer-conversation.png
        :alt: Messages page

    You can customize the layout of this page by going to **Design > Layouts**. Switch to the **Messages** tab.

    .. fancybox:: img/Messenger_010.png
        :alt: editing layout

    .. tip::

        **Set custom configuration** hides the header or the top panel.

        **USE DEFAULT BLOCK CONFIGURATION** shows the header or the top panel.

=====================================
Changing the message background color
=====================================

    The default colors of the message background may not match the theme in your store.

    .. fancybox:: img/Messenger_023.png
        :alt: message background color

    In this case you can change the background colors.

    .. note::

       The color scheme can be changed only on the storefront, not in the admin panel.

    Here's how:

    1. Go to **Design > Themes** and click **Theme editor** next to the theme you are using.

    .. fancybox:: img/Messenger_024.png
        :alt: message background color

    2. In the opened Theme editor, select **Custom CSS** and copy/paste the following part of code into the input field:

    .. fancybox:: img/Messenger_029.png
        :alt: message background color
        :width: 300px

    .. code::

        /* Author messages color */
        .author-message .ty-sd_messaging_system-all:before
        { background-color: #ea621f; }
        .author-message .ty-sd_messaging_system-all
        { background-color: #ea621f; }
        
        /* Recipient messages color */
        .ty-sd_messaging_system-all
        { background-color: #eceff1; }
        .recipient-message .ty-sd_messaging_system-all:before
        { background-color: #eceff1; }

    3. Next, change the hex codes of colors you want to use for background.

    .. fancybox:: img/Messenger_025.png
        :alt: message background color
        :width: 293px

    .. tip::

        **Hex color code** has the format of a hash (#) followed by 6 numbers or letters. For example, *#eceff1* or *#ea621f*. There are plenty of websites where you can pick suitable colors for your store, like `HTML Color Codes <http://htmlcolorcodes.com/>`_ or `Paletton <http://paletton.com/>`_.

    4. Click **Save**

    If you are changing the default theme, you will need to create a copy of the theme after you make the changes. So, right after you click **Save**, a pop-up will appear:

    .. fancybox:: img/Messenger_026.png
        :alt: message background color
        :width: 294px

    Enter a new name for the style and click **OK**. The copy of the theme will be created automatically.

    Make sure it is selected as your current theme.

    .. fancybox:: img/Messenger_027.png
        :alt: message background color

    Here's the result:

    .. fancybox:: img/Messenger_028.png
        :alt: message background color

=====================
Editing notifications
=====================

    Both customers and vendor's administrators are notified of new messages by email. You can easily edit the email template.

++++++++++++++++++++++
Customer notifications
++++++++++++++++++++++

    Customer notifications are sent to customers to inform them about a new message or new thread.

    Here's the default template.

    .. fancybox:: img/Messenger_013.png
        :alt: Customer notifications
        :width: 639px

    To edit the template:

    1. Go to **Design > Email templates**.

    2. In the **Customer notifications** tab, select the necessary template.

    .. fancybox:: img/Messenger_018.png
        :alt: Customer notifications

    3. Edit the template and click **Save**

    .. fancybox:: img/Messenger_020.png
        :alt: editing templates

++++++++++++++++++++++++++++++++++++
Vendor's administrator notifications
++++++++++++++++++++++++++++++++++++

    Administrator notifications are sent to vendor's administrators to inform them about a new message or a new thread.

    Here's the default template.

    .. fancybox:: img/Messenger_013.png
        :alt: Administrator notifications
        :width: 639px

    To edit the template:

    1. Go to **Design > Email templates**.

    2. In the **Administrator notifications** tab, select the necessary template.

    .. fancybox:: img/Messenger_019.png
        :alt: Administrator notifications

    3. Edit the template and click **Save**.

    .. fancybox:: img/Messenger_021.png
        :alt: editing template

--------------------
Server configuration
--------------------

Here are the steps for server configuring:

(1) Set up a secure connection HTTPS on your site. Click `here <https://docs.cs-cart.com/latest/install/security.html#step-4-configure-security-settings>`_ to learn how to do it.

(2) Install an additional php add-on ``php-zmq`` with dependent packages.

(3) Install and configure a ``supervisor`` package, then enable it (start on boot)

(4) here is config for supervisor (specify actual variables for the server):

::

    [program:messenger]
    command=<PATH_TO_PHP> <SERVER_ROOT>/app/addons/sd_messaging_system/bin/push-server.php
    autostart=true
    autorestart=true
    numprocs=1
    startsecs=0
    exitcodes=0,1,2
    stopsignal=KILL
    log_stdout=true
    log_stderr=true
    logfile=/var/log/messanger.log
    logfile_maxbytes=1MB
    logfile_backups=10
    user=<WEB_USER>

Replace <PATH_TO_PHP> with the path to PHP interpreter, <SERVER_ROOT> with the path to CS-Cart directory, <WEB_USER> with the user (the user can be switched on if the supervisor was started as the root user).

(5) Set up the server (nginx), sample config is:


::

    http {
        map $http_upgrade $connection_upgrade {
            default upgrade;
            ''      close;
        }
        server {
            ...
            location /ws {
                proxy_pass http://127.0.0.1:8091;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $connection_upgrade;
            }

Sample httpd config is:

::

    SSLProxyEngine on
    ProxyPass "/ws"  "ws://127.0.0.1:8091/"
    ProxyPass "/wss" "wss://127.0.0.1:8092/"

(6) Set up the add-on, config is:

::

    Websocket Port: 8091
    Pusher Port: 8092
    Websocket URL: mysite.com/ws

Replace *mysite* with your site domain name.