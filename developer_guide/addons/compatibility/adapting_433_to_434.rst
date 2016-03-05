**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.4
**********************************************


==============
Common Changes
==============

1. Smarty template cache files and directories are now created with permissions that are set in the ``DEFAULT_DIR_PERMISSIONS`` and ``DEFAULT_FILE_PERMISSIONS`` constants.

2. There is a new global Smarty template variable—``language_direction``. Its possible values are ``rtl`` and ``ltr``, that mean *Right To Left* and *Left To Right* respectively.

3. The new parameter ``store_prefix`` was added to configuration (``$config['store_prefix']``). If you use APCu/XCache/Redis cache storages, set the ``store_prefix`` parameter to a unique value in **config.local.php** for every store that is installed on the same server.

4. We integrated the **Select2** JavaScript library. You can find an example of its usage when assigning a feature value to a product—the list of the possible variants is now rendered via Select2. You can use the integrated library via the ``cm-object-selector`` JS microformat.

============
Hook Changes
============

---------
New Hooks
---------

1. Prepare parameters for the SQL query that gets banner data:: 

     fn_set_hook('get_banner_data', $banner_id, $lang_code, $fields, $joins, $condition);

2. Post processing of banner data::

     fn_set_hook('get_banner_data_post', $banner_id, $lang_code, $banner);

3. Change parameters for getting tags:: 

     fn_set_hook('get_tags_pre', $params, $items_per_page, $default_params);

4. Get tags::

     fn_set_hook('get_tags', $params, $items_per_page, $fields, $joins, $conditions, $group, $sorting);

5. Change tags::
   
     fn_set_hook('get_tags_post', $params, $items_per_page, $tags);

6. Update converted value::

     fn_set_hook('format_price_by_currency_post', $price, $currency_from, $currency_to, $result);

7. Specify shipping information::

     fn_set_hook('get_shipping_info_post', $shipping_id, $lang_code, $shipping);

8. Change the cart data before forming a cart::

     fn_set_hook('form_cart_pre_fill', $order_id, $cart, $auth, $order_info);

9. Change parameters for getting the list of countries::

     fn_set_hook('get_countries_pre', $params, $items_per_page, $lang_code, $default_params);

10. Prepare parameters for the SQL query that gets the list of countries::

      fn_set_hook('get_countries', $params, $items_per_page, $lang_code, $fields, $joins, $condition, $group, $sorting, $limit);

11. Perform actions after the country list was retrieved::

      fn_set_hook('get_countries_post', $params, $items_per_page, $lang_code, $countries);

12. Change parameters for getting the list of states::

      fn_set_hook('get_states_pre', $params, $items_per_page, $lang_code, $default_params);

13. Prepare the parameters for the SQL query that gets the list the states::

      fn_set_hook('get_states', $params, $items_per_page, $lang_code, $fields, $joins, $condition, $group, $sorting, $limit);

14. Perform actions after the state list was retrieved::

      fn_set_hook('get_states_post', $params, $items_per_page, $lang_code, $states);

15. Prepare the  parameters for the SQL query that gets the destinations::

      fn_set_hook('get_destinations', $lang_code, $fields, $joins, $condition, $group, $sorting, $limit);

16. Perform actions after the destination list was retrieved::

      fn_set_hook('get_destinations_post', $lang_code, $destinations);

17. Prepare the parameters for getting an available destination::

      fn_set_hook('get_available_destination_pre', $location);

18. Post processing of the available destination::

      fn_set_hook('get_available_destination_post', $location, $result, $concur_destinations);

-------------
Changed Hooks
-------------

1.

  ::

    // old:
    fn_set_hook('repay_order', $order_info, $update_order, $payment, $payment_info); 

    // new:
    fn_set_hook('repay_order', $order_info, $update_order, $payment, $payment_info, $change_order_status);

2.

  ::

    // old: 
    fn_set_hook('get_shipping_info', $shipping_id, $fields, $join, $conditions);

    // new:
    fn_set_hook('get_shipping_info', $shipping_id, $fields, $join, $conditions, $lang_code);

 
3. The ``update_option_combination_pre`` hook was duplicated at the beginning and at the end of the ``fn_update_option_combination`` function. The hook at the end of the function was renamed::

     // old:
     fn_set_hook('update_option_combination_pre', $combination_data, $combination_hash, $inventory_amount);

     // new:
     fn_set_hook('update_option_combination_post', $combination_data, $combination_hash, $inventory_amount);

==============
Core Functions
==============

------------- 
New Functions
-------------

1. Calculate the size of empty sides based on original image proportions, if the new image width or height is empty (i.e. null or zero)::

      Tygh\Tools\ImageHelper::originalProportionsFallback($original_width, $original_height, $new_width, $new_height, $high_precision = false)

2. Check if today is the birthday of the current user::

      fn_age_verification_birthday_promo($auth)

3. ``fn_checkout_get_display_steps($profile_fields = array())``

4. Display a notification if no products were found with the current filter combination::

      fn_filters_not_found_notification() 

5. Return a product creation timestamp::

      fn_get_product_timestamp($product_id, $day_begin = false)

6. Execute the code that may throw an exception safely:: 

      fn_catch_exception($func)

7. Check if the language is right-to-left::

      fn_is_rtl_language($lang_code = CART_LANGUAGE)

8. Check if the path to a file/directory is under the base directory::

      fn_is_valid_path($base_dir, $path)

9. Return a file's permissions, a group and an owner in the ``drwxrwxrwx www-data:www-data`` format::

      fn_get_file_perms_info($file_path)

10. Convert the file permissions (the result of calling the ``fileperms()`` function) into  human-readable **"drwxrwxrwx"-like** format::
   
      fn_get_readable_file_perms($perms)

11. Return the server username by its UNIX ID::

      fn_get_server_username_by_id($unix_user_id)

12. Return the server group name by its UNIX ID::

      fn_get_server_group_name_by_id($unix_group_id)

13. Return the name of the user who owns the current PHP process

      fn_get_process_owner_name()

14. Fetch a list of parent directories for the given path. This function doesn't check a real filesystem and operates only using the given path string::

      fn_get_parent_directory_stack($path) 

-----------------
Changed Functions
-----------------

1.

  ::

    // old:
    function fn_required_products_in_cart($auth, $ids)

    // new:
    function fn_required_products_in_cart($cart, $ids)

2.

  ::

    // old:
    function fn_required_products_get_existent($auth, $ids, $look_in_cart = true)

    // new: 
    function fn_required_products_get_existent($auth, $ids, $cart = array())

3.

  ::

    // old:
    function fn_update_product_features_value($product_id, $product_features, $add_new_variant, $lang_code)

    // new:
    function fn_update_product_features_value($product_id, $product_features, $add_new_variant, $lang_code, $params = array())

 
4. Function ``fn_blocks_get_vendor_info()`` was moved from *app/functions/fn.companies.php* to *app/schemas/block_manager/blocks.functions.php*.

--------------------
Deprecated Functions
--------------------

The ``fn_format_price_by_currency($price, $currency_code = CART_SECONDARY_CURRENCY)`` function was **renamed to** ``fn_format_price_by_currency_depricated($price, $currency_code = CART_SECONDARY_CURRENCY)``. 

The ``fn_format_price_by_currency()`` function now has the new API::

   function fn_format_price_by_currency($price, $currency_from = CART_PRIMARY_CURRENCY, $currency_to = CART_SECONDARY_CURRENCY)
   // this function converts the price from one currency to another
