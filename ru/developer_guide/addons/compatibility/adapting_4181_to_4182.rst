*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.18.2
*******************************************************

.. contents::
    :backlinks: none
    :local:

================
Изменения в ядре
================

Добавлены пакеты ``google/auth``, ``firebase/php-jwt``, ``psr/cache``. 

.. important::

    Не используйте их, они будут удалены в ближайшем будущем.

=================
Изменения в хуках
=================


Новые хуки
==========

#. Изменяет параметры запроса перед выбором городов местоположения магазина::

        `fn_set_hook('get_store_location_cities', $params, $condition);` 
    
#. Выполняется перед возвратом данных запроса::

        `fn_set_hook('rus_online_cache_register_receipt_request_json_post', $this, $result, $receipt);`

==================
Изменения в стилях
==================

-----------------------------------------------
Использование цветовых переменных вместо цветов
-----------------------------------------------

Использование жестко запрограммированных цветов устарело. `Используйте цветовые переменные CSS  <https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties>`_. Например:

- Вместо ``#fff`` используйте ``var(--cs-content-background)`` для цвета фона.
- Вместо ``#2d2d2d`` используйте ``var(--cs-text-color)`` для цвета текста.
- Вместо ``#fff`` используйте ``var(--cs-text-inverse-color)`` для цвета текста.
- Вместо ``#1d9ff8`` используйте ``var(--cs-btn-primary-background)`` для основного фона кнопки.
- Вместо ``#d80954`` используйте ``var(--cs-error-text)`` для цвета текста ошибки.
- Вместо ``rgba(0, 0, 0, 0.1)`` используйте ``var(--cs-shadow10-color)`` для тени.

Полный список переменных см. в *design/backend/css/less_to_css_vars.less*. Для темной темы требуются цветовые переменные. Проверьте свои модули в светлой и темной админ панели.

----------------------
Устаревшие стили Less
-----------------------

`Стили Less <https://lesscss.org/>`_ устарели и больше не будут поддерживаться в будущем. Вместо этого используйте собственные стили CSS. Например:

#. Не используйте ``переменные Less``. Используйте собственные переменные CSS. Например:

   * Вместо ``@mainColor`` используйте ``var(--cs-main-color)``.

   * Вместо ``@media (min-width: @TabletBreakpoint + 1px) { ... }`` используйте ``@media (min-width: 768px) { ... }``.

   * Вместо ``-@iconSize;`` используйте ``~"calc(var(--cs-icon-size) * -1)"``.

#. Не используйте миксины Less. Описывайте свойства явно. Например:

   * Вместо ``.transition(all 200ms);`` используйте ``transition: all 200ms;``.

   * Вместо ``.display-flex();``  используйте ``display: flex;``.

#. Не используйте правила Less Intendered. Описывайте селекторы явно. Например:

   * Вместо ``a { opacity: 0.8; &:hover { opacity: 1; } }`` используйте ``a { opacity: 0.8; } a:hover { opacity: 1; }``.

   * Вместо ``.block { padding: 10px; @media (min-width: 768px) { padding: 20px; } }`` используйте ``.block { padding: 10px; } @media (min-width: 768px) { .block { padding: 20px; } }``.

#. Не используйте функции Less. Используйте похожие цвета и значения свойств. Например:

   * Вместо ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%);`` используйте ``var(--cs-text-muted-color);``.

   * Вместо ``darken(@btnBorder, 3%)`` используйте ``var(--cs-shadow15-color)``.

   * Вместо ``lighten(@textColor, 38%);`` используйте ``var(--cs-text-muted-color);``.

   * Вместо ``round(@baseLineHeight / 1.5385)`` используйте ``13px;``.

#. НО используйте экранирование для функций Less, которые похожи на функции CSS. Пример:

   * Вместо ``calc(100% - 5px)`` используйте ``~"calc(100% - 5px)"``.

----------------
Новые классы CSS
----------------

``cs-dark-theme-invert`` - инвертирует цвета для темной темы.

---------------------------
Удаленные переменные стилей
---------------------------

+++
UI
+++

#. ``@isControlGroupHidden``.

#. Вместо ``@spinnerSize`` используйте ``24px``.

#. Вместо ``@spinnerBorderWidth`` используйте ``3px``.

#. Вместо ``@spinnerBlockSize`` используйте ``52px``.

#. Вместо ``@uiDialogTitlebarCloseWidth`` используйте ``var(--cs-ui-dialog-titlebar-close-width)``.

#. Вместо ``@uiDialogTitlebarCloseHeight`` используйте ``var(--cs-ui-dialog-titlebar-close-height)``.

#. Вместо ``@global_individual_secondary`` используйте ``var(--cs-global-individual-secondary)``.

#. Вместо ``@global_individual_active_background`` используйте ``var(--cs-global-individual-active-background)``.

#. Вместо ``@global_individual_active_border`` используйте ``var(--cs-global-individual-active-border)``.

#. Вместо ``@global_individual_disabled`` используйте ``var(--cs-global-individual-disabled)``.

#. Вместо ``@global_individual_secondary_disabled`` используйте ``var(--cs-global-individual-secondary-disabled)``.

#. Вместо ``@global_individual_active_background_disabled`` используйте ``var(--cs-global-individual-active-background-disabled)``.

#. Вместо ``@global_individual_active_border_disabled`` используйте ``var(--cs-global-individual-active-border-disabled)``.

#. Вместо ``@button-color`` используйте ``#fff``.

#. Вместо ``@button-opacity-on-hover`` используйте ``0.75``.

#. Вместо ``@header-height`` используйте ``40px``.

#. Вместо ``@button-width`` используйте ``45px``.

#. Вместо ``@button-indent`` используйте ``10px``.

#. Вместо ``@img-indent`` используйте ``10px``.

#. Вместо ``@arrow-size`` используйте ``60px``.

+++++++++++++++++++++++++++++
Панель управления (Dashboard)
+++++++++++++++++++++++++++++

#. Вместо ``@dashboardBorderColor`` используйте ``var(--cs-dashboard-border-color)``.

#. Вместо ``@dashboardBorderColor`` используйте ``var(--cs-dashboard-border-color)``.

#. Вместо ``@dashboardPrimaryColor`` используйте ``var(--cs-dashboard-primary-color)``.

#. Вместо ``@dashboardSecondaryColor`` используйте ``var(--cs-dashboard-secondary-color)``.

+++++++++++++++++++++++++
Модули и Центр обновлений
+++++++++++++++++++++++++

#. Вместо ``@darkTransparentMainColor`` используйте ``var(--cs-shadow10-color)``.

#. Вместо ``@lightTextIconColor`` используйте ``var(--cs-text-inverse-color)``.

#. Вместо ``@darkTextIconColor`` используйте ``var(--cs-form-actions-background)``.

#. ``@middleTextIconColor``.

+++++++++++++++++++++
Настройки уведомлений
+++++++++++++++++++++

#. Вместо ``@editor-spacing`` используйте ``16px``.

#. Вместо ``@editor-width`` используйте ``500px``.

#. Вместо ``@editor-footer-border-color`` используйте ``#eee``.

#. Вместо ``@editor-padding`` используйте ``17px``.

+++++++++++++++
Менеджер блоков
+++++++++++++++

#. Вместо ``@BlockManagerGrid`` используйте ``var(--cs-block-manager-grid)``.

#. Вместо ``@BlockManagerGrid12Col`` используйте ``var(--cs-block-manager-grid12-col)``.

#. Вместо ``@BlockManagerGrid16Col`` используйте ``var(--cs-block-manager-grid16-col)``.

#. Вместо ``@BlockManagerIconsSprite`` используйте ``var(--cs-block-manager-icons-sprite)``.

#. Вместо ``@BlockManagerOpenHand`` используйте ``var(--cs-block-manager-open-hand)``.

#. Вместо ``@BlockManagerClosedHand`` используйте ``var(--cs-block-manager-closed-hand)``.

#. Вместо ``@bm-block-border`` используйте ``var(--bm-block-border)``.

#. ``@bm-block-hover-color``.

#. Вместо ``@bm-block-hover-border`` используйте ``var(--bm-block-hover-border)``.

#. ``@bm-block-hover-shadow``.

#. Вместо ``@bm-block-hover-bg`` используйте ``var(--bm-block-hover-bg)``.

#. Вместо ``@bm-block-grabbing-shadow`` используйте ``var(--bm-block-grabbing-shadow)``.

#. Вместо ``@bm-block-menu`` используйте ``var(--bm-block-menu)``.

#. Вместо ``@bm-block-menu-arrow`` используйте ``var(--bm-block-menu-arrow)``.

#. ``@bm-border``.

#. Вместо ``@bm-border-radius`` используйте ``var(--bm-border-radius)``.

#. Вместо ``@bm-icon-size`` используйте ``var(--bm-icon-size)``.

#. Вместо ``@bm-icon`` используйте ``var(--bm-icon)``.

+++++++++++++++++++++++++++++++++++++
Модуль "Премодерация данных продавца"
+++++++++++++++++++++++++++++++++++++

#. Вместо ``@editColor`` используйте ``var(--cs-vendor-data-premoderation-edit-color)``.

#. ``@editBackground``.

+++++++++++++++++++++++++++++
Модуль "Мобильное приложение"
+++++++++++++++++++++++++++++

#. Вместо ``@backgoundColor`` используйте ``var(--cs-mobile-app-backgound-color)``.