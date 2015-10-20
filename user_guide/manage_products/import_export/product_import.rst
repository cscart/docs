**************
Product Import
**************

To import the products to the store:

*   In the Administration panel, go to **Administration > Import data > Products**.
*   Make sure the fields in your CSV file have the same names as the ones listed under the **Products** section on this page. Also check whether the values of the fields have the correct format. For more information about the correct format read the :doc:`Imported fields format <../import_export/fields_format>` article.

.. image:: img/import_01.png
    :align: center
    :alt: Import data

.. important::

	If language is not specified in a csv file, the default language will be used instead.

*   In the **Import options** section, specify the following settings:

    *   **Category delimiter** - Select the delimiter of the category path which is used in the CSV file.
    *   **Feature variants delimiter** - Select a feature variants delimiter, that will be used in the CSV file.
    *   **Images directory** - Specify the path to the directory where images are located. This will be used if the image file is specified without a path in the CSV file.
    *   **Files directory** - Specify the path to the directory where product files (for downloadable products) are located. This will be used if the **File** field data is specified without a path in the CSV file.
    *   **Delete all existing product files before import** - Select this check box if you want to delete all files of your existing downloadable products.
    *   **Reset inventory** - Select this check box if you want to reset inventory for all products.
    *   **Price decimal separator** - Type a decimal separator for product prices, that will be used in the CSV file.
    *   **CSV delimiter** - Select the CSV delimiter, which is used in the CSV file (e.g. comma, semicolon, tab).
    *   **Select file** - Choose location of the CSV file with the import data and select this file.

    .. note::

    	For example: If your file is located on your local computer, click the **Local** button and select the file.

*   Click the **Import** button.

.. image:: img/import_02.png
    :align: center
    :alt: Import options

To get an example of the correct CSV file, export your products in the **Products** tab on the **Export data** page in your Administration panel, or refer to the :doc:`article of the product import example <../import_export/import_example>`.

.. important::

	The **Product code** field is mandatory and must be unique for each product. If its value is equal to the existing product code, this product data will be replaced with the imported data.