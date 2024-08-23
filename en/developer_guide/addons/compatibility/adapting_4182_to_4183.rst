***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.18.3
***********************************************

.. contents::
    :backlinks: none
    :local:

============
Hook changes
============


=========
New hooks
=========

#. Executes after a shipment has been updated::

        `fn_set_hook('update_shipment_post', $shipment_data, $shipment_id, $group_key, $all_products, $force_notification, $old_shipment_data);`
#. Executes before a shipment has been updated in api::

        `fn_set_hook('api_update_shipment_pre', $id, $params, $data, $status, $valid_params, $allowed_params_list);` 