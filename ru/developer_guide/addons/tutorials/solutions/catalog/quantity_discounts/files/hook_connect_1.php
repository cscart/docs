<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_changes_gather_additional_product_data_before_discounts(&$product, &$auth, &$params)
{

    fn_print_r('ID товара: ' . $product['product_id']);
    
    return true;
}
