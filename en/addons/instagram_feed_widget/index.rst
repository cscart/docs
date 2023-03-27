*********************
Insragram Widget
*********************
.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/instagram-feed-widget.html" class="btn buy-now__btn">Buy now</a>
    </div>
 
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **The Insragram Widget** add-on embeds your Instagram video and photo feed on your marketplace storefront. You can set up updating on a schedule or enable real-time uploading of the feed.

    Invite your Instagram followers to your marketplace and boost conversion rates and sales or display your latest posts from Instagram to any visitor of your e-commerce website.

    Since 41% of Instagrammers state that they would follow a brand to take advantage of perks and giveaways, give followers that incentive. Provide them with bonuses, special offers, and insider announcements.

    
    .. fancybox:: img/instdemo4.png
        :alt: Insragram Widget add-on

    .. fancybox:: img/instdemo2.png
        :alt: Insragram Widget add-on

    .. fancybox:: img/Instdemo.png
        :alt: Insragram Widget add-on

    

========
Features
========

    - Showcasing and promotion of goods and services.

    - Building a community around the brand by streaming your day-to-day non-business activities and engaging customers to follow you.

    - Increasing trust and brand awareness.


=============
Compatibility
=============
    **Important!** The add-on does not support display of IGTV videos (longer than 60 seconds). Ability to display a series of photos and videos in one post is not supported also (only the first video or photo will be displayed).

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

-------------------------------
Setting up Facebook application
-------------------------------

=======================================
Linking Facebook and Instagram accounts
=======================================

   To be able to use the add-on you first need to create Facebook and Instagram accounts.

   Next, you need to link the Facebook and Instagram accounts

   **Instagram to Facebook**
    
    1. Open you Instagram Profile page
    
    .. fancybox:: img/Instlink1.png
        :alt: Instagram Profile page
        :height: 50%
        :width: 50%
    
    2. Tap on the Setting option

    .. fancybox:: img/instlink2.png
        :alt: Instagram Setting
        :height: 50%
        :width: 50%

    3. Select Account option in Setting menu

    .. fancybox:: img/instlink3.png
        :alt: Setting menu
        :height: 50%
        :width: 50%

    4. Tap on the Sharing to Other Apps option in Account menu

    .. fancybox:: img/instlink4.png
        :alt: Account menu
        :height: 50%
        :width: 50%
    
    5. Select your Facebook account

    .. fancybox:: img/instlink5.png
        :alt: Facebook link
        :height: 50%
        :width: 50%

    **Facebook to Instagram**

    1. Open your Facebook Business page and press Settings on the left menu

    .. fancybox:: img/inst13.png
        :alt: Facebook Business Page

    2. Click the Instagram option on the left menu and push Connect Account button

    .. fancybox:: img/inst14.png
        :alt: Instagram link account

    3. Select your Instagram account and confirm connection

    .. fancybox:: img/inst15.png
        :alt: Instagram account connected

===========================
Create Facebook application
===========================

    1. Go to https://developers.facebook.com and create a new application.

    .. fancybox:: img/inst.png
        :alt: Insragram Widget add-on

    2. Select a type of an application 

    .. fancybox:: img/inst2.png
        :alt: Select app type window

    3. Insert App Display Name and App Contact Email

    .. fancybox:: img/inst3.png
        :alt: Name and Email enter

    4. Go to the app settings and select “Basic” in the left section. Fill in the “App Domains” and “Privacy Policy URL” fields, check “Yourself or your own business” under the “App purpose”.

    .. fancybox:: img/inst4.png
        :alt: App setting

    .. fancybox:: img/inst5.png
        :alt: Basic setting

    5. Initial configuration of the add-on starts with creating a test version of your production Facebook app. In the Dashboard of your production app, click the down arrow next to the app name in the left navigation panel. Click “Create Test App”.

    .. fancybox:: img/inst6.png
        :alt: Create a test app

=======================
Setting up the test app
=======================

    1. Add the “Facebook Login” app and go to its settings.

    .. fancybox:: img/inst17.png
        :alt: Facebook Login
    
    2. Go to Admin Pannel of your Store/Marketplace and open the Setting tab of the Insragram Widget add-on

    .. fancybox:: img/inst18.png
        :alt: Add-on setiing

    3. Copy the link of the Setting tab and insert it into the “Valid OAuth Redirect URIs" field of the Facebook Login setting

    .. fancybox:: img/inst19.png
        :alt: Add-on setting link

    .. fancybox:: img/inst20.png
        :alt: Client OAuth Settings
    
    4. Go to the app settings, press Add Platform and add the URL of your store/marketplace

    .. fancybox:: img/inst21.png
        :alt: Add store URL

    5. Next, you need to get access to the test store. In order to do that you first need to go to https://developers.facebook.com/tools/explorer.
    
    Open the User or Page list and select Get User Access Token.

    .. fancybox:: img/inst22.png
        :alt: Insragram Widget add-on

    Select following parameters in the “Permissions” section:

        page_events
        pages_manage_ads
        pages_manage_cta
        pages_manage_engagement
        pages_manage_instant_articles
        pages_manage_metadata
        pages_manage_posts
        pages_read_engagement
        pages_read_user_content
        pages_show_list
        instagram_basic
        instagram_content_publish
        instagram_manage_comments
        instagram_manage_insights
        instagram_manage_messages

    .. fancybox:: img/inst23.png
        :alt: Insragram Widget add-on

    4. Submit a me/accounts request. Data is missing now.

    .. fancybox:: img/inst24.png
        :alt: Insragram Widget add-on

    To get the data, you need to request access.

    .. fancybox:: img/inst25.png
        :alt: Insragram Widget add-on

    .. fancybox:: img/inst26.png
        :alt: Insragram Widget add-on

    5. Once you get the access, the page data is displayed in the space provided.

    .. fancybox:: img/instagram_test_app5.png
        :alt: Insragram Widget add-on

    Go to Settings -> Basic and copy App ID and App Secret from the page. Now you are ready to proceed to the installation of the CS-Cart add-on.
        
    .. note::
        You could finish setting up of Facebook app on this step and go to installation and setting up of the Insragram Widget add-on step `Managing in the admin panel`_. In this case, Insragram Widget add-on will work via the test Facebook app in your store. The test Facebook app would be enough if you are going to use only the main Facebook account. 
       
        Currently, Insragram Widget add-on works correctly with test Facebook app and you could use it on your own responsibility without getting reviews for the main app.
        Otherwise, you could continue setting Facebook on the step `App review on Facebook`_. 

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Insragram Widget add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/instagram_installing.jpg
        :alt: Insragram Widget add-on

    
=====================
Setting up the add-on
=====================

    Here are available settings of the Insragram Widget add-on.

    .. fancybox:: img/instagram_settings.jpg
        :alt: Insragram Widget add-on

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. 

    * **App IP**—Use the App ID you received after creating the app on `Facebook Developers <https://developers.facebook.com>`_ in `Setting up Facebook application`_.

    * **App Secret**—Use the App Secret you received after creating the app on `Facebook Developers <https://developers.facebook.com>`_ in `Setting up Facebook application`_.

    * **Access token**—Will be filled automatically after logging in with Facebook (used for the access to Instagram page).

    * **Facebook Page**—Choose Instagram account that will be shown in the block.

    Follow steps below to configure the Insragram Widget add-on:

    1. Fill in App ID and App Secret fields.

    2. Press *Save* button in the right upper corner. *Log in with Facebook* button will be displayed.

    .. fancybox:: img/instagram_settings1.jpg
        :alt: Insragram Widget add-on

    3. Press *Log in with Facebook* button and fill in your data for Facebook authorization.

    .. fancybox:: img/instagram_settings2.jpg
        :alt: Insragram Widget add-on
   
    4. After logging with Facebook, go back to add-on settings, choose the Instagram page in *Facebook Page* field and press *Save and get access token* button.

    .. fancybox:: img/instagram_settings3.jpg
        :alt: Insragram Widget add-on

    *Access token* field will be filled automatically.

    .. fancybox:: img/instagram_settings4.jpg
        :alt: Insragram Widget add-on

    Insragram Widget add-on configuring is finished. The next step is adding a block to a layout.

    5. Go to **Design > Layouts**.

    6. Add a new block. Select the **Instagram block**.

    .. fancybox:: img/instagram_settings5.jpg
        :alt: Insragram Widget add-on

    7. Name the block and select the template.

    .. fancybox:: img/instagram_settings6.jpg
        :alt: Insragram Widget add-on

    8. Configure settings on the **Content** and **Block settings** tabs according to your needs and press **Create**.

    .. fancybox:: img/instagram_settings7.jpg
        :alt: Insragram Widget add-on

----------------------
App review on Facebook
----------------------

    Once the add-on is set up on the store website with the test Facebook app, the manage_pages and instagram_basic access you received requires review.

    You begin the process in the App Review section of your App Dashboard. In the “Add additional permissions and features” section select manage_pages and submit for approval. Add the Instagram product, and in the instagram_basic section, submit for the product review. Once approved, go to the CS-Cart add-on settings and replace App ID and App Secret of your test app with App ID and App Secret of the production app.

===================
Manage_pages review
===================

    In the “Tell us how you're using this permission or feature” section, specify “Show Instagram posts on my home page”.

    Select “Server-to-Server” and add the description:

    - Install add-on of Instagram.

    - Enter App ID and secret.

    - Select available account with Instagram.

    - Show my instagram posts on the storefront home page.

    Record a screencast showing how you set up the add-on. In the View Notes dialogue for the permission submission, provide a description for how you will use the data returned by any endpoints that require the permission, and the screencast. Click the Submit For Review button at the bottom of the page.
    
    Once the settings are set up and the permissions reviewed, the Instagram posts should appear on the storefront page.

======================
Instagram_basic review
======================

    Please follow Facebook instructions: https://developers.facebook.com/docs/instagram-api/getting-started/?locale=en_US#screencast

===================================
Description for getting permissions
===================================

    Please, find the description for getting instagram_basic and manage_pages permissions below.

    **instagram_basic permission**
    
    *Why the instagram_basic permission is required and what it is used for: this permission is required to receive the content of Instagram accounts associated with a business Facebook account*. *This permission is used to receive content and its subsequent display on the storefront*.

    **manage_pages permission**

    *Why the manage_pages permission is required and what it is used for: this permission is needed to get a list of Facebook pages associated with Instagram profiles and to choose which one will be used to display content on the storefront*. *This permission is used to select which of the Facebook pages associated with Instagram profiles will be used to display content on the storefront*.

============================================================
Application description and access to the store for checking
============================================================

    Please, find the application description and providing access to the store for checking below.

    *As the add-on’s settings may be reset in the process of testing and the Instagram block content may stop displaying on the storefront, please do not change the add-on’s settings despite the both reviews approved*.

    *test user: xxxxxxxxxx*

    *password test user: xxxxxxxxxxxxx*

    1. *Navigate to https://www.domain_________.com/admin.php*
    2. *Navigate to menu Add-ons > Manage Add-ons > Instagram*
    3. *Please, don't change settings*
    4. *To view widget, navigate to https://www.domain_________.com/view_your_widget*

    All of the above can be seen on the screencast: https://youtu.be/3vNZTBDUveY