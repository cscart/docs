//
// View product details
//
} elseif ($mode == 'view' || $mode == 'quick_view') {

    fn_print_r('Test');

    $_REQUEST['product_id'] = empty($_REQUEST['product_id']) ? 0 : $_REQUEST['product_id'];
