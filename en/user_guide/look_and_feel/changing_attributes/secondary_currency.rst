***************************************************************
How To: Set the Secondary Currency as Default on the Storefront
***************************************************************

By default, CS-Cart displays the primary currency on the storefront. Customers have the option to switch to any other active currency. We have developed a free add-on that allows you to set the currency that will be selected on the storefront by default.

.. hint::

    If you want to set one specific currency for the storefront, while having a different currency in the Administration panel, please check this :doc:`article. <prices_in_secondary>`

.. image:: img/default_secondary_currency_02.png
    :align: center
    :alt: Default currency on the storefront.

==========================
Step 1. Install the Add-on
==========================

1. Download the **Secondary Currency by Default** add-on using `this link <https://github.com/cscart/addon-default-secondary-currency/archive/master.zip>`_. You'll get a ZIP archive.

.. note::

    You're also welcome to visit `the add-on's repository on GitHub <https://github.com/cscart/addon-default-secondary-currency>`_. 

2. Log in to the Administration panel of your store.

3. Go to **Add-ons → Manage add-ons**.

4. Сlick the **+** button to upload the add-on.

.. image:: img/addons_plus_button.png
    :align: center
    :alt: Add-ons plus button

5. In the pop-up window click **Local**, and choose the the ZIP archive you downloaded earlier.

6. Click **Upload & install**.

.. image:: img/upload_and_install_addon.png
    :align: center
    :alt: Upload and install pop-up

===========================
Step 2. Choose the Currency
===========================

1. Find **Secondary Currency by Default** on the list of add-ons and click on the add-on's name.

.. image:: img/prices_in_secondary_currency_01.png
    :align: center
    :alt: The Product Prices in the Secondary Currency add-on

2. The add-on only has one setting: **Desired storefront currency code**. Enter the currency code into that field.

   .. hint::

       You can find the currency codes under **Administration → Currencies**. The codes appear to the left of the exchange rate.

3. Click **Save**.

   .. important::

       Even though the currency displayed by default has changed, all calculations are still done in the primary currency. Prices in other currencies are simply displayed according to the rate that you specify.

.. image:: img/prices_in_secondary_currency_02.png
    :align: center
    :alt: The codes of the currencies in a CS-Cart store.
