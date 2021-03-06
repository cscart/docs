***
PHP
***

.. contents::
   :backlinks: none
   :local:

`PHP The Right Way <http://www.phptherightway.com/>`_ — обязательно к прочтению перед работой.

**Правило бойскаута:** *оставлять место после себя чище чем, оно было до твоего визита*. 

.. note::

    Переписывайте код, который не соответствует стандартам и правилам хорошего тона.

=========
Стандарты
=========

-----------
Общий стиль
-----------

1. Полное соблюдение стандартов `PSR-1 <http://www.php-fig.org/psr/psr-1/>`_ и `PSR-2 <http://www.php-fig.org/psr/psr-2/>`_.

2. Для автоматического приведения кода к требуемым стандартам существует инструмент `PHP Coding Standards Fixer <http://cs.sensiolabs.org/>`_.

----------------------------------------------------------
Именование переменных, ключей в массивах и свойств классов
----------------------------------------------------------

1. Имена переменных **обязательно** должны быть в нижнем регистре, в формате `snake_case <https://ru.wikipedia.org/wiki/Snake_case>`_ (например, ``$cart_content``).

2. **Обязательно** осмысленное и информативное именование. 

   * **Правильно:**

     ::

       $counter, $user_id, $product, $is_valid

   * **Неправильно:**

     ::

       $с, $uid, $obj, $flag 

3. Переменные, хранящие список однотипных объектов, **желательно** именовать с суффиксом ``_list``, например: ``$products_list``, ``$cart_applied_promotions_list``. Этот подход позволяет визуально быстрее отделять название переменной, хранящей список, от названия переменной, хранящей один из элементов списка. Например, при итерации массива в цикле ``foreach``:

   * **Правильно:**

     ::

       foreach ($applied_promotion_list as $applied_promotion) {
           // чёткое визуально разделение
       }

   * **Неправильно:**

     ::

       foreach ($applied_promotions as $applied_promotion) {
               // $applied_promotions и $applied_promotion легко перепутать при беглом взгляде
       }

4. Переменные, хранящие булевы значения, **желательно** именовать с префиксом ``is_``, ``has_`` или любым другим подходящим глаголом.

   * **Правильно:**

     ::

       $is_valid, $has_rendered, $has_children, $use_cache

   * **Неправильно:**

     ::

       $valid, $render_flag, $parentness_status, $cache


5. Имена переменных **нежелательно** начинать со знака нижнего подчёркивания. Бывали случаи, когда в теле одной функции были переменные с именами ``$cache``, ``$_cache`` и ``$__cache``.

--------------------------------
Именование и объявление констант
--------------------------------

1. **Обязательно** полностью в верхнем регистре, разделитель — нижнее подчёркивание (``_``): ``SORT_ORDER_ASC``, ``COLOR_GREEN``.
    
2. **Желательный** порядок слов в названиях однотипных констант — сначала повторяющаяся часть, потом различающаяся:

   * **Правильно:**

     ::

      COLOR_GREEN, COLOR_RED, SORTING_ASC, SORTING_DESC

   * **Неправильно:**

     ::

       GREEN_COLOR, RED_COLOR, ASC_SORTING, DESC_SORTING

3. Семантика именования — такая же, как и у переменных.

------------------
Строковые литералы
------------------

1. При обращении к элементу массива по ключу заключать имя ключа в одинарные кавычки: ``$product['price'];``.

2. Все строковые переменные, не содержащие в себе других переменных, заключать в одинарные кавычки: ``$foo = 'bar';``.
    
3. Если в строку необходимо включить значение переменной, то строка берётся в двойные кавычки, а название переменной обрамляется в фигурные скобки: ``$greeting_text = "Hello, {$username}!";``.

--------------------------------------
Магические значения прямо посреди кода
--------------------------------------

1. В коде не должно быть числовых значений и строковых литералов, значение которых неочевидно::

     $product->tracking = 'O'; // Что значит 'O'?
     ...
     $order_status = 'Y'; // "Y" == "Yes"? "Yellow"?

2. Такие вещи следует переносить в константы с осмысленными именами, и обращаться в коде к константам.

3. Если имеем дело с группой значений (например, возможные варианты значения поля в таблице БД), то константы этих значений нужно выделить в отдельный класс в пространстве имён ``Tygh\Enum``. Пример такого класса - ``Tygh\Enum\ProductTracking``. Выглядит это так::

     $product->tracking = Tygh\Enum\ProductTracking::TRACK_WITH_OPTIONS;

-----------
Комментарии
-----------

1. Комментарии пишутся только на английском языке. Для комментирования кода внутри функции/в контроллере использовать двойной слеш ``//``.
    
2. Использование perl style(#) не допускается.

3. Не пишите комментарий, который дублирует то, что и так выражено кодом. Лучше код без комментариев, чем код с ложными и неактуальными комментариями.

4. Будьте точны и кратки.

------
PHPDoc
------

1. **Желательно** соблюдение черновика стандарта `PSR-5 <https://github.com/phpDocumentor/fig-standards/blob/master/proposed/phpdoc.md>`_. Как только стандарт будет принят, он станет **обязательным**.

2. **Обязательно** используйте блок с комментарием и описанием аргументов при объявлении всех функций, методов, свойств классов и самих классов.

3. Если функция не возвращает значение:

   * **запрещено** писать ``@return``;

   * **можно** оформлять как ``@return void;``

4. **Обязательно** выравнивайте на один уровень комментарии к тегам, названия параметров и свойств.
 
5. **Обязательно** оставляйте одну пустую строку перед первым тегом.

6. **Обязательно** оставляйте пустую строку перед и после группы последовательно идущих тегов ``@param``.

7. **Запрещено** оставлять более одной пустой строки подряд.

8. **Обязательно** разбивайте длинный комментарий на несколько строк, а строки выравнивайте на один уровень.

9. **Запрещено** использовать теги ``@throws`` и ``@author``.

10. Для того, чтобы отметить функцию или метод как устаревшие, **обязательно** используйте тег ``@deprecated`` и указывайте версию с которой функция или метод считаются устаревшими.

11. Тип агрументов, содержащих массив экземпляров одного класса, **обязательно** должен быть описан как коллекция объектов: ``Class[]``.

12. Пример правильного форматирования::

      /**
       * Generates date-time intervals of a given period for sales reports
       *
       * @param Timezone[] $timezone_list  List of timezones to be used
       * @param int        $interval_id    Sales reports interval ID
       * @param int        $timestamp_from Timestamp of report period beginning date
       * @param int        $timestamp_to   Timestamp of report period end date
       * @param int        $limit          Maximal number of the generated intervals. Also, this string
       *                                   is used to illustrate the wrapped and aligned long comment.
       *
       * @deprecated 4.4.1
       * @return array
       */

--------------
Быстродействие
--------------

**Желательно не использовать** внутри тела циклов вызов ``Registry::get()``. Эта операция очень ресурсоёмкая, и обращение к хранилищу значительно снижает производительность. Чтобы избежать циклических вызовов, необходимо перед циклом присвоить переменной значение из ``Registry``, а уже внутри цикла использовать переменную.

----------------------
Неприятные запахи кода
----------------------

Code smells — внешние признаки, указывающие на непродуманость архитектуры кода, и зачастую являющиеся причиной многих проблем с поддержкой, расширяемостью и тестируемостью кода.

^^^^^^^^^^^^^^^^^^^^^
Отступы и вложенность
^^^^^^^^^^^^^^^^^^^^^

Один из самых неприятных "запахов кода" — многоуровневая вложенность конструкций, создающая огромное количество отступов слева. Это ухудшает читаемость кода и является симптомом непродуманной архитектуры. К этой проблеме так же относятся случаи, когда весь код функции находится в теле какого-то условия.

Таких ситуаций следует избегать, меняя структуру кода: делать все нужные проверки в самом начале тела функции, иметь несколько точек выхода, либо декомпозировать функцию на более мелкие.

.. important::

    Запомните простое правило: если в рамках одной функции вам приходится делать больше трёх табуляций слева, значит, скорее всего, что-то идёт не так. Реструктурируйте или декомпозируйте ваш код.

Пример::

  <?php

  function foobar($foo, $bar, $baz = null)
  {
      if (!empty($foo['foo_bar'])) {
          $foo_bar = $foo['foo_bar'];

          if (!empty($bar) && $foo_bar > 10) {
              if (!empty($baz)) {
                 // И только здесь начинается какая-то логика
              }
          }
      }

      return false;
  }

Или::

  <php

  public static function filterPickupPoints($data, $service_params)
  {
      $pickup_points = array();
      if (!empty($service_params['deliveries'])) {
          foreach ($data as $key => $delivery) {
              if (!empty($delivery['is_pickup_point']) && in_array($key, $service_params['deliveries'])) {
                  foreach ($delivery['pickupPoints'] as $pickup) {
                      $pickup_points[$pickup['id']] = $pickup;
                  }
              }
          }
      }

      return $pickup_points;
  }


^^^^^^^^^^^^^^^^^^^^^^
Работа с типами данных
^^^^^^^^^^^^^^^^^^^^^^

PHP — язык со слабой динамической системой типов данных. Это означает, что любая объявленная переменная может содержать любой тип данных. Предоставляя много степеней свободы, такая система прощает много потенциальных ошибок на этапе выполнения кода, которые могут проявиться в самый неожиданный момент.

Работая с переменными и типами данных, полезно выстроить строгую систему контроля типов у себя в голове. Учитывайте, какой тип данных может храниться в той или иной переменной, и выстраивайте структуру кода исходя из явного приведения типов — не сравнивайте строки с числами, а массивы с нулём, и т.д.

Разрабатывая функцию или метод, описание получаемых и возвращаемых типов в ``PHPDoc``  помогает осуществлять контроль типов.
Внутри тела функции вы можете явно привести значение переменной-аргумента к ожидаемому типу и работать с ним, будучи уверенным наверняка в том, с каким типом данных вы столкнулись.

В таком случае вы сможете использовать оператор строгого сравнения ``===``, и это сбережёт вам и вашим коллегам кучу времени в дальнейшем.

.. important::

    Код, ориентированный на платформу PHP7, **обязательно** должен использовать строгое указание типов возвращаемых значений и агрументов функций.

^^^^^^^^^^^^^^^^^^^^^
Значение по умолчанию
^^^^^^^^^^^^^^^^^^^^^

Зачастую в коде можно встретить указание пустого значения по умолчанию. В PHP для этой цели существует отдельных тип данных - ``null``.

Если вы используете ноль или пустую строку в качестве пустого значения по-умолчанию, то ваш код подвержен множеству ошибок бизнес-логики, когда реальные данные будут принимать значение нуля или пустой строки, но будут интерпретироваться кодом как пустое значение по умолчанию. Часто этому способствует использование функции `empty` в условиях и проверках.

.. important::

    Старайтесь по максимуму использовать ``null`` и оператор строгого сравнения ``===`` для подобных целей.

^^^^^^^^^^^^^^^^^^^^^^^
Инверсированные условия
^^^^^^^^^^^^^^^^^^^^^^^

Условия вида ``!empty($_REQUEST)`` ухудшают читаемость кода, особенно в составе более комплексных условий и выражений.
Старайтесь избегать использования инверсированных условий там, где без них можно обойтись без ухудшения читаемости кода.

^^^^^^^^^^^^^^^^^^^^^^^
Пример исправления кода
^^^^^^^^^^^^^^^^^^^^^^^

Возьмем код сразу с несколькими неприятными запахами::

  if ($mode == 'assign_manager') {
        if (!empty($_REQUEST['order_id'])) {
            $order_id = $_REQUEST['order_id'];
            $issuer_id = (!empty($_REQUEST['issuer_id'])) ? $_REQUEST['issuer_id'] : '';
            $user_id = $auth['user_id'];

            if (empty($issuer_id) || ($issuer_id != $user_id)) {
                db_query('UPDATE ?:orders SET issuer_id = ?i WHERE order_id = ?i', $user_id, $order_id);
            }
            $order_info = fn_get_order_info($order_id, false, true, true, false);
            Tygh::$app['view']->assign('order_info', $order_info);
            $suffix = ".details?order_id=$order_id";
      }

      return array(CONTROLLER_STATUS_REDIRECT, 'orders' . $suffix);
  }

Этот код можно переписать так::

  if ($mode == 'assign_manager') {
      // Теперь значение либо integer, либо null - не задано
      $order_id = isset($_REQUEST['order_id']) ? (int) $_REQUEST['order_id'] : null;
      $issuer_id = isset($_REQUEST['issuer_id']) ? (int) $_REQUEST['issuer_id'] : null;
      $user_id = (int) $auth['user_id'];

      // Все необходимые валидации в одном месте
      if ($order_id === null || $issuer_id === $user_id) {
          return array(CONTROLLER_STATUS_REDIRECT, 'orders');
      }

      // Бизнес-логика
      db_query('UPDATE ?:orders SET issuer_id = ?i WHERE order_id = ?i', $user_id, $order_id);

      Tygh::$app['view']->assign(
          'order_info',
          fn_get_order_info($order_id, false, true, true, false)
      );

      return array(CONTROLLER_STATUS_REDIRECT, "orders.details?order_id={$order_id}");
  }

=======
Функции
=======

----------
Именование
----------

**Обязательно** называйте функции полностью в нижнем регистре и начинайте имена либо с префикса ``fn_``, либо с ``db_``::

  fn_get_addon_option_variants

---------
Аргументы
---------

Если у нескольких аргументов есть стандартные значения, либо аргументы по смыслу не являются основными, то объединяйте их в один аргумент ``$params``. Таким образом, в функцию будут передаваться только основные аргументы и массив ``$params``.

Пример такой трансформации::

  // до
  function fn_get_product_data($product_id, &$auth, $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false)


  // после
  function fn_get_product_data($product_id, &$auth, $params)
  {
      $default_params = array(
          'lang_code' => CART_LANGUAGE,
          'field_list' => '',
          'get_add_pairs' => true,
          'get_main_pair' => true
          'get_taxes' => true,
          'get_qty_discounts' = false,
          'preview' = false,
          'get_features' = true
      )
      $params = fn_array_merge($default_params, $params);

---------------------------
DRY - Don't repeat yourself
---------------------------

Если какой-либо кусок кода встречается в двух и более местах в контроллере/функции, **обязательно** выносите код в отдельную функцию.

--------------------------------
Возвращать значение - это хорошо
--------------------------------

Кроме функций-обработчиков хуков, **желательно избегать** передачи переменных в функцию по ссылке, не возвращая функцией ничего, и модифицируя значение исходной переменной. Это может приводить к необъяснимым и неочевидным модификациям значений переменных — сэкономьте своим коллегам и самому себе время, которое вы будете проводить за отладкой кода. Если передача по ссылке делается с целью уменьшить потребление памяти, то спешу вас расстроить: PHP сам делает нужные оптимизации даже при передаче переменной по значению.

------------
Точка выхода
------------

**Желательно**, чтобы функция имела только одну точку выхода. Использование двух и более точек выхода допускается лишь в случаях, если этим достигается: 

* низкое ветвление кода (лучше множественный ``return``, чем 5 вложенных ``if``);

* значительная экономия ресурсов (например, функция ``fn_apply_exceptions_rules`` в **fn.catalog.php**).

---------------------------------
Комментарии для удаленных функций
---------------------------------

Этот комментарий добавляется к устаревшим функциям, содержимое которых заменено на вывод нотиса::

  <?php


  /**
   * This function is deprecated and no longer used.
   * Its reference is kept to avoid fatal error occurances.
   * 
   * @deprecated deprecated since version 3.0
   */
  ?>

Пример::

  <?php

  /**
   * This function is deprecated and no longer used.
   * Its reference is kept to avoid fatal error occurances.
   * 
   * @deprecated deprecated since version 3.0
   */
  function fn_get_setting_description($object_id, $object_type = 'S', $lang_code = CART_LANGUAGE)
  {
          fn_generate_deprecated_function_notice('fn_get_setting_description()', 'Settings::get_description($name, $lang_code)');
          return false;
  }
  ?>

----------------------------------------------
Комментарии для часто встречающихся параметров
----------------------------------------------

Это утвержденные комментарии для описания переменных в коде. Если они вам встречаются при определении хука, используйте их, пока смысл соответствует::

  $auth - Array of user authentication data (e.g. uid, usergroup_ids, etc.)
  $cart - Array of the cart contents and user information necessary for purchase
  $lang_code - 2-letter language code (e.g. 'en', 'ru', etc.)
  $product_id - Product identifier
  $category_id - Category identifier
  $params - Array of various parameters used for element selection
  $field_list - String of comma-separated SQL fields to be selected in an SQL-query
  $join - String with the complete JOIN information (JOIN type, tables and fields) for an SQL-query
  $condition - String containing SQL-query condition possibly prepended with a logical operator (AND or OR)
  $group_by - String containing the SQL-query GROUP BY field

=========================================
Объектно-ориентированное программирование
=========================================

--------------------
Именование сущностей
--------------------

1. **Обязательно** называйте классы, интерфейсы и трейты с заглавной буквы в формате `UpperCamelCase <https://ru.wikipedia.org/wiki/CamelCase>`_.

2. Названия абстрактных классов **обязательно** должны иметь префикс ``A``, например: ``ABackend``, ``ADatabaseConnection``.

3. Имена интерфейсов **обязательно** должны иметь префикс ``I``, например: ``ICountable``, ``IFilesystemDriver``.

4. Если имя класса, интерфейса, трейта или метода должно содержать аббревиатуру наподобие *URL*, *API*, *REST* и т.п., то аббревиатура **обязательно** должна подчиняться правилам CamelCase. 

   * **Правильно:**

     ::

       $a->getApiUrl(), $a = new Rest();, class ApiTest

   * **Неправильно:**

     ::

       $a->getAPIURL(), $a = new REST();, class APITest

---------
Константы
---------

Правила именования такие же, как и для констант вне классов. Пример::

  class Api
  {
      /**
       * Default HTTP request format mime type
       *
       * @const DEFAULT_REQUEST_FORMAT
       */
      const DEFAULT_REQUEST_FORMAT = 'text/plain';

--------
Свойства
--------

1. Правила именования такие же, как и для обычных переменных.

2. Названия private- и protected- свойств **запрещено** начинать со знака нижнего подчёркивания (``_``).

Пример::

  class Api
  {
      /**
       * Current request data
       *
       * @var Request $request
       */
      private $request = null;

      /**
       * Sample var
       *
       * @var array $sample_var
       */
      private $sample_var = array();

------
Методы
------

1. В отличие от функций, названия методов **обязательно** должны начинаться со строчной буквы, формат именования — `lowerСamelCase <https://ru.wikipedia.org/wiki/CamelCase>`_.

2. Названия private- и protected- методов **запрещено** начинать со знака нижнего подчёркивания (``_``).
    
3. В общем случае, методы в классе **желательно** группировать по типу области видимости: ``public -> protected -> private``.

   Пример::

     class ClassLoader
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

-----------------
Пространства имён
-----------------

``Tygh`` — название пространства имён, в котором находятся все пространства имён и классы ядра CS-Cart.

1. Все классы, интерфейсы и трейты ядра и аддонов **обязательно** должны принадлежать этому пространству имён.

2. Если несколько классов, интерфейсов или трейтов относятся по смыслу к одному функционалу, то **обязательно** выделяйте их в общее подпространство, например, как классы менеджера блоков (``Tyqh\BlockManager``) и REST API (``Tyqh\Api``).

3. В каждом файле, в котором используются классы, интерфейсы либо трейты, **обязательно** используйте в начале файла директиву ``use``, которая определяет, какие пространства имён используются в файле. В случае совпадения названий двух и более классов из разных пространств имён, **обязательно** описывайте алиасы для имён конфликтующих классов (``use \Tygh\BlockManager\RenderManager as BlockRenderer``).

4. Любая сущность (класс, интерфейс или трейт) **обязательно** должна находиться в своем отдельном файле. Наиболее часто это правило нарушается, когда разработчик в одном файл объявляет и класс, и исключение.

5. **Желательно**, чтобы аддоны добавлял свои классы, интерфейсы и трейты только в свое пространство имен ``\Tygh\Addons\AddonName``. Например, для аддона **form_builder** разрешённое пространство имен — ``\Tygh\Addons\FormBuilder``.

   Исключением этому правилу служит:

   * добавление новых сущностей API (следует добавлять класс в пространство имен ``\Tygh\Api\Entities``),
   
   * добавление новых коннекторов для центра обновлений (следует добавлять класс в неймспейс \Tygh\UpgradeCenter\Connectors).

6. Следует помнить, что корневая директория каждого установленного и включённого аддона является директорией-источником автозагрузки классов. Это означает, что класс ``\Foo\Bar\MyClass``, находящийся в папке *app/addons/my_changes/Foo/Bar/MyClass.php*, будет автоматически загружен в память при вызове в коде конструкции вроде ``$my_class_instance = new \Foo\Bar\MyClass();``.

7. **Обязательно** требуется группировать директивы ``use`` друг с другом. Пример::

     use Tygh\Registry;
     use Tygh\Settings;
     use Tygh\Addons\SchemesManager as AddonSchemesManager;
     use Tygh\BlockManager\SchemesManager as BlockSchemesManager;
     use Tygh\BlockManager\ProductTabs;
     use Tygh\BlockManager\Location;
     use Tygh\BlockManager\Exim;

----------------------
Шаблоны проектирования
----------------------

Не рекомендуется создавать ``Singleton``-классы, и классы, состоящие из статических методов. Код, их использующий, практически невозможно покрыть юнит-тестами.

=======================
Оформление SQL-запросов
=======================

1. Запрос необходимо разделять следующим образом (кавычки и точки должны жестко соблюдаться)::

     $partner_balances = db_get_hash_array(
         "SELECT pa.partner_id, u.user_login, u.firstname, u.lastname, u.email, SUM(amount) as amount"
         . ' FROM ?:aff_partner_actions as pa'
         . ' LEFT JOIN ?:users as u ON pa.partner_id = u.user_id'
         . ' LEFT JOIN ?:aff_partner_profiles as pp ON pa.partner_id = pp.user_id'
         . ' LEFT JOIN ?:affiliate_plans as ap ON ap.plan_id = pp.plan_id AND ap.plan_id2 = pp.plan_id2'
             . ' AND ap.plan_id3 = pp.plan_id3'
         . ' WHERE pa.approved = ?s AND payout_id = 0 ?p ?p'
         . '  ORDER BY ?p ?p',
         'partner_id', 'Y', $condition, $group, $sorting, $limit
     );

2. Закрывающая скобка **обязательно** переносится на новую строку. Таким образом, мы выделяем нашу многострочную структуру в единый блок, что облегчает чтение кода.

3. Данные, используемые в запросах, **обязательно** нужно внедрять в них с помощью плейсхолдеров. **Запрещено** вставлять значения переменных в текст запроса напрямую.

4. Если текст SQL-запроса формируется из нескольких частей, находящихся в отдельных переменных, каждая составная часть **обязательно** должна быть обёрнута в вызов функции ``db_quote``. Это позволяет избежать путаницы с плейсхолдерами.

5. **Желательно** составные части текста SQL-запроса внедрять в него с помощью плейсхолдера **?p**.

   Пример для предыдущих двух пунктов::

     $joins = array();

     // Каждая составная часть запроса обёрнута в вызов db_quote(), вне зависимости от наличия необходимости в плейсхолдерах
     $joins[] = db_quote(' LEFT JOIN foo AS f ON f.product_id = products.product_id');
     $joins[] = db_quote(' LEFT JOIN bar AS b ON b.product_id = products.product_id AND b.order_id = ?n', $order_id);

     $query = db_quote(
         'SELECT * FROM products'
         . ' WHERE products.status = ?s'
         . ' ?p', // Список joins внедрён в запрос с помощью плейсхолдера "?p" 
         'A', implode(' ', $joins)
     );

6. Подробную информацию о плейсхолдерах и работе с ними вы можете найти :doc:`в соответствующем разделе документации </developer_guide/core/db/placeholders>`.

--------------------------
Совместимость с PostgreSQL
--------------------------

В CS-Cart 5 добавится поддержка PostgreSQL в дополнение к MySQL. В связи с этим, структура запросов должна соответствовать общему стандарту SQL.

.. important::

    Нельзя использовать проприетарную функциональность PostgreSQL или MySQL.

1. Не используйте бэктики (`````). Названия полей обрамляются двойными кавычками. Кавычки можно опускать; они нужны для названий, содержащих ключевые слова SQL языка.

   ::

     SELECT "from" FROM table WHERE field = 'test';

2. Не используйте в условии ``1``. Если нужно ``true``, используйте ``1=1``.

   ::

     SELECT field FROM table WHERE 1=1 AND field2 = 3;

3. Вместо ``IF`` используйте ``CASE WHEN``.

   ::

     SELECT CASE WHEN(a=b) THEN 'true' ELSE 'false' END FROM table;

4. Не используйте в запросе ``REPLACE INTO``. Вместо этого используйте функции ``db_replace_into`` или ``Tygh::$app['db']->replaceInto``, в зависимости от контекста.

5. Вместо ``IFNULL`` используйте ``COALESCE``.

6. Вместо ``LIMIT n,m`` используйте ``LIMIT m OFFSET n``. Вместо ``LIMIT 0, n`` используйте просто ``LIMIT n``.

7. Алиасы в запросах всегда объявляйте через ключевое слово ``AS``

   ::

     SELECT col AS col_alias FROM table AS t_alias

8. Вместо ``ISNULL(col)`` используйте ``col IS NULL``.

9. Избегайте ``SQL_CALC_FOUND_ROWS``. Запросы с таким словом парсятся адаптером для PostgreSQL и выполняются без ошибок, но всё же лучше вообще его не использовать.

10. Не используйте запросы вида ``INSERT INTO ... ON DUPLICATE KEY UPDATE``. Вместо такого запроса используйте функцию  ``db_replace_into`` или ``Tygh::$app['db']->replaceInto``.

11. Не используйте запросы вида ``INSERT INTO ... ON DUPLICATE KEY UPDATE viewed = viewed + 1``. Вместо такого запроса используйте функцию ``db_insert_incdec`` или ``Tygh::$app['db']->insertIncDec``

12. Для обрамления значений используйте одиночные кавычки (``'``). Двойные кавычки использовать нельзя.

13. Не используйте запрос ``SELECT LAST_INSERT_ID()``. Автоинкрементное значение возвращается функцией ``db_query`` или ``Tygh::$app['db']->query``.

14. В SQL-файлах не экранируйте двойные кавычки; для комментариев используйте только ``/**/``.

15. Вместо ``UNIX_TIMESTAMP()`` пишите ``UNIX_TIMESTAMP(NOW())``.

16. ``INNER JOIN`` всегда используется с ``ON``.

17. Конструкция ``ORDER BY FIELD()`` заменяется функцией ``Tygh::$app['db']->orderByField``.

18. Не используйте алиасы в ``HAVING``; используйте название поля напрямую.

    ::

      SELECT a as b FROM table HAVING a > 10

19. В миграциях не используйте "сырой" SQL для изменения структуры таблицы; используйте только команды из ``phinx``.

20. Не используйте ``JOIN`` в ``DELETE``-запросах.

=============
Общие правила
=============

1. Настоятельно не рекомендуем использовать "приглушение" PHP-ошибок с помощью оператора ``@``.

2. **Нельзя** допускать появления любых ошибок, выдаваемых PHP-интерпретатором — Warnings, Notices и т. п. Случаи с несуществующими переменными, неправильными типами данных и т.п. должны обрабатываться в коде.

3. **Запрещено** использовать функции ``current()`` и ``each()``, если вы достоверно не знаете, где именно находится внутренний указатель в массиве. Если вам нужно получить первый элемент в массиве — используйте функцию ``reset()``.

4. **Запрещено** использовать ``HTTP_REFERER``. Если вам нужно сделать редирект туда, откуда пришли — передавайте ``redirect_url``.

========================
Использование исключений
========================

Чтобы систематизировать отлавливание фатальных ошибок программы (когда дальнейшее выполнение невозможно), в CS-Cart введены исключения (exceptions).

-------------------------------
Когда нужно вызывать исключение
-------------------------------

Когда что-то пошло не так, например: не найден нужный класс; вызван хук, который не объявлен и т.п. — всё, что не дает программе выполняться дальше.

-----------------------
Как вызывать исключение
-----------------------

Пишем::

  use Tygh\Exceptions\DeveloperException;

  ...
  throw new DeveloperException('Registry: object not found')

Название класса — это тип ошибки. Первый параметр — это сообщение, которое мы хотим отобразить::

  new ClassNotFoundException() // попытка вызвать неизвестный класс
  new ExternalException() // ошибка, возвращаемая внешним сервисом
  new DatabaseException() // ошибка при работе с базой данных
  new DeveloperException() // ошибка разработчика - вызывается то, что не должно вызываться
  new InputException() // неправильные входные данные
  new InitException() // ошибка инициализации магазина
  new PermissionsException() // недостаточно прав для операции

---------------------
Отладочная информация
---------------------

Если у нас включен :doc:`дебагер <../../tools/debugger>`, выставлена константа ``DEVELOPMENT`` или мы в консольном режиме — на экран выведется отладочная информация. 

В остальных случаях отобразится страница **store_closed.html** и будет выдана ошибка 503 (если возможно). Отладочная информация появится в коде этой страницы, в самом низу внутри HTML-комментария. Это сделано, чтобы не показывать посетителям магазина техническую информацию прямо на странице.

=======
PHPUnit
=======

.. important::
    Данная инструкция актуальна только при наличии доступа к репозиторию CS-Cart.

---------
Установка 
---------

Устанавливаем PHPUnit c зависимостями::

  cd /path/to/cart/app/lib
  composer install --dev

------
Запуск
------

Запускаем новые тесты::

  /path/to/cart/app/lib/vendor/bin/phpunit -c /path/to/cart/_tools/unit_tests/phpunit.xml

Запускаем legacy-тесты::

  /path/to/cart/_tools/restore.php u
  /path/to/cart/app/lib/vendor/bin/phpunit -c /path/to/cart/_tools/build/phpunit.xml

.. warning::
    Не запускайте legacy-тесты в живом магазине! Они меняют базу данных.