****************
Контекстное меню
****************

В CS-Cart есть **контекстное меню** — механизм для массовых действий над сущностями. Он позволяет выделять элементы из списка и массово работать с ними. Чтобы посмотреть, как выглядит контекстное меню, достаточно зайти на список товаров и выделить один из них. Все действия над объектами в списке должны быть реализованы через контекстное меню.

Для реализации контекстного меню необходимо:

#. Создать схему конкретной сущности;
#. Адаптировать таблицу, в которой выводится список объектов этой сущности;
#. Реализовать бекенд-обработчики для массовых действий (массовое удаление, изменение статуса и т.п.).

Примеры контекстных меню находятся в директории *app/schemas/context_menu/*.

.. contents::
   :backlinks: none
   :local:

=======================
Схема контекстного меню
=======================

Схема контекстного меню имеет следующую структуру:

::

 [
   // Список статусов для выделения элементов.
   'selectable_statuses' => array<string, string>                                                                             
   // Список элементов контекстного меню.
   'items'               => [                                                                                                 
       // Идентификатор элемента.
       'status'  => [                                       
           // Название элемента.                                                               
           'name'              => ['template' => 'status'],                                                                   
           // Тип элемента (ActionItem/GroupItem/ComponentItem).
           'type'              => GroupItem::class,                                                                           
           // Данные для передачи в шаблон. В шаблоне обращаться через $data.
           'data'              => [                                                                                           
               // menu_item_attributes, menu_item_class, action_attributes, action_class - используется в общих шаблонах.
    // menu_item_attributes, menu_item_class - добавляют атрибуты или классы на элементы меню. Например cm-no-hide-input или mobile-hide (скрывает элемент на мобильных устройствах)
    // action_attributes, action_class - добавляют атрибуты или классы на элементы-действия. Например cm-ajax, cm-post, cm-confirm или заменить ссылку действия, указав в массиве action_attributes, элемент с ключом href и ссылкой
              // cm-no-hide-input - оставляет input-теги активными если на форме есть класс cm-hide-input
               'menu_item_class' => 'cm-no-hide-input',         
               ...
           ],
           // Список вложенных элементов в GroupItem.
           'items'             => [                                                                                           
               // Элемент-ссылка
               'm_activate' => [                                                                                              
                   'name'          => [
                       'template' => 'change_to_status',
                       'params'   => [
                           '[status]' => __('active'),
                           ...
                       ],
                   ],
                    // Диспатч, на который будут переданы идентификаторы выделенных элементов; диспатч также используется при проверке доступности элемента текущему пользователю.
                   'dispatch' => 'profiles.m_activate',                                                                      
                   // Позиция элемента в списке.
                   'position' => 10,                                                                                          
               ],
               // Элемент-разделитель.
               'actions_divider'   => [                                                                                       
                    // Тип вложенного в GroupItem элемента (GroupActionItem/ComponentItem/DividerItem). По умолчанию тип элемента GroupActionItem.
                   'type'     => DividerItem::class,                                                                          
                   'position' => 20,
               ],
               // Элемент с собственным шаблоном.
               'notify_checkboxes' => [                                                                                       
                   'type'          => ComponentItem::class,
                   // Собственный шаблон элемента ComponentItem.
                   'template'      => 'views/profiles/components/context_menu/notify_checkboxes.tpl',                         
                   // Callback-функция для формирования данных для передачи в шаблон. В шаблоне обращаться через $data.
                   'data_provider' => static function () {                                                                    
                       return [
                           'param1' => 'value2',
                           ...
                       ];
                   },
                   'position'      => 30,
               ],
               ...
           ],
           // Callback-функция для проверки доступности элемента.
           'permission_callback' => static function ($request, $auth, $runtime) {                                             
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

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - items
     - обязательный
     - Массив элементов контекстного меню
   * - selectable_statuses
     - опциональный
     - Массив статусов, которые можно использовать для выбора элементов. Ключи массива — коды статусов, значения — описание статуса уже на нужном языке, полученное через функцию ``__()``.

==========================
Элементы контекстного меню
==========================

Контекстное меню может содержать элементы типа ActionItem, GroupItem и ComponentItem.

----------
ActionItem
----------

Кнопка в контекстном меню — действие над элементами без раскрывающегося списка или всплывающего окна рядом с меню:

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - type
     - обязательный
     - ActionItem::class
   * - dispatch
     - обязательный
     - Диспатч (например, ``protucts.update``); по диспатчу проверяется доступность текущему пользователю.
   * - name
     - опциональный
     - Массив из двух элементов: template и params. template — название языковой переменной; params — массив :ref:`плейсхолдеров <ru-langvar-placeholders>` (опционально).
   * - data
     - опциональный
     - Массив с данными.
   * - position
     - опциональный
     - Позиция элемента в меню.
   * - permission_callback
     - опциональный
     - Функция для пользовательской проверки доступности элемента, должна вернуть булевое значение. Работает совместно с dispatch.

---------
GroupItem
---------

Выпадающий список, содержащий действия:

.. fancybox:: img/group_item.png
    :scale: 50 %
    :align: left
    :alt: Выпадающий список, содержащий действия.

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - type
     - обязательный
     - ActionItem::class
   * - items
     - обязательный
     - Массив из других элементов контекстного меню.
   * - name
     - опциональный
     - Массив из двух элементов: template и params. template — название языковой переменной; params — массив :ref:`плейсхолдеров <ru-langvar-placeholders>` (опционально).
   * - data
     - опциональный
     - Массив с данными; данные доступны в шаблонах через $data.
   * - position
     - опциональный
     - Позиция элемента в меню.
   * - permission_callback
     - опциональный
     - Функция для пользовательской проверки доступности элемента, должна вернуть булевое значение.

---------------
GroupActionItem
---------------

Действие, находящееся в GroupItem:

.. fancybox:: img/group_actionitem.png
    :scale: 50 %
    :align: left
    :alt: Действие, находящееся в GroupItem.

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - dispatch
     - обязательный
     - Диспатч (например, ``protucts.update``); по диспатчу проверяется доступность текущему пользователю.
   * - name
     - опциональный
     - Массив из двух элементов: template и params. template — название языковой переменной; params — массив :ref:`плейсхолдеров <ru-langvar-placeholders>` (опционально).
   * - type
     - опциональный
     - GroupActionItem::class
   * - data
     - опциональный
     - Массив с данными.
   * - position
     - опциональный
     - Позиция элемента в меню.
   * - permission_callback
     - опциональный
     - Функция для пользовательской проверки доступности элемента, должна вернуть булевое значение. Работает совместно с dispatch.

-----------
DividerItem
-----------

Разделитель, находящийся в GroupItem:

.. fancybox:: img/divider_item.png
    :scale: 50 %
    :align: left
    :alt: Разделитель, находящийся в GroupItem.

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - type
     - обязательный
     - DividerItem::class
   * - position
     - опциональный
     - Позиция элемента в меню

-------------
ComponentItem
-------------

Сложный пользовательский компонент с произвольным наполнением и поведением. Например, смена цены и количества на списке товаров:

.. fancybox:: img/component_item.png
    :scale: 50 %
    :align: left
    :alt: Смена цены и количества на списке товаров.

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - type
     - обязательный
     - ComponentItem::class
   * - template
     - обязательный
     - Путь до подключаемого шаблона.
   * - name
     - опциональный
     - Массив из двух элементов: template и params. template — название языковой переменной; params — массив :ref:`плейсхолдеров <ru-langvar-placeholders>` (опционально).
   * - data
     - опциональный
     - Массив с данными.
   * - data_provider
     - опциональный
     - Функция, возвращающая данные для использования в подключаемом шаблоне.
   * - position
     - опциональный
     - Позиция элемента в меню.
   * - permission_callback
     - опциональный
     - Функция для пользовательской проверки доступности элемента, должна вернуть булевое значение.

----------------------------------------
Компоненты отображения контекстного меню
----------------------------------------

Для вывода таблицы с контекстным меню используется компонент *common/context_menu_wrapper.tpl*. Параметры при подключении в шаблоне:

.. list-table::
   :header-rows: 1
   :widths: 15, 15, 30

   * - Параметр
     - Обязательность
     - Описание
   * - object
     - обязательный
     - Имя объекта для которого нужно сформировать контекстное меню (название схемы).
   * - form
     - обязательный
     - Идентификатор формы которая будет отправляться при каком-либо действии.
   * - id
     - опциональный
     - Идентификатор контекстного меню, для размещения нескольких контекстных меню на одной странице.
   * - class
     - опциональный
     - Класс для блока обертки контекстного меню.
   * - attributes
     - опциональный
     - Атрибут/атрибуты для блока обертки контекстного меню.
   * - hook
     - опциональный
     - Название хука в котором будет находиться контекстное меню; если не указано, название хука формируется из “название_объекта:context_menu”.
   * - has_permission
     - опциональный
     - Булевое значения: “true” для отображения контекстного меню; при “false” контекстное меню не будет отрисовываться.
   * - context_menu_class
     - опциональный
     - Класс для блока контекстного меню.
   * - is_check_all_shown
     - опциональный
     - Булевое значение. Прокидывается в шаблон *common/check-items.tpl*.

ComponentItem позволяет подключать собственный шаблон. В этот шаблон передаются и могут быть использованы следующие параметры:

.. list-table::
   :header-rows: 1
   :widths: 20, 40

   * - Параметр
     - Описание
   * - item_id
     - Идентификатор элемента (ключ элемента из схемы).
   * - item
     - Объект класса ComponentItem.
   * - data
     - Данные из схемы (data, data_provider).
   * - params
     - Параметры обертки (form, object, items …)

========================================================
Адаптация списка сущностей для работы с контекстным меню
========================================================

* Блок, которой выводит список элементов сущности, нужно обернуть в capture:

  ::

   {capture name=”entity_table”}
       %блок с таблицей со списком элементов%
   {/capture}

* Содержимого этого capture затем нужно вывести в с помощью компонента *common/context_menu_wrapper.tpl*:

  ::

   {include file="common/context_menu_wrapper.tpl"
      form="entity_form"
      object="entity"
      items=$smarty.capture.entity_table
   }

* Блоку, в котором находится таблица со списком сущностей, необходимо добавить класс ``longtap-selection``.

* В тег thead таблицы с сущностями нужно добавить атрибуты:

  * data-ca-bulkedit-default-object — чтобы скрывать заголовок таблицы при отображении панели контекстного меню;

  * data-ca-bulkedit-component — для включения возможности массового выделения.

* В первую ячейку заголовка таблицы (первый th) добавить служебный скрытый ``input``, который будет включать или отключать режим массового выделения для таблицы:

  ::

   <input type="checkbox"
         class="bulkedit-toggler hide"
         data-ca-bulkedit-disable="[data-ca-bulkedit-default-object]" // в атрибуте указывается селектор элементов, которые нужно скрыть при отображении контекстного меню — например, заголовок таблицы
         data-ca-bulkedit-enable="[data-ca-bulkedit-expanded-object]" // в атрибуте указывается селектор элементов, которые нужно отобразить при активации контекстного меню — панель управления элементами
   />

* В тег tbody нужно добавить:

  * Класс ``cm-longtap-target``.

  * Атрибуты: 

    * ``data-ca-longtap-action="setCheckBox"`` — задает тип действия при нажатии на элемент, добавляется на элемент с тегом <tr>(обычно) в котором находится чекбокс с идентификатором элемента.

    * ``data-ca-longtap-target="input.cm-item"`` — указывает селектор, по которому у найденных элементов внутри data-ca-longtap-action переключится атрибут selected.

    * ``data-ca-id="{$product.product_id}"`` — содержит идентификатор элемента, например, ID товара.

* Каждому элементу списка в таблице нужно добавить чекбокс, отвечающий за его выделение и хранящий ID сущности:

  ::

   <input type="checkbox"
         name="product_ids[]"//имя для примера
         value="{$product.product_id}"
         class="cm-item cm-item-status-{$product.status|lower} hide"
   />

* Класс ``cm-status-*`` используется для выделения элементов с конкретным статусом через выпадающий список в заголовке таблицы (All, None, Active, Disabled, Hidden …).

* Класс ``hide`` используется для скрытия чекбокса.

----------------
Пример адаптации
----------------

Пример: `https://gist.github.com/example <https://gist.github.com/torunar/cd603b08c43710247e94e7a232734aa9/revisions#diff-0dac47aa4091efd784c7649bbfff67513c49ece076b9ca5d74361e4afba2d3c4>`_

Было
----

::

 {capture name="mainbox"}

    <form action="{""|fn_url}" method="post" id="states_form" name="states_form">
        {include file="common/pagination.tpl" save_current_page=true save_current_url=true}

        {if $states}
            <div class="table-responsive-wrapper">
                <table width="100%" class="table table-middle table--relative table-responsive state-table">
                <thead>
                    <tr>
                        <th width="6%" class="mobile-hide">
                            {include file="common/check_items.tpl" check_statuses=$state_statuses}
                        </th>
                        <th width="10%">{__("code")}</th>
                        <th>{__("state")}</th>
                    </tr>
                </thead>
                {foreach $states as $state}
                    <tr class="cm-row-status-{$state.status|lower} cm-longtap-target">
                        <td width="6%" class="mobile-hide">
                            <input type="checkbox" name="state_ids[]" value="{$state.state_id}" class="cm-item cm-item-status-{$state.status|lower}" />
                        </td>
                        <td width="10%" class="left nowrap row-status" data-th="{__("code")}">
                            <span>{$state.code}</span>
                        </td>
                        <td data-th="{__("state")}">
                            <input type="text" name="states[{$state.state_id}][state]" size="55" value="{$state.state}" class="input-hidden"/>
                        </td>
                    </tr>
                {/foreach}
                </table>
           </div>
        {else}
            <p class="no-items">{__("no_data")}</p>
        {/if}

        {include file="common/pagination.tpl"}
    </form>

    {capture name="buttons"}
        {capture name="tools_list"}
            {hook name="states:manage_tools_list"}
                <li>{btn type="delete_selected" dispatch="dispatch[states.m_delete]" form="states_form"}</li>
            {/hook}
        {/capture}
        {dropdown content=$smarty.capture.tools_list}

        {if $states}
            {include file="buttons/save.tpl" but_name="dispatch[states.m_update]" but_role="action" but_target_form="states_form" but_meta="cm-submit"}
        {/if}
    {/capture}

    {capture name="adv_buttons"}
        {include file="common/popupbox.tpl" id="new_state" action="states.add" text=$title content=$smarty.capture.add_new_picker title=__("add_state") act="general" icon="icon-plus"}
    {/capture}

 {/capture}

 {include file="common/mainbox.tpl"
    title=__("states")
    content=$smarty.capture.mainbox
    adv_buttons=$smarty.capture.adv_buttons
    buttons=$smarty.capture.buttons
    select_languages=true
 }

Стало
-----

::

 {capture name="mainbox"}

    <form action="{""|fn_url}" method="post" id="states_form" name="states_form">
        {include file="common/pagination.tpl" save_current_page=true save_current_url=true}

        {if $states}
            {capture name="states_table"}
                <div class="table-responsive-wrapper longtap-selection">
                    <table width="100%" class="table table-middle table--relative table-responsive state-table">
                    <thead
                        data-ca-bulkedit-default-object
                        data-ca-bulkedit-component
                    >
                        <tr>
                            <th width="6%" class="mobile-hide">
                                {include file="common/check_items.tpl" check_statuses=$state_statuses}

                                <input type="checkbox"
                                    class="bulkedit-toggler hide"
                                    data-ca-bulkedit-disable="[data-ca-bulkedit-default-object]"
                                    data-ca-bulkedit-enable="[data-ca-bulkedit-expanded-object]"
                                />
                            </th>
                            <th width="10%">{__("code")}</th>
                            <th>{__("state")}</th>
                        </tr>
                    </thead>
                    {foreach $states as $state}
                        <tr class="cm-row-status-{$state.status|lower} cm-longtap-target"
                            data-ca-longtap-action="setCheckBox"
                            data-ca-longtap-target="input.cm-item"
                            data-ca-id="{$state.state_id}"
                        >
                            <td width="6%" class="mobile-hide">
                                <input type="checkbox" name="state_ids[]" value="{$state.state_id}" class="cm-item cm-item-status-{$state.status|lower} hide" />
                            </td>
                            <td width="10%" class="left nowrap row-status" data-th="{__("code")}">
                                <span>{$state.code}</span>
                            </td>
                            <td data-th="{__("state")}">
                                <input type="text" name="states[{$state.state_id}][state]" size="55" value="{$state.state}" class="input-hidden"/>
                            </td>
                        </tr>
                    {/foreach}
                    </table>
                </div>
            {/capture}

            {include file="common/context_menu_wrapper.tpl"
                form="states_form"
                object="states"
                items=$smarty.capture.states_table
            }
        {else}
            <p class="no-items">{__("no_data")}</p>
        {/if}

        {include file="common/pagination.tpl"}
    </form>

    {capture name="buttons"}
        {capture name="tools_list"}
            {hook name="states:manage_tools_list"}
            {/hook}
        {/capture}
        {dropdown content=$smarty.capture.tools_list}

        {if $states}
            {include file="buttons/save.tpl" but_name="dispatch[states.m_update]" but_role="action" but_target_form="states_form" but_meta="cm-submit"}
        {/if}
    {/capture}

    {capture name="adv_buttons"}
        {include file="common/popupbox.tpl" id="new_state" action="states.add" text=$title content=$smarty.capture.add_new_picker title=__("add_state") act="general" icon="icon-plus"}
    {/capture}

 {/capture}

 {include file="common/mainbox.tpl"
    title=__("states")
    content=$smarty.capture.mainbox
    adv_buttons=$smarty.capture.adv_buttons
    buttons=$smarty.capture.buttons
    select_languages=true
 }

============
Примеры схем
============
app/schemas/context_menu/products.php — категории, цены и массовое изменение
app/schemas/context_menu/payouts.php — notify_checkboxes
app/schemas/context_menu/product_features.php — group, category