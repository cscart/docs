************************************
Feature and Feature Group Properties
************************************

.. contents::
    :backlinks: none
    :local: 
    :depth: 1

=======
General
=======

* **Name**—the name of the feature that only appears in the Administration panel to help you distinguish between multiple options that have the same storefront name.

* **Storefront name**—the name of the product feature as it appears on the storefront.

  For example, if you sell shoes and T-shirts, you probably have 2 separate features called *Size* on the storefront. Without the main names (such as *Shoe size* and *T-shirt size*) they'd look the same in the administration panel, and it'd be hard to guess which of these features to apply to your newly-created product.
  
* **Storefront** (available only in CS-Cart) — the storefront, which the feature belongs to.

* **Vendor** (vendors are available only in Multi-Vendor)—the vendor who ownes this feature, and who has the ability to edit and delete it.

  .. note::
  
      When a vendor creates a feature, his name automatically appears in the **Vendor** field. Please note that by default, vendors can not create features in Multi-Vendor. To give them that ability, the marketplace owner has to :doc:`allow them to manage product features </user_guide/manage_products/features/vendor_features>`.

* **Purpose**—what the feature will be used for. Every purpose has a description that helps with choice. Instead of repeating their descriptions here, we'll say what purpose it's best to choose, and when:

  * **Product search via filters** is the most versatile, and usually is the best choice. The only exception is when you intend to use it to differentiate :doc:`product variations </user_guide/manage_products/products/product_variations>`.

  * **Variations as separate products** is good when you have multiple similar products with different looks. For example, when the same model of T-shirt is available in multiple colors, you can show each color as a separate product. Then the feature will allow customers to select the desired color on the product page.

  * **Variations as one product** is good when you have multiple similar products that look the same too. For example, when a T-shirt of the same color is available in multiple sizes, you can make all sizes share one position in the product list.

  * **Brand, author, etc.** is good when you need an own page for each variant of a feature, with the list of products that have this variant. Every variant has its own properties, such as a separate image, description, page title, META description, and keywords.

  * **Additional information** is good when you're sure you won't need filters by this feature, and when there is no way to know in advance what sort of values this feature might have.

* **Feature style**—determines what the feature will look like on the storefront.

* **Filter type**—determines how :doc:`a filter by this feature </user_guide/manage_products/filters/index>` will look at the storefront. It also determines what values a feature can have. For example:

  * *Number slider*—the feature will accept only numbers.

  * *Date selector*—the feature will accept only dates.
 
* **Group**—the group that the product feature belongs to.

  .. warning::

      Deleting a group will also delete all the features that belong to the group.

* **Feature code**—the code to identify the feature.

* **Position**—the position of the feature relatively to the position of the other features.

* **Description**—the description of the feature. 

  The description appears on the storefront, if the customer clicks the question sign next to the feature name on the **Features** tab.
 
* **Show on the Features tab**—if you tick this checkbox, the product feature will appear on the product details page on the **Features** tab.

* **Show in product header**—if you tick this checkbox, the feature will appear on the product detail page under the product's name.

* **Show in product list**—if you tick this checkbox, the feature will appear among the other product details in the product list on the storefront.
 
* **Prefix**—what you enter here will appear before the feature value.

* **Suffix**—what you enter here will appear after the feature value.

========
Variants
========

Features of *Check box: Multiple* or *Select box* type have variants that the administrators can choose from when editing the product. These variants can be added or edited on the **Variants** tab.

* **Pos.**—the position of the feature variant relatively to other variants in the list.

* **Variant**—the value of the feature variant.

The following properties of feature variants are available only for the *Brand/Manufacturer* feature type:

* **Image**—the image to illustrate the brand.

  An image can be either uploaded from a local computer or the server file system, or by specifying a link to the image. Only JPEG, GIF, and PNG images are supported. The maximum size of an uploaded image depends on your server configuration. As a rule, it should not exceed 2 MB.

  An alternative text describes the image in words. Technically, the text that you enter appears inside the ``alt=""`` and ``title=""`` attributes of the ``<img>`` HTML tag. The text is shown when the image is missing or cannot be displayed. Using alternative text associated with the image is good for `SEO <https://en.wikipedia.org/wiki/Search_engine_optimization>`_.

* **Description**—the description of the brand as it appears on the storefront.

  The description can be either a plain text or a formatted HTML text. If you are not familiar with HTML, you can add a formatted description with the built-in WYSIWYG HTML editor.

* **Page title**—the content of the ``<title></title>`` container: the title of the brand's page on the storefront, which is displayed in the web browser when somebody is viewing the page. If you don't specify a value manually, it will be generated automatically.

* **URL**—the link to the brand's website.

* **META description**—the content of the ``description`` meta-tag: a brief description of the brand.

* **META keywords**—the content of the ``keywords`` meta-tag: a list of search keywords that appear on the brand's page.

  .. note::

      Instructions on how to best use the meta tags may vary depending on the search engine.

* **SEO name**—the value to which the standard URL of the brand's page will be changed.

==========
Categories
==========

The list of categories where products can have this feature. If no category is specified, the feature will be available to all categories.

=====
Share
=====

The list of stores that share this product feature. Learn more about :doc:`sharing objects </user_guide/stores/sharing>`.

.. meta::
   :description: Description of product feature properties in CS-Cart and Multi-Vendor ecommerce software.
