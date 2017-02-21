<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($mode == 'update') {

        $data = array (
            'amount' => 5,
            'status' => 'A',
        );

        $product_id = 3;

        db_query('UPDATE ?:products SET ?u WHERE product_id = ?i', $data, $product_id);

    }

    return array(CONTROLLER_STATUS_OK, "products.update");
}

// Начало секции GET 
if ($mode == 'update') {
    //.......
}

