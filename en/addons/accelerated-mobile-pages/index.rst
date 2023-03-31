******************
Google AMP
******************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000178" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    The **Google AMP** add-on allows to create mobile optimized content for the product details pages of your store.

    **AMP** stands for **Accelerated Mobile Pages**, a Google project, which aims to build web pages that are lightweight and speedy to load, particularly on mobile devices.

    Your customers will see a simplified layout on product pages:

    .. fancybox:: img/amp_product-page2.png
        :alt: Google AMP for
        :width: 425px

    .. fancybox:: img/amp-ipad-product3.png
        :alt: Google AMP for 
        :width: 597 px

    Sites that use AMP will be marked with a little lightning ball in search results:

    .. fancybox:: img/amp-stamp.png
        :alt: Google AMP
        :width: 433px

    The video below explains AMP:

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/lBTCB7yLs8Y" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

    Make your site AMP-ready today!

============
Key features
============

    * AMP compatible product details pages;

    * Faster loading speed on mobile;

    * Custom AMP design with no coding;

    * AMP stamps on mobile search;

    * Automatically optimized content.

    * Customize the design of your AMP page usin LESS 

    * Use your Google Analytics account for tracking

============
Useful links
============

    `AMP Documentation <https://www.ampproject.org/docs/>`_

    `Official Google Webmaster Central Blog: What is AMP? <https://webmasters.googleblog.com/2016/09/what-is-amp.html>`_

    `8 things you need to know about Google AMP <https://www.cio.com/article/3091071/search/8-things-you-need-to-know-about-google-amp.html>`_

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.11 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

==========
Demo store
==========

    Check out the Google AMP add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://google-amp-for-seo.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.
    
---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Google AMP add-on on the add-ons list page (Add-ons → Manage add-ons). Click the **+** button in the top right corner, select an archive and click **Upload & Install**. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to **Active**.

    .. fancybox:: img/amp-installed.png
        :alt: Google AMP

    Once the add-on is installed and activated, AMP HTML is automatically applied to all products in your store. No setup is required.

====================
Validating AMP pages
====================

    In order to check if your page is valid AMP, follow these steps:

    1. Open a product details page of you store.

    2. Copy (Ctrl+V) the URL of the page. Make sure it contains the **amp** parameter.

    .. fancybox:: img/amp_link.png
        :alt: Google AMP

    3. Open the `AMP Test <https://search.google.com/test/amp>`_ or use the browser extension. Paste the URL of the page (Ctrl+V) in the **URL** field and click the **Test URL** button.

    .. fancybox:: img/validator.png
        :alt: Google AMP

    4. Observe the result of validation test.

    .. fancybox:: img/validation_complete.png
        :alt: amp validation
        :width: 571px

    If you fail validation, you will see errors alongside the HTML source of the page. In this case, contact us for help via our `help desk system <https://helpdesk.cs-cart.com>`_.

    .. fancybox:: img/failed_validation.png
        :alt: amp validation

    For more information on AMP validation, please refer to `Documentation <https://www.ampproject.org/docs/fundamentals/validate>`_.
    
    
================
Extra: Cron task
================

You are able to prepare images for amp pages by installing cron-task. For this, you can contact your system administration or hosting service and askt them to install command like this::

    php /project_path/index.php --dispatch=amp.cache_warmup --switch_company_id=1

================
Full description
================

The 'Full description' field of the Admin Panel allows the user to create a special description for the mobile version of the product or simply to tranfer it from the General tab.

Open the Add-ons tab of the detailed product page of the admin pannel.

.. fancybox:: img/add-on_tab.png

Fill in the Full Description with the desirable content for mobile version or click on the 'Generate AMP description' to transfer it from the one on the General tab.

