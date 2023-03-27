**************
Hamburger Menu
**************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000149" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The `Hamburger Menu add-on <https://www.simtechdev.com/addons/customer-experience/hamburger-menu.html>`_ allows you to create a little three-lined button that hides the traditional menu. Clicking the button opens the site navigation, which can contain links to pages all over the website.

    .. fancybox:: img/hamburger-menu-01.png
        :alt: Hamburger Menu on desktop

    It's a great solution to handle navigation on smaller screens. It keeps the screen clean and saves valuable space.

    .. fancybox:: img/hamburger-menu-02.png
        :alt: Hamburger Menu on mobile version
        :width: 415px

    The look and feel of the menu is customizable. You can change the colors for the button and menu background, pick colors for the first, second and third level items.

    .. fancybox:: img/hamburger-menu-016.png
        :alt: Hamburger Menu settings

    The content of the hamburger menu may vary:

    - **Quick links**

    .. fancybox:: img/hamburger-menu-04.png
        :alt: Hamburger Menu settings

    - **Main menu**

    .. fancybox:: img/hamburger-menu-01.png
        :alt: Hamburger Menu on mobile version

    - **Footer items (e.g. blog, reviews, about us, sitemap)**

    .. fancybox:: img/hamburger-menu-05.png
        :alt: Hamburger Menu settings

    - **Footer items of create orders (e.g. delivery and payment, returns)**

    .. fancybox:: img/hamburger-menu-27.png
        :alt: Hamburger Menu settings

============
Key features
============

    * The menu is opened by swiping from the edge of the screen (on mobile and tablet) or by clicking on the three-line button.
    * The menu can be closed by swiping from any place on the screen, by clicking on the overlay or on the Close button. Switching happens when the swipe length is more than half the panel width.
    * The hamburger menu sidebar contains an account menu.
    * Ability to create a bar that includes a menu, a search field, and a cart.
    * The add-on is compatible with `Amazon Style Menu <https://marketplace.simtechdev.com/amazon-style-menu.html>`_ and `Smart Mega Menu <https://marketplace.simtechdev.com/smart-mega-menu.html>`_ add-ons (it supports icons and labels).

    .. fancybox:: img/hamburger-menu-25.png
        :alt: Hamburger Menu settings
        :width: 415px

.. note::
    
    Icons and labels are available only if you have Amazon Style Menu and/or Smart Mega Menu add-ons are installed and active. The Hamburger Menu add-on doesn't provide this functionality by default.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.12 and above. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the look and feel of the Hamburger menu add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://hamburger-menu.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Hamburger menu add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive, and click **Upload & install**. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active and fill in the **License key** field.

    .. fancybox:: img/hamburger-menu-03.png
        :alt: fill in the license key


=========================
Creating a hamburger menu
=========================

    .. fancybox:: img/hamburger-menu-14.png
        :alt: Hamburger Menu

    To create a separate hamburger menu, follow the instructions:

    1. Navigate to **Design - Layouts**.

    2. In the **Header** container, add a new grid, and set it up.

    .. fancybox:: img/hamburger-menu-15.png
        :alt: setting up the grid

    4. Add a new **Hamburger menu** block to the created grid.

    .. fancybox:: img/hamburger-menu-17.png
        :alt: creating a block

    6. In the **General** tab, give a name for the block. Then click **Settings** and specify the maximum number of second and third level elements that will be shown in the menu and **Show "See all" button** option can be selected.

    .. fancybox:: img/hmm.png
        :alt: creating a block

        Example: If you specify *2* for the second and third level elements and you have more than 2 elements, the **See all in [category]** link will be displayed.

    .. fancybox:: img/hamburger-menu-20.png
        :alt: creating a block

        If a category has subcategories, then the list of them expands when clicking on the category name. Otherwise, the link will lead to the page of this category. Categories of the 1st and 2nd level might be reached with the help of the **See all** button.

    7. In the **Content** tab, select what content you'd like to show: quick links, main menu, shop (footer), create orders (footer). 

    .. note:: Click **Manage menus** if you want to add new links or remove some existing ones. You will be redirected to the Design - Menus page. There you can change the filling of the menu. Refer to `CS-Cart user guide <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_ for more information.
    .. fancybox:: img/hamburger-menu-28.png
        :alt: creating a block


    8. In the **Block setting** tab, configure the look and feel of the menu.

    .. fancybox:: img/hamburger-menu-021.png
        :alt: block settings

    * **Menu position**—Choose where the menu will appear: from the left side or the right side.

       .. fancybox:: img/hamburger-menu-10.png
        :alt: menu on the right side

    * **Button size**—Define a suitable size for the menu in pixels.

    * **Close button position**—Choose a position for the close button in the menu: left or right.

    * **Enable overlay**—Choose a direction for the overlay effect: from left to right or from right to left, so the page will be darkened with the focus on the menu. Select **None** if you don't want to show an overlay when the menu opens.

    Configure the rest of the settings by picking desired colors for the button background, menu background, etc, or use default colors.

    .. fancybox:: img/hamburger-menu-022.png
        :alt: creating a block
        :width: 550px

    9. Click **Create** or **Save**.

    10. Change the width of the other grids so that in total they take up 14 columns (as the hamburger menu takes 2 columns). Optionally, you can hide the **Main menu**.

    .. fancybox:: img/hamburger-menu-23.png
        :alt: creating a block

    Here's the result:

    .. fancybox:: img/hamburger-menu-24.png
        :alt: hamburger menu

==========================================================================
Creating a panel with a hamburger menu, a search block, and a cart button.
==========================================================================

    1. Create a grid in the header with a CSS class ``hamburger-grid``.

    .. fancybox:: img/hamburger-menu-06.png
        :alt: creating a grid

    2. Add a **Hamburger Menu** block, a Search and, a Cart content block to the created grid.

     .. fancybox:: img/hamburger-menu-07.png
        :alt: creating blocks

    3. Add a ``top-search`` class for the Search block.

     .. fancybox:: img/hamburger-menu-08.png
        :alt: add class for search blocks

    And here is how it looks like!

     .. fancybox:: img/hamburger-menu-09.png
        :alt: panel with menu and search


    By default, the color of the menu is determined by the theme settings for the menu.

    If you want to change its color, navigate to the Theme Editor and change it.

     .. fancybox:: img/hamburger-menu-12.png
        :alt: panel with menu and search

    For more information on Theme Editor, refer to `CS-Cart documentation <https://docs.cs-cart.com/latest/user_guide/look_and_feel/themes/theme_editor.html>`_.

    .. note::
        The Hamburger Menu add-on supports its own scrollbar styles for Chrome. Other browsers do not support such styling, so a default scrollbar will be displayed.

======================================
Adding a Cart button with a side panel
======================================

The add-on allows using its own cart button with the nice-looking side panel.

     .. fancybox:: img/hamburger-menu-11.png
        :alt: panel with cart

Just add the **Side cart** block to the layout of the page instead of the regular **Cart content** block.

     .. fancybox:: img/hamburger-menu-13.png
        :alt: side cart block

Settings available for this block are the same as for the `Hamburger Menu block <https://www.simtechdev.com/docs/addons/hamburger-menu/index.html#creating-a-hamburger-menu>`_. Change the look and feel of the button to suit your needs.

     .. fancybox:: img/hamburger-menu-19.png
        :alt: side cart block

---
FAQ
---

===========================================================
Is it possible to change the Register or Sign in font size?
===========================================================

By default, the font size is 15px. You can change it with the help of custom CSS for selector ``.account-menu .account-menu__link {}``.
