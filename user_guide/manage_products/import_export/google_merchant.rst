*****************************************************
How To: Export Product Data to Google Merchant Center
*****************************************************

CS-Cart and Multi-Vendor allow you to upload your product data to `Google Merchant Center <https://www.google.com/retail/merchant-center/>`_. This is done by exporting product data from your store to a file and `submitting that file to Google <https://support.google.com/merchants/#topic=3404780>`_.

===========================
Step 1. Install the Add-ons
===========================

1.1. In the Administration panel, go to **Add-ons → Manage add-ons**.

1.2. Switch to the **Browse all available** add-ons tab.

1.3. Make sure that the **Data feeds** and **Google export** add-ons are installed. If they aren't, install them.

* The :doc:`Data feeds </user_guide/addons/data_feeds/index>` add-on allows you export data in CSV files formatted according to the requirements of third-party services.

* The :doc:`Google export </user_guide/addons/google_export/index>` add-on allows you to use the field types required by Google in your data feeds.

.. image:: img/data_feeds_and_google_export.png
    :align: center
    :alt: The Data Feeds and Google Export add-ons must be installed for you to export products to Google Merchant Center.

==========================
Step 2. Edit Your Products
==========================

.. important::

    When going through this step, please make sure that your product data complies with `Google specification <https://support.google.com/merchants/answer/7052112>`_. Google `updated the requirements <https://support.google.com/merchants/answer/7000570>`_ in 2016. To meet those requirements, you may need to upgrade to CS-Cart/Multi-Vendor 4.4.1 or 4.5.1.

2.1. Specify Google-related product features for your products, where applicable. To do it, go to **Products → Products**, open any of the products, and switch to the **Features** tab. You’ll see **Google export features**.

Some of the Google export fearures are available only starting with CS-Cart/Multi-Vendor 4.4.1:

* Age group

* Gender

* Size type

* Size system

.. note::

    **Google export features** can be :doc:`exported to a CSV file </user_guide/manage_products/import_export/product_export>` along with other features when you export products. After editing the CSV file, you can import it back and update the values of your product features en masse that way.

.. image:: img/google_export_features.png
    :align: center
    :alt: Google export features

2.2. Starting with CS-Cart/Multi-Vendor 4.4.1, you can export your existing product options to Google as ``color``, ``size``, ``pattern``, and ``material``.  When you edit an option (either under **Products → Options**, or on the **Options** tab of a product), you can choose an **Equivalent in Google** for that option. 

For example, if your store has an option called **Color** and you select *Google color* as its **Equivalent in Google**, then the **Color option** will be the source of information for the **Google color** field type when you create a data feed.
      
.. image:: img/equivalent_in_google.png
    :align: center
    :alt: You can select equivalents in Google for your product options.

2.3. `Google’s GTIN requirements are expanding. <https://support.google.com/merchants/answer/6352134>`_ If you don’t enter the value for the GTIN feature in step 2.1, CS-Cart/Multi-Vendor 4.5.1 and newer versions will try to use the **CODE** field of the product as GTIN.

Also, starting with CS-Cart/Multi-Vendor 4.5.1, we have improved the export of :doc:`option combinations </user_guide/manage_products/options/option_combinations>`:

* The **CODE** field of an option combination is exported as this combination’s GTIN.

* The image of the combination is exported for that combination instead of the main product image.

.. image:: img/combination_gtin.png
    :align: center
    :alt: Enter GTIN in the combination's CODE field before exporting that combination to Google.

==========================
Step 3. Create a Data Feed
==========================

3.1. Go to **Add-ons → Data feeds**.

3.2. :doc:`Create a new data feed </user_guide/addons/data_feeds/create_df>` or edit the existing *Google base* feed according to your needs and `Google specifications <https://support.google.com/merchants/answer/7052112>`_.

3.3. To generate a feed file, click the **gear** button and choose **Download**.

.. image:: img/download_data_feed.png
    :align: center
    :alt: Click the gear button next to the feed and choose Download to get the feed file.

=================================
Step 4. Submit the Feed to Google
=================================

Google provides the instructions on how to `register <https://support.google.com/merchants/answer/188475>`_ and `submit <https://support.google.com/merchants/answer/188477>`_ a product feed. We recommend you submit a test feed first, to make sure that there are no errors.
