**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.6
**********************************************


==============
Common Changes
==============

1. Minimum PHP version requirement bumped from 5.3.0 to 5.3.6

2. PHP7 compatibility implemented

3. PHP7 APCu cache driver added

4. mysqli DB driver now doesn't suppress "mysqli" class constructor errors

5. You may now install and use symlinked addons under the CS-Cart installation directory. This is useful when you develop an add-on in a separate Git repository and create symbolic links of an add-on files under CS-Cart root directory.

6. Debugger panel now supports ``EXPLAIN FORMAT=JSON`` automatically if you use MySQL 5.7

7. Now every block cache parameter can be adjusted via the *app/schemas/block_manager/block_cache_properties.php* schema. Earlier only the ``update_handlers`` parameter could be.

8. Debugger SQL formatting was broken, now it's completely awesome

9. Now the ``Bootstrap::sendHeaders()`` method doesn't send cache-restricting headers ``Expires``, ``Last-Modified``, ``Cache-Control``, and ``Pragma``. Sending those headers is delegated to the ``session_start()`` function call. It will send correct headers based on the ``session.cache_limiter`` PHP configuration parameter value.

10. Service providers pattern was implemented. Provider classes are stored in the ``\Tygh\Providers`` namespace and are registered in the **init.php** file.

11. Database connection class was refactored and was moved to the Application service locator as a component. It's now available as ``Tygh::$app['db']``.

  * ``\Tygh\Database`` now doesn't contain any logic and proxies all method calls to the new ``Tygh::$app['db']`` component.
        
  * All database functions such as ``db_query`` still work like earlier, but they now use the new component internally.

  * All of your code will work as earlier, but the ``\Tygh\Database`` class is now deprecated and will be removed in the next major release (5.x)

  * You may now use several DB connections transparently by adding one more DB connection component to the service locator:

    ::

        // Create a new instance of connection
        Tygh::$app['replication_db'] = new \Tygh\Database\Connection(new \Tygh\Backend\Database\Pdo());

        // Establish connection to the DB
        Tygh::$app['replication_db']->connect('user', 'password', 'localhost', 'db_name', array('table_prefix' => 'cscart_'));

        // Run queries!
        $user = Tygh::$app['replication_db']->getRow('SELECT * FROM ?:users WHERE user_id = ?i', 1);

   * You may want to take a look at the *app/Tygh/Providers/DatabaseProvider.php* and *app/Tygh/Database/Connection.php* files for deeper understanding of internal mechanisms.

12. Debugger and On-site editing templates were moved to the backend area.

13. The "backend" Smarty template resource was implemented, you can fetch or display backend template with an elegant syntax: ``php \Tygh::$app['view']->display('backend:views/debugger/debugger.tpl');``

14. ``\Tygh\Http`` class:
        
  * The ``encoding`` extra parameter was added for cURL requests; it stands for ``CURLOPT_ENCODING`` parameter

  * Multi-requests no more trigger 100% CPU usage

15. Working with sessions and session data is now done through the ``Tygh::$app['session']`` component.

  * Code for writing into a session: 

    ::

      php Tygh::$app['session']['cart'] = array(); Tygh::$app['session']['cart']['products'][] = array();

  * Code for reading from the session: 

    ::

      php $cart = Tygh::$app['session']['cart']; // or by link 
      $cart = & Tygh::$app['session']['cart'];
 
    It works the same way as working with ``$_SESSION`` directly. However, ``Tygh::$app['session']`` belongs to the ``\Tygh\Web\Session`` class. This class replaces the old ``\Tygh\Session`` and allows to address to session data with the array syntax. 

    The old ``Tygh\Session`` class is deprecated. However, it still works, because it proxies all method calls to the ``Tygh::$app['session']``. We have replaced usage of ``\Tygh\Session`` with ``Tygh::$app['session']`` in the core and standard add-ons. 

    .. note::

        The code that uses ``$_SESSION`` directly may not work as intended with full-page caching turned on.

  We also implemented service providers. A service provider is a class, an instance of which registers any components and values in the Application container (otherwise known as Service Locator).

  We added the ``\Tygh\Providers`` namespace and the first provider ``\Tygh\Providers\SessionProvider``, that registers the values of ``session``, ``session.storage`` and ``session.storage.class`` in the container.

16. Code related to creating and unpacking archives was refactored and moved to the ``\Tygh\Tools\Archivers`` namespace. All existing functions now internally use the new code with backward compatibility preserved. Also, the ``Archive_Tar`` class was re-included into CS-Cart and is used as a fallback when the ``PharData`` class fails to perform.

============
Hook Changes
============

---------
New Hooks
---------

1. Perform any actions before actually rendering a block::

    fn_set_hook('render_block_pre', $block, $block_schema, $params, $block_content);

2. Perform any actions after actually rendering a block::

    fn_set_hook('render_block_post', $block, $block_schema, $block_content, $load_block_from_cache, $display_this_block, $params);

3. This hook is executed before saving cache data to persistent storage and clearing expired cache::

    fn_set_hook('registry_save_pre', self::$_changed_tables, self::$_cached_keys);

4. This hook is executed before updating a setting value by setting object ID:: 

    fn_set_hook('settings_update_value_by_id_pre', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);

5. This hook is executed after updating a setting value by setting object ID::

    fn_set_hook('settings_update_value_by_id_post', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);

6. Modify product chain update parameters::

    fn_set_hook('buy_together_update_chain_pre', $item_id, $product_id, $item_data, $auth, $lang_code);

7. Modify product chain update results::

    fn_set_hook('buy_together_update_chain_post', $item_id, $product_id, $item_data, $auth, $lang_code);

8. Modify product chain get parameters::

    fn_set_hook('buy_together_get_chains_pre', $parms, $auth, $lang_code);

9. Change select condition (fields, conditions, joins) before selecting payment method data::

    fn_set_hook('buy_together_get_chains', $params, $auth, $lang_code, $fields, $conditions, $joins);

10. Get a function result along with parameters and query information::

      fn_set_hook('buy_together_get_chains_post', $params, $auth, $lang_code, $chains, $fields, $conditions, $joins);

11. Modify the parameters of the query that fetches discussion posts::

      fn_set_hook('get_discussion_posts_pre', $params, $items_per_page);

12. Modify the query that gets discuission posts::

      fn_set_hook('get_discussion_posts', $params, $items_per_page, $fields, $join, $condition, $order_by, $limit);

13. Modify discussion posts and request parameters::

      fn_set_hook('get_discussion_posts_post', $params, $items_per_page, $posts);

14. Modifiy disscussed object properties::

      fn_set_hook('delete_discussion_pre', $object_id, $object_type);

15. Modify deletion results::

      fn_set_hook('delete_discussion_post', $object_id, $object_type, $is_deleted);

16. Modify deleting discussion post identifier::

      fn_set_hook('discussion_delete_post_pre', $post_id);

17. Modify deleted discussion post identifier::

      fn_set_hook('discussion_delete_post_post', $post_id);

18. Modify title strings for different discussion types::

      fn_set_hook('get_discussion_titles', $discussion_object_titles);

19. The post hook for checking detailed image size ratio::

      fn_set_hook('image_zoom_check_image_post', $file_path, $image_data, $images);

20. This hook is executed before changing add-on status (i.e. before enabling or disabling an add-on)::

      fn_set_hook('update_addon_status_pre', $addon, $status, $show_notification, $on_install, $allow_unmanaged, $old_status, $scheme);

21. This hook is executed after changing add-on status (i.e. after enabling or disabling an add-on)::

      fn_set_hook('update_addon_status_post', $addon, $status, $show_notification, $on_install, $allow_unmanaged, $old_status, $scheme);

22. Filter product data::

      fn_set_hook('filter_product_data', $request, $product_data);

23. Modify top menu forming parameters::

      fn_set_hook('top_menu_form_pre', $top_menu, $level, $active);

24. Modify top menu items::

      fn_set_hook('top_menu_form_post', $top_menu, $level, $active);

25. This hook is executed before saving enabled customization modes to the database::

      fn_set_hook('update_customization_mode', $modes, $enabled_modes, $available_modes);

26. Prepare statuses for particular object type::

      fn_set_hook('get_predefined_statuses', $type, $statuses, $status);

27. Perform actions before changing company status::

      fn_set_hook('change_company_status_pre', $company_id, $status_to, $reason, $status_from, $skip_query, $notify);

28. Perform actions between changing company status and sending an e-mail::

      fn_set_hook('change_company_status_before_mail', $company_id, $status_to, $reason, $status_from, $skip_query, $notify, $company_data, $user_data, $result);

29. Perform actions before creating a company admin::

      fn_set_hook('create_company_admin_pre', $company_data, $fields, $notify);

30. Perform actions before creating a company admin directly::

      fn_set_hook('create_company_admin', $company_data, $fields, $notify, $user);

31. Perform actions after creating a company admin::

      fn_set_hook('create_company_admin_post', $company_data, $fields, $notify, $user);

32. Perform actions before an HTTP response is sent to the client. This is the last place where you can modify the HTTP headers list::

      fn_set_hook('dispatch_before_send_response', $status, $area, $controller, $mode, $action);

33. Perform actions after saving a vendor payout::

      fn_set_hook('mve_place_order_post', $order_id, $action, $order_status, $cart, $auth, $order_info, $company_data, $data, $payout_id);

-------------
Changed Hooks
-------------

1. ``fn_set_hook('top_menu_form', $v, $type, $id, $use_name);`` is now deprecated

2.

  ::

    // old:
    fn_set_hook('render_block_content_after', $block_schema, $block, $block_content);
  
    // new:
    fn_set_hook('render_block_content_after', $block_schema, $block, $block_content, $params, $load_block_from_cache);

3.

  ::
  
    // old:
    fn_set_hook('get_categories_after_sql', $categories, $params);

    // new:
    fn_set_hook('get_categories_after_sql', $categories, $params, $join, $condition, $fields, $group_by, $sortings, $sorting, $limit, $lang_code);

4.

  ::

    // old:
    fn_set_hook('get_category_data', $category_id, $field_list, $join, $lang_code);

    // new:
    fn_set_hook('get_category_data', $category_id, $field_list, $join, $lang_code, $conditions);

5.

  ::

    // old:
    fn_set_hook('clone_product_option_post', $from_product_id, $to_product_id, $from_global_option_id, $v);
  
    // new:
    fn_set_hook('clone_product_option_post', $from_product_id, $to_product_id, $from_global_option_id, $option_data, $change_options, $change_variants);

6.

  ::

    // old: 
    fn_set_hook('delete_status_pre', $status, $type, $can_delete);
  
    // new: 
    fn_set_hook('delete_status_pre', $status, $type, $can_delete, $is_default, $status_id);

7.

  ::

    // old:
    fn_set_hook('delete_status_post', $status, $type, $can_delete);

    // new:
    fn_set_hook('delete_status_post', $status, $type, $can_delete, $is_default, $status_id);

8.

  ::

    // old:
    fn_set_hook('update_image', $image_data, $image_id, $image_type, $images_path, $_data);
  
    // new:
    fn_set_hook('update_image', $image_data, $image_id, $image_type, $images_path, $_data, $mime_type);

9.

  ::

    // old:
    fn_set_hook('mve_place_order', $order_info, $company_data, $action, $__order_status, $cart, $_data);
  
    // new:
    fn_set_hook('mve_place_order', $order_info, $company_data, $action, $order_status, $cart, $data, $payout_id, $auth);

==============
Core Functions
==============

-------------
New Functions
-------------

1. Create logos of missing logo types for a given layout and style::

     \Tygh\Themes\Styles::createMissedLogoTypesForLayout($layout_id, $style_id)

2. Set theme manifest contents::

     \Tygh\Themes\Themes::setManifest($manifest_data)

3. Get theme setting overrides::

      \Tygh\Themes\Themes::getSettingsOverrides($lang_code = CART_LANGUAGE)

4. Override settings values from theme manifest file::

      \Tygh\Themes\Themes::overrideSettings($settings = null, $company_id = null)

5. Create a clone of the theme::

    \Tygh\Themes\Themes::cloneAs($clone_name, $clone_data = array(), $company_id = 0)

6. Return all variables stored in the registry::

    \Tygh\Registry::getAll()

7. Return all cache keys::

    \Tygh\Registry::getAll()

8. ``\Tygh\Tools\Url::setHost()``

9. ``\Tygh\Tools\Url::setQueryString()``

10. ``\Tygh\Tools\Url::getQueryString()``

11. ``\Tygh\Tools\Url::setPath()``

12. ``\Tygh\Tools\Url::getPath()``

13. Check if a given URL is a subpart of the current URL by matching their paths::

      \Tygh\Tools\Url::containsAsSubpath(self $url)

14. Check detailed image size ratio::

      fn_image_zoom_check_image(&$image_data, &$images)

15. Generate SEO Canonical, Prev, Next links::

      fn_seo_get_canonical_links($base_url, $search)
    
16. ``fn_exim_quote(&$value, $quote = "'")``

17. Add the current ``company_id`` as altkey if an object doesn't have store defined. Needed to determine primary object correctly::

      fn_exim_apply_company($pattern, &$alt_keys, &$object, &$skip_get_primary_object_id)

18. Filtration conditions and bonus values::

      fn_promotions_filter_data($data)
    
19. Filtration condition values::

      fn_promotions_filter_conditions($conditions)

20. Filtration bonus values::

      fn_promotions_filter_bonuses($bonuses)

21. Return the path to addon layouts file in specified theme::

      fn_get_addon_layouts_path($addon_name, $theme_name = '[theme]')

22. Store the shipping rates when managing an order::

      fn_store_shipping_rates($order_id = 0, &$cart, $customer_auth)
    
23. Filter product data before saving::

      fn_filter_product_data(&$request, &$product_data)

24. Check permission for changing the store mode::

      fn_check_change_store_mode_permission()
    
25. Get the list of predefined statuses for a particular object type::

      fn_get_predefined_statuses($type, $status = '')

26. Delete a status, its description, and data by the status identifier::

      fn_delete_status_by_id($status_id)

27. Return a status identifier by the status code and type::

      fn_get_status_id($status, $type, $is_default = null)

28. Return the statuses of a specified type::

      fn_get_statuses_by_type($type)

29. Change a company status. Allowed statuses are ``A`` (active) and ``D`` (disabled)::

      fn_change_company_status($company_id, $status_to, $reason = '', &$status_from = '', $skip_query = false, $notify = true)

30. Create a company admin::

      fn_create_company_admin($company_data, $fields = '', $notify = false)

31. Check if the current user has access to the specified permission::

      fn_check_current_user_access($permission)

-----------------
Changed Functions
-----------------

1. ``\Tygh\Themes\Styles::getCustomFonts()`` became public

2. ``\Tygh\Tools\Url::__construct()`` can now be called without any arguments

3. ``fn_exim_set_quotes()`` is now deprecated in favour of ``fn_exim_quote()``

4. ``fn_companies_change_status()`` is now deprecated in favour of ``fn_change_company_status()``

5.

  ::

    // old:
    public static function sanitizeData(array $data, array $rules, array $disabled_actions = array())
  
    // new:
    public static function sanitizeData(array $data, array $rules, array $disabled_actions = array(), &$changed = false)

6.

  ::

    // old:
    function fn_install_addon($addon, $show_notification = true, $install_demo = false)

    // new:
    function fn_install_addon($addon, $show_notification = true, $install_demo = false, $allow_unmanaged = false)

7.

  ::

    // old: 
    function fn_update_addon_status($addon, $status, $show_notification = true, $on_install = false)

    // new:
    function fn_update_addon_status($addon, $status, $show_notification = true, $on_install = false, $allow_unmanaged = false)

8.

  ::

    // old:
    function fn_get_subcategories($category_id = '0', $lang_code = CART_LANGUAGE)
    // backward compatibility preserved

    // new:
    function fn_get_subcategories($category_id = '0', $params = array(), $lang_code = CART_LANGUAGE)

9.

  ::

    // old:
    function fn_delete_status($status, $type)

    // new:
    function fn_delete_status($status, $type, $is_default = false)

10.

   ::

     // old:
     function fn_create_theme_logos_by_layout_id($theme_name, $layout_id = 0, $company_id = null, $for_company = false, $style_id = '')

     // new:
     function fn_create_theme_logos_by_layout_id($theme_name, $layout_id = 0, $company_id = null, $for_company = false, $style_id = '', $whitelist_of_logo_types = null)

11.

   ::

     // old:
     function fn_get_logos($company_id = null, $layout_id = 0, $style_id = '')

     // new:
     function fn_get_logos($company_id = null, $layout_id = null, $style_id = null)

12.

   ::

     // old:
     function fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false)

     // new:
     function fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false)

13.

   ::

     // old: 
     function fn_login_user($user_id = '')

     // new:
     function fn_login_user($user_id = 0, $regenerate_session_id = false)
