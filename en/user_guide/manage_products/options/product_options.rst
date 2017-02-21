***************************
How To: Set Product Options
***************************

To set product options:

*   In the Administration panel, go to **Products → Products**.
*   Open any product detail page and then open the **Options** tab.
*   On the opened page, click the **Add option** button and complete the form under the **General** tab:

    *   **Name** - Name of the product option as it appears on the storefront.
    *   **Position** – Position of the product option relatively to the position of the other options in the list.
    *   **Store** - Store to which the option originally belongs.
    *   **Inventory** – If selected, the option has its own number of items in stock, which is tracked separately. This setting is available only after creating the option.
    *   **Type** – Type of the product option: *Select box*, *Radio group*, *Check box*, *Text*, *Text area*, or *File*.

        *   If the option type is *Text*, *Text area* or *File*, please refer to this :doc:`article <../options/option_settings>` in order to learn more about its settings.
        *   If the option type is *Select box* or *Radio group*, open the **Variants** section in the same window:

            *   Complete the **Name** input field (e.g. *Green*).
            *   In the **Modifier** input field, set the amount that will be added to the product price if this option is selected (e.g. *+2*). Leave it empty if the price does not change
            *   Click the **Extra** link to manage the following settings:

                *   **Icon** – Thumbnail to represent the option variant. The image can be either uploaded from a local computer or the server file system, or linked to a remote location where the required image is physically located. An alternative text describes the image and is shown when the image is missing or cannot be displayed. It is good practice to have an alternative text associated with the image as an additional SEO-wise opportunity.
                *   **Earned point modifier/Type** - Positive or negative value that modifies the original number of reward points that customers receive at their accounts when they buy the product. The modifier can be either an absolute value or a percentage.

            *   To add more variants, click the **+** icon.

            .. image:: img/global_options_02.png
                :align: center
                :alt: The Variants tab

    *   **Description** - Description of the product option as it appears on the storefront under the question sign (?) next to the option name.
    *   **Comment** – Comment to be displayed below the option on the storefront.
    *   **Required** - If selected, this option is mandatory for selection/completion.
    *   **Missing variants handling** - Select how impermissible/missing option combinations should be handled: *Display message* - the option will be marked as not available, if the option is mandatory (see the previous setting) customers will not be able to add the product to the cart; *Hide option completely* - the option will be hidden, if the option is mandatory (see the previous setting) customers will be able to add the product to the cart.

*   Click the **Create** button.
*   On the **Editing product** page, choose the **Options** tab and click the **Option combinations** button. This will open a list containing combinations of all product option values on this page. If there are no option combinations defined on this page, click the **+** button. Now you can enter product code and upload small and detailed images for each option combination.

The added product option will be displayed on the product list and product detail pages in the storefront.

Also, you can set the :doc:`global product options <../options/global_options>`.

.. important::

	To add Options for a product using the import option, use the instructions from the :doc:`Imported fields format <../import_export/fields_format>` article.