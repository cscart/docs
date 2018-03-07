****************************************************
How To: Import Configurable Products with Variations
****************************************************

.. note::

    The ability to create product variations via import first appeared CS-Cart and Multi-Vendor 4.7.2 (until then only existing variations could be updated). Product variations are a part of the :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on.

During :doc:`product import </user_guide/manage_products/import_export/product_import>` you can create and update :doc:`configurable products and their variations </user_guide/manage_products/products/simple_versus_configurable>`. Variations are imported together with configurable products, as separate entries in the same CSV file.

This article only covers how to arrange configurable products and variations in an imported CSV file. Your file may include more columns such as **Quantity**, **Price**, etc.

.. image:: img/variation_import.png
    :align: center
    :alt: Product variations in an imported CSV file.

.. note::

    If the rules specified below aren't followed when you create variations during import, the problematic variations will be skipped, and you'll see an error message after the import is complete.

#. The :ref:`Product type <import-product-type>` column isn't required, but is convenient, because it hels to see the type of the product:

   * ``P``—a simple product.

   * ``C``—a configurable product.

   * ``V``—a variation of the configurable product.

#. The imported CSV file must always have the entry of the configurable product when you create the variations of that product. 

   The relative order of entries in the file is important: the entry of a configurable product goes first, and the entries of its variations must come right after it, in the following lines. For example, sequence *СVVPCVVVPP* is correct, and sequence *CVVPVVCPV* isn't.

#. As usual, the values in the :ref:`Product code <import-product-code>` column serve to distinguish new products and variations from existing ones during import. So, if a product or a variation with the specified code is found in the store, the import will overwrite it.

#. Variations are based on :doc:`product options </user_guide/manage_products/options/index>`. That's why a configurable product (``C``) must have a value specified in the :ref:`Options <import-options>` field of the CSV file in the following cases:

   * The configurable product doesn't exist yet and will be created during import.

   * The configurable product already exists but doesn't have options and any variations yet. 

   .. note::

       If the configurable product already exists and has at least one variation, then the values provided in the **Options** field won't be imported.

#. Each variation you'd like to create must have a value specified in the :ref:`Variation options <import-variation-options>` column. This column contains the information about the option variants that comprise this variation. There are several rules to remember:

   * Only variations should have variation options specified.

   * The *Variation options* field must include only the options and variants that the configurable product has.

   * Two different variations of a single configurable product can't have the same variation options.

.. hint::

    Once variations are created, you can update their properties just like you do that for ordinary products. For example, to update the price or quantity of an existing variation, you don't need to specify *Variation options* or add configurable products before groups of variations in the imported file.
