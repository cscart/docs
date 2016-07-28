
        // Обработка для настройки «Аналогичная категория»
        if (!empty($params['similar_category']) && $params['similar_category'] == 'Y') {
            $params['cid'] = $product['main_category'];

            // Обработка для настройки «Использовать подкатегории»
            if (!empty($params['similar_subcat']) && $params['similar_subcat'] == 'Y') {
                $params['subcats'] = 'Y';
            }
        }
