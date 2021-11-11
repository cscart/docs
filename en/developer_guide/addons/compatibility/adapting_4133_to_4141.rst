***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.14.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Common Changes
==============

-------------------------
Vendor Panel Configurator
-------------------------

The new add-on simplifies the vendor panel and allows administrators to hide optional fields and tabs on the product editing page. The menu and the product editing page in the vendor panel expand when the administrator installs some add-ons.

Menu Changes
------------

After the add-on installation the menu in the vendor panel becomes simpler. So when the main menu has only one subitem, then in the new vendor panel this item is located at the level with the main menu items. If your add-on needs to introduce new elements to the vendor panel menu, then additional steps are required to ensure its compatibility with the "Vendor Panel Configurator":

#. Extend the ``menu/menu_vendor.php`` schema by duplicating the necessary menu items from the ``menu/menu.php`` schema extension.

#. Add the ``root_title`` property for menu items. Write a text instead of the ``title`` in the property to indicate the name of the menu item as a top-level link.

An existing extension for the admin panel ``menu.post.php``::

  <?php

  $schema['central']['orders']['items']['tracking'] = [
      'position' => 100,
      'title' => __('tracking.manage_track_numbers'),
      'href' => 'track_numbers.manage',
  ];

  return $schema;

A new extension for the vendor panel ``menu_vendor.post.php``::

  <?php

  $schema['central']['orders']['items']['tracking'] = [
      'position' => 100,
      'title' => __('tracking.track_numbers'),
      'href' => 'track_numbers.manage',
  ];

  return $schema;

Changes on the Product Editing Page
-----------------------------------

After the add-on installation, the administrator can hide optional fields and tabs on the product editing page. If your add-on expands product editing page with new tabs and properties, then to ensure its compatibility with the "Vendor Panel Configurator":

#. Extend the ``products/page_configuration.php`` schema with your add-on tabs. Indicate if these tabs can be hidden (``is_optional`` property)::

     <?php

     $schema['stickers'] = [
         'position'    => 2000,
         'title'       => 'stickers.stickers',
         'is_optional' => true,
     ];
   
     return $schema;

#. Extend the ``products/page_configuration.php`` schema with the definition of your product fields. Indicate if these fields can be hidden (``is_optional`` property)::

     <?php

     $schema['detailed']['sections']['information']['fields']['enable_stickers'] = [
         'is_optional' => false,
         'title' => 'stickers.enable_stickers',
         'position' => 100
     ];

     return $schema

#. In the template hook that outputs the field, wrap the field in the ``configurable_page.field`` component and specify the tab, section and field name::

    {component name="configurable_page.field" entity="products" tab="detailed" section="information" field="enable_stickers"}
        <div class="control-group">
            <label for="product_enable_stickers" class="control-label">{__("stickers.enable_stickers")}</label>
            <div class="controls">
                <input type="hidden" name="product_data[enable_stickers]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox"
                       name="product_data[enable_stickers]"
                       id="product_enable_stickers"
                       value="{"YesNo::YES"|enum}"
                       {if $product_data.enable_stickers === "YesNo::YES"|enum}
                           checked="checked"
                       {/if}
                />
            </div>
        </div>
    {/component}

------------
Font Preload
------------

Now there is a native font preload for themes on the storefront. One font that is found in the store's compiled CSS has automatic preload. Preference is given to fonts that are set in the theme editor for the *Body*, *Headings*, and *Links*. If your theme does not support the theme editor, then the font priority matches their order in CSS.

To control prioritization manually, set the ``--preload-priority`` property when defining ``@font-face``. The lower the property value, the higher the font will be in the list of preload fonts. It means that the probability of its preloading will be higher::

  @font-face {
    font-family: 'Open Sans';
    font-style: normal;
    font-weight: normal;
    font-display: swap;
    src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v20/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
    --preload-priority: 1;
  }

-------------------------
Product Group Identifiers
-------------------------

Now, when changing products in the cart, the products rearrange into the product groups by the ``group_key`` (:ref:`see fn_calculate_cart_content <en-cartcontent-4141>`).

The "Suppliers" add-on divides products into groups by vendors and suppliers. If you divide products in a similar manner, then add a unique ``group_key`` to each product group.

For example: ``Shippings::groupProductsList`` and ``fn_suppliers_shippings_group_products_list``.

----------
Font Icons
----------

Now you can add an icon to the page using the ``common/icon.tpl`` template instead of the ``<i>`` tag. We have made these changes to comply with the WCAG 2.0 standard.

============
Core Changes
============

---------------
Changed Classes
---------------

#. ::

       // Old:
       \Tygh\Enum\Addons\Rma\InventoryOperations
       // New:
       \Tygh\Enum\InventoryOperations

-----------
New Classes
-----------

#. ``\Tygh\Enum\FontSubset``—contains unicode range definitions used by Google Fonts in font subsets::

#. ``\Tygh\Enum\FontType``—contains font types::

#. ``\Tygh\Enum\FontWeight``—contains font weights and their numerical representation::

#. ``\Tygh\Enum\OrderStatuses``—contains enumeration of order statuses::

-----------------
Changed Functions
-----------------

#. ::

       // Old:
       fn_merge_styles(array $files, $styles = '', $prepend_prefix = '', array $params = [], $area = AREA)
       // New:
       fn_merge_styles(array $files, $styles = '', $prepend_prefix = '', array $params = [], $area = AREA, $is_local_path_required = false)

#. ::

       // Old:
       fn_exim_find_feature($name, $type, $group_id, $lang_code, $company_id = null)
       // New:
       fn_exim_find_feature($name, $type, $group_id, $lang_code, $company_id = null, $field_name = 'internal_name')

#. ::

       // Old:
       fn_exim_build_option_data($option, $option_id, $variant_ids, $lang_code)
       // New:
       fn_exim_build_option_data(array $option, $option_id, array $variant_ids, $lang_code, $field_name = 'internal_option_name')

#. ::

       // Old:
       \Tygh\Addons\ProductReviews\ProductReview\ImagesService::__construct__construct($max_images_upload = 10)
       // New:
       \Tygh\Addons\ProductReviews\ProductReview\ImagesService::__construct__construct(array $allowed_extensions, $max_images_upload = 10)

#. ::

       // Old:
       function fn_warehouses_get_availability_summary($product_id, $destination_id, $lang_code = CART_LANGUAGE)
       // New:
       function fn_warehouses_get_availability_summary($product_id, $destination_id, $lang_code = CART_LANGUAGE, $amount = null)

-------------
New Functions
-------------

#. Check if a shipping method is available to all new vendors::

     Tygh\Shippings\Shippings::isAvailableForNewVendors(array $shipping)

#. Get IDs of shipping methods which are automatically enabled for new vendors::

     Tygh\Shippings\Shippings::getShippingIdsAvailableForNewVendors($active_only)

#. Get checkout settings::

     fn_get_checkout_settings($cart)

#. Get feature type by its ID::

     fn_get_product_feature_type_by_feature_id($feature_id)

#. Get feature types by theirs IDs::

     fn_get_product_feature_types_by_feature_ids(array $feature_ids)

#. Check whether product notification is enabled::

     fn_check_product_notification_setting($product_id, $user_id, $email)

#. Find option ID by parameters::

     fn_find_product_option_id($product_id, array $option, $global_option, $lang_code, $company_id = null, $field_name = 'internal_option_name')

#. Get vendor search conditions::

     fn_get_default_vendor_notification_search_conditions($with_default_email_field = false)

============
Hook Changes
============

-------------
Changed Hooks
-------------

#. ::

       // Old:
       fn_set_hook('init_user_session_data', $sess_data, $user_id);
       // New:
       fn_set_hook('init_user_session_data', $sess_data, $user_id, $skip_cart_saving);

#. ::

       // Old:
       fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions);
       // New:
       fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions, $this);

---------
New Hooks
---------

#. This hook is executed when generating menu items after the single menu group was processed. Allows you to modify the generated menu:: 

     fn_set_hook('backend_menu_generate_after_process_item', $group, $root, $items);

#. This hook is executed when determining a schema for loading menu. Allows you to modify the menu source::

     fn_set_hook('backend_menu_get_schema_name_post', $menu_schema_name);

#. This hook is executed before configurable page field output. Allows you to modify the field to remove it from page or hide it::

     fn_set_hook('smarty_component_configurable_page_field_before_output', $entity, $tab, $section, $field, $field_config, $params, $content, $template);

#. This hook is executed before configurable page section output. Allows you to modify the section to remove it from page or hide it::

     fn_set_hook('smarty_component_configurable_page_section_before_output', $entity, $tab, $section, $section_config, $params, $content, $template);

#. This hook is executed after font subset used by a language is determined. Allows you to add or remove subsets::

     fn_set_hook('font_subset_get_by_language_usage_post', $language_code, $subsets);

#. This hook is executed when creating styles link right before building a set of preload links. Allows you to add or remove resources to preload::

     fn_set_hook('block_styles_before_build_preload_links', $params, $content, $preloaded_resources);

#. This hook is executed after getting information about shipping methods that should be enabled for the new vendors by default::

     fn_set_hook('get_shipping_ids_available_for_new_vendors_post', $data);

#. This hook is executed before the SQL query::

     fn_set_hook('get_shippings', $fields, $conditions, $lang_code);

#. This hook is executed after determining statuses of the orders that are shipped by the marketplace. Allows you to edit these statuses::

     fn_set_hook('what_companies_orders_are_fulfilled_by_marketplace', $fulfilled_company_ids);

#. This hook is executed after refilling balance, if the amount is less than the minimum order amount. Allows you to change minimum order amount::

     fn_set_hook('get_checkout_settings_post', $cart, $checkout_settings); 

#. This hook is executed when creating vendor payout before changing the order status. Allows you to change vendor payout parameters::

     fn_set_hook('direct_payments_change_order_status_before_create_vendor_payout', $order_info, $payouts); 

--------------------
Deprecated Constants
--------------------

* ``STATUS_INCOMPLETED_ORDER``

* ``STATUS_PARENT_ORDER``

* ``STATUS_BACKORDERED_ORDER``

* ``STATUS_CANCELED_ORDER``