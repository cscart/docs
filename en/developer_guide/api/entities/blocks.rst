******
Blocks
******

Blocks represent various components of the storefront, such as menus, banners, search forms, lists of products, and so on. Administrators can position blocks on the :doc:`layouts <../../../user_guide/look_and_feel/layouts/layout_structure>` to change the structure of the store pages.

.. contents::
   :backlinks: none
   :local:

===============
List all Blocks
===============

To list all the blocks created in your store, send a GET request to ``/api/blocks/``. For example::

  GET /api/blocks/

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the details of all the blocks of your store. 

---------------
Response Format
---------------

.. note::

    ``GET /api/blocks/`` always returns all the blocks available. We have omitted some of them in the example response to make it shorter.

::

  [
   {
    "block_id": "38",
    "type": "template",
    "properties": {
          "template": "blocks/static_templates/404.tpl"
    },
    "company_id": "1",
    "lang_code": "en",
    "name": "404"
   },
   {
    "block_id": "17",
    "type": "smarty_block",
    "properties": {
          "template": "blocks/smarty_block.tpl"
    },
    "company_id": "1",
    "lang_code": "en",
    "name": "About us"
   },
   {
    "block_id": "35",
    "type": "template",
    "properties": {
        "template": "blocks/static_templates/auth_info.tpl"
    },
    "company_id": "1",
    "lang_code": "en",
    "name": "Auth information"
   },
   {
    "block_id": "25",
    "type": "blog",
    "properties": {
          "template": "addons/blog/blocks/recent_posts_scroller.tpl",
          "limit": "10",
          "not_scroll_automatically": "Y",
          "speed": "400",
          "pause_delay": "3",
          "item_quantity": "1",
          "outside_navigation": "Y"
    },
    "company_id": "1",
    "lang_code": "en",
    "name": "Blog"
   }
  ]

====================
Get a Specific Block
====================

To get the full list of details of a specific block, send a GET request to ``/api/blocks/<block_id>``. For example::

  GET /api/blocks/38

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the details of the block.

---------------
Response Format
---------------

::

  {
   "block_id": "38",
   "type": "template",
   "properties": {
       "template": "blocks/static_templates/404.tpl"
   },
   "company_id": "1",
   "lang_code": "en",
   "name": "404",
   "content": ""
  }

-------------
Block Details
-------------

The fields below represent various details of a block.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 7 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   block_id
        -   *integer*
        -   A unique identifier of the block.
    *   -   type
        -   *string*
        -   | The type of the block. Here are the possible values: *menu*, *my_account*, *our_brands*, *cart_content*, *breadcrumbs*, *template*, *main*, *html_block*, *smarty_block*, *checkout*, *products*, *categories*, *pages*, *payment_methods*, *shipping_methods*, *currencies*, *languages*, *product_filters*.
            |
            | Multi-Vendor supports additional types: *vendor_information*, *vendor_logo*, *vendor_categories*, *vendor_search*.
            |
            | **Note:** Add-ons may provide more block types, such as *banners*, *blog*, *rss_feed*, and *tags*.
    *   -   properties
        -   *object*
        -   Various properties of the block. They may be different depending on the block's type.
    *   -   company_id
        -   *integer*
        -   ID of the associated storefront (in CS-Cart) or vendor (in Multi-Vendor).
    *   -   lang_code
        -   *string*
        -   A two-letter language code, for example, ``en``.
    *   -   name
        -   *string*
        -   The name of the block.
    *   -   content
        -   *object*
        -   The content of the block. Available for *banners*, *blog*, *categories*, *html_block*, *smarty_block*, *menu*, *pages*, *product_filters*, *rss_feed*, *tags*.

==============
Create a Block
==============

To create an block, send a POST request to ``/api/blocks/``.

Pass the fields with the block details in the HTTP request body in accordance with the passed ``Content-Type``. Required fields are marked with *****:

* **type***—the type of the block.

  Supported types are *menu*, *my_account*, *our_brands*, *cart_content*, *breadcrumbs*, *template*, *main*, *html_block*, *smarty_block*, *checkout*, *products*, *categories*, *pages*, *payment_methods*, *shipping_methods*, *currencies*, *languages*, *product_filters*.

  Multi-Vendor supports additional types: *vendor_information*, *vendor_logo*, *vendor_categories*, *vendor_search*.

  .. note::

      Add-ons may provide more block types, such as *banners*, *blog*, *rss_feed*, and *tags*.

* **name***—the name of the block.

.. note::

    Before you read further, you might want to learn more about block schemas :doc:`in the corresponding section of the documentation <../../core/front-end/blocks/index>`.

* **properties***—the properties of the block. The possible properties depend on the ``type`` and ``template`` of the block. The available templates are determined by the ``type`` of the block as well.

  For example, let’s find the properties of **products_scroller.tpl**. Let’s study the JSON of an existing block first, to see what we’re looking for::

    {
     "block_id": "22",
     "type": "products",
     "properties": {
         "template": "blocks/products/products_scroller.tpl",
         "show_price": "N",
         "enable_quick_view": "N",
         "not_scroll_automatically": "Y",
         "speed": "400",
         "scroll_per_page": "Y",
         "pause_delay": "3",
         "item_quantity": "4",
         "thumbnail_width": "160",
         "hide_add_to_cart_button": "Y",
         "outside_navigation": "Y"
     },
     "company_id": "1",
     "lang_code": "en",
     "name": "Hot deals"
    }

  To find the properties specific to a block type, go to *app/schemas/block_manager/blocks.php*. As the type of our block is **products**, we’re looking for the ``settings`` subarray of the ``products`` array.

  .. hint::

      Irrelevant parts of the code were removed from the example below.

  ::

    ...
    'products' => array(
        'content' => array(...),
            'items' => array(...),
        ),
        'templates' => 'blocks/products',
        'settings' => array(
             'hide_add_to_cart_button' => array(
                'type' => 'checkbox',
                'default_value' => 'Y'
             )
        ),
    ...
    ),
    ...

  According to ``'templates' => 'blocks/products'``, the block of the **products** type can have one of the templates located in the *blocks/products* directory.

  .. hint::

      The full path to the directory is *design/themes/responsive/blocks/products* in this case. If we were looking for the templates of the **Blog** add-on, the path would be *design/themes/responsive/addons/blog/blocks*.

  We have also found one of the properties: ``hide_add_to_cart_button``. Since the JSON returned more properties, the other properties are template-specific.

  Let’s find the properties of our template, **products_scroller.tpl**. They are located in the corresponding ``settings`` array of *app/schemas/block_manager/templates.php*.

  .. hint::

      Irrelevant parts of the code were removed from the example below.

  ::

    ...
    'blocks/products/products_scroller.tpl' => array (
        'settings' => array(
            'show_price' => array (
                'type' => 'checkbox',
                'default_value' => 'Y'
            ),
            'enable_quick_view' => array (
                'type' => 'checkbox',
                'default_value' => 'N'
            ),
            'not_scroll_automatically' => array (
                'type' => 'checkbox',
                'default_value' => 'N'
            ),
            'scroll_per_page' =>  array (
                'type' => 'checkbox',
                'default_value' => 'N'
            ),
            'speed' =>  array (
                'type' => 'input',
                'default_value' => 400
            ),
            'pause_delay' =>  array (
                'type' => 'input',
                'default_value' => 3
            ),
            'item_quantity' =>  array (
                'type' => 'input',
                'default_value' => 5
            ),
            'thumbnail_width' =>  array (
                'type' => 'input',
                'default_value' => 80
            ),
            'outside_navigation' => array (
                'type' => 'checkbox',
                'default_value' => 'Y'
            )
        ),
    ...
    ),
    ...

  We have found the remaining properties of the block that we received in the JSON.

  .. hint::
  
    If you couldn’t find the block type you’re looking for, it may be because the block belongs to an add-on. Go to *app/addons/<add-on_name>/block_manager* to find the template schemas of a specific add-on.

* **content**—the content of the block. You can add content to the blocks of the following types: *banners*, *blog*, *categories*, *html_block*, *smarty_block*, *menu*, *pages*, *product_filters*, *rss_feed*, *tags*.

  The content of the block depends on the ``content`` array of the block type in the block schema. It depends on the ``type`` and ``template`` of the block as well.

  For example, let’s find the content of **categories_dropdown_horizontal.tpl**. Again, we’ll study the JSON beforehand to know what we’re looking for::

    {
     "block_id": "9",
     "type": "categories",
     "properties": {
         "template": "blocks/categories/categories_dropdown_horizontal.tpl",
         "dropdown_second_level_elements": "12",
         "dropdown_third_level_elements": "6"
     },
     "company_id": "1",
     "lang_code": "en",
     "name": "Main menu",
     "content": {
         "items": {
             "filling": "full_tree_cat",
             "parent_category_id": "",
             "sort_by": "position"
         }
     }
    }

  Let’s go to *app/schemas/block_manager/blocks.php* and find the description of the **categories** block type.

  .. hint::

      Irrelevant parts of the code were removed from the example below.

  ::

    ...
    'categories' => array(
        'content' => array(
            'items' => array(
                ...
                'fillings' => array(
                    'manually' => array(...),
                    'newest' => array(...),
                    ...
                    'full_tree_cat' => array(
                        'params' => array(...),
                        'update_params' => array(...),
                        'settings' => array(
                            'parent_category_id' => array(
                                'type' => 'picker',
                                'default_value' => '0',
                                'picker' => 'pickers/categories/picker.tpl',
                                'picker_params' => array(
                                    'multiple' => false,
                                    'use_keys' => 'N',
                                    'default_name' => __('root_level'),
                                ),
                            ),
                            'sort_by' => array(
                                'type' => 'selectbox',
                                'values' => array(
                                    'position' => 'position',
                                    'name' => 'name',
                                ),
                               'default_value' => 'position'
                            ),
                        ),
                    ),
                    'subcategories_tree_cat' => array(
                        'params' => array(
                            'plain' => true,
                            'request' => array(
                                'category_id' => '%CATEGORY_ID%'
                            ),
                        ),
                       'settings' => array(
                            'sort_by' => array(
                                'type' => 'selectbox',
                                'values' => array(
                                    'position' => 'position',
                                    'name' => 'name',
                                ),
                                'default_value' => 'position'
                            ),
                       ),
                    ),
                ),
            )
        ),
        'templates' => 'blocks/categories',
    ...
    ),
    ...
    
  We have found all the parameters available for **categories** in the ``content`` array. The ``full_tree_cat array`` also describes 2 other parameters we’ve seen in the JSON: ``parent_category_id`` and ``sort_by``.

  A template doesn’t necessarily have all the parameters from the ``content`` array. Let’s find the possible content for **categories_dropdown_horizontal.tpl** in *app/schemas/block_manager/templates.php*.

  .. hint::

    Irrelevant parts of the code were removed from the example below.

  ::

    ...
    /* Categories templates */
    'blocks/categories/categories_dropdown_horizontal.tpl' => array (
        'settings' => array (
            'dropdown_second_level_elements' => array (
                'type' => 'input',
                'default_value' => '12'
            ),
            'dropdown_third_level_elements' => array (
                'type' => 'input',
                'default_value' => '6'
            ),
        ),
        'fillings' => array('full_tree_cat', 'dynamic_tree_cat'),
        'params' => array (
            'plain' => false,
            'group_by_level' => true,
            'max_nesting_level' => 3,
            'request' => array (
                'active_category_id' => '%CATEGORY_ID%',
            ),
        )
    ),
    ...

  According to the ``fillings`` array, you can only choose ``full_tree_cat`` or ``dynamic_tree_cat`` when using **categories_dropdown_horizontal.tpl**.

  .. important::

      Since version 4.3.4 ``dynamic_tree_cat`` is marked as deprecated. That’s why it won’t appear on the list of possible templates for a block with the **categories** type in the Administration panel.

  .. note::

      If you couldn’t find the block type you’re looking for, it may be because the block belongs to an add-on. Go to *app/addons/<add-on_name>/block_manager* to find the template schemas of a specific add-on.

The passed parameters fully conform to the ``block_data`` key, which is passed on the block editing page in the Administration panel.

If the block is created successfully, you will receive **HTTP/1.1 201 Created** and the block ID in the response::

  {
   "block_id": 42
  }

If the block couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Example JSON #1:**

::

  {
    "type": "template",
    "name": "Example Template",
    "properties": {
      "template": "blocks/static_templates/my_account_links.tpl"
    }
  }

This request creates a block called *Example Template*, which uses the *My account links* template.

**Example JSON #2:**

::

  {
    "type": "html_block",
    "name": "HTML Block Example",
    "properties": {
      "template": "blocks/html_block.tpl"
    },
    "content": {
      "content": "<p>Example text</p>"
    },
    "lang_code": "en"
  }

This request creates an HTML block called *HTML Block Example*. This block uses the *HTML block* template and can contain HTML code (``<p>Example text</p>`` in our case).

==============
Update a Block
==============

To update an existing block, send the PUT request to ``/api/blocks/<block_id>/``. For example::

  PUT /api/blocks/42

Pass the fields with the block details in the HTTP request body in accordance with the passed ``Content-Type``. The **type** field is required.

**Example JSON:**

::

  {
    "type": "template",
    "name": "Example Template 2",
    "properties": {
      "template": "blocks/static_templates/my_account_links.tpl"
    }
  }

This request sets the type of the block to *Template*, and changes the name and template of the block.

.. note::

    If your store has multiple languages, you can update the name of the block for a specific language. For example, if you include ``"lang_code": "ru"`` in the JSON and change the name of the block, the name will only change for the Russian language.

==============
Delete a Block
==============

To delete a block, send the DELETE request to ``/api/blocks/<block_id>``. For example::

  DELETE /api/blocks/42

This request deletes the specified block. 

**Possible responses:**

* **HTTP/1.1 204 No Content**—the block has been deleted successfully.
* **HTTP/1.1 404 Not Found**—the block doesn’t exist.
