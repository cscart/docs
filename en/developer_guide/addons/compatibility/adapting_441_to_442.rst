**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.4.2
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

This hook is executed after checking whether a watermark is needed or not::

  fn_set_hook('is_need_watermark_post', $object_type, $is_detailed, $company_id, $result); 

==============
Core Functions
==============

-------------
New Functions
-------------

#. Replace the width of the location, container, grid of the XML layout with the width of the layout itself::

     \Tygh\BlockManager\Exim::setLayoutElementsWidth($layout_width, &$content, &$_attrs)
    
#. Replace the widths of containers and grids of the given layout with the width of this layout::

     \Tygh\BlockManager\Layout::setLayoutElementsWidth($layout_id, $layout_width)

#. Check if PayPal IPN for the order was received. The check is performed by searching for the IPN receiving time in the payment information of the order::

     fn_is_paypal_ipn_received($order_id)

#. Remove definition of external entities from XML body to prevent XXE attacks::

     \Tygh\Tools\SecurityHelper::removeXmlEntities($xml)

----------------- 
Changed Functions
-----------------

#.

  ::

    // old:
    fn_exim_set_company($object_type, $object_key, $object_id, $company_name)

    // new:
    fn_exim_set_company($object_type, $object_key, $object_id, $company_name, &$processed_data = array())

#.

  ::

    // old:
    fn_exim_set_product_company($product_id, $company_name)

    // new:
    fn_exim_set_product_company($product_id, $company_name, &$processed_data)
