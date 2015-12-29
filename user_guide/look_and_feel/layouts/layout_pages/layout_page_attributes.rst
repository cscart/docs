**********************
Layout Page Properties
**********************

To edit layout page attributes, select a layout page in **Design → Layouts** and click the gear icon on the tab.

A layout page has the following attributes:

General
*******

*	**Dispatch** - Choose a specific page or page type that the layout page will be associated with. Or select *Custom* to define the parameter value manually.

	The *dispatch* parameter has the following format: [controller_name].[mode_name], where [controller_name] – is the name of the controller, and [mode_name] – is the mode in which the controller works. This value is added to *index.php?dispatch=* part of the page and points to a specific layout page. For example, *index.php?dispatch=checkout.cart* points to the cart contents page while *index.php?dispatch=checkout.checkout* points to the checkout page.
	
*	**Name** - Name of the layout page as it appears in Layouts.
*	**Page title** - Title of the page as it appears in the title bar of a browser.
*	**META description** - Contents of the HTML meta tag describing the page.
*	**META keywords** - Contents of the HTML tag containing a list of search keywords for the page.
*	**Custom HTML code** - If you are familiar with HTML, you can add some custom code to the header of the page. This HTML code will be put between *<head></head>* tags.
*	**Default** - If chosen, layout page is picked as default. Its *Top* and *Bottom* containers are used in all locations.
*	**Position** - Position of the layout page in the list of pages.

Once you have finished, click **Save** to apply the changes. 

.. note::

	Some layout pages (**Pages**, **Categories**, **Products**) have an additional tab in their attribute forms. In this tab you can add particular items to which these properties apply.

.. image:: img/layout_page_categories.png
    :align: center
    :alt: The Categories tab