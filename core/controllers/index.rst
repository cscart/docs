***********
Controllers
***********

Basic schema of the software functioning consists in calling one of the two main executable PHP files (*admin.php* or *index.php*) and further consecutive execution of PHP files implementing the program functionality.

**1. index.php or admin.php ? 2. init.php ? 3. [controller_name].php**

In CS-Cart terms a file connected under number three is named a controller. Data handling in the program is performed in this file - extracting the necessary data from the database, data handling, calculations, transformations, etc. and preparation of the data for further display.

A path to the controller and its name are defined by the program automatically based on the value of the ``dispatch`` parameter, which was passed to the main executable file. The ``dispatch`` parameter has the following format ``[controller_name].[mode_name]``, where ``[controller_name]``- is a name of the controller, and ``[mode_name]`` - mode in which the called controller will work. The name of the called file will be ``[controller_name].php``.

All controllers for the admin panel (executable file - *admin.php*) are located in the *app/controllers/backend* directory, for the customer area (*index.php*) - in the *app/controllers/frontend* directory. If the called controller is not in these directories, then the system tries to launch it from *app/controllers/common*. This is done for the situations when the same controller is to serve the customer and administrator areas and its function is the same for both areas.

Controller connection is carried out by the function ``[/core/fn.control.php]/fn_dispatch()``, which does not accept any parameters and performs the following main actions:

    * Checks the parameter ``dispatch`` for validity.
    * Checks permissions of the current user for the called controller.
    * Redirects to a secure protocol (HTTPS) when necessary.
    * Prepares an ordered list of precontrollers and postcontrollers (from add-ons and the core) for consecutive connection in the right order.
    * Automatically defines a template to display.

**Example**

We have the value of the parameter ``dispatch=products.manage`` and the executable file *admin.php*, or, in other words, it looks like this *http://cscart_dir/admin.php?dispatch=products.manage* in the address bar of the browser.

The path to the connected controller - */controllers/backend/products.php*. The parameter ``manage`` will be used within the file to define actions that controller must perform with the data. In this example ``manage`` indicates that the controller should select a list of products from the database and display it on the products page in the administrator area.

.. important::

 Important! A controller name must be unique. If a controller is defined in the add-on, and its name coincides with the name of one of the standard controllers, then when calling any of these controllers an error occurs.

Controller structure
====================

Each controller can contain the following logical blocks:

    * Processing of ``POST`` request.
    * Processing of ``GET`` request.
    * Defining local functions used only within a controller.

The part ``[mode_name]`` of the parameter ``dispatch`` is used to set the operating mode for processing ``GET`` request.

POST request
============

Processing of a ``POST`` request should always be performed prior to processing a ``GET`` request and there must be a string at the end of the block that returns control from a controller to the function ``fn_dispatch()``::

 return array(CONTROLLER_STATUS_OK, "$index_script?dispatch=controller_name$suffix");

The parameter ``CONTROLLER_STATUS_OK`` contains a constant with the success status of the controller performance, the second parameter is a string with URI for redirection after processing the POST request.

**Example**::

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
 
        if ($mode == 'add') {
            // here comes the code which should be executed when submitting product addition form
        }
 
        return array(CONTROLLER_STATUS_OK, "$index_script?dispatch=products$suffix");
    }

GET request
===========

Section of processing a ``GET`` request is always placed after the ``POST`` block.

**Example 1**::

    if ($mode == 'manage') {
         // here comes the code which should be executed when running "http://cscart_dir/admin.php?dispatch=products.manage"
    }

Here is given a part of code that checks the value of the parameter ``mode`` (*dispatch=controller.mode*) and executes the code within a conditional operator when the value equals ``manage``. This code will be executed on ``GET`` request.

At the end of the ``GET`` mode operation, the controller usually performs one of the following closing actions:

    * Transfer of control to the display subsystem or templater, which is the same.
    * Redirection by ``GET`` method.
    * Completion of controller execution and the program itself without any additional actions: ``exit;``

In the first case, the control will be transferred to the function ``fn_dispatch()`` automatically, if it is not explicitly defined, that it is necessary to perform actions under points 2 and 3. To transfer data to the templater for further display, the following structure is used::

 $view->assign('template_var_name', $php_var_name);

Here ``template_var_name`` defines a name of the variable available in the templater, and ``$php_var_name`` defines the content of this variable.

**Example 2**::

    if ($mode == 'manage') {
        $product_name = 'Product 1';
        $product_description = 'Product description';
        $view->assign('tpl_product_name', $product_name);
        $view->assign('tpl_product_description', $product_description);

    }

After this code is executed in the controller, the control is transferred to the templater, for which two variables ``$tpl_product_name`` and ``$tpl_product_description`` will be available.

Functions
=========

Functions within a controller are defined in accordance with general rules of function formatting. If a function of the controller is required to be called in another controller, such a function should be located in the core of the program or an add-on.

Available data
==============

To work with program data in a controller, you should use the following standard arrays:

    * ``$_REQUEST`` - contains all variables coming from ``GET`` and ``POST`` requests. All variables in this array are handled in a special way: HTML tags are removed; slashes that are automatically added by PHP (if a corresponding setting is enabled) are deleted.
    * ``$_SESSION`` - a standard PHP array that stores session data.
    * ``Registry`` - a special static class-repository for the data that should be accessed from any place of the program. For instance, configurational parameters of the program, read during startup, are entered into class ``Registry``. Peculiarity of this class is that any data stored in it can be cached. This allows, for example, to avoid repeated requests to the database for seldom updated information by storing it in cache of class ``Registry``.

Transfer of control to templater
--------------------------------

After a controller is executed and control is returned to ``fn_dispatch()``, it transfers control of the program and the path to the template, which should be processed and displayed, to the templater.

.. note::

    It can be specified in a controller, that instead of transferring control to the templater it is necessary to terminate the script execution or redirect to another address.

By default the path to this template is defined automatically as follows:

* Administration panel: /backend/templates/views/[controller_name]/[mode_name].tpl 
* Customer area: /themes/[theme name]/templates/views/[controller_name]/[mode_name].tpl

**Example**:

 *http://cscart_dir/admin.php?dispatch=products.manage*

The path to the displayed template: */backend/templates/views/products/manage.tpl*