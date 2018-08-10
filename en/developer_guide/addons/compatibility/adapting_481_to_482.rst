**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.8.2
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows to change the console command::

     fn_set_hook('fn_get_console_command', $prefix, $script, $args, $cmd)

#. This hook allows you to modify the parameters of exported products::

     fn_set_hook('data_feeds_export_before_get_products', $datafeed_data, $pattern, $params)

-------------
Changed Hooks
-------------

#.

  ::

    // Old:
    fn_set_hook('clone_product_options_post', $from_product_id, $to_product_id, $from_global_option_id);

    // New:
    fn_set_hook('clone_product_options_post', $from_product_id, $to_product_id, $from_global_option_id, $change_options, $change_variants);

#.

  ::

    // Old:
    fn_set_hook('generate_thumbnail_post', $th_filename, $lazy);

    // New:
    fn_set_hook('generate_thumbnail_post', $th_filename, $lazy, $image_path, $width, $height);

==============
Core Functions
==============

-------------
New Functions
-------------

#. Provides the command for running a controller::

    function fn_get_console_command($prefix, $script, $args)

#. Get statistics for database tables::

    function fn_get_stats_tables()

-----------------
Changed Functions
-----------------

#.

  ::

    // Old:
    function fn_rma_update_order_taxes(&$taxes_list, $item_id, $old_amount, $new_amount, &$current_order)

    // New:
    function fn_rma_update_order_taxes(&$taxes_list, $item_id, $old_amount, $new_amount, &$current_order, $price = null, array $original_order = null)

#.

  ::

    // Old:
    function fn_find_file($prefix, $file)

    // New:
    function fn_find_file($prefix, $file, $company_id = null)

-----------------------------------------
New Functions Specific to Russian Version
-----------------------------------------

Return the stored customer location from the shipping estimation request or from the cart user data::

  fn_rus_cities_get_location_from_session($stored_location = false, $customer_loc = true, $user_data = true)
