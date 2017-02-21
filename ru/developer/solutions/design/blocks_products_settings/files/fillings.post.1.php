<?php

$schema['similar_products'] = array (
    'limit' => array (
        'type' => 'input',
        'default_value' => 3,
    ),
    'price_range' => array (
        'type' => 'input',
        'unset_empty' => true, // Параметр не используется, если пустой.
    ),
    'similar_category' => array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    ),
    'similar_subcat' => array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    ),
);

return $schema;