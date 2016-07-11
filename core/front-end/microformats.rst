************
Microformats
************

Microformat is a specific CSS style intended for determining JavaScript code that should be executed in a specified event of the html element to which a particular microformat is assigned.

All microformats of the program are named as follows (this should be observed when defining new microformats): ``cm-new-microformat-name``. Prefix ``cm-`` (CS-Cart microformat) indicates that this CSS style is a microformat. Unlike standard CSS styles, a microformat description is located in JavaScript files, not in CSS files. To search JS code that processes a cetain microformat it is necessary to make a search by the substring ``.hasClass('cm-microformat-name')`` in all files within the directory */js/*.

Forms
=====

Field validation
----------------

Usage::

 <label class="cm-email cm-required" for="elm_id">Field name:</label>
 <input type="text" name="test" value="Y" id="elm_id" />

Element label, assigned to the validated element with parameter ``for``, is required for validator of the form fields.

Microformat of the field validation is defined in the class attribute of the element ``label``, and classes can be combined. The label, even if it is hidden, must have a description, as this description is used in the message about the incorrectly entered field. Within these messages the following placeholders can be used:

**[field]** - replaced by a label description, if one parameter is passed to the message generation function, for example::

 var msg = 'The field [field] is not valid';
 this.form_message(msg, lbl);

**[field1],** **[field2]** - replaced by a description of main and additonal labels, if two parameters are passed to the message generation function, for example::

 var msg = 'The field [field1] do not match field [field2]';
 this.form_message(msg, lbl1, lbl2);

**[extra]** - additional data that is to be displayed in the message::

 var msg = 'The field [field] should be set to the following format: [extra]';
 var extra = '1AB-CF5';
 this.form_message(msg, lbl, null, extra);

* ``cm-required`` - the element is required to be filled out. If assigned to a check box, the check box is to be checked.
* ``cm-email`` - the element value must be a valid e-mail address.
* ``cm-confirm-email`` - necessarily assigned to a pair of elements, the second of which is to have the same ID as the first one, but with the prefix ``confirm_``. It checks whether the values of these fields are valid e-mail addresses and are the same.
* ``cm-phone`` - the element value must be a valid telephone number.
* ``cm-zipcode`` - the element value must be a valid zip code (every country has its own zip code format, so the pattern is to be defined in the country table, but so far manually - the array ``zip_validators``).
* ``cm-value-integer`` - assigned to a form element (input, textarea, etc.). Checks if the element value is a valid integer number while it is being filled.
* ``cm-value-decimal`` - assigned to a form element (input, textarea, etc.). Checks if the element value is a valid decimal float-point number while it is being filled.
* ``cm-integer`` - the element value must be an integer.
* ``cm-password`` - necessarily assigned to a pair of elements, their values must be the same.
* ``cm-multiple`` - at least one value of the element select is to be selected.
* ``cm-all`` - selects all options of the element select before sending a form.
* ``cm-custom`` - a validator defined by a user. Also requires to indicate the validation function (returns *true* if no error occurred and an error text otherwise).

Example::	

 <label for="a" class="cm-custom (check)"><input type="input" id="a" value="" />
 <script type="text/javascript">
 
     function fn_check(id)
     {
         return (1 == 1) ? true : 'Not valid';
     }
 </script>

The function accepts only one parameter - ID of the validated element.

* ``cm-regexp`` - checks the value for consistency with the regular expression. It is required that the regular expression is defined in the regexp global array with the element ID.
* ``cm-numeric`` - checks whether the value is a number with the help of autoNumeriс plugin. Plugin documentation: `http://www.decorplanit.com/plugin/ <http://www.decorplanit.com/plugin/>`_

Example::

 <label for="a" class="cm-regexp"><input type="input" id="a" value="" />
 <script type="text/javascript">
     regexp['a'] = {regexp: "^[A-Za-z]+$", message: "Please, use only alphabetical signs"};
 </script>

Form processing
---------------
::

 <form class="cm-ajax">
 </form>

The microformat is defined by CSS class of the tag form. Classes can be combined.

* ``cm-form-highlight`` - turns on highlighting of this form (only for the admin panel).
* ``cm-ajax`` - the form will be sent by AJAX. For the correct work there should be a hidden element with the name ``result_ids``::

  <input type="hidden" name="result_ids" value="id1, id2" />

* ``cm-ajax-full-render`` - can be used only with ``cm-ajax``. Forces the whole page to be reloaded (with footer and top menu).
* ``cm-no-ajax`` - if this class is assigned to the submit button of the form, then when clicking on the button, the form will be sent in an ordinary way, even if the class ``cm-ajax`` is assigned to the form.

The events are used for pre/post AJAX-form submission. To declare the event, use the following rules:

  * Pre-call: ``'ce.formpre_[FORM_NAME]', [form, clicked_elm]``.
  * Callback: ``'ce.formpost_[FORM_NAME]', [form, clicked_elm]``.

Where:

* form - object, indicating the sent form.
* clicked_elm - object, indicating an element, that forced the form sending.
* [FORM_NAME] - name of the sent form.

Example:

.. code-block:: guess
  
    $.ceEvent('on', 'ce.formpre_add_to_cart_form', function(form, elm) {
      // Some code here
    });

* ``cm-check-changes`` - checks if there are unsaved changes in the form before submitting. If there are unsaved changes, a warning is displayed.

Automatically assigned to all POST-method forms in the admin panel::

 if (jQuery.area == 'A') {
     frms.filter('[method=post]').addClass('cm-check-changes');

* ``cm-disable-empty`` - assigned to a form. All non-obligatory unfilled fields will not be submitted. Used, for example, during product search to omit submitting multiple undefined parameters.
* ``cm-disable-empty-files`` - assigned to a form. All non-obligatory unfilled file fields will not be submitted. 
* ``cm-failed-field`` - automatically assigned to a form field after a submit to highlight incorrectly entered data.
* ``cm-no-hide-input`` - allows to submit an empty input value even if the form has class ``cm-disable-empty``.
* ``cm-trim`` - assigned to a label. Trailing spaces are removed from the value of the bound input during the validity check.

Form reset
----------

* ``cm-reset-link`` - upon clicking on an element with this class the form values will be set to their default values. Used in the product search form.

Form fields content selecting
-----------------------------

* ``cm-select-text`` - when clicked, the elements with the select method will be highlighted (textarea, input). Makes coping to buffer easier.

Form reload
-----------

* ``cm-reload-form`` – assigned to a form element. When this element is changed, the given form will be reloaded using a GET-request.

Pickers in forms
----------------

* ``cm-ajax-content-input`` - used, for example, in a picker when a search request is entered to enable autocompletion. An AJAX request for autocomplete is sent with the delay of 500 ms after the input is stopped. The received content is loaded in the container stated in the ``rev`` attribute. The autocomplete pattern is taken from the ``value`` parameter.

    Example: Vendor selecting through a picker in Multi-Vendor.

* ``cm-ajax-content-more`` - when the element becomes visible (for example, in a big drop-down list), additional content is loaded.

    Example: Vendor selecting, when the number of options is big, through a picker in Multi-Vendor.

* ``cm-cancel`` - when a button with this microformat is clicked, all picker fields are set to their default values.
* ``cm-clone`` - used for item adding to a picker without it getting closed (e.g. without an AJAX-request).

    Example: On the promotion page upon adding multiple products/categories from a picker. Assigned directly to the empty string, that is cloned upon item adding.

* ``cm-dialog-opener`` - assigned to an element that must open a dialog. The dialog container is defined in the ``rev`` parameter.

    Example: Products -> Categories. The *Edit* link has this class.

* ``cm-dialog-closer`` - assigned to an element that must close a dialog.

    Example: The *Cancel* button in pickers.

* ``cm-dialog-keep-in-place`` - not yet implemented.
* ``cm-dialog-auto-open`` - when a page is visited, this class automatically opens a dialog box. It is used in the administration panel in the welcome screen.
* ``cm-dialog-auto-size`` - used together with ``cm-dialog-opener``. The width and height of a dialog box depend on content when this class is used.
* ``cm-dialog-auto-width`` - used together with ``cm-dialog-opener``. The width of a dialog box depends on content.
* ``cm-dialog-switch-avail`` - unselects all selected checkboxes in a dialog box.
* ``cm-js-item`` - when adding an element to a form from a picker (for example, product adding to a gift certificate) this class is assigned to the container, where the added element resides. 
* ``cm-picker-options`` - product options will be received upon product transfer from a picker, if this class is assigned::

    <tbody id="{$data_id}" class="{if !$item_ids}hidden{/if} cm-picker-options">

Sending a form with a click on any NON-input[type=submit] element
-----------------------------------------------------------------

Usage::

 <input type="radio" name="a" value="b" class="cm-submit" />

The microformat is defined by CSS class of the element. Classes can be combined.

* ``cm-submit`` - the form, to which this element is assigned, will be sent after the element is clicked.

    In order to submit a form with a click on a non-button element:

     * Assign the microformat ``cm-sumbit`` to the element.
     * In the ``data-ca-dispatch`` attribute, provide the dispatch to which the form is submitted (in the format *dispatch[controller.mode]*).
     * Optional, only if the element is outside the form to submit: In the ``data-ca-target-form`` attribute, provide the form name or id.

* ``cm-submit-link`` - assigned to the link to be clicked for performing a submit. A hidden input of type *submit* is added and actually gets clicked.
* ``cm-tools-list`` - assigned to a container holding links, that submit the form when clicked. The ``rev`` attribute of the links must contain the form name.

Sending a form to a new or a parent window
------------------------------------------

Format::

 <input type="submit" name="a" value="b" class="cm-new-window" />
 <input type="submit" name="a" value="b" class="cm-parent-window" />

The microformat is defined by CSS class of the tag ``input``. Classes can be combined.

* ``cm-new-window`` - when clicked, a new window will be opened and the form will be sent there.
* ``cm-parent-window`` - when clicked, the form will be sent to a parent window.

Form submitting prohibition
---------------------------

Usage::

 <input type="submit" name="a" value="b" class="cm-no-submit" />

The microformat is defined by CSS class of the tag ``input``. Classes can be combined.

* ``cm-no-submit`` - the form, to which this element is assigned, won't be sent after the element is clicked.

Skipping field validation in a form
-----------------------------------

Format::

 <input type="submit" name="a" value="b" class="cm-skip-validation" />

The microformat is defined by CSS class of the tag ``input``. Classes can be combined.

* ``cm-skip-validation`` - when clicking on an element, the form to which this element belongs is sent without validating the elements values.

Form hiding
-----------

* ``cm-hide-inputs`` - *input* elements with this class are displayed as plain text (not editable).

    Example: Used in Multi-Vendor in forms for vendors to display the fields they can't edit as text.
* ``cm-hide-save-button`` - assigned to a tab where the buttons (not necessarily *Save* buttons) with this class should be hidden.

Checkboxes in forms
-------------------

Format::

 <input type="checkbox" name="check_all" value="Y" class="cm-check-items" />
 ...
 <input type="checkbox" name="product_ids[]l" value="1" class="cm-item" />
 <input type="checkbox" name="product_ids[]l" value="2" class="cm-item" />
 
 <a href="#" name="check_all" class="cm-check-items on">Check all</a>/<a href="#" name="check_all" class="cm-check-items off">Uncheck all</a>

There are 2 types of checkboxes manipulation:

 * Via the main checkbox
 * Via links

The control element must have the name ``check_all`` and the class ``check-items``. If the control element is a link, the classes ``on`` and ``off`` are to be also specified (they turn on and off all checkboxes)

Manageable elements must have the class ``item``.

The class ``process-items`` can be assigned to the button sending the form. In this case when the button is clicked on, the corresponding group of checkboxes will be checked to find out whether the checkboxes are *off* or *on*. If none of them is on, a message will be displayed.

.. note::

 If there are several groups of checkboxes in the form and they should be controlled separately, unique suffixes are to be added to the classes ``cm-check-items``, ``cm-item`` and ``cm-process-items``, for example:

::

 <input type="checkbox" name="check_all" value="Y" class="cm-check-items-group" />
 ...
 <input type="checkbox" name="product_ids[]l" value="1" class="cm-item-group" /> 

Other elements
==============

Links
-----

There is a microformat that allows to execute AJAX request when clicking on a link. Format of this link::

 <a class="cm-ajax" href="https://www.cs-cart.com" data-ca-target-id="pagination_contents">Ajax link</a>


The microformat is defined by CSS class of the tag ``a``. Classes can be combined.

* ``cm-ajax`` - AJAX request will be executed when clicking on a link. 
* ``cm-comet`` - the form is refreshed using the Comet model. 

Example: database back-up form.

* ``cm-progressbar`` - assigned to a Comet technology based progressbar.
* ``cm-progressbar-status`` - when a progressbar is initialized, a *div* element with this class is added to it. It is used to set text under the progressbar.
* ``cm-delete-row`` - when clicking on the element with this class, the nearest parent element *tr* is deleted. It is used to delete a row in a table.
* ``cm-row-item`` - assigned to a table row. Used for container identification together with ``cs-delete-row``.
* ``cm-ajax-cache`` - allows to cache AJAX requests, should be used together with ``cm-ajax``.
* ``cm-ajax-force`` - allows to execute js code from the ajax response for the second time. It should be used together with ``cm-ajax``.

When it is necessary to click on an element with the known ID,  you can use a link with the class ``cm-external-click``. ID of the element that should be clicked on is specified in the parameter *data_ca_scroll* of the link::

 <a class="cm-external-click" data_ca_scroll="external_elm">Push me</a>

* ``cm-external-focus`` - passes focus to an external element when an element with this class is clicked. The external element ID is defined in the rev parameter.
* ``cm-smart-position`` - used for container positioning (for example, the *Select currency* list in the administration panel).

Notifications
-------------

* ``cm-ajax-close-notification`` - used for the notifications that do not disappear on page change or on timer. When the close button is clicked, a close notification AJAX-request is sent.

Example: *The password must be different from the username* notification in the administration panel.

* ``cm-auto-hide`` - a notification with this class will automatically fade out. The timeout is set in *Settings -> Appearance*.
* ``cm-notification-close`` - assigned to a notification close button. On click the notification is either removed from the form or a notification removal AJAX-request is sent.
* ``cm-notification-container`` - assigned to a notification container.
* ``cm-notification-container-top`` - used in a container to show a notification in the upper right corner instead of the form head. Such notifications are displayed using AJAX.

Other elements
--------------

* ``cm-confirm`` - when clicked, confirmation of the action will be requested.
* ``cm-skipping-confirmation`` - assigned to an element to omit confirmation of an action that is connected to its state. 
* ``cm-noscript`` - this element will be shown only if javascript support is enabled in a browser.
* ``cm-focus`` - elements with this class get focus when a page is loaded.

    Example: Focus is on the login field, when the entry form is loaded.
* ``cm-opacity`` - assigned to a removed table row making it translucent.

    Example: A cloned and then removed "row" upon product image adding. The removal from the page is executed on page reload, until that the "row" remains translucent.
* ``cm-uploaded-image`` - assigned to a ``div`` element with an uploaded image. Used for uploaded images count.
* ``cm-wysiwyg`` - assigned to a textarea. Provides an editor for advanced text formatting. 
* ``cm-row-status-[current status code]`` - assigned to a row in list (the *<tr>* element). Indicates the current status code of an item (e.g. *a* for Active, *d* for Disabled, etc.)
* ``cm-autocomplete-off`` - removes the chance of autofill from a field. It is used in the password input field.

Popups
------

The microformat ``popup-box`` is available for popups. It allows to close a popup with a click outside its area.

Format::

 <div class="cm-popup-box">
 ...
 </div>

To hide a popup with a click on some element inside its area, it is necessary to define the class ``cm-popup-switch`` for this element.

Format::

 <div class="cm-popup-box">
 <strong class="hand cm-popup-switch">Close</strong>
 ...
 </div>

* ``cm-select-option`` - used in the administration panel for the bootstrap popup.
* ``cm-popover`` - initializes popover bootstrap (`http://getbootstrap.com/2.3.2/javascript.html#popovers <http://getbootstrap.com/2.3.2/javascript.html#popovers>`_).

Elements combinations
=====================

* ``cm-combination`` is used to hide/display container and show its state. It is used, for example, for the button advanced search in the administration panel, for trees (categories, pages), etc. By 'state', it is meant display of different images depending on the mode of the container. There are two options.

Option 1::

 <img src="" id="on_cat" class="cm-combination" />
 <img src="" id="off_cat" class="cm-combination" />
 <a href="#" id="sw_cat" class="cm-combination">
 ...
 <div id="cat">
 </div>

Additional elements use ID with different prefixes. There are 3 types of prefixes.

  * ``on_`` - expands a container when it is clicked on (usually it is the *plus* sign).
  * ``off_`` - collapses a container when it is clicked on (usually *minus*).
  * ``sw_``- for the element (usually it is a link) that switches the container mode with each click.

Option 2::

 <a href="#" id="sw_cat" class="cm-combo-on|off cm-combination">
 ...
 <div id="cat">
 </div>

In this case the images are changed by changing the class for the switch (see ``sw_ above``).

* ``cm-combo-on`` - for the image expanding a container (usually, *plus*).
* ``cm-combo-off`` - for the image collapsing a container (usually, *minus*).

So the classes ``cm-combo-on``, ``cm-combo-off`` with the corresponding pages should be defined in CSS. As there could be several combinations, the class should not be defined globally, it should be assigned to some specific element.

* ``cm-uncheck`` - used together with ``cm-combination`` and switches the checkbox state that is defined by ``cm-combination`` id.
* ``cm-switch-availability`` - switches the state of input elements (checkbox, radio, text), that are related to ``cm-switch-availability`` by *id = "sw_elem"*, where *elem* - the id of an element where checkbox and radio are placed.

To make the clicked element (that uses ``cm-switch-availability``) switch items when it is active (*checked="checked"*), use ``cm-switch-inverse``.
To hide/show the checkbox or radio block, use ``cm-switch-visibility``.
If other block than checkbox or radio is used, ``cm-switched`` defines the condition.

Format::

 <input type="checkbox" id="sw_company_redirect" checked="checked" class="cm-switch-availability cm-switch-inverse cm-switch-visibility" />

* ``cm-select-with-input-key`` - connects selector with text area. When the value in the selector is changed, it is transfered to text area, and the area becomes disabled.

It is used in locations when choosing *dispatch*.

Switching combinations
----------------------

To switch combinations (for example, to display/hide all elements of the tree) the microformat ``cm-combinations`` is used::

 <img src="" id="on_cat" class="cm-combinations" />
 <img src="" id="off_cat" class="cm-combinations hidden" />

ID here is used ONLY to group these two elements. Also, there is an ability to group combinations (for instance, several trees on a page). To do this it is necessary to add a suffix::

 <img src="" id="on_abc" class="cm-combinations-a" />
 <img src="" id="off_abc" class="cm-combinations-a hidden" />
 ...
 <img src="" id="on_cat" class="cm-combination-a" />
 <img src="" id="off_cat" class="cm-combination-a" />
 <a href="#" id="sw_cat" class="cm-combination-a">
 ...
 <div id="cat">
 </div>

In this case, when clicking on the upper images, only combinations from the group 'a' will be shown/hidden.

Tabs
====

* ``cm-js`` - a ``div`` element with class ``cm-tabs`` is generated in Smarty with a list of tabs inside: ``li`` elements with class ``cm-js`` and a particular ID (e.g. 'description'). When a tab is clicked, the ``div`` with the ID *content_ + %tab ID%* (e.g. *content_description*) is found and shown, the other div elements in the container are hidden.
* ``cm-active`` - assigned to a tab with class ``cm-js`` when it's selected or in a template. A tab with this class turns active. If the tab has empty content and class ``cm-ajax``, the content is loaded using AJAX. 
* ``cm-j-tabs`` - a ``cm-js`` tabs container. Used for tab container search and initialization.
* ``cm-tabs-content`` - assigned to a tab, in which the save buttons can be hidden (``cm-hide-save-button``)
* ``cm-toggle-button`` - assigned to a ``div`` element. If a tab with class ``cm-hide-save-button`` containing this ``div`` is selected, buttons in the ``div`` will be hidden.

State saving
============

* ``cm-save-state`` - to enable container state saving, this microformat should be assigned to every element that open/closes the container. In this case, a cookie will be created that will the connected with this element ID on its state changing. The default state is *'container is hidden'*. If the default state must be *'container is shown'*, a microformat *a*. The cookie checking and the element hiding should be done in a template.

* ``cm-save-fields`` - visible container inputs with this class will be serialized to an array and passed in an AJAX-request.

Additional microformats
=======================

* ``cm-skip-avail-switch`` - used for the function ``switchAvailability`` (switches on/off all the elements within the specified one). If an element has this class, it is not switched on back.
* ``cm-skip-check-items`` - assigned to a form to allow state change check skipping for its children elements.
* ``cm-track`` - assigned to a tab container. The last active tab is opened after sumbit.
* ``cm-save-and-close`` - adds hidden field with the ``return_to_list`` parameter. Used for the *Save and close* button.
* ``cm-promo-popup`` - in the *Free mode* opens popup that warns about the Full version requirement.
* ``cm-update-for-all-icon`` - enables sharing for a storefront. Fields are made available for editing.
* ``cm-sticky-scroll`` - fixes a block in which it is used. In ``data-ce-top`` the distance scrolled from the upper end of the page till a block is fixed is specified. In ``data-ce-padding`` the distanse from the upper end of the screen to the fixed block is specified.

Format::

 <div class="subnav cm-sticky-scroll" data-ce-top="100" data-ce-padding="20" >

When the window is crolled down for 100px, the panel will be fixed at the distanse of 20px from its upper end.

* ``cm-range-slider`` - initializes range-selection slider (jQuery UI Slider).
* ``cm-colorpicker`` - initializes color-picker (`http://bgrins.github.io/spectrum/ <http://bgrins.github.io/spectrum/>`_).

Locations
=========

* ``cm-location-billing``
* ``cm-location-search``
* ``cm-location-shipping``

All the classes starting with ``cm-location-`` are used to define state/province. The value after ``cm-location-`` is used to distinguish blocks. The select box containing state/province list is defined in the ``for`` attribute.

* ``cm-country`` - used together with ``cm-location-*`` to define country. State list is loaded according to this microformat.
* ``cm-state`` - assigned to a label. The input defined in the ``for`` attribute will be displayed either as a list, if the state list for the given country is available, or an entry field otherwise.

Hints and tooltips
==================

* ``cm-hint`` - to place an internal hint inside an input field or a textarea it should be assigned with this class. The hint text is defined in the title attribute. If the title attribute is undefined, the hint text will be taken from the value attribute.

When the field gets focus, the hint dissapears. If the field is empty and loses focus, the hint appears again. In case a hint is shown inside a field, the field name is prepended with ``hint_``.This prefix is removed on text input.

Example::

 <input type="text" name="field" id="a" size="20" title="Please, input your name here" value="" class="input-text cm-hint" />

* ``cm-hint-focused`` - indicates that an entry field has focus and its hint is hidden. When used with ``cm-hint``, indicates that an internal hint should not be shown.

    Example: *Track my order(s)* field in the admin panel.
* ``cm-tooltip`` - assigned to an element that should have a tooltip. The tooltip text is defined is the title attribute.

Admin panel
===========

Block manager
-------------

* ``cm-group-box`` - assigned to a block group in the administartion panel. Allows to move all the blocks together.
* ``cm-decline-group`` - a string with this class is not draggable (see ``cm-sortable-items``).

    Example: Used in blocks - groups are not draggable.
* ``cm-list-box`` - assigned to a block in the block manager to make it draggable.

Sorted list
-----------

Such list can be seen, for example, on the currency edit page: when a row is dragged, its position is changed.

* ``cm-sortable``  assigned to a container of sortable rows (``cm-sortable-row``).

    Example: Currency list in the administration panel.
* ``cm-sortable-id-*`` - an ID of a particular row in a ``cm-sortable`` container. A value after ``cm-sortable-id-`` is passed in a request and used to store changes.
* ``cm-sortable-items`` - assigned to a container for draggable blocks in the administartion panel.
* ``cm-sortable-row`` - assigned to a draggable table row. The row must be placed in a ``cm-sortable`` container.

Floating buttons
----------------

* ``cm-buttons-floating`` - assigned to a floating button container.

    Example: the *Save* & *Save and close* buttons on the product edit page in the administration panel are packed in such a container.
* ``cm-buttons-placeholder`` - contains buttons that are either placed in a ``cm-buttons-floating`` container or at the form bottom, if the page is not further scrollable. 

Template editor
---------------

* ``cm-delete-file`` - assigned to a *delete* button in the Template editor. If a filename is not '..' (that is, it's not a *go* *a* *level* *up* item), than a cross to remove is shown.
* ``cm-download`` - assigned to a file download button in the Template editor. Makes a button visible for downloadable files.
* ``cm-passed`` - used as flag in the Template editor. If this class is not assigned, a template file content is loaded.

File uploader
-------------

* ``cm-fu-file`` - assigned to a uploaded file block in the file uploader (filename and a remove cross are shown in a block). If there is no file, a block is hidden. Otherwise shown.
* ``cm-fu-no-file`` - assigned to an element that enables file uploading. Any file uploader can be considered as an example.

Quick menu
==========

* ``cm-add-link`` - adds a new link to the *Quick menu* section using *Quick box*.
* ``cm-add-section`` - adds a new section to the *Quick menu* using *Quick box*.
* ``cm-delete-section`` - assigned to a section/link remove button in the *Quick menu*.
* ``cm-qm-name`` - assigned to the *Quick menu* items in the edit mode. Used to pass section data to *Quick box* (link search is performed using this class).
* ``cm-update-item`` - assigned to an item edit link in the *Quick menu*. An item parameters dialog is opened on click.

Image gallery
=============

* ``cm-image-gallery`` - initializes the image gallery.
* ``cm-cur-item`` - assigned to a current mini-gallery item on the detailed product page. Used to change the thumbnail style.
* ``cm-previewer`` - assigned to a link (for example, under an image) that opens a bigger image when clicked. The page is not changed. The image is defined in the href parameter::

   <a id="det_img_link_1553_140" rel="preview[product_images]" rev="preview[product_images]" class="cm-previewer" href="/professional/images/detailed/0/detailed_image_1386.jpg" title="img.jpg">
     <img class=" "  id="det_img_1553_140" src="/professional/images/thumbnails/0/120/img.jpg" width="120"  alt="img"  border="0" />
   </a>

* ``cm-thumbnails-mini`` - assigned to an image in the mini-gallery on the detailed product page. Used for thumbnail identification and for assigning class ``cm-cur-item`` when an image is clicked (class ``cm-cur-item`` is removed from all items with class ``cm-thumbnails-mini``).
* ``cm-generate-image`` - initializes the thumbnails generation.

Design and translate mode
=========================

* ``cm-cur-template`` - assigned to a current template during editing in the Design mode. Also used to identify a change of a template being edited. Used only in the Design mode.
* ``cm-item-modified`` - assigned to an edited in the Design mode template. If a template change is occured (using the template tree on the left of the editor) with this class being assigned, a message appears informing of the existing changes.
* ``cm-lang-link`` - assigned to a language change link. The language is defined in the name attribute (in two-letter format).
* ``cm-select-list`` - assigned to a language select drop-down list. Used as a ``cm-lang-link`` elements container.

    Example: Language list when a phrase translation dialog is opened in the Translate mode.

Quantity input
==============

* ``cm-decrease`` - should be used in a ``cm-value-changer`` container. Assigned to a link that must decrease the input value. Decreases input value by 1. Any non-integer value is replaced with 0.

    Example: up/down arrows around a quantity field in the customer area.
* ``cm-increase`` - should be used in a ``cm-value-changer`` container. Assigned to a link that must increase the input value. Increases input value by 1. Any non-integer value is replaced with 0.
* ``cm-value-changer`` - assigned to a parent container for an input and a ``cm-increase/cm-decrease`` button.

    Example: product quantity field in the customer area.

Node cloning
============

* ``cm-first-sibling`` - a row with this class can't be removed, the remove icon is disabled.
* ``cm-image-field`` - this class defines the regex to increase image number correctly on image containing element cloning.

    Example: Product option cloning. Every option can have images. This class is assigned to the fields connected with images. 

Wrappers
========

* ``cm-hidden-wrapper`` - assigned to a wrapper that can be hidden in case it has no content. That is, if block content is empty, the wrapper is not shown.

Pagination
==========

* ``cm-history`` - assigned to links. When a link with this microformat is clicked, current page state is saved in the browsing history. The jQuery history plug-in is used.

    Example: Product pagination.
* ``cm-pagination`` - assigned to an input. When *Enter* is pressed in it, the page is changed to the entered one.
* ``cm-pagination-button`` - assigned to a button. When clicked, the page is changed to the one entered in the respective ``cm-pagination`` input.
* ``cm-pagination-wraper`` - assigned to a navigation controls container.
* ``cm-back-link`` - returns to a previous page, works through the history.

AJAX
====

* ``cm-ajax`` - AJAX request will be executed when clicking on a link.
* ``cm-comet`` - the form is refreshed using the Comet model.

    Example: database back-up form.
* ``cm-ajax-cache`` - allows to cache AJAX requests, should be used together with ``cm-ajax``.
* ``cm-ajax-force`` - allows to execute js code from the ajax response for the second time. It should be used together with ``cm-ajax``.
* ``cm-ajax-close-notification`` - used for the notifications that do not disappear on page change or on timer. When the close button is clicked, a close notification AJAX-request is sent.
* ``cm-ajax-full-render`` - can be used only with ``cm-ajax``. Forces the whole page to be reloaded (with footer and top menu).
* ``cm-no-ajax`` - if this class is assigned to the submit button of the form, then when clicking on the button, the form will be sent in an ordinary way, even if the class ``cm-ajax`` is assigned to the form.
* ``cm-ajax-content-input`` - used, for example, in a picker when a search request is entered to enable autocompletion. An AJAX request for autocomplete is sent with the delay of 500 ms after the input is stopped. The received content is loaded in the container stated in the ``rev`` attribute. The autocomplete pattern is taken from the value parameter.

    Example: Vendor selecting through a picker in Multi-Vendor.
* ``cm-ajax-content-more`` - when the element becomes visible (for example, in a big drop-down list) additional content is loaded.

    Example: Vendor selecting when the number of options is big through a picker in Multi-Vendor.

AJAX-updated product content
============================

* ``cm-reload`` - assigned to the changed block on option change. After that, all elements with this class are updated. An example from *common_templates/product_data.tpl*:

.. code-block:: smarty

    {********************** Price *********************}
    {capture name="price_`$obj_id`"}
    <span class="cm-reload-{$obj_prefix}{$obj_id} price-update"
      id="price_update_{$obj_prefix}{$obj_id}">
    ...

So the price is updated every time, when the option is changed and updated.

Customization mode
==================

* ``cm-template-box`` - assigned to a container that is present as a template in the Customization mode. Used to manage template and determine template nesting level.
* ``cm-template-icon`` - assigned to a template edit icon when the Customization mode is on. On mouse hover highlights the template coverage area (using ``cm-template-over``). When mouse hover is escaped, the highlight is disabled.
* ``cm-template-over`` - assigned to the container that is displayed using the selected template (mouse cursor is over the respective ``cm-template-icon`` icon). Used to highlight the selected template coverage area, when the Storefront is in the Customization mode.
