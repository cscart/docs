******************
XML & CSV
******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/xml-import.html" class="btn buy-now__btn">Buy now</a>
    </div>

.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The `XML & CSV addon <https://marketplace.simtechdev.com/xml-import.html>`_ allows you easily import products from any XML, CSV, JSON or YML file to your CS-Cart store. Save yourself hours with this add-on and make inventory management hassle free.
    With the XML Import add-on, your product data will be sent to your store keeping you ahead of your competitors with the newest products. You can be sure the product stock quantities are always up-to-date. The add-on allows you to automatically update product catalogs including changes to prices, inventory stock quantities, and new product additions.

    An easy field mapping feature allow you to easily overcome the divergent data formats of suppliers and synchronize only the appropriate data fields to your store.

    .. fancybox:: img/XML_1.png
        :alt: Fields mapping tab

    .. important::

        To import CSV files, please use **Open Office** or **Libre Office Calculator**. Microsoft Excel uses Windows-1251 character set while CS-Cart uses UTF-8 character set. There might be an error during the import if you are using MS Excel.

        Download :download:`an example CSV file <download_file/csv-sample.csv>`.

        The add-on also enables you to import XML files with the YML (Yandex Market Language) format. Download :download:`an example YML file <download_file/test_yml_file.xml>`. 

        To import a XLSX file, save it as CSV and import the CSV file.

    The XML & CSV add-on makes the complicated import tasks simple and fast.

=====================
Fields you can import
=====================

    **1. Product fields**

    - Product name
    - Product code
    - Price
    - Currency
    - Category
    - External category id
    - External category parent_id
    - External category parent name
    - Secondary categories
    - List price
    - Status
    - Quantity
    - Weight
    - Min quantity
    - Max quantity
    - Quantity step
    - List qty count
    - Shipping freight  
    - Date added
    - Downloadable  
    - Language
    - Files
    - Ship downloadable
    - Inventory tracking
    - Out of stock actions
    - Free shipping 
    - Zero price action
    - Detailed image
    - Additional images 
    - Description
    - Short description
    - Meta keywords
    - Meta description
    - Search words
    - Page title
    - Promo text
    - Taxes
    - Available since
    - SEO name
    - Product type
    - Parent product id
    - Variation options 
    - Variotion group code
    - Variation set as default

    **2. Product options**

    **3. Product features**

.. note::
    Select *Variations as separate products* option in the target feature settings in order to import variations correctly. The name of the first product of the group will be repeated for all products of the group, in case the *Variations as one product* option is selected.

========
Features
========

    - Seamlessly import data in the XML, CSV, and YML formats.

    - Quickly upload and sync your product data including new products.

    - Keep up with pricing and inventory changes.

    - Enjoy the fields mapping and category mapping features.
    
    - Control the fields to be imported with presise setting of the main fields

    - Import products automatically by a cron script.

    - Clone import profiles.

    - Allow/forbid administrators to manage import.

    - Modifi the imported data (using standart Advanced Products Import addon)

    - Import common products for vendors (Common Products for Vendors add-on support)

    - Convert the currency during importing

    - Seamlessly import data in the XML, CSV, JSON and YML formats.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 7.1.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.
    
====
Demo
====

    Check out the XML & CSV add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://xml-import.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the XML & CSV add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    .. fancybox:: img/XML2.png
        :alt: settings of the XML import add-on

    * **License key**— liecence key of the product.

    * **All vendors can import products**—If enabled, vendors will be able to import products to the store.

    * **Hide Cron tab**—When switched on, the tab with the sittings for sceduled import is hidded for vendors.

    * **Cron password**—Enter a cron password that will be used to set up a cron script.

    * **Notify administrator by e-mail when the import is completed**—If enabled, the administrator will be notified of the completed import when it is made by cron.

    * **Notify vendor by e-mail when the import is completed**—If enabled, the vendors will be notified of the completed import when it is made by cron.

    * **Imported quantity of products per iteration**-Allows to alter the quantity of the products to be imported per iteration.

    * **URL for product import**—Use this link to run import by cron. For example, you can import the whole catalog every 24 hours and update prices and stock every 5 minutes. See `How to set up a cron job in cPanel`_.

    Use the following command:

    .. code::

        php /path/to/cart/snikers.php --dispatch=run_import_xml.import --cron_password=MYPASS

    where:

    *path/to/cart* is the path to the root store directory

    *cron_password* is the access key to cron script that you should take from the **Cron password** field.

==============
Importing data
==============

    The add-on creates a new **XML & CSV profile** page, where you can see a list of all created profiles with the ability to delete, edit, add, and import profiles. 

    You can also see the import status:

    * Open—Means that an import profile has been created, but has not been imported yet.
    * Complete—Means that the import has been completed.
    * In progress—Means that the import is now running.
    * Redirect—Means that the first 1000 products have been imported. To complete import, run the import again.

    .. fancybox:: img/XML3.png
        :alt: XML import page

    To import products, follow these steps:

    1. Click the **+** button to add a new import profile.

    2. In the **General** tab, enter a name for the import profile and choose the type of the file you are going to import.

    .. note::

        If you want to import a file of another type, `contact us for help <https://www.simtechdev.com/quote.html>`_.

    .. fancybox:: img/XML4.png
        :alt: XML import page

    .. important::

        To import CSV files, please use **Open Office** or **Libre Office Calculator**. Microsoft Excel uses Windows-1251 character set while CS-Cart uses UTF-8 character set. There might be an error during the import if you are using MS Excel. 

        To import a XLSX file, save it as CSV and import the CSV file.



    3. Click **Create**.

    4. Switch to the **Options** tab and configure the following settings:

    Display example with selected CSV file type for import:

    .. fancybox:: img/XML5.png
        :alt: XML import page

    **Select file**—Choose location of the XML or CSV file with the import data and select this file.

    **CSV delimiter**—Choose the delimiter in import file

    **Primary**—Choose the primary field of the product.
    Available options: Product name, Product code, Features

    **Use additional primary field**—Adds the option to choose and use the additional primary product field for importing. When switched on the  additional primary field becames required to fill.

    **Additional primary field**—Additional primary product field for product identification
    Available options: Product name, Product code, Features

    **Primary fields check method**—Two options are available to choose. 
    All: the select is made by the primary and additional fields at once. 
    Cascade: the selection is performed first by the primary field, then by the additional one

    .. important::
     Product fields that are meant to define the product from the list are considered to be the primary field in such context. 
     For instance: SKU, GTIN, MPN, EAN, EAP etc.

    **Language**—Select one of the enabled languages in the store.
    
    **Category delimiter**—Select the delimiter of the category path which is used in the file.

    **Feature variants delimiter**—Select a feature variants delimiter that is used in the file.

    **Images directory**—Directory where images are located. This will be used if an image file is specified without a path. Specify the path to the directory where images are located. This is used if the image file is specified without a path in the file. Alternatively, you can specify the URL to the images directory. (It will be automatically used if the value contains http or https).

    .. note::
        .php URLs for images are considered as an incorrect image format and *incorrect image extension* notice will be displayed on the uploading attempt 

    **Files directory**—Specify the path to the directory where product files (for downloadable products) are located. This is used if the File field data is specified without a path in the file.

    **Reset inventory**—Quantity of all products in the store will be reset.

    **Price decimal separator**—Type a decimal separator for product prices that is used in the file.

    **Option delimiter**—Type a separator for option delimiter that is used in the file.

    **Price margin/discount**—Specify a discount or margin in percentage or a fixed amount.

    **Disable SSl certificate verification**—Allows to switch off the SSL-certificate check.

    5. Click **Save**.

    6. If you are importing a YML file or an XML file with containers, you will see the **Containers** tab. Otherwise, skip this step.

    In the **Containers** tab, define the following settings:

    .. fancybox:: img/XML6.png
        :alt: Containers tab

    * **Container of categories**—Select the container that consists of product categories in the file to be imported. The drop-down list will have all containers from your file.

    Have a look at this example. As you can see, the **<categories>** container consists of product categories.

    .. fancybox:: img/XML7.png
        :alt: import process
        :width: 674px

    * **Container of products**—Select the container that consists of products in the file to be imported. The drop-down list will have all containers from your file.

    Example:

    .. fancybox:: img/XML8.png
        :alt: import process

    The **<offers>** container contains products in this file.

    .. tip::

        Usually the containers are the following:

        **Categories**—Product categories
    
        **Offers**—Products
    
        **Offer**—Specific product

    7. Click **Save** again to make further settings appear.

    8. In the **Fields mapping** tab, arrange a list of fields included in the data feed. Each field has the following attributes:

    .. fancybox:: img/XML9.png
        :alt: Fields mapping tab

    **Field name**—Name of the field.

    **Field type**—Meaning of the data in the field.

    **Modifier**—Functions that alter the importing data.
    **Modifiers list** button will show all modifiers and the ways of their use. The functionality of the standard Advanced product import add-on is used. `Learn more. <https://docs.cs-cart.com/latest/user_guide/manage_products/import_export/advanced_product_import.html>`_

    .. fancybox:: img/XML10.png
        :alt: Modifiers list button

    .. fancybox:: img/XML11.png
        :alt: Modifiers list

    **Create**—Tick the checkboxes next to the fields you want to import for new products.

    **Update**—Tick the checkboxes next to the fields you want to update for existing products.

    For YML and XML files with containers, also do the product fields mapping.

    .. fancybox:: img/XML12.png
        :alt: Fields mapping tab

    9. In the **Category mapping** tab, you can match product categories from the import file with product categories in your store. Link categories manually if they were not linked automatically.

    .. fancybox:: img/XML13.png
        :alt: Import items tab

    .. fancybox:: img/XML14.png
        :alt: Import items tab

    You can also quickly link and create multiple categories using the bulk editing feature.

    .. fancybox:: img/XML15.png
        :alt: import process

    10. The **Cron** tab contains the command that you can run to make import start automatically according to a schedule. You can select one of the preset periods, or define your own.

    .. fancybox:: img/XML16.png
        :alt: setting up cron

    In order to know how to set up cron, navigate to this section: `How to set up a cron job in cPanel`_.

    11. Save the changes and click the **Import** button to run import.

    .. fancybox:: img/XML17.png
        :alt: importing data in XML file

    The import process may take some time. You will see the result once it's complete.

    .. fancybox:: img/XML18.png
        :alt: product import completed
        :width: 300px

    If you need to restart category mapping, activate the "Restart category mapping" checkbox on the "Categories" tab  and click "Save" button:

    .. fancybox:: img/XML27.png
        :alt: product import completed
        :width: 300px

    The categories will be automatically mapped again, during the process of saving the preset.

=======================
Cloning import profiles
=======================

    The ability to clone import profiles will save you time on setting up profiles with similar settings.

    To clone an import profile:

    1. Go to **Add-ons > XML & CSV**.

    2. Select the profile you want to clone and hover the mouse pointer over it. Click the gear button and select **Clone**.

    .. fancybox:: img/XML19.png
        :alt: cloning import profile

    3. The profile will be cloned and you will be redirected to the editing import profile page where you can adjust the import profile the way you need.

    .. note::

        The import profile is cloned with the **Disabled** status.

    4. Click **Save**.

=================================
Common Products add-on Adaptation 
=================================
    The add-on is compatible with the standard add-on Common Products by default.

    In order to import products, assigning them common for the marketplace, you need to go through the following steps:

    1. Log in as an administrator of the marketplace 

    2. Open the import preset settings

    3. Select *All vendors (common products)* in the Vendor field on the General settings tab

    .. fancybox:: img/XML20.png
      :alt: Vendor field

    After that the selection of the importing product to sell will be available for the Vendor's administrators:

    .. fancybox:: img/XML21.png
      :alt: Products to sell

    In order to update the common product for particular vendor as an administrator, the product needs to be selected on the General setting tab of the import preset.

    .. fancybox:: img/XML22.png
      :alt: Product update

    By so doing all the products sold by the vendor will be updated.

    .. important::
     NOTE! Products won't be updated, if the vendor doesn't sell them
     (**Sell this** option hasn't been selected). 


===================================================
Allowing/forbidding administrators to manage import
===================================================

    To allow/forbid administrators/managers to manage import, follow these steps:

    1. Go to **Customers > User groups**.

    2. Select an existing group or create a new one.

    .. fancybox:: img/XML23.png
        :alt: user groups

    3. Switch to the **Privileges** tab and find the **Product privileges** field.

    .. fancybox:: img/XML24.png
        :alt: privilege to manage catalog

    If select the Full access for this privilege, administrators of this user group will have access to import functionality, i.e. they will be able to view, edit and start import.

    If you select Can view only or No access option, administrators of this user group will NOT have access to import functionality, i.e. they will NOT be able to view, edit or start import.

---------------------------
Advanced Import Comparison
---------------------------

=================
Comparison table
=================

+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|                          | Advanced products import      | XML & CSV                                                                           |
+==========================+===============================+================================================================================================+
|File import Format        | XML, CSV                      | XML, CSV, YML, JSON                                                                            |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Support of the XML        |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|container format          | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Common products           |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|add-on compatibility      | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Import by vendor          |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|ability                   | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Primary fields setup      |Product code obligatory field  |Primary field can be mentioned, and additional field can be selected;                           |
|                          |                               |                                                                                                |
|                          |                               |Select the primary fields check:                                                                |
|                          |                               |                                                                                                |
|                          |                               |* All: Selection is performed for primary and additional fields simultaneously                  |
|                          |                               |* Cascade: Selection is performed for the primary field first, and then for the additional field|
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Modificators              |.. fancybox:: img/chm.png      |.. fancybox:: img/chm.png                                                                       |
|                          | :alt: check mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Category mapping          |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|                          | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Automatic category mapping|.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|                          | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Characteristic mapping    |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|                          | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Options mapping           |.. fancybox:: img/chm.png      |.. fancybox:: img/chm.png                                                                       |
|                          | :alt: check mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+
|Currency conversion while |.. fancybox:: img/crm.png      |.. fancybox:: img/chm.png                                                                       |
|importing                 | :alt: cross mark              | :alt: check mark                                                                               |
|                          | :height: 50px                 | :height: 50px                                                                                  |
|                          | :width: 50px                  | :width: 50px                                                                                   |
+--------------------------+-------------------------------+------------------------------------------------------------------------------------------------+

=======================
Productivity Comparison 
=======================

**Case 1: file №18 from Test-cases article**
File type: CSV

Modification:

* the column is added for the first row (client’s file is invalid)

Mapping:

+----------------------------+---------------------+
|                            |                     |
+============================+=====================+
|Article number              |Product code         |
+----------------------------+---------------------+
|Short description invoice   |Product name         |
+----------------------------+---------------------+
|Short description catalogue |Short description    |
+----------------------------+---------------------+
|Long description content    |Description          |
+----------------------------+---------------------+
|Advised salesprice          |Price                |
+----------------------------+---------------------+
|Image                       |Detailed image       |
+----------------------------+---------------------+

**Case 1.1: the row amount is limited to 300, import via cron**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |93,131,315              |112,660,111         |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |23,683,029              |**16,538,388**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**144,925,800**         |205,188,120         |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**145,820,968**         |205,276,528         |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |5,879,125               |**3,356,027**       |
+----------------------------------+------------------------+--------------------+

**Case 1.2: row amount is limited to 600, import via cron**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |191,184,957             |**163,016,898**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |39,270,405              |**32,447,672**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**269,030,024**         |384,054,496         |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**270,492,568**         |384,054,496         |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |9,110,713               |**6,561,605**       |
+----------------------------------+------------------------+--------------------+

**Case 1.3: row amount is limited up to 1500, import via cron**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |513,722,647             |**478,230,797**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |108,496,085             |**81,144,255**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**637,788,472**         |915,507,712         |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**637,788,472**         |915,596,120         |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |26,428,698              |**16,122,599**      |
+----------------------------------+------------------------+--------------------+

**Case 1.4.: row amount is limited to 4000, import via cron**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |1,667,661,362           |**1,437,923,564**   |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |317,876,318             |**219,683,250**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**1,668,562,536**       |2,392,049,424       |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**1,676,950,008**       |2,392,137,832       |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |75,641,126              |**43,052,215**      |
+----------------------------------+------------------------+--------------------+

**Results:**

    * Total Incl. Wall Time (lesser is better)

    .. fancybox:: img/xmlTable1.png

    * Total Incl. CPU (lesser is better)

    .. fancybox:: img/xmlTable2.png

    * Number of Function Calls (lesser is better)

    .. fancybox:: img/xmlTable3.png

**Case 2: file №24 from the Test-cases article (“light“ import, without images)**

File type: XML

File was not altered

For Advanced Product Import xml target = producten/product

Mapping (for instance, not real mapping):

+----------+------------+
|          |            |
+==========+============+
|productid |Product Code|
+----------+------------+
|productnr |Product Name|
+----------+------------+
|qty       |Quantity    |
+----------+------------+

**Case 2.1: 728 products, via console**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |61,198,583              |**51,684,746**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |50,625,993              |**32,199,606**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**200,981,832**         |427,060,648         |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**202,698,296**         |427,136,416         |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |14,215,435              |**6,279,150**       |
+----------------------------------+------------------------+--------------------+

**Case 2.2: 1639 products, via console**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |170,711,663             |**114,490,443**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |146,321,976             |**69,560,375**      |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**415,394,144**         |898,464,784         |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**418,834,640**         |898,540,176         |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |43,526,687              |**13,512,969**      |
+----------------------------------+------------------------+--------------------+

**Case 2.3: 3060 products, via console**

+----------------------------------+------------------------+--------------------+
|                                  |Advanced Product Import |XML & CSV|
+==================================+========================+====================+
|Total Incl. Wall Time (microsec): |495,997,936             |**227,342,864**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. CPU (microsecs):      |441,090,100             |**134,658,053**     |
+----------------------------------+------------------------+--------------------+
|Total Incl. MemUse (bytes):       |**776,231,624**         |1,707,308,776       |
+----------------------------------+------------------------+--------------------+
|Total Incl. PeakMemUse (bytes):   |**782,933,608**         |1,707,388,464       |
+----------------------------------+------------------------+--------------------+
|Number of Function Calls          |136,597,564             |**25,844,694**      |
+----------------------------------+------------------------+--------------------+

**Results:**

    * Total Incl. Wall Time (lesser is better)

    .. fancybox:: img/xmlTable4.png

    * Total Incl. CPU (lesser is better)

    .. fancybox:: img/xmlTable5.png

    * Number of Function Calls (lesser is better)

    .. fancybox:: img/xmlTable6.png


----------------------------------
How to set up a cron job in cPanel
----------------------------------

    **Cron Jobs** are used for scheduling tasks to run on the server.

    To create a cron job, complete the following steps:

    1. Select **Cron Jobs** in cPanel.

    .. fancybox:: img/XML26.png
        :alt: cron job in cPanel

    2. Fill in the form to create a cron job. Specify when the cron job should be executed. In the **Command** field, enter the command that will execute the cron script. You can find it in the add-on settings. Do not forget to specify the path to your store.

    The cron in the image below will run every day at 11:00PM.

    .. fancybox:: img/XML26.png
        :alt: cron job in cPanel
        :width: 759px

    .. note::

        If you have any difficulties with cron setup, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

    For more details, refer to `cPanel Documentation <https://documentation.cpanel.net/display/ALD/Cron+Jobs>`_.