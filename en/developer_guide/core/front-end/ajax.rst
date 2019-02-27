*******************
Using AJAX Requests
*******************

AJAX is a technology that allows updating page content without reloading the page. CS-Cart uses AJAX very extensively.

AJAX Basics in CS-Cart
======================

CS-Cart uses its own extensions for the jQuery ajax method. They reside in the *js/tygh/ajax.js* file. Here are these methods in the order they are called:

* ``submitForm`` (only for forms)—extracts form data and prepares it for sending.

* ``request``—sends an AJAX request to the respective controller (parsed from dispatch). Uses jQuery ajax method.

* ``response``—called upon the successful execution of a request. Handles the actual server response and displays the result.

* ``inProgress``—determines whether or not the AJAX request is in progress.

* ``clearCache``—clears response cache.

During the processing of an AJAX request on the server, the initialization of the AJAX request handling subsystem is performed by the ``fn_init_ajax`` (*app/functions/fn.init.php*) function:

* an object of AJAX class (*app/Tygh/Ajax.php*) is created; 

* it performs necessary transformations before and after AJAX request;

* it also generates JSON array for further transfer to ``response``.

The *AJAX_REQUEST* constant is set to *true* for its use in PHP code.

Using the *AJAX_REQUEST* constant in a PHP file, you can specify the code that must be executed only on AJAX request.

**Example**::

  if (defined('AJAX_REQUEST')) { fn_set_notification('E', fn_get_lang_var('warning'), $msg, true, 'insecure_password'); }

When the execution of the AJAX request script is completed or when the termination function ``exit()`` is called explicitly, the destructor of AJAX class (*app/Tygh/Ajax.php*) is executed. The destructor passes the information that should be displayed in the document to a JSON array, and then passes the array to the ``response`` JS function (*/js/tygh/ajax.js*).

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

AJAX requests can be sent by links and forms. In both cases, the ``cm-ajax`` microformat should be assigned to the respective element.

Forms
-----

If a form has class ``cm-ajax``, its content will be sent as an AJAX request to the URL defined in its action attribute.

Such a form should also have a hidden input element named ``result_ids``. It should contain the identifiers of the elements to be updated with the AJAX data.

Here is the example of an AJAX-powered form::

  <!-- Form with the class cm-ajax; defines that AJAX requests should be sent to index.php -->
  <form class="cm-ajax" action="index.php" method="post" name="product_form_817">

  <!-- Hidden input field with the identifiers of the HTML elements to be updated -->
      <input type="hidden" name="result_ids" value="my_id" />
      ...
      
  <!-- When this submit button is clicked, an AJAX request will be sent to index.php -->
       <input id="button_cart_817" type="submit" name="dispatch[checkout.add..817]" value="Add to cart" />
      ...
  </form>

Links
-----

A link with class ``cm-ajax`` will send an AJAX-request to the URL specified in its ``href`` attribute when clicked.

The IDs of the elements to be updated should be specified in the ``data-ca-target-id`` attribute.

Example of an AJAX-powered link::

  <a class="cm-ajax" data-ca-target-id="cart_items,checkout_totals,cart_status*,checkout_steps,checkout_cart" href="{""|fn_url}"><i class="icon-cancel-circle"></i></a>

Additional Microformats
-----------------------

The ``cm-ajax`` microformat is mandatory for AJAX forms and links. But there are many optional :doc:`microformats <microformats>` that give developers more control over AJAX in CS-Cart. 

Using AJAX Requests Directly
============================

Explicit method calling is not recommended by CS-Cart coding guidelines. All JavaScript functions should be placed in separate files and assigned to HTML elements using CSS selectors (id, class etc.).

Still, an AJAX request can be sent via the direct inline calling of the ``$.ceAjax()`` method::

  <input id="enable_block_1" type="checkbox" name="enable_block_1" value="Y" onclick="$.ceAjax(‘request’, '{$index_script}?dispatch=block_manager.enable_disable&amp;block_id=1&amp;enable=' + (this.checked ? this.value : 'N'), {literal}{method: 'POST', cache: false}{/literal});" />

Reloading Containers via AJAX
=============================

You can reload the content of a container dynamically as follows:

* Submit a form with the ``cm-ajax`` class and the ``result_ids`` element in it (see :doc:`the article about microformats <microformats>`).

* Use a link with the ``cm-ajax`` class and ``data-ca-target-id`` attribute (see :doc:`the article about microformats <microformats>`).

* Make a custom request via ``$.ceAjax()``.

The container must be formatted properly:

* ``id`` must be the last attribute in the opening tag.

* A "magic comment" with the ``id`` must precede the closing tag.

For example:

.. code-block:: html

    <div class="foo" data-ca-bar="bar" id="foobar">
        This content will be reloaded by AJAX
    <!--foobar--></div>
