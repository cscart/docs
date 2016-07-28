<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_changes_render_blocks($grid, &$block, $this, $content)
{
    // Если мы на витрине витрина.
    if (AREA == 'C') {
        // Если у блока есть нужная настройка
        if (!empty($block['properties']['if_out_of_stock']) && $block['properties']['if_out_of_stock'] == 'Y') {

            // Выключаем блок
            $block['status'] = 'D';

            // Если в настоящий момент открыта страница товара
            if ($block['object_type'] == 'products') {
                // Получаем информацию о товаре. Так как блоки подключаются после контроллера, то контроллер уже передал информацию о товаре в Smarty.
                $product = Registry::get('view')->getTemplateVars('product');

                // Если информация о товаре существует
                if (!empty($product['product_id'])) {

                    fn_print_r($product['amount']);

                }
            }
        }
    }
}
