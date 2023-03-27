***************************
Similar by Feature
***************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000079" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The Similar by Feature add-on provides you with new abilities such as:

    - display products similar to the main one on the product details page
    - automatically link products to each other by specifying matching features
    - recommend products that are similar to the viewed one
    - limit the maximum number of products shown per page

    .. fancybox:: img/screenshot.jpeg
        :alt: Similar by Feature
        :width: 650px

    To learn how to create a block for similar products, add features for products, follow quick and easy steps below.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.5 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Similar by Feature add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://similar-products-by-feature.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Similar by Feature” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Selection_01.png
        :alt: Similar by Feature add-on
        :width: 650px

================
Creating a block
================

    In order to display similar products on the product page, let's add a block.

    Go to **Design - Layouts** and open **Products** tab. Locate the **Main Content** block and click the + button to add a new block. 

    .. fancybox:: img/Selection_02.png
        :alt: creating new block
        :width: 650px

    In the opened pop-up window, open the **Create new block** tab and select **Products**.

    .. fancybox:: img/Selection_03.png
        :alt: creating new block products
        :width: 650px

    In the **General** tab enter a name for the block and select the template type you like.

    .. fancybox:: img/Selection_04.png
        :alt: creating new block. general tab
        :width: 650px

    In the **Content** tab set **Filling** to Similar by feature, specify the number of products you want to display per page in the **Limit** field and click **Create**.

    .. fancybox:: img/Selection_05.png
        :alt: creating new block. content tab
        :width: 650px

    You should see the created block on the editing layout page.

    .. fancybox:: img/Selection_06.png
        :alt: created block
        :width: 650px

===================
Setting up features
===================

    To set up product features, follow the steps below:

    1. `Create a new feature <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/features/product_features.html#add-a-feature>`_ .

    2. Select the **Similar by feature** checkbox.

    .. fancybox:: img/Selection_07.png
        :alt: similar product by feature
        :width: 650px

    3. Specify features for a `single product <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/features/product_features.html#single-productor>`_ or `multiple products <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/features/product_features.html#multiple-products>`_.

    Done!

    Now you can go to the storefront, view a product details page and see the added block of Similar by Feature.

    .. fancybox:: img/screenshot_02.jpeg
        :alt: similar product by feature
        :width: 650px

    To learn more about product features, visit `CS-Cart documentation <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/features>`_ .