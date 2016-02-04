************************************
Feature and Feature Group Attributes
************************************

.. image:: img/features_storefront.png
    :align: center
    :alt: The features tab on the storefront

General
*******

*	**Name** - Name of the feature as it appears on the storefront and in the Administration panel.
*	**Store** - Store to which the product feature originally belongs.
*	**Feature code** - Individual code to identify the feature.
*	**Position** - Position of the feature relatively to the position of the other features in the list.
*	**Description** - Product feature description that appears on the storefront if the customer clicks the question sign (**?**) next to the feature name in the **Feature** tab.
*	**Type** - Type of the field for the feature: *Check box (Single, Multiple)*, *Select box (Text, Number, Extended)* or *Others (Text, Number, Date)*. Selecting the *Extended* type enables you to extend feature values with several extra attributes like a separate image, description, page title, META description, and keywords.
*	**Group** - Group that the product feature belongs to. If you assign the feature to a group, the next two attributes will apply to the whole group, not just the feature.
*	**Show on the Features tab** - If enabled, the product feature is displayed on the product details page as a separate tab.
*	**Show in product header** - If enabled, the feature is shown under the product header.
*	**Show in product list** - If enabled, the feature appears on the storefront on a product list page among the other product details.
*	**Prefix** - Characters to come before the feature value.
*	**Suffix** - Characters to come after the feature value.

Variants
********

*	**Pos.** - Position of the feature value relatively to the position of the other values in the list.
*	**Variant** - Feature value.

Feature variant attributes for the extended feature types:

* **Image** - Image to illustrate the feature variant.

	Image can be either uploaded from a local computer or the server file system, or linked to a remote location where the required image is physically located.

	Image must be of one of the following formats only: JPEG, GIF, PNG. Maximum size of an uploaded image depends on your server configuration. As a rule, it should not exceed 2 MB.

	An alternative text describes an image in words. Technically, the text that you enter appears inside the ``alt=""`` and ``title=""`` attributes of the ``<img>`` HTML tag. The text is shown when the image is missing or cannot be displayed. It is good practice to have an alternative text associated with the image as an additional SEO-wise opportunity.

* **Description** - Description of the feature variant as it appears on the storefront.

	The description can be either a plain text or a formatted HTML text. If you are not familiar with HTML, you are encouraged to add a formatted description using the built-in WYSIWYG HTML editor.

* **Page title** - Title of the feature variant page on the storefront, which is displayed in the web browser when somebody is viewing the page. Required for SEO purposes.
* **URL** - Type the URL with which you want to replace the current URL. Leave empty if you want to use current page.
* **META description** - Contents of the HTML meta tag describing the feature variant. Required for SEO purposes. 
* **META keywords** - Contents of the HTML tag containing a list of search keywords for the feature variant. Required for SEO purposes.
* **SEO name** - The value to which the standard URL will be changed.

Categories
**********

List of categories which products may utilize this feature. If no category is specified, the feature will apply to all categories.

Share
*****

Stores that share this product feature. Read `Sharing objects <http://docs.cs-cart.com/4.3.x/user_guide/stores/sharing.html>`_ for more details.

