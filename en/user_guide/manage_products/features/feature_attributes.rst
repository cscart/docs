************************************
Feature and Feature Group Properties
************************************

.. image:: img/features_storefront.png
    :align: center
    :alt: The Features tab on the storefront

.. contents::
    :backlinks: none
    :local: 
    :depth: 1

=======
General
=======

* **Name**—the name of the feature as it appears on the storefront and in the Administration panel.

* **Store**—the storefront to which the product feature originally belongs.

* **Feature code**—the code to identify the feature.

* **Position**—the position of the feature relatively to the position of the other features.

* **Description**—the description of the feature. 

  The description appears on the storefront, if the customer clicks the question sign next to the feature name on the **Features** tab.

* **Type**—the type of the feature: 

  * **Check box**: can be *Single* or *Multiple*.

  * **Select box**: can be *Text*, *Number*, or *Brand/Manufacturer*.

    .. note::

       The variants of a *Brand/Manufacturer* feature has its own properties, such as a separate image, description, page title, META description, and keywords.  

  * **Others**: can be *Text*, *Number*, or *Date*.
 
* **Group**—the group that the product feature belongs to.

  .. warning::

      Deleting a group will also delete all the features that belong to the group. 
 
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

* **Page title**——the content of the ``<title></title>`` container: the title of the brand's page on the storefront, which is displayed in the web browser when somebody is viewing the page. If you don't specify a value manually, it will be generated automatically.

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
