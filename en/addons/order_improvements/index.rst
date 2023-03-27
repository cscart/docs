******************
Advanced Orders
******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000093" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **The Advanced Orders add-on** provides you with new useful features:

    - add an attachment to the order

    .. fancybox:: img/Order_Improvements_Selection_008.png
        :alt: CS-Cart Advanced Orders add-on

    - add a product thumbnail to the order details page

    .. fancybox:: img/Order_Improvements_Screenshot.jpeg
        :alt: CS-Cart Advanced Orders add-on

    - allow your customers to download files attached to the order

    .. fancybox:: img/Order_Improvements_Selection_006.png
        :alt: CS-Cart Advanced Orders add-on

    - add a product image to the order invoice

    .. fancybox:: img/Order_Improvements_Selection_007.png
        :alt: CS-Cart Advanced Orders add-on

    - send attachments to customers by email when the order status is changed

    .. fancybox:: img/Order_Improvements_screenshot.jpg
        :alt: sending attachments by email

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.11 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Advanced Orders add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://order-improvements.demo.simtechdev.com/" rel="nofollow" target="_blank">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Advanced Orders” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Order_Improvements_Selection_001.png
        :alt: CS-Cart Shipping Estimation add-on

    .. important::

        Make sure the **Attachments** add-on is set to Active in your store. Otherwise the Advanced Orders add-on will not perform correctly.

        .. fancybox:: img/Order_Improvements_Selection_011.png
            :alt: Attachments add-on is active

==================
Available settings
==================

    Here are available settings of the Advanced Orders add-on:

    .. fancybox:: img/Order_Improvements_Selection_009.png
        :alt: setting of the Advanced Orders add-on

    * **The width of the product icon on the order page**—Specify the width of the product icon in pixels for the order details page.

    * **The height of the product icon on the order page**—Specify the height of the product icon in pixels for the order details page.

    .. fancybox:: img/Order_Improvements_Selection_016.png
        :alt: width and height of image

    * **The width of the product icon in the invoice**—Specify the width of the product icon in pixels that will be shown in the invoice.

    * **The height of the product icon in the invoice**—Specify the width of the product icon in pixels that will be shown in the invoice.

    .. fancybox:: img/Order_Improvements_Selection_018.png
        :alt: width and height of image
        :width: 737px

    .. important::

        If your store runs on versions 4.4.1 and above, please make the following adjustments to make sure the images in the invoices are displayed correctly:

        1. Go to **Design > Documents > Invoice > Product Table**.

        2. Select **Item description**.

            .. fancybox:: img/Order_Improvements_Selection_019.png
                :alt: width and height of image

        3. Add the "{{ sd_order_improvements.main_image }}" variable to the **Template** field.

            .. fancybox:: img/Order_Improvements_Selection_020.png
                :alt: width and height of image

        4. Click **Save**.

    * **Max total size of files in the invoice (in megabytes)**—Leave this field empty to allow attaching all files to the order.

    * **Show product images on invoice**—Decide whether you want to show product images on the invoices on the storefront.

    * **Hide images from the invoice if at least one product has no image**—If at least one product has no image in the invoice, the images for other products will not be shown. Valid only for the old e-mail templates mode.

    * **Show product images on the order details page in the frontend**—Decide whether you want to show product images on the order details page on the storefront.

    * **The width of the product icon on the order details page in the admin panel**—Specify the width of the product icon in pixels.

    * **The height of the product icon on the order details page in the admin panel**—Specify the height of the product icon in pixels.

    .. fancybox:: img/Order_Improvements_Selection_017.png
        :alt: width and height of image

================================
Adding attachments to the order
================================

    To add an attachment to the order, go to its details page and you should see a new **Attachments tab**:

    .. fancybox:: img/Order_Improvements_Selection_003.png
        :alt: Attachments tab

    In this tab, you can add a new attachment, as well as edit or delete the added ones.

    .. fancybox:: img/Order_Improvements_Selection_005.png
        :alt: Attachments tab

    When adding a new attachment, specify the following information:

    .. fancybox:: img/Order_Improvements_Selection_004.png
        :alt: Attachments tab

    * **Name**—Enter a name for the attachment

    * **Position**—Position of the attachment in the list of attachments in the tab

    * **File**—Upload a file locally, from the server or by URL (required)

    * **User groups**—Define which of the user groups can have access to the attachment.

==============================
Sending an attachment by email
==============================

    The Advanced Orders add-on also allows you to send attachments and invoices to customers by email automatically when the order status is changed to a specific one.

    First, navigate to **Administration - Order statuses** and select a desired status.

     .. fancybox:: img/Order_Improvements_Selection_012.png
        :alt: order statuses

    Select the **Send attachments by e-mail** checkbox to send a specific attachment and/or **Send invoice by e-mail** to send an invoice:

    .. fancybox:: img/Order_Improvements_Selection_013.png
        :alt: Send attachments and invoice by e-mail

    Then add an attachment under **Orders - Attachments**:

    .. fancybox:: img/Order_Improvements_Selection_014.png
        :alt: changing order status

    Specify the necessary information in the pop-up:

    .. fancybox:: img/Order_Improvements_Selection_015.png
        :alt: changing order status

    Or you can add an attachment to a specific order (see the `Adding attachments to the order`_ section).

    So once the order status is changed, a notification will be sent to the customer:

    .. fancybox:: img/Order_Improvements_Selection_010.png
        :alt: changing order status

    and the attached files will be sent automatically.

    .. fancybox:: img/Order_Improvements_screenshot.jpg
        :alt: sending attachments by email

    .. tip::

        You can define the maximum total size of attached files in the add-on settings:

        .. fancybox:: img/Order_Improvements_Selection_009_a.png
            :alt: the maximum total size of attached files
