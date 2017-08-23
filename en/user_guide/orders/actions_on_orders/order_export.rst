*********************
How To: Export Orders
*********************

#. In the Administration panel, go to **Administration → Export data → Orders**.

   .. important::

       The **Orders** tab is open by default; it allows you to export customer information and all data about orders, except for the products in those orders. Products can be exported from the **Order items** tab.

#. (optional) If you only want to export some specific orders, then:

   * Click **Select** in the **Notes** section on the right. This will open the list of orders.

   * Tick the checkboxes of the orders you'd like to export.

   * Click the gear button in the upper right part of the page and choose **Export selected**. 

   * You'll be taken back to the **Export data** page, but this time only specific orders will be selected for export.

#. Make sure that all the fields you want to export are in the **Exported fields** box; move other fields to the **Available fields** box.

   .. image:: img/order_exported_fields.png
       :align: center
       :alt: The list of exported fields for orders.

   .. hint::

       If you export data regularly, you can save the list of the exported fields: enter the name of your export pattern in the **Save layout as** field and click **Save**. Then you’ll be able to select your layout in the **Layout** drop-down list.

#. Specify the following settings:

   * **CSV delimiter**—the symbol that will separate columns in the exported CSV file.

   * **Output**—the result of the export:

     * *Direct download*—you'll be offered to download the CSV file.

     * *Screen*—the CSV file will be opened in your browser.

     * *Server*—the CSV file will be saved on the server where your CS-Cart/Multi-Vendor is installed.

   * **Filename**—the name that the exported CSV file will get.

     .. image:: img/order_export_options.png
         :align: center
         :alt: Order export options.

#. Click the **Export** button.
