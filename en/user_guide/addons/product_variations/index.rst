******************
Product Variations
******************

.. important::

    This add-on first appeared in **CS-Cart & Multi-Vendor 4.6.1**. Currently the add-on is at the beta stage: `you may encounter bugs once you install the add-on <https://www.cs-cart.com/bug-fixing.html>`_.

The **Product Variations** add-on allows you to create configurable products. A configurable product can't have :doc:`option combinations </user_guide/manage_products/options/option_combinations>`, but it has :doc:`product variations </user_guide/manage_products/products/product_variations>` instead. Product variations appear on the storefront almost the same way as option combinations, but can be customized to a greater extent in the Administration panel.

.. image:: img/list_of_variations.png
    :align: center
    :alt: Configurable products can have product variations (child products) based on options.

Before you can use the add-on, you need to install it:

#. In the Administration panel, go to **Add-ons → Manage add-ons**.

#. Switch to the **Browse all available add-ons** tab.

#. Find **Product Variations (Beta)** on the list.

#. Click **Install**.

Once installed, the add-on will be activated automatically, and you'll be able to create configurable products and their variations.

============
Known Issues
============

* **Add-ons:** Other add-ons (such as **Reward Points**, **Tags**, **Attachments**, and so on) don't work with variations yet. The tabs of those add-ons don't appear on variation editing page.

* **Order management:** When you add products to the order in the Administration panel, you can't add a variation directly; instead you have to add the configurable product with the selected options.

* **Shipping properties:** Product variations aren't distributed by boxes properly yet.

* **Storefronts:** Variations don't work properly with multiple storefronts yet. For example:

  * The icons that allow you to edit product properties on all storefronts at once in the **All stores** mode doesn't appear.

  * The variations of a shared configurable product can't be edited on the storefront with which the configurable product is shared.

================
Related Articles
================

:doc:`Working with Product Variations </user_guide/manage_products/products/product_variations>`

:doc:`/user_guide/manage_products/products/simple_versus_configurable`
