*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.13.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

================
Изменения в ядре
================

-----------------
Изменённые классы
-----------------

#. ::

       // Было:
       \Tygh\Pdf
       // Стало:
       \Tygh\Addons\PdfDocuments\Pdf

------------------
Изменённые функции
------------------

#.

   ::

     // Было:
     fn_print_order_packing_slips($order_ids, $pdf = false, $lang_code = CART_LANGUAGE)
     // Стало:
     fn_print_order_packing_slips($order_ids, $params = [])

#.

   ::

     // Было:
     fn_print_shipment_packing_slips($shipment_ids, $pdf = false, $lang_code = CART_LANGUAGE)
     // Стало:
     fn_print_shipment_packing_slips($shipment_ids, $params = [])

#.

   ::

     // Было:
     fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [])
     // Стало:
     fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [], $changed = false, $input_object_name = '')

------------------
Устаревшие функции
------------------

#. ``fn_print_supplier_invoices``

-------------
Новые функции
-------------

#. Отправляет изменнённый счёт по заказу::

       fn_send_order_invoice(array $order_info, array $params)

=================
Изменения в хуках
=================

---------------
Измененные хуки
---------------

#. ::

       // Было:
       fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code, $locations);
       // Стало:
       fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code, $locations, $storefront_id);

#. ::

       // Было:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // Стало:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

#. ::

       // Было:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // Стало:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

----------
Новые хуки
----------

#. Выполняется перед выгрузкой способов доставки для расчета стоимости доставки::

       fn_set_hook('geo_maps_get_product_shipping_methods_before_estimation', $product);

#. Выполняется после получения данных о промо-акции. Позволяет менять данные, полученные в функции::

       fn_set_hook('get_promotion_data_post', $promotion_id, $lang_code, $promotion_data);

#. Выполняется перед отправкой пользовательского счета по заказу. Позволяет менять данные счета и его получателя::

       fn_set_hook('send_order_invoice', $order_info, $params, $subject, $invoice, $email, $attachments);

#. Выполняется перед печатью упаковочных реестров по заказу. Позволяет менять параметры, передаваемые в функцию::

       fn_set_hook('print_order_packing_slips_pre', $order_ids, $params);

#. Выполняется после формирования упаковочных реестров по заказу. Позволяет выполнить дополнительные изменения в данных реестра::

       fn_set_hook('print_order_packing_slips_post', $order_ids, $params, $html, $output);

#. Выполняется перед печатью счетов по заказу. Позволяет менять параметры, передаваемые в функцию::

       fn_set_hook('print_order_invoices_pre', $order_ids, $params);

#. Выполняется после формировнаия счета по заказу. Позволяет выполнить дополнительные изменения в данных счета::

       fn_set_hook('print_order_invoices_post', $order_ids, $params, $html, $output);

#. Выполняется после изменения статуса группы пользователей::

       fn_set_hook('change_usergroup_status_post', $status, $user_id, $usergroup_id, $force_notification, $result).