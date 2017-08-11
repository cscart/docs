PayAnyWay
---------

.. note::

    Начиная с версии **CS-Cart 4.6.2**, для корректной работы способа оплаты PayAnyWay необходимо, прежде всего, настроить существующие налоги с помощью :doc:`модуля "Налоговые ставки РФ" </user_guide/addons/rus_taxes/index>`.

Платежи через сервис PayAnyWay — это быстрый и безопасный способ оплаты различных товаров и услуг: от сотовой связи и кабельного телевидения до авиабилетов и услуг отелей.

Официальный сайт: |link|

.. |link| raw:: html

   <a href="http://www.payanyway.ru/" target="_blank">payanyway.ru</a>

Инструкция
==========

#.  Зарегистрируйтесь и настройте PayAnyWay.


    *   Войдите в личный кабинет и перейдите на складку "Управление счетами"

        .. fancybox:: img/payanyway_enter.png
            :alt: PayAnyWay go to tab

    *   Перейдите на редактирование счета

        .. fancybox:: img/payanyway_go_edit.png
            :alt: PayAnyWay go to tab

    *   Настройте счет

        *   В поле "Pay URL" укажите ссылку

        ::

            https://example.com/index.php?dispatch=payment_notification.notify&payment=payanyway

        *   HTTP метод - POST

        *   Код проверки целостности данных

        *   Подпись формы оплаты обязательна - Да

        *   Можно переопределять настройки в url - Да

        .. fancybox:: img/payanyway_params.png
            :alt: PayAnyWay params

#.   Создайте новый способ оплаты (:doc:`Способы оплаты <adding_payment>`).

#.  Выберите процессор оплаты "PayAnyWay" в окне редактирования способа оплаты.

    .. fancybox:: img/payanyway_select.png
        :alt: Select

#.  Пройдите во вкладку "Настроить" нового способа оплаты и выполните настройку.

    .. fancybox:: img/payanyway_settings.png
        :alt: Settings

    Доступные настройки:

    *   URL сервера оплаты

    *   Номер счета

    *   Код проверки целостности данных

    *   Тестовый/рабочий режим

    *   Валюта

    *   Платежная система

    *   Логин в PayAnyWay

    *   Пароль в PayAnyWay

#.  Как выглядит процесс оплаты на стороне PayAnyWay

    .. fancybox:: img/payanyway_example.png
        :alt: Example
