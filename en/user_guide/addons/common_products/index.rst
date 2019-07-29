**********************************
Common Products for Vendors [Beta]
**********************************

.. note::

    This add-on first appeared in version 4.9.1. It is available only in Multi-Vendor Plus and Ultimate.

=============
Functionality
=============

The **Common Products for Vendors** add-on allows you to create a single product base for your marketplace. With this add-on, multiple vendors will be able to offer same products at different prices, and customers will have a way to compare the prices and make their choice. This approach prevents vendors from filling the marketplace with multiple similar products that slightly differ in photos or descriptions.

Here's how the add-on works:

#. The **Products → Products** menu gets split into 2 sections: **Products being sold** and **Products that vendors can sell**. This change affects vendors and marketplaces administrators.

#. A marketplace administrator creates *products that vendors can sell*. It works just like :doc:`the standard process of adding products </user_guide/manage_products/products/add_product>`.

#. A vendor browses those products and chooses which of them to sell. If the vendor is already selling some of the products, they will have the **For sale** marker.

   .. image:: img/products_that_vendors_can_sell.png
       :align: center
       :alt: Vendors can choose to sell the products added by marketplace owner.

#. After choosing a product, the vendor is taken to the editing page. That page doesn't allow vendors to change much, except for prices, quantity, and shipping-related properties.

   .. image:: img/selling_existing_product.png
       :align: center
       :alt: The vendor's ability to edit an existing product added by the marketplace owner is limited.

#. Once the vendor saves the product, it will also appear as *product being sold* for both that vendor and the marketplace owner. This approach ensures that the product remains the same, but allows vendors to make different offers to their customers.

#. (optional) If the add-on settings allow that, every vendor will also be able to create their own products. Those products are specific to that vendor, so they will be listed as *products being sold*, but won't appear among *products that vendors can sell*.

   .. hint::

        If you don't want a vendor's product to appear on the storefront without your prior approval, use the :doc:`/user_guide/addons/vendor_data_premoderation/index` add-on.

#. (optional) If vendors can create their own products, then the marketplace owner will be able to make those products common on the product editing page.

   .. image:: img/make_product_common.png
       :align: center
       :alt: A vendor's product can be made common by the marketplace owner.

#. When viewing a product on the storefront, customers will see what vendors offer that product, and on what terms.

   .. image:: img/buying_common_product.png
       :align: center
       :alt: Potential buyers of a product will see offers from all vendors.

============================
Installation & Configuration
============================

The **Common Products for Vendors** add-on is installed :doc:`like any other add-on </user_guide/addons/1manage_addons>`. Once you do it, click the add-on's name to open its settings. The add-on has only one setting:

* **Allow vendors to create products**—determines if vendors have the ability to create their own products in addition to any products you may have added to the marketplace.

  .. image:: img/common_products_settings.png
      :align: center
      :alt: The settings of the "Common Products for Vendors" add-on.

  * Forbidding vendors to create their own products is convenient if you have already added all the possible products and aren't planning to let your vendors offer anything else. Vendors will only be able to select something from the catalog (the list of *products that vendors can sell*).

  * Allowing vendors to create their own products is convenient when you haven't added all the possible products yet, or when each vendor should be able to offer some unique products, while the bulk of the products are supposed to be the same. Vendors will be able to sell existing products from the catalog or create their own products.

    .. image:: img/vendor_creates_product.png
        :align: center
        :alt: A vendor can create an own product, even if the "Common Products" add-on is active.

.. meta::
   :description: How to create sinlge product database and let vendors choose from existing products in Multi-Vendor online shopping mall?
