**********************************
How To: Import Images for Products
**********************************

A product in CS-Cart and Multi-Vendor can have multiple images. Normally you'd need to open the product editing page, drag and drop the images into the special area, and save the changes. It's a fast way, but sometimes admins need to update images for a large number of products at once. In this case they use :doc:`product import </user_guide/manage_products/import_export/advanced_product_import>`. This article describes how to import images together with products.

.. important::

    In most cases, images must be uploaded to the server of your store before you can import them.


.. _upload-images-for-import:

=====================
Ways to Upload Images
=====================

Before you can import the images, you need to upload them. You can do it via:

* any FTP client of your choice;

* the built-in **File editor**.

-----------
File Editor
-----------

Let’s assume that we want to upload some images for products. They need to be added to the **Private files** section, into a separate folder *exim/backup/images*.

#. Go to **Administration → Files** in the admin panel of your store.

#. Choose the **Private files** section.

#. Go to the *exim/backup/images* directory; if it isn't there, create it.

#. Upload your images into that directory. You can simply drag your images and drop them in the file area.

   Congratulations! Our images are now located in *exim/backup/images*, and we can refer to them in an imported file.

   .. image:: img/file_editor.png
       :align: center
       :alt: CS-Cart file editor supports drag-and-drop. Actions can be performed via buttons at the top or via the context menu.

----------
FTP Client
----------

Users of FTP clients can find the **Private files** directory in *var/files/[number]*. The *[number]* is determined by the ID of the store or vendor. So, if you want to add a private file for the first storefront (or if you have only one storefront), the path will be *var/files/1*. All you need to do is create the *exim/backup/images* subfolders and put the images there.

.. hint::

    **Public files** are located in *images/companies/[number]*. 

========================================
Ways to Specify Images in Imported Files
========================================

There are multiple ways to specify where CS-Cart or Multi-Vendor should look for images.

* **Way 1.** An image URL like ``http://www.example.com/test_image.jpg``.

  The URL doesn’t have to lead to your store—you can upload images to an image hosting service and use those URLs. Then the images will be downloaded to your server from there.

* **Way 2.** An absolute path from the root directory of your server to the image file. For example: ``/path/to/cs-cart/var/files/1/test_image.jpg``.

  .. important::

      Ways 3 and 4 require you to upload the images to the *exim/backup/images* folder in the **Private files** section :ref:`as described above <upload-images-for-import>`.

* **Way 3.** A relative path to the image file from the **Private files** section. For example: ``import/test_image.jpg``.

* **Way 4.** Only the name of the image file: ``test_image.jpg``.

  In this case you’ll need to specify the path to image files in the CS-Cart administration panel: there is a special field called **Images directory**.

  .. note::

      The value of the **Images directory** is ignored for Ways 1 - 3.

  .. image:: img/images_directory.png
      :align: center
      :alt: If you want to specify only image names in the imported files, then use the "Images directory" field for image import.

  .. hint::

      You can also specify alternative text for images. Do it after the path or name of the image file, like ``test_image.jpg#{[de]:ALT TEXT;[en]:ALT TEXT;}``.

===========================
Example of Importing Images
===========================

#. Prepare the images and upload them where necessary. For example, let's upload them to the *exim/backup/images* folder of the **Private files** section, :ref:`as described above <upload-images-for-import>`.

#. Prepare the imported file. Specify the product data in there as described :doc:`in this article </user_guide/manage_products/import_export/fields_format>`. For example, here is how to :ref:`specify multiple images for a product <advanced-image-import>`.

   Below you'll find an example of the content of an imported file. You can copy this extract to an empty *.txt* file, change the file’s extension to *.csv*, and open it in a spreadsheet editor, for example `LibreOffice Calc <https://www.libreoffice.org/discover/calc/>`_.

   ::

     Product code;Language;Product name;Images
     "T1";"en";"1st Test Product";"test_image_1.jpg///test_image_2.jpg"
     "T2";"en";"1nd Test Product";"test_image_3.jpg///test_image_4.jpg"

   Here's what the content of the file means:

   * **Product code**—determines the product to which an image belongs. If you enter a non-existing product code in the imported file, a new product with the specified image will be created.

     .. hint::

         To update images of existing products, you need to know their product codes. Get the codes of existing products in a CSV file by :doc:`exporting those products </user_guide/manage_products/import_export/product_export>`.

   * **Language**—a two-letter language code, for example, ``en``. This is a required field for importing products.

   * **Images**—the names (and sometimes locations) of the product images.

#. :doc:`Import the products </user_guide/manage_products/import_export/advanced_product_import>`. 

   When matching the columns on the **Fields mapping** tab, make sure to match each of the columns in the imported file with a product property in CS-Cart. Most of the columns have the same names as the corresponding product properties; the **images** column must be matched with **Advanced Import: Images**.

   If necessary, you can also switch to the **Settings** tab and tick the **Delete existing additional images** checkbox in the additional settings. That way you'll replace the the old images of the imported products with new ones, rather than adding the new images to existing ones.

   .. note::

       In this example, all images of a product are specified in one column and are separated from each other with the default ``///`` image delimiter. The import preset settings allow you to enter a different delimiter. You can even specify each image in a separate column. In that case all columns with images must be matched with **Advanced Import: Images**.

.. image:: img/import_products_with_images.png
    :align: center
    :alt: Importing images along with products in CS-Cart.
