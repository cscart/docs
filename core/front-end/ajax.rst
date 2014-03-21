*******************
Using AJAX Requests
*******************

AJAX is a technology that allows page content updating without the page being reloaded. CS-Cart uses AJAX very extensively.

AJAX in CS-Cart. Basic Concept
==============================

CS-Cart uses its own extensions for the jQuery ajax method. They reside in the */js/ajax.js* file. Here are these methods in the order they are called:

 * ``submitForm`` (form only) - extracts form data and prepares it for sending.
 * ``request`` - sends AJAX-request to a respective controller (parsed from dispatch). Uses jQuery ajax method.
 * ``response`` - called upon “request” successful execution. Responsible for actual server response and result displaying.
 * ``inProgress``- whether if ajax request in progress.
 * ``clearCache`` - clear response cache.

When processing AJAX request on the server, initialization of the AJAX request handling subsystem is performed by the ``fn_init_ajax`` (*/functions/fn.init.php*) function: an object of AJAX class (*/Tygh/Ajax.php*) is created; it performs necessary transformations before and after AJAX request and also generates JSON array for further transfer to ``response``.

The constant *AJAX_REQUEST* is set to true for use in PHP code.

Using the constant *AJAX_REQUEST* in a PHP file you can specify the code that is required to be executed only on AJAX request.

**Example**::

 if (defined('AJAX_REQUEST')) { fn_set_notification('E', fn_get_lang_var('warning'), $msg, true, 'insecure_password'); }

When execution of the AJAX request script is completed or when the termination function ``exit()`` is called explicitly, the destructor of AJAX class (*/Tygh/Ajax.php*) is executed. The destructor passes the information that should be displayed in the document to an array with data in JSON format and then passes the array to the JS function ``response`` (*/js/tygh/ajax.js*).

A controller returns a response in the following format:

.. code-block:: none

    data:
        notifications:
            id:
                text
                title
            id:
                text
                title
            ...
        html:
            block_id:
                block_content
            block_id:
                block_content
            ...

Invoking AJAX with Microformats
===============================

AJAX requests can be sent by links and forms. In both cases the microformat ``cm-ajax`` should be assigned to the respective element.

Forms
-----

If a form has class ``cm-ajax``, its content will be sent to the URL defined in its action attribute as an AJAX request.

Such form should also have a hidden input element named ``result_ids``. It should contain the identifiers of the elements to be updated with the AJAX data.

Here is an example of an AJAX-powered form::

 <!-- Form with the class cm-ajax; defines that AJAX requests should be sent to index.php -->
 <form class="cm-ajax" action="index.php" method="post" name="product_form_817">

 <!-- Hidden input field with the identifiers of the HTML elements to be updated -->
	 <input type="hidden" name="result_ids" value="my_id" />
	 ...
 
 <!-- When this submit button is clicked an AJAX request is sent to index.php -->
	 <input id="button_cart_817" type="submit" name="dispatch[checkout.add..817]" value="Add to cart" />
	 ...
 </form>

Links
-----

A link with class ``cm-ajax`` will send an AJAX-request to the URL specified in its href attribute when clicked.

The ids of the elements to be updated should be specified in the ``rev`` attribute.

Example of an AJAX-powered link::

 <a class="cm-ajax" rev="content_usergroups" href="{"profiles.request_usergroup?usergroup_id=`$usergroup.usergroup_id`&amp;status=`$ug_status`"|fn_url}">{$_link_text}</a>

Additional microformats
-----------------------

The microformat ``cm-ajax`` is mandatory for AJAX-forms and links. But there are many optional microformats that give developer more control over AJAX in CS-Cart. 

.. You can find the full detailed list of such microformats in the Appendix -> List of Microformats.

Using AJAX request Directly
===========================

Explicit method calling is not recommended by CS-Cart coding guidelines. All JavaScript functions should be placed in separate files and assigned to HTML elements using CSS selectors (id, class etc.).

Although, AJAX request can be sent the direct inline calling of the ``$.ceAjax()`` method::

 <input id="enable_block_1" type="checkbox" name="enable_block_1" value="Y" onclick="$.ceAjax(‘request’, '{$index_script}?dispatch=block_manager.enable_disable&amp;block_id=1&amp;enable=' + (this.checked ? this.value : 'N'), {literal}{method: 'POST', cache: false}{/literal});" />