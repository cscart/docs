****************************************
How To: Import Products and Product Data
****************************************

#. In the Administration panel, go to **Administration → Import data → Products**.

#. Make sure the columns in your CSV file have the same names as the ones listed in the **Products** section on this page. Also check whether or not the values of the fields have :doc:`the correct format <../import_export/fields_format>`.

   .. important::

       The **Product code**, **Language**, and **Store**/**Vendor** fields are mandatory. The **Product code** field must be unique for each product. If its value is equal to an existing product code, the data of this product will be replaced with the imported data. If language is not specified in the CSV file, the default language will be used.

   .. image:: img/import_01.png
       :align: center
       :alt: The names of the columns in an imported CSV file.

#. Specify the following settings:

   * **Category delimiter**—the delimiter that separates parent and child categories in the category path in the imported CSV file.

   * **Feature variants delimiter**—the delimiter that separates the feature variants in the imported CSV file.

   * **Images directory**—the path to the directory where images will be located. This will be used if the image file is specified without a path in the imported CSV file.

   * **Files directory**—the path to the directory where product files will be located. This will be used if the product file is specified without a path in the imported CSV file.

   * **Delete all existing product files before import**—tick this checkbox if you want to delete all files of your existing downloadable products.

   * **Reset inventory**—tick this checkbox if you want to reset inventory for all products.

   * **Price decimal separator**—the decimal separator that is used to separate the integer part from the fractional part in product prices in the imported CSV file.

   * **CSV delimiter**—the column delimiter that is be used in the imported CSV file.

   * **Select file**—the imported CSV file.

     .. note::

         You can upload the file CSV from your computer, select a file on your server, or provide a link to the file.

#. Click the **Import** button.

   .. image:: img/import_02.png
       :align: center
       :alt: The import settings in CS-Cart.

   .. hint::

       To get an example of the correct CSV file, `export your existing products <product_export>` or :doc:`use the example made by us <import_example>`.
