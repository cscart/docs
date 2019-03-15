*********************************
How To: Import Product Variations
*********************************

.. note::

    :doc:`Product variations </user_guide/manage_products/products/product_variations>` are a part of :doc:`the add-on with the same name </user_guide/addons/product_variations/index>`.

During :doc:`product import </user_guide/manage_products/import_export/product_import>` you can group similar products as variations to let customers switch between these products. This article explains what information is required for that. Your file may include more information, such as product categories, quantities, prices, etc.

#. :ref:`Product code <import-product-code>` is required for distinguishing one product from another. During import, the code determines if this product or variation exists in the store. If a product with this code is found, the import will update that product instead of creating a new one. Variation is a product too.

#. :ref:`Variation group code <import-variation-group-code>` serves to group variations. Color and size are applicable not only to a T-shirt, but to a hoodie as well. That's why you need one group code for all colors and sizes of a T-shirt, and another code for all the colors and sizes of a hoodie.

#. **Information about features.**  To group products as variations with *Variation group code*, 3 conditions must be met:

   * There must be :doc:`features </user_guide/manage_products/features/index>` that allow creating variations — a **Purpose** that allows creating variations must be selected on the feature editing page. Purposes have descriptions to help figure out, which purpose is the most suitable for the feature.

   * Every product that becomes a part of a variation group must have the variants specified for all the features that the group is based on. For example, if a product has a group code and the vaules for "Color" and "Size", then other products with the same group code also must have color and size.

     .. hint::

         If the feature variants have already been specified for products before (for example, during a previous import), then *product code* and *variation group code* will be enough for creating a variation group—you won't need to specify the feature variants again.

   * A combination of features that the group is based on must be unique for each variation of the group. For example, if the group is based around only "Color" and "Size", it won't be able to include two "M-sized red T-shirts".

----------

**The best way:** before you try to import products, create the features manually (or import them in your store) and select the correct purpose for them. Here are the benefits of this approach:

* When a feature already exists in your store, you'll be able to map it to a separate column in CSV file or a node in XML file during :doc:`product import </user_guide/manage_products/import_export/advanced_product_import>` (see the example of a CSV file below):

  .. image:: img/variation_import.png
      :align: center
      :alt: Product variations in an imported CSV file.

* Before the import, the features will already have the correct purpose, so variation groups will be created right during the import.

.. note::

    If you export products from CS-Cart or Multi-Vendor, you'll be able to export features that are suitable for variation groups in separate columns.
