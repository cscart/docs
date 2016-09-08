*******************************************************************************
How To: Display Product Prices Only in the Secondary Currency on the Storefront
*******************************************************************************

To be able to set up product prices in one currency but display them in another one on the storefront use the **Product Prices in the Secondary Currency** add-on.

=============================
Step 1. Installing the Add-on
=============================

To get and install this add-on, do the following:

1. Download the Product Prices in the Secondary Currency add-on archive using `this link <https://github.com/cscart/addon-hide-primary-currency/archive/master.zip>`_.

.. note::

    If you want to check the add-on code, please, visit `the add-on page on GitHub <https://github.com/cscart/addon-hide-primary-currency>`_. 

2. Log in to the Administration panel of your store.

3. Go to **Add-ons → Manage add-ons**.

4. Сlick the **+** button to upload the add-on.

.. image:: img/addons_plus_button.png
    :align: center
    :alt: Search

5. In the pop-up window click **Local**, and choose the add-on archive.

6. Click **Upload & install**.

.. image:: img/upload_and_install_addon.png
    :align: center
    :alt: Search

The Product Prices in the Secondary Currency add-on has been installed.

.. image:: img/prices_in_secondary_currency_01.png
    :align: center
    :alt: Search

=========================================
Step 2. Setting up the Secondary Currency
=========================================

To display the correct secondary currency you will need to make some changes in the code of the installed add-on.

1. Open the **hide_primary_currency** folder located in the *app/addons* directory of your CS-Cart installation.

2. In this folder open the **func.php** file.

3. Replace ``DESIRED_ADMIN_CURRENCY_CODE`` with the 3-symbol code of the currency that you want to use in the Administration panel and ``DESIRED_STOREFRONT_CURRENCY_CODE`` with the 3-symbol code of the currency that you want to use in the storefront.

.. image:: img/prices_in_secondary_currency_02.png
    :align: center
    :alt: The 3-symbol code of the currency.

4. Click **Save changes**.

The Product Prices in the Secondary Currency add-on is ready for work.

.. image:: img/prices_in_secondary_currency_03.png
    :align: center
    :alt: The 3-symbol code of the currency.

.. important ::

    This add-on will hide all your currencies except the one you specify in the code. If you want to keep your other currencies but only select the desired one by default, please use the instructions in `here <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/changing_attributes/secondary_currency.html>`_.
























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
