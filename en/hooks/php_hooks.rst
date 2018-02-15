*********
PHP Hooks
*********


PHP or code hook is a specially defined part in the program code that can pass control to an add-on. A hook is declared by calling a special function in the necessary part of code::

    fn_set_hook('hook_name', $params, [$param2], [$paramN]);

Hooking is a very flexible technique; one function can have any number of hooks.

Review all available PHP hooks in all CS-Cart versions using the `Hook base <http://www.cs-cart.com/api>`_ tool on our official website.

What a PHP Hook Looks Like in the Source Code
=============================================

Here is an example of a PHP hook used in CS-Cart. It is declared in the function ``fn_get_gift_certificate_info`` used by the `Gift certificates <http://www.cs-cart.com/index.php?dispatch=hooks_base.manage&product_id=9#134393>`_ add-on::

    fn_set_hook('get_gift_certificate_info', $_certificate, $certificate, $type)

 
When PHP Hooks Are Used
=======================
Hooks provide a convenient way for add-ons to perform additional actions in the middle of the main flow.

Knowing the hook name, any addon can intercept execution of the program code, perform necessary manipulations, and then return the execution process to the main program. When calling a certain hook, all variables directly defined in this hook become available for the addon.

A hook call within an add-on is carried out by defining the function which name consists of the prefix ``fn_``, addon name, underscore and the full name of the called hook::

    fn_gift_certificates_get_gift_certificate_info($_certificate, $certificate, $type)


So, according to the function name, the code inside the function will be executed in the hook ``get_gift_certificate_info`` in the **Gift certificates** add-on.

How to Use a PHP Hook
=====================
In order to use PHP hooks in your add-on:

*    Declare the hook to be used in the add-on ``init.php`` file::
     
    	...
     
      fn_register_hooks(
         'get_category_data_pre'
      );
     
    	...

*   Create a function to perform actions on the hook occurence in the add-on ``func.php`` file::
    	
     <?php
     
     if ( !defined('AREA') ) { die('Access denied'); }
     
     function fn_my_addon_get_category_data_pre($category_id, $field_list, $get_main_pair, $skip_company_condition, $lang_code)
     {
    	...
     }
     
     ?>

And that's it! The add-on is now "aware" that it should use the hook, and CS-Cart is aware that it should pass the control to the add-on when the hook occurs.

.. A complete and working example of hook usage in an add-on is given in the :doc:`Advanced Add-on Tutorial <>`. (add a link)
