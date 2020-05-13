*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.11.4
*******************************************************

.. contents::
     :local:
     :backlinks: none

===============
Общие изменения
===============

* Модули: Водяные знаки: Модуль больше не пытается получить данные изображений из базы данных, а получает их из хука ``generate_thumbnail_post``.

--------------------------------
Схема категорий платёжных систем
--------------------------------

* Чтобы добавить новую категорию для платёжных систем, теперь нужно создать такую схему в **payments/categories.php**::

    (string) CategoryId => [
    'id' => (string) CategoryId,
    'name' => (string) TemplateLanguageVariable,
    'position' => (int) CategoryPosition
    'criteria' => [
        (string) ProcessorField => (mixed) ProcessorFieldValue,
         ...
        ],
    ],
	
* Платёжные системы в режимах ``manage`` и ``update`` контроллера ``payments`` теперь сгруппированы по категориям. Каждой системе присваивается только 1 категория.

=======
Функции
=======

------------
Новые классы
------------

``Tygh\Enum\SiteArea`` — перечисление возможных областей сайта.

------------------
Изменённые функции
------------------

#.
    ::

       // Было:
       fn_get_checkout_payment_buttons(&$cart, &$cart_products, &$auth)
       // Стало:
       fn_get_checkout_payment_buttons(&$cart, &$cart_products, &$auth, array $checkout_payments = null)

#.
    ::
  
       // Было:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false)
       // Стало:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [])

    Если вы используете функцию  ``fn_generate_thumbnail`` напрямую, вам необходимо передать в неё массив  ``$image``.

#.
    ::
  
      // Было:
      fn_get_product_prices($product_id, &$product_data, $auth, $company_id = 0)
      // Стало:
      fn_get_product_prices($product_id, &$product_data, $auth, $company_id = 0, $get_all = false)

#.
    ::
  
      // Было:
      \Tygh\Common\OperationResult::showNotifications($translate_messages = false)
      // Стало:
      \Tygh\Common\OperationResult::showNotifications($translate_messages = false, $message_state = '')

#.
    ::
  
      // Было:
      fn_init_currency($params, $area = AREA)
      // Стало:
      fn_init_currency($params, $area = AREA, $account_type = null)
    
-----------------
Удалённые функции
-----------------

#. ``fn_seo_get_availability_for_snippet``
#. ``fn_seo_extract_feature_brand``
#. ``fn_mobile_app_uninstall_layout``

-------------
Новые функции
-------------

#. Получает элементы разметки Schema.org для товара::
     
    fn_seo_get_schema_org_markup_items(array $product_data, $show_price = true, $currency = CART_PRIMARY_CURRENCY)
	
#. Получает данные чека и преобразует их в нужную форму для отправки в API Робокассы::

     fn_rus_payments_robokassa_encode_receipt(array $receipt, array $processor_data)
	 
#. Возвращает все данные чека в соответствии с требованиями из документации API Робокассы::

     fn_rus_payments_robokassa_get_full_payment_receipt(array $processor_data, array $order_info, array $params = [])
	 
#. Обновляет позицию товара в выбранной категории::

     fn_update_product_position_in_category($product_id, $category_id, $position)
	 
#. Сортирует все платёжные системы по соответствующим категориям::

     fn_get_payment_processors_by_category($allow_multiple_categories = false)
	 
#. Инициализирует пустую корзину для запросов Storefront REST API::

     fn_storefront_rest_api_get_empty_cart($cart_service_id, array $auth)
	 
#. Получает ID ``cart_services`` (это сервисы, которые работают с корзинами, содержащими товары только одного продавца)::

     fn_storefront_rest_api_get_cart_service_ids(array $auth)
	 
#. Группирует товары из корзины по ``cart_services``::

     fn_storefront_rest_api_group_cart_products(array $cart_products)
	 
#. Получает ID продавцов, чьи товары находятся в корзине покупателя::

     \Tygh\Addons\DirectPayments\Cart\Service::getVendorIdsByUserId($user_id)

====
Хуки
====

---------------
Изменённые хуки
---------------

#.
    ::
  
      // Было:
      fn_set_hook('get_checkout_payment_buttons', $cart, $cart_products, $auth, $checkout_buttons, $checkout_payment_ids, $payment_id);
      // Стало:
      fn_set_hook('get_checkout_payment_buttons', $cart, $cart_products, $auth, $checkout_buttons, $checkout_payment_ids, $payment_id, $payment, $checkout_payments);

#.
    ::
  
      // Было:
      fn_set_hook('generate_thumbnail_post', $th_filename, $lazy, $image_path, $width, $height);
      // Стало:
      fn_set_hook('generate_thumbnail_post', $th_filename, $lazy, $image_path, $width, $height, $image);

#.
    ::
  
      // Было:
      fn_set_hook('checkout_select_default_payment_method', $cart, $payment_methods, $completed_steps_legacy);
      // Стало:
      fn_set_hook('checkout_select_default_payment_method', $cart, $payment_methods, $completed_steps_legacy, $auth);

#.
    ::
  
      // Было:
      fn_set_hook('form_cart_pre_fill', $order_id, $cart, $auth, $order_info);
      // Стало:
      fn_set_hook('form_cart_pre_fill', $order_id, $cart, $auth, $order_info, $copy);

#.
    ::
  
      // Было:
      fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id);
      // Стало:
      fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id, $link);

#.
    ::
  
      // Было:
      fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition);
      // Стало:
      fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition, $price_usergroup);

----------
Новые хуки
----------

#. Позволяет менять параметры и ID пользователей в процессе обновления уровней клиентов::

    fn_set_hook('tier_manager_update_tier_pre', $user_ids, $type, $allow_downgrade);

#. Выполняется при получении элементов разметки Schema.org, непосредственно перед возвращением результата. Позволяет менять созданные элементы разметки::

     fn_set_hook('seo_get_schema_org_markup_items_post', $product_data, $show_price, $currency, $markup_items);

#. Выполняется при обновлении количества товара на складе, но до проверки состояния настроек отслеживания::

     fn_set_hook('update_product_amount_before_tracking_checking', $product_id, $amount_delta, $product_options, $sign, $notify, $order_info);

#. Позволяет менять код добавленного статуса::

     fn_set_hook('update_status_new_status_code', $status, $status_data, $type, $lang_code, $existing_codes);

#. Выполняется перед созданием формы оплаты. Позволяет менять данные формы::

     fn_set_hook('create_payment_form_pre', $submit_url, $data, $payment_name, $exclude_empty_values, $method, $parse_url, $target, $connection_message);

#. Выполняется при изменении позиции товара в категории::

     fn_set_hook('update_product_position_in_category_post', $product_id, $category_id, $position);

#. Выполняется после инициализации пустой корзины для запросов Storefront REST API. Позволяет менять инициализируемую корзину::

     fn_set_hook('storefront_rest_api_get_empty_cart_post', $cart_service_id, $auth, $cart);

#. Выполняется после инициализации списка доступных ID ``cart_services`` для запроса Storefront REST API. Позволяет менять список ``cart_services``::

     fn_set_hook('storefront_rest_api_get_cart_service_ids_post', $auth, $cart_service_ids);

#. Выполняется после того, как товары рассортированы в группы для запроса Storefront REST API. Позволяет менять инициализируемые группы::

     fn_set_hook('storefront_rest_api_group_cart_products_post', $cart_products, $groups);

#. Выполняется, когда новый пользователь авторизуется через стороннюю учётную запись (социальную сеть и т.п.). Позволяет изменять данные пользователя перед созданием учётной записи в магазине::

     fn_set_hook('hybrid_auth_create_user', $auth_data, $provider, $user_data);