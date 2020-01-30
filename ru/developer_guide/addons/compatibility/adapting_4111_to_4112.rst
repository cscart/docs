*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.11.2
*******************************************************

===============
Общие изменения
===============

#. JS: Библиотека Select2 обновлена до версии 4.0.12

=======
Функции
=======

------------
Новые классы
------------

#. ``\Tygh\NotificationsCenter\NotificationBuilders\INotificationBuilder`` — интерфейс INotificationBuilder описывает класс, который отвечает за построение уведомления на сайте на основе параметров.

#. ``\Tygh\NotificationsCenter\NotificationBuilders\DBTemplateNotificationBuilder`` — класс DBTemplateNotificationBuilder создаёт уведомления на сайте на основе Twig-шаблонов из базы данных.

#. ``\Tygh\NotificationsCenter\NotificationBuilders\DefaultNotificationBulder`` — класс DefaultNotificationBulder создаёт уведомление на сайте из их данных.

#. ``\Tygh\Template\Internal\Context`` — класс-контекст для уведомлений на сайте.

#. ``\Tygh\Template\Internal\Exim`` — класс, который реализует логику импорта и экспорта шаблонов уведомлений на сайте.

#. ``\Tygh\Template\Internal\Repository``— класс-репозиторий, который реализует логику взаимодействия с хранилищем для шаблонов уведомлений на сайте.

#. ``\Tygh\Template\Internal\Service``— класс-сервис, который реализует логику управления шаблонами уведомлений на сайте.

#. ``\Tygh\Template\Internal\Template``— класс-сущность шаблона уведомления на сайте.

-------------
Новые функции
-------------

#. Получает количество товаров по компаниям::

     fn_get_companies_active_products_count(array $company_ids = [])

#. Получает пользователя с параметром 'is_root' для указанной компании::

     fn_get_company_root_admin_user_id($company_id)

#. Получает шаблоны уведомлений на сайте::

     \Tygh\Addons\AXmlScheme::getInternalTemplates()
     \Tygh\Addons\XmlScheme3::getInternalTemplates()

#. Получает сборщик уведомлений на сайте::

     \Tygh\NotificationsCenter\IFactory::getNotificationBuilder($type)
     \Tygh\NotificationsCenter\Factory::getNotificationBuilder($type)

#. Получает запросы на возврат товаров::

     fn_rma_get_returns($params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

====
Хуки
====

----------
Новые хуки
----------

#. ``fn_set_hook('vendor_plan_after_delete', $this);`` — выполняется после удаления тарифного плана; позволяет выполнять дополнительные действия со связанными сущностями.

---------------
Изменённые хуки
---------------

#.

  ::

    // Было:
    fn_set_hook('additional_fields_in_search', $params, $fields, $sortings, $condition, $join, $sorting, $group_by, $tmp, $piece, $having)

    // Стало:
    fn_set_hook('additional_fields_in_search', $params, $fields, $sortings, $condition, $join, $sorting, $group_by, $tmp, $piece, $having, $lang_code)

#.


  ::

    // Было:
    fn_set_hook('store_locator_update_store_location_post', $store_location_data, $store_location_id, $lang_code)

    // Стало:
    fn_set_hook('store_locator_update_store_location_post', $store_location_data, $store_location_id, $lang_code, $action)

#.

  ::

    // Было:
    fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code)

    // Стало:
    fn_set_hook('url_post', $_url, $area, $url, $protocol, $company_id_in_url, $lang_code, $locations)
