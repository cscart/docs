***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.14.2
***********************************************

.. contents::
    :local:
    :backlinks: none

============
Core Changes
============

-----------
New Classes
-----------

#. ``\Tygh\Enum\CategoryLinkTypes``—contains all category links types.

-----------------
Changed Functions
-----------------

#. ::

       // Old:
       fn_exim_set_company($object_type, $object_key, $object_id, $company_name, &$processed_data = array())
       // New:
       fn_exim_set_company($object_type, $object_key, $object_id, $company_name, array &$processed_data = [], $check_runtime_company_id = true)

#. ::

       // Old:
       fn_import_product_price($product_id, $price, $is_create, $store = '')
       // New:
       fn_import_product_price($product_id, $price, array $object, $is_create, $store = '')

#. ::

       // Old:
       fn_exim_set_product_company($product_id, $company_name, &$processed_data)
       // New:
       fn_exim_set_product_company(array $object, $product_id, $company_name, array &$processed_data)

#. ::

       // Old:
       fn_import_product_descr(array $data, $product_id, $field)
       // New:
       fn_import_product_descr(array $data, $product_id, $field, $is_new = false, array $object = [])

#. ::

       // Old:
       fn_exim_set_product_categories($product_id, $link_type, array $categories_data, $category_delimiter, $store_name = '', array &$processed_data = [], $is_new = false)
       // New:
       fn_exim_set_product_categories($product_id, $link_type, array $categories_data, $category_delimiter, $store_name = '', array &$processed_data = [], $is_new = false, array $object = [])

-------------
New Functions
-------------

#. Check whether value represents true value::

     \Tygh\Enum\YesNo::isTrue($val)

#. Check whether value represents false value::

     \Tygh\Enum\YesNo::isFalse($val)

#. Prepare import data of products that are shared for current storefront::

     fn_ult_import_prepare_products_shared_for_current_storefront(array &$import_data)

#. Filter import fields which are not permitted for shared products::

     fn_ult_import_filter_fields_for_shared_products(array &$object, array $pattern)

#. Get product option variants::

     fn_get_product_option_variants(array $params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

#. Get the statuses of those vendors that should be shown in the store::

     fn_get_available_company_statuses()

#. Check whether product price and name are set. If not, sets them to 0 and empty::

     fn_ult_import_check_product_data(array $primary_object_id, array &$object)

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed  before filtering import data, allows extending array of allowed fields for shared products::

     fn_set_hook('ult_import_filter_fields_for_shared_products', $object, $pattern, $allowed_fields_for_shared_products);

#. This hook is executed  before setting parameters, changes parameters for getting product option variants::

     fn_set_hook('get_product_option_variants_pre', $params, $items_per_page, $lang_code);

#. This hook is executed before SQL query, changes SQL parameters for getting product option variants::

     fn_set_hook('smarty_component_configurable_page_field_before_output', $entity, $tab, $section, $field, $field_config, $params, $content, $template);

#. This hook is executed after all the statuses of the vendors that should be shown in the store have been received. Allows you to add other statuses of the vendors::

     fn_set_hook('smarty_component_configurable_page_section_before_output', $entity, $tab, $section, $section_config, $params, $content, $template);

-------------
Removed Hooks
-------------

#. Use ``get_product_option_variants_pre`` hook instead of::

     fn_set_hook('get_product_options_get_variants', $v_fields, $v_condition, $v_join, $v_sorting, $option_ids, $lang_code).