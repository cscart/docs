**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.9.1
**********************************************

==============
Common Changes
==============

#. Profile types have been added. For now, two types are available:

   * ``U``—user profile (administrator, customer, vendor's administrator)

   * ``S``—seller (vendor) profile

   Profile type selector has been added to the profile fields management page (**Administration → Profile fields**). The sidebar with the selector shows up if there are more that one profile type available.

   The *Vendor information* section on profile fields management page determines what fields will be available on the *Become a seller* form.

#. The support of the ``fax`` field has been removed from the code and templates. For existing installations, the ``fax`` field in the ``cscart_companies`` table will remain unchanged, but new installations won't have it.

#. It is no longer possible to change the user group type after the user group has been created, or to assign the user group to the wrong type of users.

#. A vendor administrator with a user group assigned is no longer treated as *restricted administrator*.

#. A new directive ``show_on_locations`` is now available for the *blocks* schema. That directive allows you to specify the locations the block can be added to. This restriction works when you try to add block trough interface, and prevents the block from showing up if it has already been added.

#. A new setting has been added to the **Products** tab of the **Comments and reviews** add-on. That setting allows posting reviews only to those who have bought the product.

#. The logic of leaving a review is now slightly different as well. A user must now be signed in to leave a review. If the user isn't signed in, an attempt to leave a review will open the sign-in form. Both the sign-in form and new form for leaving a review now are being fetched via AJAX.

#. The interface for closing storefronts has changed:

   * In ``ULTIMATE``, a store can now be closed on the list of stores or on the store editing page. The top menu bar changes its color depending on the status of the currently selected store. In the "All stores" mode, a lock icon will appear; it will look different, depending on what number of storefronts is closed. 

   * In ``MULTIVENDOR``, the color of top menu will change depending on storefront status, and the lock icon will lead to **Settings → General**, where the storefront can be reopened.

#. The **Vendor plans: Commissions by category** add-on has been added. It allows to set order commissions for vendors depending on the categories to which the ordered products belong.

-----
Locks
-----

A component for locks based on `symfony/lock <https://symfony.com/doc/3.4/components/lock.html>`_ has been implemented; it allows to guarantee exclusive access to shared resources.

To create a lock, use ``Tygh::$app['lock.factory']``.

Usage example:

.. code-block:: php

    $lock = Tygh::$app['lock.factory']->createLock('pdf-invoice-generation');

    if ($lock->acquire()) {
       // The resource "pdf-invoice-generation" is locked.
       // You can compute and generate invoice safely here.

       $lock->release();
    }

An exclusive lock was added for cache generation in the block manager, styles and JS compilation to prevent a race condition.

To disable locks, use the ``dummy`` provider:

.. code-block:: php

    $config['lock_backend'] = 'dummy';

--------------------
Deprecated Templates
--------------------

* design/backend/templates/views/orders/components/payments/business_check.tpl

* design/backend/templates/views/orders/components/payments/check.tpl

* design/backend/templates/views/orders/components/payments/fax.tpl

* design/themes/basic/templates/views/orders/components/payments/business_check.tpl

* design/themes/basic/templates/views/orders/components/payments/check.tpl

* design/themes/basic/templates/views/orders/components/payments/fax.tpl

* design/themes/responsive/templates/views/orders/components/payments/business_check.tpl

* design/themes/repsonsive/templates/views/orders/components/payments/check.tpl

* design/themes/responsive/templates/views/orders/components/payments/fax.tpl

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to modify profile fields after fetching them::

     fn_set_hook('get_profile_fields_post', $location, $_auth, $lang_code, $params, $profile_fields, $sections);

#. This hook allows you to modify user group availability for the user after the main check has been performed::

     fn_set_hook('check_usergroup_available_for_user_post', $user_id, $usergroup_id, $result);

#. This hook allows you to modify privileges after fetching them::

     fn_set_hook('get_privileges_post', $usergroup, $privileges);

#. This hook allows to modify the availability of user group privileges after the main check::

     fn_set_hook('check_can_usergroup_have_privileges_post', $usergroup, $result);

#. This hook allows you to extend the available user group types::

     fn_set_hook('usergroup_types_get_list', $types);

#. This hook allows you to extend the mapping of user types to user group types::

     fn_set_hook('usergroup_types_get_map_user_type', $map);

#. This hook is executed right after the user authentication data is obtained from API request headers. The hook allows you to modify the data that is used to identify the user who accesses the API::

     fn_set_hook('api_get_user_data', $this, $auth);

#. This hook allows you to skip clearing the cart when the catalog mode is enabled::

     fn_set_hook('fn_vendor_debt_payout_catalog_mode_pre_add_to_cart', $product_data, $cart, $auth, $update, $can_delete);

#. This hook allows you to influence the process of updating the prices of a product::

     fn_set_hook('update_product_prices', $product_id, $_product_data, $company_id, $skip_price_delete, $table_name, $condition);

-------------
Changed Hooks
-------------

#.

   ::

     // Old:
     fn_set_hook('update_product_amount_pre', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $product_code);

     // New:
     fn_set_hook('update_product_amount_pre', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $product_code, $notify);

#.

  ::

    // Old:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking);

    // New:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify);

#.

  ::

    // Old:
    fn_set_hook('update_product_amount_post', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $new_amount, $product_code);

    // New:
    fn_set_hook('update_product_amount_post', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $new_amount, $product_code, $notify);

----------------
Deprecated Hooks
----------------

``fn_set_hook('profile_fields_areas', $areas);`` is now deprecated; use the *profile_fields* schema instead.

==============
Core Functions
==============

-------------
New Functions
-------------

#. Arrange product categories sequentially in the database::

     fn_sort_product_categories($product_id, array $category_ids)

#. Check if the user group with the provided ID can be assigned to the user::

     fn_check_usergroup_available_for_user($user_id, $usergroup_id)

#. Fetch user group privileges::

     fn_get_usergroup_privileges(array $usergroup)

#. Сheck if the provided user group can have privileges::

     fn_check_can_usergroup_have_privileges(array $usergroup)

#. Fetch all available user groups by user type::

     fn_get_available_usergroups($user_type)

#. Fetch access key for a specific closed storefront::

     fn_ult_get_storefront_access_key($company_id)

#. Fetch the status of the specific storefront::

     fn_ult_get_storefront_status($company_id)

#. Open the specific storefront::

     fn_ult_open_storefront($company_id)

#. Close the specific storefront::

     fn_ult_close_storefront($company_id)

#. Determine whether or not shipping cost must be recalculated at the current checkout step::

     function fn_checkout_step_needs_shipping_calculation($cart, $completed_steps)

#. Determine whether or not user data was changed in the cart::

     function fn_is_cart_user_data_changed(array &$cart, array $auth)

#. Fetch the offer type::

     Tygh\Ym\Offers::getOfferType($product)

#. Fetch the map language::

     fn_rus_pickup_get_map_language()

-----------------
Changed Functions
-----------------

#.

  ::

    // Old:
    function fn_set_store_mode($store_mode, $company_id = null)

    // New:
    function fn_set_store_mode($store_mode, $company_id = null, $clear_cache = true)



#. ``\Tygh\Registry::loadFromCache`` now retrieves a value from cache with a specified key.


#.

  ::

    // Old:
    function fn_update_product_amount($product_id, $amount, $product_options, $sign)

    // New:
    function fn_update_product_amount($product_id, $amount, $product_options, $sign, $notify = true)


#. ``\Tygh\BlockManager\RenderManager::registerBlockCacheIfNeeded`` now returns an array with the caching parameter, if successful.

#. ``fn_get_usergroups`` now returns user groups only of registered types. To register a user group type, use the ``usergroup_types_get_list`` hook.

#. ``fn_define_usergroups`` now defines user groups only of registered types and associated with user type. To associate a user group type with user type, use the ``usergroup_types_get_map_user_type`` hook.

-----------
New Classes
-----------

#. `Tygh\Enum\Addons\Pickup\MapLanguage`—enumeration of map languages.

#. `\Tygh\Addons\AdvancedImport\Readers\Factory::uploadPresetFile(array $preset, $company_id = null)`—handles the preset file upload process.
