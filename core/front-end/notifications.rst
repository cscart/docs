*************
Notifications
*************

Notifications in CS-Cart are represented as pop-up rectangular areas in the top right corner of the screen.

There are five standard types of notifications:

 * Notification (code type ``'N'``)
 * Error (code type ``'E'``)
 * Warning (code type ``'W'``)
 * Order error on checkout (code type ``'O'``)
 * Information (code type ``'I'``)

Each notification type has its color: notification - green, error - red, warning - orange, order error on checkout - orange, and information is opened in a pop-up dialog. Visual format is defined in CSS file of that area where the notification is called.

Notification is created through the function ``fn_set_notification`` (*/functions/fn.common.php*).

An empty container is added to HTML code of each program page. A notification block is displayed in this container if the notification is set. Container is created in the following templates:

 * Administration panel: */backend/templates/common/notification.tpl*
 * Customer area: */themes/[theme name]/templates/common/notification.tpl*

Ways to set a notification
==========================
There are two ways to set a notification:

 * By standard execution of a script, prior to display of a page.
 * With AJAX request, after a page is displayed and in a certain event.

The first way is used to create a notification that is to be displayed when a page is loaded. The second one is necessary to display a notification without a page reload on some event in the program.

Let's consider the process of notification creation in **the first way**:

 * The setting function is called in the controller code, for instance::

     if ($mode == 'add_to_cart') {
         fn_set_notification('E', fn_get_lang_var('warning'), $msg, true, 'insecure_password'); 
     }

  This function adds a new element to the notification array.

 * Templater processes the template */backend/templates/common/notification.tpl* or */themes/[theme name]/templates/common/notification.tpl* and through the function ``fn_get_notifications`` passes a list of all notifications for display to the array search function foreach.

 * If the notification array is not empty, then HTML code of the notification itself is displayed.

**The second way (AJAX)**:

 * When displaying a page, the templater processes the template */backend/templates/common/notification.tpl* or */themes/[theme name]/templates/common/notification.tpl* and creates a container for notifications (*<div class="cm-notification-container">*). This container is either empty or contains notifications set in the first way.

 * The setting function is called in the controller code executed on AJAX request, for example::

     if (defined('AJAX_REQUEST')) {
         fn_set_notification('E', fn_get_lang_var('warning'), $msg, true, 'insecure_password'); 
     }

  This function adds a new element to the notification array.

 * When script execution is completed or when the termination function ``exit()`` is called explicitly, invocation of the destructor of Ajax class (*/Tygh/Ajax.php*) takes place. The destructor passes the notification information to an array with data in JSON format and then passes this array to the JS function ``response`` (*/js/tygh/ajax.js*).

 * The function ``response`` in turn calls the function ``ceNotification`` (*/js/tygh/core.js*) and passes the array with all defined AJAX notifications to it. Display of the notification occurs in the ``ceNotification`` function by the ``notification.append`` method, which adds HTML code of the notification to a container of the declared template */backend/templates/common/notification.tpl* or */themes/[theme name]/templates/common/notification.tpl* (*<div class="cm-notification-container">*).

Also, it is possible to create a notification with the help of JavaScript::

	$.ceNotification('show', {
  	  type: 'E',
   	 title: _.error,
   	 message: error_msg
	}); 