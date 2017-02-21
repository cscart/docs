******************************************************************
How To: Configure Quick Search to Look for All the Specified Words
******************************************************************

.. warning::

    This article may no longer be relevant or up to date. Please :doc:`return to the main page of the section. <index>`

By default, the quick search looks for the exact phrase. To make quick search look for all of the words you specify in the search box, complete the following steps:

1. Go to the *app/functions* directory of your CS-Cart installation

2. Open the **fn.catalog.php** file.

3. Find the following part of the code:

::

  $default_params = array (
         'area' => AREA,
         'use_caching' => true,
         'extend' => array('product_name', 'prices', 'categories'),
         'custom_extend' => array(),
         'pname' => '',
         'pshort' => '',
         'pfull' => '',
         'pkeywords' => '',
         'feature' => array(),
         'type' => 'simple',
         'page' => 1,
         'action' => '',
         'filter_variants' => array(),
         'features_hash' => '',
         'limit' => 0,
         'bid' => 0,
         'match' => '',
         'tracking' => array(),
         'get_frontend_urls' => false,
         'items_per_page' => $items_per_page
     );

4. Replace it with the following code:

::
 
  $default_params = array (
         'area' => AREA,
         'use_caching' => true,
         'extend' => array('product_name', 'prices', 'categories'),
         'custom_extend' => array(),
         'pname' => '',
         'pshort' => '',
         'pfull' => '',
         'pkeywords' => '',
         'feature' => array(),
         'type' => 'simple',
         'page' => 1,
         'action' => '',
         'filter_variants' => array(),
         'features_hash' => '',
         'limit' => 0,
         'bid' => 0,
         'match' => 'all',
         'tracking' => array(),
         'get_frontend_urls' => false,
         'items_per_page' => $items_per_page
     );

5. Save the file.

.. note::

    To set the quick search to search by any of these words you specify in the search box, replace ``all`` with ``any`` in the code from Step 4.

