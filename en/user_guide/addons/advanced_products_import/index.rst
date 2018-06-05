*******************************
Advanced Products Import [Beta]
*******************************

The **Advanced Products Import [Beta]** add-on reduces the time that administrators spend on importing products. You create :doc:`presets </user_guide/manage_products/import_export/advanced_product_import>` (sets of rules that describe how to interpret an imported file), save them, and after that you'll be able to import similar files using those presets.

.. image:: /user_guide/manage_products/import_export/img/advanced_import_field_mapping.png
    :align: center
    :alt: The functionality of the Advanced Products Import.

The preset-based approach solves the following problems of the old import:

-----

**Problem:** Column names in the files provided by a supplier can be different from what is required by CS-Cart. Previously you had to rename those columns in each file.

**Solution:** The advanced import allows you to match the columns in the imported file with product properties in CS-Cart. That way you won't need to rename columns in every new imported file you receive from your supplier.

-----

**Problem:** Sometimes you need to make adjustments to the imported file. For example, if you sell products at higher prices than your supplier's, you need to increase the prices of your supplier by a certain percent. Previously you had to edit the imported file to do that.

**Solution:** The advanced import allows you to use *modifiers*—functions that help you change the imported data. Changing prices is just one of the many things you can do with modifiers.

-----

**Problem:** Some suppliers provide XML files instead of CSV. CS-Cart supported only CSV files in previous versions.

**Solution:** The advanced import supports both XML and CSV files.

-----

**Problem:** CSV files provided by a supplier could have multiple columns with the same name. In that case the data from these columns wasn't imported properly, and you had to edit the file.

**Solution:** The advanced import allows you to assign a product property in CS-Cart to each of those repeating columns (or XML nodes). For example, that allows you to :ref:`import multiple images along with a product <advanced-image-import>`.

-----

**Problem:** A supplier could provide you with an imported file regularly, but it wasn't possible to run the import automatically at certain time intervals.

**Solution:** Once you create an import preset, you'll be able to automate the regular import by using `cron <https://wikipedia.org/wiki/Cron>`_. The command for running the import will appear on the **File** tab of the preset editing page.

-----

================
Related Articles
================

* :doc:`/user_guide/manage_products/import_export/advanced_product_import`
