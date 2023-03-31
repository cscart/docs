**************
FB Pixel
**************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000072" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    **The FB Pixel** is a useful tool for your website that enables you to measure, optimize and build audiences for your ad campaigns. Using the FB Pixel, you can track the actions people take on your website across devices to run Facebook advertising campaigns more effectively. 

    The FB Pixel add-on integrates the service with your store, giving you the ability to:

    - view statistics of your store (page views, adding to cart, purchases, adding to wish list, one click buy, request a call, etc.)

    .. fancybox:: img/Selection_06.png
        :alt: viewing statistics

    - create ad campaigns for Facebook and Instagram

    .. fancybox:: img/Selection_09.png
        :alt: creating ad campaign

    - measure cross-device conversions (see how your customers are moving between devices before they convert)

    .. fancybox:: img/Selection_07.png
        :alt: measure cross-device conversions   

    - create Custom Audiences for people who take specific actions on your website, like visited a product page, added to cart or purchased a product.

    .. fancybox:: img/Selection_081.png
        :alt: creating custom audiences

    - use personal advert account as well as Business Manager account

    .. fancybox:: img/Selection_021.png
        :alt: Facebook pixel accounts
        :width: 550px

    As the Facebook Pixel is a piece of JavaScript code that you should insert into your website's pages, it requires technical skills or involving a web developers to implement this for you. With our add-on, you don't have to worry about that. **All you need to do is to install the add-on, set it up and it will insert the necessary code into your website for you**.

    Additionally, the The FB Pixel add-on supports the Basic theme as well as the Responsive theme.

    To learn more about the Facebook Pixel, please visit `Facebook help <https://www.facebook.com/business/help/651294705016616>`_ .

    You may also want to check out this Facebook Pixel tutorial (just bear in mind that you do not need to insert the code into the website, our add-on will do it for you).

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/KGHGqbjMtFg" frameborder="0" allowfullscreen></iframe>

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? |Contact us now.|
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the FB Pixel add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://facebook-pixel.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the FB Pixel add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Selection_02.png
        :alt: FB Pixel add-on

==================
Available settings
==================

+++++++++++++++++++++++++++
CS-Cart with one storefront
+++++++++++++++++++++++++++

    Here are available settings of the FB Pixel add-on.

    **General**

    .. fancybox:: img/Selection_082.png
        :alt: General Sefttings

    *Facebook Pixel ID*—Enter your Pixel ID that you should get after creating an account at `Facebook Pixel <https://developers.facebook.com/docs/facebook-pixel>`_.

    *Account type*: Personal or Business—Select an account type, for which the Facebook Pixel is set up. The business account allows to join Ad Account, Pixel and Product Catalogs to track product feeds and ad campaigns.

    *Display Facebook Pixel ID Tab on vendors*—If enabled, Facebook Pixel ID tab will be available for vendors.

    **Track Comnversion** 

    .. fancybox:: img/Selection_083.png
        :alt: Track Conversion Tab

    Select the checkboxes of the events if you want to track them:

    *View content*—Enables tracking the viewContent event in the store, when page content is viewed

    *Search*—Enables tracking the Search event in the store, when search is performed

    *Add to cart*—Enables tracking the AddToCart event, when a product is added to cart

    *Add to wish list*—Enables tracking the AddToWishlist event in the store, when a product is added to wishlist

    *Initiate checkout*—Enables tracking the InitiateCheckout event at the checkout steps

    *Add payment info*—Enables tracking the AddPaymentInfo event in the store, which tracks payment methods 

    *Purchase*—Enables tracking the Purchase event in the store, when order is placed

    *Lead*—Enables tracking the Lead event in the store, which tracks the amount of product views

    *Complete registration*—Enables tracking the completeRegistration event in the store, when a user is registered

    *Buy now with 1-click*—Enables tracking of the in-store Purchase event that occurs when a one-click purchase form is submitted

    *Request call*—Enables tracking of the "Purchase" event in the store, which occurs when the form is submitted "Request call" from the product page and the "Lead" event from the rest of the pages

    **Catalog**

    .. fancybox:: img/Selection_084.png
        :alt: Catalog tab

    *Enable microdata tags*—Enables transferring of the product data to the Facebook Catalog

    *Brand feature*—Select the Brand Feature

    Product data to be sent to Facebook catalog:

        * Product name

        * Description

        * Brand

        * Image

        * Price

        * Price Currency

        * Product link

        * Product in stock

    Click **Save**.

+++++++++++++++++++++++++++++++++
CS-Cart with multiple storefronts
+++++++++++++++++++++++++++++++++

    If you are using CS-Cart with multiple stores, you can apply the same pixel identifier to all the storefronts, different pixel identifier for each storefront or disable the Facebook Pixel for some of the storefronts.

    To apply the same Facebook Pixel identifier for all the storefronts, please choose all stores, go to **Add-ons - Manage add-ons - Facebook Pixel**, click the blue icon and insert the pixel code.

    .. fancybox:: img/Selection_085.png
        :alt: setting up Facebook pixel

    To apply different Facebook Pixel identifiers for the storefronts, please choose the storefront you would like to add the pixel to as shown below:

    .. fancybox:: img/selecting-store.png
        :alt: setting up Facebook pixel
        :width: 360px

    Then go to **Add-ons > Manage add-ons > FB Pixel**, and insert the pixel code.
    
    Please note that only one pixel is available for one Facebook Pixel account.

    See the explanation of the rest of the settings in the section above.

====================================
Inserting a hook for versions 4.2.x.
====================================

    If you store uses version 4.2.x, you need to do some adjustments to make the add-on work correctly. To do this, please follow these steps:

    1. In the admin panel, go to **Design - Templates**.

    .. fancybox:: img/Selection_010.png
        :alt: inserting a hook. Facebook pixel
        :width: 300px

    2. Open **templates - index.tpl**.

    .. fancybox:: img/Selection_011.png
        :alt: inserting a hook. Facebook pixel
        :width: 200px

    3. Right before the **</head>** tag insert this hook:

    .. code::

        {hook name="index:head_scripts"}{/hook} 

    .. fancybox:: img/Selection_012.png
        :alt: inserting a hook. Facebook pixel

    4. Click **Save changes**.

-----------------------
Personal advert account
-----------------------

=========================
Creating a Facebook pixel
=========================

    1. Go to `The Facebook pixel <https://developers.facebook.com/docs/facebook-pixel>`_.
    
    2. Click **Get the Pixel**.
    
    3. Enter a name for your pixel. There's only one pixel per ad account, so choose a name that represents your business.
    
    4. Click **Create Pixel**.
    
    If you work on your website yourself, click **Install Pixel Now**.
    
    If someone else works on your website, click **Email Pixel Code**. Type in that person's email address and click **Send**.
   
    Keep in mind there is only one Facebook pixel per account. However, you can add standard events or custom conversions to your pixel to report different conversion events.

    Once you create a pixel, you will get a Pixel ID that you should specify in the settings of the add-on. 

    .. fancybox:: img/Selection_01.png
        :alt: Facebook pixel ID

================
Event statistics
================

    The Facebook Pixel event statistics page can be found in `the Ads Manager <https://www.facebook.com/ads/manager/pixel/facebook_pixel>`_.

    The Facebook Pixel page gives you insight into the traffic on your website. It tells you what pages people are looking at, on which devices they're viewing your website, and what actions they're taking (e.g. purchases). Below, we'll explain each element of the Facebook Pixel page:

    .. fancybox:: img/Selection_04.png
        :alt: Facebook Ads Manager

    **Time frame** - you can select the time frame of your data.

    **Total traffic** - see how much traffic there's been on your website. A dotted line means the data isn't filled for that day yet. Keep in mind this counts raw pixel fires (every time your page loads), which is different from browser sessions.

    **Pixel status** - make sure your Pixel status is set to the Active status.

    **Data filters** - click these buttons to break down your data by URL, Domain, Device or Event.

------------------------
Business Manager account
------------------------

=============================
Creating an account and pixel
=============================

    1. Create your new `Business Manager account <https://business.facebook.com/overview/>`_.

    2. Go to Business Manager settings.

    .. fancybox:: img/Selection_013.png
        :alt: Business Manager settings

    4. Navigate to **Advert Accounts** and create a new Adverts account.

    .. fancybox:: img/Selection_014.png
        :alt: new Adverts account
        :width: 250px

    5. Create a Facebook pixel.

    .. fancybox:: img/Selection_017.png
        :alt: creating a Facebook pixel

    6. You will get your Facebook Pixel ID, which you need to specify in the add-on settings.

    .. fancybox:: img/Selection_018.png
        :alt: Facebook pixel ID

==========================================
Exporting data feeds to product catalogues
==========================================

    .. note::
    
        Make sure that the **Data feeds** and **Google export** add-ons are installed in your store.

    Navigate to **Product Catalogues** to create a product catalogue.
   
    .. fancybox:: img/Selection_015.png
        :alt: Product Catalogues
        :width: 250px

    To add products to the catalogue, first, they should be correctly configured:

    1. Go to **Products - Products** and open the necessary product.

    2. Open the **Features** tab.

    3. Specify all Google export features.

    .. fancybox:: img/Selection_016.png
        :alt: product features

    The GTIN and MPN fields should be unique for every product. Learn more about `unique product identifiers <https://support.google.com/merchantsanswer/160161?hl=en/>`_.

    4. Repeat this for every product you want to export.

    After that, export products:

    1. Go to **Add-ons - Data feeds** in the admin panel.

    2. Select **Google base**.

    3. Open the **Exported items** tab.

    4. Add products you want to export by clicking the **+ Add product** button. Otherwise all products will be exported.

    5. Save the changes.

    6. Click the gear button at the top and select **Download**.
    
    Data feed will be exported in a csv format.

    7. Go back to your Business Manager and click on the earlier created catalogue. 

    8. Export the data feed by uploading the csv file.

    9. Under your Business Manager account

    .. fancybox:: img/Selection_019.png
        :alt: Business Manager account
        :width: 250px

    click **Associate Sources** in the current catalogue.

    .. fancybox:: img/Selection_020.png
        :alt: Business Manager account

    Now additional AddToCart, Purchase, ViewContent events will be tracked for the exported products. 

    You can check this with Pixel Helper.

    .. fancybox:: img/Pixel_helper.png
        :alt: Pixel.Helper

    You can view statistics `here: <https://business.facebook.com/?business_id>`_ .

    .. fancybox:: img/Statistics.png
        :alt: viewing statistics. Facebook Pixel

---------------------------------------------------------------
How do I verify if the pixel tracking code is set up correctly?
---------------------------------------------------------------

    It is recommended to install the **Facebook Pixel Helper** extension to your Chrome browser for verifying and diagnostic of whether the Facebook pixel event tracking code is properly inserted in your web site.

    .. fancybox:: img/Selection_05.png
        :alt: Facebook Pixel Helper
        :width: 150px

    If you don't have it installed yet, please follow the instructions on the `Facebook Pixel Helper page <https://developers.facebook.com/docs/facebook-pixel/pixel-helper>`_ to download and install it.