*********************************************
Как разместить объекты на нескольких витринах
*********************************************

.. important::

    Эта статья актуальна только для пользователей CS-Cart Ultimate. В Multi-Vendor Ultimate, чтобы узнать, к какой витрине относится объект, проверьте настройки витрины или откройте вкладку **Витрины** в свойствах объекта.

=================
Как это работает?
=================

При создании объекта в CS-Cart (например, товара, страницы, промо-акции, способа доставки и т.д.) его необходимо привязать к какой-либо витрине. Однако после создания объекты можно использовать на нескольких витринах одновременно.

.. note::

    Одну и ту же категорию нельзя использовать на нескольких витринах. Именно :doc:`категории определяют, к каким витринам относится тот или иной товар. <many_stores_one_catalog>`

Для разных типов объектов в CS-Cart действуют разные правила размещения на нескольких витринах:

* **С возможностью изменения:** объекты размещаются на разных витринах и могут иметь разные свойства. Например, одному и тому же товару на разных витринах можно задать разные цены, описания и другие свойства.

* **Без возможности изменения:** объекты размещаются на витринах безо всяких изменений. Данный тип применяется к таким объектам, как характеристики и фильтры товаров, глобальные опции товаров, промо-акции, содержимое CMS, языки и способы доставки.

.. note::

    Также в CS-Cart можно :doc:`использовать одни и те же учетные записи пользователей на разных витринах. <customer_accounts>`

Помимо этого в CS-Cart существуют объекты, являющиеся общими для всех витрин, и у которых нет индивидуальных значений. Примерами данных объектов могут служить правила подсчёта налогов, статусы заказов, местоположения, страны и регионы, группы пользователей, поля профиля и т.д.

======================================
Размещение объектов на разных витринах
======================================

-------------------------------------------------------------------------------
Размещаем одни и те же товары на нескольких витринах (с возможностью изменения)
-------------------------------------------------------------------------------

#. Откройте страницу **Товары → Товары**.

#. Убедитесь, что в панели выбора магазинов в левой верхней части страницы выбраны **Все магазины**.

   .. fancybox:: img/switch_modes.png
       :alt: Выберите "Все магазины", чтобы переключиться в режим управления всеми витринами.

#. На вкладке **Общее** добавьте категории, привязанные к другой витрине.

#. Нажмите **Сохранить**, чтобы применить изменения.

   Товар будет добавлен в выбранные категории и появится на соответствующей витрине. После этого вы можете переключиться в режим администратора витрины и отредактировать характеристики товара для данной витрины.

   .. fancybox:: img/store_categories.png
       :alt: Выберите категорию для товара, привязанную к другой витрине.

---------------------------------------------------------------------------------
Размещаем одни и те же объекты на нескольких витринах (без возможности изменения)
---------------------------------------------------------------------------------

#. Выберите объект, который необходимо разместить на нескольких витринах. Например, чтобы разместить способ доставки на нескольких витринах, откройте страницу **Администрирование → Доставка и налоги → Способы доставки**.

#. Убедитесь, что в панели выбора магазинов в левой верхней части страницы выбраны **Все магазины**.

   .. fancybox:: img/switch_modes.png
       :alt: Выберите "Все магазины", чтобы переключиться в режим главного администратора.

#. Нажмите на кнопку с изображением шестерёнки, расположенную рядом с нужным объектом, и выберите **Редактировать**. Откроется меню настроек объекта.

#. Перейдите на вкладку **Сделать общим**. На ней отображается список витрин, на которых размещён данный объект.

   .. note::
       Вкладка **Сделать общим** не отображается при наличии только одной витрины, так как в этом случае нет необходимости делать что-то общим для нескольких витрин.

   .. fancybox:: img/share_tab.png
       :alt: Используйте вкладку "Сделать общим", чтобы разместить объекты на разных витринах.

#. Нажмите на кнопку **+** (*Добавить магазины*), чтобы открыть список витрин.

#. Из списка выберите витрины, на которых будет размещён объект. Затем нажмите **Добавить магазины и закрыть**, чтобы обновить список витрин, на которых будет размещён объект.

#. Нажмите **Сохранить**, чтобы применить изменения.
