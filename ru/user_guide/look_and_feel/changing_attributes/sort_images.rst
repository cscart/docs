*************************************************************
How To: Sort Additional Images in the Order They Are Uploaded
*************************************************************

To sort the additional images in the order they are uploaded, complete the following steps:

1. Go to the *app/functions* directory of your CS-Cart installation.

2. Open the **fn.images.php** file.

3. Find and the following part of code in the file:

::

  $pair_data = db_get_hash_array("SELECT pair_id, image_id, detailed_id, type FROM ?:images_links WHERE object_id = ?i AND object_type = ?s", 'pair_id', $object_id, $object_type);

4. Replace that part of the code with this one:

::

  $pair_data = db_get_hash_array("SELECT pair_id, image_id, detailed_id, type FROM ?:images_links WHERE object_id = ?i AND object_type = ?s ORDER BY pair_id", 'pair_id', $object_id, $object_type);

5. Save the file.

After that the images will be sorted by the ``pair_id``. The pair_id of every next image equals the pair_id of the previous image + 1, so the images will be sorted in the order they are uploaded.

If you have made changes in a template but they are not displayed, please try clearing the template cache. In order to do it, in the administration panel of your store go to **Administration → Storage → Clear cache**.
