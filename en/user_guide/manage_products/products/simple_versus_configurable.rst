******************************************
Option Combinations and Product Variations
******************************************

.. important::

    This article explains the difference between the now-obsolete and current functionality, so it isn't relevant for new CS-Cart users.

:doc:`Product variations </user_guide/addons/product_variations/index>` can do everything (and much more) than :doc:`option combinations </user_guide/manage_products/options/option_combinations>` can.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 10 10

    *   -   
        -   Option combinations
        -   Product variations
    *   -   Display on the storefront
        -   Customers select an option combination on the product page by choosing a variant for each option. Unless you modify CS-Cart code, there is no way to show all available option combinations on the product page at the same time.
        -   Customers select variations in the catalog or on the product page. Administrators can :doc:`add a block that displays all variations of a product </user_guide/look_and_feel/layouts/blocks/variations>` to the page of that product. That allows customers to see all available variations and their stock, and add different variations to cart from the same page.
    *   -   Back-in-stock notifications
        -   Customers can subscribe for notifications only when a product is tracked without options. There's no way to subscribe for a particular option combination.
        -   Customers can subscribe for a specific product variation.
    *   -   Creation process
        -   Option combinations can be created individually or generated automatically. Automatic generation always creates all possible option combinations for a product and doesn't overwrite existing combinations.
        -   Existing products can be grouped with other products as variations, or variations can be created automatically based on features.
    *   -   Database
        -   Option combinations are stored in a separate table that is called ``cscart_product_options_inventory``.
        -   Product variations are stored in the ``cscart_products`` table. It's the same table where the products are stored.
    *   -   Export/Import
        -   Option combinations are exported and imported separately from products, in a different CSV file.
        -   Variations are products, are exported and imported along with products, in the same CSV file.
    *   -   Images
        -   Each option combination has only one image. It replaces the main image of the product when the combination is selected.
        -   Each product variation has its own set of one main and multiple additional images.
    *   -   Price and list price
        -   A fixed price can't be specified for an option combination. Instead, the price modifiers of all options that comprise the combination are applied to the price of the main product. The list price is common for all option combinations.
        -   Each product variation has its own price and list price.
    *   -   Product features
        -   All option combination has the same values of features.
        -   Each product variation has its own values of features.
    *   -   Quantity discounts
        -   The quantity discounts specified for a product apply to all its option combinations. A setting determines whether or not to treat different option combinations as separate products when calculating quantity discounts.
        -   Quantity discounts must be specified for each product variation individually.
    *   -   Search
        -   You can't search for a specific option combination, only for products.
        -   Variations are products, so they'll show up in search results. **Advanced search** provides more ways to find the product you need.
    *   -   Shipping properties
        -   A fixed weight can't be specified for an option combination. Instead, the weight modifiers of all options that comprise the combination are applied to the weight of the main product. Other shipping properties are common for all option combinations of a product.
        -   Each product variation has its own fixed weight. Other shipping properties can also be changed separately for each variation.
    *   -   Taxes
        -   The taxes selected for a product apply to all its option combinations.
        -   Taxes must be selected for each product variation individually.
