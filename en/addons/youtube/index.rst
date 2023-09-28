*********************
YouTube Gallery
*********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000098" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    `The YouTube Gallery add-on <https://www.simtechdev.com/addons/customer-experience/youtube.html>`_ is a simple-to-use extension that makes it easy to add YouTube videos to your CS-Cart store, or create a video gallery on the category page. 
    Make description of your products more informative and attract more customers to your store.

    You can now add not only pictures of your products, but also a quick video showing your product in movement, being worn, or just to scale. Whatever your product does or is capable of, let your potential customers see it in better detail.

    Here’s a look.

    .. fancybox:: img/YouTube_Selection_024.png
        :alt: YouTube video on the product details page

    You can also add a video at the end after all additional images.

    .. fancybox:: img/YouTube_Selection_024a.png
        :alt: YouTube video on the product details page

    Alternatively, you can choose to display videos in the product tab.

    .. fancybox:: img/YouTube_Selection_051.png
        :alt: tab

    You can choose which videos you want to show by simply specifying their URLs. The add-on allows you to include titles and player controls if you like, but that is optional.

    .. fancybox:: img/YouTube_Selection_005.png
        :alt: YouTube video on the product details page

    The add-on also creates a YouTube icon on product thumbnails on the products list page. When hovering over a product, the icon will be highlighted red, inviting the customer to play the video:

    .. fancybox:: img/YouTube_Selection_009.png
        :alt: YouTube Gallery on category page

    You can add a video to any page you like, for instance, the registration page to explain how the Referral program works in your store and motivate your customers to register (see `Affiliate PRO <https://www.simtechdev.com/docs/addons/affiliate/index.html>`_):

    .. fancybox:: img/YouTube_Selection_049.png
        :alt: YouTube Gallery on category page

    With the YouTube add-on, you can create a gallery from YouTube videos on the category page. 

    .. fancybox:: img/Category_page.jpg
        :alt: YouTube Gallery on category page

    The YouTube Gallery add-on adds a new Video gallery page to your store. It will keep all videos added to products in one place.

    .. fancybox:: img/YouTube_Selection_025.png
        :alt: Video gallery page

    Right on this page, customers can quickly view products and add them to cart.

    .. fancybox:: img/YouTube_Selection_027.png
        :alt: quick view

    Simply install the add-on, make a few adjustments, and you're all set!

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 7.1.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the YouTube Gallery add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://youtube.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

--------
Features
--------

=============
Administrator
=============

    1. Attach Youtube videos to product images

    2. Attach  Youtube videos to products

    3. Attach Youtube videos to the products via bulk edition of the product editing

    4. Create a new filter for the products with a Youtube video attached

    5. Enable/disable the Youtube label for products with a Youtube video

    6. Enable/disable ability to play Youtube video outside the detailed product page

    7. Enable/disable the tab with Youtube videos attached

    8. Create a block for Youtube Videos

    9. Import/Export Youtube videos attached to the products images

=======
Vendors
=======

    1. Attach Youtube videos to product images 

    2. Attach the Youtube videos to products

    3. Attach Youtube videos to the products via bulk edition of the product editing

    4. Import/Export Youtube videos attached to the products images

==========
Storefront
==========

    1. The add-on creates a page of with the list of products with Youtube videos attached to the product images 

    2. Display the Youtube video via a special block

    3. Display the Youtube videos in the image gallery of the detailed product page and on the Quick View page  

    4. Display Youtube videos on a tab of the detailed product page

    5. Display Youtube videos on modal window available in the product lists

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

The add-on can be installed in accordance with the instruction in the `How to install an Add -on article <https://simtechdev.com/docs/info/how_to_install_an_addon/index.html>`_.

=====================
Setting up the add-on
=====================

    .. fancybox:: img/youtube.gif
        :alt: Settings

++++++++++++
Tab: General
++++++++++++

    * *Apply the product label* - add Youtube label, to the products with a Youtube video attached to the product images

    * *Apply the video viewer in product lists* - add the Youtube icon shaped button on a list of the products and other pages where the Youtube video previewer is placed and Player modal window can be opened 
       
    .. fancybox:: img/YouTube_Selection_057.png
        :alt: Tab General

++++++++++++++++++++++
Tab: Player parameters
++++++++++++++++++++++

    Several parameters of the `Youtube player <https://developers.google.com/youtube/player_parameters>`_ can be set there.

    .. fancybox:: img/YouTube_Selection_058.png
        :alt: Tab Palyer Parameters

++++++++++++++++++
Tab: Label Youtube
++++++++++++++++++ 

    * *Apply the product label* - Add Youtube label to the products with at least one Youtube videos attached to the image gallery

    * *Connect with Label add-on* - Allows to add Youtube label to the labels list and attach custom-made labels as well as Youtube Gallery default one

    .. fancybox:: img/YouTube_Selection_059.png
        :alt: Tab Labels

=================
Youtube Block
=================

    .. fancybox:: img/youtube2.gif
        :alt: Manual Filling

++++++++++++++++++++++++++++++
Options of the Content Filling
++++++++++++++++++++++++++++++

    * *Manual Filling* - Block will be filled with videos added into block configuration.

    * *Bulk from the store* - Block will be filled with videos from product pages with at least one video attached to the product images. Can be limited by video quality.

    * *From selected category* - Block will be filled with videos from products of selected category with at least one Youtube video attached to product images. Can be limited by quantity and include subcategories

    * *Additional product video* - Block will be filled with videos attached to the product. Presence of the product_id parameter in the page URL is obligatory

++++++++
Settings
++++++++

    **Display block for:**

    * all users

    * unauthorized users only

    * authorized users only

    .. fancybox:: img/YouTube_Selection_066.png
        :alt: Display Settings

++++++++++++++++++++++++++++
Templates (display variants)
++++++++++++++++++++++++++++

    * Original

=============================================
Attach the video to the product image gallery
=============================================

    1. Open detailed product page on the admin panel

    2. Open the General tab

    3. Click on Add video button and enter the Youtube video link 

    .. fancybox:: img/YouTube_Selection_060.png
        :alt: User Admin

==========================================================
Attach the video to the product (additional Youtube video)
==========================================================

    1. Open detailed product page on the admin panel

    2. Open the Add-ons tab

    .. fancybox:: img/YouTube_Selection_061.png
        :alt: User Vendor

    .. fancybox:: img/YouTube_Selection_062.png
        :alt: User Admin

    In case the additional videos are not displayed in the product tab after the they were added, the block has to be resaved:

    1. Open the section Layouts -> Block

    2. Search the block with the "YouTube" type

    3. Find the "Additional product videos" block

    .. fancybox:: img/YouTube_Selection_068.png
        :alt: Additional videos Youtube block

    4. Open it and press "Save" button


========================
Creating filter by video
========================

    Creating the filters is a standard `CS-Cart functionality <https://docs.cs-cart.com/latest/user_guide/manage_products/filters/index.html>`_.

    Select *Product fields: Products with video* option in the *Filter by* field on creating a filter

    .. fancybox:: img/YouTube_Selection_067.png
        :alt: Filters

++++++++++++++++++++++++++
Managing Product video tab
++++++++++++++++++++++++++

    Creating of the product tabs is a standard `CS-Cart functionality <https://docs.cs-cart.com/latest/user_guide/look_and_feel/tabs/index.html>`_.

    Tab is created after the the add-on is installed

    .. fancybox:: img/YouTube_Selection_063.png
        :alt: Youtube tabs

    .. fancybox:: img/YouTube_Selection_064.png
        :alt: Product tabs

++++++++++++++++++++++++++++++++++++++++++++++
Creating a block with a manual content filling
++++++++++++++++++++++++++++++++++++++++++++++

    .. fancybox:: img/YouTube_Selection_065.png
        :alt: Adding Tab
    
    It is require to know the standard CS-Cart `layout block manager <https://docs.cs-cart.com/latest/user_guide/look_and_feel/layouts/index.html?highlight=layouts>`_.

    1. Create *Youtube block*

    2. Select *Manually* option in the *Filling* field of the Content tab 

    3. Attach Youtube video links in the pickers appeared under the *Filling* field


