***************************
Cloud Translation by Google
***************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000127" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Take your website global with our **Cloud Translation by Google** add-on. It integrates the Google Translate service with your CS-Cart store, enabling you to translate the entire site or individual entities.

    .. fancybox:: img/Cloud_translation_010.png
        :alt: Cloud Translation by Google add-on

    Google Cloud Translation API is only available as a paid service. Please see `Pricing <https://cloud.google.com/translate/pricing>`_ for more details.

========
Features
========

    - Translation of products, categories, blog, pages, newsletters, order statuses, payment methods, shipping methods, user groups, currencies, features, options, blocks.

    - Unlimited number of targeted languages.

    - Ability to select events that activate Google translation (such as the creation or update of a product via website).

    - Ability to select fields to translate.

    - Ability to specify the source language and the target language(s).

    - Ability to translate the already translated entities.

    - Ability to translate selected elements via bulk editing panel

    - The entire site translation in one click.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

--------------------------------------
Getting started with Cloud Translation
--------------------------------------

    1. Open the `Cloud Platform Console <https://console.cloud.google.com/home/dashboard>`_.

    2. Create a billing account. For details, see `this how-to guide <https://support.google.com/cloud/answer/6288653#new-billing>`_.

    .. fancybox:: img/Cloud_translation_012.png
        :alt: Creating a billing account at Cloud Translation

    3. Enable API. 

    To do so, go to **API Manager > Dashboard**.

    .. fancybox:: img/Cloud_translation_014.png
        :alt: Cloud Translation Dashboard

    Click **Enable API**.

    .. fancybox:: img/Cloud_translation_015.png
        :alt: Cloud Translation

    Search for **Cloud translation** and click on the **Google Cloud Translation API** app.

    .. fancybox:: img/Cloud_translation_016.png
        :alt: Cloud Translation

    Click **Enable**.

    .. fancybox:: img/Cloud_translation_017.png
        :alt: Cloud Translation

    If you see **Disable**, it means you've successfully enabled the app.

    .. fancybox:: img/Cloud_translation_018.png
        :alt: Cloud Translation
        :width: 476px

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Cloud Translation by Google add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    The settings of the Cloud Translation by Google add-on are divided into the following sections:

    **Google Translate API settings**

    .. fancybox:: img/Cloud_translation_002.png
        :alt: Cloud Translation by Google API key

    In the API field, enter the API key from your Google Cloud Translation account. To do so, you'll need to create an account in the `Google Cloud Platform <https://cloud.google.com/translate/docs/getting-started>`_ and get the API key in the **Credentials** section.

    .. fancybox:: img/Cloud_translation_007.png
        :alt: Cloud Translation by Google API key

    **Google Translate languages**

    This section contains a list of **Languages** (target languages), which are languages being translated to, and **Base language** (source language), which is a language being translated from.

    .. fancybox:: img/Cloud_translation_003.png
        :alt: target and course languages for translation

    **Google Translate API events**

    This section contains a list of events that trigger translation on the website. Here are available options:

    .. fancybox:: img/Cloud_translation_004.png
        :alt: events that trigger translation

    * **Update entity via website**

    If enabled, the text in the target language will be automatically updated when you are changing something in the text in the source language.
    
    Say you have created a text in Japanese (source language) and translated it into English (target language) with the Cloud Translate service. You have also made some stylistic changes in the English language text. Later, you would like to make some changes in the Japanese text. If the setting is enabled, the English text will be translated again when you change the one in Japanese. It is not recommended to set the setting to active.

    * **Create entity via website**

    If enabled, the new fields filled in the source language will be automatically translated into the target language.

    For example, there is no short description in a product. You are creating one in English and it is automatically created in the Japanese version of the product.

    * **Create products via import**

    CS-Cart supports CSV import of products. You can also use the `XML import add-on <https://www.simtechdev.com/addons/site-management/xml-import.html>`_ to create new products.

    If the setting is enabled, the description in the second language will be automatically created when you are making an import.

    To get more details on how the import works, please refer to the `CS-Cart documentation <http://docs.cs-cart.com/4.3.x/user_guide/import_export/index.html>`_. We also have a couple of `videos explaining how the XML import add-on works <https://goo.gl/vEeufZ>`_.

    * **Update products via import**

    It means that if you are updating a product automatically the translation can be changed as well.

    **Fields to translate**

    Select fields of the entities that you want to translate on your site:

    .. fancybox:: img/Cloud_translation_005.png
        :alt: Fields to translate

    If you want to translate the entire site, you can do so by setting the CRON in the CRON settings tab.

    .. fancybox:: img/Cloud_translation_006.png
        :alt: translate the entire site

    The **Translate what is already translated** setting allows to translate entities regardless of earlier translations.

===============================
Translating individual entities
===============================

    You can also translate selective entities, like products, categories, pages by clicking the gear button of the corresponding entity.

    Here's an example of translating the Contact us form.

    .. fancybox:: img/Cloud_translation_008.png
        :alt: translate the site

    Here's the translated form in French:

    .. fancybox:: img/Cloud_translation_009.png
        :alt: contact us form

===========================
Administrator notifications
===========================

   The site admin will be notified when the entire site is translated by cron as well as when products created or updated via import are translated.

   You can edit the email templates by navigating to **Design - Email templates - Administrator notifications**.

    .. fancybox:: img/Cloud_translation_011.png
        :alt: contact us form

---
FAQ
---

===============
Google warnings
===============

    The product was not translated because of the following messages from Google:

    - **Daily Limit Exceeded**

    Google Cloud translation is a paid service.

    You may be exceeding your quota: either the daily billable total, or the limit on request characters per second. Please check it in your `billing account <https://support.google.com/cloud/answer/6288653>`_.

    - **Bad Language pair: EN:TW**

    It means that the target language (TW) is not supported by Google.
    
    The full list of supported languages is available `on this page <https://cloud.google.com/translate/docs/languages>`_.