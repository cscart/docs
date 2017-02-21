<?php
function fn_exim_1c_import_orders($xml)
{
    foreach ($xml->Документ as $_order) {
        $order_id = intval($_order->Номер);
		fn_print_r($order_id);
    }
}