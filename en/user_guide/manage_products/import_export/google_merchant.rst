*****************************************************
How To: Export Product Data to Google Merchant Center
*****************************************************

CS-Cart and Multi-Vendor allow you to upload your product data to `Google Merchant Center <https://www.google.com/retail/merchant-center/>`_. This is done by exporting product data from your store to a file and `submitting that file to Google <https://support.google.com/merchants/#topic=3404780>`_.

===========================
Step 1. Install the Add-ons
===========================

#. In the Administration panel, go to **Add-ons → Manage add-ons**.

#. Switch to the **Browse all available** add-ons tab.

#. Make sure that the **Data feeds** and **Google export** add-ons are installed. If they aren't, install them.

   * The :doc:`Data feeds </user_guide/addons/data_feeds/index>` add-on allows you export data in CSV files formatted according to the requirements of third-party services.

   * The :doc:`Google export </user_guide/addons/google_export/index>` add-on allows you to use the field types required by Google in your data feeds.

     .. image:: img/data_feeds_and_google_export.png
         :align: center
         :alt: Both Data Feeds and Google Export add-ons must be installed, if you need to export products to Google Merchant Center.

====================================
Step 2. Check and Edit Your Products
====================================

.. important::

    On this step, you need to check whether your store has `all the information about products required by Google <https://support.google.com/merchants/answer/7052112>`_, and if its format complies with Google requirements.

#. Some of the fields required by Google are created automatically as :doc:`product features </user_guide/manage_products/features/index>` in the **Google export features** group. You'll see them on the product editing page and will be able to set their values, if applicable.

   .. image:: img/google_export_features.png
       :align: center
       :alt: Google export features

#. Depending on a product or country, Google may require other fields. If you don't have them, then :doc:`create product features </user_guide/manage_products/features/product_features>` that correspond to them. After that, specify their values for products, where applicable.

   .. note::

       If you use :doc:`product variations </user_guide/manage_products/products/product_variations>`, then `item_group_id <https://support.google.com/merchants/answer/6324507>`_ will be generated for them automatically, one unique ID per catalog item.

==========================
Step 3. Create a Data Feed
==========================

#. :doc:`Create a new data feed </user_guide/addons/data_feeds/create_df>` or edit the existing *Google base* feed according to your needs and `Google specifications <https://support.google.com/merchants/answer/7052112>`_. Here are a few things you should consider:

   * When you create a data feed for Google, make sure to choose *google_export* as a **Layout**. This will allow you to export product options to Google Merchant Center as described in step 2.2, but only if you add those Google options on the **Fields mapping** tab.

   * Select both product types (*Simple products* and *Variations*) on the data feed editing page. To select multiple types, hold **Сtrl**.

   * Make sure that the code of your store's :doc:`primary currency </user_guide/currencies/index>` conforms to `ISO 4217 <http://www.currency-iso.org/en/home/tables/table-a1.html>`_, and the weight measurement unit :doc:`specified in the settings </user_guide/settings/general>` is one of the following: lb, oz, g, kg.

   * GTIN is a key identifier of a product. If you don't specify GTIN as a feature, product's SKU from the CODE field will be used.

   * Tax rules:

     * For the US, don't include tax in the price.

     * For Canada and India, do not include any value added tax in the price.

     * For all other countries, value added tax (VAT) has to be included in the price.

#. To generate a feed file, click the **gear** button and choose **Download**.

   .. image:: img/download_data_feed.png
       :align: center
       :alt: Click the gear button next to the feed and choose Download to get the feed file.

=================================
Step 4. Submit the Feed to Google
=================================

Google provides the instructions on how to `register <https://support.google.com/merchants/answer/188475>`_ and `submit <https://support.google.com/merchants/answer/188477>`_ a product feed. We recommend you submit a test feed first, to make sure that there are no errors.
