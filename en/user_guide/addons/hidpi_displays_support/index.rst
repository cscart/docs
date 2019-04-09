**********************
HiDPI Displays Support
**********************

The **HiDPI Displays Support** add-on ensures that images look crisp on HiDPI displays (Apple calls them Retina). HiDPI displays have a lot more pixels on a square inch of surface. Initially, HiDPI appeared on smartphones and tablets, but nowadays this technology may be used by laptops and desktop monitors as well.

Without this add-on, an image of the same size may look washed out on a HiDPI display, even despite looking crisp on a normal display.

.. contents::
   :backlinks: none
   :local:

=============
Functionality
=============

#. Adapt the images with changed size for HiDPI displays.

   It's important to keep in mind that CS-Cart and Multi-Vendor rarely show the original images that you upload. For example, when you upload a picture for a product, then the product page and category pages will usually have a resized version of it.

   .. important::

       The **HiDPI Displays Support** add-on automatically generates additional downscaled versions of images for HiDPI screens. These downscaled versions have twice the resolution comparing to the standard downscaled images that the non-HiDPI screens get.

#. Create the downscaled versions of the original images.

   Sometimes CS-Cart and Multi-Vendor do show the original images that you uploaded. By default, this is the case for banners. However, any add-on or theme can display an original image somewhere (for example, an image of a product).

   If you'd like to provide images with different resolutions even in this case, you'll need to do 2 things:

   * Upload the original images with twice the resolution that you'd need on a normal screen. This will guarantee the necessary quality on HiDPI screens.

   * When you upload images, tick the **I'm uploading a HiDPI image** checkbox. This will let CS-Cart know that it needs to decrease the resolution of the uploaded image twice on normal screen.

     .. image:: img/hidpi_checkbox.png
         :align: center
         :alt: Upload images for HiDPI and Retina screens in CS-Cart and Multi-Vendor.

=============
Configuration
=============

The **HiDPI Displays Support** :doc:`is installed and configured just like any other add-on </user_guide/addons/1manage_addons>`. Click the add-on's name to open its settings:

* **Consider all uploaded images HiDPI**—this setting is worth enabling if you upload all the images with HiDPI screens in mind (with twice their normal resolution). Then the  *I'm uploading a HiDPI image** checkbox will be set by default, but you'll be able to remove it when you upload any image.

  .. note::

      For maximum possible support of HiDPI and Retina screens, we recommend enabling this setting, and finding and uploading images with twice the normal resolution.

.. meta::
    :description: How to serve different images for HiDPI and Retina displays in CS-Cart and Multi-Vendor ecommerce CMS?
