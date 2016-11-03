********************************************************
How To: Configure Quick Search to Search by Product Code
********************************************************

.. warning::

    This article may no longer be relevant or up to date. Please :doc:`return to the main page of the section. <index>`

By default, the quick search feature searches by product name and description. To make quick search look for the product code you specify in the search box, complete the following steps:

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
         'items_per_page' => $items_per_page,
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
         'match' => '',
         'tracking' => array(),
         'get_frontend_urls' => false,
         'items_per_page' => $items_per_page,
         'pcode_from_q' => 'Y'
     );

5. Save the file.
