**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.5.1
**********************************************

==============
Common Changes
==============

* The ``do_not_apply_promotions_on_order_update`` tweak was added to **config.local.php**. This tweak allows to disable reapplication of promotions according to the current rules during order editing.

* The old CAPTCHA was replaced with Google reCAPTCHA entirely. To preserve backward compatibility, all logic related to CAPTCHA was moved from the core to the **Google reCAPTCHA** add-on. Here are the details:

  * The old CAPTCHA will not work in any way.

  * The ``PhpCaptcha`` library was removed.

  * All ``fn_image_verification()`` calls were removed from core controllers. This function was marked as deprecated along with the ``fn_needs_image_verification()`` function. 

    .. important::

        You don't need to change the code of your add-ons—these functions will work perfectly in your code, but they will actually perform validation only when the **Google reCAPTCHA** add-on is enabled and configured properly. 

    When the **Google reCAPTCHA** add-on is not installed or is not configured:

    * ``fn_image_verification()`` will always return *true*.

    * ``fn_needs_image_verification()`` will always return *false*.
    
  * A schema that contains the conditions of how and when to require user request validation was added to *app/addons/recaptcha/schemas/security/antibot_rules.php*.

  * The code of the ``image.captcha`` controller mode was removed.

  * The **Google reCAPTCHA** add-on is now the only anti-bot protection available in CS-Cart/Multi-Vendor by default. To enable anti-bot protection, a store administrator must configure the add-on.

  * The **Settings → Image verification** section was hidden. Its contents now appear in  the **Google reCAPTCHA** add-on settings. The actual database rows are still at the same place.

  * Settings that are responsible for the appearance of old CAPTCHA were hidden.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed at the very beginning of the method, allowing you to modify the passed arguments::

     fn_set_hook('vendor_payouts_update_pre', $this, $data, $payout_id);

#. This hook is executed before payout data is created or updated, allowing you to modify the stored payout data::

     fn_set_hook('vendor_payouts_update', $this, $data, $payout_id, $action);

#. This hook is executed at the end of the method after the payout data is saved, allowing you to modify the returned value::

     fn_set_hook('vendor_payouts_update_post', $this, $data, $payout_id, $action);

#. This hook is executed before the list of payouts is retrieved from the database, allowing you to modify the data passed to the query::

     fn_set_hook('vendor_payouts_get_list', $this, $params, $items_per_page, $fields, $join, $condition, $date_condition, $sorting, $limit);
    
#. This hook is executed before the payout description is retrieved, allowing you to modify the data passed to the translation function::

     fn_set_hook('vendor_payouts_get_description', $payout, $language, $fields, $type); 

#. This hook is executed before income calculation, allowing you to modify the data passed to the function::

     fn_set_hook('vendor_payouts_get_income_pre', $this, $params); 

#. This hook is executed before performing a query to calculate vendor's or admin's income, allowing you to modify data passed to the query::

     fn_set_hook('vendor_payouts_get_income', $this, $params, $fields, $join, $condition, $date_condition);

#. This hook is executed after the income is calculated, allowing you to modify the calculated values::

     fn_set_hook('vendor_payouts_get_income_post', $this, $params, $amount, $amount_carried_forward);

#. This hook is executed before balance calculation, allowing you to modify the data passed to the function::

     fn_set_hook('vendor_payouts_get_balance_pre', $this, $params);

#. This hook is executed during balance calculation, before performing a query to calculate vendor or admin withdrawals used to calculate balance. The hook allows you to modify data passed to the query::

     fn_set_hook('vendor_payouts_get_balance', $this, $params, $fields, $join, $condition, $date_condition);

#. This hook is executed after the balance is calculated, allowing you to modify the calculated values::

     fn_set_hook('vendor_payouts_get_balance_post', $this, $params, $amount, $amount_carried_forward); 

#. This hook is a part of the **RMA** add-on. It is executed before creating a payout based on the return request, allowing you to modify the payout data::

     fn_set_hook('rma_update_details_create_payout', $data, $order_info, $return_info, $payout_data);

#. This hook is a part of the **PayPal Payments** add-on. It is executed before creating a payout based on the return request, allowing you to modify the payout data::

     fn_set_hook('process_paypal_ipn_create_payout', $order_id, $data, $order_info, $payout_data);

#. This hook is executed when placing an order on checkout, after failed orders are deleted::

     fn_set_hook('checkout_place_order_delete_orders', $cart, $auth, $params, $_order_ids); 

-------------
Changed Hooks
-------------

::

  // old:
  fn_set_hook('render_block_register_cache', $block, $cache_key, $block_schema, $cache_this_block, $display_this_block);

  // new:
  fn_set_hook('render_block_register_cache', $block, $cache_prefix, $block_schema, $cache_this_block, $display_this_block);

-------------
Deleted Hooks
-------------

#. ``mve_companies_get_payouts``—please use ``vendor_payouts_get_list``, ``vendor_payouts_get_income`` and ``vendor_payouts_get_balance`` instead.

#. ``get_products_search_conditions_pre``


==============
Core Functions
==============

-------------
New Functions
-------------

#. Check if reapplication of promotions according to the current rules during order editing is enabled::

     fn_promotion_is_recalculation_enabled

#. Update the status of a payout or withdrawal and send a notification to vendor, if required::

     fn_companies_update_payout_status($id, $status, $notify_vendor = true)

#. Clone objects that belong to a company::

     fn_ult_clone_objects($data, $from_company_id, $to_company_id)

#. Check if an object is shared with a company::

     fn_ult_is_shared_object($object_type, $object_id, $company_id)

#. Get schemes of the content for blocks by block types::

     \Tygh\BlockManager\Block::getBlocksContentsByTypes(array $types)

#. Gets data from the ``bm_block_statuses`` table::

     \Tygh\BlockManager\Block::getSnappingBlockStatuses()

-----------
New Classes
-----------

#. ``\Tygh\BlockManager\Block::getBlocksContentsByTypes(array $types)`` gets the schemes of the content for blocks by block types.

#. ``\Tygh\BlockManager\Block::getSnappingBlockStatuses()`` gets data from the ``bm_block_statuses`` table.

#. ``\Tygh\VendorPayouts`` contains mechanisms of creating, updating and representing vendor account balance operations (the **Vendors → Accounting** page).
    
#. ``\Tygh\Enum\VendorPayoutTypes`` is the enumeration of payout types.
    
#. ``\Tygh\Enum\VendorPayoutApprovalStatuses`` is the enumeration of payout approval statuses.

-----------------
Changed Functions
-----------------

#. ``fn_companies_get_payouts()`` is now deprecated. Please use ``VendorPayouts::getList()`` and ``VendorPayouts::getTotals()`` instead.

#. ``fn_get_order_payout_statuses()`` is now deprecated. Please use ``VendorPayouts::getPayoutOrderStatuses()`` instead.
    
#. ``fn_companies_delete_payout()`` is now deprecated. Please use ``VendorPayouts::::delete()`` instead.

#.

  ::

    // old:
    \Tygh\CompanySingleton::getCompanyCondition($db_field)

    // new:
    \Tygh\CompanySingleton::getCompanyCondition($db_field, $add_and = true)

-----------------
Deleted Functions
-----------------

The following methods and their calls have been removed from cache providers:
       
* getHandlers

* saveHandlers

* acquireLock

* releaseLock

Affected classes are located in the ``\Tygh\Backend\Cache`` namespace:

* ABackend

* Apc

* Apcu

* Database

* File

* Redis

* Sqlite

* Xcache
