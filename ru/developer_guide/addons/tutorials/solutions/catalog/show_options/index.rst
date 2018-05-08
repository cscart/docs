**********************************
Отображение опций в списке товаров
**********************************

.. note::

    Статья не рассчитана на работу с вариациями из модуля :doc:`"Вариации товаров [Beta]" </user_guide/addons/product_variations/index>`.

Описание
--------

По умолчанию на странице списка товаров скрыто отображение опции товаров. Опции товаров доступны на детальной странице товара. 

Вы можете включить отображение опций на странице каталога, если это необходимо. 

.. list-table::
    :header-rows: 1
    :widths: 30 30

    *   -   Было

        -   Стало

    *   -   .. fancybox:: img/catalog_01.png
                :alt: Отображение опций товаров

        -   .. fancybox:: img/catalog_02.png
                :alt: Отображение опций товаров

Подготовка
----------

Вам необходимо:

1.  Откройте файл:

    ``/design/themes/[название_темы]/templates/blocks/product_list_templates/products_without_options.tpl``


2.  Добавьте новый параметр ``show_product_options=true`` в подключение smarty шаблона ``blocks/list_templates/products_list.tpl``

    Код:

    .. literalinclude:: files/products_without_options.tpl
        :emphasize-lines: 4
        :linenos:


3.  Очистите кэш и проверьте результат на витрине.

    Отлично, опции появились в списке товаров. Теперь перенесём изменения в модуль «Мои изменения». 

    -   .. fancybox:: img/catalog_02.png
            :alt: Отображение опций товаров

4.  Верните к оригинальному виду файл:

    ``/design/themes/[название_темы]/templates/blocks/product_list_templates/products_without_options.tpl``



Внесение изменений с помощью модуля
-----------------------------------

Мы определили файл и необходимые модификации для отображения параметров в списке товаров. 

Правильным решением будет — внести данные изменения с помощью модуля. 

Нужный нам шаблон не имеет хуков. Однако каждый шаблон сам по себе является хуком, его можно перезаписать с помощью модуля.  

Мы будем вносить изменения с помощью модуля «Мои изменения» (my_changes).

1.  Пройдите в папку шаблонов темы:

    ``/design/themes/[название_темы]/templates/``

2.  Пройдите в папку шаблонов модуля ``my_changes``:

    ``/design/themes/[название_темы]/templates/addons/my_changes``

    .. note::

        Если у вас нет данной папки, создайте её


3.  Чтобы перезаписать какой либо шаблон, вы должны создать папку ``overrides`` в папке шаблонов вашего модуля.

    Создайте и пройдите в неё:

    ``/design/themes/[название_темы]/templates/addons/my_changes/overrides``

4.  Любой файл, который вы разместите в данной папке, перезапишет оригинальный файл. Очень важно сохранить структуру папок:

    .. list-table::
        :widths: 30 30

        *   -   Было:

            -   ``/design/themes/[название_темы]/templates/blocks/product_list_templates/products_without_options.tpl``

        *   -   Стало:

            -   ``/design/themes/[название_темы]/templates/addons/my_changes/overrides/blocks/product_list_templates/products_without_options.tpl``

    Другими словами, в папке ``overrides`` вашего модуля, вы должны повторить путь к файлу относительно папки шаблонов ``/design/themes/[название_темы]/templates/``.

5.  Создаём папку: 

    ``/design/themes/[название_темы]/templates/addons/my_changes/overrides/blocks/product_list_templates/``

6.  Копируем в неё оригинальный файл **products_without_options.tpl** из папки:

    ``/design/themes/[название_темы]/templates/blocks/product_list_templates/``

7.  Открываем файл:
    
    ``/design/themes/[название_темы]/templates/addons/my_changes/overrides/blocks/product_list_templates/products_without_options.tpl``

    и вносим в него нужные нам изменения — добавляем параметр:

    .. literalinclude:: files/products_without_options.tpl
        :emphasize-lines: 4
        :linenos:

8.  Установите и включите модуль «Мои изменения». 

    Результат:

    .. fancybox:: img/catalog_02.png
        :alt: Отображение опций товаров

9.  Если изменения не появились:

    *   Очистите кэш, удалив папку ``/var/cache/``

    *   Проверьте правильность путей и файлов.

**Готово!**

.. important::

    Внесение изменений с помощью модуля позволит:

    1.  Не потерять изменения при обновлении платформы;

    2.  Вы можете в любой момент выключить модуль;
