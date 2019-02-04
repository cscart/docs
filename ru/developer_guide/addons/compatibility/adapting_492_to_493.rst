******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.9.3
******************************************************

===============
Общие изменения
===============

* Функция JavaScript ``$.scrollToElm`` теперь реагирует на атрибут ``data-ca-scroll-to-elm-delay`` тега ``<body>``; если атрибут не указан, то будет использоваться значение, заданное в коде по умолчанию.

* Плагин JavaScript ``$.ceAccordion`` теперь реагирует на атрибут ``data-ca-accordion-animate-delay`` тега ``<body>``; если атрибут не указан, то будет использоваться значение из атрибута ``params``, а если и его нет, то будет использоваться значение, заданное в коде по умолчанию.

* Микроформат ``cm-multiple-radios/cm-multiple-checkboxes`` теперь принимает значение сообщения об ошибке валидации из атрибута тега ``<label>``, к которому применён микроформат. Если атрибут не указан, то будет использоваться стандартное сообщение об ошибке валидации.

-----------------------------------------------------
Пропуск резервного копирования при обновлении модулей
-----------------------------------------------------

Если ваш модуль :doc:`можно обновлять через Центр обновлений </upgrade/upgrade_addon>` (а мы очень это рекомендуем), то теперь вы сможете позволить клиентам пропустить резервное копирование файлов и базы данных при обновлении вашего модуля. Так обновление пройдёт намного быстрее.

Чтобы владельцы магазинов могли пропустить резервное копирование, добавьте раздел ``backup`` в схему **package.json** пакета обновлений:

.. code-block:: json

    "files":      {...},
    "migrations": [...],
    "languages":  [...],
    "validators": [...],
    "scripts":    {...},
    "backup": {
        "is_skippable": true,
        "skip_by_default": true
    }


* ``is_skippable`` указывает, что резервное копирование можно пропустить. Если поставить *true* или пропустить это поле, при обновлении модуля появится возможность пропустить резервное копирование, а у пользователя будет выбор, сделать ли это.

* ``skip_by_default`` указывает, что по умолчанию выбран именно пропуск обновления. Обратите внимание, что владельцы магазинов всё равно смогут выбрать, нужно ли создать резервную копию.

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук выполняется после того, как получены идентификаторы доставок компании, и позволяет вам поменять их::

     fn_set_hook('shippings_get_company_shipping_ids', $company_id, $shipping_ids);

#. Этот хук выполняется при расчёте содержимого корзины, перед расчётом стоимости доставки. Хук позволяет вам менять состояние корзины::

     fn_set_hook('calculate_cart_content_before_shipping_calculation', $cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions);

#. Этот хук выполняется перед разбиением товаров в корзине по продавцам, после того, как у товара определился идентификатор компании. Хук позволяет вам изменить идентификатор компании товара::

     fn_set_hook('direct_payments_cart_service_get_group_products_get_company_id', $products_data, $key, $item, $vendor_id)` - 

---------------
Изменённые хуки
---------------

#.

   ::

     // Было:
     fn_set_hook('usergroup_types_get_list', $types);

     // Стало:
     fn_set_hook('usergroup_types_get_list', $types, $exclude);

#.

  ::

    // Было:
    fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $variant_ids);

    // Стало:
    fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $variant_ids, $selected_options);

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Удаляет все логи:: 

     fn_cleanup_all_logs($company_id = null)

#. Удаляет старые логи::

     fn_cleanup_old_logs($company_id = null)

#. Генерирует иконки указанных размеров::

     fn_storefront_rest_api_generate_icons($image_data, $sizes)

#. Добавляет иконки для главного и дополнительных изображений одного товара::

     fn_storefront_rest_api_set_product_icons(array $product, array $sizes)

#. Добавляет иконки для главного и дополнительного изображения нескольких товаров::

     fn_storefront_rest_api_set_products_icons(array $products, array $sizes)

#. Добавляет иконки для изображения одной категории::

     fn_storefront_rest_api_set_category_icons(array $category, array $sizes)

#. Добавляет иконки для изображений нескольких категорий::

     fn_storefront_rest_api_set_categories_icons(array $categories, array $sizes)

#. Добавляет иконки для изображения одного баннера::

     fn_storefront_rest_api_set_banner_icons(array $banner, array $sizes)

#. Добавляет иконки для изображений нескольких баннеров::

     fn_storefront_rest_api_set_banners_icons(array $banners, array $sizes)

#. Получает тег вызова документа (значение столбца **Код** на странице **Дизайн → Документы**)::

     \Tygh\Template\Document\Document::getCallTag()

#. Предоставляет код для встраивания определённоего документа в шаблон email-уведомления::

     \Tygh\Template\Document\Document::getFullCode()

#. Возвращает шаблоны с содержимым, которое соответствует указанным критериям::

     \Tygh\Template\Mail\Repository::findByContent($criteria)

#. Форматирует строку с названием данных о налоге, удаляя символы, которые могут вызвать ошибки::

      fn_rus_payments_payanyway_format_item_name($name)

#. Клонирует значения характеристик товара из таблицы ``?:product_features_values``::

     \Tygh\Addons\MasterProducts\Product\Manager::cloneProductFeaturesValues($master_product_id, $vendor_product_id)

#. Задаёт цену самого дешёвого товарного предложения от продавца как отображаемую цену общего товара::

     \Tygh\Addons\MasterProducts\Product\Manager::actualizeMasterProductPrice($master_product_id)

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    function fn_yandex_metrika_rest_client($type, $url, array $data = [])

    // Стало:
    function fn_yandex_metrika_rest_client($type, $url, array $data = [], array $headers = [])

#.

  ::

    // Было:
    \Tygh\Enum\UsergroupTypes::getList()

    // Стало:
    \Tygh\Enum\UsergroupTypes::getList(array $exclude = [])

#.

  ::

    // Было:
    \Tygh\Addons\MasterProducts\Product\Manager::getVendorProductIds($master_product_id)

    // Стало:
    \Tygh\Addons\MasterProducts\Product\Manager::getVendorProductIds($master_product_id, array $status = null)
