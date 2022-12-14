*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.16.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===================
Изменения в модулях
===================

---------------
Модуль "Города"
---------------

В 4.16.1 появляется новый модуль "Города" (**cities**). В этой версии модуль скрыт из списка модулей в панели администратора, но вы можете установить его в консольном режиме::

  cd /path/to/store

::

  php admin.php -p --dispatch=addons.install --addon=cities

В версии 4.17.1 модуль **rus_cities** станет не доступен, его заменит единый модуль для русской и для международной версии **cities**. База городов из модуля **rus_cities** уже перенесена в модуль **cities**.

При переходе на новый модуль **cities** стоит учесть изменения в названиях функций в своем коде: *rus_cities* меняется на *cities*. Названия следующих функций приведены к стандарту, и при замене с помощью поиска могут возниктуть проблемы::

  fn_get_cities -> fn_cities_get_cities
  fn_update_city -> fn_cities_update_city
  fn_rus_city_get_city_data -> fn_cities_get_city_data

================
Изменения в ядре
================

-------------------------------------
HTML блок с поддержкой Smarty устарел
-------------------------------------

Устаревший блок будет конвертирован в безопасный блок, если попытаться создать его через импорт макета. Используйте тип и шаблон нового блока вместо устаревшего: тип — ``safe_smarty_block``, шаблон — ``blocks/safe_smarty_block.tpl``. Для подключения дополнительных функций в новом блоке необходимо расширить схему ``block_manager/smarty_allowed_functions.php``.

Блоки созданные до обновления продолжат корректно работать, но обновить их контент будет невозможно.

-------------
Новые функции
-------------

#. Массово обновляет уведомления по параметрам поиска::

       \Tygh\NotificationsCenter\IRepository::bulkUpdate(Notification $notification_template, array $update_fields = [], array $params = []);

#. Получает значение настроек для всех витрин::

       \Tygh\Settings::getAllStorefrontValues($setting_name, $section_name = '');

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется перед сохранением витрины. Позволяет выполнять дополнительные действия::

       fn_set_hook('storefront_repository_save_pre', $storefront, $storefront_data);

#. Получает товар перед получением ссылки на него::

       fn_set_hook('google_sitemap_write_products_to_sitemap_before_getting_link', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $products, $product, $page, $params, $sitemap_items);

#. Получает параметры перед получением товаров::

       fn_set_hook('google_sitemap_write_products_to_sitemap_before_getting_products', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $products, $product, $page, $params);

====================
Изменения в шаблонах
====================

----------
Новые хуки
----------

``menu:storefront_icon``
