***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.15.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Add-on Changes
==============

-----------------------------
"GDPR Compliance (EU)" Add-on
-----------------------------

In 4.15.1, we introduced a new tool that allows users to refuse optional cookies and view the list of cookies that the store uses.

~~~~~~~~~~~~~~~~
Existing Cookies
~~~~~~~~~~~~~~~~

#. Strictly necessary cookies (cannot be disabled) — ``strictly_necessary``

#. Performance cookies — ``performance``

#. Functional cookies — ``functional``

#. Marketing cookies — ``marketing``

The names that should be used as ``cookie purpose`` in the schema are specified after the "—".

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Extend Cookies with an Add-on
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If your add-on brings new cookies and you want to extend the existing list to comply with the standard, then you need to:

#. Extend the ``gdpr/klaro_config.php`` schema.

   Each schema element has the following structure::

     php
     $schema['services']['cookie_name'] = [
      'purposes' => ['cookie_purpose'],
         'name' => 'cookie_name',
         'translations' => [
             'zz' => [
                 'title' => 'langvar_identifier',
                 'description' => 'langvar_identifier'
             ],
         ],
         'required' => true/false,
         'default' => true/false
     ];
     return $schema;

#. Add the required language variables to the ``scripts.post.tpl``::

    html
    <script>
        (function (_, $) {
            _.tr({
                ...
                "langvar_identifier": '{__("langvar_identifier")|escape:"javascript"}'
                ...
            });
        })(Tygh, Tygh.$);
    </script>

#. Enable the JS script that will set the cookie. There are several ways to do it:

   3.1. ::

          html
          {script src="path/script.js" cookie-name="cookie_name"}

   3.2. ::

          html
          <script
              type="text/plain"
              data-type="application/javascript"
              data-src="src"
              data-name="cookie_name"
          ></script>

============
Core Changes
============

-------------------------------------
Value changes of fields in order info
-------------------------------------

#. The type of tax calculation that is used when creating an order is stored in the order information and is available in the ``calculation_type`` field for each tax in the ``$order_info['taxes']`` array.

#. When calculating tax per unit, taxes excluded from the price are no longer added to the following values:

   * ``$order_info['shipping_cost']``;

   * ``$order_info['products'][$pid]['subtotal']``, where ``$pid`` is the product ID in this array.

-----------
New Classes
-----------

#. ``\Tygh\VendorPayoutDetailsBuilder``—creates array of payout components to simplify additional calculations.

---------------
Removed Classes
---------------

#. ``\Tygh\Addons\VendorRating\Calculator\EvalBackend``

-------------
New Functions
-------------

#. Forms params from request for getting product picker list::

       fn_products_form_product_list_params($request)

#. Updates product subscriber (updates, if product subscriber exist; inserts, if it is not)::

       fn_update_product_subscriber($product_id, $subscriber_data)

#. Deletes subscribers of the product::

       fn_delete_product_subscribers($subscriber_ids)

#. Determines whether to allow user access to the admin API or not::

       fn_check_user_type_admin_area_for_api(array $user_data = [])

#. Prevents usage of deleted and disabled currencies::

       fn_save_currencies_integrity($primary_currency = CART_PRIMARY_CURRENCY)

#. Starts a database transaction::

       db_transaction(Closure $closure, $attempts = 1)

#. Checks if the current user has access to the storefront manage::

       fn_check_permission_storefronts($storefront_id)

#. Adds storefront id to params::

       fn_prepare_storefront_id(array &$params, $field)

#. Gets the default company id for storefront::

       fn_get_default_company_id_for_storefront($storefront_id)

-----------------
Changed Functions
-----------------

#. ::

       // Old:
       fn_get_default_product_options($product_id, $get_all = false, array $product = []);
       // New:
       fn_get_default_product_options($product_id, $get_all = false, array $product = [], $only_avail = false);

#. ::

       // Old:
       fn_is_allowed_options($product);
       // New:
       fn_is_allowed_options($product, $only_avail = false);

#. ::

       // Old:
       fn_checkout_get_shippping_calculation_type(array $cart, $is_location_changed);
       // New:
       fn_checkout_get_shippping_calculation_type(array $cart, $is_location_changed, $is_shipping_method_changed = false).


============
Hook Changes
============

---------
New Hooks
---------


#. This hook is executed before creating common product offer::

       fn_set_hook('master_products_create_vendor_product_pre', $master_product_id, $company_id, $product, $result, $can_create);

#. This hook changes parameters for getting products picker list::

       fn_set_hook('products_form_product_list_params_post',  $request, $params);

#. This hook is executed before placing an order to create an order through API request. Allows you to modify cart data::

       fn_set_hook('api_orders_create_before_place_order', $params, $status, $data, $valid_params, $cart, $customer_auth, $order_placement_action);

#. This hook is executed after new call request creation. Allows you to use data and ID of the created request::

       fn_set_hook('create_call_request_post', $data, $request_id;

#. This hook is executed when an exception was not handled, allowing users to log exceptions::

       fn_set_hook('error_handler_handle_exception', $exception); 

#. This hook is executed before updating user group::

       fn_set_hook('update_usergroup_pre', $usergroup_data, $usergroup_id, $lang_code);

#. This hook is executed before deleting user groups::

       fn_set_hook('delete_usergroups_pre', $usergroup_ids);

#. This hook is executed before returning payout details for updating order::

       fn_set_hook('vendor_payout_details_builder_create_updated_details_post', $this, $updated_order_info, $old_details, $updated_details);

#. This hook is executed after creation all payout components. Allows you to add specific components::

       fn_set_hook('vendor_payout_details_builder_create_details_post', $this, $order_info, $cart, $payout_details);

#. This hook allows you to perform additional actions after add-on installation::

       fn_set_hook('install_addon_post', $addon, $show_notification, $install_demo, $allow_unmanaged);

#. This hook is executed after add-on updating::

       fn_set_hook('update_addon_post', $settings, $storefront_id); 

#. This hook is executed after getting add-on list. Allows you to modify the list::

       fn_set_hook('get_addons_post', $params, $items_per_page, $lang_code, $storefront_id, $company_id, $addons, $addons_counter);

#. This allows you to edit the parameters::

       fn_set_hook('get_carts_pre', $params, $items_per_page, $fields, $condition, $join);

#. This hook prepares the parameters before finding the storefront::

       fn_set_hook('storefront_repository_find_pre', $params, $items_per_page, $fields);

#. This hook is executed after the calculation of the supported image formats allows you to change this list::

       fn_set_hook('image_helper_get_supported_formats_post', $object_type, $supported_formats);

#. This hook is executed after requesting variant selection, allows you to modify its result::

      fn_set_hook('get_current_filters_after_variants_select_query', $params, $filters, $selected_filters, $area, $lang_code, $variant_values, $field_variant_values, $filter_id, $filter, $result, $fields_join, $products_table_base_joins, $fields_where, $products_table_base_conditions);

-------------
Changed Hooks
-------------

#. ::

       // Old:
       fn_set_hook('master_products_reindex_storefront_offers_count', $params, $conditions);
       // New:
       fn_set_hook('master_products_reindex_storefront_offers_count', $params, $conditions, $all_vendors_storefront_ids);

#. ::

       // Old:
       fn_set_hook('master_products_reindex_storefront_min_price', $params, $conditions);
       // New:
       fn_set_hook('master_products_reindex_storefront_min_price', $params, $conditions, $all_vendors_storefront_ids);

#. ::

       // Old:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes);
       // New:
       fn_set_hook('vendor_plans_calculate_commission_for_payout_before', $order_info, $company_data, $payout_data, $total, $shipping_cost, $surcharge_from_total, $surcharge_to_commission, $commission, $taxes, $vendor_taxes).

#. ::

       // Old:
       fn_set_hook('init_currency_post', $params, $area, $primary_currency, $secondary_currency);
       // New:
       fn_set_hook('init_currency_post', $params, $area, $primary_currency, $secondary_currency, $currencies).