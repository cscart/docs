********************************************
Adapt Your Add-Ons & Themes To CS-Cart 4.3.1
********************************************

Settings
********

**The** ``settings.Appearance.admin_products_per_page`` **setting was renamed to** ``settings.Appearance.admin_elements_per_page``.

Now there is a new **Checkout** section in **Settings**. All the related settings were moved to this new section.

Old:

.. code-block:: none

	Registry::get('settings.General.address_position')

New:

.. code-block:: none

	Registry::get('settings.Checkout.address_position')

**The Checkout section settings that were moved from General section:**

*	``disable_anonymous_checkout``
*	``address_position``
*	``agree_terms_conditions``
*	``repay``
*	``allow_create_account_after_order``
*	``configure_sign_in_step``
*	``sign_in_default_action``
*	``display_shipping_step``
*	``display_payment_step``

**Settings** ``secure_auth`` & ``secure_checkout`` **were merged into one new** ``secure_storefront``.

If you use the ``fn_url`` function to generate a link for a customer area, you should replace the protocol in it. Here is an example from the sitemap:

Old:

.. code-block:: none

	$links[] = fn_url($link . '&sl=' . $lang_code, 'C', 'http', $lang_code);

New:

.. code-block:: none

	$links[] = fn_url($link . '&sl=' . $lang_code, 'C', fn_get_storefront_protocol(), $lang_code);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The **Use email as Login** (``email_as_login``) option was removed.

.HTACCESS (caching rules & libs)
********************************

We removed ``gz_handler`` from PHP. Now all output data are compressed by GZIP through htaccess.

Following MIME-type files are compressed:

*	application/javascript application/x-javascript text/javascript application/json
*	application/x-font application/x-font-opentype application/x-font-otf application/x-font-truetype application/x-font-ttf font/opentype font/otf font/ttf application/x-woff application/x-font-woff
*	text/css text/html text/plain

We have added the static data caching for 2 weeks (as per Google page speed recommendation). The following file formats will be cached: gif, png, jpg, jpeg, ico, js, css.

If you upload images, use CS-Cart inner mechanisms (``fn_generate_thumbnail``, for example) to prevent problems with displaying new images. CS-Cart automatically adds a timestamp of an image create allowing a browser to load a new image.

API
***

Several new entities for products were added: Options, Combinations, Exceptions, Usergroups.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The default API version is now 2.0. If you want to use API 1.0, specify it in URL, for example:

*	*http://example.com/api/1.0/stores/*

Backend CACHE Improvements
**************************

New caching system possibilities were added. Now it is possible to use APC cache, XCache.

.. code-block:: none

	$config['cache_backend'] = 'xcache';
	$config['cache_backend'] = 'apc';

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The blocks caching system was modified strongly. Now, practically all blocks are saved in cache, including the *main_content* block. So, if you develop a new block, you might need to disable blocks cache - use the following setting in the **local_conf.php** file:

.. code-block:: none

	$config['tweaks']['disable_block_cache'] = true;

Filters and Product Features
****************************

We have absolutely changed the Filters and Features functionality. If your add-on deals with filters and features, check its functionality.

Pay attention that templates used in version 4.2.x are not compatible with templates used in version 4.3.x.
Make sure to update all templates located in the *templates/blocks/product_filters/* directory.

Upgrade Center
**************

Upgrade Center was fully rebuilt.
Now it works with migrations for changing the database.

Finally, we added the possibility to upgrade your add-ons through the CS-Cart core.
To help you understand the upgrade process, we added the self-upgrading add-on to the package.

CSRF protections
****************

All the data control (remove, update, clone, etc.) now processed with the ``POST`` requests. Not to add forms everywhere, just add the ``cm-post`` class to the *<a href="{"products.delete?product_id=111"}">Delete</a>* type link.

Now it is possible to process not only ``GET`` requests in a console (by default), but ``POST`` requests too. To do it, use the ``-p`` key:

.. code-block:: none

	php admin.php -dispatch=addons.install –addon=seo –p

Languages & Translations
************************

Now it is possible to add only new language variables from the PO package. To do it, to the ``installLanguagePack`` function options add the following flag:

.. code-block:: none

	'install_newly_added' => true

News & Emails add-on
********************

The **News and Emails** add-on was depricated and divided into 2 separate add-ons: **Newsletters** and **Blog**.

Images Verification (Captcha)
*****************************

Functions were changed. The ``use_for`` prefix was removed.

Lets see the **Form builder** add-on as an example:

Old:

.. code-block:: none

	fn_image_verification('use_for_form_builder', $_REQUEST)

New:

.. code-block:: none

	fn_image_verification('form_builder', $_REQUEST)

Also you should add the variant for the new object on Image Verification settings. Use the ``settings_variants_image_verification_use_for`` hook. See the above add-on as an example.

Checkout
********

We have changed the checkout logic. Now it is possible to turn off payment/shipping checkout steps. If your add-on deals with the checkout steps, check its functionality.

The ``$_SESSION['edit_step']`` variable was moved to ``$_SESSION['cart']['edit_step']``. For the backward compatibility it is duplicated in ``$_SESSION['edit_step']`` for 4.3.x.

The hook in the ``{hook name="checkout:edit_link"}`` templates was changed. Earlier, there was one hook used in all four stepts. It was impossible to find out the step from the hook. Now, all 4 hooks have different names:

*	``{hook name="checkout:step_one_edit_link"}``
*	``{hook name="checkout:step_two_edit_link"}``
*	``{hook name="checkout:step_three_edit_link"}``
*	``{hook name="checkout:step_four_edit_link_title"}``

SEO add-on
**********

Here are some changes in the caching system too. There is no more the ``fn_seo_get_cache_name`` function.
The **SeoCache** class was added.

Old:

.. code-block:: none

	$id_path = fn_seo_get_cache_name('path', $object_type, $object_id, $company_id, $lang_code);

New:

.. code-block:: none

	$id_path = SeoCache::get('path', $object_type, $object_id, $company_id, $lang_code);

Frontend Logo
*************

Logos are now related to styles (earlier, they were common for a layout).
You can add ``$logo_data['style_id']`` to the ``fn_update_logo($logo_data, $company_id)`` function, so your logo will be linked to a specific style.

ExIm: Export images
*******************

Parameters of the ``fn_export_image function`` were changed.

Old:

.. code-block:: none

	function fn_export_image($image_id, $object, $backup_path = )

New:

.. code-block:: none

	function fn_export_image($image_id, $object, $backup_path = , $include_alt = true)

The output format was changed too. An image description was added.

Product Options: Exceptions
***************************

For working with exceptions and combinations, the following functions were added:

*	``function fn_update_exception($exception_data, $exception_id = 0)``
*	``function fn_recalculate_exceptions($product_id)``
*	``function fn_delete_exception($exception_id)``
*	``function fn_get_product_exception_data($exception_id)``
*	``function fn_update_option_combination($combination_data, $combination_hash = 0)``
*	``function fn_delete_option_combination($combination_hash)``

Payments
********

Payment functions ``fn_get_payment_templates`` & ``fn_get_payment_processors`` were moved from controller to **fn.cart.php**.
Function ``fn_get_payment_methods`` is depricated.

Image Processing
****************

Imagick support was added for image processing and thumbnail generation.
To use imagick, it is required it to be installed on your server. Define the following parameter in the config file:

.. code-block:: none

	$config['tweaks']['image_resize_lib'] = 'imagick';

Imagick better resizes and compresses images.

Frontend: JavaScript
********************

All scripts are loaded at the bottom of a page (non-blocking downloads). All the inline scripts from templates and blocks are automatically cut and paste after the ``{/scripts}`` tag.

Not to cut the inline script, add the ``data-no-defer`` data attribute to the ``<script>`` tag. In this case the script will stay at the same place where it was declared.

To switch off the JS compilation in one file and leave it without compression, use the **tweak** flag:

.. code-block:: none

	$config['tweaks']['dev_js'] = true;

Useful Tech Info
****************

Smarty was updated from Smarty-3.1.18 to Smarty-3.1.21-dev version.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The **Debugger** mode was improved. It is possible to see in more details the page generation or blocks loading time, etc.

If your add-on works in different modes depending on the ``DEVELOPMENT`` constant, use the ``fn_is_development()`` function instead of ``is_defined('DEVELOPMENT')``:

Old:

.. code-block:: none

	if (!defined('DEVELOPMENT')) {

New:

.. code-block:: none

	if (!fn_is_development()) {

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Anti CSRF was enabled in the config since 4.3.1.

.. code-block:: none

	config.local.php:
	$config['tweaks']['anti_csrf'] = true

Hook Changes
************

Old:

.. code-block:: none

	fn_set_hook('form_cart', $order_info, $cart);

New:

.. code-block:: none

	fn_set_hook('form_cart', $order_info, $cart, $auth);

Old:

.. code-block:: none

	fn_set_hook('before_dispatch');

New:

.. code-block:: none

	fn_set_hook('before_dispatch', $controller, $mode, $action, $dispatch_extra, $area);

Old:

.. code-block:: none

	fn_set_hook('get_page_data_pre', $page_id, $lang_code, $preview);

New:

.. code-block:: none

	fn_set_hook('get_page_data_pre', $page_id, $lang_code, $preview, $area);

Old:

.. code-block:: none

	fn_set_hook('get_page_data', $cache[$page_id], $lang_code);

New:

.. code-block:: none

	fn_set_hook('get_page_data', $page_data, $lang_code, $preview, $area);

Old:

.. code-block:: none

	fn_set_hook('post_add_to_cart', $product_data, $cart, $auth, $update);

New:

.. code-block:: none

	fn_set_hook('post_add_to_cart', $product_data, $cart, $auth, $update, $ids);

Old:

.. code-block:: none

	fn_set_hook('form_cart', $order_info, $cart);

New:

.. code-block:: none

	fn_set_hook('form_cart', $order_info, $cart, $auth);

Old:

.. code-block:: none

	fn_set_hook('allow_place_order', $total, $cart);

New:

.. code-block:: none

	fn_set_hook('allow_place_order', $total, $cart, $parent_order_id);

Old:

.. code-block:: none

	fn_set_hook('get_products_layout_post', $selected_layout, $params);

New:

.. code-block:: none

	fn_set_hook('get_products_layout_post', $selected_view, $params);

Old:

.. code-block:: none

	fn_set_hook('delete_company_pre', $company_id);

New:

.. code-block:: none

	fn_set_hook('delete_company_pre', $company_id, $can_delete);

Old:

.. code-block:: none

	fn_set_hook('before_dispatch');

New:

.. code-block:: none

	fn_set_hook('before_dispatch', $controller, $mode, $action, $dispatch_extra, $area);

Old:

.. code-block:: none

	fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $shared_categories_company_ids, $new_categories_company_ids);

New:

.. code-block:: none

	fn_set_hook('check_and_update_product_sharing', $product_id, $shared, $existing_company_ids, $product_categories_company_ids);

New Hooks
+++++++++

**fn.cart.php**

.. code-block:: none

	fn_set_hook('get_payments', $params, $fields, $join, $order, $condition, $having);
	fn_set_hook('get_payments_post', $params, $payments);
	fn_set_hook('exclude_from_shipping_calculation', $product, $exclude);
	fn_set_hook('get_payment_processors', $lang_code, $fields, $join, $condition);
	fn_set_hook('get_payment_processors_post', $lang_code, $processors);
	fn_set_hook('get_processor_data_by_name', $processor_script, $processor_data);

**fn.catalog.php**

.. code-block:: none

	fn_set_hook('update_exceptions_pre', $product_id, $exceptions);
	fn_set_hook('update_exceptions_post', $product_id, $exceptions);
	fn_set_hook('get_product_exception_data_pre', $product_id);
	fn_set_hook('get_product_exception_data_pre', $product_id, $exception_data);
	fn_set_hook('update_exception_pre', $exception_data, $exception_id);
	fn_set_hook('update_exception_post', $exception_data, $exception_id);
	fn_set_hook('delete_exception_pre', $combination_hash);
	fn_set_hook('load_products_extra_data', $extra_fields, $products, $product_ids, $params, $lang_code);
	fn_set_hook('load_products_extra_data_post', $products, $product_ids, $params, $lang_code);
	fn_set_hook('get_product_details_view_pre', $product_id);
	fn_set_hook('get_product_details_view_post', $result, $product_id);
	fn_set_hook('update_product_categories_pre', $product_id, $product_data);
	fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild);
	fn_set_hook('get_filters_products_count_pre', $params);
	fn_set_hook('get_filters_products_count_before_select_filters', $sf_fields, $sf_join, $condition, $sf_sorting, $params);
	fn_set_hook('get_product_filter_fields', $filters);
	fn_set_hook('get_product_options_inventory_pre', $params, $items_per_page, $lang_code);
	fn_set_hook('get_product_options_inventory_post', $params, $items_per_page, $lang_code, $inventory);
	fn_set_hook('get_product_options_combination_data_post', $combination_hash, $combination);
	fn_set_hook('update_option_combination_pre', $combination_data, $combination_hash);
	fn_set_hook('update_option_combination_pre', $combination_data, $combination_hash, $inventory_amount);
	fn_set_hook('delete_option_combination_pre', $combination_hash);
	fn_set_hook('get_pages_pre', $params, $items_per_page, $lang_code);

**fn.cms.php**

.. code-block:: none

	fn_set_hook('dropdown_object_link_pre', $object_data, $object_type);
	fn_set_hook('dropdown_object_link_post', $object_data, $object_type, $result);
	fn_set_hook('pre_get_page_data', $field_list, $join, $condition, $lang_code);
	fn_set_hook('get_page_data', $page_data, $lang_code, $preview, $area);

**fn.controll.php**

.. code-block:: none

	fn_set_hook('get_storefront_url', $protocol, $company_id, $url);

**fn.fs.php**

.. code-block:: none

	fn_set_hook('check_uploaded_data_pre', $uploaded_data, $filter_by_ext, $result, $processed);
	fn_set_hook('check_uploaded_data_post', $uploaded_data, $filter_by_ext, $result, $processed);

**fn.multivendor.php**

.. code-block:: none

	fn_set_hook('mve_place_order', $order_info, $company_data, $action, $__order_status, $cart, $_data);
	fn_set_hook('mve_companies_get_payouts', $bcf_query, $current_payouts_query, $payouts_query, $join, $total, $condition, $date_condition);

**fn.search.php**

.. code-block:: none

	fn_set_hook('create_products_condition_pre', $params, $lang_code);
	fn_set_hook('create_products_condition_post', $params, $lang_code, $data);
	fn_set_hook('create_orders_condition_pre', $params, $lang_code);
	fn_set_hook('create_orders_condition_post', $params, $lang_code, $data);
	fn_set_hook('create_users_condition_pre', $params, $lang_code);
	fn_set_hook('create_users_condition_post', $params, $lang_code, $data);

**fn.users.php**

.. code-block:: none

	fn_set_hook('get_usergroups_pre', $params, $lang_code);
	fn_set_hook('get_usergroups_post', $usergroups, $params, $lang_code);
	fn_set_hook('update_usergroup', $usergroup_data, $usergroup_id, $create);
	fn_set_hook('delete_usergroups', $usergroup_ids);

Deleted hooks
+++++++++++++

.. code-block:: none

	fn_set_hook('exclude_from_shipping_calculation', $product, $exclude);
	fn_set_hook('get_frontend_css_post', $files);

**Filters & Features Hooks**

.. code-block:: none

	fn_set_hook('get_filters_products_count_pre', $params);
	fn_set_hook('get_filters_products_count_before_select_filters', $sf_fields, $sf_join, $condition, $sf_sorting, $params);
	fn_set_hook('get_filters_products_count_query_params', $values_fields, $join, $sliders_join, $feature_ids, $where, $sliders_where, $filter_vq, $filter_rq);
	fn_set_hook('get_filters_products_count_before_select', $filters, $view_all, $params);
	fn_set_hook('check_selected_filter_pre', $element_id, $feature_type, $request_params, $field_type);
	fn_set_hook('check_selected_filter_post', $result, $element_id, $feature_type, $request_params, $field_type);
	fn_set_hook('delete_range_from_url_pre', $url, $range, $field_type);
	fn_set_hook('delete_range_from_url_post', $result, $url, $range, $field_type);
	fn_set_hook('add_range_to_url_hash_pre', $hash, $range, $field_type);
	fn_set_hook('add_range_to_url_hash_post', $result, $hash, $range, $field_type);
	fn_set_hook('add_filter_ranges_breadcrumbs_pre', $request, $url);
	fn_set_hook('add_filter_ranges_breadcrumbs_post', $request, $url);
	fn_set_hook('get_filter_range_name_pre', $range_type, $range_id);
	fn_set_hook('get_filter_range_name_post', $range_name, $range_type, $range_id);
	fn_set_hook('delete_product_filter', $filter_id, $range_ids);
	fn_set_hook('parse_features_hash_pre', $features_hash, $values);
	fn_set_hook('parse_features_hash_post', $result, $features_hash, $values);
	fn_set_hook('get_product_filter_fields', $filters);

DB Schema
*********

These categories fields were changed in the ``cscart_categories`` table:

*	``selected_layouts`` > ``selected_views``
*	``default_layout`` > ``default_view``
*	``product_details_layout`` > ``product_details_view``

e.g. of the use in code

*	``$category['selected_layouts']`` > ``$category['selected_views']``

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

All the database structure was adapted for working in the strict mode.
``NOT NULL`` argument was removed from fields defenition in **struct.sql** & **Add-ons** configs.

Old:

.. code-block:: none

	`readme` text NOT NULL,

New:

.. code-block:: none

	`readme` text,

Core functions
**************

Changed functions
+++++++++++++++++

Old:

.. code-block:: none

	function fn_get_page_data($page_id, $lang_code = CART_LANGUAGE, $preview = false)

New:

.. code-block:: none

	function fn_get_page_data($page_id, $lang_code = CART_LANGUAGE, $preview = false, $area = AREA)

Old:

.. code-block:: none

	function fn_promotion_apply_discount($promotion_id, $bonus, &$product, $use_base = true)

New:

.. code-block:: none

	function fn_promotion_apply_discount($promotion_id, $bonus, &$product, $use_base = true, &$cart = null, &$cart_products = null)

Old:

.. code-block:: none

	function fn_get_usergroups($type, $lang_code = CART_LANGUAGE)

New:

.. code-block:: none

	function fn_get_usergroups($params = array(), $lang_code = CART_LANGUAGE)

Supported params:

.. code-block:: none

	$params = array(
	'usergroup_id'
	'status'
	'type'
	'with_privileges'
	'include_default'
	)

Old:

.. code-block:: none

	function fn_fill_auth($user_data = array(), $order_ids = array(), $act_as_user = false, $area = AREA)

New:

.. code-block:: none

	function fn_fill_auth($user_data = array(), $original_auth = array(), $act_as_user = false, $area = AREA)

Old:

.. code-block:: none

	fn_allow_place_order(&$cart, $auth = null, $parent_order_id = null)

New:

.. code-block:: none

	fn_allow_place_order(&$cart, $auth = null)

Old:

.. code-block:: none

	fn_create_payment_form($submit_url, $data, $payment_name = '', $exclude_empty_values = true, $method = 'post')

New:

.. code-block:: none

	fn_create_payment_form($submit_url, $data, $payment_name = '', $exclude_empty_values = true, $method = 'post', $parse_url = true, $target = 'form')

Old:

.. code-block:: none

	fn_get_all_brands($object, $block, $scheme)

New:

.. code-block:: none

	fn_get_all_brands()

Old:

.. code-block:: none

	fn_ftp_connect($settings)

New:

.. code-block:: none

	fn_ftp_connect($settings, $show_notifications = false)

Old:

.. code-block:: none

	fn_promotion_apply_discount($promotion_id, $bonus, &$product, $use_base = true)

New:

.. code-block:: none

	fn_promotion_apply_discount($promotion_id, $bonus, &$product, $use_base = true, &$cart = null, &$cart_products = null)

Old:

.. code-block:: none

	fn_ult_dispatch_assign_template($controller, $mode, $area)

New:

.. code-block:: none

	fn_ult_dispatch_assign_template($controller, $mode, $area, &$controllers_cascade)

New functions
+++++++++++++

**fn.addons.php**

.. code-block:: none

	fn_update_addon_settings_originals($addon_id, $name, $type, $value)

**fn.cart.php**

.. code-block:: none

	fn_checkout_update_steps(&$cart, &$auth, $params)
	fn_checkout_place_order(&$cart, &$auth, $params)

**fn.catalog.php**

.. code-block:: none

	fn_filter_redundant_deleting_category_ids(array $category_ids)
	fn_category_exists($category_id, $additional_condition = null)
	fn_update_exceptions($product_id)
	fn_get_product_exception_data($exception_id)
	fn_recalculate_exceptions($product_id)
	fn_update_exception($exception_data, $exception_id = 0)
	fn_load_products_extra_data($products, $params, $lang_code)
	fn_load_extra_data_by_entity_ids($params, $item_ids)
	fn_merge_extra_data_to_entity_list($extra_data, &$entities)
	fn_get_product_details_view($product_id)
	fn_get_filters_products_count($params = array(), $lang_code = CART_LANGUAGE)
	fn_delete_filter_from_hash($features_hash, $filter_id, $variant = '')
	fn_add_filter_to_hash($features_hash, $filter_id, $variant = '')
	fn_generate_filter_hash($filters)
	fn_parse_filters_hash($features_hash = '')
	fn_split_selected_feature_variants($key, $items, $selected_items)
	fn_generate_feature_conditions($key, $items, $selected_items, $join, $condition, $alias_products, $lang_code)
	fn_generate_filter_field_params($params, $filters, $selected_filters)
	fn_get_current_filters($params, $filters, $selected_filters, $area = AREA, $lang_code = CART_LANGUAGE)
	fn_filter_process_ranges($range_values, $filters, $selected_filters)
	fn_get_product_filter_fields()
	fn_get_product_options_inventory($params, $items_per_page = 0, $lang_code = DESCR_SL)
	fn_get_product_options_combination_data($combination_hash, $lang_code = DESCR_SL)
	fn_update_option_combination($combination_data, $combination_hash = 0)
	fn_delete_option_combination($combination_hash)

**fn.cms.php**

.. code-block:: none

	fn_get_page_type_filter($page_type = '')
	fn_is_exclusive_page_type($page_type)
	fn_page_exists($page_id, $additional_condition = null)

**fn.common.php**

.. code-block:: none

	fn_array_value_to_key($array, $key_field)
	fn_get_public_files_path()
	fn_compare_values_by_operator($left_operand, $operator, $right_operand)
	fn_dot_syntax_get($path, $data, $default_value = null)
	fn_array_elements_to_keys($data, $key_field)
	fn_is_development()
	fn_get_secondary_currency()
	fn_change_session_param(&$session, $request, $param_name)

**fn.companies.php**

.. code-block:: none

	fn_blocks_get_vendor_info()

**fn.control.php**

.. code-block:: none

	fn_get_storefront_url($protocol = 'current', $company_id = 0)
	fn_get_request_uri($request_uri)
	fn_check_requested_url($area = AREA)

**fn.fs.php**

	fn_get_ext_mime_types($key = 'ext')

**fn.multivendor.php**

.. code-block:: none

	fn_mve_get_product_filter_fields(&$filters)
	fn_mve_delete_user(&$user_id, &$user_data)
	fn_mve_get_user_type_description(&$type_descr)
	fn_mve_get_user_types(&$types)
	fn_mve_user_need_login(&$types)
	fn_mve_place_order(&$order_id, &$action, &$__order_status, &$cart)
	fn_mve_delete_category_after(&$category_id)
	fn_mve_export_process(&$pattern, &$export_fields, &$options, &$conditions, &$joins, &$table_fields, &$processes)
	fn_mve_get_users(&$params, &$fields, &$sortings, &$condition, &$join)
	fn_mve_import_get_primary_object_id(&$pattern, &$_alt_keys, &$v, &$skip_get_primary_object_id)
	fn_mve_import_check_product_data(&$v, $primary_object_id, &$options, &$processed_data, &$skip_record)
	fn_mve_import_check_object_id(&$primary_object_id, &$processed_data, &$skip_record, $object = 'products')
	fn_import_reset_company_id($import_data)
	fn_mve_import_check_company_id(&$primary_object_id, &$v, &$processed_data, &$skip_record)
	fn_mve_set_admin_notification(&$auth)
	fn_mve_get_companies(&$params, &$fields, &$sortings, &$condition, &$join, &$auth, &$lang_code)
	fn_mve_delete_order(&$order_id)
	fn_mve_get_user_info_before(&$condition, &$user_id, &$user_fields)
	fn_mve_get_product_options(&$fields, &$condition, &$join, &$extra_variant_fields, &$product_ids, &$lang_code)
	fn_mve_get_product_global_options_before_select(&$params, &$fields, &$condition, &$join)
	fn_mve_get_product_option_data_pre(&$option_id, &$product_id, &$fields, &$condition, &$join, &$extra_variant_fields, &$lang_code)
	fn_mve_clone_page_pre(&$page_id, &$data)
	fn_mve_update_page_post(&$page_data, &$page_id, &$lang_code, &$create, &$old_page_data)
	fn_check_addon_permission($addon)
	fn_companies_get_payouts($params = array(), $items_per_page = 0)
	fn_companies_delete_payout($ids)
	fn_companies_add_payout($payment)
	fn_get_company_customers_ids($company_id)
	fn_take_payment_surcharge_from_vendor($products)
	fn_mve_update_page_before(&$page_data, &$page_id, &$lang_code)
	fn_mve_update_product($product_data, $product_id, $lang_code, $create)
	fn_mve_check_permission_manage_profiles(&$result, &$user_type)
	fn_mve_get_request_user_type(&$user_type, &$params, &$area)
	fn_mve_delete_shipping($shipping_id)
	fn_mve_get_products(&$params, &$fields, &$sortings, &$condition, &$join, &$sorting, &$group_by, $lang_code)
	fn_mve_logo_types(&$types, &$for_company)
	fn_get_products_companies($products)
	fn_get_vendor_categories($params)
	fn_mve_dropdown_object_link_post(&$object_data, &$object_type, &$result)
	fn_mve_settings_variants_image_verification_use_for(&$objects)

**fn.promotins.php**

.. code-block:: none

	fn_check_promotion_conditions($promotion_data, &$context_data, &$auth, &$cart_products)
	fn_check_promotion_condition_groups_recursive($conditions_group, $promotion_data, &$context_data, &$auth, &$cart_products)
	fn_get_cart_subtotal_with_discount($cart)
	fn_promotion_check_coupon_code_once_per_customer($coupon_code_check_results, $all_checked_conditions, $promotion_check_result)
	fn_promotion_shippings($this, $cart)

**fn.ultimate.php**

.. code-block:: none

	fn_ult_load_products_extra_data(&$extra_fields, $products, $product_ids, $params, $lang_code)
	fn_ult_load_products_extra_data_post(&$products, $product_ids, $params, $lang_code)
	fn_ult_correct_category_products_sharing($category_id, $category_id_path)
	fn_ult_update_product_categories_pre($product_id, &$product_data)
	fn_get_storefront_url($protocol = 'current', $company_id = 0)

**fn.users.php**

.. code-block:: none

	fn_get_user_usergroup_links($user_id, $criteria = array())
	fn_update_usergroup($usergroup_data, $usergroup_id = 0, $lang_code = DESCR_SL)
	fn_change_usergroup_status($status, $user_id, $usergroup_id, $force_notification = array())
	fn_send_usergroup_status_notification($user_id, $usergroup_ids, $status)
	fn_is_usergroup_exists($usergroup_id)
	fn_delete_usergroups($usergroup_ids)

Deleted functions
+++++++++++++++++

.. code-block:: none

	fn_restore_dump
	fn_correct_features_hash($features_hash)
	fn_get_filters_products_count($params = array())
	fn_check_selected_filter($element_id, $feature_type = '', $request_params = array(), $field_type = '')
	fn_delete_range_from_url($url, $range, $field_type = '')
	fn_add_range_to_url_hash($hash, $range, $field_type = '')
	fn_add_filter_ranges_breadcrumbs($request, $url = '')
	fn_get_filter_range_name($range_type, $range_id)
	fn_parse_features_hash($features_hash = '', $values = true)
	fn_get_product_filter_fields()
	fn_ult_sitemap_get_links(&$links_fields, &$links_tables, &$links_left_join, &$links_condition)

File changes
************

Controller **backend/database.php** was removed.