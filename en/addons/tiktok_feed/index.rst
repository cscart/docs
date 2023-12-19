*************
TikTok Feed
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.cs-cart.com/tiktok-feed.html" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    Promote your products and brand, increase conversion of your site, attract new clients and bring your business to the new level by broadcasting TikTok videos on your storefront. The TikTok add-on provides integration of your account in one of the most popular social networks with your CS-Cart store. Growing fast, attracting a new and popular public and creating new trends TikTok has proven a valuable and  useful asset in the ecommerce field, and the format of its videos fits perfectly for promotion of your brand and products. Share news and videos, interact with your clients, promote your brand and products with TikTok Feed addon. 

    .. fancybox:: img/Tiktok1.png
        :alt: Tiktok Feed

    Share your videos on the storefront

    .. fancybox:: img/Tiktok2.png
        :alt: Tiktok Feed

    Overview your products with TikTok

    .. fancybox:: img/Tiktok3.png
        :alt: Tiktok Feed

========
Features
========

	* Integration of your TikTok Account
	* Available for admin and vendors
	* Demonstrate videos on Home, Product and Vendor Pages

=============
Compatibility
=============

	The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. 
    Minimum required PHP version is 7.1.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the TikTok Feed add-on in our |demo_store|.

    .. |demo_store| raw:: html

       <!--noindex--><a href="https://tiktok-feed.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

    .. note::

        Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Delivery Date add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

++++++++++++++++++++
Block TikTok Feed
++++++++++++++++++++

	**Managing the Block**

	TikTok Feed Block can be created with Block Manager.

	.. fancybox:: img/Tiktok4.gif
		:alt: TikTok Feed Block

	Following block filling options are available:

	* Manually. Posts are fixed to the picker on Content tab of the block settings;

	* Product. Posts are taken from the relevant tab in the Product settings;

	* Company. Posts are taken from the relevant tab in the Vendor settings.

	The following Block display templates are available: 

	* Grid. Template display posts as an adjustable grid. Number of columns will be calculated automatically in accordance with the Item Width option of template settings. 
		*Template Settings:*
			* Item width - sets the minimal width of the list element.

	* Scroller.  This template uses default Owl-Carousel.
		*Template settings:*
			* Navigation: Dots, Arrows, Dots and arrows - Sets navigation options in block;
			* Do not scroll automatically;
			* Scroll per page;
			* Speed;
			* Pause delay (in seconds);
			* Item quantity.

	**Block Settings:**
	
	Following settings of the block are available:
	
	* Block background color - Set the background color of the block

	* Post background color - Set the background color of the post

	* Text color - set the color of the text

	* Compress image - add image compression

	* Show provider - add TikTok logo display

	* Show author - display author of the post

	* Show description - display description of the post.

	* Use quick view - open post in Quick View modal window (without redirect from the page), instead of opening it in TikTok.

+++++++++++++
Product Posts
+++++++++++++

	**Managing**

	Posts and their display settings can be managed in the Post Picker on the TikTok Feed tab, provided by the add-on in the Product setting page (dispatch=products.update&product_id=1) on the Admin Panel.

	.. fancybox:: img/Tiktok5.png
		:alt: Admin Panel

	.. fancybox:: img/Tiktok6.png
		:alt: Vendor Panel

	**Storefront**

	Content will be displayed on product tabs of the "Product Information" page.

	.. fancybox:: img/Tiktok7.png
		:alt: Product page

	Content can be displayed via the "TikTok Feed" block with the "Product" filling, if product_id parameter is present on the page.

	.. fancybox:: img/Tiktok8.png
	    :alt: Product page block

	**Additional**

	If the TikTok Feed tab in product settings is disabled, the TikTok feed tab on the product page on the storefront is unavailable. 

	Add-on functionality is unavailable for vendors, if it is limited in Vendor plan by the standard "Vendor Plan" add-on.

	.. fancybox:: img/Tiktok9.png
	    :alt: Additional

++++++++++++
Vendor Posts
++++++++++++

	**Managing**

	Posts and their display settings can be managed in the Post Picker on the TikTok Feed tab, provided by the add-on in the Vendor setting page (dispatch=companies.update&company_id=1) on the Admin Panel.

	.. fancybox:: img/Tiktok10.png
		:alt: Vendor Posts

	**Storefront**

	Content will be displayed on product tabs of the "Product Information" page (dispatch=companies.view&company_id=1).

	.. fancybox:: img/Tiktok11.png
		:alt: Vendor Storefront

	Content can be displayed via the "TikTok Feed" block with the "Product" filling, if company_id parameter is present on the page.

	**Additional**

	Add-on functionality is unavailable for vendors, if it is limited in Vendor plan by the standard "Vendor Plan" add-on.

	.. fancybox:: img/Tiktok9.png
		:alt: Additional

	The TikTok Feed tab on the Vendor Information page (dispatch=companies.view&company_id=1) will be unavailable, if "Show TikTok feed tab on sales page" setting is disabled in add-on settings.

+++++++++++++++++++++++
TikTok Feed Product Tab
+++++++++++++++++++++++

	When the add-on is installed, automatically created TikTok Feed product tab will be available on the admin panel on dispatch=tabs.manage page. Tab management and display is provided by the default cs-cart functionality. Tab is filled with content of "TikTok Feed" block with "Product" filling and its own settings.

++++++++++++++++++++++++++
TikTok Feed and Quick View
++++++++++++++++++++++++++

	Feed can be applied, in case "Use quick view" option is active in the relevant block

	**Storefront**

	On the first opening of the feed (click on any post), post list transfers the posts to be displayed in the feed.

	Opened feed will be scrolled down to the selected post. Feed can be scrolled with a mouse scroll wheel, and closed by click on a background or a cross icon.

	Content of each post will be loaded in a row. Content will be uploaded from TikTok once the post appears on the screen.

	.. fancybox:: img/Tiktok12.png
		:alt: Feed

++++++++++++++++++++
TikTok Product Label
++++++++++++++++++++

	In case at least one TikTok post is applied to the product, the TikTok label will automatically be applied to this product.

	Function will be unavailable, when “Apply the product label” option is disabled in the add-on settings