*************
SEO Templates
*************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000133" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    Increase your pages click-through-rate with our `SEO Templates <https://www.simtechdev.com/addons/site-management/seo-templates.html>`_ add-on. It offers SEO templates for products, categories, images, pages, and blog posts to help you optimize important meta data. 

    You can specify a page title, meta description, meta keywords, alternative text, and SEO name for the main image with minimum efforts involved. It will free you from manually inserting all these data for each and every item in your store.

    .. fancybox:: img/creating-seo-template.png
        :alt: creating a SEO template

    The page title and meta description influence the decision of the searcher as to whether they want to click through on your content from search results or not. The more descriptive, attractive and relevant the description, the more likely someone will click through. 

    So meta data are one of the most important on-page ranking factors and should be treated with care.

    .. fancybox:: img/Seo_templates_007.png
        :alt: Meta description

    Take your SEO strategy to the next level with the **SEO Templates** add-on! Follow the guidelines below.

    .. important::

        Once you create SEO templates, you will need to apply them via a cron script on your server. If you have any difficulties with it, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

        Alternatively, you can apply templates via admin panel:

            .. fancybox:: img/generating-templates.png
                :alt: Meta description

============
Key features
============

- SEO templates for products, categories, images, pages, and blog posts;

- Automatically assigned Page title, Meta description, Meta keywords, ALT text of the main image, and SEO name;

- Ability to overwrite the old metadata;

- Updating templates via cron on the server or manually in the admin panel;

- Ability to select the metadata that will be overwritten;

- Extensive list of placeholders used in a SEO template;

- Ability to clone templates;

- SEO templates created by vendors;

- Ability to create a 301 redirect from old URLs;

- Ability to restrict the length of a SEO name;

- Automatic removal of leading and trailing spaces;

- Automatic addition of a space between multiple placeholders.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

    .. note::
    
        The SEO Templates add-on is incompatible with the default HiDPI displays support add-on.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the SEO Templates add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://seo-templates.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the SEO Templates add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/seo-templates-installed.png
        :alt: SEO templates. Manage add-ons

=====================
Setting up the add-on
=====================

    .. fancybox:: img/seo-templates-settings-new.png
        :alt: SEO templates settings

    * **License key**—Enter the license key to activate the add-on. You will receive this key in the order confirmation email. You can also see license keys for all your purchased add-ons in your HelpDesk account. Log in to `HelpDesk <https://www.simtechdev.com/helpdesk>`_, and navigate to the **Licenses** section:

    .. fancybox:: img/licenses.png
        :alt: License key

    * **Rename the product images according to the SEO template.**—If enabled, the products images of your store will be renamed according to the SEO template.

=====================================================
Creating a SEO template for products/categories/pages
=====================================================

    To create a SEO template, follow these steps:

    1. Navigate to **Website → SEO Templates**.

    2. Click the **+** button in the top right and select the appropriate template:

    - Select **template for products** if you want to create a template for products.

    - Select **template for categories** if you want to create a template for categories.

    - Select **template for pages** if you want to create a template for pages or blog posts.

    3. Fill in the provided fields. The placeholders on the left should help you. You can also use twig. See `Creating templates using twig`_ for more details.

    .. fancybox:: img/creating-seo-template.png
        :alt: creating a SEO template

    .. note::

        While filling in the fields, except for the Name field, the TRIM function is applied automatically. It removes both leading and trailing spaces from text, and also "normalizes" multiple spaces between words to one space character only. When you add multiple placeholders to the field, a space between them is added automatically.

    **Name**—Enter a name for the SEO template.

    **Store**—Select an appropriate storefront if you are using CS-Cart with multiple storefronts.

    .. note::

        If you are creating a SEO template for products shared among multiple stores, such products will have their own template in each store.

    **Page title**—It is the main text that describes a web page. It appears at the top of a browser’s window.

    .. fancybox:: img/Seo_templates_005.png
        :alt: page title

    Page titles also show up in the search engine results as the links that potential visitors will click on.

    .. fancybox:: img/Seo_templates_006.png
        :alt: page title

    **Meta description**—It is the short paragraph of text placed in the HTML of a webpage that describes its content. The meta description will then appear under your page’s URL in the search results. The more descriptive, attractive and relevant the description, the more likely someone will click through.

    .. fancybox:: img/Seo_templates_007.png
        :alt: Meta description

    The meta description will also appear when shoppers share your products in social networks.

    .. fancybox:: img/Seo_templates_012.png
        :alt: Meta description
        :width: 530px

    **Meta keywords**—It is one of meta tags that you can insert into your web pages to provide search engines with information about your pages that isn’t visible on the page itself. Be sure that each keyword accurately reflects the content of your pages.

    **ALT text of the main image**—The alt attribute also adds SEO value to your website. It helps your website achieve better rankings in the search engines by associating keywords with images.

    **SEO name**—Use this field for search engine optimization to boost your website's presence and ensure you gain relevant and consistent organic traffic.

    .. note::

        In Multi-Vendor stores, you can also select the vendor whose products you want to update. For example, if you select **None**, products of all vendors will be updated. If you select a particular vendor (Acme, for example), only his products will be updated.

        .. fancybox:: img/Seo_templates_024.png
            :alt: selecting a vendor

    4. Click **Create**.

    5. Switch to the **Conditions** tab.

    .. fancybox:: img/seo-templates-conditions-tab.png
        :alt: Meta description

    Here, you can add products, categories, or pages this template should be applied for. Simply click **Add condition**, choose the type (products, categories, or pages), click **Add categories** or **Add product** or **Add pages** and select the desired ones.

    The rest of the settings are explained in the `Applying a SEO template to products/categories/pages`_ section.

    .. tip::

        You can preview a product the way it will look in the search results by going to **Products → Products**, select a desired product, switch to the **SEO** tab and have a look at the **Google rich snippets preview** section.

        .. fancybox:: img/Seo_templates_008.png
            :alt: Google rich snippets preview

====================================================
Applying a SEO template to products/categories/pages
====================================================

    Once you've created a SEO template, you will need to apply it to products/categories/pages. Follow these steps:

++++++++++++++++++++++++++++++
Step 1. Configuring a template
++++++++++++++++++++++++++++++

    In the admin panel:

    1. Open the required SEO template and switch to the **Update** tab.

    Configure the following settings:

    .. fancybox:: img/seo-templates-update-tab.png
        :alt: Meta description

    **Override filled fields**—If selected, the meta data and alternative text for images defined for specific products/categories/pages will be overridden with the values specified for the template. 

    For example, you've already specified meta data and alternative text for images for a product on its detailed page:

    .. fancybox:: img/Seo_templates_009.png
        :alt: updating SEO template

    but you want to override it with the values set in this template, check the **Override filled fields** box. If not, leave this box empty.

    2. After that, select the checkboxes with the fields that you want to update.

    **Update page title**—If enabled, the page title will be updated. Disable it if you do not want to update the page title.

    **Update meta description**—If enabled, the meta description will be updated. Disable it if you do not want to update the meta description.

    **Update meta keywords**—If enabled, the meta keywords will be updated. Disable it if you do not want to update the meta keywords.

    **Update ALT text of the main image**—If enabled, the ALT text of the main image will be updated. Disable it if you do not want to update it.

    **Update SEO name**—If enabled, the SEO name will be updated. Disable it if you do not want to update it.

    .. note::

        To create SEO names, the SEO Templates add-on interacts with the standard SEO add-on. It automatically replaces spaces with "-", as well as unsafe characters.
    
    3. Switch to the **Conditions** tab and pick categories, products, or pages you want the template to be applied to.

    .. tip::

        If you want to apply the template to all products, select all categories.

            .. fancybox:: img/Seo_templates_020.png
                :alt: updating SEO template

    4. Click **Save**.

    5. On the **SEO Templates** page have a look at the note on the right.

    .. fancybox:: img/Seo_templates_010.png
        :alt: updating SEO template

    It contains a command that you should run on your server to apply the changes in the templates. You can set up a cron job to run it according to a schedule (for example, every day, every month) so that you won't need to apply the new changes manually every time.

++++++++++++++++++++++++++
Step 2. Applying templates
++++++++++++++++++++++++++

    You can apply templates in two ways:

   **1. Running a cron**

    Run the following command on the server:

    **php /path/to/cart/admin.php --dispatch=seo_pack_cron.apply --cron_password=CRON_PASSWORD**

    where:

    *path/to/cart* is the path to your website

    *CRON_PASSWORD* is the access key to cron script that you can find under **Settings - Security settings**.

        .. fancybox:: img/Seo_templates_002.png
            :alt: Security settings

    .. note::

        We recommend applying SEO templates via a cron script on your server. If you have any difficulties with it, please contact your server administrator or `contact us <https://www.simtechdev.com/helpdesk>`_ for help.

    .. important::

    	Disable the templates if you don't want them to be applied.

    	    .. fancybox:: img/Seo_templates_011.png
        		:alt: updating SEO template

    **2. Via admin panel**

    On the SEO templates page, hover the mouse pointer over a template you want to apply and select **Generate** under the gear button.

    .. fancybox:: img/generating-templates.png
            :alt: generating a template

    Alternatively, you can select **Generate** on the template details page.

    .. fancybox:: img/generate.png
            :alt: generating a teplate

    The process will start.

    .. fancybox:: img/Seo_templates_023.png
            :alt: applying seo templates
            :width: 200px

    Once it's complete, you will see a corresponding notice.

=============================================================
Creating a SEO template for all products of the main category
=============================================================
    
    You can create a SEO template for the main category. In that case, the SEO template will be applied to the products in the main category and subcategories.

    1. Open **Settings > General**, find the **Show products from subcategories of the selected category** setting.

    Make sure that it is active. If not, select the checkbox and click **Save**. You can disable it later when the SEO CRON job is complete. 

    .. fancybox:: img/Seo_templates_013.png
        :alt: updating SEO template

    2. Open **Website > SEO templates** and create a **Template for products**.

    .. fancybox:: img/Seo_templates_014.png
        :alt: Template for products

    3. In the **General** tab, fill in the provided fields.

    .. fancybox:: img/creating-seo-template.png
        :alt: updating SEO template

    4. Open the **Conditions** tab and click **Add condition**.

    .. fancybox:: img/add-conditions.png
        :alt: updating SEO template

    5. Choose **Categories** and click **Add categories**.

    .. fancybox:: img/choose-categories.png
        :alt: updating SEO template

    .. fancybox:: img/add-categories.png
        :alt: updating SEO template

    5. Choose the category of the highest level and click **Add categories**.

    .. fancybox:: img/Seo_templates_015.png
        :alt: updating SEO template

    6. Click **Save**.

==================================
Creating a SEO template for images
==================================

    To create a SEO template for images, follow these steps:

    1. Navigate to **Website → SEO Templates**.

    2. Click the **+** button in the top right and select the **Template for product images**.

    .. fancybox:: img/creating-image-template.png
        :alt: *Template for product images

    3. Enter a name for the SEO template.

    4. In the **Product image name** field, create a template using placeholders on the left.

    .. note::

        If the **SEO name** placeholder is NOT available to you, make sure you enabled the default SEO add-on.

            .. fancybox:: img/seo-name.png
                :alt: *Template for product images

    .. note::

        While filling in the fields, except for the Name field, the TRIM function is applied automatically. It removes both leading and trailing spaces from text, and also "normalizes" multiple spaces between words to one space character only. When you add multiple placeholders to the field, a space between them is added automatically.

    4. Click **Create**.

    5. Switch to the **Update** tab.
    
    * **Update product image name**—If enabled, the names of product images will be updated according to the template.

    .. fancybox:: img/image-template-update-tab.png
        :alt: Meta description
    
    6. Switch to the **Conditions** tab.

    Here, you can add products and categories this template should be applied for. Simply click **Add condition**, choose categories or products, then click **Add categories** or **Add product** and select the desired ones.

    .. fancybox:: img/seo-templates-conditions-tab.png
        :alt: Meta description




    7. Click **Save**.

    8. Hover the mouse pointer over the template and under the appeared gear button select **Generate**.

    .. fancybox:: img/generating-templates.png
        :alt: generating a seo template

    9. Once the template is applied, you will see the result.

    .. fancybox:: img/update-complete.png
        :alt: generating a seo template
        :width: 100px

    Alternatively, you can set up a cron to update product image names automatically. See how: `Step 2. Applying templates`_.

================================================
Translating a SEO template into another language
================================================

    In order to translate a SEO template:

    1. Open the SEO template you'd like to translate. Switch the language to the required one. 

    .. fancybox:: img/Seo_templates_018.png
        :alt: translating a SEO template

    2. Translate the language variables into the target language and save the changes.

    .. fancybox:: img/Seo_templates_019.png
        :alt: translating a SEO template

=============================
Creating templates using twig
=============================

    **Twig** is a template engine that will allow you to write readable SEO templates using placeholders. You can write desired conditions, capitalize words, replace elements, join elements, etc.

    Twig defines three types of **special syntax**:

    .. code::
    
        {{ ... }}
    
    "Says something": prints a variable or the result of an expression to the template.
    
    .. code::

        {% ... %}
    
    "Does something": a tag that controls the logic of the template; it is used to execute statements such as for-loops for example.
    
    .. code::

        {# ... #}
    
    "Comment something": it's used to add single or multi-line comments. The content of the comments isn't included in the rendered pages.

    Twig also contains **filters**, which modify content before being rendered. See the following examples:

    1. Uppercase

    .. code::

        {{ 'example'|upper }} → EXAMPLE

    2. Lowercase 

    .. code::

        {{ 'EXAMPLE'|lower }} → example

    3. Capitalize

    .. code::
    
        {{ 'example'|capitalize }} → Example

    4. If the price is 0, don't use the price

    .. code::

        {% if price %} {{ price }} {% endif %}

    5. If the feature is not specified, don't use the feature. It allows you to avoid spaces between commas.

    .. code::

        {% if feature_example %} {{ feature_example }} {% endif %}

        , where *{{ feature_example }}* is a feature.

    For further information, please read `Twig documentation <https://twig.symfony.com/doc/2.x/>`_.

===================================================
How to allow/forbid vendors to create SEO templates
===================================================

    You may want to allow some of the vendors to create and edit SEO templates, while you want to forbid this for other vendors. You can do so in the following way:

    1. Go to **Customers > User groups**.

    2. Pick the existing user group or create a new one with the **Administrator** type.

    3. Open the **Privileges** tab and select the **Manage SEO Templates** checkbox if you want to allow vendors in this group to manage SEO templates or clear the checkbox if you want the opposite.

    .. fancybox:: img/Seo_templates_025.png
        :alt: translating a SEO template

    4. Click **Save**.

==================================
Compatibility with Common Products
==================================
    The add-on is adapted to the Common Products add-on. Perform the following settings to ensure the consistant compatibility of the add-ons:

    1. Open SEO-Templates tab of the Website Menu on the Admin pannel

    .. fancybox:: img/SEOTemplates.png
        :alt: SEO-templates tab

    2. Create a new/open an existing Template for product

    3. Select 'none in the Vendor field, fill in the meta descriprion and page title, mark 'Override filled fields', 'Update meta descriptions' and 'Update page title' fields on the Update tab.

    .. fancybox:: img/template_setting1.png
        :alt: Template setting1

    .. fancybox:: img/template_setting2.png
        :alt: Template setting

    4. Create a new product in a Products tab and select 'All vendors (common products)' in the Vendors fields

    ..  fancybox:: img/new_product_setting.png
        :alt: Setup the new product

    5. Log in as a vendor and select a newly created product in the Products -> Products that vendors can sell tab

    6. Return to the main Admin Pannel and start the Template generation

=========================================
How to share a SEO template among vendors
=========================================

    Say, you created a SEO template for Vendor A, and now you want to make this template available to Vendor B. You do not want to configure it from scratch one more time, do you? Therefore the add-on introduces an ability to clone templates for further editing. Simply follow these steps:

    1. Go to **Website > SEO Templates**.

    2. Hover the mouse pointer over the template you want to clone and select **Clone** under the gear button.

    .. fancybox:: img/Seo_templates_026.png
        :alt: cloning template

    3. The template will be cloned with the **[CLONE]** postfix and you will find yourself on its detailed page. It will have a **Disabled** status.

    4. Adjust the settings, select another vendor if necessary. Set the status to **Active**.

    .. fancybox:: img/Seo_templates_027.png
        :alt: cloning a SEO template

    5. Click **Save**.