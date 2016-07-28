<?php

// Подключение класса Registry
use Tygh\Registry; 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //......
}

// Секция GET
if ($mode == 'update') {

    $id = $_REQUEST['product_id'];

    $data = db_get_row("SELECT * FROM ?:products WHERE product_id = ?i", $id);

    Registry::get('view')->assign('data', $data);

} elseif ($mode == 'manage') {

    $products = fn_get_products($_REQUEST);

    Registry::get('view')->assign('products', $products);

}