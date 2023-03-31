***********
Sticky Menu
***********

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000146" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **Make it easier for your customers to navigate** in your store with our `Sticky Menu add-on <https://www.simtechdev.com/addons/customer-experience/sticky-menu.html>`_. It will make your menu (or any element you choose) stay visible at the top of the screen when users scroll the page up or down. 

    **Include the website’s core functionalities** in the sticky bar to allow users to find exactly what they look for in no time flat.

    .. fancybox:: img/Sticky_menu_17.png
        :alt: Sticky menu

    You can **make any element stick at the top** via layout settings. Show your logo, a search field, and cart content always on top:

    .. fancybox:: img/Sticky_menu_13.png
        :alt: Sticky menu

    Check out how it looks like on our `Urban Shift <https://marketplace.simtechdev.com/urban-shift-front-pack.html>`_ theme. The sticky menu here includes a Hamburger menu, search field, profile information, and cart content.

    .. fancybox:: img/Sticky_menu_19.png
        :alt: Sticky menu

    Read further to learn how to create a sticky menu in just a few clicks!

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? |Contact us now.|
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Sticky Menu add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive, and click **Upload & install**. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

To set up the add-on, configure the following settings:

    .. fancybox:: img/Sticky_menu_03.png
        :alt: add-on settings

* **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account.

* **Background color**—Choose the color for the sticky grid.

    .. fancybox:: img/Sticky_menu_04.png
        :alt: sticky grid color

* **Animation duration (ms)**—Set up how fast the sticky panel will appear in milliseconds. The larger this number is, the slower it will move forward.

* **Scroll direction for panel display**—There are two possible scenarios here. The sticky panel may appear when the customer scrolls the page up or down. Here is how it looks like when the **Up** option is active: 

    .. image:: img/Sticky-menu-05.gif
        :alt: sticky menu scrolling up

The sticky bar appears only when the user scrolls the page down and then scrolls it up. This mode is useful for menus: make the menu sticky to improve navigation for customers who intend to leave that page.

And here is the example of the **Down** option activated. The menu appears immediately when the user scrolls the page down.

    .. image:: img/Sticky-menu-06.gif
        :alt: sticky menu scrolling down


======================
Creating a sticky menu
======================

    You can make any existing grid of the layout stick to the top by choosing the **Sticky header** option in the **Wrapper** field in the grid options.

    .. fancybox:: img/Sticky_menu_09.png
        :alt: Sticky menu

    .. attention::

        **If you make some grid sticky, it will disappear from the page and will be shown only in the sticky panel.**

        If you want to show the grid both on the page and in the sticky menu, duplicate it in the layout settings:

            .. fancybox:: img/Sticky_menu_18.png
                :alt: Sticky menu

    For example, you would like to create a sticky menu panel with a menu. 

    1. Add an additional grid to the header or top panel and select the **Sticky header** option in the **Wrapper**

    .. fancybox:: img/Sticky_menu_01.png       
       :alt: Sticky menu

    2. Add the new menu block and set it up according to your needs (you can change its filling following the `CS-Cart documentation <https://docs.cs-cart.com/latest/user_guide/look_and_feel/menus/index.html>`_)

    .. fancybox:: img/Sticky_menu_20.png       
       :alt: Sticky menu

    Here is the result on the desktop: 

    .. fancybox:: img/Sticky_menu_07.png       
       :alt: Sticky menu

    And on mobiles:

    .. image:: img/Sticky-menu-01.gif       
       :alt: Sticky menu

====================================
Creating a bar with several elements
====================================

    Let’s create a menu with a logo, a search field, and a cart like this:

    .. fancybox:: img/Sticky_menu_12.png
        :alt: Sticky menu

    1. Navigate to **Design** > **Layouts**.

    2. Add a grid with the **Sticky header** option activated to the top panel or header. Add 3 grids inside it and fill them with the desired blocks. In our case, they are the Logo, Search, and Cart content blocks in the grids with width 3, 11, and 2 accordingly.

    .. fancybox:: img/Sticky_menu_02.png
        :alt: Sticky menu

    3. Set up the display of grids on different devices if necessary.
    
    .. fancybox:: img/Sticky_menu_08.png
        :alt: grid settings

    Here's the result on desktop:

    .. image:: img/Sticky-menu-03.gif
        :alt: Sticky menu

    And on mobiles:

    .. image:: img/Sticky-menu-04.gif
        :alt: Sticky menu