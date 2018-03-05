********************************
Simple and Configurable Products
********************************

.. important::

    To be able to create configurable products, you need to :doc:`install and enable the Product Variations add-on </user_guide/addons/product_variations/index>`. **The add-on is currently at the beta stage.**

Starting with **CS-Cart & Multi-Vendor 4.6.1**, administrators can choose **Product type** when they create a product. The type determines how :doc:`the options of that product </user_guide/manage_products/options/index>` will work.

* *Simple product*—option variants can be grouped as :doc:`option combinations </user_guide/manage_products/options/option_combinations>`. That's the old behavior.

* *Configurable product*—option variants can be used to create :doc:`product variations <product_variations>`. That's the new behavior that was introduced in version 4.6.1.

.. image:: img/product_type.png
    :align: center
    :alt: The product type is selected during product creation and determines how the options of the product will work.

.. note::

    If necessary, you'll be able to :doc:`convert simple products to configurable ones <convert_combinations_to_variations>`, but not the other way around. That's why it's important to know the difference between option combinations and product variations.

==========================================
Option Combinations and Product Variations
==========================================

Product variations appear on the storefront almost like option combinations. The main difference in the Administration panel: product variations are much closer to separate products, when compared to option combinations.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 10 10

    *   -   
        -   Option combinations
        -   Product variations
    *   -   Display on the storefront
        -   Customers select an option combination on the product page by choosing a variant for each option. Unless you modify CS-Cart code, there is no way to show all available option combinations on the product page at the same time.
        -   Customers can select variations by choosing a variant for each option, but administrators can also :doc:`add a block that displays all variations of a product </user_guide/look_and_feel/layouts/blocks/variations>` to the page of that product. That allows customers to see all available variations and their stock, and even add different variations to cart from the same page without having to manually select the variants for options.
    *   -   Back-in-stock notifications
        -   Customers can subscribe for notifications only when a product is tracked without options. There's no way to subscribe for a particular option combination.
        -   Customers can subscribe for a specific product variation.
    *   -   Creation process
        -   Option combinations can be created individually or generated automatically. Automatic generation always creates all possible option combinations for a product and doesn't overwrite existing combinations.
        -   Until version 4.7.2, adding a new variation to a product required re-generating all variations of the product (the data of existing variations was lost in the process). Now you can always select which of the possible variations should exist in your store, and the data of already existing variations isn't lost until you delete those variations.
    *   -   Database
        -   Option combinations are stored in a separate table that is called ``cscart_product_options_inventory``.
        -   Product variations are stored in the ``cscart_products`` table. It's the same table where the products are stored.
    *   -   Export/Import
        -   Option combinations are exported and imported separately from products, in a different CSV file.
        -   Product variations are exported and imported along with products, in the same CSV file.
    *   -   Images
        -   Each option combination has only one image. It replaces the main image of the product when the combination is selected.
        -   Each product variation has its own set of one main and multiple additional images.
    *   -   Price and list price
        -   A fixed price can't be specified for an option combination. Instead, the price modifiers of all options that comprise the combination are applied to the price of the main product. The list price is common for all option combinations.
        -   Each product variation has its own fixed price. If the price modifiers of option variants are specified, they will also affect the price of a variation. Each variation has its own list price.
    *   -   Product features
        -   All option combination has the same values of features.
        -   Each product variation can have its own values of features.
    *   -   Quantity discounts
        -   The quantity discounts specified for a product apply to all its option combinations. A setting determines whether or not to treat different option combinations as separate products when calculating quantity discounts.
        -   Quantity discounts must be specified for each product variation individually.
    *   -   Search
        -   You can't search for a specific option combination, only for products.
        -   You can search for a product variations using the **Advanced search**.
    *   -   Shipping properties
        -   A fixed weight can't be specified for an option combination. Instead, the weight modifiers of all options that comprise the combination are applied to the weight of the main product. Other shipping properties are common for all option combinations of a product.
        -   Each product variation has its own fixed weight. If the modifiers of option variants are specified, they will also affect the weight of a variation. Other shipping properties can also be changed separately for each variation.
    *   -   Taxes
        -   The taxes selected for a product apply to all its option combinations.
        -   Taxes must be selected for each product variation individually.
