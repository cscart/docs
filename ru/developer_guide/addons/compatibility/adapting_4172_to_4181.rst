*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.18.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

    
.. important::

    CS-Cart Beta 4.18.1 и релиз CS-Cart 4.18.1 имеют некоторые отличия. Ниже мы оставили отдельный :ref:`список этих отличий <comparing-beta-to-release>`.

================
Изменения в ядре
================

------------------
Измененные функции
------------------

#. ::

       // Было:
       function fn_filter_uploaded_data($name, array $filter_by_ext = [], $show_default_error_notifications = true, $sanitaze_filename = true)
       // Стало:
       function fn_filter_uploaded_data($name, array $filter_by_ext = [], $show_default_error_notifications = true, $sanitaze_filename = true, $filter_by_file_size_bytes = false)


#. ::

       // Было:
       function fn_check_uploaded_data(array $uploaded_data, array $filter_by_ext)
       // Стало:
       function fn_check_uploaded_data(array $uploaded_data, array $filter_by_ext, $filter_by_file_size_bytes = false)


-------------
Новые функции
-------------

#. Получает направление языка::

        \Tygh\Template\IContext::getLanguageDirection()

#. Получает направление языка::

        \Tygh\Template\Snippet\Table\ItemContext::getLanguageDirection()

#. Получает направление языка::

        \Tygh\Template\Mail\Context::getLanguageDirection()
        
#. Получает направление языка::

        \Tygh\Template\Internal\Context::getLanguageDirection()
        
#. Получает направление языка::

        \Tygh\Template\Document\Order\Context::getLanguageDirection()


.. _Dynamic-actions-display-updated:

-------------------------------------------
Обновлено отображение динамических действий
-------------------------------------------

Обновлено отображение **динамических действий** ``$navigation.dynamic.actions``. Они отображаются в правом верхнем углу страницы. Теперь динамические действия являются предпочтительным элементом интерфейса для отображения действий и подстраниц. Динамические действия отображаются в виде кнопок. Если кнопок много, то часть из них отображается в виде выпадающего меню.

Требования для динамических действий:

- Используйте глаголы в названиях кнопок. Например: используйте **Add several products**.
- Кнопки должны работать как в виде кнопок, так и в виде пунктов в выпадающем меню.

Пример добавления кнопки через контроллер
-----------------------------------------

**app/addons/my_changes/controllers/backend/products.post.php**
::

    <?php

    use Tygh\ Registry;

    defined('BOOTSTRAP') or die('Access denied');

    if ($mode === 'manage') {
        Registry::set('navigation.dynamic.actions', [
            'my_changes.test_button' => [
                'href' => 'categories.manage',
                'text' => __('my_changes.view_my_changes'),
            ]
        ]);
    }

Полный список доступных параметров см. :ref:`Динамические действия в шапке сайта <dynamic-actions-in-site>`.

---------------------------------------------------
Изменилось отображение верхнего и центрального меню
---------------------------------------------------

- Расширение **верхнего меню** ``$navigation.static.top`` обновлено.

- Меню **Add-ons** ``$navigation.static.top.addons`` теперь отображается под **центральным меню**. Подменю ``subitems`` признано устаревшим. Вместо него используйте динамические действия.

- Меню **Administration** ``$navigation.static.top.administration`` теперь отображается на новой странице **Settings** (``dispatch=administration.view``). Вместо подменю ``subitems`` рекомендуется использовать динамические действия.

- Меню **Settings** ``$navigation.static.top.settings`` теперь отображается только на странице **Settings** → **General** (``dispatch=settings.manage``). Для отображения пунктов меню необходимо использовать тип ``setting``.

- Меню **Design** ``$navigation.static.top.design`` признано устаревшим. Вместо него расширяйте меню **Website** ``$navigation.static.central.website``.

- Вместо **верхнего меню** теперь отображается **верхняя панель** ``top_bar.tpl``. Расширить её можно с помощью хука шаблона ``menu:top_bar_right``.

- Расширение **центрального меню** ``$navigation.static.central`` обновлено. Центральное меню теперь располагается в сайдбаре. Для его расширения используйте ``$navigation.static.central``. Подменю ``subitems`` признано устаревшим. Вместо него используйте динамические действия. Используйте короткие названия пунктов меню (до ~15 символов). Описания пунктов меню больше не отображаются.

----------------------------------------
Динамические секции признаны устаревшими
----------------------------------------

**Динамические секции** ``$navigation.dynamic.sections`` признаны устаревшими. Вместо них используйте динамические действия.


.. _gear-buttons-deprecated:

--------------------------------------
Кнопки шестеренки признаны устаревшими
--------------------------------------

**Кнопки шестеренки** на списке объектов признаны устаревшими (например, на странице списка товаров). Используйте вместо них динамические действия. Обратите внимание, что динамические действия можно отображать и как отдельные кнопки, и как элементы выпадающего меню.

.. _search-filter-extension-deprecated:

-----------------------------------------------------------------------------------------
Расширение поисковых фильтров через шаблон на странице списка товаров признано устаревшим
-----------------------------------------------------------------------------------------

Поисковые фильтры на списке товаров (?dispatch=products.manage) теперь задаются с помощью массива. Используйте хук ``products:search_data`` для её расширения. Например, чтобы добавить текстовое поле подключите хук:

**design/backend/templates/addons/my_changes/hooks/products/search_data.post.tpl**
::

    {$search_filters.data.my_changes_filter = [
        id => "my_changes_filter",
        type => "input",
        category => "secondary",
        label => __("my_changes_filter"),
        value => $search.my_changes_filter_value,
        placeholder => __("my_changes_filter_placeholder")
    ]}

    {* Export *}
    {$search_filters = $search_filters scope=parent}


Хуки ``products:simple_search``, ``companies:products_advanced_search``, ``products:search_form``, ``products:search_in_orders`` и ``products:advanced_search`` для расширения списков товаров признаны устаревшими. Хук ``products:select_search`` признан устаревшим, используйте хук ``products:sort_by_content`` вместо него.

Пример подключения поисковых фильтров можно найти в секции :ref:`Поисковые фильтры на странице списка товаров <search-filters-on-product-list>`.

------------------
Сохраненные поиски
------------------

Для отображения сохраненных поисков используйте параметр ``saved_search``. Пример сохраненных поисков страницы списка товаров:

**design/backend/templates/views/products/manage.tpl**
::

    {$search_form_dispatch = $dispatch|default:"products.manage"}
    {$saved_search = [
        dispatch => $search_form_dispatch,
        view_type => "products"
    ]}
    {include file="common/mainbox.tpl"
        ...
        saved_search=$saved_search
    }

    
.. _extending-dashboard-analytics-blocks-through-template:

----------------------------------------------------------------------------------
Расширение блоков аналитики Dashboard через хуки шаблонов больше не поддерживается
----------------------------------------------------------------------------------

Теперь расширение блоков аналитики Dashboard необходимо делать через схему. Например:

**app/addons/my_changes/schemas/dashboard/blocks.post.php**
::
    <?php

    use Tygh\Enum\DashboardSections;

    defined('BOOTSTRAP') or die('Access denied');

    $schema[DashboardSections::TERTIARY]['my_changes'] = [
        'id' => 'my_changes',
        'title' => __('my_changes.dashboard.my_changes'),
        'position' => 100,
        'dispatch' => 'products.manage',
        'content_data_function' => 'fn_my_changes_get_dashboard_block_data'
    ];

    return $schema;

**app/addons/my_changes/func.php**
::
    <?php


    if (!defined('BOOTSTRAP')) { die('Access denied'); }


    function fn_my_changes_get_dashboard_block_data()
    {
        $content_data = [
            'id' => 'my_changes',
            'title' => __('my_changes.dashboard.title'),
            'title_button' => [
                'href' => 'products.manage',
                'name' => __('my_changes.dashboard.title_button'),
            ],
            'number' => 1234,
        ];
    
        return $content_data;
    }

    
Полный список доступных параметров см. раздел  :ref:`Карточка аналитики для Dashboard <analytics-card-for-dashboard>`. 

Расширять содержимое существующих блоков можно с помощью `get_dashboard_XXX` хуков. Список всех хуков и их описание см. в разделе **Backend. Hook changes. New hooks**.

-------------------------------
Setup wizard признан устаревшим
-------------------------------

**Setup wizard** признан устаревшим. Вместо него используйте вкладку **Settings** настроек своего модуля. Теперь Less-переменные в CS-Cart соответствуют `Bootstrap 2 <https://getbootstrap.com/2.3.2/>`_.

----------------------------
Обновлено отображение иконок
----------------------------

Подключаться иконки теперь должны через компонент ``common/icon.tpl``. Остальные способы признаны устаревшими и больше работать не будут. Библиотека иконок **Font Awesome** была заменена на фирменные иконки CS-Cart. Теперь вместо **иконочного шрифта** используются векторные **SVG-иконки**. Изменились параметры подключения иконок. Подключение иконок через параметр ``class`` (например, ``class="icon-warning-sign"``) признано устаревшим. Необходимо использовать параметр ``source`` (например, ``source="warning_sign"``) со значением в snake_case и без префикса ``icon-``. Пример подключения иконки см. :ref:`SVG-иконки <SVG-icons>`.

--------------------------
Изменилась ширина страницы
--------------------------

**Верхнее** и **центральное меню** теперь отображается слева. Следственно, уменьшилась доступная ширина для отображения контента страницы. Проверьте отображения свои страниц на маленьких экранах.

**Убрано ограничение по ширине** отображения страницы. Теперь сайт отображается во всю доступную ширину окна. Проверьте корректность отображения элементов интерфейса на больших экранах.

---------------------------------
Изменились Less-переменные стилей
---------------------------------

Были изменены и удалены некоторые **Less-переменные** стилей (цвета, размеры, и т. п). Теперь Less-переменные CS-Cart соответствуют Less-переменным **Bootstrap 2** ``css/lib/twitterbootstrap/variables.less``.

Вместо хардкода значений в стилях, используйте Less-переменные и CSS custom properties из ``css/config.less`` для стилей в своих модулях. Для получения других значений, используйте Less-функции. Например, функции ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%)`` делают **Text muted color**. Подробнее о `lessphp <https://leafo.net/lessphp/docs/>`_ и `Less <https://lesscss.org/>`_. Подробнее об удаленных Less-переменных см. :ref:`Удаленные переменные стилей <Deleted style variables>`.

-----------------
Удаленные функции
-----------------

#. ``fn_master_products_generate_navigation_sections``

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется после получения данных блока панели управления, позволяет их редактировать::

    fn_set_hook('get_dashboard_block_data', $content_data, $this);

#. Выполняется после заполнения информации о содержимом блока со статистикой продаж, позволяет ее редактировать::

    fn_set_hook('get_dashboard_sales_block_data', $content_data, $this);

#. Выполняется после заполнения информации о содержимом блока со статистикой продуктов, позволяет ее редактировать::

    fn_set_hook('get_dashboard_products_block_data', $content_data, $this);

#. Выполняется после заполнения информации о содержимом блока со статистикой заказов, позволяет ее редактировать::

    fn_set_hook('get_dashboard_orders_block_data', $content_data, $this);

#. Выполняется после заполнения информации о содержимом блока со статистикой заказов по статусам, позволяет ее редактировать::

    fn_set_hook('get_dashboard_orders_by_statuses_block_data', $content_data, $this);

#. Выполняется после заполнения информации о содержимом блока с балансом поставщика, позволяет ее редактировать::

    fn_set_hook('get_dashboard_vendor_balance_block_data', $content_data, $this); 

#. Выполняется после заполнения информации о содержимом блока со статистикой активности поставщика, позволяет ее редактировать::

    fn_set_hook('get_dashboard_vendor_with_sales_block_data', $content_data, $this); 

#. Выполняется после заполнения информации о содержимом блока со статистикой компаний или поставщиков, позволяет ее редактировать::

    fn_set_hook('get_dashboard_stores_block_data', $content_data, $this); 

#. Выполняется после заполнения информации о содержимом блока со статистикой пользователей, позволяет ее редактировать::

    fn_set_hook('get_dashboard_customers_block_data', $content_data, $this); 

#. Выполняется после заполнения информации о содержимом блока с последними записями, позволяет ее редактировать::

    fn_set_hook('get_dashboard_logs_block_data', $content_data, $this);

#. Выполняется после обновления данных о наличии товаров на складах::

    fn_set_hook('warehouses_recalculate_destination_products_stocks', $this, $params, $product_condition);

#. Выполняется после удаления данных о количестве товаров::

    fn_set_hook('warehouses_remove_product_stocks_post', $this, $product_id);


#. Выполняется перед обновлением/созданием баннера::

    fn_set_hook('banners_update_banner_pre', $data, $banner_id, $lang_code);


---------------
Измененные хуки
---------------

#. ::

       // Было:
       fn_set_hook('create_order_details', $order_id, $cart, $order_details, $extra);
       // Стало:
       fn_set_hook('create_order_details', $order_id, $cart, $order_details, $extra, $k, $v);

#. ::

       // Было:
       fn_set_hook('add_to_cart', $cart, $product_id, $_id);
       // Стало:
       fn_set_hook('add_to_cart', $cart, $product_id, $_id, $_data);


#. ::

       // Было:
       fn_set_hook('filter_uploaded_data_post', $name, $filter_by_ext, $filtered, $udata_local, $udata_other, $utype);
       // Стало:
       fn_set_hook('filter_uploaded_data_post', $name, $filter_by_ext, $filtered, $udata_local, $udata_other, $utype, $filter_by_file_size_bytes);


#. ::

       // Было:
       fn_set_hook('check_uploaded_data_pre', $uploaded_data, $filter_by_ext, $result, $processed);
       // Стало:
       fn_set_hook('check_uploaded_data_pre', $uploaded_data, $filter_by_ext, $result, $processed, $filter_by_file_size_bytes);



#. ::

       // Было:
       fn_set_hook('check_uploaded_data_post', $uploaded_data, $filter_by_ext, $result, $processed);
       // Стало:
       fn_set_hook('check_uploaded_data_post', $uploaded_data, $filter_by_ext, $result, $processed, $filter_by_file_size_bytes);

====================
Изменения в шаблонах
====================

----------------
Новые компоненты
----------------

.. _dynamic-actions-in-site:

Динамические действия в шапке сайта
-----------------------------------

**design/backend/templates/components/menu/actions_menu.tpl**

Динамические действия отображаются как кнопки. Если кнопок много, то некоторые из них отображаются как выпадающий список. Свойства отностятся к хелперу ``{btn}`` из ``buttons/helpers.tpl``, плюс дополнительный параметр ``wrapper_class``. Тип по умолчанию ``text``. Использование динамических действий описано в разделе :ref:`Обновлено отображение динамических действий <Dynamic-actions-display-updated>`.

Example usage:

**app/addons/my_changes/schemas/menu/actions.post.php**


::

    <?php
    defined('BOOTSTRAP') or die('Access denied');

    /** @var array $schema */
    $schema['my_changes.manage']['my_changes.test_button'] = [
        'href' => 'categories.manage',
        'text' => __('my_changes.actions.view_my_changes'),
        'text_mobile' => __('my_changes.actions.view_my_changes_mobile'),
        'id' => 'my_changes_id',
        'class' => 'my-changes-class',
        'data' => [
            'data-ca-my-changes-param-1' => 'my_value_1',
            'data-ca-my-changes-param-2' => 'my_value_2',
        ],
        'wrapper_class' => 'my-changes-wrapper-class',
        'position' => 100
    ];

    return $schema;
    
Доступные параметры:

- ``type``
- ``href``
- ``text`` Если параметр недоступен, то используется языковая переменная ключа массива (до 30 символов).
- ``text_mobile`` Если параметр недоступен, используется ``text`` (до 20 символов).
- ``title``
- ``id``
- ``class``
- ``meta``
- ``dispatch``
- ``form``
- ``method``
- ``target``
- ``target_id``
- ``process``
- ``onclick``
- ``icon``
- ``data``
- ``wrapper_class``


----------------------
Обновленные компоненты
----------------------

.. _search-filters-on-product-list:

Поисковые фильтры на странице списка товаров
--------------------------------------------

Шаблон: ``views/products/components/search_filters/get_product_search_filters.tpl``


**Использование**


**design/backend/templates/addons/my_changes/hooks/products/search_data.post.tpl**


::

    {$search_filters.data.my_changes_filter = [
        id => "my_changes_filter",
        type => "input",
        category => "secondary",
        label => __("my_changes_filter"),
        value => $search.my_changes_filter_value,
        placeholder => __("my_changes_filter_placeholder"),
        is_enabled => true,
        is_hidden => false,
        content => "HTML content",
        data => [
            name_from => "my_changes_filter_from",
            value_from => $search.my_changes_filter_from,
            label_from => __("my_changes_filter_from"),
            name_to => "my_changes_filter_to",
            value_to => $search.my_changes_filter_to,
            label_to => __("my_changes_filter_to")
        ],
        nested_data => [
            my_changes_filter_param => [
                key => "my_changes_filter_param",
                label => __("my_changes_filter_param"),
                value => true,
                is_checked => ($search.my_changes_filter_param === "YesNo::YES"|enum)
            ]
        ]
    ]}

    {* Export *}
    {$search_filters = $search_filters scope=parent}

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30

    *   -   Параметр
        -   Тип
        -   Описание и значение
    *   -   id
        -   String
        -   ID поискового фильтра.
    *   -   type
        -   Enum
        -   | *Опционально*. Тип поискового фильтра.
            |
            | ``input`` (default)            
            | ``range``
            | ``radio``
            | ``checkbox``
            | ``dropdown``
            | ``popup``
    *   -   category
        -   Enum
        -   | *Опционально*. Отображать поисковый фильтр в меню **Add filter** или всегда.
            |
            | ``secondary`` (default)
            | ``primary``
    *   -   priority
        -   Number
        -   *Optional*. Необходим только для контекстного поиска. Задать приоритет для контекстного поиска.
    *   -   label
        -   String
        -   Метка фильтра поиска.
    *   -   value
        -   String
        -   *Опционально*. Значение фильтра поиска.
    *   -   placeholder
        -   String
        -   *Опционально*. Плейсхолдер поискового фильтра.
    *   -   is_enabled
        -   Boolean
        -   Логическое значение, определяющее, следует ли отображать фильтр поиска или нет.
    *   -   is_hidden
        -   Boolean
        -   *Опционально*. Логическое значение, определяющее, должен ли отображаться фильтр поиска или нет. В этом случае будет выполнен рендеринг.
    *   -   content
        -   String
        -   *Опционально*. HTML контент для типов  ``dropdown`` и ``popup``, или ``hidden``.
    *   -   data
        -   String
        -   *Опционально*. Нужен для типа ``range``. Используйте ``name_from``, ``value_from``, ``label_from``, ``name_to``, ``value_to``, или ``label_to`` для name attribute, value, и label для полей "From" и "To".
    *   -   nested_data
        -   String
        -   *Опционально*. Нужен для типов ``checkbox`` и ``radio``. Используйте ``key``, ``label``, ``value``, и ``is_checked`` для ID, label, value и checked attribute.

**Примеры расширений**

- input: ``addons/tags/hooks/products/search_data.post.tpl``
- range ``addons/bestsellers/hooks/products/search_data.post.tpl``
- dropdown: ``addons/ebay/hooks/products/search_data.post.tpl``
- popup ``addons/product_variations/hooks/products/search_data.post.tpl``

Пример массива поисковых фильтров товаров:``views/products/components/search_filters/get_product_search_filters.tpl``.

.. _context-search:

**Контекстный поиск**

На странице списка объектов в дополнению к поисковым фильтрам можно отобразить контекстный поиск рядом с saved search. 

**Использование**


**addons/my_changes/hooks/products/search_data.post.tpl**

.. code-block:: smarty

    {$search_filters.my_changes_query = [
        id => "my_changes_query",
        type => "input",
        category => "primary",
        label => __("search_my_changes"),
        value => $search.my_changes_query,
        priority => 1000
    ]}

    {* Export *}
    {$search_filters = $search_filters scope=parent}

Для контекстного поиска используйте тип ``input``. Поле с наибольшим **priority** будет отображено в контекстном поиске. Все остальные поля будут отображены в поисковом фильтре. Стандартное поле **Search products** имеет приоритет **100**.

.. _analytics-card-for-dashboard:

Карточка аналитики для Dashboard
--------------------------------

Шаблон: **views/index/components/analytics_section/analytics_card/analytics_card.tpl**

**Использование**

Использование карточки аналитики для Dashboard описано в см. :ref:`Расширение блоков аналитики Dashboard через хуки шаблонов больше не поддерживается <extending-dashboard-analytics-blocks-through-template>`. Пример использования:

**app/addons/my_changes/schemas/dashboard/blocks.post.php**

.. code-block:: php

    <?php

    use Tygh\Enum\DashboardSections;

    defined('BOOTSTRAP') or die('Access denied');

    $schema[DashboardSections::TERTIARY]['my_changes'] = [
        'id' => 'my_changes',
        'title' => __('my_changes.dashboard.my_changes'),
        'position' => 100,
        'dispatch' => 'products.manage',
        'content_data_function' => 'fn_my_changes_get_dashboard_block_data'
    ];

    return $schema;

**app/addons/my_changes/func.php**


.. code-block:: php

    <?php

    if (!defined('BOOTSTRAP')) { die('Access denied'); }

    function fn_my_changes_get_dashboard_block_data()
    {
        $content_data = [
            'id' => 'my_changes',
            'preheader' => __('my_changes.dashboard.preheader'),
            'is_selected_date' => false,
            'title' => __('my_changes.dashboard.title'),
            'title_button' => [
                'href' => 'products.manage',
                'name' => __('my_changes.dashboard.title_button'),
            ],
            'number' => 1234,
            'number_dynamics' => 15,
            'use_price_for_number' => false,
            'content' => [
                '<strong>Hello</strong>',
                '<em>world!</em>',
            ],
            'content_tpl' => [
                'addons/my_changes/views/my_changes/components/my_changes_component.tpl'
            ],
            'buttons' => [
                'button_1' => [
                    'name' => __('my_changes.dashboard.button_1'),
                    'href' => 'products.manage',
                    'class' => 'my-changes-button-1',
                ],
            ],
            'graph' => [
                'content' => [
                    [
                        'date' => '2024, (0-0), 30',
                        'prev' => 150,
                        'cur' => 200
                    ],
                    [
                        'date' => '2024, (0-0), 31',
                        'prev' => 160,
                        'cur' => 300,
                    ],
                ]
            ],
            'bar_chart' => [
                'id' => 'bar_chart',
                'title' => __('my_changes.dashboard.bar_chart'),
                'content' => [
                    [
                        'id' => 'bar_1',
                        'name' => __('products'),
                        'href' => 'products.manage',
                        'type' => 'primary',
                        'value' => 10,
                        'is_price' => false,
                        'total' => 100,
                        'ratio' => 10,
                    ],
                    [
                        'id' => 'bar_1',
                        'name' => __('categories'),
                        'href' => 'categories.manage',
                        'value' => 70,
                        'is_price' => false,
                        'total' => 100,
                        'ratio' => 70,
                    ],
                ]
            ],
            'resource_list' => [
                'title' => __('my_changes.dashboard.resource_list'),
                'content' => [
                    [
                        'id' => 'resource_list',
                        'href' => 'products.manage',
                        'name' => __("my_changes.dashboard.resource_list_name"),
                        'label_text' => __("my_changes.dashboard.resource_list_label_text"),
                        'label_class' => 'my-changes-resource-list',
                        'value_href' => 'products.manage',
                        'value' => '100',
                        'use_price_for_value' => false,
                        'description' => __("my_changes.dashboard.resource_list_description"),
                        'description_href' => 'products.manage',
                        'small_text' => __("my_changes.dashboard.resource_list_small_text"),
                        // 'image' => [],
                    ]
                ]
            ],
            'resource_list_tabs' => [
                'id' => 'resource_list_tabs',
                'content' => [
                    'resource_list_tabs_1' => [
                        'id' => 'resource_list_tabs_1',
                        'title' => __('resource_list_tabs_1'),
                        'content' => [
                            // Same thing as $content_data['resource_list']['content']
                        ]
                    ],
                ]
            ],
            'scripts' => [
                'js/addons/my_changes/func.js'
            ],
        ];

        return $content_data;
    }
    <?


**design/backend/templates/addons/my_changes/views/my_changes/components/my_changes_component.tpl**


.. code-block:: php

    <h3>My changes test</h3>


**js/addons/my_changes/func.js**




.. _SVG-icons:

SVG-иконки
----------

Шаблон: ``common/icon.tpl``

**Пример использования**


::


    {include_ext file="common/icon.tpl"
        source="warning_sign"
        tone="warning"
        color="#f00"
        accessibility_label="No user"
        show_icon=$is_show_user_require_warning_icon
        class="user-require-warning"
        id="user_warning_icon"
        render="inline"
        data=[
            "data-ca-param-1" => "value_1",
            "data-ca-param-2" => "value_2"
        ]
    }

где:


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30

    *   -   Параметр
        -   Тип
        -   Описание и значения
    *   -   source
        -   String
        -   Содержимое SVG (название иконки (``warning_sign``), путь (**addons/my_changes/icons/my_icon.svg**) или ``<svg>...</svg>`` источник) для отображения в иконке (иконка должна уместиться в 20 × 20 pixel viewBox). Используйте snake_case без префикса ``icon-``. Доступные иконки можно найти в директории **design/backend/template/icons/**. Можно подключить свои иконки, указав к ним путь.
    *   -   tone
        -   Enum
        -   | *Опционально*. Устанавливает цвет для заливки.
            | ``base``           
            | ``muted``
            | ``error``
            | ``interactive``
            | ``info``
            | ``success``
            | ``primary``
            | ``text_warning``
            | ``text_error``
            | ``text_info``
            | ``text_success``
    *   -   accessibility_label
        -   String
        -   *Опционально*. Текст описания для программы для чтения с экрана.
    *   -   color
        -   String
        -   *Опционально*. Аттрибут ``fill`` тэга ``<svg>`` для настройки своего цвета иконки.
    *   -   show_icon
        -   Boolean
        -   *Опционально*. Логическое значение, определяющее, следует ли отображать иконку.
    *   -   class
        -   String
        -   *Опционально*. CSS-класс иконки.
    *   -   id
        -   String
        -   *Опционально*. Уникальный ID иконки. 
    *   -   data
        -   Array
        -   *Опционально*. Массив HTML-атрибутов иконки.
    *   -   render
        -   Enum
        -   | Рендерить иконку как inline `<svg>` тег или подключать как внешнее `<img src="...">` изображение.
            |
            | ``inline`` (default)
            | ``img_data``


**Устаревшие параметры**

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 10 30
    
    *   -   Параметр
        -   Тип
        -   Описание и значения
    *   -   title
        -   String
        -   *Устарел. Опционально*. Подсказка для иконки. Теперь подсказки рекомендуется устанавливать уровнем выше. Например, устанавливать подсказки кнопкам содержащие такие иконки. Для доступности используйте ``accessibility_label``.
    *   -   icon_text
        -   String
        -   *Устарел. Опционально*. Текст для иконки. Теперь для доступности используйте ``accessibility_label``.



**Использование кастомных иконок**

Для отображения кастомной иконки стоит передать в параметр ``source`` путь SVG-иконки. Например:

::

  {include_ext file="common/icon.tpl" source="addons/my_changes/icons/my_icon.svg"}


где:

**design/backend/templates/addons/my_changes/icons/my_icon.svg**
::

  <svg viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="m0 0h20v20h-20z"/></svg>


Иконка должна уместиться в 20 × 20 pixel viewBox.


Выбор объектов
--------------

Шаблон: **common/select_object.tpl**

Значение ``accordion`` параметра ``style`` было удалено. Используйте один из следующих параметров: ``dropdown``, ``graphic`` или ``field``.


Вкладки
-------

Шаблон: **common/tabsbox.tpl**


Появилась возможность отображать tabs navigation в top navigation. Для этого необходимо добавить параметр ``show_tabs_navigation=false`` при подключении шаблона ``common/tabsbox.tpl``. И передать параметр ``tabs_navigation=$tabs_navigation`` при подключении шаблона ``common/mainbox.tpl``. Пример: ``views/products/update.tpl``.


----------
Новые хуки
----------

#. ``index:head``
#. ``menu:top_bar_right``
#. ``banners:status``

--------------
Удаленные хуки
--------------

#. Вместо ``index:analytics_data`` используйте схему ``dashboard/blocks``.

---------------
Устаревшие хуки
---------------

#.  ``products:action_buttons``: используйте вместо него Динамические действия. 
#.  ``products:simple_search`` в списке товаров: вместо него используйте ``products:search_data``.
#.  ``companies:products_advanced_search`` в списке товаров: вместо него используйте ``products:search_data``.
#.  ``products:search_form`` в списке товаров: вместо него используйте ``products:search_data``.
#.  ``products:search_in_orders`` в списке товаров: вместо него используйте ``products:search_data``.
#.  ``products:advanced_search``  в списке товаров: вместо него используйте ``products:search_data``.
#.  ``products:select_search``  в списке товаров: вместо него используйте ``products:sort_by_content``.

---------------------------
Удалены переменные шаблонов
---------------------------

#.  ``enable_sticky_scroll``
#.  ``navigation_accordion``
#.  Модули ``vendor_data_premoderation``: ``vendor_data_premoderation``.
#.  Модули ``vendor_plans``: ``plan_usage`` и ``plan_data``.

==================
Изменения в стилях
==================

.. _Deleted style variables:

---------------------------
Удаленные переменные стилей
---------------------------


#. Вместо ``@wide-width`` используйте ``var(--content-width)``.
#. Вместо ``@mainSidebarWidth`` используйте ``var(--sidebar-width)``.
#. Вместо ``@mainSidebarThinWidth`` используйте ``50px``.
#. Вместо ``@headerOffset``: use ``89px`` instead.
#. Вместо ``@textMutedColor`` используйте ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%)``.
#. Вместо ``@mainSidebarBackgroundColor`` используйте ``#333940``.
#. Вместо ``@topPanelBackground`` используйте ``#f9f9f9``.
#. Вместо ``@topPanelTextColorLight`` используйте ``#daedf7``.
#. Вместо ``@topPanelDropdownBackgroundColor`` используйте ``#4c6b8a``.
#. Вместо ``@topPanelDropdownTextColor`` используйте ``#272b31``.
#. Вместо ``@brandFontColor`` используйте ``#fff``.
#. Вместо ``@brandFontWeight`` используйте ``500``.
#. Вместо ``@topPanelMenuBackgroundStart`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundEnd`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundHoverStart`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundHoverEnd`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundActiveStart`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundActiveEnd`` используйте ``@mainColor``.
#. Вместо ``@topPanelMenuBackgroundDisabled`` используйте ``@gray``.
#. Вместо ``@topPanelMenuCaret`` используйте ``#fff`` instead.
#. Вместо ``@topPanelMenuDividerLeft`` используйте ``transparent``.
#. Вместо ``@topPanelMenuDividerRight`` используйте ``transparent``.
#. Вместо ``@topPanelBoxShadow`` используйте ``0 1px 4px rgba(0,0,0,0.1)``.
#. Вместо ``@successColor`` используйте ``@btnSuccessBackground``.
#. Вместо ``@mutedBackground`` используйте ``#f7f7f9``.
#. Вместо ``@mutedBorder`` используйте ``#e1e1e8``.
#. Вместо ``@btnPrimaryText`` используйте ``#daedf7``.
#. Вместо ``@btnPrimaryBackgroundBorder`` используйте ``@btnPrimaryBackground``.
#. Вместо ``@successButton`` используйте ``@btnSuccessBackground``.
#. Вместо ``@textButtonColor`` используйте ``@btnPrimaryBackground``.
#. Вместо ``@textButtonCaretColor`` используйте ``#1010107b``.
#. Вместо ``@tabsBackgroundColor`` используйте ``#f4f3f3``.
#. Вместо ``@tabsActiveBackgroundColor`` используйте ``@mainColor``.
#. Вместо ``@extraIconsSprite`` используйте ``url(../media/images/exicons.png)``.
#. Вместо ``@extraIconsSpriteWhite`` используйте  ``url(../media/images/exicons_white.png)``.
#. Вместо ``@zIndexPopup``  используйте ``1500``.


Удаленные CSS-классы
--------------------

#. Вместо ``btn-text`` используйте ``btn-link``.

--------------------
Изменения JavaScript 
--------------------

Удаленные триггеры
------------------

#. ``ce.notifications_center.mobile_enabled``
#. ``ce.notifications_center.notifications_mark_reload``
#. ``ce.mobile_menu.dropdownMenu_created``



.. _comparing-beta-to-release:

==============================================
Сравнение CS-Cart 4.18.1 Beta и CS-Cart 4.18.1 
==============================================

В релизе CS-Cart 4.18.1 есть отличия по сравнению с CS-Cart 4.18.1 Beta. В этом разделе мы привёдем все отличия между версиями.

--------------------------------------
Кнопки шестеренки признаны устаревшими
--------------------------------------


Раздел :ref:`Кнопки шестеренки признаны устаревшими <gear-buttons-deprecated>` был изменен и следующая его часть не актуальна:

    Кнопки шестеренки на списке объектов признаны устаревшими (например, на странице списка товаров). Для выполнения действий используйте `Context menu <https://www.cs-cart.ru/docs/latest/developer_guide/core/context_menu/>`_. Изменился вид кнопок шестеренки на списке товаров и заказов (хуки ``products:list_extra_links`` и ``orders:list_extra_links``).
    

-----------------------------------------------------------------------------------------
Расширение поисковых фильтров через шаблон на странице списка товаров признано устаревшим
-----------------------------------------------------------------------------------------

1. Часть раздела :ref:`Расширение поисковых фильтров через шаблон на странице списка товаров признано устаревшим <search-filter-extension-deprecated>` изменена и более не актуальна:

    Поисковые фильтры на списке товаров теперь задаются с помощью массива. Используйте хук ``products:search_data`` для её расширения.

Новый поисковый фильтр теперь только на странице списка товаров (?dispatch=products.manage). Его, например, нет при добавлении товара при создании заказа.

2. Свой собственный фильтр ``my_changes_filter`` теперь нужно раполагать в ``$search_filters.data``, а не в ``$search_filters``. Необходимо использовать параметр ``category => "secondary"``.

3. Хуки: стало неактуально для всех списков товаров (например, поиск в поп-апе), кроме страницы списка товаров (?dispatch=products.manage).


-----------------------------------
Динамические действия в шапке сайта
-----------------------------------

Произошли следующие изменения в разделе :ref:`Динамические действия в шапке сайта <dynamic-actions-in-site>`:

- Используемый тип по умолчанию теперь всегда — ``text``.
- Задавать динамические действия необходимо через ``schemas``, а не ``controllers``.
- Используйте параметр ``text`` длинной до 30 символов.
- Используйте параметр ``text_mobile`` длинной до 20 символов.
- Параметр ``raw`` более недоступен.


--------------------------------------------
Поисковые фильтры на странице списка товаров
--------------------------------------------

Произошли следующие изменения в разделе :ref:`Поисковые фильтры на странице списка товаров <search-filters-on-product-list>`:

- Теперь используется шаблон ``get_product_search_filters.tpl`` вместо ``products_search_form.tpl``.
- Вместо массива ``$search_filters`` теперь используйте подмассив ``$search_filters.data``.


-----------------
Контекстный поиск
-----------------

Произошли следующие изменения в разделе :ref:`Контекстный поиск <context-search>`:

Теперь не нужно подключать ``context_search.tpl`` в своем шаблоне и передавать параметр в ``common/mainbox.tpl``. Достаточно подключиться к хуку **addons/my_changes/hooks/products/search_data.post.tpl**, создать массив ``{$search_filters.my_changes_query = [ ... ]}`` и сделать экспорт ``$search_filters``.
