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

В 4.16.1 появляется новый модуль "Города" (**cities**). В этой версии модуль скрыт из списка модулей. Это значит, что он не появится в панели администратора, и клиенты о нём не узнают. Но вы можете установить модуль через консоль::

  cd /path/to/store
  php admin.php -p --dispatch=addons.install --addon=cities

В версии 4.17.1 модуль **rus_cities** станет недоступен, его заменит единый модуль для русской и для международной версии **cities**. Мы планируем переход на новый модуль плавно, чтобы у вас было время обновить всё не спеша. Пока мы перенсли базу городов из модуля **rus_cities** в модуль **cities**.

При переходе на новый модуль **cities** стоит учесть изменения в названиях функций в своем коде: *rus_cities* меняется на *cities*. Поменяйте имена следующих функций, т.к. их названия приведены к стандарту, и при замене с помощью поиска могут возникнуть проблемы::

  fn_get_cities -> fn_cities_get_cities
  fn_update_city -> fn_cities_update_city
  fn_rus_city_get_city_data -> fn_cities_get_city_data

================
Изменения в ядре
================

----------------------------------------------------
HTML-блок с поддержкой Smarty помечен как устаревший
----------------------------------------------------

В CS-Cart есть HTML-блок с поддержкой Smarty, который позволяет добавлять на страницы Smarty-код. Однако существующие блоки были небезопасны, поэтому в 4.16.1 мы добавили новые безопасные блоки. При этом после обновления блоки будут работать, но вы не сможете обновить их контент. Если хотите использовать в новом блоке дополнительные функции, расширьте схему ``block_manager/smarty_allowed_functions.php``.

Используйте новые тип и шаблон блока:

* тип: ``safe_smarty_block``;
* шаблон: ``blocks/safe_smarty_block.tpl``. 

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
