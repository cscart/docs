*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.12.2
*******************************************************

.. contents::
    :local:
    :backlinks: none

Изменения в ядре
================

Изменённые функции
++++++++++++++++++

#.

   ::

     // Было:
     \Tygh\Template\Document\Variables\CompanyVariable::__construct($config, $company_id, $lang_code)
     // Стало:
     \Tygh\Template\Document\Variables\CompanyVariable::__construct($config, $company_id, $lang_code, IContext $context)

#.

    ::
      
      // Было:
      \Tygh\Template\Document\Order\Context::__construct(Order $order)
      // Стало:
      \Tygh\Template\Document\Order\Context::__construct(Order $order, $area = AREA)

#.

    ::	
      
      // Было:
      \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::__construct(array $gift_certificate_data, $lang_code)
      // Стало:
      \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::__construct(array $gift_certificate_data, $lang_code, $area = AREA)
	  
Устаревшие функции
++++++++++++++++++

#. ::

       // Устаревшая функция:
       \Tygh\Addons\AdvancedImport\Presets\Manager::updateStatistics
       // Что использовать вместо неё:
       \Tygh\Addons\AdvancedImport\Presets\Manager::updateState

Новые функции
+++++++++++++

#. Получает область сайта::

	 \Tygh\Template\IContext::getArea()

#. Получает область сайта::

	 \Tygh\Template\Snippet\Table\ItemContext::getArea()
	 
#. Получает область сайта::

	 \Tygh\Template\Mail\Context::getArea() 
	 
#. Получает область сайта::

	 \Tygh\Template\Internal\Context::getArea() 

#. Получает область сайта::

	 \Tygh\Template\Document\Order\Context::getArea() 
	 
#. Получает область сайта::

	 \Tygh\Addons\GiftCertificates\Documents\GiftCertificate\Context::getArea() 
	 
#. Собирает дополнительные данные о товарах для запроса API::

	 \fn_storefront_rest_api_gather_additional_products_data(array $products, array $params = []) 
	 
#. Загружает данные продавца для товарных предложений::

	 \fn_master_products_load_products_seller_data(array $products) 

Хуки
====

Изменённые хуки
+++++++++++++++

#. ::
      
      // Было:
      fn_set_hook('template_document_order_context_init', $this, $order);
      // Стало:
      fn_set_hook('template_document_order_context_init', $this, $order, $area);

#. ::
      
      // Было:
      fn_set_hook('get_logos_post', $company_id, $layout_id, $style_id, $logos);
      // Стало:
      fn_set_hook('get_logos_post', $company_id, $layout_id, $style_id, $logos, $storefront_id);

#. ::
      
      // Было:
      fn_set_hook('update_language_post', $language_data, $lang_id, $action);
      // Стало:
      fn_set_hook('update_language_post', $language_data, $lang_id, $action, $previous_language_data);

Новые хуки
++++++++++

#. Выполняется перед сбором дополнительных данных о продукте для запроса API. Позволяет менять параметры сбора данных::

     fn_set_hook('storefront_rest_api_gather_additional_products_data_pre', $products, $params, $data_gather_params);

#. Выполняется после сбора дополнительных данных о продукте для запроса API. Позволяет менять собранные данные::

     fn_set_hook('storefront_rest_api_gather_additional_products_data_post', $products, $params, $data_gather_params);
	 
#. Выполняется после входа в систему. Позволяет менять переадресацию и данные сеанса::

	 fn_set_hook('hybrid_auth_login_post', $user_data, $auth_data, $provider_id, $redirect_url, $user_status);