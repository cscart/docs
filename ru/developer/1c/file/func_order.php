<?php
function fn_rus_exim_1c_get_orders($params, $fields, $sortings, &$condition, $join, $group)
{
    if ((Registry::get('addons.rus_exim_1c.exim_1c_export_add_true_orders') == 'Y') && ($params['place'] == 'exim_1c')) {
        $order_id = Registry::get('addons.rus_exim_1c.exim_1c_from_order_id');
        if (!empty($order_id)) {
            $condition .= db_quote(" AND ?:orders.order_id >= ?i", $order_id);
        }
    }
}