**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.9.3
**********************************************

==============
Common Changes
==============

* JavaScript ``$.scrollToElm`` core function now reacts to the ``data-ca-scroll-to-elm-delay`` attribute of the ``<body>`` tag; if the attribute was not defined, hardcoded value will used.

* JavaScript ``$.ceAccordion`` plugin now reacts to the ``data-ca-accordion-animate-delay`` attribute of the ``<body>`` tag; if the attribute was not defined, value from ``params`` attribute will used, otherwise hardcoded value will used.

* Microformat ``cm-multiple-radios/cm-multiple-checkboxes`` can now take the value of the validation error message from the attribute of the ``<label>`` tag to which the microformat is applied. If the attribute isn't specified, the default validation error message will be used.

--------------------------------------
Skipping Backup During Add-On Upgrades
--------------------------------------

If you make your add-ons :doc:`upgradeable via the built-in Upgrade center </upgrade/upgrade_addon>` (we highly recommend it), you will be able to let your clients skip the built-in back-up of files and database when upgrading your add-on. This will make the upgrade much faster.

To give store owners the option to skip the back-up process, add the ``backup`` section into the **package.json** scheme of an upgrade package:

.. code-block:: json

    "files":      {...},
    "migrations": [...],
    "languages":  [...],
    "validators": [...],
    "scripts":    {...},
    "backup": {
        "is_skippable": true,
        "skip_by_default": true
    }


* ``is_skippable`` indicates that the back-up process can be skipped. If you set it to *true* or omit this field, then the choice to skip the back-up process will appear during the add-on upgrade.

* ``skip_by_default`` indicates that the choice selected by default is to skip the upgrade. Please note that store owners will have a choice to make the backup anyway.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed after the company shipping identifiers have been received, allowing you to modify them::

     fn_set_hook('shippings_get_company_shipping_ids', $company_id, $shipping_ids);

#. This hook is executed during the calculation of cart content, before the shipping rates are calculated. The hook allows you to modify the cart state::

     fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions);

#. This hook is executed when spitting products in the cart by vendors, after the company ID of a product is detected. The hook allows you to modify the detected product company ID::

     fn_set_hook('direct_payments_cart_service_get_group_products_get_company_id', $products_data, $key, $item, $vendor_id)` - 

-------------
Changed Hooks
-------------

#.

   ::

     // Old:
     fn_set_hook('usergroup_types_get_list', $types);

     // New:
     fn_set_hook('usergroup_types_get_list', $types, $exclude);

#.

  ::

    // Old:
    fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $variant_ids);

    // New:
    fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $variant_ids, $selected_options);

==============
Core Functions
==============

-------------
New Functions
-------------

#. Delete all logs:: 

     fn_cleanup_all_logs($company_id = null)

#. Delete old logs::

     fn_cleanup_old_logs($company_id = null)

#. Generate icons in selected sizes::

     fn_storefront_rest_api_generate_icons($image_data, $sizes)

#. Add icons for the main and additional images of a single product::

     fn_storefront_rest_api_set_product_icons(array $product, array $sizes)

#. Add icons for the main and additional images of multiple products::

     fn_storefront_rest_api_set_products_icons(array $products, array $sizes)

#. Add icons for the image of a single category::

     fn_storefront_rest_api_set_category_icons(array $category, array $sizes)

#. Add icons for the image of multiple categories::

     fn_storefront_rest_api_set_categories_icons(array $categories, array $sizes)

#. Add icons for the image of a single banner::

     fn_storefront_rest_api_set_banner_icons(array $banner, array $sizes)

#. Add icons for the images of multiple banners::

     fn_storefront_rest_api_set_banners_icons(array $banners, array $sizes)

#. Gets the tag for calling the document (the **Code** field on the **Design → Documents** page)::

     \Tygh\Template\Document\Document::getCallTag()

#. Provide the code for including a specific document into an email template::

     \Tygh\Template\Document\Document::getFullCode()

#. Return the templates with the content that matches the specified criteria::

     \Tygh\Template\Mail\Repository::findByContent($criteria)

#. Format a string with the name for tax data by deleting error-prone symbols::

      fn_rus_payments_payanyway_format_item_name($name)

#. Clone product feature values from the ``?:product_features_values`` table::

     \Tygh\Addons\MasterProducts\Product\Manager::cloneProductFeaturesValues($master_product_id, $vendor_product_id)

#. Set the cheapest offer from a vendor as the displayed price of the master product::

     \Tygh\Addons\MasterProducts\Product\Manager::actualizeMasterProductPrice($master_product_id)

-----------------
Changed Functions
-----------------

#.

  ::

    // Old:
    function fn_yandex_metrika_rest_client($type, $url, array $data = [])

    // New:
    function fn_yandex_metrika_rest_client($type, $url, array $data = [], array $headers = [])

#.

  ::

    // Old:
    \Tygh\Enum\UsergroupTypes::getList()

    // New:
    \Tygh\Enum\UsergroupTypes::getList(array $exclude = [])

#.

  ::

    // Old:
    \Tygh\Addons\MasterProducts\Product\Manager::getVendorProductIds($master_product_id)

    // New:
    \Tygh\Addons\MasterProducts\Product\Manager::getVendorProductIds($master_product_id, array $status = null)
