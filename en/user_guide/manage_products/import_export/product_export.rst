****************************************
How To: Export Products and Product Data
****************************************

#. In the Administration panel, go to **Administration → Export data → Products**.

#. (optional) If you only want to export some specific products, then:

   * Click **Select** in the **Notes** section on the right. This will open the product list.

   * Tick the checkboxes of the products you'd like to export.

   * Click the gear button in the upper right part of the page and choose **Export selected**. 

   * You'll be taken back to the **Export data** page, but this time only specific products will be selected for export.

#. Make sure that all the fields you want to export are in the **Exported fields**; move other fields to the **Available fields** box.

   .. image:: img/export_01.png
       :align: center
       :alt: Selecting the product fields to export in CS-Cart.

#. Specify the following settings:

   * **Language**—the languages that will be exported to the CSV file.

   * **Category delimiter**—the delimiter that will separate parent and child categories in the category path in the exported CSV file.

   * **Feature variants delimiter**—the delimiter that will separate the feature variants in the exported CSV file.

   * **Images directory**—the path to the directory where images will be located. This will be used if the image file is specified without a path in the exported CSV file.

   * **Files directory**—the path to the directory where product files will be located. This will be used if the product file is specified without a path in the exported CSV file.

   * **Price decimal separator**—the symbol that will separate the integer part from the fractional part in product prices in the exported CSV file.

   * **CSV delimiter**—the column delimiter that will be used in the exported CSV file.

   * **Output**—the way the CSV file will be presented:

     * *Direct download*—you'll be offered to download the CSV file.

     * *Screen*—the CSV file will be opened in your browser.

     * *Server*—the CSV file will be saved on the server where your CS-Cart/Multi-Vendor is installed.

   * **Filename**—the name that the exported CSV file will get.

     .. image:: img/export_02.png
         :align: center
         :alt: The export settings in CS-Cart.

#. Click the **Export** button.
