*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.11.1
*******************************************************

.. contents::
    :local:

===============
Общие изменения
===============

---------------------------------------------------------------------
Механизм привязки тем к витринам в Multi-Vendor и магазинам в CS-Cart
---------------------------------------------------------------------

Теперь темы напрямую связаны с витринами.

* Для Multi-Vendor Ultimate это означает, что в магазине может быть одновременно установлено несколько тем.

* Для CS-Cart это означает, что тема больше не является настройкой ``company``, а связана с ней через промежуточную сущность — ``storefront``.

В CS-Cart каждой компании соответствует строго одна витрина. Поэтому для обратной совместимости мы добавили в нужные места прослойку, которая определяет витрину по переданному идентификатору компании. **Эта прослойка будет удалена в будущих версиях CS-Cart.**

Следующие сущности теперь связаны с витринами: Layouts, Containers, Blocks.

В связи с тем, что тема больше не связана с магазином в Multi-Vendor или с компанией в CS-Cart, **соответствующая настройка** ``theme_name`` **удалена** и перенесена в свойства витрины.

Те функции, поведение которых изменилось и теперь зависит от витрины, вынесены :ref:`в отдельный подраздел "Изменённых функций" <4111-storefront-dependent-functions>`. Использование их без передачи идентификаторов витрины в соответствующих параметрах может привести к неожиданным результатам.

-----------------------------------------------------------
Привязка способов оплаты, доставки и промо-акций к витринам
-----------------------------------------------------------

В Multi-Vendor Ultimate к витринами могут быть привязаны способы оплаты, способы доставки, промо-акции.

В CS-Cart тоже используется новый механизм для привязки способов оплаты, способов доставки и промо-акций к витринам; механизм общего доступа (sharing) для этого больше не используется.

--------------------------------------
Изменения в процессе установки модулей
--------------------------------------

При установке модуля из архива перед началом установки будут удалены все файлы, которые могли остаться от этого модуля в прошлом. Будут удалены следующие папки и файлы:

* app/addons/{addon}
* design/backend/css/addons/{addon}
* design/backend/mail/templates/addons/{addon}
* design/backend/media/fonts/addons/{addon}
* design/backend/media/images/addons/{addon}
* design/backend/templates/addons/{addon}
* design/themes/{theme}/css/addons/{addon}
* design/themes/{theme}/mail/templates/addons/{addon}
* design/themes/{theme}/media/fonts/addons/{addon}
* design/themes/{theme}/media/images/addons/{addon}
* design/themes/{theme}/templates/addons/{addon}
* js/addons/{addon}
* var/langs/{lang_code}/addons/{addon}.po

-----------------------------------------
Изменения в процессе отправки уведомлений
-----------------------------------------

Добавлен механизм **событий уведомлений** для отправки многоканальных уведомлений.

Основные компоненты:

+++++++++++++++++
Диспетчер событий
+++++++++++++++++

Запускает события, в результате которых происходит отправка уведомлений получателям в системе.

Событие — связка из строкового идентификатора и данных, передаваемых в событии.

Объект класса ``\Tygh\Notifications\EventDispatcher``.

Зарегистрирован в ``Tygh::$app['event.dispatcher']``.

Пример запуска события::

  Tygh::$app['event.dispatcher']->dispatch('profile.updated', ['user_id' => $user_data, 'user_id' => $user_id]);

+++++++++
Сообщения
+++++++++

Формируются на основе схемы для конкретного транспорта и данных, переданных диспетчеру.

Содержат все необходимые данные для отправки через связанный с этим типом сообщений транспорт.

Данные сообщения должны быть инстансом класса ``\Tygh\Notifications\Transports\BaseMessageSchema``.

Примеры реализаций:

* ``\Tygh\Notifications\Transports\Mail\MailMessageSchema`` — сообшение, отправляемое на почту.

* ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema`` — сообщение, отправляемое в Центр уведомлений.

+++++++++++++++++++++++++++++++++++
Транспорты для отправки уведомлений
+++++++++++++++++++++++++++++++++++

Выполняют непосредственно отправку сообщений конкретных типов.

Реализуют интерфейс ``\Tygh\Notifications\Transports\ITransport``.

Зарегистрированы в ``Tygh::$app['event.transports.{TransportId}']``.

Список идентификаторов содержится в схеме транспортов ``Tygh::$app['event.transports_schema']``.

Примеры реализаций:

* ``\Tygh\Notifications\Transports\MailTransport`` — отправляет сообщения на почту.

* ``\Tygh\Notifications\Transports\InternalTransport`` — отправляет сообщения в Центр уведомлений.


+++++++++++++++++
Схема получателей
+++++++++++++++++

Cодержит идентификаторы всех возможных получателей сообщений в системе.

Зарегистрирована  в ``Tygh::$app['event.receivers_schema']``.

Расширяется через хук ``get_notification_rules``.

+++++++++++++
Схема событий
+++++++++++++

Содержит все события в системе и описывает их возможных получателей.

Зарегистрирована в ``Tygh::$app['event.events_schema']``.

Расширение списка событий, транспортов и получателей делается через схему *notification/events.php*.

Каждый элемент схемы имеет следующую структуру::

  (string) EventId => [
      'group' => (string) GroupId,
      'name' => [
          'template' => (string) TemplateLanguageVariable,
          'params' => [
              (string) SubstitutionName => (string) Substitution
              ...
          ],
      ],
      'data_provider' => (callable) DataProvider,
      'receivers' => [
          (string) ReceiverId => [
              (string) TransportId => BaseMessageSchema::create([
                  'area'            => (string) area,
                  'from'            => (string) from,
                  'to'              => (callable) DataValue::create(key),
                  'template_code'   => (string) template_code,
                  ...
                  'language_code'   => (callable) DataValue::create(parent_key.key, default_value),
                  'data_modifier'   => (callable) function (array $data) {
                      return array_merge($data, $added_data_value);
                  }
              ]),
              ...
          ],
          ...
      ],
  ],


* ``EventId`` — идентификатор события. Он используется в качестве первого аргумента в ``\Tygh\Notifications\EventDispatcher::dispatch``.

* ``GroupId`` — идентификатор группы событий. Он используется на странице настроек уведомлений для более удобной навигации.

* ``TemplateLanguageVariable`` — имя языковой переменной, что используется для обозначения события на странице настроек уведомлений.

* ``SubstitutionName`` и ``Substitution`` — имя и значение параметров, используемых для адаптации языковой переменной под особенности события.

* ``DataProvider`` — реализует интерфейс ``Notification\DataProviders\DataProvider``; используется для получения специфичных для события полей на основе ``data``, переданных в ``\Tygh\Notifications\EventDispatcher::dispatch``.

* ``ReceiverId`` — идентификатор получателя. Все существующие в системе идентификаторы получателей могут быть получены из ``Tygh::$app['event.receivers_schema']``.

* ``TransportId`` — идентификатор транспорта. Транспорты должны предоставлять его в ``\Tygh\Notifications\Transports\ITransport::getId``.

* ``BaseMessageSchema`` — создает инстанс класса схемы, с подготовленными для отправки данными. Входящие параметры должны содержать преобразованные данные, которые необходимы для отправки письма.

  Могут быть представлены как текст: ``area``, ``from``, ``template_code``. Или как инстанс класса ``DataValue``.

* ``DataValue`` — класс, позволяющий получить данные из входного массива по ключу. Если переданный ключ не содержится в массиве, то будет взято ``default_value``, по умолчанию ``null``.

* ``data_modifier`` — callable-параметр; в рамках функции могут быть выполнены дополнительные преобразования полей, переданных в ``data``.

+++++++++++++++++++
Правила уведомлений
+++++++++++++++++++

Описывают, какого типа сообщения по какому транспорту должны рассылаться получателям при возникновении событий.

Зарегистрированы в ``Tygh::$app['event.notification_settings']``.

По умолчанию считается, что если событие присутствует в схеме событий ``Tygh::$app['event.events_schema']``, то оно требует уведомлений по всем транспортам для всех получателей, указанных в описании события.

Для дальнейших изменений используется страница настроек уведомлений.

+++++++++++++++++++++
Настройки уведомлений
+++++++++++++++++++++

Настройки уведомлений задаются через меню **Администрирование → Уведомления** (``notifications_settings.manage``) для всей системы. 

Представляют из себя таблицы для каждого существующего в системе потенциального получателя сообщений. Если для выбранного получателя доставка сообщения определенным транспортом описана в схеме событий, то на пересечении столбца транспорта и строки события будет элемент управления (флажок).

Элементы, которые не предоставляют органы управления (например, события без получателей, транспорты без событий, получатели без событий для них) скрываются из интерфейса.

При изменении правила из данной таблицы сохраняются в базе данных (``notification_settings``).

+++++++++++++++++++++++++++++
Перегрузка правил уведомлений
+++++++++++++++++++++++++++++

Нужна для предотвращения отправки уведомлений по событию, даже если того требуют правила.

Правила — объект класса ``\Tygh\Notifications\Settings\Ruleset``, конструируются фабрикой правил ``Tygh::$app['event.notification_settings.factory']``.

Они передаются одним из параметров при запуске события.

Пример: на странице редактирования заказа присутствует набор флагов Notify customer, Notify orders department и Notify vendor. Они позволяют предотвратить отправку сообщения об изменении заказа, даже если правила уведомлений этого явно требуют.

::

  Tygh::$app['event.dispatcher']->dispatch(
      'order.updated',
      $order_info,
      Tygh::$app['event.notification_settings.factory']->create([
          UserTypes::CUSTOMER => false,
          UserTypes::ADMIN    => true,
          UserTypes::VENDOR   => true,
      ])
  );

-------------------------------
Изменения настроек безопасности
-------------------------------

Раньше глобальная настройка "Безопасное соединение для витрины" ``settings_vendor_values`` принимала следующие значения:

* ``secure_storefront::none`` = "Выключить"
* ``secure_storefront::partial`` = "Включить для страниц профиля и оформления заказа"
* ``secure_storefront::full`` = "Включить для всего сайта"

Теперь глобальная настройка ``settings_vendor_values`` отображается в виде флага и принимает всего два значения — включить безопасное соединение ``Y`` и выключить безопасное соединение ``N``.

Настройка "Сохранять безопасное соединение после первого посещения защищенной страницы" ``keep_https`` была удалена.

Настройка "Форма защищена (SSL)" ``form_is_secure`` для модуля "Конструктор форм" ``form_builder`` была удалена. 

---------------------------------
Изменения в механизме кэширования
---------------------------------

Появилась возможность указывать время жизни кэша независимо от ``cache_level``.

Пример регистрации кэша с зависимостями от таблиц БД и ограничением по времени жизни::

  Registry::registerCache(
      'products', 
      [
          'update_handlers' => ['products'], // Список таблицы от которых зависит кэш 
          'ttl' => 86400  // Время жизни кэша в секундах
      ], 
      Registry::cacheLevel('static')
  );

++++++++++++++++++++++++++++++++++++
Поддержка TTL в схемах Block Manager
++++++++++++++++++++++++++++++++++++

В схемах block manager появилась возможность указать время жизни кэша.

Для этого используйте ключ ``ttl`` в секции ``cache`` в описании блока, например::

  'payment_methods' => [
      'content'   => [
          'items' => [
              'type'     => 'function',
              'function' => ['fn_get_payment_methods_images'],
          ],
      ],
      'templates' => 'blocks/payments.tpl',
      'wrappers'  => 'blocks/wrappers',
      'cache'     => [
          'ttl' => 86400  // Время жизни кэша в секундах
          'update_handlers' => ['payments', 'payment_descriptions'],
      ],
  ],

Время жизни кэша может быть переопределено в зависимости от filling, пример::

  'products' => [
      'content'   => [
          'items' => [
              'type'           => 'enum',
              'object'         => 'products',
              'items_function' => 'fn_get_products',
              'fillings'       => [
                  /* ... */
                  'most_popular'    => [
                      'params'    => [
                          'popularity_from' => 1,
                          'sort_by'         => 'popularity',
                          'sort_order'      => 'desc',
                          'request'         => [
                              'cid' => '%CATEGORY_ID'
                          ]
                      ],
                      'cache_ttl' => SECONDS_IN_DAY // Время жизни кэша в секундах
                  ],
              ],
          ],
      ],
      /* ... */
      'cache'     => [/* ... */]
  ],

-----------------------------------------------------------
Обновление категорий в функции fn_update_product_categories
-----------------------------------------------------------

Начиная с версии 4.11.1, в возвращаемых функцией ``fn_update_product_categories`` данных могут быть идентификаторы добавленных категорий.

=======
Функции
=======

------------
Новые классы
------------

#. ``\Tygh\Enum\ProductFilterProductFieldTypes`` — содержит свойства товара, которые могут использоваться для фильтров товаров.

#. ``\Tygh\Enum\ObjectStatuses`` — содержит стандартные статусы разных объектов: заказов, товаров и пр.

#. ``\Tygh\Notifications\EventDispatcher`` — предоставляет функциональность диспатчеризации событий.

#. ``\Tygh\Notifications\EventIdProviders\IProvider`` — описывает провайдер уникального идентификатора сообщения.

#. ``\Tygh\Notifications\EventIdProviders\OrderProvider`` — предоставляет средства для различения событий уведомлений, связанных с заказами.

#. ``\Tygh\Notifications\Messages\IMessage`` — описывает сообщение о событии.

#. ``\Tygh\Notifications\Messages\InternalMessage`` — реализует сообщение из Центра уведомлений.

#. ``\Tygh\Notifications\Messages\MailMessage`` — реализует сообщение, которое отправляется через MailTransport.

#. ``\Tygh\Notifications\Messages\Order\EdpMailMessage`` — представляет сообщение о скачиваемых файлах.

#. ``\Tygh\Notifications\Messages\Order\OrderAdminMailMessage`` — представляет сообщение, которое отправляется администратору или продавцу при смене статуса заказа.

#. ``\Tygh\Notifications\Messages\Order\OrderCustomerMailMessage`` — представляет сообщение, которое отправляется покупателю при смене статуса заказа.

#. ``\Tygh\Notifications\Messages\Order\ShipmentCustomerMailMessage`` — представляет сообщение, которое отправляется покупателю при изменении отгузки.

#. ``\Tygh\Notifications\Settings\Factory`` — создаёт наборы правил для настроек уведомлений.

#. ``\Tygh\Notifications\Settings\Ruleset`` — предоставляет способы ручного задания настроек уведомлений для определённых транспортов и получателей.

#. ``\Tygh\Notifications\Transports\ITransport`` — описывает транспорт, который обрабатывает сообщения о событиях.

#. ``\Tygh\Notifications\Transports\InternalTransport`` — реализует транспорт, который создаёт уведомления в Центре уведомлений на основе сообщения о событии.

#. ``\Tygh\Notifications\Transports\MailTransport`` — реализует транспорт, который отправляет электронное письмо на основе сообщения о событии.

#. ``\Tygh\Notifications\Transports\ITransportFactory`` — описывает фабрику, которая создаёт транспорты уведомлений.

#. ``Tygh\Notifications\Transports\TransportFactory`` — реализует фабрику транспортов, которая загружает транспорты из контейнера приложения.

#. ``\Tygh\Addons\Suppliers\Notifications\Messages\SupplierMailMessage`` — представляет сообщение, которое отправляется поставщику после изменения статуса заказа.

#. ``\Tygh\Addons\GiftCertificates\Notifications\Messages\CustomerMailMessage`` — представляет сообщение, которое отправляется покупателю при смене статуса подарочного сертификата.

#. ``\Tygh\Addons\VendorDataPremoderation\Notifications\Messages\PremoderationMailMessage`` — представляет сообщение, которое отправляется продавцу по электронной почте при одобрении/отклонении товара.

#. ``\Tygh\Addons\VendorDataPremoderation\Notifications\Messages\PremoderationInternalMessage`` — представляет сообщение, которое отправляется продавцу в Центре уведомлений при одобрении/отклонении товара.

#. ``\Tygh\Storefront\RelationsManager`` — предоставляет функциональность отложенной загрузки для витрин.

#. ``\Tygh\Addons\VendorDataPremoderation\Comparator`` — проверяет объекты на изменения, которые требуют премодерации.

#. ``\Tygh\Addons\VendorDataPremoderation\Diff`` — хранит набор источников об изменении данных объекта.

#. ``\Tygh\Addons\VendorDataPremoderation\PremoderationSchema`` — представляет набор правил премодерации объекта.

#. ``\Tygh\Addons\VendorDataPremoderation\PremoderationSettingsInterface`` — описывает структуру хранилища настроек премодерации.

#. ``\Tygh\Addons\VendorDataPremoderation\ProductPremoderationSettings`` — проверяет, нужна ли премодерация при изменении полей, которые выбираются в настройках модуля "Премодерация данных продавцов".

#. ``\Tygh\Addons\VendorDataPremoderation\State`` — хранит состояние объекта, полученное из нескольких источников данных.

#. ``\Tygh\Addons\VendorDataPremoderation\StateFactory`` — загружает состояния объектов.

-------------
Новые функции
-------------

#. Проверяет, есть ли в промо-акции условие, связанное с кодом купона::

     fn_promotion_has_coupon_condition($conditions_group)

#. Получает статусы товаров для отображения в выборе статуса на страницах управления товарами::

     fn_get_product_statuses($status, $add_hidden = false, $lang_code = CART_LANGUAGE)

#. Получает статусы товаров для отображения в выборе статуса на форме поиска товаров::

     fn_get_all_product_statuses($lang_code = CART_LANGUAGE)

#. Получает идентификаторы компаний, которые владеют указанными товарами::

     fn_get_company_ids_by_product_ids(array $product_ids)

#. Получает главного администратора продавца (или первого администратора, если главный не найден)::

     fn_get_company_admin_user_id($company_id)

#. Одобряет товары::

     fn_vendor_data_premoderation_approve_products(array $product_ids, $update_product = true)

#. Отклоняет товары::

     fn_vendor_data_premoderation_disapprove_products(array $product_ids, $update_product = true, $reason = '')

#. Запрашивает одобрение для товаров::

     fn_vendor_data_premoderation_request_approval_for_products(array $product_ids, $update_product = true)

#. Получает статусы товаров::

     fn_vendor_data_premoderation_get_current_product_statuses(array $product_ids)

#. Проверяет, изменились ли данные товары и нужна ли их валидация::

     fn_vendor_data_premoderation_is_product_changed(State $initial_state, State $resulting_state)

#. Получает информацию о премодерации товара::

     fn_vendor_data_premoderation_get_premoderation($product_ids)

#. Обновляет информацию о премодерации товара::

     fn_vendor_data_premoderation_update_premoderation($product_id, $original_status, $reason = '')

#. Удаляет информацию о премодерации товара::

     fn_vendor_data_premoderation_delete_premoderation($product_ids)

#. Проверяет, требуется ли премодерация дли изменения товара этой компанией::

     fn_vendor_data_premoderation_product_requires_approval(array $company_data, $is_created = false)

#. Удаляет файлы модуля::

     fn_remove_addon_files($addon, $ftp_access = null)

#. Удаляет файлы по FTP::

     fn_rm_by_ftp($target, array $ftp_access)

#. Проверяет, установлена ли тема, которая задана для витрины::

     \Tygh\Storefront\Repository::isThemeInstalled($storefront_id, $theme_name)

#. Получает витрины, которым назначен определённый макет::

     \Tygh\Storefront\Repository::findByLayoutId($layout_id, $get_single = true)

#. Задаёт тему для витрины::

     \Tygh\Storefront\Repository::setTheme($storefront_id, $theme_name)

#. Проверяет, установлена ли тема для витрины::

     \Tygh\Themes\Themes::isInstalled($storefront_id)

#. Устанавливает тему для витрины::

     \Tygh\Storefront\Repository::installTheme($storefront_id, $theme_name, $copy_layouts_from_storefront_id = null)

#. Создаёт или обновляет подарочный сертификат::

     fn_update_gift_certificate($data, $id = 0, $params = [])

#. Проверяет, связано ли с этим объектом несколько витрин::

     \Tygh\Storefront\Repository::getSharingDetails(array $params)

#. Получает значение связанной сущности::

     \Tygh\Storefront\Storefront::getRelationValue($relation_name)

#. Задаёт значение связанной сущности::

     \Tygh\Storefront\Storefront::setRelationValue($relation_name, $value)

#. Удаляет значение связи из множества::

     \Tygh\Storefront\Storefront::removeRelationValues($relation_name, $removed_values)

#. Добавляет значение связи во множество::

     \Tygh\Storefront\Storefront::addRelationValues($relation_name, $added_values)

#. Добавляет новую запись в таблицу robots_data::

     \Tygh\Common\Robots::addRobotsDataForNewStorefront($storefront_id, $clone_storefront_id = null)

#. Получает robots_data для определённой витрины::

     \Tygh\Common\Robots::getRobotsDataByStorefrontId($storefront_id)

#. Задаёт новый robots_data для определённой витрины::

     \Tygh\Common\Robots::setRobotsDataForStorefrontId($storefront_id, $content)

#. Удаляет robots_data для определённой витрины::

     \Tygh\Common\Robots::deleteRobotsDataByStorefrontId($storefront_id)

#. Получает все правила уведомлений из БД::

     fn_get_notification_settings()

#. Добавляет правило об уведомлении в базу данных::

     fn_set_notification_settings($event_id, $transport_id, $receiver, $allowed = 1)

#. Получает количество товара на определённом складе::

     \Tygh\Addons\Warehouses\ProductStock::getAmountForWarehouse($warehouse_id)

#. Задаёт количество товара на указанном складе::

     \Tygh\Addons\Warehouses\ProductStock::setAmountForWarehouse($warehouse_id, $amount)

#. Генерирует карту сайта для витрины::

     fn_google_sitemap_generate_sitemap_for_storefront(Storefront $storefront, array $settings)

#. Получает полный путь к директории, где хранится карта сайта::

     fn_google_sitemap_get_sitemap_dir($storefront_id)

#. Получает полный путь к файлу карты сайта::

     fn_google_sitemap_get_sitemap_path($storefront_id, $index = null)

#. Получает список языков, для которых нужно сгенерировать карту сайта::

     fn_google_sitemap_get_sitemap_languages(Storefront $storefront)

#. Получает список витрин, для которых нужно сгенерировать карту сайта::

     fn_google_sitemap_get_storefronts()

#. Воссоздаёт директорию, в которой должны храниться карты сайта::

     fn_google_sitemap_recreate_sitemap_dir($storefront_id)

#. Создаёт index-файл для сгенерированных карт сайта::

     fn_google_sitemap_create_sitemap_index(Storefront $storefront, $last_modified_time, $file_counter)

#. Возвращает ID витрины, если он есть в $uri, (иначе возвращает ``false``)::

     fn_get_storefront_id_from_uri($uri)

#. Генерирует одноразовый пароль для пользователя::

     fn_user_generate_otp($user_id, $ttl = 300)

#. Генерирует одноразовый пароль и отправляет его пользователю::

     fn_user_send_otp($user_id, $ttl = 300)

#. Проверяет одноразовый пароль::

     fn_user_verify_otp($user_id, $password)

#. Удаляет одноразовый пароль пользователя::

     fn_user_delete_otp($user_id)

#. Осуществляет вход пользователя в учётную запись по паролю::

     fn_user_login_by_otp($user_id, $password)

#. Удаляет ekey по параметрам::

     fn_delete_ekey($ekey, $object_type = null, $object_id = null)

#. Получает идентификатор выбранного просмотра::

     \Tygh\Navigation\LastView\Backend::getCurrentViewId()

#. Получает состояние товара::

     fn_vendor_data_premoderation_get_product_state($product_id)

------------------
Изменённые функции
------------------

#.

   ::

     // Было:
     fn_uninstall_addon($addon_name, $show_message = true, $allow_unmanaged = false);

     // Стало:
     fn_uninstall_addon($addon_name, $show_message = true, $allow_unmanaged = false, $execute_schema_queries = true);


#.

   ::

     // Было:
     \Tygh\Providers\StorefrontProvider::__construct()

     // Стало:
     \Tygh\Providers\StorefrontProvider::__construct($url, array $request = [])



#.

   ::

     // Было:
     Tygh\Storefront\Factory::__construct(Connection $db, DataLoader $data_loader, Normalizer $normalizer)

     // Стало:
     Tygh\Storefront\Factory::__construct(Connection $db, RelationsManager $relations_manager, Normalizer $normalizer)


#.

   ::

     // Было:
     Tygh\Storefront\Repository::__construct(Connection $db, Factory $factory, Normalizer $normalizer)

     // Стало:
     Tygh\Storefront\Repository::__construct(Connection $db, Factory $factory, Normalizer $normalizer, RelationsManager $relation_manager, Robots $robots)


#.

   ::

     // Было:
     \Tygh\Storefront\Storefront::__construct$storefront_id, $url, $is_default, $redirect_customer, $status, $access_key, DataLoader $data_loader, $country_codes = null, $company_ids = null, $currency_ids = null, $language_ids = null)

     // Стало:
     \Tygh\Storefront\Storefront::__construct$storefront_id, $url, $is_default, $redirect_customer, $status, $access_key, RelationsManager $relation_manager, $name, $theme_name, array $relations = [])


#.

   ::

     // Было:
     fn_order_notification(&$order_info, $edp_data = array(), $force_notification = array())

     // Стало:
     fn_order_notification(&$order_info, $edp_data = array(), $force_notification = array(), $event_id = null)


#.

   ::

     // Было:
     function fn_google_sitemap_generate_link($object, $value, $languages, $extra = [])

     // Стало:
     function fn_google_sitemap_generate_link($type, $id, $languages, $extra = [], $storefront_id = null)


#.

   ::

     // Было:
     function fn_google_sitemap_generate_link($object, $value, $languages, $extra = [])

     // Стало:
     function fn_google_sitemap_generate_link($type, $id, $languages, $extra = [], $storefront_id = null)


#.

   ::

     // Было:
     function fn_google_sitemap_get_content($map_page = 0)

     // Стало:
     function fn_google_sitemap_get_content()


#.

   ::

     // Было:
     function fn_google_sitemap_check_counter(&$file, &$link_counter, &$file_counter, $links, $header, $footer, $type)

     // Стало:
     function fn_google_sitemap_check_counter(&$file, &$link_counter, &$file_counter, $links, $header, $footer, $type, Storefront $storefront)


#.

   ::

     // Было:
     function fn_delete_user_cart($user_ids, $data = '')

     // Стало:
     function fn_delete_user_cart($user_ids, $data = '', $storefront_id = 0)


#.

   ::

     // Было:
     fn_form_cart_from_abandoned($customer_id)

     // Стало:
     fn_form_cart_from_abandoned($params)


#.

   ::

     // Было:
     fn_get_available_shippings($company_id = null)

     // Стало:
     fn_get_available_shippings($company_id = null, $get_service_params = false)


#.

   ::

     // Было:
     fn_generate_ekey($object_id, $type, $ttl = 0, $ekey = '')

     // Стало:
     fn_generate_ekey($object_id, $type, $ttl = 0, $ekey = '', array $data = [])


#.

   ::

     // Было:
     \Tygh\Navigation\LastView\ACommon::__construct($area = AREA)

     // Стало:
     \Tygh\Navigation\LastView\ACommon::__construct($area = AREA, $controller = null, $mode = null, $action = null)


.. _4111-storefront-dependent-functions:

++++++++++++++++++
Привязка к витрине
++++++++++++++++++

#.

   ::

     // Было:
     \Tygh\BlockManager\Exim::instance($company_id = 0, $layout_id = 0, $theme_name = '')

     // Стало:
     \Tygh\BlockManager\Exim::instance($company_id = 0, $layout_id = 0, $theme_name = '', $storefront_id = null)


#.

   ::

     // Было:
     \Tygh\BlockManager\Layout::copy($to_company_id)

     // Стало:
     \Tygh\BlockManager\Layout::copy($to_company_id, $to_storefront_id = null)



#.

   ::

     // Было:
     \Tygh\BlockManager\Layout::instance($company_id = 0, $params = [])

     // Стало:
     \Tygh\BlockManager\Layout::instance($company_id = 0, $params = [], $storefront_id = null)


#.

   ::

     // Было:
     \Tygh\Less::parseUrls($content, $from_path, $to_path, $area = AREA)

     // Стало:
     \Tygh\Less::parseUrls($content, $from_path, $to_path, $area = AREA, $storefront_id = null)


#.

   ::

     // Было:
     \Tygh\SmartyEngine\Core::setArea($area, $area_type = '', $company_id = null)

     // Стало:
     \Tygh\SmartyEngine\Core::setArea($area, $area_type = '', $company_id = null, $storefront_id = null)


#.

   ::

     // Было:
     \Tygh\Themes\Themes::areaFactory($area = AREA, $company_id = null)

     // Стало:
     \Tygh\Themes\Themes::areaFactory($area = AREA, $company_id = null, $storefront_id = null)


#.

   ::

     // Было:
     fn_get_theme_path($path = '[theme]/', $area = AREA, $company_id = null, $use_cache = true)

     // Стало:
     fn_get_theme_path($path = '[theme]/', $area = AREA, $company_id = null, $use_cache = true, $storefront_id = null)

#.

   ::

     // Было:
     fn_install_theme($theme_name, $company_id = null, $install_layouts = true)

     // Стало:
     fn_install_theme($theme_name, $company_id = null, $install_layouts = true, $storefront_id = null)

#.

   ::

     // Было:
     fn_get_logos($company_id = null, $layout_id = null, $style_id = null)

     // Стало:
     fn_get_logos($company_id = null, $layout_id = null, $style_id = null, $storefront_id = null)

#.

   ::

     // Было:
     fn_update_logo($logo_data, $company_id = null)

     // Стало:
     fn_update_logo($logo_data, $company_id = null, $storefront_id = null)

#.

   ::

     // Было:
     fn_clone_layouts($data, $company_id, $to_company_id)

     // Стало:
     fn_clone_layouts($data, $company_id, $to_company_id, $storefront_id = null, $to_storefront_id = null)

#.

   ::

     // Было:
     \Tygh\BlockManager\Block::instance($company_id = 0, $params = [])

     // Стало:
     \Tygh\BlockManager\Block::instance($company_id = 0, $params = [], $storefront_id = null)

#.

   ::

     // Было:
     \Tygh\BlockManager\Block::copy($snapping_ids, $company_id, $replace_duplicates = false, $storefront_id = null)

     // Стало:
     \Tygh\BlockManager\Block::copy($snapping_ids, $company_id, $replace_duplicates = false)

#.

   ::

     // Было:
     \Tygh\BlockManager\Block::findDuplicate($block_id, $type, $properties, $name, $content, $lang_code = CART_LANGUAGE)

     // Стало:
     \Tygh\BlockManager\Block::findDuplicate($block_id, $type, $properties, $name, $content, $lang_code = CART_LANGUAGE, $storefront_id = null)

#.

   ::

     // Было:
     \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name, $content = '')

     // Стало:
     \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name, $content = '', $storefront_id = null)

------------------
Устаревшие функции
------------------

#. ``fn_change_approval_status``; вместо неё используйте:

   * ``fn_vendor_data_premoderation_approve_products``

   * ``fn_vendor_data_premoderation_disapprove_products``

   * ``fn_vendor_data_premoderation_request_approval_for_products``

#. ``fn_order_notification``: для отправки сообщений используйте сервис ``Tygh::$app['event.dispatcher']``.

#. ``fn_gift_certificate_notification``: для отправки сообщений используйте сервис ``Tygh::$app['event.dispatcher']``.

-----------------
Удалённые функции
-----------------

* ``fn_init_store_params_by_host``
* ``\Tygh\Common\Robots::addRobotsDataForNewCompany``
* ``\Tygh\Common\Robots::getRobotsDataByCompanyId``
* ``\Tygh\Common\Robots::setRobotsDataForCompanyId``
* ``\Tygh\Common\Robots::deleteRobotsDataByCompanyId``

----------------
Удалённые классы
----------------

Класс ``\Tygh\Storefront\DataLoader`` удалён. Используйте ``\Tygh\Storefront\RelationsManager``.

====
Хуки
====

----------
Новые хуки
----------

#. Выполняется после того, как стиль фильтра определился по данным фильтра для Storefront REST API. Позволяет изменить определившийся стиль фильтра::

     fn_set_hook('storefront_rest_api_get_filter_style_post', $filter, $filter_style, $field_type);

#. Выполняется после получения настроек прайс-листа. Позволяет изменить получение настроек::

     fn_set_hook('yml_export_get_options_post', $price_id, $options);

#. Добавляет дополнительные действия перед обновлением изображений::

     fn_set_hook('update_image_pairs_pre', $icons, $detailed, $pairs_data, $object_id, $object_type, $object_ids, $update_alt_desc, $lang_code, $from_exist_pairs);

#. Позволяет изменить параметры импорта изображений перед импортом::

     fn_set_hook('exim_import_images_pre', $prefix, $image_file, $detailed_file, $position, $type, $object_id, $object, $import_options, $perform_import);

#. Выполняется перед инициализацией Last View Tools. Позволяет изменить параметры запроса::

     fn_set_hook('last_view_init_view_tools_pre', $this, $params);

#. Выполняется перед имзенением статуса объекта сразу перед обновлением статуса в БД. Позволяет изменить сохранённые данные::

     fn_set_hook('tools_update_status_before_query', $params, $old_status, $status_data, $condition);

#. Выполняется после получения списка статусов товара. Позволяет добавить или убрать статусы товара оттуда::

     fn_set_hook('get_product_statuses_post', $status, $add_hidden, $lang_code, $statuses);

#. Выполняется после получения списка статусов товара. Позволяет добавить или убрать статусы товара оттуда::

     fn_set_hook('get_all_product_statuses_post', $lang_code, $statuses);

#. Выполняется перед одобрением товаров. Позволяет изменить список идентификаторов одобренных товаров::

     fn_set_hook('vendor_data_premoderation_approve_products_pre', $product_ids, $update_product);

#. Выполняется перед отклонением товаров. Позволяет изменить список идентификаторов отклонённых товаров::

     fn_set_hook('vendor_data_premoderation_disapprove_products_pre', $product_ids, $update_product, $reason);

#. Выполняется перед запросом одобрения товаров. Позволяет изменить список идентификаторов товаров, которые находятся на модерации::

     fn_set_hook('vendor_data_premoderation_request_approval_for_products_pre', $product_ids, $update_product);

#. Выполняется перед получением экземпляра менеджера импорта/экспорта макетов. Позволяет модифицировать параметры, передаваемые в функцию::

     fn_set_hook('exim_instance_pre', $company_id, $layout_id, $theme_name, $storefront_id);

#. Выполняется перед получением экземпляра менедженра макетов. Позволяет модифицировать параметры, передаваемые в функцию::

     fn_set_hook('layout_instance_pre', $company_id, $params, $storefront_id);

#. Выполняется перед получением фабрики тем для панели администратора или витрины. Позволяет модифицировать параметры, передаваемые в функцию::

     fn_set_hook('themes_area_factory_pre', $area, $company_id, $storefront_id);

#. Выполняется перед установкой темы. Позволяет модифицировать параметры, передаваемые в функцию::

     fn_set_hook('install_theme_pre', $theme_name, $company_id, $install_layouts, $storefront_id);

#. Выполняется перед получением экземпляра менеджера блоков. Позволяет модифицировать параметры, передаваемые в функцию::

     fn_set_hook('block_instance_pre', $company_id, $params, $storefront_id);

#. Выполняется после создания заказа в панели администратора. Позволяет выполнять дополнительные действия и изменять полученные результаты::

     fn_set_hook('place_order_manually_post', $cart, $params, $customer_auth, $action, $issuer_id, $force_notification, $order_info, $edp_data, $is_order_placed_notification_required);

#. Выполняется после обновления информации о заказе в панели администратора. Позволяет выполнять дополнительные действия, например, отправку уведомлений::

     fn_set_hook('update_order_details_post', $params, $order_info, $edp_data, $force_notification);

#. Выполняется при генерации ссылки в карте сайта. Позволяет генерировать ссылки для собственных записей в карте сайта::

     fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id);

#. Выполняется после того, как создана карта сайта для витрины. Позволяет записывать в карту сайта дополнительные элементы::

     fn_set_hook('google_sitemap_generate_sitemap_for_storefront_after_items', $storefront, $settings, $file, $last_modified_time, $link_counter, $file_counter);

#. Выполняется после удаления пункта самовывоза/магазина/склада. Позволяет модифицировать результаты удаления и удалить соответствующие данные::

     fn_set_hook('store_locator_delete_store_location_post', $store_location_id, $affected_rows, $deleted);

#. Выполняется перед получением пункта самовывоза/магазина/склада. Позволяет модифицировать условия или JOIN'ы выборки::

     fn_set_hook('store_locator_get_store_location_before_select', $store_location_id, $lang_code, $fields, $join, $condition);

#. Выполняется перед обновлением пункта самовывоза/магазина/склада. Позволяет менять данные::

     fn_set_hook('store_locator_update_store_location_post', $store_location_data, $store_location_id, $lang_code);

#. Выполняется после обновления тарифной зоны. Позволяет менять данные, возвращённые функцией::

     fn_set_hook('update_destination_post', $data, $destination_id, $lang_code);

#. Выполняется после удаления тарифных зон. Позволяет очистить любые связанные данные::

     fn_set_hook('delete_destinations_post', $destination_ids);

#. Выполняется перед получением промо-акций. Позволяет изменить параметры, переданные в функцию::

     fn_set_hook('get_promotions_pre', $params, $items_per_page, $lang_code);

#. Позволяет переопределить параметры выбоки блоков::

     fn_set_hook('get_blocks', $params, $items_per_page, $lang_code, $fields, $sortings, $conditions, $joins);

#. Выполняется после получения пункта самовывоза/магазина/склада. Позволяет менять его данные::

     fn_set_hook('store_locator_get_store_location_post', $store_location_id, $lang_code, $store_location);

#. Выполняется при создании или обновлении пункта самовывоза/магазина/склада, перед тем, как данные сохраняются в БД. Позволяет менять данные::

     fn_set_hook('store_locator_update_store_location_before_update', $store_location_data, $store_location_id, $lang_code);

#. Выполняется перед удалением файлов товаров. Позволяет проверить файлы товаров перед удалением::

     fn_set_hook('delete_product_files_before_delete', $file_ids, $product_id);

#. Выполняется перед удалением папок с файлами товаров. Позволяет проверить папки и файлы товара перед удалением::

     fn_set_hook('delete_product_file_folders_before_delete', $folder_ids, $file_ids, $product_id);

#. Выполняется перед обновлением файла товара. Позволяет менять данные файла товара::

     fn_set_hook('update_product_file_pre', $product_file, $file_id, $lang_code);

#. Выполняется перед получением вариантов настройки "Нужна проверка, если изменится" у модуля "Премодерация данных продавцов". Позволяет добавить новые варианты настройки или изменить уже существующие::

     fn_set_hook('settings_variants_addons_vendor_data_premoderation_product_premoderation_fields_post', $variants);

---------------
Изменённые хуки
---------------

#.

   ::

     // Было:
     fn_set_hook('get_theme_path_pre', $path, $area, $company_id, $theme_names);

     // Стало:
     fn_set_hook('get_theme_path_pre', $path, $area, $company_id, $theme_names, $use_cache, $storefront_id);

#.

   ::

     // Было:
     fn_set_hook('get_logos_pre', $company_id, $layout_id, $style_id);

     // Стало:
     fn_set_hook('get_logos_pre', $company_id, $layout_id, $style_id, $storefront_id);

#.

   ::

     // Было:
     fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id);

     // Стало:
     fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id, $saved_category_ids);

#.

   ::

     // Было:
     fn_set_hook('get_store_locations_before_select', $params, $fields, $joins, $conditions);

     // Стало:
     fn_set_hook('get_store_locations_before_select', $params, $fields, $joins, $conditions, $sortings, $items_per_page, $lang_code);

#.

   ::

     // Было:
     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition);

     // Стало:
     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition, $get_service_params);

#.

   ::

     // Было:
     fn_set_hook('get_product_files_before_select', $params, $fields, $join, $condition);

     // Стало:
     fn_set_hook('get_product_files_before_select', $params, $fields, $join, $condition, $sortings, $lang_code);

---------------
Устаревшие хуки
---------------

#. Хук ``change_approval_status_pre`` устарел. Вместо него используйте: 

   * ``vendor_data_premoderation_approve_products_pre``

   * ``vendor_data_premoderation_disapprove_products_pre``

   * ``vendor_data_premoderation_request_approval_for_products_pre``

#. Хуки ``send_order_notification`` и ``order_notification`` устарели. Вместо них используйте:

   * ``place_order_manually_post``

   * ``update_order_details_post``

   * ``change_order_status_post``

#. Хук ``sitemap_link_object`` устарел. Вместо него используйте ``google_sitemap_generate_link_get_object_link``.

#. Хук ``sitemap_link`` устарел. Вместо него используйте ``google_sitemap_generate_link_post``.

#. Хук ``sitemap_item`` устарел. Вместо него используйте ``google_sitemap_generate_sitemap_for_storefront_after_items``.
