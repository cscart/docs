        // Get qty discounts
        if ($get_qty_discounts == true) {
fn_print_r($product_data['prices']);
            fn_get_product_prices($product_id, $product_data, $auth);
fn_print_r($product_data['prices']);
        }