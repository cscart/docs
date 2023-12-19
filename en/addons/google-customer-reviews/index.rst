***********************
Google Customer Reviews
***********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000069" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    **Google Customer Reviews** is a free program that lets you collect valuable feedback and earn seller ratings from customers who have made an online purchase. The rating is shown on the Google Customer Reviews badge, on Search Ads, and in Google Shopping.

    .. fancybox:: img/Google-customer-reviews_002.png
        :alt: Google Customer Reviews badge

    .. note::

        Google Customer Reviews is available in the following countries: Algeria, Argentina, Australia, Austria, Bahamas, Bahrain, Belgium, Belize, Bhutan, Brazil, Burkina Faso, Cameroon, Canada, Chad, Chile, China, Colombia, Costa Rica, Cote d'Ivoire, Czechia, Denmark, Dominican Republic, Ecuador, Egypt, El Salvador, Fiji, France, Gabon, Germany, Guatemala, Guyana, Honduras, Hong Kong, India, Indonesia, Ireland, Israel, Italy, Jamaica, Japan, Jordan, Kuwait, Libya, Liechtenstein, Luxembourg, Malaysia, Maldives, Mali, Mexico, Morocco, Namibia, the Netherlands, New Zealand, Nicaragua, Norway, Oman, Panama, Papua New Guinea, Paraguay, the Philippines, Poland, Portugal, Puerto Rico, Qatar, Russia, Saudi Arabia, Singapore, South Africa, South Korea, Spain, State of Palestine, Sweden, Switzerland, Taiwan, Thailand, Timor-Leste, Tunisia, Turkey, Ukraine, the United Arab Emirates, the United Kingdom, the United States, Uruguay, Venezuela, Vietnam

    The main features of the Google Customer Reviews program are:

    **Google Customer Reviews badge**: A badge that displays the seller rating on a scale of 1-5 stars and can be placed on any page on your site (see `Adding Google Customer Reviews badge`_).

    **Google Customer Reviews opt-in**: A pop-up that appears to all customers after they make a purchase. Users who opt-in may receive an email from Google Customer Reviews asking them to rate their experience with your store.

    .. fancybox:: img/google-customer-reviews_optin.png
        :alt: google reviews badge
        :width: 661px

    **Google Customer Reviews survey**: The survey that customers can take to rate their purchase experiences in your store.

    .. fancybox:: img/Google-customer-reviews_015.png
        :alt: google reviews badge
        :width: 530px

    **Seller ratings**: Your overall store rating that appears on Google Customer Reviews badges, as well as on search ads and Google Shopping. `Click <https://support.google.com/adwords/answer/2375474>`_ for more information.

    .. fancybox:: img/Google-customer-reviews_012.png
        :alt: Google Customer Reviews badge
        :width: 589px

    .. note::

        In most cases, seller ratings only show when a business has 150 unique reviews and a composite rating of 3.5 stars or higher. 

    Check out an overview of the Google Customer Reviews program:

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/PwNPO7Awwh0" frameborder="0" allowfullscreen></iframe>

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. 
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

--------------------------------------------
Getting started with Google Customer Reviews
--------------------------------------------

    1. Sign in to your `Merchant Center account <https://merchants.google.com/>`_ (or sign up if you do not have an account).

    2. Select **Merchant Center programs** from the dropdown in the top right.

    .. fancybox:: img/Manage_programs.png
        :alt: google reviews badge
        :width: 295px

    3. Click **Enable** in the Google Customer Reviews card and accept the Program Agreement.

    .. fancybox:: img/Manage_programs2.png
        :alt: enabling Google Customer Reviews
        :width: 305px

    .. note::

        You do not need to add the survey opt-in code or badge code to your site. The add-on integrates the code into your store.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Google Customer Reviews add-on on the add-ons list page (**“Add-ons” → ”Manage add-ons”**).  Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active. 

    .. fancybox:: img/installing-add-on.png
        :alt: add-ons list page

=====================
Setting up the add-on
=====================

    .. fancybox:: img/Google-customer-reviews_014.png
        :alt: add-on settings

    * **Google Merchant ID**—Enter your `Google Merchant ID <https://merchants.google.com/>`_.

    * **Enable Google Customer Reviews opt-in**—Google Customer Reviews opt-in appears to all customers after checkout. (To enable it, HTTPS should be correctly set up on your server.)

    * **Position of Google Customer Reviews opt-in**—Defines where the Google Customer Reviews opt-in will be shown on a page. The options are: center, bottom right, bottom left, top right, top left, bottom tray.

    * **Number of times to show opt-in**—The opt-in is shown on every page view. The number of repeated displays can be limited by this value. Leave empty or enter 0 to show the opt-in unlimited number of times.

    * **Google Customer Reviews badge showing seller rating**—To show the badge with seller rating on a page, add the Google Customer Reviews badge to a desired page, by going to Design -> Layouts. (See `Adding Google Customer Reviews badge`_.) The position of the GCR badge depends on the selected template and settings.

====================================
Adding Google Customer Reviews badge
====================================

    Google Customer Reviews badge allows you to display your seller rating and show customers that you’re integrated with Google Customer Reviews.

    You can show two types of the badge:

+++++++++++++++++++++++++++++++++++++
Badge with a fixed position on a page
+++++++++++++++++++++++++++++++++++++

    .. fancybox:: img/Google-customer-reviews_002.png
        :alt: google reviews badge

    To add a badge to a page:

    1. Navigate to **Design > Layouts**.

    2. Decide where you want to place the badge. For example, next to the logo, right here:

    .. fancybox:: img/Google-customer-reviews_003.png
        :alt: badge

    3. Add a new grid. (Adjust the width of other grids if necessary.)

    4. Add a new block.

    .. fancybox:: img/Google-customer-reviews_004.png
        :alt: adding a new block

    5. Name the block and select the **GCR rating badge inline** template.

    .. fancybox:: img/Google-customer-reviews_006.png
        :alt: block settings

    6. Click **Create**.

    Here's the created block.

    .. fancybox:: img/Google-customer-reviews_007.png
        :alt: created block

+++++++++++++++++++++++++++++
Badge at the bottom of a page
+++++++++++++++++++++++++++++

    To add a badge to a page:

    .. fancybox:: img/Google-customer-reviews_013.png
        :alt: product page

    1. Navigate to **Design > Layouts**.

    2. Decide where you want to place the badge. For example, on a product page, categoty page, blog, etc.

    3. Add a new block.

    .. fancybox:: img/Google-customer-reviews_004.png
        :alt: adding a new block

    4. Name the block, select the **GCR rating badge in the bottom** template and a desired position: bottom left or bottom right.

    .. fancybox:: img/Google-customer-reviews_005.png
        :alt: block settings

    6. Click **Create**.

    Here's the created block.

    .. fancybox:: img/Google-customer-reviews_008.png
        :alt: created block

===================================
Extra settings for shipping methods
===================================

    The add-on adds two new settings for shipping methods. You can specify the estimated shipping time and delivery time.

    You can manage these settings by navigating to **Administration > Shipping and taxes > Shipping methods**. Select a shipping method.

    .. fancybox:: img/Google-customer-reviews_001.png
        :alt: extra shipping method settings
        :width: 639px

    * **Estimated shipping time**—The estimated time in days within which the order will be shipped.

    * **Estimated delivery time**—The estimated time in days within which the order is expected to be delivered to the customer.