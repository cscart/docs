****************************
How to Add and Edit Products
****************************

CS-Cart allows to add and edit products using different methods.

.. contents::
    :local: 
    :depth: 2

=====================
Simple Product Adding
=====================

1. Go to the **Products** page and click the **+** button.

    .. note::

        Admin panel → Products → Products → +
        

    .. image:: img/catalog_29.png
        :align: center
        :alt: Products

    You will open the product creation page.


2. Fill in the required fields for each product:

    *   Name

    *   Categories

    *   Price

    *   Status

    .. image:: img/catalog_30.png
        :align: center
        :alt: Products

    .. note::

        Also you can fill in all unrequired fields. After the product is created the number of available settings will increase.
        All settings can be edited at any time.

3.  Click the **Create** button.

==========================
Adding a Group of Products
==========================

1. Go to the Products page, click the **gear** button and choose **Bulk product addition**.

    .. note::

        Admin panel → Products → Products → Gear → Bulk product addition

    .. image:: img/catalog_31.png
        :align: center
        :alt: Products

2. Add products and fill in empty fields.

    .. image:: img/catalog_32.png
        :align: center
        :alt: Products

3.  Click **Create**.

=================
Cloning a Product
=================

If you have a group of products with identical settings and parameters, instead of adding a new product and reentering the settings you can:

1. Set up one product with the common settings.

2. Clone the sample product.

3. Change names and individual settings of the cloned products.

You can clone a product on the Products page:

1. Go to the Products page.

    .. note::

        Admin panel → Products → Products

2. Choose a product that needs to be cloned.

3. Click the gear button and choose **Clone selected**.

    .. image:: img/catalog_33.png
        :align: center
        :alt: Products

4. The clone will be created with **Disabled** status.

    .. image:: img/catalog_34.png
        :align: center
        :alt: Products

5. Edit the clone and enable it by changing its status to **Active**.

Also you can clone a product on the product editing page. 

1. Go to the product editing page.

2. Click the gear button → Clone.

    .. image:: img/catalog_35.png
        :align: center
        :alt: Products

====================================
Edit Selected (Mass Product Editing)
====================================

You can edit fields and settings of a group of products.

1. Go to **Products**.

    .. note::

        Admin panel → Products → Products

2. Select products and click **Edit selected**:         

    .. note::

        The gear button → Edit selected

    .. image:: img/catalog_75.png
        :align: center
        :alt: Products

3. Select the settings that need to be edited.

    .. note:: 

        Avoid choosing too much fields at once.

    .. image:: img/catalog_76.png
        :align: center
        :alt: Products

4. The selected fields and products are displayed on one page. 

    .. image:: img/catalog_77.png
        :align: center
        :alt: Products

Use the link **Apply values to all the selected products** at the top left corner to apply one value to all products.

==============
Product Import
==============

You can import (upload) products from a `CSV <http://ru.wikipedia.org/wiki/CSV>`_ file.

CSV is the most popular format of the spreadsheet. A line of the file is equal to a line of the table.

CSV file can be edited in spreadsheets such as LibreOffice, OpenOffice, Microsoft Excel.

.. note::

    We recommend you to use the free software package `LibreOffice <http://ru.libreoffice.org/>`_

To demonstrate the full process, first, let's export one of the products to CSV. 

1. Go to **Products**.

    .. note::

        Admin panel → Products → Products

2. Select one of the products, click the gear button and choose **Export selected**.

    .. image:: img/catalog_36.png
        :align: center
        :alt: Products

3. You'll be redirected to the **Export data** page. There you will be able to chose the exported fields and change export settings. Each field of export is the equivalent of the product setting. We recommend you to leave everything as is for the first time. After everything is set up, click **Export**.

    .. image:: img/catalog_37.png
        :align: center
        :alt: Products

4. Open the exported file in the spreadsheet. The default delimiter for CSV is semicolon.

    .. image:: img/catalog_39.png
        :align: center
        :alt: Products    

5. Each column of the table contains the specific type of the product data. 

The product is identified the Product code that means that:

* All products must have unique product codes.

* If the product code already exists in a database, it will be replaced.

* If the product doesn't exist in a database, it will be created.

The required fields for export are:

* Product code

* Language

        .. note::

            If the category doesn't exist in a database, it will be created. The tree and levels of categories are formed with line separators.

Other fields are optional. 

For the first time we recommend to use the required columns only.

6. Add new products to the table using the product presented as a sample. Each line is a new product.

    .. image:: img/catalog_40.png
        :align: center
        :alt: Products   

7. Save the file in the CSV format.

8. Import the products to the store. 

Go to **Import products** page

    .. note::

        Admin panel → Top menu → Administration → Import data → Products

    .. image:: img/catalog_41.png
        :align: center
        :alt: Products   

    .. image:: img/catalog_43.png
        :align: center
        :alt: Products   

9. At the bottom of the page choose a file to import and click the **Import** button.

    .. image:: img/catalog_42.png
        :align: center
        :alt: Products   

10. You'll receive an import notification.

* The number of products created.

* The number of products updated.

* The number of products skipped.

* The total number of products.

    .. image:: img/catalog_44.png
        :align: center
        :alt: Products    

Done!

========================
Adding a Digital Product
========================

CS-Cart allows to sell digital products. 

1. First, go to Settings → General and tick the **Enable selling downloadable products** setting.

    .. image:: img/catalog_66_1.png
        :align: center
        :alt: Products  

2. Add a product.

3. Open the **Files** tab on the product settings page.

    .. image:: img/catalog_66.png
        :align: center
        :alt: Products 

4. Add files. Files can be grouped by folders.

    .. image:: img/catalog_67.png
        :align: center
        :alt: Products      


The list of settings for each file:

* Name

* Position

* Folder

* File—the main file that will become available after a purchase.

* Preview—the file that is used for demonstration purposes.

* Activation mode:

  - Manually

  - Immediately

  - After full payment

* Max downloads—the max number of downloads for one order.

* License agreement

* Agreement required:

  - Yes

  - No

* Readme—description

5. The additional settings are available for digital products on the General tab in the Extra section.

* Downloadable—this setting is enabled automatically after the file was added to the product.

* Enable shipping for downloadable products

* Time-unlimited download  

    .. image:: img/catalog_69.png
        :align: center
        :alt: Products    

The digital product has been created. Create a test order and check the result.

All downloadable products have a notice saying that these products are electronically distributed.

.. image:: img/catalog_68.png
    :align: center
    :alt: Products      

After purchasing a digital product: 

1. The email with the download link is sent to a customer.

2. The download link will become available on the order details page of the customer's account.

    .. image:: img/catalog_70.png
        :align: center
        :alt: Products

3. All digital products are available on the **Downloads** page of the customer's account. 

    .. image:: img/catalog_71.png
        :align: center
        :alt: Products

    .. image:: img/catalog_72.png
        :align: center
        :alt: Products

In the Admin panel on the order page a new **Downloads** tab is added. An administrator can approve the download, prolong download time, and check the number of downloads left.

.. image:: img/catalog_73.png
    :align: center
    :alt: Products
