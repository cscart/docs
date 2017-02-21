<?php

$schema['products']['settings']['if_out_of_stock'] = array(
        'type' => 'checkbox',
        'default_value' => 'N'
    );

fn_print_r($schema['products']);

return $schema;

