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
            if (empty($_product->Наименование) || empty($_product->Группы->Ид)) {
                continue;
            }
            $product = array();
            $ids = fn_explode('#', $_product->Ид);
            $guid_product = array_shift($ids);
            $guid_variant = (!empty($ids)) ? array_shift($ids) : '';
			
			if (Registry::get('addons.rus_exim_1c.exim_1c_page_title') == 'name') {
			    $product['page_title'] = trim($_product->Наименование, " -");
			}
            if (Registry::get('addons.rus_exim_1c.exim_1c_page_title') == 'full_name') {
			    $product['page_title'] = trim($_product->Наименование, " -");
                foreach ($_product->ЗначенияРеквизитов->ЗначениеРеквизита as $reckvizit) {
                    if (strval($reckvizit->Наименование) == 'Полное наименование') {
                        $product['page_title'] = trim(strval($reckvizit->Значение), " -");
                    }
                }
			}
		}
    }
}