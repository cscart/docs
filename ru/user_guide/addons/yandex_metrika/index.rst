**************
Яндекс.Метрика
**************

.. important::

    C 13 февраля 2019 г. Яндекс отключил старый способ авторизации, который использовался модулем. Для работы с Яндекс.Метрикой нужна как минимум версия 4.9.2 SP4, где в модуле есть новый способ авторизации.

Настройки на сайте Яндекс.Метрика
---------------------------------

1.  Создайте новый счётчик метрики на официальном сайте: |link|

    .. |link| raw:: html

       <!--noindex--><a href="https://metrika.yandex.ru/add/" target="_blank" rel="nofollow">Яндекс.Метрика</a><!--/noindex-->

    .. fancybox:: img/metrika_01.png
        :alt: Яндекс.Метрика

2.  Включите «Вебвизор» и «Пример использования параметров визитов» во вкладке «Код счётчика» страницы редактирования счётчика.

    Нажмите «Сохранить».

    .. fancybox:: img/metrika_02.png
        :alt: Яндекс.Метрика

3.  Откройте вкладку «Цели» настроек счётчика.

    Создайте новую цель для страницы «Корзина».

    Используйте следующие настройки цели:

    .. list-table::
        :widths: 10 30

        *   -   Условие

            -   URL страницы

        *   -   url: содержит

            -   /cart

        *   -   Типы целей интернет-магазинов

            -   Да

        *   -   Эта цель описывает корзину на моём сайте

            -   Да

    .. fancybox:: img/metrika_12.png
        :alt: Яндекс.Метрика

4.  Создайте ещё одну цель — «Успешный заказ».

    Используйте следующие настройки:

    .. list-table::
        :widths: 10 30

        *   -   Условие

            -   URL страницы

        *   -   url: содержит

            -   /index.php?dispatch=checkout.complete

        *   -   Типы целей интернет-магазинов

            -   Да

        *   -   Эта цель описывает подтверждение заказа на моём сайте

            -   Да


    .. fancybox:: img/metrika_04.png
        :alt: Яндекс.Метрика

5.  Откройте вкладку «Общие» вашего счётчика и скопируйте код счётчика.

    .. fancybox:: img/metrika_05.png
        :alt: Яндекс.Метрика


Настройки в панели администратора интернет-магазина
---------------------------------------------------

1.  Пройдите на страницу «Модули» в панели администратора

    .. note::

        Верхнее меню → Модули → Управление модулями

    .. fancybox:: img/metrika_06.png
        :alt: Яндекс.Метрика

2.  Найдите и установите модуль «Яндекс.Метрика».

    .. fancybox:: img/metrika_07.png
        :alt: Яндекс.Метрика

    Включите модуль, если он выключен.

    .. fancybox:: img/metrika_08.png
        :alt: Яндекс.Метрика

3.  Откройте настройки модуль кликнув по названию.

    .. fancybox:: img/metrika_09.png
        :alt: Яндекс.Метрика

    Введите код счётчика и сохраните настройки. 

Проверим результат
------------------

1.  Откройте интернет-магазин в браузере и сделайте несколько переходов по страницам.

2.  Откройте список счётчиков на сайте Яндекс.Метрика. 

    Счётчик должен показать первое посещение.
    
    .. fancybox:: img/metrika_11.png
        :alt: Яндекс.Метрика

    .. note::

        Если этого не произошло, то стоит:

        1.  Проверить правильность кода счётчика.

        2.  Немного подождать, иногда метрика отображает результаты с задержкой в несколько минут.

3.  Создайте тестовый заказ. 

4.  Пройдите на страницу статистики вашего счётчика. 

    Откройте странице «Содержание» → «параметры интернет-магазинов» . 

    Вы увидите ваш заказ. 

    .. fancybox:: img/metrika_13.png
        :alt: Яндекс.Метрика

    .. note::

        Статистика по целям и заказам появляется с задержкой в несколько минут.

Автоматическое создание целей
-----------------------------

1.  Пройдите на страницу «Модули» в панели администратора.

2.  Откройте настройки модуль кликнув по названию.

    Введите ID приложения, пароль приложения и выберите цели. Нажмите на ссылку "Обновить токен" и сохраните настройки.

3.  Откройте список счётчиков на сайте Яндекс.Метрика. 

    Для указанного счётчика в настройках модуля должны создаться ценли.
    
    .. fancybox:: img/metrika_14.png
        :alt: Яндекс.Метрика

    .. note::

        Если этого не произошло, то стоит:

        1.  Проверить правильность кода счётчика.

        2.  Немного подождать, иногда метрика отображает результаты с задержкой в несколько минут.

        3.  Попробовать снова нажать на ссылку "Обновить токен"

Всё. 

Успехов в достижении целей.
