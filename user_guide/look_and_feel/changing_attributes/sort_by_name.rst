*******************************************************
How To: Sort Subcategories by Name on the Category Page
*******************************************************

*   Open the **fn.catalog.php** file located in the *app/functions* directory of your CS-Cart installation.
*   Find the following part of code there:

.. code-block :: none

    $default_params = array (
           'category_id' => 0,
           'visible' => false,
           'current_category_id' => 0,
           'simple' => true,
           'plain' => false,
           'limit' => 0,
           'item_ids' => '',
           'group_by_level' => true,
           'get_images' => false,
           'category_delimiter' => '/'
           'get_frontend_urls' => false,
           'max_nesting_level' => null,    // null means no limitation
    );

and add the following lines:

.. code-block :: none

    'sort_by' => 'name',
    'sort_order' => 'asc',

before

.. code-block :: none

    );

*   Save the file.