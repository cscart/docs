******************
TaxCalcs by TaxJar
******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000122" class="btn buy-now__btn">Buy now</a>
    </div>


 
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The **TaxCalcs by TaxJar** add-on integrates your store with the `TaxJar service <https://www.taxjar.com/>`_ that adds automatic and comprehensive tax calculations to your orders based on the user's state, county and city.

    Authorized users will see product prices with included tax on product pages:

    .. fancybox:: img/c_pdp.jpg
        :alt: product page
    
    as well as on category pages:

    .. fancybox:: img/c_category_page.jpg
        :alt: category page

    The add-on calculates how much sales tax should be collected at checkout.

    .. fancybox:: img/c_checkout_percent.jpg
        :alt: checkout page

    .. note::

        The service is paid. For pricing, visit `this page <https://www.taxjar.com/pricing/>`_. However, they provide a 30 day free trial.

    Learn more about TaxJar from `TaxJar's Guides <https://www.taxjar.com/learn-sales-tax/>`_, `Knowledgebase <https://support.taxjar.com/help_center>`_ and `video tutorials <https://www.youtube.com/channel/UCHO0FNw1Ey_2GkFypQNfWPw>`_.

========
Features
========

    - Accurate tax calculation for the USA and Canada.

    - Easy to use Tax information calculator will allow you to estimate the amount of tax for the product and its shipment.

    - Your vendors may use their own TaxJar account API key. It means that TaxJar transactions will be counted separately for your and their accounts.

    - You can use a different API key for each storefront.

    - Ability to choose to show the tax in percent or in cash.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.5 and above, but only versions 4.11.x, 4.12.x and 4.13.x are supported.

    Don't know what archive to download to install the add-on? Read `here <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <http://www.simtechdev.com/helpdesk>`_.

----------------------
Getting TaxJar account
----------------------

    Create an account at `TaxJar <https://www.taxjar.com/>`_.

    .. fancybox:: img/SmartCalcs_by_TaxJar_002.png
        :alt: TaxJar home page

    Click **Connect integration** button after authorization.

    .. fancybox:: img/SmartCalcs_by_TaxJar_003.png
        :alt: creating a TaxJar account
        :width: 450px

    Click **TaxJar API** Pro to collect the token.

    .. fancybox:: img/SmartCalcs_by_TaxJar_004.png
        :alt: creating a TaxJar account

    Select the relevant to your environment token. See the `Setting up the add-on`_ section.

    .. fancybox:: img/SmartCalcs_by_TaxJar_005.png
        :alt: generated token

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “TaxCalcs by TaxJar” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/SmartCalcs_by_TaxJar_001.png
        :alt: SmartCalcs by TaxJar add-on

=====================
Setting up the add-on
=====================

    Here are available settings of the “TaxCalcs by TaxJar” add-on.

    **Settings for CS-Cart stores:**

    .. fancybox:: img/SmartCalcs_by_TaxJar_006.png
        :alt: settings of the SmartCalcs by TaxJar add-on

    * **API key**—In order to get the API key, you need to register an account at `TaxJar <https://www.taxjar.com/>`_ and generate an API key. For more information, see the `Getting TaxJar account`_ section.
    
    * **Amount of days**—Specify for how many days the cache of the requests sent to the TaxJar service should be stored.

    **Common Settings**
    
    The Add-ons tab of the Storefront/Vendor Settings page contains additional setiing for the add-on

    .. fancybox:: img/SmartCalcs_by_TaxJar_014.png
        :alt: Additional Settings

    * **TaxJar: To download information about orders to CSV**-Allows to create a .csv order report file fand export it to TaxJar.

    * **TaxJar: Settings for sending information about orders to the TaxJar service**-Allows to select the orders statuses for export to TaxJar. 

    **Settings for Multi-Vendor stores**

    .. fancybox:: img/SmartCalcs_by_TaxJar_007.png
        :alt: settings of the SmartCalcs by TaxJar add-on

    * **API key**—In order to get the API key, you need to register an account at `TaxJar <https://www.taxjar.com/>`_ and generate an API key. For more information, see the `Getting TaxJar account`_ section.

    .. note::

        In Multi-Vendor stores, each vendor should create their own TaxJar account and specify an API key on the vendor editing page in the Add-ons tab:

            .. fancybox:: img/SmartCalcs_by_TaxJar_009.png
                :alt: TaxJar API key

        The same concerns CS-Cart stores with multiple storefronts—specify an API key for each store on the store editing page in the Add-ons tab:

            .. fancybox:: img/SmartCalcs_by_TaxJar_010.png
                :alt: TaxJar API key

    * **Amount of days**—Specify for how many days the cache of the requests sent to the TaxJar service should be stored.
    
    * **Make the API key field obligatory for the vendors**—If enabled, all your vendors must have a TaxJar account.

    * **Take into account the city when calculating taxes**—If enabled, tax calculation procces will include the city where the order is shipped to. If disabled, the final amont of calculated tax will not include the city.

    * **Update the list of tax codes**—Click the **Update** button to update the tax codes. As the taxes database of the service is regularly updated, you will need to update the list from time to time.

    You may want to hide prices from the category/product or cart/checkout pages. If so, clear the corresponding checkboxes under **Settings - Appearance - Customer settings**:

    .. fancybox:: img/SmartCalcs_by_TaxJar_008.png
        :alt: settings to hide prices

    .. important:: 
        Flields 'Country', 'State/Province' and 'Zip Code' should be filled on the vendor profile page for correct functioning of the add-on. The relevant fields can be activated by the adminiatrator in the 'Profile fields' settings (Admin panel -> Administration -> Profile Fields ->Vendor information)

        .. fancybox:: img/SmartCalcs_by_TaxJar_013.png
            :alt: Profile Settings

==================================
Calculating sales tax for products
==================================

    On the product editing page, you can calculate sales tax that will be added to the product cost and shipping cost. For precise calculation select a product tax code from the list, enter a country, region and valid zip code, specify the shipping cost ans click **Calculate tax**.

    .. fancybox:: img/SmartCalcs_by_TaxJar_011.png

    The opened pop-up will show you the required information.

    .. fancybox:: img/SmartCalcs_by_TaxJar_012.png
        :alt: tax information

    In order to make tax amount visible on the checkout select "Subtotal" option on the checkout setting page (Admin Panel -> Settings -> Checkout -> Tax calculation method based on).

    .. fancybox:: img/SmartCalcs_by_TaxJar_015.png
        :alt: Checkout Settings