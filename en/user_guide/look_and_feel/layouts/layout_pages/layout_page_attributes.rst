**********************
Layout Page Properties
**********************

To configure a layout page, select it in **Design → Layouts** and click the **gear** icon next to its name.

.. image:: img/configure_layout_page.png
    :align: center
    :alt: Edit layout page properties.

Any layout page has the following attributes:

* **Dispatch**—choose a specific page or page type that the layout page will be associated with. Or select *Custom* to define the parameter value manually.

  The *dispatch* parameter has the following format: ``[controller_name].[mode_name]``.

  * **[controller_name]**—the name of the PHP controller.

  * **[mode_name]**–the mode in which the controller works. 

  This value is added after ``index.php?dispatch=`` and points to a specific page. For example, *index.php?dispatch=checkout.cart* points to the cart contents page; *index.php?dispatch=checkout.checkout* points to the checkout page.
	
* **Name**—the name of the layout page.

* **Page title**—the title of the page as it appears in the title bar of a browser.

* **META description**—the content of the HTML meta tag describing the page.

* **META keywords**—the content of the HTML tag containing a list of search keywords for the page.

* **Custom HTML code**—if you are familiar with HTML, you can add some custom code to the header of the page. This HTML code will be put between *<head></head>* tags.

* **Default**—if ticked, this layout page will be marked as default. Its **Top** and **Bottom** containers will be used in all locations.

* **Position**—the position of the layout page in the list of pages.

Once you are done, click **Save** to apply the changes. 

.. note::

    Some layout pages have an additional tab, like **Pages**, **Categories**, **Products**. Those tabs allow to apply the layout page to specific categories, products, or pages. 

.. image:: img/layout_page_categories.png
    :align: center
    :alt: The Categories tab of the layout page properties.
