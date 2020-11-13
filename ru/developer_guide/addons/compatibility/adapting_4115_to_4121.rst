*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.12.1
*******************************************************

.. contents::
	:backlinks: none
	:local:

===============
Общие изменения
===============

* Библиотека HTMLPurifier library обновлена до версии 4.13.0.


-------------------------------------------
Механизм привязки языков и валют к витринам
-------------------------------------------

В CS-Cart для привязки языков и валют к витринам больше не используется механизм общего доступа (sharing).


-------------------------------------
Механизм привязки настроек к витринам
-------------------------------------

В Multi-Vendor Ultimate добавлена возможность задавать разные значения настроек для витрин — по аналогии с тем, как это было возможно в CS-Cart. Если вы хотите использовать новую функциональность, вам потребуется адаптировать свои модули:

#. ``edition_type`` настроек и секций настроек нужно будет заменить с ``ROOT,VENDOR`` или ``ROOT,ULT:VENDOR`` на ``ROOT,STOREFRONT``.

#. Везде, где вы получаете и обновляете значения настроек программно, нужно явно указывать ``storefront_id``. Лучше всего указывать его при получении экземпляра сервиса работы с настройками::

       $settings_manager = Settings::instance(['storefront_id' => 1]);
       

-------------------------------
Изменения настроек безопасности
-------------------------------

Создание хеша пароля при помощи ``md5`` было заменено на хеширование на основе функции ``password_hash``. Теперь для верификации пароля используется функция ``fn_user_password_verify``.


---------------------
Изменения в структуре
---------------------

Файл с функциями ``app/functions/fn.catalog.php`` был  разбит на несколько, в зависимости от назначения функций:

* ``fn.categories.php``

* ``fn.features.php``

* ``fn.filters.php``

* ``fn.options.php``

* ``fn.product_files.php``

* ``fn.products.php``


------------------------
Изменения в уведомлениях
------------------------

Добавлена возможность настраивать получателей уведомлений по группам пользователей, отдельным пользователям и отдельным email-адресам.

Если ранее вы разработали собственный транспорт сообщений или расширяли схемы событий, вам потребуется их адаптировать:

#. Изменить метод ``\Tygh\Notifications\Transports\ITransport::process()`` в классе транспорта. Теперь в него передаются условия поиска получателей для события.

#. Реализовать поиск получателей сообщения о событии. В стандартных классах данный механизм реализован с помощью специализированных классов-поисковиков::

      (Tygh\Notifications\Transports\Internal\ReceiverFinders\*
      
      Tygh\Notifications\Transports\Mail\ReceiverFinders\*)
      
   и фабрик поисковиков, которые эти классы создают::
      
      (\Tygh\Notifications\Transports\Internal\ReceiverFinderFactory
      
      \Tygh\Notifications\Transports\Mail\ReceiverFinderFactory)
      
#. Настроить отображение редактора получателей через схему ``notifications/groups``, если вы добавляли группу событий уведомлений.

Во избежание путаницы, продавца-получателя внутренних уведомлений стоит указывать через новое добавленное свойство ``to_company_id``. Свойство ``company_id`` отвечает за продавца-отправителя в рамках почтовых уведомлений.


-----------------------------------------
Изменения в тарифных планах для продавцов
-----------------------------------------

Теперь ``commision_amount`` не отображает прибыль маркетплейса; ``commision_amount`` может включать в себя комиссию и налог (если включена настройка **Собирать налоги с продавцов**). Прибыль маркетплейса отображает ``marketplace_profit``.


--------------------------------------
Изменения в меню панели администратора
--------------------------------------

Теперь сторонние модули не могут создавать корневые элементы в меню панели администратора. В рамках текущего релиза для поддержания обратной совместимости добавлена настройка ``validate_menu``, которая позволит отключить подобную фильтрацию.


------------------------
Изменения в схеме модуля
------------------------

В описании схемы модуля добавлен новый тэг ``supplier_page``, в котором можно указывать путь к странице разработчика. Страница разработчика должна быть записана в формате ``controller.mode``.


================
Изменения в ядре
================

----------------
Удалённые классы
----------------

* ::
      
      \Tygh\Api\Entities\Combinations
      
      
-----------------      
Изменённые классы
-----------------

~~~~~~~~~~~~~~~~~~~~~~~~
Изменения в уведомлениях
~~~~~~~~~~~~~~~~~~~~~~~~

#. ::

       // Было:
       \Tygh\Enum\RecipientSearchMethods 
       // Стало:
       \Tygh\Enum\ReceiverSearchMethods.
        
#. Удалено публичное свойство ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$recipient_search_method``.

#. Удалено публичное свойство ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$recipient_search_criteria``.

#. Добавлено публичное свойство ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema::$to_company_id``.


------------ 
Новые классы
------------

#. Получает сообщение об ошибке, если проверка на то, является ли пользователь ботом, оказывается неудачной::

       \Tygh\Web\Antibot\IErrorableAntibotDriver
       
#. Содержит все возможные типы объектов настроек::

       \Tygh\Enum\SettingTypes
       
~~~~~~~~~~~~~~~~~~~~~~~~       
Изменения в уведомлениях
~~~~~~~~~~~~~~~~~~~~~~~~

#. Представляет собой условие поиска получателя сообщения::

       \Tygh\Notifications\Receivers\SearchCondition
       
#. Предоставляет классы, которые находят получателей внутренних уведомлений::

       \Tygh\Notifications\Transports\Internal\ReceiverFinderFactory 
       
#. Описывает класс, используемый для того, чтобы найти получателей внутренних уведомлений::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\ReceiverFinderInterface

#. Находит получателей внутренних уведомлений по адресам электронной почты::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\EmailFinder 
       
#. Находит менеджеров заказов, которые получают внутренние уведомления::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\OrderManagerFinder 
       
#. Находит получателей внутренних уведомлений в указанной группе пользователей::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\UsergroupIdFinder
        
#. Находит получателей внутренних уведомлений по идентификаторам пользователей::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\UserIdFinder 
       
#. Находит главных администраторов продавцов, которые получают внутренние уведомления::

       \Tygh\Notifications\Transports\Internal\ReceiverFinders\VendorOwnerFinder 
       
#. Описывает класс, используемый, чтобы найти получателей email-уведомлений::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\ReceiverFinderInterface 
       
#. Находит получателей email-уведомлений по адресам электронной почты::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\EmailFinder 
       
#. Находит менеджеров заказов, которые получают email-уведомления::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\OrderManagerFinder 
       
#. Находит получателей email-уведомлений в указанной группе пользователей::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\UsergroupIdFinder 
       
#. Находит получателей email-уведомлений по идентификаторам пользователей::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\UserIdFinder
       
#. Находит главных администраторов продавцов, которые получают email-уведомления::

       \Tygh\Notifications\Transports\Mail\ReceiverFinders\VendorOwnerFinder
       
       
------------------       
Изменённые функции
------------------

#. ::

       // Было:
       \Tygh\Backend\Storage\ABackend.php::getUrl($file = '', $protocol = '');
       // Стало:
       \Tygh\Backend\Storage\ABackend.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::
       
       // Было:
       \Tygh\Backend\Storage\Amazon.php::getUrl($file = '', $protocol = '');
       // Стало:
       \Tygh\Backend\Storage\Amazon.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::
       
       // Было:
       \Tygh\Backend\Storage\File.php::getUrl($file = '', $protocol = '');
       // Стало:
       \Tygh\Backend\Storage\File.php::getUrl($file = '', $protocol = '', $url = '');
       
#. ::

       // Было:
       fn_get_user_name($user_id)
       // Стало:
       fn_get_user_name($user_id, array $user_info = null)

#. ::
       
       // Было:
       fn_exim_get_field_label($value)
       // Стало:
       fn_exim_get_field_label($value, $action = '')
       
#. ::
       
       // Было:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [])
       // Стало:
       fn_generate_thumbnail($image_path, $width, $height = 0, $lazy = false, $return_rel_path = false, array $image = [], $url = '')

#. ::

       // Было:
       fn_image_to_display($images, $image_width = 0, $image_height = 0)
       // Стало:
       fn_image_to_display(array $images, $image_width = 0, $image_height = 0, $url = '')

#. ::

       // Было:
       fn_hybrid_auth_get_provider_data($provider)
       // Стало:
       fn_hybrid_auth_get_provider_data($provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_get_unlink_provider($user_id, $provider)
       // Стало:
       fn_hybrid_auth_get_unlink_provider($user_id, $provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_get_provider_data($provider)
       // Стало:
       fn_hybrid_auth_get_provider_data($provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_delete_provider($provider)
       // Стало:
       fn_hybrid_auth_delete_provider($provider_id)
       
       
#. ::
       
       // Было:
       fn_hybrid_auth_link_provider($user_id, $identifier, $provider)
       // Стало:
       fn_hybrid_auth_link_provider($user_id, $identifier, $provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_login($user_data, $auth_data, $provider)
       // Стало:
       fn_hybrid_auth_login($user_data, $auth_data, $provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_link($user_data, $auth_data, $provider)
       // Стало:
       fn_hybrid_auth_link($user_data, $auth_data, $provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_link_profile($auth_data, $provider)
       // Стало:
       fn_hybrid_auth_link_profile($auth_data, $provider_id)
       
#. ::
       
       // Было:
       fn_hybrid_auth_fix_old_user($auth_data, $provider)
       // Стало:
       fn_hybrid_auth_fix_old_user($auth_data, $provider_id)
       
#. ::
       
       // Было:
       fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false)
       // Стало:
       fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false, array $addons_to_load_schemas_from = null)
       
#. ::
       
       // Было:
       fn_delete_discussion($object_id, $object_type)
       // Стало:
       fn_delete_discussion($object_id, $object_type, $company_id = null)
       
~~~~~~~~~~~~~~~~~~~~~~~~
Изменения в уведомлениях
~~~~~~~~~~~~~~~~~~~~~~~~

#. ::

       // Было:
       \Tygh\Notifications\Transports\ITransport::process(BaseMessageSchema $schema);
       // Стало:
       \Tygh\Notifications\Transports\ITransport::process(BaseMessageSchema $schema, array $receiver_search_conditions);


----------------------
Изменения в настройках
----------------------

#. ::

       // Было:
       \Tygh\Settings::instance($company_id = null)
       // Стало:
       \Tygh\Settings::instance($params = [])
       
#. ::
       
       // Было:
       \Tygh\Settings::getList($section_id = 0, $section_tab_id = 0, $plain_list = false, $company_id = null, $lang_code = CART_LANGUAGE)
       // Стало:
       \Tygh\Settings::getList($section_id = 0, $section_tab_id = 0, $plain_list = false, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)
       
#. ::
       
       // Было:
       \Tygh\Settings::getSettingDataByName($setting_name, $company_id = null, $lang_code = CART_LANGUAGE)
       // Стало:
       \Tygh\Settings::getSettingDataByName($setting_name, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)

#. ::

       // Было:
       \Tygh\Settings::getValues($section_name = '', $section_type = Settings::CORE_SECTION, $hierarchy = true, $company_id = null)
       // Стало:
       \Tygh\Settings::getValues($section_name = '', $section_type = Settings::CORE_SECTION, $hierarchy = true, $company_id = null, $storefront_id = null)
       
#. ::      
       
       // Было:
       \Tygh\Settings::getValue($setting_name, $section_name, $company_id = null)
       // Стало:
       \Tygh\Settings::getValue($setting_name, $section_name, $company_id = null, $storefront_id = null)
#. ::

       // Было:
       \Tygh\Settings::getData($object_id, $company_id = null, $lang_code = CART_LANGUAGE)
       // Стало:
       \Tygh\Settings::getData($object_id, $company_id = null, $lang_code = CART_LANGUAGE, $storefront_id = null)
       
#. ::
       
       // Было:
       \Tygh\Settings::updateValue($setting_name, $setting_value, $section_name = '', $force_cache_cleanup = false, $company_id = null, $execute_functions = true)
       // Стало:
       \Tygh\Settings::updateValue($setting_name, $setting_value, $section_name = '', $force_cache_cleanup = false, $company_id = null, $execute_functions = true, $storefront_id = null)
#. ::

       // Было:
       \Tygh\Settings::updateValueById($object_id, $value, $company_id = null, $execute_functions = true)
       // Стало:
       \Tygh\Settings::updateValueById($object_id, $value, $company_id = null, $execute_functions = true, $storefront_id = null)
       
#. ::
       
       // Было:
       fn_update_addon($settings)
       // Стало:
       fn_update_addon($settings, $storefront_id = null)
       
#. ::
       
       // Было:
       fn_update_customization_mode(array $modes)
       // Стало:
       fn_update_customization_mode(array $modes, $storefront_id = null)
       
#. ::

       // Было:
       fn_get_storefront_protocol($company_id = null)
       // Стало:
       fn_get_storefront_protocol($company_id = null, $storefront_id = null)
       
       
-----------------       
Удалённые функции
-----------------

* ``fn_hybrid_auth_get_provider_id($provider)``

* ``fn_prepare_xml_product_options``

* ``fn_get_product_options_inventory_ebay``

* ``\Tygh\Commerceml\RusEximCommerceml::addNewCombination``

* ``\Tygh\Commerceml\RusEximCommerceml::addProductOptionException``

* ``fn_rus_exim_1c_look_through_variants_update_combination``

* ``fn_delete_product_combination``

* ``fn_delete_product_option_combinations``

* ``fn_look_through_variants``

* ``fn_delete_outdated_combinations``

* ``fn_rebuild_product_options_inventory``

* ``fn_update_exceptions``

* ``fn_clone_options_inventory``

* ``fn_get_product_options_inventory``

* ``fn_get_product_options_combination_data``

* ``fn_update_option_combination``

* ``fn_delete_option_combination``


-------------
Новые функции
-------------

#. Получает список статусов с указанными параметрами::

       fn_get_status_by_type_and_param($type, $params)
       
#. Отправляет уведомление о текущем статусе запроса на возврат::

       fn_rma_send_notification($return_info, $order_info, $force_notification = [])
       
#. Получает схему групп событий::

       \Tygh\Providers\EventDispatcherProvider::getEventGroupsSchema()

#. Получает настройки уведомлений::

       \Tygh\Providers\EventDispatcherProvider::getNotificationSettings($with_receivers = false) 

#. Получает схему событий::

       \Tygh\Providers\EventDispatcherProvider::getEventsSchema()
       
#. Получает адрес электронной почты пользователя::

       fn_get_user_email($user_id, array $user_info = null)
       
#. Обновляет изображение для промо-акции на указанном языке. Если загружается новое изображение, то оно будет загружено для всех языков::

       fn_promotions_update_image($promotion_id, $lang_code = DESCR_SL) 
       
#. Удаляет изображение для промо-акции::

       fn_promotions_delete_image($promotion_id, $lang_code = null)

#. Копирует ссылки на изображения для промо-акций для указанных языков::

       fn_promotions_copy_image_link_to_langs($promotion_id, $original_lang = CART_LANGUAGE, array $cloned_langs = [])
       
#. Копирует ссылки на изображения для промо-акций для добавленного языка::

       fn_promotions_update_language_post($language_data)
       
#. Удаляет изображения для промо-акций для удаленных языков::

       fn_promotions_delete_languages_post($deleted_lang_codes)
       
#. Удаляет данные об изображении, указанные для промо-акций::

       fn_promotions_delete_image_pre($pair_id)
       
#. Получает информацию о валюте::

       fn_get_currency($currency_id, $lang_code = DESCR_SL)
       
#. Удаляет прикреплённый файл по идентификатору объекта::

       fn_attachments_delete_by_object_id($object_type, $object_id)
       
#. Получает массив путей до директории с импортируемыми прикреплёнными файлами::

       fn_attachments_get_import_attachments_directory($company_id, $path = '') 

#. Проверяет, может ли администратор продавца использовать ``order_management``::

       fn_vendor_privileges_check_permission_order_management()
       
#. Сохраняет данные о пользовательских полях профиля::

       fn_store_user_profile_fields(array $profile_data, $object_id, $object_type, $ship_to_another = false)
       
#. Получает данные о текущей витрине::

       \Tygh\Providers\StorefrontProvider::getStorefront()
       
#. Получает данные о репозитории витрины::

       \Tygh\Providers\StorefrontProvider::getRepository()

#. Стирает все значения настроек для витрины::

       \Tygh\Settings::removeStorefrontSettings($storefront_id)

#. Стирает все значения настроек, привязанные к компании или витрине::

       \Tygh\Settings::resetAllOverrides($object_id)

#. Проверяет, может ли настройка быть переопределена для каждой витрины или для каждой компании::

       \Tygh\Settings::areOverriddenValuesSupportedByEdition($edition_type) 

#. Определяет, будет ли показана панель администратора::

       fn_is_bottom_panel_available($auth)

#. Определяет, может ли авторизованный пользователь активировать редактор тем::

       fn_is_theme_editor_available_for_user($auth)

#. Подготавливает данные для нижней панели::

       fn_prepare_bottom_panel_data()
       
       
------------------       
Устаревшие функции
------------------

#. ::

       // Устаревшая функция:
       \Tygh\Addons\ProductVariations\Service::onChangedProductQuantityInZero()
       // Что использовать вместо неё:
       \Tygh\Addons\ProductVariations\Service::onChangedProductQuantity
       
#. ::

       // Устаревшая функция:
       fn_get_avail_product_features
       // Что использовать вместо неё:
       fn_get_product_features
       
#. ``fn_filter_product_data``
       
#. ``fn_filters_not_found_notification``
       
#. ::       
       
       // Устаревшая функция:
       fn_send_return_mail
       // Что использовать вместо неё:
       fn_rma_send_notification
       
#. ::       
       
       // Устаревшая функция:
       \Tygh\Settings::resetAllVendorsSettings
       // Что использовать вместо неё:
       \Tygh\Settings::resetAllOverrides
       
#. ::       
       
       // Устаревшая функция:
       fn_array_column
       // Что использовать вместо неё:
       array_column
       

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется перед отправкой уведомления о создании новой отгрузки. Позволяет менять данные об отгрузке в уведомлении::

       fn_set_hook('update_shipment_before_send_notification', $shipment_data, $shipment_id, $group_key, $all_products, $force_notification, $order_info, $shipment);
       
#. Выполняется перед выбором существующего варианта характеристики по имени::

       fn_set_hook('update_product_feature_variant_before_select', $feature_id, $feature_type, $variant, $lang_code, $fields, $joins, $conditions, $limit);
       
#. Выполняется после того, как определены параметры ``display_language`` и ``description_language``, непосредственно перед их установкой. Позволяет изменять используемые языки и список доступных языков::

       fn_set_hook('init_language_post', $params, $area, $default_language, $session_display_language, $avail_languages, $display_language, $description_language, $browser_language); 

#. Меняет параметры выборки компаний::

       fn_set_hook('get_companies_pre', $params, $items_per_page, $lang_code); 

#. Позволяет расширять данные в нижней панели::

       fn_set_hook('prepare_bottom_panel_data', $bottom_panel_data);
       
#. Добавляет дополнительные данные об активности продавцов на панель инструментов::

       fn_set_hook('dashboard_get_vendor_activities_post', $timestamp_from, $timestamp_to, $dashboard_vendors_activity);
       
#. Выполняется, когда рассчитана стоимость содержимого корзины, после расчета стоимости доставки. Позволяет менять корзину и список способов доставки::

       fn_set_hook('calculate_cart_content_after_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $lang_code, $area, $cart_products, $product_groups);
       
#. POST-хук для обновления фильтра товаров::

       fn_set_hook('update_product_filter_post', $filter_data, $filter_id, $lang_code, $create);

#. Изменяет сообщение перед его конвертированием::

       fn_set_hook('message_style_formatter_convert_pre', $message, $inline_css);

#. Изменяет сообщение после его конвертирования::

       fn_set_hook('message_style_formatter_convert_post', $message); 


---------------       
Устаревшие хуки
---------------

#. ::

       // Устаревший хук:
       get_avail_product_features_pre
       // Что использовать вместо него:
       get_product_features_pre
       
#. ::

       // Устаревший хук:
       get_avail_product_features_post
       // Что использовать вместо него:
       get_product_features_post
      
#. ``get_avail_product_features_before_select``
       
#. ``filter_product_data``
       
#. ``update_product_filter``
       
       
---------------       
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('get_orders_totals', $paid_statuses, $join, $condition, $group);
       // Стало:
       fn_set_hook('get_orders_totals', $paid_statuses, $join, $condition, $group, $totals);
       
#. ::       
       
       // Было:
       fn_set_hook('settings_update_value_by_id_pre', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);
       // Стало:
       fn_set_hook('settings_update_value_by_id_pre', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table, $storefront_id);
       
#. ::       
       
       // Было:
       fn_set_hook('settings_update_value_by_id_post', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table);
       // Стало:
       fn_set_hook('settings_update_value_by_id_post', $this, $object_id, $value, $company_id, $execute_functions, $data, $old_data, $table, $storefront_id);
       
#. ::       
       
       // Было:
       fn_set_hook('get_product_data_pre', $product_id, $auth, $lang_code, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition);
       // Стало:
       fn_set_hook('get_product_data_pre', $product_id, $auth, $lang_code, $field_list, $get_add_pairs, $get_main_pair, $get_taxes, $get_qty_discounts, $preview, $features, $skip_company_condition, $params);
       
#. ::       
       
       // Было:
       fn_set_hook('pre_get_cart_product_data', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $fields, $join);
       // Стало:
       fn_set_hook('pre_get_cart_product_data', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $fields, $join, $params);
       
       
#. ::       
       
       // Было:
       fn_set_hook('delete_discussion_pre', $object_id, $object_type);
       // Стало:
       fn_set_hook('delete_discussion_pre', $object_id, $object_type, $company_id);
       
#. ::       
       
       // Было:
       fn_set_hook('delete_discussion_post', $object_id, $object_type, $is_deleted);
       // Стало:
       fn_set_hook('delete_discussion_post', $object_id, $object_type, $is_deleted, $company_id);
       

--------------
Удалённые хуки
--------------

#. ``fn_set_hook('delete_product_option_combinations', $product_id);``

#. ``fn_set_hook('look_through_variants_pre', $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('look_through_variants_update_combination', $combination, $_data, $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('look_through_variants_post', $combinations, $product_id, $amount, $options, $variants);``

#. ``fn_set_hook('rebuild_product_options_inventory_pre', $product_id, $amount);``

#. ``fn_set_hook('rebuild_product_options_inventory_post', $product_id);``

#. ``fn_set_hook('clone_options_inventory_pre', $from_product_id, $to_product_id, $options, $variants);``

#. ``fn_set_hook('clone_options_inventory_post', $from_product_id, $to_product_id, $options, $variants);``

#. ``fn_set_hook('get_product_options_inventory_pre', $params, $items_per_page, $lang_code);``

#. ``fn_set_hook('get_product_options_inventory_post', $params, $items_per_page, $lang_code, $inventory);``

#. ``fn_set_hook('get_product_options_combination_data_post', $combination_hash, $combination);``

#. ``fn_set_hook('update_option_combination_pre', $combination_data, $combination_hash);``

#. ``fn_set_hook('update_option_combination_post', $combination_data, $combination_hash, $inventory_amount);``

#. ``fn_set_hook('delete_option_combination_pre', $combination_hash);``