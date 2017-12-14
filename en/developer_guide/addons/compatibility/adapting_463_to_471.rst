**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.7.1
**********************************************

==============
Common Changes
==============

#. ``\Tygh\Backend\Cache\ABackend::__construct`` can now throw a ``DeveloperException`` when the cache handler is initialized before ``company_id`` is initialized.

#. The ``rus_cities`` add-on (*Russian localization — Cities*) now contains all common data about cities used by the SDEK (``rus_sdek``), eDost (``rus_edost``), Delovye Linii (``rus_dellin``), and PEC (``rus_pecom``) add-ons. The code that handles cities was adjusted in all the mentioned add-ons.

#. The mechanism of city name autocompletion in SDEK was changed.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to modify the parameters and the result of the function after it has been executed::

     fn_set_hook('get_static_data_post', $params, $lang_code, $s_data);

#. This hook allows you to modify the input parameters of the function::

     fn_set_hook('delete_static_data_pre', $param_id);

#. This hook allows you to modify the input parameters of the function::

     fn_set_hook('get_static_data_pre', $params, $lang_code);

#. This hook allows you to modify the parameters and the result of the function after it has been executed::

     fn_set_hook('get_static_data_post', $params, $lang_code, $s_data);

#. This hook allows you to modify the input parameters of the function::

     fn_set_hook('delete_static_data_pre', $param_id);

#. This hook allows you to modify the parameters of the function after it has been executed::

     fn_set_hook('delete_static_data_post', $param_id, $delete_ids);

#. This hook allows you to modify the input parameters of the function::

     fn_set_hook('delete_promotions_pre', $promotion_ids);

#. This hook allows you to modify the promotion identifiers after the SQL queries have been executed::

     fn_set_hook('delete_promotions_post', $promotion_ids);

#. This hook allows you to modify the input parameters of the function::

     fn_set_hook('update_promotion_pre', $data, $promotion_id, $lang_code);

#. This hook allows you to modify the parameters and the result of the function after it has been executed::

     fn_set_hook('update_promotion_post', $data, $promotion_id, $lang_code);

#.  This hook allows you to modify the parameters and the result of the function after it has been executed::

     fn_set_hook('get_promotions_post', $params, $items_per_page, $lang_code, $promotions);

#. This hook allows you to modify the pages before they are included into the ``page_tree`` structure::

     fn_set_hook('get_pages_after_sql', $params, $items_per_page, $lang_code, $pages);

#. This hook allows you to modify the selection parameters of companies and the resulting list of companies::

     fn_set_hook('get_companies_post', $params, $auth, $items_per_page, $lang_code, $companies);

#. This hook allows you to modify the data of the product before the initialization of product tabs starts::

     fn_set_hook('init_product_tabs_pre', $product);

#. This hook allows you to modify the data of product tabs before passing that data to the template::

     fn_set_hook('init_product_tabs_post', $product, $tabs);

-------------
Changed Hooks
-------------

#.

  ::

    // old:
    fn_set_hook('get_statuses', $join, $condition, $type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id);

    // new:
    fn_set_hook('get_statuses', $join, $condition, $type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id, $order);

#.

  ::

    // old:
    fn_set_hook('get_statuses_post', $statuses,$join, $condition,$type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id);

   // new:
   fn_set_hook('get_statuses_post', $statuses,$join, $condition,$type, $status_to_select, $additional_statuses, $exclude_parent, $lang_code, $company_id, $order);

#.

  ::

    // old:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data, $rebuild);

    // new:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data, $rebuild, $company_id);

#.

  ::

    // old:
    fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild);

    // new:
    fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id);

#.

  ::

    // old:
    fn_set_hook('get_promotions', $params, $fields, $sortings, $condition, $join);

    // new:
    fn_set_hook('get_promotions', $params, $fields, $sortings, $condition, $join, $group, $lang_code);

-------------------------------------
New Hooks Specific to Russian Version
-------------------------------------

#. This hook prepares the parameters for the SQL query before getting the list of cities::

     fn_set_hook('get_cities_pre', $params, $items_per_page, $lang_code, $fields, $condition, $join);

#. This hook changes the data on the list of cities::

     fn_set_hook('get_cities_post', $params, $items_per_page, $lang_code, $cities);

#. This hook updates the city data::

     fn_set_hook('update_city_post', $city_data, $city_id, $lang_code);


==============
Core Functions
==============

-------------
New Functions
-------------

#. Check the availability of translation for the language variable::

     fn_is_lang_var_exists($value)

#. Gets the translation for the language variable::

     fn_exim_get_field_label($value)

#. Obtain the locale code by the language code::

     \Tygh\Languages\Languages::getLocaleByLanguageCode

#. Round the rating of a discussion::

     fn_discussion_round_rating($rating, $decimals = 2)

#. Initialize product tabs::

     fn_init_product_tabs($product)

-----------------------------------------
New Functions Specific to Russian Version
-----------------------------------------

#. Update the city data for the ``rus_cities`` and ``rus_city_descriptions`` tables::

     function fn_update_city($city_data, $city_id = 0, $lang_code = DESCR_SL)

#. Find the cities by the parameters::

     function fn_rus_cities_find_cities($params, $lang_code = CART_LANGUAGE)

#. Get the list of cities in the correct format::

     function fn_rus_cities_format_to_autocomplete($cities)

#. Get the identifiers of a city by the city's name::

     function fn_rus_cities_get_city_ids($city, $state, $country, $lang_code = CART_LANGUAGE)

#. Add the data of cities to the table::

     function fn_rus_cities_add_cities_in_table($rows)

#. Get the full list of cities::

     function fn_rus_cities_get_all_cities($rows)

#. Get the eDost codes for the cities::

     function fn_rus_edost_get_codes($cities_ids)

#. Add the data of the cities to the ``rus_edost_cities_link`` table::

     function fn_rus_edost_add_cities_in_table($rows)

#. Check if the state code exists::

     function fn_rus_sdek_check_state_code($state, $country = '', $avail_only = true)

#. Get the SDEK data for the specified city::

     function fn_rus_sdek_get_sdek_data($city_id)

#. Add the data of the cities to the ``rus_sdek_cities_link`` table::

     function fn_rus_sdek_add_cities_in_table($rows)

#. Add the data of the cities to the ``rus_pecom_cities_link`` table:: 

     function fn_rus_pecom_add_cities_in_table($rows)

#. Add the data of the cities to the ``rus_dellin_cities_link`` table:: 

     function fn_rus_dellin_add_cities_in_table($rows)

#. Read the data of the cities from a CSV file for adding these data to tables::

     function fn_rus_cities_read_cities_by_chunk($path, $size, $function_callback)

-----------------
Changed Functions
-----------------

#. 

  ::


    // old:
    function fn_paypal_payment_form($processor_data, $token)

    // new:
    function fn_paypal_payment_form($processor_data, $token, $return = false)

#.

  ::

    // old:
    function fn_paypal_get_error($result)

    // new:
    function fn_paypal_get_error($result, $show_notification = true, $return_type = 'text')

#.

  ::

    // old:
    app/controllers/backend/product_filters.php fn_update_product_filter($filter_data, $filter_id, $lang_code = DESCR_SL)

    // new:
    app/functions/fn.catalog.php fn_update_product_filter($filter_data, $filter_id, $lang_code = DESCR_SL)

#.

  ::

    // old:
    function fn_update_product_categories($product_id, $product_data, $rebuild = false);

    // new:
    function fn_update_product_categories($product_id, $product_data, $rebuild = false, $company_id = 0)

#.

  ::

    // old:
    function fn_ult_get_categories(&$params, &$join, &$condition, &$fields, &$group_by, &$sortings)

    // new:
    function fn_ult_get_categories(&$params, &$join, &$condition, &$fields, &$group_by, &$sortings, &$lang_code)


-----------
New Classes
-----------

#. ``\Tygh\Enum\ProductOptionsApplyOrder`` contains the possible ways how options can be applied (either simultaneously, or sequentially).


---------------------------------------------
Removed Functions Specific to Russian Version
---------------------------------------------

#. ``fn_edost_update_table_cities``

#. ``fn_cities_update_table_cities``
