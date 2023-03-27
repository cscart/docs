***************************
Product Labels (up to 4.9)
***************************

.. important:: This user guide contains information about functionality of the old version of the Product Labels add-on, compatible with CS-Cart 4.3.x-4.9.x. This version is not supported. If you have CS-Cart 4.10 or higher, upgrade to the `refactored add-on version <https://www.simtechdev.com/docs/addons/product_labels_2/index.html>`_. If you are interested in purchasing this version, `contact us <http://www.simtechdev.com/helpdesk>`_ or your account manager.

.. raw:: html

    <div class="buy-now">
        <a href="https://www.simtechdev.com/quote.html" class="btn buy-now__btn">Get quote</a>
    </div>

.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    **The CS-Cart Product Labels add-on** allows to show unlimited promotional tags like "NEW", "HIT", "BLACK FRIDAY", "CYBER MONDAY", "NEW SEASON", "NEW COLLECTION", "ONLY AT", "FREE SETUP", "PRESENT" for products on the product listing page and product details page, which will help you **make your business stand out and attract customers' attention**.

    .. fancybox:: img/Product_labels_019.png
        :alt: CS-Cart Product Labels add-on

    The add-on also allows you to create custom labels. You can write text for labels, pick the background color and text color.

    .. fancybox:: img/Product_labels_026.png
        :alt: custom labels

============
Key features
============

    * add labels to products on the product details page

    .. fancybox:: img/Product_labels_05.png
        :alt: product details page

    * add labels to products on the product listing page

    .. fancybox:: img/Product_labels_06.png
        :alt: product listing page

    * label products as Hit and New automatically

    .. fancybox:: img/Product_labels_024.png
        :alt: quick view

    * add labels for quick view of the product

    .. fancybox:: img/Product_labels_07.png
        :alt: quick view

    * hightlight products with bright tags

    .. fancybox:: img/Product_labels_020.png
        :alt: bright tags

    * attract customers with your special offers

    .. fancybox:: img/Product_labels_021.png
        :alt: special offers

    * use multiple labels for each product

    .. fancybox:: img/Product_labels_025.png
        :alt: special offers

    * filter products by labels

    .. fancybox:: img/Product_labels_011.png
        :alt: Products vertical filters

    * export/import products in a CVS format with additional Label fields

    .. fancybox:: img/Product_labels_018.png
        :alt: product details page

    * add labels to products in bulk

    .. fancybox:: img/Product_labels_016.png
        :alt: Bulk labels editing

    To learn how to use new functionality, follow quick and easy steps below.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.


---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Product Labels” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings for the add-on:

    .. fancybox:: img/Product_labels_022.png
        :alt: CS-Cart Product Labels add-on

    * **Product is new for (days)**—Number of days for which the product is considered as "New". For example, if you enter **10**, the product you add to the store will have the "New" label for 10 days.

    .. fancybox:: img/Product_labels_023.png
        :alt: new label

    * **Product is hit if bought (times)**—Number of purchases that makes the product "Hit". For example, if you enter **50**, after the product is purchased 5o times, the "Hit" label will be assigned to it.

    .. fancybox:: img/Product_labels_024.png
        :alt: Hit label

    .. note::

        To assign "New" and "Hit" labels to the products, you should set up a cron script and run it according to a schedule.
        
        Use this command:

        **php /path/to/cart/admin.php --dispatch=sd_labels_cron.assign --cron_password=CRON_PASSWORD** , 
        
        where: 
       
        **path/to/cart** is the path to your website
        
        **CRON_PASSWORD** is the access key to the cron script that you can find under **Settings - Security settings**.

=========================
Adding labels to products
=========================

    To add a product label, follow these quick steps:

    1. Go to **Products - Products**.

    .. fancybox:: img/Product_labels_02.png
        :alt: Product section
        :width: 300px

    2. Select the necessary product. Use quick search on the right if needed.

    .. fancybox:: img/Product_labels_03.png
        :alt: Product list page

    3. Open the **Add-ons** tab, and in the **Labels** section, select the checkboxes next to the labels you'd like to display for this product.

    .. fancybox:: img/Product_labels_04.png
        :alt: Labels section
        :width: 350px

    4. Click **Save** or **Save and close**.

    5. Go to the storefront to check the changes:

    * on the product details page:

    .. fancybox:: img/Product_labels_05.png
        :alt: product details page

    * on the product listing page:

    .. fancybox:: img/Product_labels_06.png
        :alt: product listing page

    * quick view of the product:

    .. fancybox:: img/Product_labels_07.png
        :alt: quick view

======================
Creating custom labels
======================

    To create your own label:

    1. Go to **Marketing > Custom labels**.

    2. Click the **+** button to add a new label.

    .. fancybox:: img/Product_labels_027.png
        :alt: new label

    4. Name the label. Note that this is the text that will be shown on the created label on the storefront. Pick a desired **background color** and **text color**.

    .. fancybox:: img/Product_labels_028.png
        :alt: configuring a label

    5. Click **Create**.

    The created label will appear on the list of available labels in the product settings.

    .. fancybox:: img/Product_labels_029.png
        :alt: new label

==================
Translating labels
==================

    You can easily translate labels into a desired language. Follow these steps:

    1. Go to **Administration > Languages > Translations**.

    2. Search for the necessary label.

    .. fancybox:: img/Product_labels_030.png
        :alt: search for label

    3. Find the capitalized text. This is the label we need.

    .. fancybox:: img/Product_labels_031.png
        :alt: capitalized text

    4. Switch the language to the target one. Input the translation. Click **Save**.

    .. fancybox:: img/Product_labels_032.png
        :alt: translating a label

    .. important::

        Save your changes on every page where you translate language variables. If you open the next page with language variables without clicking the Save button on your current page, the translations you made on the page will be lost.

========================
Creating product filters
========================

    To create a product filter:

    1. Go to **Products - Filters**.

    .. fancybox:: img/Product_labels_08.png
        :alt: Products - Filters
        :width: 300px

    2. Click the **+** button in the top right.

    3. Select a filter in the **Filter by** selectbox and specify a name for it.

    .. fancybox:: img/Product_labels_09.png
        :alt: Products - Filters

    4. Click **Create**.

    5. Repeat these steps for all Label filters.

    .. fancybox:: img/Product_labels_010.png
        :alt: Products filters

    6. Go to the storefront to see the changes:

    * vertical filters

    .. fancybox:: img/Product_labels_011.png
        :alt: Products vertical filters

    * horizontal filters

    .. fancybox:: img/Product_labels_012.png
        :alt: Products horizontal filters
        :width: 400px

    For more information about product filters, please visit `CS-Cart User guide <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/filters>`_.

===================
Bulk labels editing
===================

    To add labels for multiple products:

    1. In the admin panel, go to **Products - Products**.

    2. Select the checkboxes next to products you want to edit. Use the quick search on the right in needed.

    .. fancybox:: img/Product_labels_013.png
        :alt: selecting products

    3. Click the gear button in the top right and select **Edit selected**.

    .. fancybox:: img/Product_labels_014.png
        :alt: Edit selected
        :width: 250px

    4. In the opened window, first click **Unselect all**, then select the checkboxes of the necessary labels and click **Modify selected**.

    .. fancybox:: img/Product_labels_015.png
        :alt: modify selected

    5. Tick the required labels and click **Save**.

    .. fancybox:: img/Product_labels_016.png
        :alt: Bulk labels editing

    6. Check the changes on the storefront.

    .. fancybox:: img/Product_labels_011.png
        :alt: Product labels

======================
Exporting product data
======================

    Go to **Administration - Export data - Products**.

    Find Label fields and move them to the Exported fields section.

    .. fancybox:: img/Product_labels_017.png
        :alt: Importing product data

    Specify all the required information and export products.

======================
Importing product data
======================

    Go to **Administration - Import data - Products**.

    You can see new fields added:

    .. fancybox:: img/Product_labels_018.png
        :alt: Exporting product data

    Specify all the required information and import products.

    To learn more about import and export, visit the `CS-Cart documentation <http://docs.cs-cart.com/4.3.x/user_guide/import_export>`_.
