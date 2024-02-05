***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.18.1
***********************************************

.. contents::
    :backlinks: none
    :local:

============
Core Changes
============

-----------------------------------------
The display of dynamic actions is updated
-----------------------------------------

The **dynamic actions** ``$navigation.dynamic.actions`` display is updated. They are now shown in the right upper corner of the page. From now on, dynamic actions are the preferred interface elements for displaying actions and subpages. Dynamic actions appear as buttons. When there are multiple dynamic actions, some of them are displayed in a drop-down menu.

Dynamic actions requirements:

- Use verbs in buttons titles. For example, use **View feature group** instead of **Feature groups**. 
- The buttons should function both as standalone buttons and as items in the dropdown menu.

Example
-------

**app/addons/my_changes/controllers/backend/products.post.php**
::

    <?php

    use Tygh\ Registry;

    defined('BOOTSTRAP') or die('Access denied');

    if ($mode === 'manage') {
        Registry::set('navigation.dynamic.actions', [
            'my_changes.test_button' => [
                'href' => 'categories.manage',
                'text' => __('my_changes.view_my_changes'),
            ]
        ]);
    }

--------------------------------------------------
The display of the top and central menu is updated
--------------------------------------------------

- The process of extending of the **top menu** ``$navigation.static.top`` has been modified. 

- The **Add-ons** menu ``$navigation.static.top.addons`` is now displayed beneath the **central menu**. The ``subitems`` submenu is now marked as deprecated. Use dynamic actions instead. 

- The **Administration** menu ``$navigation.static.top.administration`` now appears on the new **Settings** (``dispatch=administration.view``) page. Dynamic actions are recommended instead of the ``subitems`` submenu.

- The **Settings** menu ``$navigation.static.top.settings`` now appears only on the **Settings** → **General** (``dispatch=settings.manage``) page. To display the menu items, use the ``setting`` type. 

- The **Design** menu ``$navigation.static.top.design`` is now marked as deprecated. Extend the **Website** menu ``$navigation.static.central.website`` instead.

- Instead of the **top menu**, the **top bar** ``top_bar.tpl`` is now displayed. You can extend it using the ``menu template hook:top_bar_right``.

- The extension of the **central menu** ``$navigation.static.central`` has been updated. The central menu is now located in the sidebar. To expand it, use ``$navigation.static.central``. The ``subitems`` submenu has been deprecated. Use dynamic actions instead. Use short titles of menu items (up to ~15 characters). The descriptions of the menu items are no longer displayed.

-----------------------------------------
The dynamic sections have been deprecated
-----------------------------------------

The **dynamic sections** ``$navigation.dynamic.sections`` have been deprecated. Use dynamic actions instead. Use verbs in the dynamic actions buttons titles. 

--------------------------------------
Some gear buttons have been deprecated
--------------------------------------

- **Gear buttons** in the right upper corner of the page have been deprecated. Use dynamic actions instead. Please note that dynamic actions can appear both as standalone buttons and as items in the dropdown menu.

- **Gear buttons** on the list of objects have been deprecated (for example, on the product list page). To perform the actions, use the `Context menu <https://docs.cs-cart.com/latest/developer_guide/core/context_menu/index.html>`_. The appearance of gear buttons on the list of products and orders has changed (hooks ``products:list_extra_links`` and ``orders:list_extra_links``).

---------------------------------------------------------------------
Search filter extension through product list page template deprecated
---------------------------------------------------------------------

Search filters on the product list are now set using an array. Use the ``products:search_data`` hook to extend it. For example, to add a text field, use hook:


**design/backend/templates/addons/my_changes/hooks/products/search_data.post.tpl**
::

        {$search_filters.my_changes_filter = [
            id => "my_changes_filter",
            type => "input",
            label => __("my_changes_filter"),
            value => $search.my_changes_filter_value,
            placeholder => __("my_changes_filter_placeholder")
        ]}

        {* Export *}
        {$search_filters = $search_filters scope=parent}


Hooks ``products:simple_search``, ``companies:products_advanced_search``, ``products:search_form``, ``products:search_in_orders`` and ``products:advanced_search`` have been deprecated. The ``products:select_search`` hook have been deprecated, use the ``products:sort_by_content`` hook instead. 

The example of connecting search filters can be found in the :ref:`Components updated` section. 

--------------
Saved searches
--------------

To display saved searches, use the ``saved_search`` parameter. An example of saved searches for a product list page:

**design/backend/templates/views/products/manage.tpl**
::
    {
        $search_form_dispatch = $dispatch |
        default: "products.manage"
    } {
        $saved_search = [
            dispatch => $search_form_dispatch,
            view_type => "products"
        ]
        } {
        include file = "common/mainbox.tpl"
            ...
            saved_search = $saved_search
    }

-------------------------------------------------------------------------------
Extending Dashboard analytics blocks through template hooks has been deprecated
-------------------------------------------------------------------------------

Now extending Dashboard analytics blocks should be done through a schema.

Example
-------

**app/addons/my_changes/schemas/dashboard/blocks.post.php**
::
    <?php

    use Tygh\ Enum\ DashboardSections;

    defined('BOOTSTRAP') or die('Access denied');

    $schema[DashboardSections::TERTIARY]['my_changes'] = [
    'id' => 'my_changes',
    'title' => __('my_changes.dashboard.my_changes'),
    'position' => 100,
    'dispatch' => 'products.manage',
    'content_data_function' => 'fn_my_changes_get_dashboard_block_data'
    ];

    return $schema;

**app/addons/my_changes/func.php**
::
    <?php

    if (!defined('BOOTSTRAP')) {
    die('Access denied');
    }

    function fn_my_changes_get_dashboard_block_data() {
        $content_data = [
            'id' => 'my_changes',
            'title' => __('my_changes.dashboard.title'),
            'title_button' => [
                'href' => 'products.manage',
                'name' => __('my_changes.dashboard.title_button'),
            ],
            'number' => 1234,
        ];
    
        return $content_data;
    }

See the full list of available parameters in Template changes. Components updated. 2. Analytics card for Dashboard.

You can expand the content of existing blocks using the ``get_dashboard_XXX`` hooks. Refer to the :ref:`New hooks` section for a list of all hooks and their descriptions.


--------------------------------
Setup wizard has been deprecated
--------------------------------

The **Setup wizard** has been deprecated. Use the **Settings** tab of your add-on instead. `Learn more about scheme 3.0 structure <https://docs.cs-cart.com/latest/developer_guide/addons/scheme/scheme3.0_structure.html>`__.

-----------------------------
Icon display has been updated
-----------------------------

Icons must now be connected through the component ``common/icon.tpl``. Other methods are considered deprecated and will no longer work. The **Font Awesome** icon library has been replaced with CS-Cart's custom icons. Now, instead of an **icon font**, vector SVG icons are used. Connection parameters for icons have changed. Connecting icons using the ``class`` parameter (e.g., ``class="icon-warning-sign"``) is deprecated. It is necessary to use the ``source`` parameter (e.g., ``source="warning_sign"``) with a value in snake_case and without the ``icon-`` prefix. See the example of connecting an icon in :ref:`SVG icons` section.

---------------------------
Page width has been updated
---------------------------

**Top** and **central menu** are now displayed on the left. Consequently, the available width for displaying page content has decreased. Please check the display of your pages on small screens.

The **width restriction for page display** has been removed. Now, the site is displayed across the entire available width of the window. Please check the appearance of interface elements on large screens.

--------------------------------------
Less style variables have been updated
--------------------------------------

Some **Less style variables** (colors, sizes, etc.) have been modified or removed. Now, CS-Cart's Less-variables align with Bootstrap 2's ``css/lib/twitterbootstrap/variables.less``.

Instead of hardcoding values in styles, use Less variables and CSS custom properties from ``css/config.less`` for styles in your add-ons. For obtaining other values, utilize Less functions. For example, functions like ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%)`` create the **Text muted color**. For more information about `lessphp <https://leafo.net/lessphp/docs/>`_ and `Less <https://lesscss.org/>`_, refer to their documentation. For details on removed Less variables, see :ref:`Deleted style variables` section.

-----------------
Deleted functions
-----------------

#. ``fn_master_products_generate_navigation_sections``

============
Hook Changes
============

.. _New hooks:

---------
New hooks
---------

#. ``fn_set_hook('get_dashboard_block_data', $content_data, $this);`` - Executes after getting dashboard block data, allows editing it.

#. ``fn_set_hook('get_dashboard_sales_block_data', $content_data, $this);`` - Executes after filling content information for block with sales statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_products_block_data', $content_data, $this);`` - Executes after filling content information for block with products statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_orders_block_data', $content_data, $this);`` - Executes after filling content information for block with orders statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_orders_by_statuses_block_data', $content_data, $this);`` - Executes after filling content information for block with orders by statuses statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_vendor_balance_block_data', $content_data, $this);`` - Executes after filling content information for block with vendor balance, allows editing it.

#.  ``fn_set_hook('get_dashboard_vendor_with_sales_block_data', $content_data, $this);`` - Executes after filling content information for block with vendor activity statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_stores_block_data', $content_data, $this);`` - Executes after filling content information for block with companies or vendors statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_customers_block_data', $content_data, $this);`` - Executes after filling content information for block with users statistics, allows editing it.

#. ``fn_set_hook('get_dashboard_logs_block_data', $content_data, $this);`` - Executes after filling content information for block with last logs, allows editing it.

================
Template changes
================

------------------
Components updated
------------------

.. _Components updated:

Search filters on the product list page
---------------------------------------

Template: ``views/products/components/products_search_form.tpl``

**Usage**


**design/backend/templates/addons/my_changes/hooks/products/search_data.post.tpl**

::

        {
            $search_filters.my_changes_filter = [
                id => "my_changes_filter",
                type => "input",
                category => "secondary",
                label => __("my_changes_filter"),
                value => $search.my_changes_filter_value,
                placeholder => __("my_changes_filter_placeholder"),
                is_enabled => true,
                is_hidden => false,
                content => "HTML content",
                data => [
                    name_from => "my_changes_filter_from",
                    value_from => $search.my_changes_filter_from,
                    label_from => __("my_changes_filter_from"),
                    name_to => "my_changes_filter_to",
                    value_to => $search.my_changes_filter_to,
                    label_to => __("my_changes_filter_to")
                ],
                nested_data => [
                    my_changes_filter_param => [
                        key => "my_changes_filter_param",
                        label => __("my_changes_filter_param"),
                        value => true,
                        is_checked => ($search.my_changes_filter_param === "YesNo::YES" | enum)
                    ]
                ]
            ]
        }

        {
            * Export *
        } {
            $search_filters = $search_filters scope = parent
        }


where:


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30

    *   -   Parameter
        -   Type
        -   Description or values
    *   -   id
        -   String
        -   Search filter ID.
    *   -   type
        -   Enum
        -   | *Optional*. Search filter type.
            |
            | ``input`` (default)            
            | ``range``
            | ``radio``
            | ``checkbox``
            | ``dropdown``
            | ``popup``
    *   -   category
        -   Enum
        -   | *Optional*. Display the search filter in the **Add filter** menu or display it always.
            |
            | ``secondary`` (default)
            | ``primary``
    *   -   label
        -   String
        -   Search filter label.
    *   -   value
        -   String
        -   *Optional*. Search filter value.
    *   -   placeholder
        -   String
        -   *Optional*. Search filter placeholder.
    *   -   is_enabled
        -   Boolean
        -   A boolean value to determine whether the search filter should be render or not.
    *   -   is_hidden
        -   Boolean
        -   *Optional*. A boolean value to determine whether the search filter should be display or not. In this case, the render will be executed.
    *   -   content
        -   String
        -   *Optional*. HTML content for ``dropdown`` and ``popup`` types, or ``hidden`` props.
    *   -   data
        -   String
        -   *Optional*. Required for the ``range`` type. Use ``name_from``, ``value_from``, ``label_from``, ``name_to``, ``value_to``, or ``label_to`` props for name attribute, value, and label for "From" and "To" fields.
    *   -   nested_data
        -   String
        -   *Optional*. Required for the ``checkbox`` and ``radio`` types. Use ``key``, ``label``, ``value``, and ``is_checked`` props for ID, label, value and checked attribute.



**Examples of extensions**

- input: ``addons/tags/hooks/products/search_data.post.tpl``
- range ``addons/bestsellers/hooks/products/search_data.post.tpl``
- dropdown: ``addons/ebay/hooks/products/search_data.post.tpl``
- popup ``addons/product_variations/hooks/products/search_data.post.tpl``

Example of an array of product search filters: ``views/products/components/products_search_form.tpl``

.. _SVG icons:

SVG icons
---------

Template: ``common/icon.tpl``

**Usage**


::

        {
            include_ext file = "common/icon.tpl"
            source = "warning_sign"
            tone = "warning"
            color = "#f00"
            accessibility_label = "No user"
            show_icon = $is_show_user_require_warning_icon
            class = "user-require-warning"
            id = "user_warning_icon"
            data = [
                "data-ca-param-1" => "value_1",
                "data-ca-param-2" => "value_2"
            ]
        }



where:


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30

    *   -   Parameter
        -   Type
        -   Description or values
    *   -   source
        -   String
        -   The SVG contents (icon name (``warning_sign``), icon path (**addons/my_changes/icons/my_icon.svg**) or ``<svg>...</svg>`` source) to display in the icon (icons should fit in a 20 × 20 pixel viewBox). Use snake_case without the ``icon-`` prefix. The available icons can be viewed in the **design/backend/template/icons/** directory. You can connect custom icons by specifying the icon path.
    *   -   tone
        -   Enum
        -   | *Optional*
            | ``base``           
            | ``muted``
            | ``error``
            | ``interactive``
            | ``info``
            | ``success``
            | ``primary``
            | ``text_warning``
            | ``text_error``
            | ``text_info``
            | ``text_success``
    *   -   accessibility_label
        -   String
        -   *Optional*. Descriptive text to be read to screenreaders.
    *   -   color
        -   String
        -   *Optional*. The ``fill`` attribute of the ``<svg>`` tag for setting a custom icon color.
    *   -   show_icon
        -   Boolean
        -   *Optional*. A boolean value that determines whether the icon should be displayed.
    *   -   class
        -   String
        -   *Optional*. CSS class of an icon.
    *   -   id
        -   String
        -   A unique icon ID. 
    *   -   data
        -   Array
        -   An array of HTML attributes of the icon.
    *   -   render
        -   Enum
        -   | Render the icon as an inline ``<svg>`` tag or connect as an external ``<img src="...">`` image.
            |
            | ``inline`` (default)
            | ``img_data``


**Deprecated parameters**

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30
    
    *   -   Parameter
        -   Type
        -   Description or values
    *   -   title
        -   String
        -   *Deprecated. Optional.* A hint for the icon. Now it is recommended to set the hints at a higher level. For example, to set suggestions for buttons containing such icons. For accessibility, use ``accessibility_label``.
    *   -   icon_text
        -   String
        -   *Deprecated. Optional.* The text for the icon. Use ``accessibility_label`` for accessibility.



**Using custom icons**

To display a custom icon, pass the path of the SVG icon to the ``source`` parameter. For example:

::

  {include_ext file="common/icon.tpl" source="addons/my_changes/icons/my_icon.svg"}


where:

**design/backend/templates/addons/my_changes/icons/my_icon.svg**
::

  <svg viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="m0 0h20v20h-20z"/></svg>


SVG icons should fit in a 20x20 pixel viewBox.

---------
New hooks
---------

#. ``index:head``
#. ``menu:top_bar_right``

-------------
Deleted hooks
-------------

#. ``index:analytics_data``: use ``dashboard/blocks`` schema instead.

----------------
Deprecated hooks
----------------

#.  ``products:action_buttons``: use ``products:search_data`` instead.
#.  ``products:simple_search``: use ``products:search_data`` instead.
#.  ``companies:products_advanced_search``: use ``products:search_data`` instead.
#.  ``products:search_form``: use ``products:search_data`` instead.
#.  ``products:search_in_orders``: use ``products:search_data`` instead.
#.  ``products:advanced_search``: use ``products:search_data`` instead.
#.  ``products:select_search``: use ``products:sort_by_content`` instead.

--------------------------
Deleted template variables
--------------------------

#.  addons ``vendor_data_premoderation``: ``vendor_data_premoderation``
#.  addons ``vendor_plans``: ``plan_usage`` and ``plan_data``

==============
Styles changes
==============

.. _Deleted style variables:

-----------------------
Deleted style variables
-----------------------

#. ``@wide-width``: use ``var(--content-width)`` instead.
#. ``@mainSidebarWidth``: use ``var(--sidebar-width)`` instead.
#. ``@mainSidebarThinWidth``: use ``50px`` instead.
#. ``@headerOffset``: use ``89px`` instead.
#. ``@textMutedColor``: use ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%)`` instead.
#. ``@mainSidebarBackgroundColor``: use ``#333940`` instead.
#. ``@topPanelBackground``: use ``#f9f9f9`` instead.
#. ``@topPanelTextColorLight``: use ``#daedf7`` instead.
#. ``@topPanelDropdownBackgroundColor``: use ``#4c6b8a`` instead.
#. ``@topPanelDropdownTextColor``: use ``#272b31`` instead.
#. ``@brandFontColor``: use ``#fff`` instead.
#. ``@brandFontWeight``: use ``500`` instead.
#. ``@topPanelMenuBackgroundStart``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundEnd``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundHoverStart``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundHoverEnd``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundActiveStart``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundActiveEnd``: use ``@mainColor`` instead.
#. ``@topPanelMenuBackgroundDisabled``: use ``@gray`` instead.
#. ``@topPanelMenuCaret``: use ``#fff`` instead.
#. ``@topPanelMenuDividerLeft``: use ``transparent`` instead.
#. ``@topPanelMenuDividerRight``: use ``transparent`` instead.
#. ``@topPanelBoxShadow``: use ``0 1px 4px rgba(0,0,0,0.1)`` instead.
#. ``@successColor``: use ``@btnSuccessBackground`` instead.
#. ``@mutedBackground``: use ``#f7f7f9`` instead.
#. ``@mutedBorder`` use ``#e1e1e8`` instead.
#. ``@btnPrimaryText``: use ``#daedf7`` instead.
#. ``@btnPrimaryBackgroundBorder``: use ``@btnPrimaryBackground`` instead.
#. ``@successButton``: use ``@btnSuccessBackground`` instead.
#. ``@textButtonColor``: use ``@btnPrimaryBackground`` instead.
#. ``@textButtonCaretColor``: use ``#1010107b`` instead.
#. ``@tabsBackgroundColor``: use ``#f4f3f3`` instead.
#. ``@tabsActiveBackgroundColor``: use ``@mainColor`` instead.
#. ``@extraIconsSprite``: use ``url(../media/images/exicons.png)`` instead.
#. ``@extraIconsSpriteWhite``: use ``url(../media/images/exicons_white.png)`` instead.
#. ``@zIndexPopup``: use ``1500`` instead.

------------------
JavaScript changes
------------------

Deleted triggers
----------------

#. ``ce.notifications_center.mobile_enabled``
#. ``ce.notifications_center.notifications_mark_reload``
