<?php
function fn_exim_1c_import_orders($xml)
{
    $cml = fn_get_cml_tag_names();
    $statuses = db_get_hash_array("SELECT status, description FROM ?:status_descriptions WHERE type = 'O' AND lang_code = ?s", 'description', CART_LANGUAGE);
    foreach ($orders_data->$cml['document'] as $order_data) {
        $order_id = strval($order_data->$cml['id']);
        fn_print_r($order_id);
    }
}