*******
Schemes
*******

A scheme is a special file describing certain object structure. There are schemes for blocks, settings, promotions, etc. All schemes are stored in the *schemas* directory (*...app/schemas*). 

An add-on can extend and override a scheme fully or partially (:doc:`learn more <../addons/scheme_extending>`).

*********************
Схемы и их устройство
*********************


Что такое схема
============================

Схема - это структура данных, основываясь на которой некая абстрактная сущность выполняет набор действий, заданных этой схемой. Например, exim (экспорт-импорт) не привязан к какой-либо сущности (продукты, страницы и т.п.) - все данные, которые он может экспортировать/импортировать описаны с помощью схемы.

Типы схем
============================

Существует 3 типа схем. Типы нельзя смешивать между собой (например описывать данные и в этом же скрипте - функции)

    *   Массив данных - схема возвращает массив. Например:

        - app/schemas/permissions/admin.php
        - app/schemas/clone/objects.php
        - app/schemas/sharing/schema.php
        - ...

        ::

            <?php
            return array(
                'layouts' => array(
                    'checked_by_default' => true,
                    'function' => 'fn_clone_layouts'
                ),
                'settings' => array(
                    'checked_by_default' => true,
                    'tables' => array(
                        array(
                            'name' => 'settings_vendor_values',
                            'key' => '', // Do not needed
                        ),
                    ),
                ),

                // Some other code

            );
            ?>


    *   XML-структура - схема является обычным текстовым файлом, содержимое которого считывается через fn_get_contents
        На текущий момент считается устаревшей и в ядре карты не используется. 

        .. code-block:: xml

            <menu>  
                <items>
                    <subitems>
                        ....
                    <subitems>
                </items>
            </menu>


    *   Набор функций - в схеме описаны функции. В большинстве случаев схема с функциями является дополнением схемы с массивом данных. Тогда такую схему нужно подключать через include_once в начале файла с данными и отдельно вызывать ее не надо. В случае же, если такая схема является самостоятельной (например actions и variants у settings), то такую схему подключаем как обычно, например `fn_get_schema("settings", "actions.functions")`.

        - app/schemas/exim/products.functions.php
        - app/schemas/last_view/frontend.functions.php
        - ...
        
        ::

            <?php
            function fn_some_scheme_func1($params)
            {
                ...
            }

            function fn_some_scheme_func2()
            {
                ...
            }
            ?>


Расширение схем
============================

Существует 2 вида расширения - с помощью аддонов и с помощью тегов редакции.

    *   Аддоны. Чтобы расширить схему с помощью аддона, нужно создать в каталоге аддона ту же структуру каталогов и файлов схемы, добавив к имени файла суффикс ".post". Например ::

        | Основной файл
        | -------------
        | app/schemas/permissions/admin.php
        | 
        | Файл расширения
        | ---------------
        | app/addons/seo/schemas/permissions/admin.post.php


    При подключении схемы расширения в нее передается переменная $schema, которая содержит данные, расширяемой схемой. Работать нужно с этой переменной и в конце скрипта вернуть ее. Например,
    ::
    
        <?php
        // в $schema уже есть данные, которые вернула родительская схема
        $schema['news'] = array(
            'modes' => array(
                'manage' => array(
                    'permissions' => 'manage_news'
                )
            )
        );

        return $schema;


    Более детально про то, как работать со схемами в аддонах можно прочитать тут: (:doc:`learn more <../addons/scheme_extending>`)
    

    *   Теги редакции нужны, чтобы сформировать нужные данные в схеме в зависимости от редакции (ultimate, multivendor). Чтобы расширить схему с помощью тега редакции, нужно создать в каталоге со схемой файл вида schema_[PRODUCT_EDITION]. Например::
    
        | Основной файл
        | -------------
        | app/schemas/permissions/admin.php
        | 
        | Файл тега редакции
        | ---------------
        | app/schemas/permissions/admin_ultimate.php
    

    Сюда также передается переменная $schema, которая содержит данные, расширяемой схемой. Работать нужно с этой переменной и в конце скрипта вернуть ее.

Получение схемы
============================

Данные схемы получаются (или подключаются функции) с помощью функции fn_get_schema::

    function fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false)


$schema_dir - подкаталог со схемой относительно каталога schemas, например "permissions", "settings"
$name - имя файла со схемой, без расширения, например "admin", "schema". Если тип схемы - функция - то имя пишется в таком виде: "actions.functions", "variants.functions"
$type - тип схемы (по сути расширение файла) - php или xml
$force_addon_init - указывает, что при подключении схемы нужно подключить так же отключенные аддоны и их файлы func.php

При запросе схемы происходит построение дерева схем с учетом аддонов и их подключение. Пример::

    $menu = fn_get_schema('menu', 'menu', 'php');


#.   Поиск основного файла схемы: /app/schemas/menu/menu.php (основной файл схемы также может располагаться в папке аддона, например addons/my_addon/app/schemas/xxx/yyy.php и быть получен через fn_get_schema('xxx', 'yyy'))
#.   Проверка схем аддонов, есть ли дополнения:

        - app/addons/access_restrictions/schemas/menu/menu.post.php
        - app/addons/attachments/schemas/menu/menu.post.php
        - app/addons/banners/schemas/menu/menu.post.php
        - app/addons/data_feeds/schemas/menu/menu.post.php
        - app/addons/news_and_emails/schemas/menu/menu.post.php
        - и тд.
#.   Полученная схема кешируется, чтобы при следующем обращении не нужно было сканировать все папки.
#.   Поочередно подключаются найденные файлы. В итоге получается полная схема, которая включает в себя все схемы аддонов.