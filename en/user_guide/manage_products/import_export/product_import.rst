*****************************************************
How To: Import Products and Product Data (Old Method)
*****************************************************

.. note::

    This article describes the old product import. Starting with version 4.8.1, we recommend using :doc:`advanced product import </user_guide/manage_products/import_export/advanced_product_import>` instead.

#. In the Administration panel, go to **Administration → Import data → Products (Deprecated)**.

#. Make sure the columns in your CSV file have the same names as the ones listed in the **Products** section on this page. Also check whether or not the values of the fields have :doc:`the correct format </user_guide/manage_products/import_export/fields_format>`.

   .. hint::

       To get an example of the correct CSV file, :doc:`export your existing products <product_export>` or :doc:`use the example made by us <import_example>`.

   .. image:: img/import_01.png
       :align: center
       :alt: The names of the columns in an imported CSV file.

   .. important::

       The **Product code**, **Language**, and **Store**/**Vendor** fields are mandatory. The **Product code** field must be unique for each product. If its value is equal to an existing product code, the data of this product will be replaced with the imported data. If language is not specified in the CSV file, the default language will be used.

#. Specify the following settings:

   * **Update existing products only**—if you enable this setting, then products that don't exist in the database of your store will be skipped during import. New products won't be created, and if the imported file has products that already exist in the database of the store, then those products will be updated.

   * **Images directory**—the path to the directory where the imported images are located. This will be used if the image file is specified without a path in the imported CSV file.

   * **Price decimal separator**—the symbol that is used to separate the integer part from the fractional part in product prices in the imported CSV file.

   * **Category delimiter**—the delimiter that separates parent and child categories in the category path in the imported CSV file.

   * **Feature variants delimiter**—the delimiter that separates the feature variants in the imported CSV file.

   * **Directory for the files of downloadable products**—the path to the directory where the imported product files are located. This will be used if the product file is specified without a path in the imported CSV file.

   * **Set quantity of all products to zero**—шf you enable this setting, all the products in your store will have their quantity set to 0, except for the products that have the quantity specified in the imported file.

   * **Delete existing files of downloadable products**—if you enable this setting, then importing downloadable products will delete their existing files. If the setting is disabled, the new files of downloadable products will simply be added to existing files.

   * **CSV delimiter**—the column delimiter that is be used in the imported CSV file.

   * **Select file**—the imported CSV file. You can upload the file CSV from your computer, select a file on your server, or provide a link to the file.

#. Click the **Import** button.

   .. hint::

       Once the import is complete, you'll be able to see the updated products: go to **Products → Products** and use the **Recently Updated** saved search to see all the products that were updated within the last hour. You can also use the advanced search to specify a different time period. The search for recently updated products first appeared in version 4.7.1.

   .. image:: img/import_02.png
       :align: center
       :alt: The product import settings in CS-Cart.
