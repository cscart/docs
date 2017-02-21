<?php

$schema['products']['settings']['if_out_of_stock'] = array (
        'type' => 'checkbox',
        'default_value' => 'Y'
    );

fn_print_r('Проверяем подключение к схеме', $schema['products']);

return $schema;

