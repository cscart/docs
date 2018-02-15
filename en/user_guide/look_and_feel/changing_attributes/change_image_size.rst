***********************************************
How To: Change the Image Size on the Storefront
***********************************************

To change the size of images on the storefront, complete the following steps:

* In the Administration panel, go to **Settings → Thumbnails**.

	* Specify the desired quality value in the **JPEG format quality (0-100)** field.

	* To change the size of the thumbnail images in the product lists on the storefront, edit the values of the **Products list (category, search, etc) thumbnail width** and **Products list (category, search, etc) thumbnail height** fields.

	* To change the size of the thumbnail displayed on the product details page on the storefront, edit the values of the **Product details page thumbnail width** and **Product details page thumbnail height** fields.

	* To change the size of a resized product thumbnail on the product quick view page, edit the values of the **Product quick view thumbnail width** and **Product quick view thumbnail height** fields.

	* To change the size of the thumbnail displayed on the cart page on the storefront, edit the values of the **Product cart page thumbnail width** and **Product cart page thumbnail height** fields.

	* To change the size of the category thumbnail images in the category lists on the storefront, edit the values of the **Categories list thumbnail width** and **Categories list thumbnail height fields**.

	* To change the size of the category thumbnail displayed on the category details page on the storefront, edit the values of the **Category details page thumbnail width** and **Category details page thumbnail height** fields.

	* To change the size of the popup larger images of the category details page on the storefront, edit the values of the **Detailed category image width** and **Detailed category image height fields**.

	.. note::

	    If the values of the mentioned fields are specified, then the original image size will be changed according to the size specified in the field. For example, if the original image size is 200px x 200px and the image width and height are specified as 100px, then the final image size will be 100px x 100px. But if the width/height field is epmty, the image will be displayed according to the original width/height size.

	.. image:: img/change_image_size.png
	    :align: center
	    :alt: Fill in the fields in the Thumbnails settings to specify thumbnail size on various pages.

 
* Click the **Save** button to save the changes.

.. note::

    After changing these settings you will need to clear the thumbnail cache so that the thumbnails would be re-generated automatically. To do it, in the administration panel go to **Administration → Storage** and choose the **Clean up generated thumbnails** action.
