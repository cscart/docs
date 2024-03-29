****************
Мастер настройки
****************

С помощью мастера настройки можно сразу после установки за несколько шагов задать основные настройки магазина.

.. hint::

    :doc:`При работе с несколькими витринами CS-Cart </user_guide/stores/index>` используйте **кнопку с изображением трёх людей**, чтобы применить изменения сразу ко всем витринам.

======================
Настройки безопасности
======================

* **Новый пароль администратора** — мы рекомендуем изменить пароль администратора после создания учётной записи. Новый пароль должен быть достаточно надёжным.

  Если вы хотите создать надёжный пароль автоматически, воспользуйтесь кнопкой **Сгенерировать**.

* **SSL-сертификат** — нажмите кнопку **Проверить SSL**, чтобы проверить безопасное соединение.

* **Безопасное соединение для витрины** — если эта настройка включена, то витрина (или некоторые отдельные страницы витрины) будут доступны по протоколу HTTPS. Для этого на сервере должен быть установлен SSL-сертификат.

* **Включить безопасное соединение в панели администратора** — если настройка включена, то панель администратора будет доступна по протоколу HTTPS. Для этого на сервере должен быть установлен SSL-сертификат.

* **Минимальная длина пароля администратора** — минимальное количество символов в пароле администратора.

* **Пароль администратора должен содержать буквы и цифры** — если настройка включена, то пароль администратора должен будет содержать как цифры, так и буквы. Так пароль сложнее угадать или подобрать.

* **Обязательно менять пароль при первом входе** — если настройка включена, то администраторы при первом входе в панель администратора должны будут поменять свои пароли.

===========
Внешний вид
===========

* **HTML-редактор по умолчанию** — редактор, который используется в панели администратора для редактирования контента.

  .. note::

      Вы можете выбрать *TinyMCE* или *Redactor*, а также вы можете отключить HTML-редактор вообще. Начиная с версии 4.6.3, вы можете выбрать *Redactor II*.

* **Просмотрщик изображений по умолчанию** — выберите один из доступных просмотрщиков изображений.

* **Базовая валюта** — выберите базовую валюту вашего магазина.

* **Язык панели администратора по умолчанию** — язык, который выбран в панели администратора по умолчанию.

* **Язык витрины по умолчанию** — язык, который выбран на витрине по умолчанию.

* **Вычислять налоги на странице корзины/оформления заказа, используя адрес по умолчанию** — если настройка включена, то покупатели, которые ещё не указали свой адрес, увидят налоги, рассчитанные для :doc:`адреса покупателя по умолчанию </user_guide/shipping_and_taxes/address>`.

* **Показывать цену с налогами** — если настройка включена, то цены товаров, отображаемые на страницах товаров и категорий, будет включать в себя налоги.

* **Показывать цену с налогами на странице корзины/оформления заказа** — если настройка включена, то цены товаров, отображаемые на страницах корзины и оформления заказа, будет включать налоги.

* **Показывать количество доступных товаров** — если настройка включена, то на витрине будет отображаться количество товара в наличии.

* **Показывать мини-иконки в виде галереи** — если настройка включена, то несколько иконок товара будут отображаться в виде мини-галереи.

* **Показывать кнопки + и - в поле Количество** — если настройка включена, то рядом с полем "Количество" появятся кнопки **+** и **-**, с помощью которых вы сможете менять количество выбранных экземпляров товара.

* **Показывать информацию о товаре во вкладках** — если настройка включена, то информация о товаре (описание, характеристики, и т.д.) будут размещены в отдельных вкладках.

* **Формат даты** — выберите формат отображения даты и в панели администратора, и на витрине.

* **Формат времени** — выберите формат отображения времени и в панели администратора, и на витрине.

==================
Настройки компании
==================

В этом разделе настроек задаётся информация о компании и контактные данные.

* **Название компании** — это значение появится в счетах и в уведомлениях об авторских правах.

Настройки ниже задают местоположение и контактную информацию. Значения этих настроек также попадают в счета.

.. note::

    :doc:`Местоположение компании </user_guide/shipping_and_taxes/address>` используется для :doc:`расчёта стоимости доставки в реальном времени </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index>`.

* **Адрес (улица, дом, корпус и т.д)**

* **Город**

* **Страна**

* **Регион компании**

* **Почтовый индекс**

* **Телефон**

* **Телефон 2**

* **Факс**

* **Веб-сайт**

* **Email отдела по работе с клиентами** — электронный адрес, на который будут приходить уведомления о созданных, изменённых или удалённых учетных записях.

* **Email администратора сайта** — электронный адрес, на который будут отправляться уведомления о технических вопросах.

* **Email отдела оформления и обработки заказов** — электронный адрес, на который будут отправляться уведомления о размещённых заказах или изменениях статусов заказов.

=======================
Настройки пользователей
=======================

* **Администратор должен активировать новые учетные записи пользователей** — если настройка включена, то новые учётные записи пользователей не будут включаться автоматически, и это придётся делать администратору.

* **Предложить покупателям создавать учетную запись после оплаченного заказа** — если настройка включена, то покупателю после оформления заказа как гость будет предложено зарегистрироваться.

* **Быстрая регистрация** — если настройка включена, то покупателю для регистрации понадобится предоставить только контактную информацию.

* **Порядок отображения адресов на странице профиля** — выберите, какой адрес должен отображаться на странице оформления заказа первым: адрес доставки или адрес плательщика.

* **Разрешить пользователю создание нескольких профилей для одной учетной записи** — если настройка включена, то один пользователь сможет создать для своей учётной записи несколько адресов доставки и плательщика. Это полезно, когда один покупатель оформляет заказы и от своего лица, и для своей компании.

* **Общая база пользователей для всех магазинов** — если эта настройка включена, то :doc:`все ваши витрины </user_guide/stores/index>` будут использовать одну и ту же базу пользователей. Иначе для каждой витрины будет использоваться своя база.

=======================
Самые популярные модули
=======================
 
В этом разделе перечислены модули, которые являются самыми популярными среди пользователей. Отметьте галочками те модули, которые вы хотите установить. Можно выбрать столько модулей, сколько хотите.

================
Остальные модули
================

В этом разделе находятся все остальные модули из дистрибутива, за исключением самых популярных. Отметьте галочками те модули, которые вы хотите установить. Можно выбрать столько модулей, сколько хотите.

.. note::

    Больше информации о модулях можно найти на странице **Модули →  Управление модулями**.
