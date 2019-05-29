*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.10.1
*******************************************************

===============
Общие изменения
===============

#. Удалён устаревший способ оплаты **FuturePay**.

#. Функциональность модуля ``rus_pickup`` (ранее существовавшего только в русской версии) перенесена в модуль ``store_locator``, который теперь называется **Магазины и пункты самовывоза**.

#. Модуль ``rus_customer_geolocation`` был удалён. Его функциональность перешла в новое оформление заказа и в модуль ``geo_maps`` (**Карты и геолокация**).

#. Функциональность поиска по *Новым заказам* удалена вместе с таблицей ``new_orders``.

#. Добавлен новый микроформат ``cm-mask-phone``, который позволяет добавить маску номера телефона к полю. Маска определяется автоматическеи на основе первых цифр вводимого номера.

#. Добавлен новый тип настройки ``L``. Это поле ввода с микроформатом ``cm-mask-phone``.

#. Добавлен новый интерфейс служб доставки ``IPickupService``. Он объявляет методы, которые специфичны для способов доставки с пунктами самовывоза. Метод ``getPickupPoints`` зарезервирован для дальнейшего использования, так как пока нет единой структуры данных для представления списка пунктов самовывоза.

#. Добавлен новый сервис `Tygh::$app['location']`` для работы с текущим местоположением покупателя (страна, штат/область, город, адрес и индекс).

#. Добавлен новый сервис ``Tygh::$app['storefront']`` для получения данных текущей витрины.

   Для управления витринами (создания, редактирования, поиска, удаления) пользуйтесь сервисом ``Tygh::$app['storefront.repository']``.

#. Класс ``\Tygh\Http`` теперь позволяет указывать максимальное время выполнения запроса. Для этого задайте значение ключу ``execution_timeout`` в массиве ``extra``::

     \Tygh\Http::get('http://example.com', [], ['execution_timeout' => 5]); // Установка максимального времени на 5 секунд

   Если значение не указано, то будет использоваться значение по умолчанию, т.е. 90 секунд (180 секунд в консольном режиме).

   Ключ ``timeout`` массива ``extra`` переименован в ``connection_timeout``, потому что он устанавливает максимальное время на подтверждение соединения; обратная совместимость сохранена.

--------------------------------
Схема описания модулей: версия 4
--------------------------------

Добавлена новая схема описания модулей — v4. Её цель — дать возможность писать модули в ООП-стиле. Эта версия схемы ещё только формируется, но уже сейчас можно использовать следующие нововведения:

* **autoload**. Секция предназначена для декларативного описания директорий, которые будут зарегистрированы в автозагрузчике классов. Подробнее о PSR-4 можно почитать на сайте `PHP Framework Interoperability Group <https://www.php-fig.org/psr/psr-4/>`_.

  Пример использования:

  .. code-block:: xml

    <autoload>
        <psr4 prefix="Tygh\Addons\ProductVariations\">src</psr4>
        <psr4 prefix="Tygh\Addons\ProductVariations\Tests\Unit\">tests</psr4>
    </autoload>

* **bootstrap**. Секция предназначена для указания класса-загрузчика модуля. Это аналог init.php в 3ей cхеме.

  Класс должен реализовывать интерфейс ``\Tygh\Core\BootstrapInterface`` с методом ``boot``, который будет вызываться при каждой инициализации модуля. Как правило, в методе ``boot`` должен быть только код, отвечающий за регистрацию каких-либо сервисов. Дополнительно bootstrap-класс может реализовать интерфейс ``\Tygh\Core\HookHandlerProviderInterface``, который используется для описания обработчиков хуков. ``\Tygh\Core\HookHandlerProviderInterface`` требует реализации метода ``getHookHandlerMap``, возвращаемым значением которого должен быть массив с описанием обработчиков хуков.

  Форматы описания обработчиков хуков:

  * **Упрощённый формат:** *hook => callable*. Ключом является название хука, а значением — любая callable-конструкция, либо указание метода из сервиса в контейнере зависимостей. Примеры:

    *

      ::

        'get_products' => ['Tygh\Addons\MyChanges\ProductsHookHandler', 'onGetProducts']

      Ожидается наличие статического метода ``Tygh\Addons\MyChanges\ProductsHookHandler::onGetProducts``.

    *

      ::

        'get_products' => function ($params, $products) { //... }

      Используется анонимная функция.

    *

      ::

        'get_products' => ['addons.my_changes.products_hook_handler', 'onGetProducts']

      Ожидается наличие зарегистрированного в ``Tygh::$app`` сервиса ``addons.my_changes.products_hook_handler`` c методом ``'onGetProducts'``.

    Также в упрощённом формате есть возможность третьим элементом массива указать приоритет обработчика хуков. Пример::

      'get_route' => [
          'addons.product_variations.hook_handlers.seo',
          'onGetRoute',
          1900
      ],

  * **Расширенный формат:** *hook_key => hook_handler_definition*. Пример::

      'discussions_variation_group_mark_product_as_main_post' => [
          'hook'     => 'variation_group_mark_product_as_main_post',
          'handler'  => [
              'addons.product_variations.hook_handlers.discussions',
              'onVariationGroupMarkProductAsMainPost',
          ],
          'addon'    => 'discussion',
          'priority' => 790
      ],

    Ключом массива может быть любой смысловой код.
    
    * ``hook`` — название хука;

    * ``handler`` — описание обработчика хука; значением может быть любая callable-конструкция, либо указание метода из сервиса в контейнере зависимостей;

    * ``addon`` — код модуля, от имени которого регистрируется обработчик; параметр может быть опущен; в таком случае обработчик хука будет зарегистрирован от текущего модуля;

    * ``priority`` — приоритет обработчика; параметр может быть опущен; в таком случае значение приоритета будет использовано из модуля.

* **installer**. Секция предназначена для указания класса, который будет использован при установке и удалении модуля. Класс должен реализовать интерфейс ``\Tygh\Addons\InstallerInterface``, со следующими методами:

  * ``factory(ApplicationInterface $app)`` — статический метод, который должен вернуть инстанс класса; метод будет вызываться в момент необходимости класса;

  * ``onBeforeInstall()`` — аналог ``before_install`` из 3ей cхемы, будет вызван перед установкой модуля;

  * ``onInstall()`` — аналог ``install`` из 3ей cхемы, будет вызван после установки модуля;

  * ``onUninstall()`` — аналог ``uninstall`` из 3ей cхемы, будет вызван перед удалением модуля.

-----------------------
Новое оформление заказа
-----------------------

* Новая страница оформления заказа перенесена в ядро.

* Модуль **Простое оформление заказа**, который ранее давал эту функциональность в русской версии, был удалён.

* Старое оформление заказа вынесено в отдельный модуль "Пошаговое оформление заказа".

* Макет новой страницы оформления заказа теперь разбит на отдельные блоки. Они создадутся автоматически, когда модуль **Пошаговое оформление заказа** будет выключен или удалён. В новых установках блоки будут существовать по умолчанию. Их имена начинаются так: ``Оформление заказа: ...``.

* Блок **Главное содержимое** должен быть выключен, когда используется новое оформление заказа.

* Добавлена новая оболочка **Простое оформление заказа**. Она должна быть применена к секции, где находятся все блоки. Без этой оболочки новое оформление заказа не будет работать правильно.

---------------
Менеджер блоков
---------------

Добавлена возможность указывать оболочку для секции. Если оболочка выбрана, то будет включен соответствующий шаблон, а содержимое всех блоков будет передано в него.

------------------------
Модуль "Обратный звонок"
------------------------

Функциональность, связанная с масками номеров телефонов, перенесена в ядро. Настройки модуля, связанные с масками, помечены как устаревшие; мы не рекомендуем их использовать.

------------------------
Модуль "Поддержка HiDPI"
------------------------

Модуль значительно переработан: теперь он не будет урезать изображения в 2 раза во время загрузки. Код JS для загрузки 2x-изображений был убран; теперь для этой цели используется атрибут "srcset".

--------------------------------------------------
Данные о пункте самовывоза в почтовых уведомлениях
--------------------------------------------------

Теперь информация о ПВЗ, выбранных при заказе, доступна в шаблонах email-уведомлений и документов в переменной ``pickup_point`` и в сниппете ``pickup_point``.

Чтобы задать данные ПВЗ в вашем модуле, используйте хук ``pickup_point_variable_init``.

-----------------------
Обновлена версия jQuery
-----------------------

В CS-Cart и Multi-Vendor теперь используется jQuery v3.3.1 вместо устаревшей v1.9.1. Основной целью было закрытие уязвимости CVE-2015-9251, которая затрагивает старые версии jQuery.

Мы включим плагин **jQuery Migrate** для сохранения обратной совместимости с существующими модулями и темами. Но если ваши модули или темы зависит от устаревшей функциональности jQuery, сейчас самое время их обновить.

-----------------------------------------
Обновлена библиотека Spectrum Colorpicker
-----------------------------------------

Теперь в CS-Cart используется Spectrum Colorpicker v1.8.0 вместо устаревшей v1.0.9.

-------------------------
Расчёт стоимости доставки
-------------------------

До CS-Cart / Multi-Vendor 4.10.1 параметр ``$calculate_shipping`` в функции ``fn_calculate_cart_content`` не работал, как описано: процесс расчёта стоимости доставки в функции не зависел от значения параметра.

Начиная с версии 4.10.1 этот параметр будет вести себя так, как описано.

.. note::

    **Об обратной совместимости:** функция ``fn_calculate_cart_content`` будет проверять поле ``$cart['calculate_shipping']``. Если его значение ``true``, то будет принудительно запущен расчёт стоимости доставки.

--------------------------------
Мультивитринность в Multi-Vendor
--------------------------------

В Multi-Vendor добавлена возможность использовать несколько витрин. У каждой витрины может быть свой набор назначенных ей стран, языков, валют, и продавцов.

На витрине появятся только товары тех продавцов, которые добавлены к этой витрине. Покупатели увидять только выбранные языки и валюты.

Теперь в Multi-Vendor есть перенаправление покупателей на нужную витрину в зависимости от того, где находится покупатель; работает это так же, как и раньше в CS-Cart.

Общие настройки ``store_mode`` и ``store_access_key`` были перенесены в витрины.

++++++++++++++++++++++++++++++++++++++++++
Изменения в CS-Cart, связанные с витринами
++++++++++++++++++++++++++++++++++++++++++

Следующие поля из таблицы ``companies`` перенесены в витрины: 

* *countries_list*

* *storefront*

* *redirect_customer*

Для сохранения обратной совместимости мы оставим эти поля в таблице ``companies`` и будем их обновлять, но крайне не рекомендуем использовать их напрямую.

--------------------------------------
Убран отдельный безопасный URL витрины
--------------------------------------

Поле **Безопасный URL витрины** было удалено со страницы настроек витрины и не будет использоваться в проверках. Теперь витрина будут вести себя так, как если бы в полях **URL витрины** и **Безопасный URL витрины** у неё было одинаковое значение.

Для сохранения обратной совместимости мы оставим это поле в таблице ``companies``, но крайне не рекомендуем использовать его напрямую.

--------------------------
Добавлен Центр уведомлений
--------------------------

У администраторов появился новый способ следить за уведомлениями — Центр уведомлений. Его можно использовать как замену уведомлениям, которые показываются функцией ``fn_set_notification``.

Чтобы добавить уведомления в Центр уведомлений, используйте сервис ``Tygh::$app['notifications_center']``. Он предоставляет экземпляр класса ``\Tygh\NotificationsCenter\NotificationsCenter``, настроенный под текущего пользователя.

Чтобы управлять уведомлениями вручную (создавать, обновлять, искать, удалять), используёте сервис ``Tygh::$app['notifications_center.repository']``. Он предоставляет настроенный экземпляр класса ``\Tygh\NotificationsCenter\Repository``.

Все вкладки, которые показываются в Центре уведомлений, описаны в схеме *notifications/notifications_center.php*; можете расширять её под ваши нужды.

----------------------------------------------------
Изменения в модуле "Увеличенные изображения товаров"
----------------------------------------------------

Модуль "Увеличенные изображения товаров" теперь не использует библиотеку **CloudZoom** на JavaScript из-за её несовместимости с jQuery 3.3.1. Теперь используется **EasyZoom**.

Также в модуль добавлена полноценная поддержка языков с письмом справа налево.

=================
Изменения в хуках
=================

--------------
Удалённые хуки
--------------

#.

   ::

     fn_set_hook('checkout_step_needs_shipping_calculation_post', $cart, $completed_steps, $needs_calculation);

#.

   ::

     fn_set_hook('prepare_direct_payments_payment_methods', $cart, $auth, $payment_groups[$vendor_id]);

----------
Новые хуки
----------

#. Выполняется после получения налогов на стоимость доставки и позволяет поменять налоги на стоимость доставки::

     fn_set_hook('get_shipping_taxes_post', $shipping_id, $shipping_rates, $cart, $taxes);

#. Выполняется перед обработкой шаблона документа и наполнением переменной ``pickup_point``; позволяет указать, в какой именно ПВЗ выбрана доставка, и различные данные ПВЗ: адрес, телефон, время работы и т.д.::

     fn_set_hook('pickup_point_variable_init', $this, $order, $lang_code, $is_selected, $name, $phone, $full_address, $open_hours_raw, $open_hours, $description_raw, $description);

#. Позволяет изменить данные доставки после их получения::

     fn_set_hook('get_shipping_info_after_select', $shipping_id, $lang_code, $shipping);

#. Позволяет отреагировать на изменение местоположения покупателя::

     fn_set_hook('geo_maps_set_customer_location_post', $location, $locality, $city_to_display);

#. Выполняется перед слиянием данных о компаниях и позволяет исключить таблицы из слияния::

     fn_set_hook('chown_company', $from, $to, $excluded_tables, $tables);

#. Позволяет изменить дополнительные параметры для расчёта количества новых продавцов на главной странице панели администратора::

     fn_set_hook('dashboard_new_vendors_before_sql_select', $fields, $joins, $conditions, $params);

#. Позволяет изменить дополнительные параметры для расчёта количества продавцов, не входивших в учётную запись, на главной странице панели администратора::

     fn_set_hook('dashboard_vendors_not_logged_before_sql_select', $fields, $joins, $conditions, $params);

#. Позволяет изменить дополнительные параметры для расчёта количества продавцов с новыми продажами на главной странице панели администратора::

     fn_set_hook('dashboard_vendor_with_sales_before_sql_select', $fields, $joins, $conditions, $params);

#. Позволяет изменить дополнительные параметры для расчёта количества продавцов с новыми товарами на главной странице панели администратора::

     fn_set_hook('dashboard_get_vendors_with_new_products_before_sql_select', $fields, $joins, $conditions, $params);

#. Позволяет изменить дополнительные параметры для расчёта количества товаров на главной странице панели администратора::

     fn_set_hook('dashboard_get_new_products_before_sql_select', $fields, $joins, $conditions, $params);

#. Выполняется при генерации ненастоящего электронного адреса для покупателя при размещении заказа; позволяет поменять сгенерированный электронный адрес (локальную часть и домен)::

     fn_set_hook('checkout_generate_fake_email', $user_data, $unique_id, $local_part, $domain);

#. Выполняется во время проверки, был ли электронный адрес этого пользователя сгенерирован автоматически; позволяет изменять результат проверки::

     fn_set_hook('checkout_is_email_address_fake_post', $email_address, $is_fake);

#. Выполняется во время автоматичекого определения индекса покупателя, после того, как индекс был определён. Позволяет менять определённый индекс::

     fn_set_hook('location_manager_detect_zipcode_post', $country_code, $state_code, $city, $zipcode);

#. Выполняется перед обновлением шагов оформления заказа; позволяет модифицировать параметры функции::

     fn_set_hook('checkout_update_steps_pre', $cart, $auth, $params, $redirect_params);

#. Выполняется перед обновлением шагов оформления заказа, при нахождении уже существующего пользователя с таким же электронным адресом, который ввёл покупатель. Позволяет модифицировать параметры перенаправления::

     fn_set_hook('checkout_update_steps_user_exists', $cart, $auth, $params, $redirect_params);

#. Выполняется при обновлении шагов оформления заказа, когда меняется стоимость доставки. Позволяет менять параметры перенаправления::

     fn_set_hook('checkout_update_steps_shipping_changed', $cart, $auth, $params, $redirect_params);

#. Выполняется после обновления данных пользователя на странице оформления заказа; позволяет модифицировать значения, возвращаемые функцией::

     fn_set_hook('checkout_update_user_data_post', $cart, $uath, $user_data, $ship_to_another, $user_id);

#. Выполняется при сохранении содержимого корзины, перед сохранением данных товаров; позволяет модифицировать хранимые данные::

     fn_set_hook('save_cart_content_before_save', $cart, $user_id, $type, $user_type, $product_data);

#. Выполняется, когда пользователь выходит из учётной записи; позволяет указать, нужно ли сохранять содержимое корзины::

     fn_set_hook('user_logout_before_save_cart', $auth, $save_cart);

#. Выполняется, когда пользователь выходит из учётной записи; позволяет указать, нужно ли очищать содержимое корзины::

     fn_set_hook('user_logout_before_clear_cart', $auth, $clear_cart);

#. Выполняется перед получением способов оплаты на странице оформления заказа. Позволяет модифицировать параметры, которые передаются в функцию, получающую способы оплаты::

     fn_set_hook('prepare_checkout_payment_methods_before_get_payments', $cart, $auth, $lang_code, $get_payment_groups, $payment_methods, $get_payments_params);

#. Выполняется после получения способов оплаты для оформления заказа. Позволяет модифицировать полученные способы оплаты::

     fn_set_hook('prepare_checkout_payment_methods_after_get_payments', $cart, $auth, $lang_code, $get_payment_groups, $payment_methods, $get_payments_params, $cache_key);

#. Выполняется во время поиска по витринам, перед выполнением запроса. Позволяет модифицировать части SQL-запроса::

     fn_set_hook('storefront_repository_find', $params, $items_per_page, $fields, $join, $conditions, $group_by, $having, $order_by, $limit);

#. Выполняется при подсчёте витрин, перед выполнением запроса. Позволяет модифицировать части SQL-запроса::

     fn_set_hook('storefront_repository_get_count', $params, $fields, $join, $conditions);

#. Выполняется при удалении витрины; позволяет удалять дополнительные данные витрины::

     fn_set_hook('storefront_repository_delete_post', $storefront, $operation_result);

#. Выполняется перед получением магазинов/ПВЗ, куда возможна доставка::

     fn_set_hook('get_store_locations_for_shipping_before_select', $destination_id, $fields, $joins, $conditions);

#. Выполняется перед удалением вариантов характеристик::

     fn_set_hook('delete_product_feature_variants_pre', $feature_id, $variant_ids);

#. Позволяет менять контекст элемента таблицы для отрисовки сниппета таблицы с данными::

     fn_set_hook('template_snippet_table_item_context_init', $this, $context, $item, $counter);

#. Выполняется перед созданием нового товара по комбинации характеристик; позволяет модифицировать данные перед сохранением товара:: 

     fn_set_hook('variation_group_create_products_by_combinations_item', $service, $parent_product_id, $combination_id, $combination, $product_data);

#. Выполняется перед добавлением товаров в группу вариаций; позволяет реализовать дополнительные проверки перед добавлением в группу вариаций::

     fn_set_hook('variation_group_add_products_to_group', $service, $result, $products, $group, $products_status);

#. Выполняется после смены родительского товара; позволяет выполнить дополнительные действия::

     fn_set_hook('variation_group_mark_product_as_main_post', $service, $group, $from_group_product, $to_group_product);

#. Выполняется после сохранения группы вариаций; позволяет выполнить дополнительные действия и среагировать на события, произошедшие в группе вариаций::

     fn_set_hook('variation_group_save_group', $service, $group, $events);

#. Выполняется после обработанных событий синхронизации; позволяет реализовать реакцию на синхронизированные данные::

     fn_set_hook('variation_sync_flush_sync_events', $sync_service, $events);

#. Выполняется после того, как глобальная опция была привязана к товару::

     fn_set_hook('add_global_option_link_post', $product_id, $option_id);

#. Выполняется после того, как глобальная опция была отвязана от товара::

     fn_set_hook('delete_global_option_link_post', $product_id, $option_id);

#. Позволяет выполнять действия после обновления вкладки товара::

     fn_set_hook('update_product_tab_post', $tab_id, $tab_data);

#. Выполняется в начале функции; позволяет менять аргументы, передаваемые в функцию::

     fn_set_hook('get_attachments_pre', $object_type, $object_id, $type, $lang_code);

#. Обрабатывает данные местоположения после их обновления::

     fn_set_hook('update_location_post', $location_data, $lang_code, $location_id);

#. Обрабатывает данные блока после их обновления::

     fn_set_hook('update_block_post', $block_data, $description, $block_id);

#. Обрабатывает данные привязки перед их обновлением::

     fn_set_hook('update_snapping_pre', $snapping_data);

#. Обрабатывает данные привязки после их обновления::

     fn_set_hook('update_snapping_post', $snapping_data);

#. Обрабатывает данные статуса блока после их обновления::

     fn_set_hook('update_block_status_post', $status_data);

#. Выполняется при сохранении витрины, позволяет выполнить дополнительные действия::

     fn_set_hook('storefront_repository_save_post', $storefront, $save_result);

---------------
Изменённые хуки
---------------

#.

   ::

     // Было:
     fn_set_hook('get_cart_product_data_pre', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount);

     // Стало:
     fn_set_hook('get_cart_product_data_pre', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $lang_code);

#.

  ::

    // Было:
    fn_set_hook('get_cart_product_data_post', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $_pdata);

    // Стало:
    fn_set_hook('get_cart_product_data_post', $hash, $product, $skip_promotion, $cart, $auth, $promotion_amount, $_pdata, $lang_code);

#.

  ::

    // Было:
    fn_set_hook('gather_additional_products_data_pre', $products, $params);

    // Стало:
    fn_set_hook('gather_additional_products_data_pre', $products, $params, $lang_code);

#.

  ::

    // Было:
    fn_set_hook('gather_additional_products_data_post', $product_ids, $params, $products, $auth);

    // Стало:
    fn_set_hook('gather_additional_products_data_post', $product_ids, $params, $products, $auth, $lang_code);

#.

  ::

    // Было:
    fn_set_hook('get_product_feature_variants', $fields, $join, $condition, $group_by, $sorting, $lang_code, $limit);

    // Стало:
    fn_set_hook('get_product_feature_variants', $fields, $join, $condition, $group_by, $sorting, $lang_code, $limit, $params);

#.

  ::

    // Было:
    fn_set_hook('development_show_stub', $placeholders, $append, $content);

    // Стало:
    fn_set_hook('development_show_stub', $placeholders, $append, $content, $is_error);

#.

  ::

    // Было:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify);

    // Стало:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify, $order_info, $amount_delta, $current_amount, $original_amount, $sign);

#.

  ::

    // Было:
    fn_set_hook('delete_company', $company_id, $result);

    // Стало:
    fn_set_hook('delete_company', $company_id, $result, $storefronts);

#.

  ::

    // Было:
    fn_set_hook('reorder_product', $order_info, $cart, $auth, $product, $amount, $price, $zero_price_action);

    // Стало:
    fn_set_hook('reorder_product', $order_info, $cart, $auth, $product, $amount, $price, $zero_price_action, $k);

====================
Изменения в функциях
====================

-----------------
Удалённые функции
-----------------

#. ``fn_hidpi_generate_hidpi_name``

#. ``fn_hidpi_generate_absolute_hidpi_name``

#. ``fn_hdpi_form_name``

#. ``fn_hdpi_delete``

#. ``fn_hdpi_copy``

#. ``fn_hdpi_shrink_original``

#. ``fn_checkout_step_needs_shipping_calculation``

#. ``fn_lite_checkout_get_name``

#. ``fn_lite_checkout_set_name``

#. ``fn_lite_checkout_backup_chosen_shipping``

#. ``fn_lite_checkout_restore_chosen_shipping``

#. ``fn_lite_checkout_flatten_payments_list``

#. ``fn_lite_checkout_is_shipping_recalculation_required``

#. ``fn_lite_checkout_fill_user_data_from_location``

#. ``fn_lite_checkout_update_customer_location``

#. ``fn_prepare_direct_payments_payment_methods``

#. ``fn_direct_payments_em_get_subscriber_name``

#. ``fn_direct_payments_user_logout``

----------------------------
Удалённые устаревшие функции
----------------------------

#. ``fn_companies_change_status``

#. ``fn_get_usergroups_deprecated``

#. ``fn_discussion_parse_datetime``

#. ``fn_seo_cache_name``

#. ``fn_seo_parced_query_unset``

#. ``fn_create_image_from_file``

#. ``\Tygh\Shippings\Services\Yandex::processCms``

#. ``fn_put_csv``

#. ``fn_export_image``

#. ``fn_import_images``

#. ``fn_import_build_groups``

#. ``fn_get_csv``

#. ``fn_get_pattern_definition``

#. ``fn_update_language``

#. ``fn_delete_language_variables``

#. ``fn_get_language_variables``

#. ``fn_get_payment_methods``

#. ``fn_get_simple_payment_methods``

#. ``fn_get_carriers``

#. ``fn_get_product_details_layout``

#. ``fn_is_allow_to_translate_language_object``

#. ``fn_prepare_lang_objects``

#. ``fn_remove_trailing_slash``

#. ``fn_clean_url``

#. ``fn_create_logo``

#. ``fn_exim_set_quotes``

#. ``fn_check_gd_formats``

#. ``fn_parse_rgb``

#. ``fn_check_addon_permission``

#. ``fn_companies_get_payouts``

#. ``fn_companies_delete_payout``

#. ``fn_promotion_check``

#. ``\Tygh\DataKeeper::createZipArchive``

#. ``\Tygh\DataKeeper::getCompressedFilesList``

#. ``fn_format_price_by_currency_depricated``

#. ``fn_parse_urn``

#. ``fn_build_urn``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::isLocationEmpty``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::setPredefinedLocations``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getPredefinedLocations``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getStates``

#. ``\Tygh\Addons\LiteCheckout\LiteCheckoutLocation::getCountries``

------------------
Устаревшие функции
------------------

#. ``fn_need_shipping_recalculation``

#. ``fn_get_default_credit_card``

#. ``fn_rus_payments_payanyway_format_item_name($name)`` (вместо неё используйте ``fn_rus_payments_truncate_item_name``)

------------
Новые классы
------------

#. ``\Tygh\Template\Document\Variables\PickpupPointVariable`` предоставляет хранилище данных о ПВЗ для шаблонов email-уведомлений и документов.

#. ``\Tygh\BlockManager\TDeviceAvailabiltiy`` предоставляет набор методов для определения видимости блока на разных устройствах.

#. ``\Tygh\Vendors\Invitations\Repository`` предоставляет интерфейс для работы с приглашениями продавцов.

#. ``\Tygh\Vendors\Invitations\Sender`` предоставляет интерфейс для отправки приглашений потенциальным продавцам.

#. ``\Tygh\Location\Location`` предоставляет хранилище местоположения покупателя.

#. ``\Tygh\Location\Manager`` предоставляет способы для работы с объектом местоположения покупателя.

#. ``\Tygh\Location\IUserDataStorage`` описывает интерфейс объекта хранения данных пользователя для выбора местоположения покупателя.

#. ``\Tygh\Location\CartUserDataStorage`` предоставляет хранилище данных пользователя, которое модифицирует объект корзины, хранящийся в текущей сессии.

#. ``\Tygh\Storefront\Storefront`` представляет собой отдельную витрину с уникальным URL. Каждая витрина показывает какую-то часть всего каталога.

#. ``\Tygh\Storefront\Repository`` получает, сохраняет, и удаляет витрины.

#. ``\Tygh\Storefront\Normalizer`` предоставляет инструменты для нормализации данных витрины для SQL-запросов и создания объектов.

#. ``\Tygh\Storefront\Factory`` создаёт витрины.

#. ``\Tygh\Storefront\DataLoader`` предоставляет функциональность отложенной загрузки для витрин.

#. ``\Tygh\Enum\YesNo`` содержит возможные значения булевого типа, используемые в базе данных.

#. ``\Tygh\NotificationsCenter\Notification`` представляет собой уведомление в Центре уведомлений.

#. ``\Tygh\NotificationsCenter\IFactory`` описывает класс, который создаёт уведомления.

#. ``\Tygh\NotificationsCenter\Factory`` создаёт уведомления.

#. ``\Tygh\NotificationsCenter\IRepository`` описывает класс, который получает, сохраняет, и удаляет уведомления.

#. ``\Tygh\NotificationsCenter\Repository`` сохраняет уведомления в базе данных магазина, а также получает и удаляет уведомления.

#. ``\Tygh\NotificationsCenter\NotificationsCenter`` предоставляет средства для работы с уведомлениями в Центре уведомлений.

-------------
Новые функции
-------------

#. Форматирует адрес ПВЗ eDost::

     fn_rus_edost_format_pickup_point_address($order_info, $pickup_point_address, $lang_code)

#. Получает данные почтомата PickPoint из базы данных::

     \Tygh\Shippings\RusPickpoint::getPickpointPostamatById

#. Формотирует адрес ПВЗ PickPoint::

     fn_rus_pickpoint_format_pickpoint_format_pickup_point_address($pickup_point)

#. Форматирует время работы ПВЗ PickPoint::

     fn_rus_pickpoint_format_pickup_point_open_hours($work_time, $lang_code)

#. Форматирует адрес магазина::

     fn_store_locator_format_pickup_point_address($pickup_data)

#. Форматирует время работы ПВЗ Яндекс.Доставки::

     fn_yandex_delivery_format_pickup_point_open_hours($schedules_list, $lang_code)

#. Устанавливает максимальный срок на ожидание выполнения/подключения::

     \Tygh\Http::setDefaultTimeout($execution_timeout = null, $connection_timeout = null)

#. Получает срок доставки для предоставленного тарифа::

     \Tygh\Shippings\Shippings::getRateDeliveryTime($rate_info, $lang_code = CART_LANGUAGE)

#. Получает размер тарифа по предоставленному пункту назначения (тарифной зоне)::

     \Tygh\Shippings\Shippings::getRateByDestination(array $shipping, $destination_id)

#. Получает данные о тарифной зоне доставки::

     fn_get_shipping_destinations($shipping_id, array $shipping, $lang_code = CART_LANGUAGE)

#. Обновляет время доставки по тарифной зоне и выбранному языку::

     fn_update_shipping_destination_delivery_time($shipping_id, $deliveries, $lang_code)

#. Получает время доставки для указанных тарифных зон и языка::

     fn_get_shipping_destination_delivery_time($shipping_id, $destination_ids, $lang_code = CART_LANGUAGE)

#. Пытается найти ISO-код области по предоставленным данным о местоположении::

     fn_geo_maps_get_state_code_by_location($location, $states, $similarity_threshold = 70, $same_country_similarity_threshold = 55)

#. Обновить данные о местоположении покупателя::

     fn_lite_checkout_update_customer_location($customer_location)

#. Генерирует хэш API-ключа пользователя::

     fn_generate_api_key_hash($api_key)

#. Проверяет, правильный ли введён API-ключ::

     fn_verify_api_key($api_key, $encrypted_key)

#. Возвращает отфильтрованный список масок номера телефона в международном формате::

     fn_get_phone_masks

#. Наполняет массив корзины данными из брошенной корзины по указанному идентификатору покупателя::

     fn_form_cart_from_abandoned($customer_id)

#. Обновляет способ оплаты в коризне::

     fn_checkout_update_payment($cart, $auth, $payment_id, $payment_info = [])

#. Обновляет данные покупателя в корзине::

     fn_checkout_update_user_data($cart, $auth, $user_data, $ship_to_another, $user_id)

#. Получает хэш полей местопложения, которые вожны для доставки::

     fn_checkout_get_location_hash(array $user_data)

#. Выравнивает список способов оплаты на странице оформления заказа::

     fn_checkout_flatten_payments_list(array $payment_methods)

#. Генерирует ненастоящий адрес электронной почты, если заказ размещается без указания электронной почты::

     fn_checkout_generate_fake_email_address(array $user_data, $unique_id)

#. Проверяет, является ли адрес электронной почты покупателя ненастоящим и сгенерированным автоматически::

     fn_checkout_is_email_address_fake($email_address)

#. Получает значение параметра *$calculate_shipping* для функции ``fn_calculate_cart_content``::

     fn_checkout_get_shippping_calculation_type($cart, $is_location_changed)

#. Получает последнее значение автоинкрементного столбца::

     \Tygh\Database\Connection::getInsertId()

#. Устанавливает корзине идентификатор профиля::

     fn_checkout_set_cart_profile_id(&$cart, $profile_id)

#. Получает профили пользователя для оформления заказа::

     fn_checkout_get_user_profiles($auth)

#. Проверяет, разрешено ли несколько профилей для текущего пользователя::

     fn_checkout_is_multiple_profiles_allowed($auth)

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    fn_get_cart_product_data($hash, &$product, $skip_promotion, &$cart, &$auth, $promotion_amount = 0)

    // Стало:
    fn_get_cart_product_data($hash, &$product, $skip_promotion, &$cart, &$auth, $promotion_amount = 0, $lang_code = CART_LANGUAGE)

#.

  ::

    // Было:
    fn_extract_cart_content(&$cart, $user_id, $type = 'C', $user_type = 'R')

    // Стало:
    fn_extract_cart_content(&$cart, $user_id, $type = 'C', $user_type = 'R', $lang_code = CART_LANGUAGE)

#.

  ::

    // Было:
    fn_calculate_cart_content(&$cart, $auth, $calculate_shipping = 'A', $calculate_taxes = true, $options_style = 'F', $apply_cart_promotions = true)

    // Стало:
    fn_calculate_cart_content(&$cart, $auth, $calculate_shipping = 'A', $calculate_taxes = true, $options_style = 'F', $apply_cart_promotions = true, $lang_code = CART_LANGUAGE)

#.

  ::

    // Было:
    fn_gather_additional_products_data(&$products, $params)

    // Стало:
    fn_gather_additional_products_data(&$products, $params, $lang_code = CART_LANGUAGE)

#.

  ::

    // Было:
    fn_get_contents($location, $base_dir = '');

    // Стало:
    fn_get_contents($location, $base_dir = '', $timeout = null);

#.

  ::

    // Было:
    \Tygh\Shippings\Shippings::_getRateInfoByLocation($shipping_id, $location);

    // Стало:
    \Tygh\Shippings\Shippings::_getRateInfoByLocation($shipping_id, $location, $lang_code = CART_LANGUAGE);

#.

  ::

    // Было:
    \Tygh\Shippings\Shippings::_calculateManualRealRate($shipping);

    // Стало:
    \Tygh\Shippings\Shippings::_calculateManualRealRate($shipping, $rate);

#.

  ::

    // Было:
    fn_create_periods($params);

    // Стало:
    fn_create_periods($params, $prefix = '');

#.

  ::

    // Было:
    \Tygh\Development::showStub($placeholders, $append)

    // Стало:
    \Tygh\Development::showStub($placeholders, $append, $is_error)

#.

  ::

    // Было:
    \Tygh\Shippings\Shippings::getShippingsList($group, $lang = CART_LANGUAGE, $area = AREA)

    // Стало:
    \Tygh\Shippings\Shippings::getShippingsList($group, $lang = CART_LANGUAGE, $area = AREA, $params = [])

#.

  ::

    // Было:
    fn_prepare_checkout_payment_methods(&$cart, &$auth, $lang_code = CART_LANGUAGE)

    // Стало:
    fn_prepare_checkout_payment_methods(&$cart, &$auth, $lang_code = CART_LANGUAGE, $get_payment_groups = true)

#.

  ::

    // Было:
    \Tygh\Languages\Languages::getAvailable($area = AREA, $include_hidden = false)

    // Стало:
    \Tygh\Languages\Languages::getAvailable($params = [])

#.

  ::

    // Было:
    \Tygh\UpgradeCenter\App::__construct($params)

    // Стало:
    \Tygh\UpgradeCenter\App::__construct($params, $config = null, $settings = null, $storefront_repository = null)

#.

  ::

    // Было:
    fn_set_store_mode($store_mode, $company_id = null, $clear_cache = true)

    // Стало:
    fn_set_store_mode($store_mode, $company_id = null)

#.

  ::

    // Было:
    fn_update_product_amount($product_id, $amount_delta, $product_options, $sign, $notify = true)

    // Стало:
    fn_update_product_amount($product_id, $amount_delta, $product_options, $sign, $notify = true, $order_info = [])

#.

  ::

    // Было:
    fn_check_admin_permissions(&$schema, $controller, $mode, $request_method = '', $request_variables = array())

    // Стало:
    fn_check_admin_permissions(&$schema, $controller, $mode, $request_method = '', $request_variables = array(), $user_id = null)


====================
Изменения в шаблонах
====================

--------------------------
Устаревшая функция Capture
--------------------------

Capture для ``$discount_label`` в *design/themes/responsive/templates/common/product_data.tpl* устарел и будет убран в следующей версии. Рекомендуем использовать ``product_labels``.

Вот параметры ``product_labels``:

* ``product_labels_position``: *top-right* | *top-left* | *bottom-right* | *bottom-left*. Default: `top-right`. Позиция метки на изображении товара.

Вот параметры шаблона *views/products/components/product_label.tpl*:

* ``label_href`` — отобразить метку как ссылку;

* ``label_extra`` — HTML-атрибуты метки;

* ``label_meta`` — CSS-класс метки;

* ``label_icon`` — иконка, которую нужно отобразить слева от содержимого метки;

* ``label_text`` — текст метки.
