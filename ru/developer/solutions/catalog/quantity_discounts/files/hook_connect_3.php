fn_print_r('Проверяем работу хука',$products[0]['product'],$products[0]['prices']);
Registry::get('view')->assign('products', $products);