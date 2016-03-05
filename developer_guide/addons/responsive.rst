****************************************
Adapting Add-ons to the Responsive Theme
****************************************

Starting from CS-Cart version 4.1.4 the new Responsive theme is used (in beta testing). One of the reasons why it operates in beta testing mode is that this gives the developers enough time to adapt their add-ons by the time the theme becomes the default.

Further we will describe how to migrate your add-on to the Responsive theme.

.. note::

	Note: Only the customer area look will be touched by these changes (the *design/themes* directory of the CS-Cart installation).

Copy files
==========

Open the directory with your add-on files, find the *themes_repository/basic* directory (most probably in the *var* directory) and make its copy in the same directory. Rename the copy to *themes_repository/responsive*. When you install the add-on, its appearance for the basic theme will be defined by the files from the *themes_repository/basic* directory. For the responsive theme - by the files from the *themes_repository/responsive* directory.

Replace *.css* with *.less*
===========================

Rename the add-on styles *.css* file to the *.less* file. For example, if you had the *styles.css* file, rename it to *styles.less*. Do not forget to replase *.css* with *.less* in all files, where your styles are called back. In most cases it will be the *styles.post.tpl* file in the *themes_repository/responsive/templates/addons/MYADDON/hooks/index/ directory*. Where MYADDON is the name of your add-on.
It is possible to use the *.css* files too, but it is reccomended to use *.less* to prevent the disorder when including files.

Add-on html tags
================

Check if your add-on works fine with the new theme. Make sure that your add-on html tags are correctly implemented in the Responsive theme markup (table tags should be included in table and not in div). It is possible to check this with the browser dev tools or directly in the file, where a hook is included.

A list of hooks to be checked:

*	``products:product_multicolumns_list``
*	``products:products_multicolumns_extra``
*	``products:product_compact_list``
*	``index:cart_status``
*	``wishlist:view``

Removed templates
=================

There are some templates that were removed from the Responsive theme. Check whether your add-on uses hooks in these templates. A list of templates that ware removed:

*	*small_list.tpl*
*	*products_grid.tpl*
*	*products2.tpl*
*	*grid_list2.tpl*
*	*first_item.tpl*
*	*products_bar.tpl*
*	*without_image.tpl*

You can remove the hook files (for example, *product_grid_list2.override.tpl* for *grid_list2.tpl*) that are used in these templates from your add-on.

Changes in classes names
========================

If your add-on uses the theme classes names, you should adapt these names for the Responsive theme.

The styles functionality was changed in the new theme. Now basic styles are stored in a single *styles.less* file, but not in two: *base.css* and *styles.css*. Now the class selectors (``.class``) are widely used in styles (in the basic theme there were many styles with selectors defined by HTML tags).

For example, to define label for an input field in the basic theme, the ``.control-group label`` was used.

In the Responsive theme you should define the ``.ty-control-group__label`` class for label. In this case label will be placed above an input field. If you want label to be placed to the right of an input field, define ``.ty-control-group__title`` for it.

This method gives more flexibility in defining selectors.

As you noticed, the ``ty-`` prefix was added to classes. This prefix was added in order to prevent styles overlap with the styles of another site when using the **Widget mode**. 

That is why it is important to look through classes that are used in templates, where a hook is built in.

Example
"""""""

Let's take the **Reward points** add-on as an example. In the basic theme there is the following code for the ``orders:product_info:`` hook::

	{if $order_info.points_info.price && $product}
    	<div class="product-list-field">
        	<label>{__("price_in_points")}:</label>
       		<span>{$product.extra.points_info.price}</span>
    	</div>
	{/if}

In the Responsive theme this code will look like this::

	{if $order_info.points_info.price && $product}
    	<div class="ty-control-group">
        	<label class="ty-control-group__label">{__("price_in_points")}:</label>
        	<span class="ty-control-group__item">{$product.extra.points_info.price}</span>
    	</div>
	{/if}

Adapting styles
===============

Adapt styles for the new appearance (use the styles *less* variables).
Styles for different screen dimensions are possible to add to the *responsive.less* file. Add the file to *themes_repository/responsive/templates/addons/MYADDON/hooks/index/styles.post.tpl*
  
Do not forget about `Media Queries <http://en.wikipedia.org/wiki/Media_queries>`_ to define different dimensions for different needs.

Example
""""""" 

::

	/* Responsive: Tablet and phone
	=================================================================== */
	@media (max-width: 979px) {
 	   
	}

	/* Responsive: Landscape phone to desktop/tablet
	=================================================================== */

	@media (max-width: 767px) {
	    
	}

Usefull classes for the Responsive theme
========================================

*	Non-table coloumn data were collected in div, and it is possible to use the ``.ty-column[1-10]`` class for coloums. For example, if you need 3 coloumns use ``.ty-column3``. The smaller the screen dimension, the less the coloumns number in a line.

*	Table data are represented by the ``.ty-table class``. For the small dimensions table changes its appearance.

Using the ``<thead>`` and ``<tbody>`` tags is necessary for this class.
