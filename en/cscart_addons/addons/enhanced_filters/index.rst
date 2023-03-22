****************
Enhanced Filters
****************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/enhanced-filters.html" class="btn buy-now__btn">Buy now</a>
    </div>
 

.. contents::
    :local:
    :depth: 2


--------
Overview
--------
	Bring the filter system of your store to the new level with the new solution. Enhanced Filters add-on is an extended version of the filters build solution for cs-cart based marketplaces. The add-on allows to create the most comfortable, fit and easy-to-use filters of your store. Templates, options and functions, added by the Enhanced Filters are meant to increase the user experience and advance the user interface of your store, so no product would be lost among dozens of other ones. Customize your filters to promote similar by features products.

========
Features
========
	* Style displayed filters template is added for the Filters block

	* Ability to change filter component colors with add-om settings is added

	* Mobile version: filters transform into the pop-up panel, located next to the product marking block and activated on hover

	* Ability to display filter labels in tag style is added (buttons are aligned in a row with a line break)

	* Ability to hide the disabled filters is added 

	* Filters can be displayed as switchers (suitable for such options as Yes/No, On/Off)

	* Several filters are displayed as switchers on the page margin. 

	* Such filters are:

		* In Stock

		* Free shipping

		* Rating 4+ (Cs-cart 4.13.1 - Add-on Product Reviews)

		* Product with video (Add-on: Youtube Video Gallery [new version])

	* “Descriptions” displayed on the popup on hover (as a tooltip) can be added to filters

	* Tags added by the Tags add-on can also be filtered

	* Limited number of filters can be displayed on the page, the rest of filters can be hidden in the popup menu

	* Multilevel filters

	* Apply filters displayed outside the pop-up panel by pressing "Apply" button

	* Vertical and Horizontal filter display options

.. note::
	The Switcher-type filters don't include tooltip texts.

=============
Compatibility
=============

	The add-on is compatible with CS-Cart and Multi-Vendor 4.12 and above. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

.. important:: 
	**UniTheme2**:
	The **Horizontal list** template doesn't display the filter variations dropdown list correctly.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Enhanced Filters add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://enhanced-filters.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

===
FAQ
===

	* *I had changed the filter type in settings, however the filter template was changed on the storefront.*

	 You need open **Administration -> Storage -> Clear cache**. CS-Cart software saves the cache for previous templates in order to optomize a website perfomance. 

	* *How will the Vendor Locations filters be displayed?* 

	 The dispplay of the Vendor Locations filters is related to the theme settings. An example of the defalut display you can find `here <https://docs.cs-cart.com/latest/user_guide/addons/vendor_locations/index.html?>`_.


---------------------------
Managing in the admin panel
---------------------------

=========================
How to install the add-on
=========================

	1. Open *Add-ons → Manage* add-ons page via the main menu

	2. Click ➕  button to upload and install the add-on

	3. Upload the add-on archive

	4. Find the *Enhanced Filters* add-on in the list and make sure that it's status is Active

	5. Click on the add-on title to open its settings

	6. Fill in the license key  

	7. Click the Save button in the bottom of the modal window

======================================
How to display the new filter template
======================================

	1. Open *Design → Layouts* page via the main menu

	2. Select **Categories** in the pages list (*categories.view*)

	.. fancybox:: img/ef1.png
		:alt: Categories tab 

	3. Find filters block among the suggested ones and press the  ⚙️ button

	.. fancybox:: img/ef2.png
		:alt: Filters block 

	4. In a Template field, select one of the available option: Vertical list or Horizontal list

	.. fancybox:: img/ef3.png
		:alt: Templates

	Horizontal list template:

	.. fancybox:: img/ef64.png
		:alt: Horizontal template	

	Vertical list template:

	.. fancybox:: img/ef65.png
		:alt: Vertical template

	5. Press *Settings* button next to the *Template* option and configure the template 

	.. fancybox:: img/ef6.png
		:alt: Template configuration

=========================
How to add the tag filter
=========================

	1. Open the *Products → Filters* page 

	2. Create a new filter with  ➕ (in the upper right corner) button, by selecting the *Tags* variant (in the *Product fields* paragraph) in the option *Filter by*

===================================
How to display filter as a switcher
===================================

**For filters by product features**
	
	1. Open the *Products → Features* page

	2. Open the settings page by clicking on the filter title

	3. Select *Product search via filters* in the *Purpose* option

 	4. Select *Switcher*  in the *Filter type* option 

**For filters by product field (in stock, free shipping, etc)**
	
	1. Open Products → Filters page

	2. Create a new filter by clicking ➕ (in the upper right corner) button, and select the variant from the reserved list in Filtered by option

.. note:: Filter is displayed as a switcher by default.

===============================
How to add a multilevel filters
===============================

	1. Open the *Products → Filters* page

	2. Create a new filter by clicking ➕ (in the upper right corner) button, and fill in the trace to the other (parenting) filter in *Parent filter* and *Parent filter value* options
