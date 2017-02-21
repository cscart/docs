<?php
function fn_exim_1c_import_products($xml, $user_data)
{
    if (isset($xml->Товары->Товар)) {
        if (Registry::isExist('rus_exim_1c.options_1c')) {
            Registry::set('rus_exim_1c.options_1c', array());
        }
        $_cat = Registry::get('rus_exim_1c.categories_1c');
        $products_1C = array();
        $lang_code = CART_LANGUAGE;
        foreach ($xml->Товары->Товар as $_product) {
		
		    fn_print_r($_product);
            
		}
    }
}