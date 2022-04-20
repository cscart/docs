***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.14.3
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Common changes
==============

-------------------------------------------
Rules for using the 'strip' smarty modifier
-------------------------------------------

Using ``strip`` can lead to the removal of spaces between attributes when the line breaks inside the tag.

The solution is not to make line breaks inside the attribute when using ``strip``, or add an empty variable at the end of the line with a break, or use ``render_tag_attrs`` instead of ``strip``.

An example of the correct use of ``strip``::

    {strip}
        <div attr1="val1" {""}
            attr2="val2" {""}
            attr3="val3">
            Text
        </div>
    {/strip}

============
Core changes
============

-----------
New classes
-----------

#. ``\Tygh\Enum\ShipmentStatuses``—contains default statuses of shipments.

-----------------
Changed functions
-----------------

#. ::

       // Old:
       fn_send_product_notifications($product_id)
       // New:
       fn_send_product_notifications($product_id, $params = [])
    
#. ::

       // Old:
       function fn_get_product_subscribers($params, $items_per_page = 0)
       // New:
       function fn_get_product_subscribers($params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

#. ::

       // Old:
       \Tygh\Addons\CommerceML\Commands\CreateImportCommand::create(array $xml_file_paths, array $auth, $import_key, $import_type)
       // New:
       \Tygh\Addons\CommerceML\Commands\CreateImportCommand::create(array $xml_file_paths, array $auth, $import_key, $import_type, $company_id)

-------------
New functions
-------------

#. Update а product subscriber (updates, if the product subscriber exists and inserts, if it is not)::

       fn_update_product_subscriber($product_id, $subscriber_data)

#. Delete subscribers of the product::

       fn_delete_product_subscribers($subscriber_ids)

#. Determine whether to allow admin API access to the user or not::

       fn_check_user_type_admin_area_for_api(array $user_data = [])

============
Hook changes
============

-------------
Changed hooks
-------------

#. ::

       // Old:
       fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields);
       // New:
       fn_set_hook('send_product_notifications_before_fetch_subscriptions', $product_id, $fields, $params, $conditions);

#. ::

       // Old:
       fn_set_hook('get_product_subscribers_pre', $params);
       // New:
       fn_set_hook('get_product_subscribers_pre', $params, $items_per_page, $lang_code);

---------
New hooks
---------

#. This hook changes SQL params for the subscribers search::

       fn_set_hook('get_product_subscribers', $params, $joins, $conditions, $fields, $lang_code);

#. This hook is executed before updating the product subscriber::

       fn_set_hook('update_product_subscriber_pre', $product_id, $subscriber_data);

#. This hook is executed within the ``pre_place_order`` hook handler after the marketplace shipping method is set to the product group. Allows you to manage shipping data for orders with marketplace fulfillment::

       fn_set_hook('order_fulfillment_set_marketplace_shipping_to_product_group', array $cart, $group_key, $marketplace_group_key, array $chosen_shipping_data);

#. This hook allows you to change links information before their creation::

       fn_set_hook('product_bundle_service_update_links', $bundle_id, $product_data, $data);

#. This hook is executed after the total quantity of products in the cart is calculated. Allows you to modify the calculated amount::

       fn_set_hook('get_products_amount_post', $cart, $cart_products, $type, $amount);

#. This hook is executed before the rate value is overwritten by the formatted one. Allows you to change the value::

       fn_set_hook('normalized_shipping_rate_reformat_value', $normalized_data, $rate, $rate_type, $formatted_value);

#. This hook is executed after updating the data in ``product_descriptions``::

       fn_set_hook('import_product_descr', $data, $product_id, $prod_company_id, $field, $is_new, $object);

#. This hook is executed before the master product quantity is actualized::

       fn_set_hook('master_products_actualize_master_product_quantity_pre', $product_id, $master_product_id, $quantity);

#. This hook is executed before searching for the best product offer. Allows you to change the vendor products data::

       fn_set_hook('master_products_get_best_product_offer_pre', $master_product_id, $vendor_product_ids);

#. This hook adds additional actions before deleting destinations::

       fn_set_hook('delete_destinations', $destination_ids, $can_delete);
