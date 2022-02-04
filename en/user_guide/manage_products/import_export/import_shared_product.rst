************************************************
How to: Import Products Shared Among Storefronts
************************************************

.. important::

    This article is only for users of CS-Cart Ultimate version 4.14.1 and higher.

CS-Cart allows administrators to :ref:`show products on several storefronts <share-products-configurable-sharing>`. To do this, add the product, assigned to the category of one storefront, to another storefront's category. You can update such products manually or using import.

Administrators of any storefront that owns product category can import it. Moreover, you can import product data that belongs only to the current storefront.

*Example*

*Store owner assigned a category from Storefront-2 to the product that belongs to Storefront-1. Administrator of the Storefront-2 needs to update part of the produсt field (description, prices, etc.) using import.*

A product from the *Storefront-2*, shared among several storefronts, is imported :doc:`like any other product </user_guide/manage_products/import_export/advanced_product_import>`, but with certain specifics:

* The administrator should specify the storefront which will handle the import in the import preset (*Storefront-2* in the example), or they should switch to the specific storefront and add a preset on it.

* An import file can have any number of fields. At the same time import on the *Storefront-2* takes into account only permitted fields [*]_. Other fields will be disabled.

* The permitted fields will be updated only on the *Storefront-2* after the import. Fields stay remain on the *All storefronts* and *Storefront-1* tabs.

.. [*] Which fields of shared products you can edit (permitted fields):

.. list-table:: 
   :header-rows: 1

   * - The *General* tab:
     - The *SEO* tab 
     - The *Quantity discounts* tab
   * - * Name
       * Categories
       * Price
       * Full description
       * Short description
       * Search words:
       * Promo text
     - * SEO name
       * Page title
       * Meta description
       * Meta keywords
     - * Discount adding and changing is available



