***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.13.2
***********************************************

.. contents::
    :local:
    :backlinks: none
	
============
Core changes
============

---------------
Changed Classes
---------------

#. ::

       // Old:
       \Tygh\Pdf
       // New:
       \Tygh\Addons\PdfDocuments\Pdf

-----------------
Changed Functions
-----------------

#.

   ::

     // Old:
     fn_print_order_packing_slips($order_ids, $pdf = false, $lang_code = CART_LANGUAGE)
     // New:
     fn_print_order_packing_slips($order_ids, $params = [])

#.

    ::
      
      // Old:
      fn_print_shipment_packing_slips($shipment_ids, $pdf = false, $lang_code = CART_LANGUAGE)
      // New:
      fn_print_shipment_packing_slips($shipment_ids, $params = [])

#.

    ::
      
      // Old:
      fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [])
      // New:
      fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, array $params = [], $changed = false, $input_object_name = '')

--------------------
Deprecated Functions
--------------------

#. ``fn_print_supplier_invoices``

-------------
New Functions
-------------

#. Send modified order invoice::

       fn_send_order_invoice(array $order_info, array $params)

============
Hook Changes
============

-------------
Changed Hooks
-------------

#. ::

       // Old:
       fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code, $locations);
       // New:
       fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code, $locations, $storefront_id);

#. ::

       // Old:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // New:
       fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

#. ::

       // Old:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);
       // New:
       fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params, $create_redirect, $area, $changed, $input_object_name);

---------
New Hooks
---------

#. This hook is executed before retrieve product shipping methods for estimation::

       fn_set_hook('geo_maps_get_product_shipping_methods_before_estimation', $product);

#. This hook is executed after getting promotion data. Ayyllows you to modify data received in function::

       fn_set_hook('get_promotion_data_post', $promotion_id, $lang_code, $promotion_data);

#. This hook is executed before sending a custom order invoice. Allows you to modify invoice data and its receiver::

       fn_set_hook('send_order_invoice', $order_info, $params, $subject, $invoice, $email, $attachments);

#. This hook is executed before printing order packing slips. Allows you to modify parameters passed to the function::

       fn_set_hook('print_order_packing_slips_pre', $order_ids, $params);

#. This hook is executed after order packing slips are generated. Allows you to execute additional slip data modifications::

       fn_set_hook('print_order_packing_slips_post', $order_ids, $params, $html, $output);

#. This hook is executed before printing order invoices. Allows you to modify parameters passed to the function::

       fn_set_hook('print_order_invoices_pre', $order_ids, $params);

#. This hook is executed after order invoices are generated. Allows you to execute additional invoice data modifications::

       fn_set_hook('print_order_invoices_post', $order_ids, $params, $html, $output);

#. This hook is executed after changing user group status::

       fn_set_hook('change_usergroup_status_post', $status, $user_id, $usergroup_id, $force_notification, $result).
