*************
Product Likes
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000114" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    Understanding customer preferences is very important whether you are selling a product or offering a service. This is because customers are the determiners of how successful a company becomes. The **Product Likes** add-on is the best way to get to know your customers' likes and dislikes, which will definitely help you increase sales.

    The **Product Likes** add-on allows users to like any product in your store. The **LIKE** button is added to product details pages. They can also see the likes count for the liked products.

    .. fancybox:: img/product-page.png
        :alt: Product likes

    The **Product Likes** add-on creates a new **My likes page** in the user account. Customers can save desired products in this list by liking them. They can return to any product later and add it to cart right from this page. It is an effective way to reduce shopping cart abandonment.

    .. fancybox:: img/my-likes-page.png
        :alt: My likes page

    If you use the `Profile Page add-on <https://www.simtechdev.com/addons/customer-experience/user-profile-page.html>`_, you can show the products the user likes on the profile page. Clicking **View all** link will open the page with all liked products.

    .. fancybox:: img/user-profile-page.png
        :alt: My profile page

    If you'd like, you can show the **Most liked products** block containing the most popular products in your store and **My likes** block containing products the user liked.

    .. fancybox:: img/homepage-blocks.png
        :alt: Most liked products and My likes blocks

    Your customers will be able to sort products by the number of likes: from low to high and from high to low.

    .. fancybox:: img/sorting-by-likes.png
        :alt: sorting products by the number of likes

    The **Product Likes** add-on will also help you make stock decisions by knowing user preferences of certain products in your store. You can see **Likes count** on the product list page and sort products by this parameter:

    .. fancybox:: img/Product_likes_012.png
        :alt: Show Likes column on the products list page

    Get to know your customers' choice–start using our **Product Likes add-on** now!

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Product Likes add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://product-likes.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Product Likes add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.


=====================
Setting up the add-on
=====================

    Here are available settings of the **Product likes** add-on:

    .. fancybox:: img/product-likes-setting.png
        :alt: settings of the Product likes add-on

    * **Show Likes column on the products list page**–If enabled, the number of likes the products gained will be shown in the Likes column on the products list page in the admin panel.

    .. fancybox:: img/Product_likes_012.png
        :alt: Show Likes column on the products list page

    * **Show Likes column on the categories page**–If enabled, the number of likes the products in categories gained will be shown in the Likes column on the categories list page in the admin panel.

    .. fancybox:: img/categories-list.png
        :alt: Show Likes column on the products list page

    * **Count likes of unregistered users**–If enabled, unregistered users will be able to like products in the store and their likes will be also counted.

    * **Show button name**–Define where the **LIKES** word should be displayed on ther button. Two options:

    **If enabled:**

    .. fancybox:: img/button-name-enabled.png
        :alt: Show Likes column on the products list page
        :width: 240px

    **If disabled:**

    .. fancybox:: img/button-name-disabled.png
        :alt: Show Likes column on the products list page
        :width: 240px

    * **Icon**–Select the icon you want to display on the button. Two options:

    **Heart**

    .. fancybox:: img/heart-icon-like-button.png
        :alt: heart icon on likes button
        :width: 240px


    **Hand**

    .. fancybox:: img/hand-icon-like-button.png
        :alt: hand icon on likes button
        :width: 240px

    * **Color**–Select the color you would like to apply for the Like button (primary, secondary, tertiary).

    .. tip::

        You can check the colors in the Theme Editor.

        .. fancybox:: img/theme-editor.png
            :alt: Theme editor
            :width: 299px

    * **Cron key**–Your key to the cron system. 

    Use this command to update the count of product likes automatically according to a schedule.

    **php /path/to/cart/admin.php --dispatch=like.cron --key=CRON_PASSWORD**

    where: 

    **path/to/cart** is the path to your website, 

    **CRON_PASSWORD** is the value of the *Cron key* setting above.

=======================================
Most liked products and My likes blocks
=======================================

    If you'd like to display the **Most liked products** and **My likes** blocks on the storefront, follow these steps to add them:

    .. fancybox:: img/homepage-blocks.png
        :alt: Most liked products and My likes blocks

    1. Navigate to **Design - Layouts**.

    2. On the editing page of the **Homepage** layout, click the + button to add a new block.

    .. fancybox:: img/Product_likes_005.png
        :alt: adding a new block

    3. In the **Create new block** tab, select the **Products** block.

    .. fancybox:: img/Product_likes_008.png
        :alt: adding a new block

    4. In the **General** tab, give it a name and select the desired template.

    .. fancybox:: img/Product_likes_009.png
        :alt: adding a new block

    5. In the **Content** tab, select the **Most liked** and **My likes** filling for the **Most liked products** and **My likes** blocks respectively.

    .. fancybox:: img/Product_likes_010.png
        :alt: adding a new block

    Done! Now you can go to the storefront to see the recent changes.

=============
My likes page
=============

   The **Products likes** add-on creates a new **My likes** page in the customer's account, allowing them to see a list of products they liked and easily add products to cart right from this page.

    .. fancybox:: img/my-likes-page.png
        :alt: My likes page

================
Sorting by likes
================

    Your customers can sort products by the number of likes: from low to high and from high to low.

    .. fancybox:: img/sorting-by-likes.png
        :alt: sorting products by the number of likes

    To add this sorting, follow these steps:

    Go to **Settings - Appearance**.

    Navigate to the **Products list layouts settings** section.

    In the list of **Available product list sortings** select the **Sort by Likes: Low to High** and **Sort by Likes: High to Low** checkboxes.

    .. fancybox:: img/Product_likes_014.png
        :alt: sorting products by the number of likes

    Click **Save**.

    Enjoy!
