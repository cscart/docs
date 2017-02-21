function fn_my_changes_get_products_pre(&$params, $items_per_page, $lang_code)
{
    if (!empty($params['similar_products']) && $params['similar_products'] == 'Y') {

        // Получаем данные об основном товаре страницы.
        $product = Registry::get('view')->getTemplateVars('product');

        // Исключим основной товар из выборки.
        if (!empty($params['main_product_id'])) {
            $params['exclude_pid'] = $params['main_product_id'];
        }

        // Обработка для настройки «Аналогичная категория»
        if (!empty($params['similar_category']) && $params['similar_category'] == 'Y') {
            $params['cid'] = $product['main_category'];

            // Обработка для настройки «Использовать подкатегории»
            if (!empty($params['similar_subcat']) && $params['similar_subcat'] == 'Y') {
                $params['subcats'] = 'Y';
            }
        }

        // Обработка для настройки «Диапазон цен»
        if (!empty($product['price']) && $product['price'] > 0 && !empty($params['price_range']) && $params['price_range'] > 0) {

            $range = $product['price'] / 100 * $params['price_range'];

            $params['price_from'] = $product['price'] - $range;
            $params['price_to'] = $product['price'] + $range;
        }

        // Отображать товары с количеством больше 1
        $params['amount_from'] = 1 ;
    }
}