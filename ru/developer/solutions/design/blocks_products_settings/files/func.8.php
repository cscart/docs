        // Обработка для настройки «Диапазон цен»
        if (!empty($product['price']) && $product['price'] > 0 && !empty($params['price_range']) && $params['price_range'] > 0) {

            $range = $product['price'] / 100 * $params['price_range'];

            $params['price_from'] = $product['price'] - $range;
            $params['price_to'] = $product['price'] + $range;
        }

