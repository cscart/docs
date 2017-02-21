**************************
Block Types and Properties
**************************

.. warning::

    This article may no longer be relevant or up to date. Please :doc:`return to the main page of the section. <index>`

When you create a block, you need to choose a block type and also specify the block properties. The block type defines the type of information that the block contains. Block properties enable you to fine-tune the block to meet your specific requirements. The set of available properties may vary depending on the block type.
After a block has been created, you can edit its properties at any time.

Common properties
*****************

Blocks have the following common properties regardless of their type:

*	**Name** - Name/title of the block as it appears in **Layouts**.
*	**Wrapper** - Template to border the block.
*	**User-defined CSS-class** - Name of a custom CSS-class that you want to use for the block. The CSS-class itself is to be defined in the file *styles.css* located in the theme directory of your CS-Cart installation.

Type-dependent properties
*************************

This is the list of available block types and the applicable type-specific properties:

Banners
-------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   One or more banners that were created in section **Marketing → Banners**.
	*   -   Related add-ons
	    -   `Banners Management <http://docs.cs-cart.com/4.3.x/user_guide/addons/banners_management/index.html>`_
	*   -   Templates
	    -   *	:ref:`Original <original>`
	        *	:ref:`Carousel <carousel>`
	*   -   Content
	    -   Filling

	    	*	:ref:`Manually <manually>`
	    	*	:ref:`Newest <newest>`
	*   -   Block settings
	    -   None

Brands
------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   A list of brands represented in the store. A product brand can be defined as a feature with the **Brand/Manufacturer** type.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Our Brands <our_brands>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   *   :ref:`Do not scroll automatically <do_not_scroll_automatically>`
	        *   Scroll per page
	        *   :ref:`Speed <speed>`
	        *   :ref:`Pause delay (in seconds) <pause_delay>`
	        *   :ref:`Item quantity <item_quantity>`
	        *   Thumbnail width in scroller

Breadcrumbs
-----------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Breadcrumbs, a navigation aid for visitors to keep track of their location on the storefront. Breadcrumbs provide links to the parent pages of the current one.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Breadcrumbs <breadcrumbs>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

Cart content
------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Mini-cart, a summary of the cart contents on a regular storefront page.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Cart content <cart_content>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   *   :ref:`Display bottom buttons <display_bottom_buttons>`
	        *   :ref:`Display delete icons <display_delete_icons>`
	        *   :ref:`Products links type <products_links_type>`

Categories
----------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Hierarchical hyperlinked list of product categories.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Dropdown horizontal <dropdown_horizontal>`
	        *	:ref:`Dropdown vertical <dropdown_vertical>`
	        *	:ref:`Multi-column list <multicolumn_list>`
	        *   :ref:`Text links <text_links>`
	*   -   Content

	    -   *	Filling (depends on the template)
	    
		    	*	:ref:`Manually <manually>`
		    	*	:ref:`Newest <newest>`
		    	*	:ref:`Dynamic tree <dynamic_tree>`
		    	*   :ref:`Full tree <full_tree>`
		    	*   :ref:`Rating <rating>`

	        *	Parent category

		        Root element of the hierarchy.

	*   -   Block settings
	    -   None

Checkout
--------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Pieces of information and features that are related to the checkout page.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Order information <order_information>`
	        *	:ref:`Products in cart <products_in_cart>`
	        *	:ref:`Summary <summary>`
	        *   :ref:`Gift certificate <gift_certificate>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

Currencies
----------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   List (text or pictorial) of currencies supported in the store. To manage the list of currencies, use section **Administration → Currencies**.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Currencies <currencies>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   *   :ref:`Text <text>`
	        *   :ref:`Format <format>`
	        *   :ref:`Minimal number if items to be placed in a dropdown list <minimal_items>`

.. note::

	This block type requires commercial license.

Gift certificate verification
-----------------------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Allows customer to validate or redeem a gift certificate.
	*   -   Related add-ons
	    -   `Gift certificates <http://docs.cs-cart.com/4.3.x/user_guide/addons/gift_certificates/index.html>`_
	*   -   Templates
	    -   :ref:`Gift certificate verification <gs_verification>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

.. note ::

	This block type requires commercial license.

HTML block
----------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Custom HTML content.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`HTML block <html_block>`
	*   -   Content
	    -   Box with custom HTML content.
	*   -   Block settings
	    -   None

HTML block with Smarty support
------------------------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Custom HTML/Smarty content.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`HTML block with Smarty support <html_block_smarty>`
	*   -   Content
	    -   Box with custom HTML/Smarty content.
	*   -   Block settings
	    -   None

Languages
---------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Language selector.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Languages <languages>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   *   :ref:`Text <text>`
	        *   :ref:`Format <format>`
	        *   :ref:`Minimal number if items to be placed in a dropdown list <minimal_items>`

.. note ::

	This block type requires commercial license.

Menu
----

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   A custom menu created in **Design → Menus**.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Dropdown horizontal <dropdown_horizontal>`
	        *	:ref:`Dropdown vertical <dropdown_vertical>`
	        *	:ref:`Text links <text_links>`
	*   -   Content
	    -   A custom menu created in **Design → Menus**.
	*   -   Block settings
	    -   None

My account
----------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Links to a page with the customer's account details.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`My account <my_account>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None


Pages
-----

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Hierarchical hyperlinked list of static pages.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Dropdown horizontal <dropdown_horizontal>`
	        *	:ref:`Dropdown vertical <dropdown_vertical>`
	        *	:ref:`Text links <text_links>`
	*   -   Content
	    -   *	Filling
	    
		    	*	:ref:`Manually <manually>`
		    	*	:ref:`Newest <newest>`
		    	*	:ref:`Dynamic tree <dynamic_tree>`
		    	*   :ref:`Full tree <full_tree>`
		    	*   :ref:`Neighbours <neighbours>`

	        *   Parent page

	            Root element of the hierarchy.

	*   -   Block settings
	    -   None

Payment methods
---------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Icons that represent the available payment methods in the store.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Payments <payments>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

Polls
-----

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   One or several polls created in **Website → Content**.
	*   -   Related add-ons
	    -   `Polls <http://docs.cs-cart.com/4.3.x/user_guide/addons/polls/index.html>`_
	*   -   Templates
	    -   *	:ref:`Central <central>`
	        *	:ref:`Side box <side_box>`
	*   -   Content
	    -   *	Filling

	        	*	:ref:`Manually <manually>`

	*   -   Block settings
	    -   None

.. note ::

	This block type requires commercial license.

Product filters
---------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Filters to find products against specific parameters.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Original <original>`
	*   -   Content
	    -   *	Filling

	    		*	:ref:`Manually <manually>`
	*   -   Block settings
	    -   None

Products
--------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   One or more products from the product catalog.
	*   -   Related add-ons

	    -  *	`Bestsellers & on sale products <http://docs.cs-cart.com/4.3.x/user_guide/addons/bestsellers_and_on_sale_products/index.html>`_
	       *	`Customers also bought <http://docs.cs-cart.com/4.3.x/user_guide/addons/customers_also_bought/index.html>`_
	*   -   Templates
	    -   *	:ref:`Grid <grid>`
	        *	:ref:`Grid 2 <grid_2>`
	        *	:ref:`Links thumb <links_thumb>`
	        *   :ref:`Multicolumns small <multicolumns_small>`
	        *   :ref:`Products <products>`
	        *   :ref:`Products2 <products_2>`
	        *   :ref:`Products grid <products_grid>`
	        *   :ref:`Scroller <scroller>`
	        *   :ref:`Side box first item <side_box_first_item>`
	        *   :ref:`Short list <short_list>`
	        *   :ref:`Small items <small_items>`
	        *   :ref:`Text link <text_links>`
	        *   :ref:`Without image <without_image>`
	*   -   Content
	    -   *	Filling
	    
		    	*	:ref:`Manually <manually>`
		    	*	:ref:`Newest <newest>`
		    	*	:ref:`Recently viewed <recently_viewed>`
		    	*   :ref:`Most popular <most_popular>`
		    	*   :ref:`Also bought <also_bought>`
		    	*   :ref:`Bestsellers <bestsellers>`
		    	*   :ref:`Rating <rating>`
		    	*   :ref:`On sale <on_sale>`
		    	*   :ref:`Similar <similar>`

	*   -   Block settings
	    -   :ref:`Hide add to cart button <hide_add_to_cart_button>`

Recent posts
------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Blog posts that were created in section **Website → Blog**.
	*   -   Related add-ons
	    -   Blog
	*   -   Templates
	    -   *	:ref:`Blog: recent posts <blog_recent_posts>`
	        *	:ref:`Blog: recent posts scroller <blog_recent_scroller>`
	        *	:ref:`Blog: text links <blog_text_links>`
	*   -   Content
	    -   *	Filling
	    
		    	*	:ref:`Blog: recent posts <filling_blog_recent_posts>`
		    	*	:ref:`Blog: recent posts scroller <blog_recent_posts_scroller>`
		    	*	:ref:`Blog: text links <filling_blog_text_links>`

	        *   Period

	            Choose whether posts published "Today", "Last days", or at ''Any date"' appear in the block.

	        *   Last days

	            Number of days in the *Last day* option of the *Period* setting.

	        *   Limit

	            Choose, how many posts can be displayed in the block.

	        *   Parent page

	            Choose a page whose child posts appear in the block.

	*   -   Block settings
	    -   *   :ref:`Limit <limit>`
	        *   :ref:`Do not scroll automatically <do_not_scroll_automatically>`
	        *   :ref:`Speed <speed>`
	        *   :ref:`Pause delay (in seconds) <pause_delay>`
	        *   :ref:`Item quantity <item_quantity>`
	        *   Outside navigation

RSS feed
--------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Regular RSS feed icon. A visitor clicks the icon and adds the store RSS feed to his or her RSS reader.
	*   -   Related add-ons
	    -   `RSS Feed <http://docs.cs-cart.com/4.3.x/user_guide/addons/rss_feed/index.html>`_
	*   -   Templates
	    -   *	:ref:`Icon <icon>`
	*   -   Content
	    -   *	Filling
	    
		    	*	:ref:`Products <filling_products>`
		    	*	Posts (only since version 4.3.8 and only if the :doc:`Blog <../../../addons/blog/index>` add-on is active)

		*	Parent page (available for the **Posts** filling type only)

	        *	Sort by (available for the **Products** filling type only)

		    	*   Created
		    	*   Updated

	        *	Other (available for the **Products** filling type only)

		    	*   Display SKU
		    	*   Display image
		    	*   Display gross price
		    	*   Display net price
		    	*   Display add to cart button

	*   -   Block settings
	    -   *   :ref:`Number of items <number_of_items>`
	        *   :ref:`Feed title <feed_title>`
	        *   :ref:`Feed description <feed_description>`

.. note ::

	This block type requires commercial license.

Shipping methods
----------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Icons that represent the available shipping methods in the store.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   :ref:`Shippings <shippings>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

Store locator
-------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   Box showing the location of your store on Google map.
	*   -   Related add-ons
	    -   `Store Locator <http://docs.cs-cart.com/4.3.x/user_guide/addons/store_locator/index.html>`_
	*   -   Templates
	    -   :ref:`Store Locator <store_locator>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None

.. note ::

	This block type requires commercial license.

Tags
----

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   List of product and category tags.
	*   -   Related add-ons
	    -   `Tags <http://docs.cs-cart.com/4.3.x/user_guide/addons/tags/index.html>`_
	*   -   Templates
	    -   :ref:`Tag cloud <tag_cloud>`
	*   -   Content
	    -   *	Filling
	    
		    	*	:ref:`Tag cloud <filling_tag_cloud>`

	        *	Limit

		    	*	Maximum number of items in the list.

	*   -   Block settings
	    -   None

Template
--------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   A collection of various templates that represent different controls and pieces of information.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Authentication information <auth_information>`
	        *	:ref:`Feature comparison <feature_comparison>`
	        *	:ref:`Store logo <store_logo>`
	        *   :ref:`My account links <my_account_links>`
	        *   :ref:`Payment systems icons <payment_systems_icons>`
	        *   :ref:`Profile information <profile_info>`
	        *   :ref:`Quick links <quick_links>`
	        *   :ref:`Search field <search_field>`
	        *   :ref:`Shipping estimation <shipping_estimation>`
	        *   :ref:`Newsletter subscription form <newsletter_subscription>`
	        *   :ref:`The 404 Not Found error message <404_error>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   None
	    
Testimonials
------------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   List of testimonials left by the store customers.
	*   -   Related add-ons
	    -   `Comments & Reviews <http://docs.cs-cart.com/4.3.x/user_guide/addons/comments_and_reviews/index.html>`_
	*   -   Templates
	    -   *	:ref:`Testimonials <testimonials>`
	*   -   Content
	    -   Automatic
	*   -   Block settings
	    -   *   :ref:`Limit <limit>`
	        *   :ref:`Random <random>`

.. note ::

	This block type requires commercial license.

Vendors
-------

.. list-table::
	:header-rows: 0
	:stub-columns: 1
	:widths: 10 35

	*   -   Description
	    -   List of active product vendors.
	*   -   Related add-ons
	    -   None
	*   -   Templates
	    -   *	:ref:`Vendors <vendors>`
	*   -   Content
	    -   *	:ref:`All <all>`
	        *   :ref:`Manually <manually>`
	*   -   Block settings
	    -   :ref:`Displayed vendors <displayed_vendors>`

.. note ::

	This block type is available in Multi-Vendor.
