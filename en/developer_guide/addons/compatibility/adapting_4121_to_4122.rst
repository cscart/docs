***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.12.2
***********************************************

.. contents::
    :local:
    :backlinks: none
	
Core Changes
============

Changed Functions
+++++++++++++++++

#.

   ::

     // Old:
     \Tygh\Template\Document\Variables\CompanyVariable::__construct($config, $company_id, $lang_code)
     // New:
     \Tygh\Template\Document\Variables\CompanyVariable::__construct($config, $company_id, $lang_code, IContext $context)

#.

    ::
      
      // Old:
      \Tygh\Template\Document\Order\Context::__construct(Order $order)
      // New:
      \Tygh\Template\Document\Order\Context::__construct(Order $order, $area = AREA)

#.

    ::	
      
      // Old:
      \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::__construct(array $gift_certificate_data, $lang_code)
      // New:
      \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::__construct(array $gift_certificate_data, $lang_code, $area = AREA)
	  
Deprecated Functions
++++++++++++++++++++

#. ::

       // Deprecated function:
       \Tygh\Addons\AdvancedImport\Presets\Manager::updateStatistics
       // What to use instead:
       \Tygh\Addons\AdvancedImport\Presets\Manager::updateState

New Functions
+++++++++++++

#. Get area::

	 \Tygh\Template\IContext::getArea()

#. Get area::

	 \Tygh\Template\Snippet\Table\ItemContext::getArea()
	 
#. Get area::

	 \Tygh\Template\Mail\Context::getArea() 
	 
#. Get area::

	 \Tygh\Template\Internal\Context::getArea() 

#. Get area::

	 \Tygh\Template\Document\Order\Context::getArea() 
	 
#. Get area::

	 \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::getArea() 
	 
#. Gathers additional product data for an API request::

	 \fn_storefront_rest_api_gather_additional_products_data(array $products, array $params = []) 
	 
#. Loads seller data for product offers::

	 \fn_master_products_load_products_seller_data(array $products) 

Hook Changes
============

Changed Hooks
+++++++++++++

#. ::
      
      // Old:
      fn_set_hook('template_document_order_context_init', $this, $order);
      // New:
      fn_set_hook('template_document_order_context_init', $this, $order, $area);

#. ::
      
      // Old:
      fn_set_hook('get_logos_post', $company_id, $layout_id, $style_id, $logos);
      // New:
      fn_set_hook('get_logos_post', $company_id, $layout_id, $style_id, $logos, $storefront_id);

#. ::
      
      // Old:
      fn_set_hook('update_language_post', $language_data, $lang_id, $action);
      // New:
      fn_set_hook('update_language_post', $language_data, $lang_id, $action, $previous_language_data);

New Hooks
+++++++++

#. This hook is executed before gathering additional product data for an API request. The hook allows you to modify data gathering parameters::

     fn_set_hook('storefront_rest_api_gather_additional_products_data_pre', $products, $params, $data_gather_params);

#. This hook is executed after gathering additional product data for an API request. The hook allows you to modify gathered data::

     fn_set_hook('storefront_rest_api_gather_additional_products_data_post', $products, $params, $data_gather_params);
	 
#. This hook is executed after logining. The hook allows you to modify URL redirection and session data::

	 fn_set_hook('hybrid_auth_login_post', $user_data, $auth_data, $provider_id, $redirect_url, $user_status);
