*************
Gift Registry
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000032" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The **Gift Registry Add-On** integrates an amazing registry service into your online store. It allows your customers to create a wish list for any happy occasion with items from your store and share it with their friends.

============
How it works
============

    .. image:: img/gift_registry_how_it_works.png

    Your store offers a special service for the customers: each customer can create events and add a list of the products they wish to get from your store.

    Other users can view created events and purchase products from any wish list. These products will be sent to the event owner.

    Events can either be public (available to all users) or private (available via an access key sent to certain users).

    The Gift Registry Add-On enables you to create a unique place in your store where customers can communicate with each other. This will promote the store and extend the customers’ community.

========
Features
========

    * Unlimited number of events for each user
    * Convenient search box that allows patrons to find the necessary events easily
    * Intuitive functionality for the store administrators that allows them to moderate events with little effort

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.3 and above, but only versions 4.11.x, 4.12.x and 4.13.x are supported.

    Don't know what archive to download to install the add-on? Read `here <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <http://www.simtechdev.com/helpdesk>`_.

====
Demo
====

    Check out the Gift Registry add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://gift-registry.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the “Gift registry” add-on on the add-ons list page ("Addons" → "Manage add-ons").

    .. fancybox:: img/gift_registry_addons_manage.png
        :alt: Gift registry. Manage add-ons 
        :width: 650px

==================
Available settings
==================

    With the help of the settings of the “Gift registry” add-on, the store administrator can set the ability to create events for users, specify the number of elements in the "Today’s events" block (you can find more information about the block in the `Blocks of the “Gift registry” add-on`_ section), set user notifications and specify the size of images (both in the events list and on the details page of an individual event).

    .. fancybox:: img/gift_registry_addon_settings.png
        :alt: Gift registry. Add-on settings
        :width: 650px

======================================
Adding a hook for versions 4.3.1-4.3.6
======================================

    .. important::

        If your CS-Cart or Multivendor store runs on versions 4.3.1-4.3.6, you'll need to insert a hook to make the add-on perform correctly. 

    To do this, please follow the steps below:

    Open the app/functions/fn.cart.php file.

    In the **fn_checkout_place_order** function, before this line:

    .. code::

        fn_order_placement_routines('route', $order_id);

    add this one:

    .. code::

        fn_set_hook('checkout_place_orders_pre_route', $cart, $auth, $params);

    Example:

    .. code::

        if (empty($params['skip_payment']) && $process_payment == true || (!empty($params['skip_payment']) && empty($auth['act_as_user'])))
        { $payment_info = !empty($cart['payment_info']) ? $cart['payment_info'] : array(); fn_start_payment($order_id, array(), $payment_info); }
        // added hook checkout_place_orders_pre_route
        fn_set_hook('checkout_place_orders_pre_route', $cart, $auth, $params);
        fn_order_placement_routines('route', $order_id);

===============
Managing events 
===============

    Events are managed on the "Events" page (under the "Customers" → "Events" section). On this page, the store administrator can create new events, edit and remove existing events.

    Besides managing events, the add-on allows the store administrator to create new fields for events. To get to the managing event fields page, please use the “Custom event fields" link on the right. For more information about event fields, proceed to the `Custom event fields`_ section below.

    .. fancybox:: img/gift_registry_events_manage.png
        :alt: Gift registry. Managing events
        :width: 650px

===========================
Creating and editing events
===========================

    To create a new event, please use the + button  
    
    .. image:: img/gift_registry_add_event_button.png 
    
    When creating a new event, the store administrator should input general information - event name, contact e-mail, event type (public, private or disabled), image, etc.

    .. fancybox:: img/gift_registry_new_event_admin.png
        :alt: Gift registry. New event in the admin panel
        :width: 650px

    In addition, in the "General" tab the store administrator can create a list of invitees. Any person can be added to this list, not only the one who is registered in the store.

    .. fancybox:: img/gift_registry_invitees.png
        :alt: Gift registry. Invitees
        :width: 650px

    The editing event page differs from the creating new event page in two additional tabs - "Products" and "Notifications".

    In the “Products" tab it is necessary to define the products to be displayed on the details page in the `Gift registry for customers`_ section.

    .. fancybox:: img/gift_registry_add_products_to_event_admin.png
        :alt: Gift registry. Add products to event
        :width: 650px

    A list of event invitees is displayed in the “Notifications" tab. In this tab the store administrator can send notifications to invitees.

    .. fancybox:: img/gift_registry_notifications.png
        :alt: Gift registry. Sending notifications
        :width: 650px

===================
Custom event fields
===================

    Besides the standard set of event fields, the "Gift registry" add-on allows to create additional ones. To go to the custom fields list page, please use the "Custom event fields" link on the right.

    A wide range of available field types allows the administrator to create new fields of the select box type, radio groups, date, etc.

    .. fancybox:: img/gift_registry_new_event_field.png
        :alt: Gift registry. New event field
        :width: 650px

====================================
Blocks of the “Gift registry” add-on
====================================
    
    The "Gift registry" add-on allows to create two new blocks - “Gift registry menu" and "Gift event access key" (in the "Design - Layouts" section).

    .. fancybox:: img/gift_registry_new_blocks.png
        :alt: Gift registry. New blocks
        :width: 650px

    The "Gift registry menu" block allows to display a list of events available at the moment in the customer area. The number of elements displayed in the block is set in the add-on setting (see `Available settings`_).

    If the number of available events exceeds the value defined in the "Number of items in Events sidebox" field in the add-on settings, the “More…” link will be displayed besides the events list in the block. By following this link the customer will get to the page of the list of events available at the moment.

    .. fancybox:: img/gift_registry_todays_events.png
        :alt: Gift registry. Today's events block
        :width: 650px

    As specified above in the `Creating and editing events`_ section, there are two event types available in the customer area - public and private. However, private events will be accessible by a secret key only. The users invited to a private event may need to get an access key to the event additionally. The "Get access key" functionality is provided for this, it is implemented in the "Gift event access key" block. (Users can see this under their account in the Events section in the Private events tab).

    .. fancybox:: img/gift_registry_get_access_key.png
        :alt: Gift registry. Get access key
        :width: 650px

==============================================
Default layouts for the “Gift registry” add-on
==============================================

    When the add-on is installed, two layouts are created automatically. Blocks can be set for them.

    .. fancybox:: img/gift_registry_layouts.png
        :alt: Gift registry. Layouts
        :width: 650px

    It is logical that the "Gift event access key" block described above should be located on the "Gift registry: private events" layout.

    .. fancybox:: img/gift_registry_access_key.png
        :alt: Gift registry. Layouts
        :width: 3650px

---------------------------
Gift registry for customers
---------------------------

====================================
Managing events in the customer area
====================================

    In the customer area, a list of all events is available on the "Events" page (please see "My Account" → "Events").

    .. fancybox:: img/gift_registry_list_of_events_customer.png
        :alt: Gift registry. List of events in customer area
        :width: 650px

    On this page, users can view a list of available events and create their own ones. Also, Searchbox is available to the users, it is a powerful tool for searching events.

=========================================
Creating a new event in the customer area
=========================================

    To create a new event, please use the button located on the orders list page

    .. image:: img/gift_registry_add_event_button_customer.png

    and complete all of the necessary fields.

    .. fancybox:: img/gift_registry_new_event_customer.png
        :alt: Gift registry. New event in customer area
        :width: 450px

    Also, when creating a new event, the user can create a list of invitees. After an event is created, the user will be able to send e-mail notifications to all the invitees.

    At this step the process of creating a new event is not completed. Besides general information it is necessary to add new products for the event. You can read more about it in the `Editing the existing event`_ section below.

==========================
Editing the existing event
==========================

    The editing event page is like the creating a new event page. However, additional information will be available to the event owner besides the general information in the “General" tab.

    First of all, the access key will be displayed in the "General" tab besides general information. Using this key the invitees will gain access to private events.

    In the "Products" tab, the event owner can manage the list of products related to the event - add/remove products, change the quantity, etc. In addition, the event owner will see what products have already been purchased.

    .. fancybox:: img/gift_registry_add_products_to_event_customer.png
        :alt: Gift registry. Add product to event in customer area
        :width: 650px

    In the "Notification" tab, the event owner will be able to send e-mail notifications to the invitees.

    .. fancybox:: img/gift_registry_event_notifications.png
        :alt: Gift registry. Event notifications
        :width: 650px

========================================================
Adding a product to an event on the product details page
========================================================

    As described above, it is possible to add products for an event on the event details page. Moreover, it is possible to add products for an event on the product details page, please use the “Add to registry" button for this. 

    .. fancybox:: img/gift_registry_add_product_on_product_page.png
        :alt: Gift registry. Adding product to event from product details page
        :width: 650px
    
    If a user creates several events, they will be offered to select the event, for which they want to add a product.

=======================================
Purchasing products related to an event
=======================================

    The appearance of the event details page for customers differs from the appearance for the event owners. Only the logo and products list are displayed on this page.

    .. fancybox:: img/gift_registry_add_product_to_cart.png
        :alt: Gift registry. Adding product to cart
        :width: 650px

    The users can purchase the products related to an event. These products will be shipped to the event owners.

========================
Access to private events
========================

    To view the details of a private event, users should enter an access key.

    .. fancybox:: img/gift_registry_get_access_key.png
        :alt: Gift registry. Get access key
        :width: 650px

    To get an access key to a private event, it is necessary to send a request using the "Get access key" form.

--------------------------
Frequently asked questions
--------------------------

==============================================================================================
Why does the event owner not get notifications if products from the gift event were purchased?
==============================================================================================

    In order that the event owner could get notifications when products from his/her event are purchased, these two conditions must be fulfilled:

    1. The "Notify event owner on purchase" option should be selected in the settings of the Gift Registry add-on.
    2. The "Notify event owner" option should be selected in the order status settings.

    So when the order status changes (for example, to Processed), the notification will be sent to the event owner.