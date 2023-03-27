***********************
Vendor Image
***********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000172" class="btn buy-now__btn">Buy now</a>
    </div>


.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    The **Vendor Image** allows you to add a full-width background image to the vendor store and vendor information page and apply parallax effect to it.

    .. fancybox:: img/vendor-background-overview-main-page.gif
        :alt: Vendor Image for CS-Cart

=============
Compatibility
=============

    The add-on is compatible with Multi-Vendor 4.4 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Vendor Image add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://vendor-background-image.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Vendor Image add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings of the Vendor Image add-on.

    .. fancybox:: img/vendor-background-image-settings.png
        :alt: Vendor Image settings

    * **Aspect ratio (width / height)**—Select a preferable aspect ration for images. This value will be displayed in a tooltip for the **Vendor background** setting in the admin panel. It will help vendors add an image of the correct size.

    .. fancybox:: img/tooltip.png
        :alt: Aspect ratio setting

    * **Gap between the top of background image and content**—Define the distance between the top of the background image and the main content on the page. Enter a value in percentage or pixels (depending on the value selected below).

    .. fancybox:: img/background-image-gap-setting.png
        :alt: Vendor Image settings

    * **Gap between the top of background image and content (units)**—Select units you want to use to measure the gap between the top of background image and content.

    * **Parallax background**—If enabled, the parallax effect will be applied to the background image.

    * **Stretch image**—The image will be stretched across the entire window width regardless of natural image size.

    * **Mobile resolution**—If the customer's screen size is smaller than this value, adaptive styles will be applied, or the background image will be hidden (if the *Hide on mobile devices* option is enabled).

    * **Hide on mobile devices**—Select the checkbox if you want to hide the background image on mobile devices.

=================================================
How to add a background image to the vendor store
=================================================

    To add an image to the background of the vendor store, follow these steps:

    .. fancybox:: img/background-image-vendor-store.png
        :alt: backround image in vendor store

++++++++++++++++++++++++
Step 1. Adjusting layout
++++++++++++++++++++++++

    1. Go to **Design > Layouts**.

    2. Switch to the **Vendor store** layout.

    3. Add a new grid to a container.

    .. fancybox:: img/vendor-background-adding-grid.png
        :alt: adding a new grid

    .. note::

        You can add the grid with the block to any container (Content, Header, or Top panel), the background image will be positioned at the top of the page.

    4. In this grid, add a new block. Select the **Vendor background** block.

    .. fancybox:: img/vendor-background-block.png
        :alt: Vendor Background block

    5. Name the block and select the **Vendor background** template.

    .. fancybox:: img/vendor-background-block-settings.png
        :alt: Vendor Background block settings

    6. Click **Create**.

 .. _these-steps:

+++++++++++++++++++++++
Step 2. Adding an image
+++++++++++++++++++++++

    1. Go to **Vendors > Vendors** and select the necessary vendor.

    .. fancybox:: img/vendors-vendors.png
        :alt: Vendor Background block settings

    2. Switch to the **Logos** tab and add a background image.

    .. fancybox:: img/adding-background-image.png
        :alt: Vendor Background block setting
    
    3. Click **Save and close**.

=======================================
How to add a banner to the vendor store
=======================================

    To add a banner to the vendor store, follow these steps:

    .. fancybox:: img/banner-vendor-store.png
        :alt: banner in vendor store

++++++++++++++++++++++++
Step 1. Adjusting layout
++++++++++++++++++++++++

    1. Go to **Design > Layouts**.

    2. Switch to the **Vendor store** layout.

    3. Add a new grid to a container.

    .. fancybox:: img/vendor-banner-adding-grid.png
        :alt: adding a new grid

    4. In this grid, add a new block. Select the **Vendor banner** block.

    .. fancybox:: img/vendor-banner-block.png
        :alt: Vendor Banner block

    5. Name the block and select the **Vendor banner** template.

    .. fancybox:: img/vendor-banner-block-settings.png
        :alt: Vendor Banner block settings

    6. Click **Create**.

 .. _these-steps2:

+++++++++++++++++++++++
Step 2. Adding an image
+++++++++++++++++++++++

    1. Go to **Vendors > Vendors** and select the necessary vendor.

    .. fancybox:: img/vendors-vendors.png
        :alt: Vendor Banner block settings

    2. Switch to the **Logos** tab and add a banner.

    .. fancybox:: img/adding-banner.png
        :alt: Vendor Banner block setting
    
    3. Click **Save and close**.

============================================================
How to add a background image to the vendor information page
============================================================

    To add an image to the vendor information page, follow these steps:

    .. fancybox:: img/vendor-information-page.png
        :alt: backround image in vendor store

++++++++++++++++++++++++
Step 1. Adjusting layout
++++++++++++++++++++++++

    1. Go to **Design > Layouts**.

    2. Switch to the **Vendor information** layout.

    3. In the **Header** container, add a new block.

    .. fancybox:: img/adding-new-block.png
        :alt: adding a new block

    .. note::

        We highly recommend adding the block to the **Header** container, otherwise the background image may not appear for newly registered vendors.

    4. Select the **Vendor background** block.

    .. fancybox:: img/vendor-background-block.png
        :alt: Vendor Background block

    5. Name the block and select the **Vendor background** template.

    .. fancybox:: img/vendor-background-block-settings.png
        :alt: Vendor Background block settings

    6. Click **Create**.

+++++++++++++++++++++++
Step 2. Adding an image
+++++++++++++++++++++++

    Follow these steps :ref:`these-steps`.

==================================================
How to add a banner to the vendor information page
==================================================

    To add a banner to the vendor information page, follow these steps:

    .. fancybox:: img/vendor-banner-information-page.png
        :alt: banner in vendor store

++++++++++++++++++++++++
Step 1. Adjusting layout
++++++++++++++++++++++++

    1. Go to **Design > Layouts**.

    2. Switch to the **Vendor information** layout.

    3. Add a new grid to a container.

    .. fancybox:: img/vendor-banner-adding-grid.png
        :alt: adding a new block

    4. In this grid, add a new block. Select the **Vendor banner** block.

    .. fancybox:: img/vendor-banner-block.png
        :alt: Vendor Banner block

    5. Name the block and select the **Vendor banner** template.

    .. fancybox:: img/vendor-banner-block-settings.png
        :alt: Vendor Banner block settings

    6. Click **Create**.

+++++++++++++++++++++++
Step 2. Adding an image
+++++++++++++++++++++++

    Follow these steps :ref:`these-steps2`.