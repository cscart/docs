<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_settings_variants_addons_sample_addon_3_0_selectable_box()
{
    $schema = array(
        'fields' => array(
            'product_id' => array('title' => __('product_id'), 'sort_by' => ''),
            'product' => array('title' => __('product_name'), 'sort_by' => 'product'),
            'min_qty' => array('title' => __('min_order_qty'), 'sort_by' => ''),
            'max_qty' => array('title' => __('max_order_qty'), 'sort_by' => ''),
            'product_code' => array('title' => __('sku'), 'sort_by' => 'code'),
            'amount' => array('title' => __('quantity'), 'sort_by' => 'amount'),
            'price' => array('title' => __('price'), 'sort_by' => 'price'),
            'weight' => array('title' => __('weight'), 'sort_by' => 'weight'),
            'image' => array('title' => __('image'), 'sort_by' => ''),
        ),
    );
    $result = array();

    if (!empty($schema['fields'])) {
        foreach ($schema['fields'] as $field_id => $field) {
            $result[$field_id] = $field['title'];
        }
    }

    return $result;
}

function fn_sample_addon_3_0_info()
{
    $text = __('sample_addon_handler') . '<hr/>' . __('test_xml_3.0_1') . '<br />' . __('test_xml_3.0_2');

    return $text . '<hr/>' ;
}
