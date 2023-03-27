***********************
Similar by Tag
***********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000068" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    The Similar by Tag add-on provides you with new abilities such as:

    - automatically link products to each other by specifying matching tags
    - recommend products that are similar to the viewed one
    - link products to a specific page by tag
    - limit the maximum number of products shown per page
    
    .. fancybox:: img/Selection_11.png
        :alt: Similar by Tag
        :width: 650px

    To learn how to create a block for similar products, add tags and link products to each other, follow quick and easy steps below.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Similar by Tag add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://similar-products-by-tag.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Similar by Tag” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Selection_01.png
        :alt: Similar by Tag add-on
        :width: 650px

.. note::
    
    For correct operation of the “Similar by Tag” add-on, make sure that the **Tags** add-on is installed and set to Active on the add-ons list page. 

===============
Creating blocks
===============

    In order to display similar products on the product page, let's add a block.

    Go to **Design - Layouts** and open **Products** tab. Locate the **Main Content** block and click the + button to add a new block. 

    .. fancybox:: img/Selection_02.png
        :alt: creating new block
        :width: 650px

    In the opened pop-up window, open the **Create new block** tab and select **Products**.

    .. fancybox:: img/Selection_03.png
        :alt: creating new block products
        :width: 650px

    In the **General tab** enter the name of the block and select the template type you like.

    .. fancybox:: img/Selection_04.png
        :alt: creating new block. general tab
        :width: 650px

    In the **Content** tab set **Filling** to Tags, specify the number of products you want to display per page in the **Limit** field and click **Create**.

    .. fancybox:: img/Selection_05.png
        :alt: creating new block. content tab
        :width: 650px

    You should see the created block on the editing layout page.

    .. fancybox:: img/Selection_06.png
        :alt: created block
        :width: 650px

    You can also add a block with products by tag to a page, if necessary. For example, you have a page containing an article about cotton clothing. So, you add the 'cotton' tag both to the page and cotton products from your store and these products will be displayed in a block on the corresponding page. 

    Go to the **Pages** tab on the same page, locate the **Main Content** block and click the + button to add a new block.

    .. fancybox:: img/Selection_07.png
        :alt: pages tab
        :width: 650px

    In the opened pop-up, select the previously created block or create a new one.

    .. fancybox:: img/Selection_08.png
        :alt: creating a block
        :width: 650px

===========
Adding tags
===========

    In order to add tags to products, go to **Products - Products**, select the desired product and open the **Tags** tab. Enter tags to the **Tags** field, by clicking Enter each time you add a new tag.

    .. fancybox:: img/Selection_09.png
        :alt: adding tags
        :width: 650px

    When you specify the same tags for products, they will be displayed as similar products for each other.

    .. fancybox:: img/Selection_010.png
        :alt: similar products block
        :width: 650px

================
Bulk tag editing
================

    There are two ways of how you can add or edit tags of multiple products at once.

    * Bulk editing

    1. In the admin panel, go to **Products - Products**.

    2. Select the checkboxes next to products you want to edit. For example, I am going to add tags for LED TV sets in my store. So I search for *LED* and select all the found products.

    .. fancybox:: img/Selection_012.png
        :alt: filtering products
        :width: 650px

    3. Click the gear button in the top right and select **Edit selected**.

    .. fancybox:: img/Selection_013.png
        :alt: Edit selected
        :width: 300px

    4. In the opened window, first click **Unselect all**, then select the **Tags** checkbox and click **Modify selected**.

    .. fancybox:: img/Selection_014.png
        :alt: editing tags
        :width: 650px

    5. Enter tags and click **Save**.

    * Product export/import 

    1. In the admin panel, go to **Administration - Export data - Products**.

    2. Find **Tags** in the Available fields and move it to the Exported fields.

    .. fancybox:: img/Selection_016.png
        :alt: product export with tags
        :width: 650px

    3. Click the **Export** button in the top right.

    4. Specify tags for products in the exported csv file.

    5. Once all the necessary tags are specified, you need to import products. Go to **Administration - Import data - Products**.

    6. Select the import file and click **Import**.

    .. fancybox:: img/Selection_017.png
        :alt: product import with tags
        :width: 650px

