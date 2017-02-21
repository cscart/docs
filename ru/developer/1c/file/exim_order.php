<?php
$number_for_orders = trim(Registry::get('addons.rus_exim_1c.exim_1c_from_order_id'));
if (isset($params['place'])) {
    if (!empty($number_for_orders)) {
        $order_id = Registry::get('addons.rus_exim_1c.exim_1c_from_order_id');
        if (!empty($order_id)) {
            $condition .= db_quote(" AND ?:orders.order_id >= ?i", $order_id);
        }
    }
}