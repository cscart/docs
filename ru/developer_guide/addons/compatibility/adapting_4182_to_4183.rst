*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.18.3
*******************************************************

.. contents::
    :backlinks: none
    :local:

=================
Изменения в хуках
=================


Новые хуки
==========

#. Выполняется после обновления отгрузки::

        `fn_set_hook('update_shipment_post', $shipment_data, $shipment_id, $group_key, $all_products, $force_notification, $old_shipment_data);` 
    
#. Выполняется до обновления отгрузки в API::

        `fn_set_hook('api_update_shipment_pre', $id, $params, $data, $status, $valid_params, $allowed_params_list);`