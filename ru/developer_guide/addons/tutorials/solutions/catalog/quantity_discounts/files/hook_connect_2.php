<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_changes_gather_additional_product_data_before_discounts(&$product, &$auth, &$params)
{

    fn_get_product_prices($product['product_id'], $product, $auth);
    
    fn_print_r($product['prices']);

    return true;
}
