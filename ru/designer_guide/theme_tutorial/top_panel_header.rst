*********************
Top panel and header
*********************


.. contents::
    :local: 
    :depth: 3


Следующим этапом будет создание создание и расположение блоков в Top panel and Header containers.

Будем изменять Layout по-умолчанию.


Правка Макетов (Layouts)
-------------------------

Поменяем блоки *Currencies* и *Languages* местами как на макете. Это можно сделать с помощью drag-and-drop, взять блок *Languages* и перетащить за *Currencies*.

Также нужно добавить блок о *Доставке*. 

1. Создадим grid шириной равное 3 и расположем его после grid c логотипом.

2. Добавим в созданный grid ``HTML block``.

3. Добавим следующий код для блока:
    
    .. literalinclude:: files/delivery.html
        :linenos:


Остальные блоки оставим как есть.

На макете не представлен функционал *Профиль пользователя*, но он важен для пользователя. Поэтому блок оставим как есть.

Вот что получилось:

    .. image:: img/top_header.png



Создание стилей для Top panel and Header
-----------------------------------------

В Cs-Cart для изменения фона container, цвет ссылок, текста используется Visual editor и Styles(ex. Presets).

Чтобы активировать Visual editor, на странице themes, рядом с темой нажмем кнопку Visual editor.

    .. image:: img/admin_themes.png


Для того, чтобы изменить background Top panel, в *Customize* выбирает ``Background``, появится секция ``Top panel``.

По макету цвет Top panel равен ``#573c27``. Установим цвет для background равный ``#573c27``. Для фона панели можно задать и градиент. Для этого нужно нажать на "шестеренку” и появятся дополнительные опции, такие как второй цвет для градиента, прозрачность и ширина панели.

Таким же образом изменим background для Header на ``#fbfbfb``. Активируем настройку *Full width*, чтобы серый фон был на всю ширину экрана.

    .. image:: img/visual_editor.png


Добавление стилей CSS
----------------------

Создадим отдельный файл *custom.less* в ``themes/tutorial/css/`` и подключим его в ``themes/tutorial/templates/common/styles.tpl``.

Будем добавлять в этот файлы наши стили.

Начнем с *Валют(Currencies)*. 

По-умолчанию, 3 валюты отображаются в ряд. С уменьшением экрана, появляется выпадающий список.

    .. image:: img/currencies.png


Чтобы сделать сразу выпадающий список, нужно в настройках блока для *“Минимальное кол-во элементов для отображения в выпадающем списке.” (Minimal number if items to be placed in a dropdown list)*. поставить значение 1.

Название и символ валюты можно задать в настройках валюты *Администрирование / Валюты(Administration / Currencies)*. 

По макету символ валюты не выводится, его надо удалить из шаблона.

Быстрый способ найти шаблон, с помощью поиска по файлам классов, которые используются в разметке.

Определить, какие классы используются, можно с помощью DevTools для Chrome или Firebug для Firefox.

.. note::
    
    CSS стили кэшируются. Чтобы кэш очищался автоматически, нужно включить настройку “Обновлять кэш автоматически” (Rebuild cache automatically) на странице Темы (Themes)  в административной панели.


Будем искать по классу ``ty-select-block__a-item``, он используется ``templates/common/select_object.tpl``.

За вывод символа валюты отвечает код:

    .. literalinclude:: files/currency_sign.tpl
        :linenos:
 
Удалим его из шаблона.

Другой способ определения шаблона, использовать иерархию подключения шаблонов.

Для Mакетов(Layouts) шаблоны расположены в ``templates/blocks``. Для блока *Валюты(Currencies)* используется шаблон ``templates/blocks/currencies.tpl``.

Подкючение шаблона определяется в схеме ``app/schemas/block_manager/blocks.php``

    .. literalinclude:: files/schema.php
        :linenos:

За вывод валюты в выпадающем списке отвечает код:

    .. literalinclude:: files/currency_tpl.tpl
        :linenos:

В котором подключается с помощью ``include`` файл ``common/select_object.tpl``, в котором располагается символ валюты.

С настройками валюты закончили, добавим теперь стили.

Все ссылки в Top panel имеют белый цвет. Поэтому добавил для всех ссылок в Top panel стили:

    .. literalinclude:: files/css/top_grid.css
        :linenos:

``top-grid`` - это пользовательский класс для grid(ссылка на документацию), который можно изменить в настройках grid. 

Пользовательские классы для *блоков(blocks)* и *гридов(grids)* в своем названии не содержат префикса ty-, чтобы не путать с классами в шаблонах.



Текст валюты должен быть большими буквами. Если добавить стиль только для класса ty-select-block__a-item, то это будет не правильно, так как он используется для вывода еще языков.

Лучше использовать в селекторе класс блока, где расположен класс ``ty-select-block__a-item``:

    .. literalinclude:: files/css/top_currencies.css
        :linenos:


Рассмотрим теперь блок с языками(languages). 

Рядом с знаванием языка выводится “треугольник”, который не нужен. Можно поправить шаблон, но быстрее скрыть его через css:

    .. literalinclude:: files/css/top_languages.css
        :linenos:

Для блока с ссылками добавим стили: 


    .. literalinclude:: files/css/top_quick_links.css
        :linenos:

Рассмотрим теперь блок Delivery 24/7.

Для него нужно добавить иконку.

Будем использовать шрифтовые иконки как в Cs-Cart.

Для этого будем использовать сервис `icomoon.io <http://icomoon.io/>`_. . Будем использовать иконку *clock* из набора IcoMoon. Сохраним шрифт в папке ``media/fonts/`` темы.

    .. image:: img/icomoon.png


Из файла style.css, который находится со шрифтами, перенесем стили для иконок в custom.less файл и поправим пути до шрифтов.

    .. literalinclude:: files/css/font.css
        :linenos:


    .. note::

       При создании нового иконочного шрифта, нужно, чтобы названия классов иконок не совпадало с названием классов иконок в шаблоне. Т.е. .ty-icon- нельзя задавать.


Добавим класс ``tt-icon-clock`` для ``ty-delivery__icon`` блока Delivery.

Добавим стили, чтобы блок выглядел по макету.

    .. literalinclude:: files/css/delivery.css
       :linenos:


Добавим стили для формы поиска. Разметка, которая есть в шаблоне править не надо. Изменим только стили.

    .. literalinclude:: files/css/search.css
        :linenos:

Добавим стили для меню. Править разметку не надо.

    .. literalinclude:: files/css/menu.css
        :linenos:


По макету для Header осталось изменить Корзину(Cart content).

Блок использует шаблон ``templates/blocks/cart_content.tpl``

За вывод корзины отвечает следующий код:

    .. literalinclude:: files/css/cart_content_before.tpl
        :linenos:



Изменим разметку на:

    .. literalinclude:: files/css/cart_content_after.tpl
        :linenos:


Добавим разметку для Корзины:

    .. literalinclude:: files/css/cart_content.css
        :linenos:


С оформлением блоков закончили. Осталось только все поправить.


Добавим правильные отступы и стили при наведении для элементов.


Финальный custom.less для top panel и header:


    .. literalinclude:: files/css/custom.css
        :linenos:


Результат
---------

    .. image:: img/result.png
