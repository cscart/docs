*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.13.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===============
Общие изменения
===============

----------------------------
Изменения в контекстном меню
----------------------------

Добавлен единый механизм создания контекстного меню, основанный на схемах. Примеры реализации: ``app/schemas/context_menu/profiles.php``

Схема контекстного меню имеет следующую структуру::

	[
	    'selectable_statuses' => array<string, string>                                                                             // Список статусов для выделения элементов.
	    'items'               => [                                                                                                 // Список элементов контекстного меню.
	        'status'  => [                                                                                                         // Идентификатор элемента.
	            'name'              => ['template' => 'status'],                                                                   // Название элемента.
	            'type'              => GroupItem::class,                                                                           // Тип элемента (ActionItem/GroupItem/ComponentItem).
	            'data'              => [                                                                                           // Данные для передачи в шаблон. В шаблоне обращаться через $data.
	                'menu_item_class' => 'cm-no-hide-input',                                                                       // menu_item_attributes, menu_item_class, action_attributes, action_class - используется в общих шаблонах.
	                ...
	            ],
	            'items'             => [                                                                                           // Список вложенных элементов в GroupItem.
	                'm_activate' => [                                                                                              // Элемент-ссылка.
	                    'name'          => [
	                        'template' => 'change_to_status',
	                        'params'   => [
	                            '[status]' => __('active'),
	                            ...
	                        ],
	                    ],
	                    'dispatch' => 'profiles.m_activate',                                                                       // Диспатч, на который будут переданы идентификаторы выделенных элементов; диспатч также используется при проверке доступности элемента текущему пользователю.
	                    'position' => 10,                                                                                          // Позиция элемента в списке.
	                ],
	                'actions_divider'   => [                                                                                       // Элемент-разделитель.
	                    'type'     => DividerItem::class,                                                                          // Тип вложенного в GroupItem элемента (GroupActionItem/ComponentItem/DividerItem). По умолчанию тип элемента GroupActionItem.
	                    'position' => 20,
	                ],
	                'notify_checkboxes' => [                                                                                       // Элемент с собственным шаблоном.
	                    'type'          => ComponentItem::class,
	                    'template'      => 'views/profiles/components/context_menu/notify_checkboxes.tpl',                         // Собственный шаблон элемента ComponentItem.
	                    'data_provider' => static function () {                                                                    // Call-back функция для формирования данных для передачи в шаблон. В шаблоне обращаться через $data.
	                        return [
	                            'param1' => 'value2',
	                            ...
	                        ];
	                    },
	                    'position'      => 30,
	                ],
	                ...
	            ],
	            'permission_callback' => static function ($request, $auth, $runtime) {                                             // Callback функция для проверки доступности элемента.
	                return !(
	                    UserTypes::isVendor($auth['user_type'])
	                    && UserTypes::isCustomer($request['user_type'])
	                    && fn_check_permissions('profiles', 'm_activate', 'admin', 'POST', ['user_type' => $request['user_type']])
	                    && fn_check_permissions('profiles', 'm_disable', 'admin', 'POST', ['user_type' => $request['user_type']])
	                );
	            },
	            'position'            => 20,
	        ],
	        ...
	    ],
	]

================
Изменения в ядре
================

-----------------
Изменённые классы
-----------------

#. ::

       // Было:
       \XMLDocument
       // Стало:
       \XMLDocument\XMLDocument

#. ::

       // Было:
       \XMLParser
       // Стало:
       \XMLDocument\XMLParser

-------------
Новые функции
-------------

#. Выполняет действие в рамках компании с указанным идентификатором::

       \fn_execute_as_company(callable $action, $company_id)
       
#. Получает экземпляр диспетчера событий::

       \Tygh\Providers\EventDispatcherProvider::getEventDispatcher()

#. Получает экземпляр фабрики классов для настроек уведомлений::

       \Tygh\Providers\EventDispatcherProvider::getNotificationSettingsFactory()

#. Получает встроенный лицензионный номер модуля, загруженного из Маркетплейса::

       \Tygh\Addons\XmlScheme3::getMarketplaceLicenseNumber()

====================
Изменения в шаблонах
====================

-------------------------
Удалённые хуки в шаблонах
-------------------------

#. ``import_presets:bulk_edit``

#. ``import_presets:bulk_edit_items``

#. ``import_presets:bulk_edit_actions``

#. ``banners:bulk_edit``

#. ``banners:bulk_edit_items``

#. ``data_feeds:bulk_edit``

#. ``data_feeds:bulk_edit_items``

#. ``em_subscribers:bulk_edit``

#. ``em_subscribers:bulk_edit_items``

#. ``reward_points:bulk_edit``

#. ``reward_points:bulk_edit_items``

#. ``reward_points:bulk_edit_actions``

#. ``seo_redirects:bulk_edit``

#. ``seo_redirects:bulk_edit_items``

#. ``seo_rules:bulk_edit``

#. ``seo_rules:bulk_edit_items``

#. ``seo_rules:context_menu``

#. ``tags:bulk_edit``

#. ``tags:bulk_edit_items``

#. ``tags:bulk_edit_actions``

#. ``block_manager:bulk_edit``

#. ``block_manager:bulk_edit_items``

#. ``block_manager:bulk_edit_actions``

#. ``cart:bulk_edit``

#. ``cart:bulk_edit_items``

#. ``cart:bulk_edit_actions``

#. ``categories:bulk_edit``

#. ``categories:bulk_edit_items``

#. ``products:bulk_edit``

#. ``companies:bulk_edit_items``

#. ``countries:bulk_edit``

#. ``countries:bulk_edit_items``

#. ``datakeeper:bulk_edit``

#. ``datakeeper:bulk_edit_items``

#. ``datakeeper:bulk_edit_actions``

#. ``destinations:bulk_edit``

#. ``destinations:bulk_edit_items``

#. ``documents:bulk_edit``

#. ``documents:bulk_edit_items``

#. ``documents:bulk_edit_actions``

#. ``languages:bulk_edit``

#. ``languages:bulk_edit_items``

#. ``languages:bulk_edit_actions``

#. ``orders:bulk_edit``

#. ``orders:bulk_edit_items``

#. ``orders:view_tools_list_for_selected``

#. ``orders:export_tools_list_for_selected``

#. ``orders:list_tools_for_selected``

#. ``pages:bulk_edit``

#. ``pages:bulk_edit_items``

#. ``pages:bulk_edit_actions``

#. ``product_features:bulk_edit``

#. ``product_features:bulk_edit_items``

#. ``product_options:bulk_edit``

#. ``product_options:bulk_edit_items``

#. ``products:bulk_edit``

#. ``products:bulk_edit_items``

#. ``products:bulk_edit_actions``

#. ``profiles:bulk_edit``

#. ``profiles:bulk_edit_items``

#. ``profiles:view_tools_list_for_selected``

#. ``profiles:export_tools_list_for_selected``

#. ``profiles:list_tools_for_selected``

#. ``promotions:bulk_edit_items``

#. ``shipments:bulk_edit``

#. ``shipments:bulk_edit_items``

#. ``shipments:bulk_edit_actions``

#. ``shippings:bulk_edit``

#. ``shippings:bulk_edit_items``

#. ``states:bulk_edit_items``

#. ``taxes:bulk_edit``

#. ``taxes:bulk_edit_items``

#. ``taxes:bulk_edit_actions``

#. ``usergroups:bulk_edit``

#. ``usergroups:bulk_edit_items``

---------------------
Новые хуки в шаблонах
---------------------

#. ``import_presets:context_menu``

#. ``banners:context_menu``

#. ``data_feeds:context_menu``

#. ``em_subscribers:context_menu``

#. ``reward_points:context_menu``

#. ``seo_redirects:context_menu``

#. ``tags:context_menu``

#. ``block_manager:context_menu``

#. ``cart:context_menu``

#. ``categories:context_menu``

#. ``companies:context_menu``

#. ``countries:context_menu``

#. ``datakeeper:context_menu``

#. ``destinations:context_menu``

#. ``documents:context_menu``

#. ``languages:context_menu``

#. ``orders:context_menu``

#. ``pages:context_menu``

#. ``product_features:context_menu``

#. ``product_options:context_menu``

#. ``products:context_menu``

#. ``profiles.context_menu``

#. ``promotions:context_menu``

#. ``shipments:context_menu``

#. ``shippings:context_menu``

#. ``states:context_menu``

#. ``taxes:context_menu``

#. ``usergroups:context_menu``

=================
Изменения в хуках
=================

---------------
Измененные хуки
---------------

#. ::

       // Было:
       fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions);
       // Стало:
       fn_set_hook('promotion_apply_before_get_promotions', $zone, $data, $auth, $cart_products, $promotions, $applied_promotions, $get_promotions_params);

#. ::

       // Было:
       fn_set_hook('get_profile_fields', $location, $select, $condition);
       // Стало:
       fn_set_hook('get_profile_fields', $location, $select, $condition, $params);

----------
Новые хуки
----------

#. Выполняется перед созданием отзыва. Позволяет изменять аргументы, переданные методу::

       fn_set_hook('product_reviews_create_pre', $product_review_data);

#. Выполняется после проверки на то, имеет ли пользователь право оставить отзыв. Позволяет изменять аргументы, переданные методу::

       fn_set_hook('product_reviews_is_user_eligible_to_write_product_review', $user_id, $product_id, $ip, $need_to_buy_first, $review_ip_check, $result);

#. Выполняется перед получением упрощенного списка групп пользователей из базы данных. Позволяет изменять параметры запроса::

       fn_set_hook('get_simple_usergroups', $type, $get_default, $lang_code, $where);

#. Выполняется перед получением информации о промо-акциии. Позволяет изменять параметры, переданные методу::

       fn_set_hook('get_promotion_data_pre', $promotion_id, $lang_code, $extra_condition);

#. Позволяет заменить значения экспортированных полей "Доступность товаров"::

       fn_set_hook('export_product_availability', $availability, $export_type);

#. Выполняется после получения данных пользователя для создания заказа через API-запрос. Позволяет изменять данные пользователя корзины::

       fn_set_hook('api_orders_create_after_get_user_data', $params, $status, $data, $valid_params, $auth, $cart);

#. Выполняется после того, как идентификатор компании заменен на новый. Позволяет производить дополнительные действия над глобальным состоянием магазина на момент обработки запроса::

       fn_set_hook('execute_as_company_after_set_company_id', $action, $company_id);

#. Выполняется после того, как идентификатор компании был восстановлен. Позволяет производить дополнительные действия над глобальным состоянием магазина на момент обработки запроса::

       fn_set_hook('execute_as_company_after_restore_company_id', $action, $company_id);

#. Выполняется после получения информации из базы данных. Позволяет изменять данные::

       fn_set_hook('shippings_get_shipping_for_test_post', $shipping_info);

#. Выполняется после того, как был сформирован список сопоставлений расширений  и типов файлов::

       fn_set_hook('get_ext_mime_types', $key, $types);