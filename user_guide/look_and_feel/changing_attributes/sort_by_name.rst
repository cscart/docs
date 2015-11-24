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

If you made changes in a template but they are not displayed, please try cleaning up the template cache. In order to do it, open this link in your browser: *http://www.your_domain.com/admin.php?cc* where *www.your_domain.com* is the address of your store and where *admin.php* is a script file for the Administration panel of your store that was renamed for security reasons.

.. note ::

	Before cleaning the templates cache you should be logged in to the Administration panel of your store.