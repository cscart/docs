**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.9.2
**********************************************

==============
Common Changes
==============

The **FuturePay** payment method was deprecated.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to perform actions before a call request is processed::

     fn_set_hook('do_call_request', $params, $product_data, $cart, $auth, $company_id);

#. This hook is executed when fetching parent product data when viewing product variation in the administration panel. The hook allows you to change parameters that will be passed to the product data obtaining function::

     fn_set_hook('product_variations_get_parent_product_data', $product, $auth, $lang_code, $parent_product_id, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition, $feature_variants_selected_only);

#. This hook is executed after the "Store closed" page template has been fetched from file. The hook allows you to change the page template and placeholders for the error message::

     fn_set_hook('development_show_stub', $placeholders, $append, $content);

#. This hook is executed before fetching user groups that are displayed on the payments management page. The hook allows you to modify parameters passed to the ``fn_get_usergroups function``::

     fn_set_hook('get_payment_usergroups', $params, $lang_code);


----------------
Deprecated Hooks
----------------

#. ``fn_set_hook('pre_define_usergroups', $user_data, $area)`` is now deprecated.

   Use ``fn_set_hook('define_usergroups_pre', $user_data, $area)`` instead.

#. ``fn_set_hook('post_define_usergroups', $active_usergroups, $user_data, $area)`` is now deprecated.

   Use ``fn_set_hook('define_usergroups_post', $user_data, $area, $active_usergroups)`` instead.


==============
Core Functions
==============

-------------
New Functions
-------------

#. Delete combinations with disabled and/or deleted options::

     fn_delete_outdated_combinations($product_id)

#. Provide parent product data when viewing a product variation in the administration panel::

     fn_product_variations_get_parent_product_data($product, $auth, $lang_code = CART_LANGUAGE)

#. Get user groups that are displayed on the payments management page::

     fn_get_payment_usergroups($params = [], $lang_code = DESCR_SL)

#. Check if all location fields are empty::

     \Tygh\Addons\RusCustomerGeolocation\RusCustomerGeolocation::isLocationEmpty(array $location)

#. Populate missing location fields in ``$cart['user_data']`` with the data from the specified location object::

     fn_lite_checkout_fill_user_data_from_location(array $user_data, RusCustomerGeolocation $manager = null, Location $location = null)

-----------------
Deleted Functions
-----------------

``fn_get_sms_auth_data();``
