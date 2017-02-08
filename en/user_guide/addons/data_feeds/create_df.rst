************************
How To: Create Data Feed
************************

1. In the Administration panel, go to **Add-ons → Data feeds**. The section contains a list of data feeds available in the store.

.. image:: img/datafeeds_01.png
	:align: center
	:alt: Data feeds

2. Click the **+** button to add data feed.

3. Fill in the following fields in the opened window:

   * **Layout** — the layout used by your data feed. Usually you should choose *general_data_feeds*. But if you are creating a data feed for :doc:`Google Merchant Center </user_guide/manage_products/import_export/google_merchant>`, select *google_export*.
   * **Data feed name** — name of the data feed.
   * **File name** — name of the exported file.
   * **Enclosure** — delimiter to separate fields in the uploaded data table.
   * **Language** — language of the data in the feed.
   * **Category delimiter** — delimiter to separate child and parent categories.
   * **Feature variants delimiter** — delimiter for product feature variants.
   * **Images directory** — directory where product images are located. Used for images without a path specified.
   * **Files directory** — directory where files for downloadable products are located. Used for files without a path specified.
   * **Price decimal separator** — decimal separator for product prices.
   * **Exclude disabled products** — if selected, products that are disabled in the product catalog are not included in the data feed.
   * **CSV delimiter** — delimiter to separate data in the feed.
   * **Status** — status of the data feed: *Active* or *Disabled*.
   * **Server directory** — directory on your server where the data feed will be exported to. Make sure the directory has writable `permissions <http://docs.cs-cart.com/4.4.x/install/useful_info/permissions.html>`_.
   * **FTP server** — URL of the target directory on the FTP server to which the data feed must be uploaded.

     .. note::

         The URL that you enter into this field must be of the following format: **host[:port]/directory**. For example, *ftp.example.com:21/home/johndoe/feeds*.

   * **FTP username** — your username to access the FTP server.
   * **FTP password** — your password to access the FTP server.
   * **Export by cron to** — option to select where the data feed must be uploaded to: a directory on the current server or a third-party FTP server.

4. Open the **Exported items** tab and add products and/or categories. To do that click the **Add categories** or **Add product** buttons.
5. Open the **Fields mapping** tab ande arrange a list of fields included in the data feed. Each field has the following attributes:

   * **Pos.** — position of the field relatively to the position of the other fields in the data feed.
   * **Field name** — name of the field.
   * **Field type** — meaning of the data in the field.
   * **Active** — tick the checkbox to control the availability of the field.

5.  Click **Create**. The new data feed will appear among the other data feeds in your store.
