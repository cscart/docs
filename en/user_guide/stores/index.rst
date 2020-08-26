***********
Storefronts
***********

`CS-Cart Ultimate <https://helpdesk.cs-cart.com/cs-cart-ultimate-license.html>`_ and `Multi-Vendor Ultimate <<https://helpdesk.cs-cart.com/multi-vendor-ultimate-license.html>>`_ allow you to manage multiple storefronts with one administration panel. Storefronts behave slightly differently:

* **In CS-Cart Ultimate**, storefronts can appear to customers as independent stores. They can have their own products, categories, settings, user base, and checkout mechanism.

* **In Multi-Vendor Ultimate**, storefronts are a way to create regional branches of your marketplace. You can create a storefront for a specific country, with specific currencies, languages, payment and shipping methods, and vendors. For different looks, each storefront can have its own theme, layout, and blocks.

Here are the important differences between CS-Cart Ultimate in Multi-Vendor Ultimate:

.. list-table::
    :header-rows: 1
    :widths: 10 20 15

    *   -   Object Type
        -   CS-Cart Ultimate
        -   Multi-Vendor Ultimate
    *   -   Product
        -   A product belongs to a specific storefront. It can appear simultaneously on multiple storefronts, if you assign categories from those storefronts to the product. Prices can be different, depending on the storefront.
        -   A product belongs to a vendor. It will appear on all the storefronts where the vendor appears. The price will remain the same.
    *   -   Category
        -   A category always belongs to one specific storefront and appears only there.
        -   A category appears on all the storefronts.

.. important::

    To configure multiple storefronts on your web hosting, please :doc:`follow these instructions. </install/storefronts/index>`

.. toctree::
    :maxdepth: 4
    :titlesonly:
    :glob:

    *

.. meta::
   :description: Articles about configuring multiple storefronts in CS-Cart and Multi-Vendor on different domains or subdomains for specific region or audience.
