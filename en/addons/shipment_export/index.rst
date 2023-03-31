**************************
Shipment Export
**************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000115" class="btn buy-now__btn">Buy now</a>
    </div>


 
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Our `Shipment Export <https://www.simtechdev.com/addons/site-management/shipment-export.html>`_ add-on helps you export and import shipments in the CSV format in one click.

    The add-on creates an **Export selected** setting on the Shipments page. Click the button to export shipment details to a CSV file.

    .. fancybox:: img/Shipment_export_004.png
        :alt: Shipment Export

    It can then be opened in Microsoft Excel or OpenOffice Calc and printed out.

    .. fancybox:: img/Shipment_export_003.png
        :alt: Shipment Export

    You can also import shipments easily by going to **Administration > Import data > Shipments**.

    .. fancybox:: img/Shipment_export_007.png
        :alt: Shipment import

    Simply install the add-on and you're all set!

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.5 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? |Contact us now.|
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Shipment Export add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://export-shipments.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Shipment Export” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Shipment_export_001.png
        :alt: CSV Export add-on

=====================
Setting up the add-on
=====================

    The settings of the add-on allow you to select a CSV delimiter to define how the columns will be separated from each other in your CSV file.

    .. fancybox:: img/Shipment_export_011.png
        :alt: Shipment Export settings

===================
Exporting shipments
===================

    You can export shipments on the **Shipments** page (Orders > Shipments).

    Select the items you want to export, click the gear button in the top right and select **Export selected** setting to download a CSV file.

    .. fancybox:: img/Shipment_export_004.png
        :alt: exporting shipments

    The file will be downloaded right away:

    .. fancybox:: img/Shipment_export_003.png
        :alt: exporting shipments

    You can also export all shipments via data export and select the fields that you want to export.

    .. fancybox:: img/Shipment_export_006.png
        :alt: exporting shipments

===================
Importing shipments
===================

    To import shipments:

    1. Go to **Administration > Import data > Shipments**.

    2. Select the CSV delimiter.

    .. fancybox:: img/Shipment_export_008.png
        :alt: importing shipments

    3. Select the import file.

    4. Click **Import** at the top right.

    5. The process will start.

    .. fancybox:: img/Shipment_export_010.png
        :alt: importing shipments

    6. You should see a brief report about the new and updated objects in the appeared notice.

    .. fancybox:: img/Shipment_export_009.png
        :alt: importing shipments

    .. important::

        Do not change the amount in the file, otherwise one more shipment will be created.

        Make sure that the time and tracking code of the shipment are the same for all products in it, otherwise one more shipment will be created.