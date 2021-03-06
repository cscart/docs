Выставить счет
--------------

Описание
========

Выставить счет - способ оплаты, который позволяет выставить счет покупателю для оплаты заказа.

Настройка способа оплаты
========================

1.  Создайте новый способ оплаты в панели администратора (:doc:`Способы оплаты <adding_payment>`).

2.  Выберите процессор оплаты "Выставить счёт" в окне редактирования способа оплаты.

    .. fancybox:: img/invoice_01.png
        :alt: Выставить счет

3.  Пройдите во вкладку "Настроить" нового способа оплаты и выполните настройку.

    .. fancybox:: img/invoice_02.png
        :alt: Выставить счет

    Доступные настройки:

    .. list-table::
        :header-rows: 1
        :stub-columns: 1
        :widths: 10 30

        *   -   Получатель
            -   Данные получателя

        *   -   Адрес
            -   Адрес компании

        *   -   Телефон
            -   Телефон компании

        *   -   КПП
            -   КПП компании

        *   -   ИНН
            -   ИНН компании

        *   -   Расчетный счет
            -   Расчетный счет компании

        *   -   Банк
            -   Реквизиты банка компании

        *   -   БИК
            -   БИК банка

        *   -   Кор. счет
            -   Кор. счет компании

        *   -   Изображение печати
            -   Изображение печати, используемое на бланке выставления счета

        *   -   Ширина печати
            -   Ширина изображения печати

        *   -   Высота печати
            -   Высота изображения печати

        *   -   Статус заказа
            -   Статус присваиваемый заказу, при использовании данного способа оплаты

        *   -   Организация
            -   Поле содержащее данные покупателя

        *   -   Адрес
            -   Поле используемое в качестве адреса пользователя

        *   -   Индекс
            -   Поле используемое в качестве индекса пользователя

        *   -   Телефон
            -   Поле используемое в качестве телефона пользователя

        *   -   ИНН
            -   Поле используемое в качестве ИНН

        *   -   Банковские реквизиты
            -   Поле содержащее банковские реквизиты

Проверка способа оплаты
=======================

1. Создайте тестовый заказ. В окне оформления заказа, при выборе данного способа оплаты появятся поля с данными покупателя. Данные полей можно изменить.

    .. fancybox:: img/invoice_03.png
        :alt: Выставить счет

2. На странице оформленного заказа появится новая ссылка "Счет на оплату".

    .. fancybox:: img/invoice_04.png
        :alt: Выставить счет

3. Вкладка "Информация об оплате" содержит информацию о покупателе и организации.

    .. fancybox:: img/invoice_05.png
        :alt: Выставить счет

4. При нажатии на ссылку "Счет на оплату" откроется квитанция к оплате.

    .. fancybox:: img/invoice_06.png
        :alt: Выставить счет

5. На странице заказа в панели администратора появятся ссылки "Отправить" и "Распечатать счет". При нажатии на ссылку "Отправить", квитанция к оплате отправиться на почту покупателю. При нажатии на ссылку "Распечатать счет" откроется квитанция к оплате.

    .. fancybox:: img/invoice_07.png
        :alt: Выставить счет
