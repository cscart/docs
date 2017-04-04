**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.5.2
**********************************************

==============
Common Changes
==============

#. A new microformat was added; it serves to load data part by part when scrolling. To use the microformat, include the **js/tygh/infinite_scroll.js** script and add two containers in the template:

   * The first container is a ``<div>`` that sets the permanent height for the area where scrolling will take place. This ``<div>`` must have the following parameters:
    
     * ``class="cm-scroll-data"``—the class that adds scrolling.

     * ``id="{id}"`` (for example, ``id="my_scroll"``)—the scrolling identifier that serves to distinguish blocks with scrolling from each other. Each block with scrolling must have its own ``{id}``, and each ``{id}`` must be unique within the template.

     * ``data-ca-target-id="X"``—the identifiers of the blocks to be updated.

   * The second container (for example, ``<div>`` or ``<tbody>``) is located within the first container. The second container includes the data that will be loaded in parts. This container must have the following parameters:

     * ``class="cm-scroll-content cm-ajax"``

       * ``cm-scroll-content`` serves to load the next part of data when scrolling.

       * ``cm-ajax`` enables updating the block's content via AJAX.

     * ``id="X"``—the identifier of the block that is updated.

   The blocks that have the following IDs will be hidden during scrolling: 

   * head_scroll_{id} (for example, ``head_scroll_my_scroll``) — the header of the table.

   * total_scroll_{id} (for example, ``total_scroll_my_scroll``) — the "Total" line of the table.

#. A new microformat was added to load data via AJAX when switching between tabs. The data for each tab is only loaded once; when you open a tab again, the previously loaded data will be displayed. 

   To use the microformat, include the **js/tygh/tabs.js** script and add the ``ajax_onclick = true`` parameter to the part of your code which adds tabs. This parameter will add the ``cm-ajax-onclick`` class to your tabs.

#. CSRF validation is now performed for the ``newsletters.add_subscriber`` controller in the customer area.

#. CSRF validation is now performed for the ``em_subscribers.update`` controller in the customer area.

#. Add-ons: Social login: HybridAuth library was updated to version 2.9.1

============
Hook Changes
============

---------
New Hooks
---------

This hook allows you to require CSRF validation in certain cases::

   fn_set_hook('csrf_validate_request_pre', $params, $validation_required);

==============
Core Functions
==============

-------------
New Functions
-------------

#. Get the parameters for endless scrolling::

     fn_get_scrolling_parameters($params)

#. Get the data for the "Total" line of a sales report::
 
     fn_get_order_totals($table)

#. Get the maximum value (quantity, or the amount of money) of any interval related to a sales report::

     fn_get_max_value_report_interval($report, $table_id) 

-----------
New Classes
-----------

#. ``\Tygh\Enum\ProductOptionTypes``—enumeration of product option types.

#. ``\Tygh\Domain\SoftwareProduct\Version``—the methods for working with the product version (for example, for comparing version numbers).

-----------------
Changed Functions
-----------------

#.

  :: 

    // old:
    fn_get_order_reports($view = false, $report_id = 0)

    // new:
    fn_get_order_reports($view = false, $report_id = 0, $table_id = 0, $params = array())

#.

  :: 

    // old:
    fn_get_logo_image_path($logo_image, $type, $style_id)

    // new:
    fn_get_logo_image_path($logo_image, $type, $style_id, $theme_name = '')
