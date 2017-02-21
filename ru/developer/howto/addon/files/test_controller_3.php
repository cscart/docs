    //
    // Create/update product
    //
    if ($mode == 'update') {

        fn_print_die('Проверка mode');

        if (!empty($_REQUEST['product_data']['product'])) {