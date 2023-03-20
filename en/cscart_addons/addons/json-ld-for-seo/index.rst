***************
JSON-LD for SEO
***************

.. raw:: html

    <div class="buy-now">
        <a href="https://www.simtechdev.com/addons/site-management/json-ld-for-seo.html" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    Add a great boost to your SEO with our **JSON-LD for SEO** add-on. JSON-LD (JavaScript Object Notation for Linked Data) offers a simpler means to create machine-readable data from websites to promote search results. Basically, the add-on adds ``schema.org`` data to your website to improve the search ranking.

    Schema is not simple to put on a website, but thanks to our add-on, all you need to do is to fill the fields in with the corresponding information, and the rest is covered with our add-on. No advanced settings, no coding, no effort!

    .. meta::
        :description: JSON-LD for SEO add-on adds schema.org data to your website to improve the search ranking.
        :keywords: JSON-LD, SEO, advanced SEO, schema.org, improve search ranking, CS-Cart, online store

===============
Useful articles
===============

    `Structured data with schema.org <https://yoast.com/structured-data-schema-ultimate-guide/>`_

    `Use JSON-LD to add schema.org data to your website <https://yoast.com/json-ld/>`_

    `A guide to JSON-LD for beginners <https://moz.com/blog/json-ld-for-beginners>`_

    `Introduction to structured data <https://developers.google.com/search/docs/guides/intro-structured-data>`_

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.4 and above, but only versions 4.11.x, 4.12.x and 4.13.x are supported.

    Don't know what archive to download to install the add-on? Read `here <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <http://www.simtechdev.com/helpdesk>`_.

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the JSON-LD for SEO add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click **Upload & install**. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to **Active**.

=====================
Setting up the add-on
=====================

    The information you specify in the add-on settings will appear on the organization profile of Google’s search engine results. It is important to note that it may take several months for the information to present.

    .. fancybox:: img/json-01.png
        :alt: JSON-LD for SEO. organization profile
        :width: 481px

+++++++
General
+++++++

    .. fancybox:: img/json-02.png
        :alt: JSON-LD for SEO. Settings

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. Log in to HelpDesk, and navigate to the Licenses section.

    * **Brief store description**—A brief description of your store that will be shown in search results.

    * **Company logo**—Upload the logo of your company or website. It will be displayed in the search results. If you leave the field empty, the company logo will be taken from the *Logos* field in *Theme editor > Logos*.

    * **Social links**—Enter links to the blog on social networks (Facebook, Instagram, etc) comma-separated in the following format: ``http://www.example.com/Blog``.

    .. note::

        The company name will be taken from the Company name field under *Settings > Company*.

++++++++
Products
++++++++

    .. fancybox:: img/json-ld-products-settings.png
        :alt: JSON-LD for SEO. Products settings

    * **Brand feature**—Select **Brand** in order to display the correct product feature in search results.

    .. note::

        The Brand feature should be created according to `CS-Cart documentation <https://docs.cs-cart.com/latest/user_guide/manage_products/features/manufacturer.html>`_.

    * **Use global product identifier**—Enable this checkbox to see additional settings and specify **Global identifier name** and **Global identifier value** settings.

    * **Global identifier name**—To display correctly, enter the name of the global identifier, for example: isbn, mpn, gtin8.

    * **Global identifier value**—To display correctly, select the appropriate feature. The appropriate feature should be created in the store and filled in for products.

    * **Price valid**—Enter the number of days during which prices are relevant (default value is 1 day).

    * **Show product availability**—If enabled, the "out of stock" and "in stock" labels will be shown in the rich snippets.

    .. fancybox:: img/json-ld-products-settings.png
        :alt: JSON-LD for SEO. Settings

    * **Use the Brand feature as a product brand** (For Multi-Vendor stores only)—If enabled, the **Brand** feature will be used as the product brand instead of the vendor name.

+++++++
Company
+++++++

    .. fancybox:: img/CompanyTab.png
        :alt: Company Tab

    * **Company headquarters address does not match company address**—If the option is not selected, the company address and the company headquarters address are considered the same

    * **Company founders**—Each company founder is allocated one line of the field

    .. fancybox:: img/CompanyFounders.png
        :alt: Company Founders


===============
Validating code
===============

    In order to check that the code has been added to the pages of your store correctly, follow these steps:

    1. Open any page of you store, for example, a product details page.

    2. Copy the URL of the page.

    3. Open the `Structured Data Testing Tool <https://search.google.com/structured-data/testing-tool>`_. Paste the URL of the page (Ctrl+V) on the **Fetch URL** tab and click the **Run Test** button.

    .. fancybox:: img/entering-url.png
        :alt: Structured Data Testing Tool
        :width: 629px

    4. You will see the detected elements. It means that JSON is added correctly. 

    .. fancybox:: img/json-detected-elements.png
        :alt: Structured Data Testing Tool

    Optionally, you can validate the code of the page itself:

    1. Open any page of you store, for example, a product details page, then right click and select **Inspect**.

    .. fancybox:: img/json-product-page.png
        :alt: JSON-LD for SEO. product page

    2. The source code will open. Press **Ctrl+F**, then type **json** in the search box and press **Enter**. Click on the triangle sign to expand the code.

    .. fancybox:: img/json-product-source-code.png
        :alt: JSON-LD for SEO. product page
        :width: 465px

    3. Double click over the expanded part and copy the code (Ctrl+C).

    .. fancybox:: img/json-product-expand-code.png
        :alt: JSON-LD for SEO. validating the code
        :width: 471px

    4. Open the `Structured Data Testing Tool <https://search.google.com/structured-data/testing-tool>`_. Switch to the **Code snippet** tab, paste your code into the tool (Ctrl+V) and click the **Run Test** button.

    .. fancybox:: img/json-running-test.png
        :alt: Structured Data Testing Tool
        :width: 629px

    5. You will see the detected elements. It means that JSON is added correctly. 

    .. fancybox:: img/json-detected-elements.png
        :alt: Structured Data Testing Tool

    If you detect no elements, please `contact us <https://www.simtechdev.com/quote.html>`_ for help.

------------------------------------------------------------------------
Advantages of the JSON-LD for SEO add-on over the standard functionality
------------------------------------------------------------------------

    The add-on overrides the JSON data added by the default SEO add-on, adds additional types of properties and functions. 

    .. fancybox:: img/json-03.png
        :alt: differences of add-ons

    ``*`` You can set up some points according to your needs in the add-on settings (brand, gtin, logo, etc.)

    Here is the example of the validation of the page with the default schema markup added:

    .. fancybox:: img/json-04.png
        :alt: page without JSON-LD for SEO

    The schema is only on the product page and comprises one element: Product.

    And here is the page with the JSON-LD for SEO add-on enabled:

    .. fancybox:: img/json-06.png
        :alt: page with JSON-LD for SEO

    .. fancybox:: img/json-07.png
        :alt: page with JSON-LD for SEO

    .. fancybox:: img/NewTags.png
        :alt: page with JSON-LD for SEO


    There are 4 elements: Organization, Breadcrumbs, WebSite, and Product.

      .. fancybox:: img/json-05.png
        :alt: page with JSON-LD for SEO

-----------------------------------
How to fix common validation errors
-----------------------------------

    ``The aggregateRating field is recommended.``

    Try checking if the ratings on products are filled.

    ``The review field is recommended.``

    Check if product reviews are filled. Use the default CS-Cart `Comments and reviews add-on <https://docs.cs-cart.com/latest/user_guide/addons/comments_and_reviews/index.html>`_ to collect reviews and ratings.

    ``The sku field is recommended.``

    Check if sku (code) is filled for the product.

    ``The brand field is recommended.``

    Check if the standard `brand field <https://docs.cs-cart.com/latest/user_guide/manage_products/features/manufacturer.html>`_ on the product is filled and the corresponding feature is specified in the add-on settings on the `Products`_ tab.

    ``The gtin/mpn/isbn is missing.``

    Create a new feature for some global identifier and fill it in for your products. After creating a feature, select this feature in the Global identifier value setting in the add-on settings on the `Products`_ tab and specify in the Global identifier name field the name of the chosen global identifier.

    ``The priceValidUntil field is missing.``

    Fill in the Price Valid field in the add-on settings on the `Products`_ tab.