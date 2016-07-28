<?php

$schema['products']['settings']['if_out_of_stock'] = array (
    'type' => 'checkbox',
    'default_value' => 'N'
);

$schema['products']['content']['items']['fillings']['similar_products'] = array (
    'params' => array (
        'similar_products' => true,
        'request' => array (
            'main_product_id' => '%PRODUCT_ID%'
        )
    )
);

return $schema;
