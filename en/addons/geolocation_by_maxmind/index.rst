*************************
IP Geolocation
*************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000066" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

.. warning::

    Installation of the add-on requires advanced technical skills. It is created mainly for developers to use in further development.

--------
Overview
--------

    The **IP Geolocation** add-on is a professional solution that adds the ability to determine the user's location by IP address using the `MaxMind <https://www.maxmind.com>`_ databases. 

    MaxMind offers free and paid databases with the most up-to-date and accurate data available. 

    The advantages of the add-on are the following:

    1. Geolocation is determined at the server level without involving web browsers, which allows to offer content taking into account customer's location at their first visit.

    2. Geodata is determined very quickly by local databases, it does not depend on external services.

    3. Extended data for multiple languages (country, region, city).

    IP Geolocation adds the following functionality:

    The customer's city will be determined and displayed in the header of the storefront.

    .. fancybox:: img/Maxmind.png
        :alt: Geolocation by MaxMind
        :width: 650px

    If the city is not determined, this pop-up will be displayed:

    .. fancybox:: img/Maxmind_popup.png
        :alt: city by IP
        :width: 650px

    After clicking *Select city*, a customer will be able to specify the city manually.

    .. fancybox:: img/Maxmind_Selection_011.png
        :alt: specifying the city
        :width: 650px

    The country, region, city fields are auto-completed at checkout.

    .. fancybox:: img/Maxmind4.png
        :alt: city block in the storefront
        :width: 650px

    The store currency will be automatically set to the customer's currency depending on their country.

    .. fancybox:: img/Maxmind5.png
        :alt: setting customer's currency
        :width: 650px

    The add-on allows to automatically determine the customer's language in the store depending on their country.

    .. fancybox:: img/Maxmind6.png
        :alt: determine the customer's language
        :width: 650px

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the IP Geolocation add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://maxmind.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “IP Geolocation” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

==================
Available settings
==================

    The settings of the “IP Geolocation” add-on are divided in two sections:

    * **General**

    .. fancybox:: img/Maxmind_Selection_02.png
        :alt: GEO MaxMind add-on settings
        :width: 650px

    * **Use city in user profile**—if selected, the City field will be auto-complete during registration and at checkout.

    * **Limit**—count of cities that will be displayed in the drop-down list. By default, its value is set to 10.

    * **Minimum length**—minimum count of symbols that a user should enter before the drop-down list is displayed. By default, its value is set to 3.

    * **Show predefined popup**—if selected, a pop-up window will be displayed to confirm the determined city.

    .. fancybox:: img/Ipgeo.png
        :alt: Show predefined popup
        :width: 650px

    * **Set customer's language**—when a customer visits the store for the first time, the system will choose the language of the customer's country (if it is installed)

    * **Set customer's currency**—when a customer visits the store for the first time, the system will choose the currency of the customer's country (if it is installed)
    
    * **Databases**
    
    .. fancybox:: img/Maxmind_Selection_020.png
        :alt: GEO MaxMind add-on settings
        :width: 650px

    Follow the instructions to download the database archives from `the MaxMind website <http://dev.maxmind.com/geoip/geoip2/geolite2/#Databases>`_ and unpack them in the right directory. You should download these two archives:

    * city database

    .. fancybox:: img/Maxmind_Selection_03.png
        :alt: MaxMind city database
        :width: 650px

    * CSV file

    Note that you should take the CSV file that corresponds to the language used in your store from the downloaded archive. For example, for the English language it's the GeoLite2-City-Locations-en.csv file.

    .. fancybox:: img/Maxmind_Selection_04.png
        :alt: MaxMind city database. CSV
        :width: 650px

    Once you add the necessary files, click **Save**.

    Open the add-on settings again and go to the **Databases** tab. You should see the names of the added files. Click the **Update db cities** button to update cities in the database. 

    .. fancybox:: img/Maxmind_Selection_021.png
        :alt: settings
        :width: 650px

    You will also see the **IP for test search** field added. This field is for testing purposes. Enter any IP address into the field to see the country and city of the entered IP address. For example:

    .. fancybox:: img/Maxmind_Selection_022.png
        :alt: IP search
        :width: 650px

    Click **Save**.

======================================
Adding a block for the determined city
======================================

    If you want to display a block with the determined city for customers in the storefront, follow these steps:

    .. fancybox:: img/Maxmind_city_line.png
        :alt: city block
        :width: 650px

    1. In the admin panel, go to **Design - Layouts**.

    2. Locate the **Top panel** and add a new block by clicking the + button.

    .. fancybox:: img/Maxmind_Selection_06.png
        :alt: creating new block
        :width: 650px

    3. In the pop-up window, go to the **Create New Block** tab and select the corresponding block. 

    .. fancybox:: img/Maxmind_Selection_07.png
        :alt: city block
        :width: 650px

    4. In the block settings, name the block and click **Create**.

    5. Make sure the block appeared in the layout.

    .. fancybox:: img/Maxmind7.png
        :alt: city block. editing layout page
        :width: 650px

    6. Open the **Block Settigs** taband edit the pop-up show settings 

    .. fancybox:: img/Maxmind8.png
        :alt: city block. editing layout page
        :width: 650px

    7. Go to the storefront to see the created block.

    .. fancybox:: img/Maxmind_overview.png
        :alt: city block in the storefront
        :width: 650px

=====================
Setting up currencies
=====================

    With the IP Geolocation add-on, the store currency will be automatically set to the customer's currency depending on their country.

    .. fancybox:: img/Maxmind_Selection_033.png
        :alt: setting customer's currency
        :width: 650px

    To do this, go to **Administration - Currencies** and select the necessary currency from the list of existing currencies or add a new one by using the + button.

    .. fancybox:: img/Maxmind_Selection_031.png
        :alt: currencies
        :width: 650px

    On the currency editing page, select the countries you'd like to set the currency for and move them to the left section.

    .. fancybox:: img/Maxmind_Selection_032.png
        :alt: editing currency
        :width: 650px

====================
Setting up languages
====================

    The IP Geolocation add-on allows to automatically determine the customer's language in the store depending on their country.

    .. fancybox:: img/Maxmind_Selection_036.png
        :alt: determine the customer's language
        :width: 650px

    To make this feature work for your store, check to make sure that you have all the necessary languages installed in your store. To do this, go to **Administration - Languages - Manage languages**.

    .. fancybox:: img/Maxmind_Selection_034.png
        :alt: managing languages
        :width: 650px

    If you do not have the required language on the list, switch to the **Available** tab and install the desired language by clicking the corresponding button.

    .. fancybox:: img/Maxmind_Selection_035.png
        :alt: available languages
        :width: 650px

===============================
The city is not in the database
===============================

    When the city is determined and the user wants to change it, but it is not in the MaxMind database, they can enter their city and click **My city is not in the list**.

    .. fancybox:: img/Maxmind_Selection_25.png
        :alt: city is not in the list
        :width: 650px

    Then the user will be offered to enter the Country and State/Province for the city and click Add.

    .. fancybox:: img/Maxmind_Selection_026.png
        :alt: selecting country and state for the city
        :width: 650px

    Once the city is added, a notice will be displayed:

    .. fancybox:: img/Maxmind_Selection_027.png
        :alt: displaying notice
        :width: 650px

    The added city will also appear in the admin panel. Go to **Website - MaxMind cities** to see it:

    .. fancybox:: img/Maxmind_Selection_028.png
        :alt: MaxMind cities
        :width: 650px

    It is recommended to translate the name of the city into the corresponding language.

=========================================
Changing content of the block and pop-ups
=========================================

    It is possible to change the content of the *Your city is* block (displayed in the header of the site) and pop-ups (that appear in case the city is determined and not determined) by creating hooks.

++++++++++++++++++++
Content of the block
++++++++++++++++++++

    .. fancybox:: img/Maxmind_Selection_024.png
        :alt: block
        :width: 650px

    1. Navigate to [CS-Cart dir root]/design/themes/[your_theme]/templates/addons/.

    2. Create a my_changes/hooks/geoip/ folder.

    3. Create a block_content.override.tpl file in the folder.

    4. Insert these lines into the file:
    
    .. code::

        {if $geo_select.city_description}
        Your city is 
        {/if}
    
    5. Replace *Your city is* with the text you want to display.

    6. Clear the store cache via the admin panel.

++++++++++++++++++++++
Content of the pop-ups
++++++++++++++++++++++

    * city is determined 

    .. fancybox:: img/Maxmind_Selection_023a.png
        :alt: city is identified pop-up 
        :width: 300px
    
    * city is not determined

    .. fancybox:: img/Maxmind_Selection_010a.png
        :alt: city is not identified pop-up
        :width: 400px

    1.  Navigate to [CS-Cart dir root]/design/themes/[your_theme]/templates/addons/.

    2. Create a my_changes/hooks/geoip/ folder.

    3. Create a popup_content.override.tpl file in the folder.

    4. Insert these lines into the file:

    .. code::

        {if $geo_select}
        {__("your_city_is")} {$geo_select.city_description}. {__("correct_city")}? {* when the city is identified *} 
        {else}
        {__("cant_detect_city")}. {__("specify_your_city")}? {* when the city is not identified *}
        {/if}
    
    5. Replace the variables with the ones you want to display.

    6. Clear the store cache via the admin panel.