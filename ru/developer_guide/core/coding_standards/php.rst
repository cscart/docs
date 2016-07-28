***
PHP
***

.. contents:: Содержание
    :local: 
    :depth: 3
    

Правильный путь PHP разработки
------------------------------

Обязательно к прочтению перед работой:

*   Оригинал: |phptherightway-en|

*   На русском языке: |phptherightway-ru|

.. |phptherightway-en| raw:: html

   <a href="http://www.phptherightway.com/" target="_blank" >The Right Way</a>


.. |phptherightway-ru| raw:: html

   <a href="http://getjump.me/ru-php-the-right-way/" target="_blank" >Правильный путь</a>

Общий стиль
-----------

Полное соблюдение |psr-012|.

.. |psr-012| raw:: html

   <a href="https://github.com/php-fig/fig-standards/tree/master/accepted" target="_blank" >PSR (0, 1, 2)</a>


Автоматический исправитель кодстайла под эти стандарты |codestyle|.

.. |codestyle| raw:: html

   <a href="http://cs.sensiolabs.org/" target="_blank" >ТУТ</a>


.. note::

    **Правило бойскаута.**  Оставлять место после себя чище чем оно было до твоего визита. Т.е. переписывайте код который не соответствует стандартам и правилам хорошего тона.

jQuery-like форматирование вызовов функций, массивов и т.д.
===========================================================

::

    $_data = array (
        'addon' => $addon_scheme->getId(),
        'priority' =>  $addon_scheme->getPriority(),
    );

    db_query("REPLACE INTO ?:addon_descriptions ?e", array(
        'lang_code' => $translation['lang_code'],
        'addon' =>  $addon_scheme->getId(),
        'name' => $translation['value'],
        'description' => $translation['description']
    ));

    return array(
        'status' => Response::STATUS_OK,
        'data' => array(
            'settings' => $result,
            'search' => $params
        )
    );


Переменные
==========

*   В нижнем регистре (``$products``). 

*   Разделитель подчёркивание (``$category_data``).

*   Обязательно **осмысленное именование**. Никаких $tmp, $t, $k, $v и т.д.

Константы
=========

*   Полностью в верхнем регистре – ``SUNDAY``

*   Разделитель подчёркивание (_) – ``ALL_USERGROUPS``

Строки
======

*   При обращении к элементу массива по ключу заключать имя ключа в одинарные кавычки.

*   Все строковые переменные, не содержащие в себе других переменных, заключать в одинарные кавычки.

*   Если в строке должна быть переменная, то строка берется в двойные кавычки.

Строковые литералы и «магические числа»
=======================================

*   В коде не должно быть числовых значений и строковых литералов, значение которых неочевидно.

*   Такие вещи следует переносить в константы с осмысленными именами и обращаться в коде к константам.

*   Если имеем дело с группой значений (например, возможные варианты значения поля в таблице БД), то константы этих значений нужно выделить в отдельный класс в пространстве имён ``Tygh\Enum``. Пример такого класса - ``Tygh\Enum\ProductTracking``.

    Плохо:

    ::

        $product->tracking = 'O'; // WTF 'O' means?


    Хорошо:

    ::

        $product->tracking = Tygh\Enum\ProductTracking::TRACK_WITH_OPTIONS;


Комментарии
===========

*   Комментарии пишутся только на английском языке. 

*   Для комментирования кода внутри функции/в контроллере использовать двойной слеш ``//``.

*   Использования perl style(``#``) не допускается;

*   Не пишите комментарий который дублирует то что и так выражено кодом. 

*   Будьте точны и кратки.

.. note::

    Помните правило, что лучше код без комментариев, чем код с ложными и неактуальными комментариями;


PHP Doc
=======

**Обязателен** для всех новых функций.

Описание аттрибутов возможных в doc-комментарии:

*   |php-doc-1|

*   |php-doc-2|


.. |php-doc-1| raw:: html

   <a href="http://www.phpdoc.org/docs/latest/for-users/list-of-tags.html" target="_blank" >http://www.phpdoc.org/docs/latest/for-users/list-of-tags.html</a>

.. |php-doc-2| raw:: html

   <a href="http://www.phpdoc.org/docs/latest/for-users/list-of-inline-tags.html" target="_blank" >http://www.phpdoc.org/docs/latest/for-users/list-of-inline-tags.html</a>

.. note::

    Если функция не возвращает значение, то правильно будет **не писать** ``@return`` вообще.


Быстродействие
==============

Не рекомендуется использовать внутри циклов вызов ``Registry::get();`` т.к. это операция довольно ресурсоёмкая и обращение к хранилищу снижает быстродействие до 50%. Чтобы этого избежать необходимо присвоить переменной перед циклом значение из Registry, а внутри цикла использовать переменную.

Пример кода отвечающего вышеописанным правилам
==============================================

::

    $tabs = $addon_scheme->getSections();

    if (!empty($tabs)) {

        // ...

        foreach($tabs as $tab_index => $tab) {
            $section_tab_id = Settings::instance()->updateSection(array(
                'parent_id'    => $addon_section_id,
                'edition_type' => $tab['edition_type'],
                'name'         => $tab['id'],
                'position'     => $tab_index * 10,
                'type'         => isset($tab['separate']) ? Settings::SEPARATE_TAB_SECTION : Settings::TAB_SECTION,
            ));

            // Import translations for tab
            if (!empty($section_tab_id)) {
                $settings = $addon_scheme->getSettings($tab['id']);

                foreach ($settings as $k => $setting) {
                    // ...
                }
            }
        }
    }


Функции
-------

Именование
==========

*   Имена функций полностью в нижнем регистре.

*   Начиначиются с префикса ``fn_``, либо с ``db_``.

::

    /**
     * Returns addon's setting variants (similar to fn_get_settings_variants)
     *
     * @deprecated deprecated since version 3.0
     * @param string $addon Addon name to get option for
     * @param string $option_name Option name
     * @param string $lang_code 2-letter language code (e.g. 'en', 'ru', etc.)
     * @return array Variants list
     */
    function fn_get_addon_option_variants($addon, $option_name, $lang_code = CART_LANGUAGE)
    {
        //...
    }

    /**
     * Execute query and format result as associative array with column names as keys
     *
     * @param string $query unparsed query
     * @param mixed ... unlimited number of variables for placeholders
     * @return array structured data
     */
    function db_get_array($query)
    {
        //...
    }


Параметры
=========

Если у параметров есть значения по умолчанию либо, они по смыслу не являются основными то их необходимо объединять в один параметр ``$extra``. Таким образом, в функцию будут передаваться только основным параметры плюс массив экстра.

Было:

::

    function fn_get_product_data($product_id, &$auth, $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false)

Стало:

::

    function fn_get_product_data($product_id, &$auth, $extra)
    {
            // extra default values
        $extra_default = array(
            'lang_code' => CART_LANGUAGE,
            'field_list' => '',
            'get_add_pairs' => true,
            'get_main_pair' => true
            'get_taxes' => true,
            'get_qty_discounts' = false,
            'preview' = false,
            'get_features' = true
        )
        $extra = fn_array_merge($extra_default, $extra);

        // ...

    }

Следует понимать разницу между ``$params`` и ``$extra``. Первая используется в основном при поиске, и содержит перечень атрибутов и условий для поиска. В то время как ``$extra`` агрегирует избыточные параметры. Основная идея для чего это было сделано - облегчить и улучшить стиль передачи всех пришедших в функцию параметров в хуки.


Следовать DRY (DO NOT REPEAT YOURSELF)
======================================

Если какой-либо кусок кода встречается в двух и более местах в контроллере/функции, то код выносится в отдельную функцию ядра (``fn.[тут по смыслу].php``).

Возвращать значение это хорошо
==============================

Все функции должны что-то возвращать! 

*   ``true``/``false`` 

*   ``$variable``

.. note::

    Правило не распространяется на методы классов

Точка выхода
============

Функция по возможности должна иметь только одну точку выхода. Использование двух и более точек выхода допускается лишь в случае, если этим достигается низкий порог дальнейшей условности, в простейшем случае для экономии ресурсов. Например, функция ``fn_apply_exceptions_rules`` в ``app/functions/fn.catalog.php``.

ООП
---

Имена классов
=============

С прописной буквы в CamelCase.

::

    class Api
    {


::

    class ClassLoader
    {


Константы
=========

*   Полностью в верхнем регистре

*   Разделитель подчёркивание (``_``)

::

    class Api
    {
        /**
         * Key of resource name in _REQUEST
         *
         * @const REST_PATH_PARAM_NAME
         */
        const DEFAULT_REQUEST_FORMAT = 'text/plain';


Свойства
========

*   Полностью в нижнем регистре.

*   Разделитель подчёркивание.

*   Закрытые и приватные свойства **не должны** начинаться с подчёркивания.

*   Стандарт |psr-2|

::

    class Api
        /**
         * Current request data
         *
         * @var Request $_request
         */
        private $request = null;

        /**
         * Sample var
         *
         * @var array $request
         */
        private $sample_var = array();


Методы
======

*   Со строчной буквы в camelCase.

*   Закрытые и приватные свойства **не должны** начинаться с подчёркивания.

*   Методы в классе нужно группировать по типу (public -> protected -> private).

*   Стандарт |psr-2|

.. |psr-2| raw:: html

   <a href="https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md#42-properties" target="_blank" >PSR-2</a>

::  

    class SomeClass
    {
        /**
         * Creates a new ClassLoader that loads classes of the
         * specified namespace.
         *
         * @param string $include_path Path to namespace
         */
        public function __construct($include_path = null)
        {
            // ...
        }

        /**
         * Gets request method name (GET|POST|PUT|DELETE) from current http request
         *
         * @return string Request method name
         */
        private function getMethodFromRequestHeaders()
        {
            // ...
        }


Пространства имён
=================

Начиная с версии 3.1.1 используются пространства имён: |namespaces|.

.. |namespaces| raw:: html

   <a href="http://www.php.net/manual/ru/language.namespaces.rationale.php" target="_blank" >http://www.php.net/manual/ru/language.namespaces.rationale.php</a>


**Tygh** — название пространства имён ядра магазина.

Все классы ядра должны входить в это пространство имён. Если несколько классов относятся по смыслу к одному функционалу, то нужно выделять их в отдельное подпространство, как например классы менеджера блоков (``Tyqh\BlockManager``) или Api (``Tyqh\Api``)

Объявляется пространство имён так:

::

    namespace Tygh;


Подпространство имён:

::

    namespace Tygh\BlockManager;


Все функции, классы, константы и т.д объявленные в этом пространстве имён будут доступны из глобального пространства или из другого только в случае указания этого пространства.

Например имеем такой файл:

::
    
    namespace My\Name;

    class MyClass {}
    function myfunction() {}
    const MYCONST = 1;

    $a = new MyClass; // тут всё ок


В другом файле мы должны указывать пространство имён, если он не принадлежит тому же

::

    $c = new \My\Name\MyClass; // Так работает.

    $c = new MyClass; // Так не работает.


В третем файле попробуем тоже самое только с use

::

    use My\Name;

    $c = new \My\Name\MyClass; // Так работает.

    $c = new MyClass; // И так работает.


Пространтсво имён, как и директива ``use`` действует только на один файл в котором объявлено. На те файлы которые подключаются с помощью ``include`` и ``require``, действие не распространяется.

В каждом файле, в котором используются классы обязательно писать в начале директиву ``use``, которая определяет какие пространства имён используются. В случае совпадения названий классов, требуется писать алиасы. Использовать полное имя класса вместе с пространством имён как следствие не требуется и нежелательно.

::

    use Tygh\Registry;
    use Tygh\Settings;
    use Tygh\Addons\SchemesManager as AddonSchemesManager;
    use Tygh\BlockManager\SchemesManager as BlockSchemesManager;
    use Tygh\BlockManager\ProductTabs;
    use Tygh\BlockManager\Location;
    use Tygh\BlockManager\Exim;

Обязательно группировать ``use`` диррективы друг с другом.

**Директива ``use`` это аналог ``require (include)``**. Она добавляет каждому используему в файле имени класса то пространство имён в котором он находится. Она не подключает файл.

Автозагрузка классов
====================

Все классы подключаются автоматически из тех путей которые добавлены в ClassLoader. По этому без крайней необходимости не стоит подключать классы вручную (``require`` или ``include``).

Все дирерктории модулей по умолчанию в этот путь включаются, если аддон включен и установлен.

Для того чтобы добавить специфическую папку нужно выполнить вот эту строку:

::

    Registry::get('class_loader')->addIncludePath('\\путь\\до\\папки\\с\\классами');


Дирректория с аддоном может содержать как свои пространства имён так и классы расширяющие ``Tygh``. Можно увидеть на примере аддона **Store Import**.

Оформление SQL запросов
-----------------------

При выполнении вставки в базу данных использовать плейсхолдеры для значения полей.

Для вставки данных, не перечислять поля вручную, а использовать массив с плейсхолдером ``?e`` или ``?u``!

::

    $a = array(
        'col1' => $some_var,
        'col2' => CONST,
        'col3' => 'text'
    );

    db_query('INSERT INTO ?:mytable ?e', $a);


Перчень плейсхолдеров (placeholders) можно найти в разделе :doc:`Работа с базой данных MySQL. Плейсхолдеры и функции </developer_guide/core/db/index>`

Обязательно разделять строки более 120. Автоперенос строк в данном случае не спасает потому как переносит как ему вздумается, в результате я бы не сказал что код от этого становиться понятнее.

Запрос необхомо разделять следующим образом (кавычки и точки должны жестко соблюдаться):

::  

    $partner_balances = db_get_hash_array(
            "SELECT pa.partner_id, u.user_login, u.firstname, u.lastname, u.email, SUM(amount) as amount"
            . " FROM ?:aff_partner_actions as pa"
            . " LEFT JOIN ?:users as u ON pa.partner_id = u.user_id"
            . " LEFT JOIN ?:aff_partner_profiles as pp ON pa.partner_id = pp.user_id"
            . " LEFT JOIN ?:affiliate_plans as ap ON ap.plan_id = pp.plan_id AND ap.plan_id2 = pp.plan_id2"
              . " AND ap.plan_id3 = pp.plan_id3"
            . " WHERE pa.approved = 'Y' AND payout_id = 0 ?p ?p"
            . " ORDER BY $sorting $limit",
            'partner_id', $condition, $group
        );


Закрывающая скобка обязатально переносится на новую строку! Таким образом мы выделяем нашу многострочную структуру в единый блок, что облегчает чтение кода.

Запрещено
---------

*   Никогда не использовать собаку @ перед переменными или функциями - это плохой стиль программирования, ведущий к большому количеству ошибок. Например в php5 (а другой мы и не используем), передавая переменную с собакой по ссылке - на самом деле по ссылке она не передается, а просто копируется.

*   Нельзя допускать появление любых ошибок, выдаваемых php-интерпретатором - warning, notices и т.п. Несуществующие переменные, неправильные типы переменных и т.п. должны обрабатываться в коде 

*   Не использовать функцию ``current()`` для получения значения массива во всех случаях (например, есть у вас массив, вы знаете что в нем одно значение и хотите это значение получить - в этом случае надо использовать ``reset()``), кроме того когда вам **именн** нужно получить текущее значение (хотя в принципе данный прием использовать у нас негде, т.е. все массивы перебираются foreach'ами).

    Причина, по которой не надо использовать эту функцию в том, что разные версии php по-разному выставляют внутренний указатель почему-то.
    
*   Добавлять функцию в ядро без хуков и описания.

*   Использовать ``HTTP_REFERER``, если вам нужно отредиректиться туда, откуда пришли - передавайте ``redirect_url``





