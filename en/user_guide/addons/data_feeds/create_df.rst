************************
How To: Create Data Feed
************************

#. In the Administration panel, go to **Add-ons → Data feeds**. The page contains a list of data feeds available in the store.

#. Click the **+** button to add data feed.

#. Fill in the following fields in the opened window:

   * **Layout**—the layout used by your data feed. Usually you should choose *general_data_feeds*. But if you are creating a data feed for :doc:`Google Merchant Center </user_guide/manage_products/import_export/google_merchant>`, select *google_export*.

   * **Data feed name**—the name of the data feed in the Admin panel.

   * **File name**—name of the exported file with the feed.

   * **Enclosure**—the delimiter to separate fields in the uploaded data table.

   * **Product type**—this setting allows you to limit the export of some variations. By default, all the products and variations will be exported. But you can choose to export :doc:`only catalog items or only their variations </user_guide/manage_products/products/product_variations>`.

   * **Language**—the language of the data in the feed.

   * **Category delimiter**—the delimiter to separate parent and child categories.

   * **Feature variants delimiter**—the delimiter to separate the product feature variants.

   * **Images directory**—the directory where product images are located. Used for images that don't have a specified path.

   * **Files directory**—the directory where files for downloadable products are located. Used for files that don't have a specified path.

   * **Price decimal separator**—decimal separator for product prices.

   * **Exclude disabled products**—if you enable this setting, products that are disabled in the product catalog won't be included in the data feed.

   * **CSV delimiter**—the delimiter to separate data in the feed.

   * **Status**—the status of the data feed: *Active* or *Disabled*.

   * **Server directory**—the directory on your server where the data feed will be exported to. 

     Make sure the directory has writable :doc:`permissions </install/useful_info/permissions>`.

   * **FTP server**—the URL of the target directory on the FTP server to which the data feed must be uploaded.

     .. note::

         The URL that you enter into this field must be of the following format: **host[:port]/directory**. For example, *ftp.example.com:21/home/johndoe/feeds*.

   * **FTP username**—your username to access the FTP server.

   * **FTP password**—your password to access the FTP server.

   * **Export by cron to**—select where the data feed must be uploaded: to a directory on the current server or to another FTP server.

#. (optional) You can limit the export to a part of your catalog, if necessary. Switch to the **Exported items** tab and add products and/or categories that need to be exported.

#. Open the **Fields mapping** tab and set up the list of fields that the data feed will contain. Each field has the following attributes:

   * **Pos.**—the position of the field relatively to the position of the other fields in the data feed.

   * **Field name**—the name of the field.

   * **Field type**—the source of the data in the field.

   * **Active**—tick the checkbox to control the availability of the field.

#. Click **Create**. 

   The new data feed will appear among the other data feeds in your store. Now you can generate the file with product data, download it to your machine, or upload it to an FTP server of your choice.

.. meta::
   :description: How to set up a product data feed in CS-Cart online store or Multi-Vendor marketplace.
