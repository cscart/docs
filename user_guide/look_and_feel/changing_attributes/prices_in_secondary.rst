*******************************************************************************
How To: Display Product Prices Only in the Secondary Currency in the Storefront
*******************************************************************************

To be able to set up product prices in one currency but display them in another one in the storefront:

1.   Open the **fn.init.php** file located in the *app/functions* directory of your CS-Cart installation.
2.   Find and replace the following part of code:

.. code-block :: none

    define('CART_PRIMARY_CURRENCY', $primary_currency);
    define('CART_SECONDARY_CURRENCY', $secondary_currency);

with this one:

.. code-block :: none

    $primary_currency = 'DESIRED_ADMIN_CURRENCY_CODE';
    $secondary_currency = 'DESIRED_STOREFRONT_CURRENCY_CODE';

    define('CART_PRIMARY_CURRENCY', $primary_currency);
    define('CART_SECONDARY_CURRENCY', $secondary_currency);


where replace *DESIRED_ADMIN_CURRENCY_CODE* with the 3-symbol code of the currency that you want to use in the administration panel and *DESIRED_STOREFRONT_CURRENCY_CODE* with the 3-symbol code of the currency that you want to use in the storefront.

3.   Find and replace the following part of code there:

.. code-block :: none

    $view->assign('currencies', Registry::get('currencies'), false);

with this one:

.. code-block :: none

    $view->assign('hide_currencies', true);
    $view->assign('currencies', Registry::get('currencies'), false);

4.   Save the file.
5.   Open the **currencies.tpl** file located in the *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/blocks* directory of your CS-Cart installation, where [CUSTOMER_ACTIVE_THEME] is an active theme of your storefront.
6.   Find and replace the following part of code:

.. code-block :: none

    {if $currencies && $currencies|count > 1}

with this one:

.. code-block :: none

    {if $currencies && $currencies|count > 1 && !$hide_currencies}

7.   Save the file.

.. important ::

	This modification will hide all your currencies except the one you specify in the code. If you want to keep your other currencies but only select the desired one by default, please use the instructions in `here <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/changing_attributes/secondary_currency.html>`_.
