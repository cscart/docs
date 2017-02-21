    'products' => array (
        'content' => array (
            'items' => array (
                'type' => 'enum',
                'object' => 'products', 
                'items_function' => 'fn_get_products',  
                'remove_indent' => true,
                'hide_label' => true,
                'fillings' => array ( 
                    /*
                     ..... Список типов заполнения содержимого
                    */ 
                ),
            ),
        ),
        'templates' => 'blocks/products',
        'settings' => array(
            'hide_add_to_cart_button' => array (
                'type' => 'checkbox',
                'default_value' => 'Y'
            )
        ),
        'wrappers' => 'blocks/wrappers',
        'cache' => array(
            // ..... Параметры кэширования блока
        )
    ),