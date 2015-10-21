****************
Product Features
****************

To set up product features:

*   In the Administration panel, go to **Products > Features**.
*   Add features or groups of features that will be used for your products.

    *   **In order to add a group**, click the **+** button on the right, choose **Add group** from the drop-down menu, and specify the following fields in the opened **New group** window:

        *   **Name** - enter group name.
        *   **Store** - store to which the group originally belongs.
        *   **Feature code** - individual code to identify the group.
        *   **Position** - enter group position.
        *   **Description** - enter group description. It will be displayed if a customer clicks on **?** link under the **Features** tab on the product details page in the storefront.
        *   **Show on the Features tab** - if selected, the group is displayed on the product details page as a separate tab.
        *   **Show in product list** - if selected, the group appears on the storefront on a product list page among the other product details.
        *   **Show in header on the product details page** - if selected, the group is shown under the product header.

    .. image:: img/features.png
        :align: center
        :alt: Feature group attributes

    *   Choose the **Categories** tab.
    *   Click the **Add categories** button and add categories for which this group will be available.
    *   Click the **Create** button.

    .. image:: img/feature_group1.png
        :align: center
        :alt: Group categories

    *   **In order to add a feature**, click the **+** button on the right, choose **Add feature** from the drop-down menu, and specify the following fields in the opened **New feature** window:


        *   **Name** - enter feature name.
        *   **Store** - store to which the product feature originally belongs.
        *   **Feature code** - individual code to identify the feature.
        *   **Position** - enter feature position.
        *   **Description** - enter feature description. It will be displayed if customer clicks on **?** link under the **Features** tab on the product details page in the storefront.
        *   **Type** - select feature type.
        *   **Group** - select group to which feature will be applied (in order not to apply feature to any group, leave **None**).
        *   **Show on the Features tab** - if selected, the product feature is displayed on the product details page as a separate tab.
        *   **Show in product list** - if selected, the feature appears on the storefront on a product list page among the other product details.
        *   **Show in header on the product details page** - if selected, the feature is shown under the product header.
        *   **Prefix** - enter feature prefix.
        *   **Suffix** - enter feature suffix.

    *   Click the **Create** button.

    .. image:: img/feature_group2.png
        :align: center
        :alt: Feature attributes

*   Go to **Products > Products** and click on the desired product link.
*   Open the **Features** tab.
*   Select the necessary feature variant(s) in the features list and click the **Save** button.

.. important::

    When editing a feature, the **Categories** tab is displayed only if it doesn’t belong to any group. In this tab you can set the categories (namely products of these categories) for which this feature can be defined. If the product feature belongs to some group, then such categories are specified when editing the group.

.. note::

    You are able to add **Features** for a product using :doc:`import <../import_export/product_import>`. You can find the description of the correct format in the :doc:`Imported fields format <../import_export/fields_format>` article.