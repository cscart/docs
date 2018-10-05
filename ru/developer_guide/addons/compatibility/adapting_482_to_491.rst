******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.9.1
******************************************************

===============
Общие изменения
===============

#. Добавлены типы профилей. Пока существует два типа:

   * ``U`` — профиль пользователя (администратора, покупателя, администратора продавца);

   * ``S`` — профиль продавца.

   На страницу управления полями профиля (**Администрирование → Поля профиля**) добавлен переключатель типа профиля. Боковая панель с переключателем появляется, если доступно более одного типа профилей.

   Раздел *Информация о продавце* на странице управления полями профиля определяет, какие поля появятся в форме "Получить учётную запись продавца".

#. Поддержка поля ``fax`` была убрана из кода и шаблонов. В существующих установках поле ``fax`` в таблице ``cscart_companies`` останется неизменным, но в новых установках его не будет.

#. Теперь нельзя изменить тип группы пользователей после того, как она была создана. Также нельзя назначаить группу пользователям не того типа.

#. Администратор продавца с назначенной ему группой теперь не считается *администратором с ограниченными правами* (restricted administrator).

#. Теперь в схеме *blocks* доступна новая директива ``show_on_locations``. Она позволяет указать места, куда можно добавить блок. Это ограничение работает, если вы пытаетесь добавить блок через интерфейс, а также не показывает блок, если он уже был добавлен.

#. Добавлена новая настройка на вкладку **Товары** в модуль **Отзывы и комментарии**. Она разрешает оставлять отзывы о товаре только тем, кто его купил.

#. Немного изменилась логика размещения отзывов. Теперь пользователь должен войти в учётную запись, чтобы оставить отзыв. Если пользователь не вошёл в учётную запись, то при попытке оставить отзыв откроется форма авторизации. И форма авторизации, и новая форма для написания отзыва теперь подгружаются через AJAX.

#. Изменился интерфейс закрытия витрин(ы):

   * В ``ULTIMATE`` витрину теперь можно закрыть на списке витрин или на странице редактирования витрины. Верхняя панель меню меняет цвет в зависимости от статуса витрины, которая сейчас выбрана. В режиме "Все магазины" будет появляться иконка замка, и она будет выглядеть по-разному в зависимости от того, сколько магазинов закрыто.

   * В ``MULTIVENDOR`` цвет верхней панели меню будет меняться в зависимости от того, открыта витрина или закрыта. Иконка замка будет вести на страницу **Настройки → Общие**, где витрину можно открыть.

#. Добавлен модуль **Тарифные планы для продавцов: Комиссии для категорий**. Он позволяет задавать комиссии на заказы в зависимости от того, товары из каких категорий входят в эти заказы.

----------
Блокировки
----------

Добавлен компонент для блокировок на основе `symfony/lock <https://symfony.com/doc/3.4/components/lock.html>`_; он позволяет гарантировать эксклюзивный доступ к общим ресурсам.

Чтобы создать блокировку, используйте ``Tygh::$app['lock.factory']``.

Пример использования::

  $lock = Tygh::$app['lock.factory']->createLock('pdf-invoice-generation');

  if ($lock->acquire()) {
     // The resource "pdf-invoice-generation" is locked.
     // You can compute and generate invoice safely here.

     $lock->release();
  }

В блок-менеджер, в компиляцию стилей и JS добавлена эксклюзивная блокировка, чтобы избежать состояния гонки.

Чтобы отключить блокировки, используйте провайдера ``dummy``::

  $config['lock_backend'] = 'dummy';

------------------
Устаревшие шаблоны
------------------

* design/backend/templates/views/orders/components/payments/business_check.tpl

* design/backend/templates/views/orders/components/payments/check.tpl

* design/backend/templates/views/orders/components/payments/fax.tpl

* design/themes/basic/templates/views/orders/components/payments/business_check.tpl

* design/themes/basic/templates/views/orders/components/payments/check.tpl

* design/themes/basic/templates/views/orders/components/payments/fax.tpl

* design/themes/responsive/templates/views/orders/components/payments/business_check.tpl

* design/themes/repsonsive/templates/views/orders/components/payments/check.tpl

* design/themes/responsive/templates/views/orders/components/payments/fax.tpl

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук позволяет изменять поля профиля после их получения::

     fn_set_hook('get_profile_fields_post', $location, $_auth, $lang_code, $params, $profile_fields, $sections);

#. Этот хук позволяет изменять доступность группы для пользователя после того, как прошла основная проверка::

     fn_set_hook('check_usergroup_available_for_user_post', $user_id, $usergroup_id, $result);

#. Этот хук позволяет изменять привилегии после их получения::

     fn_set_hook('get_privileges_post', $usergroup, $privileges);

#. Этот хук позволяет менять доступность привилегий группы пользователей после основной проверки::

     fn_set_hook('check_can_usergroup_have_privileges_post', $usergroup, $result);

#. Этот хук позволяет расширять доступные типы групп пользователей::

     fn_set_hook('usergroup_types_get_list', $types);

#. Этот хук позволяет расширять соотнесение типов пользователей и типов групп пользователей::

     fn_set_hook('usergroup_types_get_map_user_type', $map);

#. Этот хук выполняется сразу полсе того, как получены данные аутентификации пользователя из заголовков API-запроса. Хук позволяет изменять данные, которые идентифицируют пользователя, использующего API::

     fn_set_hook('api_get_user_data', $this, $auth);

#. Этот хук позволяет пропустить очистку корзины при включении режима каталога::

     fn_set_hook('fn_vendor_debt_payout_catalog_mode_pre_add_to_cart', $product_data, $cart, $auth, $update, $can_delete);

#. Этот хук позволяет повлиять на процесс обновления цен товара::

     fn_set_hook('update_product_prices', $product_id, $_product_data, $company_id, $skip_price_delete, $table_name, $condition);

---------------
Изменённые хуки
---------------

#.

   ::

     // Было:
     fn_set_hook('update_product_amount_pre', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $product_code);

     // Стало:
     fn_set_hook('update_product_amount_pre', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $product_code, $notify);

#.

  ::

    // Было:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking);

    // Стало:
    fn_set_hook('update_product_amount', $new_amount, $product_id, $cart_id, $tracking, $notify);

#.

  ::

    // Было:
    fn_set_hook('update_product_amount_post', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $new_amount, $product_code);

    // Стало:
    fn_set_hook('update_product_amount_post', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $new_amount, $product_code, $notify);

---------------
Устаревшие хуки
---------------

``fn_set_hook('profile_fields_areas', $areas);`` устарел; используйте вместо него схему *profile_fields*.

====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Выстраивает категории товаров в базе данных по порядку::

     fn_sort_product_categories($product_id, array $category_ids)

#. Проверяет, можно ли назначить этому пользователю группу с таким ID::

     fn_check_usergroup_available_for_user($user_id, $usergroup_id)

#. Получает привилегии группы пользователей::

     fn_get_usergroup_privileges(array $usergroup)

#. Проверяет, могут ли у этой группы пользователей быть привилегии::

     fn_check_can_usergroup_have_privileges(array $usergroup)

#. Получает все доступные группы пользователей по типу пользователя::

     fn_get_available_usergroups($user_type)

#. Получает ключ доступа для определённой закрытой витрины::

     fn_ult_get_storefront_access_key($company_id)

#. Получает статус определённой витрины::

     fn_ult_get_storefront_status($company_id)

#. Открывает определённую витрину::

     fn_ult_open_storefront($company_id)

#. Закрывает определённую витрину::

     fn_ult_close_storefront($company_id)

#. Определяет, должна ли на этом шаге оформления заказа заново рассчитываться стоимость доставки::

     function fn_checkout_step_needs_shipping_calculation($cart, $completed_steps)

#. Определяет, были ли изменены данные пользователя в корзине::

     function fn_is_cart_user_data_changed(array &$cart, array $auth)

#. Получает тип предложения::

     Tygh\Ym\Offers::getOfferType($product)

#. Получает язык карты::

     fn_rus_pickup_get_map_language()

------------------
Изменённые функции
------------------

#.

  ::

    // Было:
    function fn_set_store_mode($store_mode, $company_id = null)

    // Стало:
    function fn_set_store_mode($store_mode, $company_id = null, $clear_cache = true)


#.

  ::

    // Было:
    function fn_update_product_amount($product_id, $amount, $product_options, $sign)

    // Стало:
    function fn_update_product_amount($product_id, $amount, $product_options, $sign, $notify = true)

#. ``\Tygh\Registry::loadFromCache`` теперь получает значение из кэша с определённым ключом.

#. ``\Tygh\BlockManager\RenderManager::registerBlockCacheIfNeeded`` теперь возвращает массив с параметром кэширования в случае успеха.

#. ``fn_get_usergroups`` теперь возвращает только зарегистрированные типы групп пользователей. Чтобы зарегистрировать тип группы пользователей, воспользуйтесь хуком ``usergroup_types_get_list``.

#. ``fn_define_usergroups`` теперь задаёт только зарегистрированные типы групп пользователей. Чтобы зарегистрировать тип группы пользователей, воспользуйтесь хуком ``usergroup_types_get_map_user_type``.

------------
Новые классы
------------

#. ``Tygh\Enum\Addons\Pickup\MapLanguage`` — перечисление языков карты.

#. ``\Tygh\Addons\AdvancedImport\Readers\Factory::uploadPresetFile(array $preset, $company_id = null)`` — управление загрузкой файла пресета.
