**********************************************
8. Добавим новую настройку для товара. Часть 3
**********************************************

В прошлом уроке мы нашли хук, для добавления новой настройки с помощью модуля. 

Будем расширять «Мой первый модуль» созданный в первом уроке.

Подключимся к хуку: ``{hook name="products:detailed_content"}``

1.  Откройте папку:

    ``/design/backend/templates/addons/first_addon``

2.  Пройдите в папку 

    ``/design/backend/templates/addons/first_addon/hooks/``

3.  Создайте в ней папку **products** . 

    — Почему **products**

    — Потому что хук так называется, {hook name=" **products** :detailed_content"} .

4.  Пройдите в папку 

    ``/design/backend/templates/addons/first_addon/hooks/products``

5.  Создайте новый файл **detailed_content.pre.tpl**.

    — Почему такое название?

    — Это подсказывает нам хук, {hook name="products: **detailed_content** "} .

    — Почему добавляем **.pre** в конце?

    — Всё просто, в зависимости от приставки (.pre, .post, .override), ваше расширение для хука будет подключаться:

    *   **detailed_content.pre.tpl** — подключится перед хуком

    *   **detailed_content.post.tpl** — отработает после хука

    *   **detailed_content.override.tpl** — перезапишет весь код внутри тега хука ``{hook}{/hook}``


6.  Откройте файл:

    ``/design/backend/templates/addons/first_addon/hooks/products/detailed_content.pre.tpl``

    Вставьте тестовый код.

    .. literalinclude:: files/updates_hooks_addons_pre_test.tpl
        :language: smarty
        :linenos:

    Удалите все старые ``<p>Test</p>``. 

7.  Пройдите во вкладку «Модули» страницы редактирования товара и проверьте результат. 

    .. image:: img/howto_addon_17.png
        :alt: Первый модуль

    .. note:: 

        Ничего не появилось?

        1.  Очистите кэш

        2.  Проверьте включен ли модуль «Мой первый модуль»

        3.  Проверьте правильность названий папки и файла подключения к хуку.

8.  Отлично, теперь вы сможете с помощью модуля вставить любой код в любое место сайта. 

Однако нам нужно добавить новую настройку товару.
 
Идём дальше.

