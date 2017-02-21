function fn_my_changes_get_products_pre(&$params, $items_per_page, $lang_code)
{
    // Если это блока «Похожие товары»
    if (!empty($params['similar_products']) && $params['similar_products'] == 'Y') {

        // Получаем данные об основном товаре страницы.
        $product = Registry::get('view')->getTemplateVars('product');

        // Исключим основной товар из выборки.
        if (!empty($params['main_product_id'])) {
            $params['exclude_pid'] = $params['main_product_id'];
        }

    }
}