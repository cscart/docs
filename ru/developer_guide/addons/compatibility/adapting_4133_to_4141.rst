*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.14.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===============
Общие изменения
===============

--------------------------------------
Модуль "Конфигуратор панели продавцов"
--------------------------------------

Новый модуль упрощает панель продавцов и позволяет скрывать необязательные поля и вкладки на странице редактирования товаров. Меню и страница редактирования товара в панели продавцов расширяются, когда администратор маркетплейса устанавливает некоторые модули.

Изменения в меню
----------------

После установки модуля меню в панели продавцов упрощается. Поэтому, когда в главном меню есть только один дочерний элемент, то в новой панели продавцов он выносится на один уровень с главными элементами меню. Если нужно, чтобы ваш модуль менял что-то в новой панели продавца, то потребуются дополнительные действия для обеспечения его совместимости с "Конфигуратором панели продавцов":

#. Расширьте схему ``menu/menu_vendor.php``, продублировав в ней необходимые пункты меню из расширения схемы ``menu/menu.php``.

#. Добавьте свойство ``root_title``для пунктов меню. В свойстве пропишите текст вместо ``title`` для обозначения названия пункта меню в виде ссылки верхнего уровня.

Существующее расширение для панели администратора ``menu.post.php``::

  <?php

  $schema['central']['orders']['items']['tracking'] = [
      'position' => 100,
      'title' => __('tracking.manage_track_numbers'),
      'href' => 'track_numbers.manage',
  ];

  return $schema;

Новое расширение для панели продавца ``menu_vendor.post.php``::

  <?php

  $schema['central']['orders']['items']['tracking'] = [
      'position' => 100,
      'title' => __('tracking.track_numbers'),
      'href' => 'track_numbers.manage',
  ];

  return $schema;

Изменения на странице редактирования товара
-------------------------------------------

После установки модуля администратор может скрыть для продавца необязательные поля и вкладки на странице редактирования товара. Если ваш модуль добавляет новые вкладки и поля на страницу редактирования товара, то для обеспечения его совместимости с "Конфигуратором панели продавцов":

#. Расширьте схему ``products/page_configuration.php``, добавив в нее вкладки своего модуля. Укажите, можно ли скрывать эти вкладки (свойство ``is_optional``)::

     <?php

     $schema['stickers'] = [
         'position'    => 2000,
         'title'       => 'stickers.stickers',
         'is_optional' => true,
     ];
   
     return $schema;

#. Расширьте схему ``products/page_configuration.php``, добавив в нее определение своих полей товаров. Укажите, можно ли скрывать эти поля (свойство ``is_optional``)::

     <?php

     $schema['detailed']['sections']['information']['fields']['enable_stickers'] = [
         'is_optional' => false,
         'title' => 'stickers.enable_stickers',
         'position' => 100
     ];

     return $schema

#. В хуке шаблона, который выводит поле, оберните поле в компонент ``configurable_page.field`` и укажите вкладку, секцию и название поля::

    {component name="configurable_page.field" entity="products" tab="detailed" section="information" field="enable_stickers"}
        <div class="control-group">
            <label for="product_enable_stickers" class="control-label">{__("stickers.enable_stickers")}</label>
            <div class="controls">
                <input type="hidden" name="product_data[enable_stickers]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox"
                       name="product_data[enable_stickers]"
                       id="product_enable_stickers"
                       value="{"YesNo::YES"|enum}"
                       {if $product_data.enable_stickers === "YesNo::YES"|enum}
                           checked="checked"
                       {/if}
                />
            </div>
        </div>
    {/component}

--------------------
Предзагрузка шрифтов
--------------------

Появилась нативная предзагрузка шрифтов для тем на витрине. Автоматически предзагружается один шрифт, который найден в скомпилированном CSS магазина. Предпочтение отдается шрифтам, которые заданы в редакторе тем для *Основного содержимого*, *Заголовков* и *Ссылок*. Если ваша тема не поддерживает редактор тем, шрифты располагаются в порядке появления в CSS. 

Для ручного управления приоритизацией, задайте свойство ``--preload-priority`` при определении ``@font-face``. Чем меньше значение свойства, тем выше шрифт будет в списке шрифтов на предзагрузку, т.е выше вероятность его предзагрузки::

  @font-face {
    font-family: 'Open Sans';
    font-style: normal;
    font-weight: normal;
    font-display: swap;
    src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v20/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
    --preload-priority: 1;
  }

----------------------------
Идентификаторы групп товаров
----------------------------

Теперь при изменении набора товаров в корзине, товары перераспределяются в группах товаров по ключу ``group_key`` (:ref:`см. fn_calculate_cart_content <ru-cartcontent-4141>`).

Модуль "Поставщики" разделяет товары на группы по продавцам и поставщикам. Если вы делите товары на подобные группы, тогда в каждую группу товаров добавьте уникальный ``group_key``. 

Например: ``Shippings::groupProductsList`` и ``fn_suppliers_shippings_group_products_list``.

----------------
Шрифтовые иконки
----------------

Теперь добавление иконки на страницу выполняется с помощью шаблона ``common/icon.tpl`` вместо тега ``<i>```. Изменения сделаны для соответствия стандарту WCAG 2.0.

================
Изменения в ядре
================

-----------------
Изменённые классы
-----------------

#. ::

       // Было:
       \Tygh\Enum\Addons\Rma\InventoryOperations
       // Стало:
       \Tygh\Enum\InventoryOperations

------------
Новые классы
------------

#. ``\Tygh\Enum\FontSubset`` — содержит определение диапазона символов Unicode, используемого Google Fonts для разделения начертаний шрифтов.

#. ``\Tygh\Enum\FontType`` — содержит типы шрифтов.

#. ``\Tygh\Enum\FontWeight`` — содержит насыщенность шрифтов и их представление в цифровой форме.

#. ``\Tygh\Enum\OrderStatuses`` — содержит список статусов заказов.

------------------
Изменённые функции
------------------

#. ::

       // Было:
       fn_merge_styles(array $files, $styles = '', $prepend_prefix = '', array $params = [], $area = AREA)
       // Стало:
       fn_merge_styles(array $files, $styles = '', $prepend_prefix = '', array $params = [], $area = AREA, $is_local_path_required = false)

#. ::

       // Было:
       fn_exim_find_feature($name, $type, $group_id, $lang_code, $company_id = null)
       // Стало:
       fn_exim_find_feature($name, $type, $group_id, $lang_code, $company_id = null, $field_name = 'internal_name')

#. ::

       // Было:
       fn_exim_build_option_data($option, $option_id, $variant_ids, $lang_code)
       // Стало:
       fn_exim_build_option_data(array $option, $option_id, array $variant_ids, $lang_code, $field_name = 'internal_option_name')

#. ::

       // Было:
       \Tygh\Addons\ProductReviews\ProductReview\ImagesService::__construct__construct($max_images_upload = 10)
       // Стало:
       \Tygh\Addons\ProductReviews\ProductReview\ImagesService::__construct__construct(array $allowed_extensions, $max_images_upload = 10)

#. ::

       // Было:
       function fn_warehouses_get_availability_summary($product_id, $destination_id, $lang_code = CART_LANGUAGE)
       // Стало:
       function fn_warehouses_get_availability_summary($product_id, $destination_id, $lang_code = CART_LANGUAGE, $amount = null)

-------------
Новые функции
-------------

#. Проверяет, доступна ли доставка для всех новых продавцов::

     Tygh\Shippings\Shippings::isAvailableForNewVendors(array $shipping)

#. Получает ID доставок, которые становятся автоматически доступными для новых продавцов::

     Tygh\Shippings\Shippings::getShippingIdsAvailableForNewVendors($active_only)

#. Получает настройки оформления заказа::

     fn_get_checkout_settings($cart)

#. Получает тип характеристики по её ID::

     fn_get_product_feature_type_by_feature_id($feature_id)

#. Получает типы характеристик по их ID::

     fn_get_product_feature_types_by_feature_ids(array $feature_ids)

#. Проверяет, включены ли уведомления о товаре::

     fn_check_product_notification_setting($product_id, $user_id, $email)

#. Определяет ID опции по параметрам::

     fn_find_product_option_id($product_id, array $option, $global_option, $lang_code, $company_id = null, $field_name = 'internal_option_name')

#. Получает условия поиска продавцов::

     fn_get_default_vendor_notification_search_conditions($with_default_email_field = false)

=================
Изменения в хуках
=================

---------------
Изменённые хуки
---------------

#. ::

       // Было:
       fn_set_hook('init_user_session_data', $sess_data, $user_id);
       // Стало:
       fn_set_hook('init_user_session_data', $sess_data, $user_id, $skip_cart_saving);

#. ::

       // Было:
       fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions);
       // Стало:
       fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions, $this);

----------
Новые хуки
----------

#. Выполняется при создании пунктов меню после обработки отдельной группы меню. Позволяет менять созданное меню:: 

     fn_set_hook('backend_menu_generate_after_process_item', $group, $root, $items);

#. Выполняется при определении схемы для загрузки меню. Позволяет менять источник меню::

     fn_set_hook('backend_menu_get_schema_name_post', $menu_schema_name);

#. Выполняется перед выводом настраиваемого поля страницы. Позволяет менять поле, чтобы удалить его со страницы или скрыть::

     fn_set_hook('smarty_component_configurable_page_field_before_output', $entity, $tab, $section, $field, $field_config, $params, $content, $template);

#. Выполняется перед выводом настраиваемого раздела страницы. Позволяет менять раздел, чтобы удалить его со страницы или скрыть::

     fn_set_hook('smarty_component_configurable_page_section_before_output', $entity, $tab, $section, $section_config, $params, $content, $template);

#. Выполняется после определения подмножества начертаний шрифтов, используемых в языке. Позволяет добавлять или удалять начертания::

     fn_set_hook('font_subset_get_by_language_usage_post', $language_code, $subsets);

#. Выполняется при создании стиля ссылок перед созданием предварительно загруженных ссылок. Позволяет добавлять или удалять ресурсы для предзагрузки::

     fn_set_hook('block_styles_before_build_preload_links', $params, $content, $preloaded_resources);

#. Выполняется после получения информации о том, какие способы доставки должны включаться для новых продавцов по умолчанию::

     fn_set_hook('get_shipping_ids_available_for_new_vendors_post', $data);

#. Выполняется перед SQL запросом::

     fn_set_hook('get_shippings', $fields, $conditions, $lang_code);

#. Выполняется после определения статуса заказов, доставляемых маркетплейсом. Позволяет редактировать такие статусы::

     fn_set_hook('what_companies_orders_are_fulfilled_by_marketplace', $fulfilled_company_ids);

#. Выполняется после пополнения баланса, когда сумма меньше минимальной суммы заказа. Позволяет менять минимальную сумму заказа::

     fn_set_hook('get_checkout_settings_post', $cart, $checkout_settings); 

#. Выполняется при создании выплаты продавцу перед изменением статуса заказа. Позволяет менять параметры выплаты продавцу::

     fn_set_hook('direct_payments_change_order_status_before_create_vendor_payout', $order_info, $payouts); 

--------------------
Устаревшие константы
--------------------

* ``STATUS_INCOMPLETED_ORDER``

* ``STATUS_PARENT_ORDER``

* ``STATUS_BACKORDERED_ORDER``

* ``STATUS_CANCELED_ORDER``