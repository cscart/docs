****
Хуки
****

У каждого :doc:`хука <../../addons/hooking/index>` должен быть комментарий с описанием (например точка входа, или что делает хук), а так же с описанием параметров (только для :doc:`PHP-хуков <../../addons/hooking/index>`). 

База хуков доступна по адресу http://www.cs-cart.com/api

========================
Основные тезисы по хукам
========================

1. Хуки нужны для расширения функций разработчиками. Поэтому передавайте в хук максимум параметров — лучше перестараться, чем недостараться.

2. В названии хука обязательно должно содержаться название функции.

3. Префиксы использовать нельзя. Можно использовать только суффиксы.

4. Если у вас сложная функция, и в ней много хуков, то именовать хуки можно примерно так: 

   Функция::
 
     get_cart_product_data

   Хук::

     fn_set_hook('get_cart_product_data_post_options', $product['product_id'], $_pdata, $product);

5. Параметры в хуке всегда должны начинаться с тех, что пришли в функцию. Исключение: SQL-хуки, где все  необходимое есть в переменной ``params``.

=========================
Как и куда добавлять хуки
=========================

Исходим из того, что в каждой функции должно быть минимум два хука:

1. **pre hook** вида ``get_products_pre`` в самом начале функции. В него должны передаваться все параметры, которые прходят в функцию.

2. **post hook** вида ``get_products_post`` в конце функции. В него должны передаваться все параметры пришедшие в функцию, затем параметр который функция возвращает, затем остальные вспомогательные параметры. 

Также могут быть дополнительные хуки:

3. **sql hook** вида ``get_product_name``, в который мы передаем все SQL-переменные. Создавайте по максимуму все значения ``$fields``, ``$condition``, ``$sorting``, ``$limit``, и т.д., даже если вам кажется, что это совсем не нужно. Пусть они будут пустыми. Пример::

     fn_set_hook('get_product_name', $product_id, $lang_code, $as_array, $field_list, $join, $condition);
    
4. **extra hooks**, как пример, можно посмотреть на функцию выбора товаров или рассчета корзины::

     fn_set_hook('get_products_before_select', $params, $join, $condition, $u_condition, $inventory_condition, $sortings, $total, $items_per_page, $lang_code, $having);

Для хуков в классах: каждый хук должен первым параметром передавать инстанс класса.

Некоторые хуки не соответствуют вышеозначенным стандартам, тогда ставим им комментарий такого вида::

  /**
   * Deprecated: This hook will be removed in version 4.x or 3.3.x. Use get_product_price_pre instead.
   */

Помимо этого добавляем хук в новом формате, в нашем случае это будет ``get_product_price_pre``.

.. note: 

    Если в функцию был добавлен новый аргумент, то создавать новые и депрекейтить старые хуки в этой функции не нужно! В этом случае просто добавляем аргумент в конец существующих хуков. Если при этом нарушается правильный порядок аргументов в функции — ничего страшного.

=======================
Формат оформления хуков
=======================

Ниже приведены форматы для комментариев для `базы хуков <http://www.cs-cart.com/api>`_.

------------------
PHP-хуки и функции
------------------

Формат комментариев заимствован у PHPDocumentor. Такой формат комментариев должен применяться повсеместно ко всем функциям.

Для генерации документации используется программа Doxygen (вот `руководство <http://cs.swan.ac.uk/%7Ecsoliver/ok-sat-library/internet_html/doc/doc/Doxygen/1.7.1/html/index.html>`_).

Основные правила и рекомендации по написанию комментариев:

1. Комментарий начинается с большой буквы, точка в конце не ставится.

2. Глагол для описания того, что делает функция, употребляется в 3 лице и единственном числе, т.е. *"Получает данные пользователя" — "Gets user data"*.

3. Названия и значения переменных, пути к файлам, названия файлов и прочие имена собственные следует выделять курсивным написанием (при помощи HTML-тега ). 

   Например: Function *foo* (in *foo/bar/functions*) accepts parameter *$bar*

4. Если в описании встречается упоминание функции, то последняя должна быть задана как ``class::function``; в случае функции без класса — ``::function``. Например::

     <?php

     /** ...
     *      - period - If defined, get pages by time period. ::fn_create_periods</li>
     * ...
     */
     ?>

5. По возможности старайтесь описать переменную так, чтобы было ясно, зачем она нужна именно этой функции.

Примеры::

  <?php

  /**
   * Calculates cart content (running after ::fn_calculate_cart_content)
   * Used on the checkout page
   *
   * @param array $cart User cart
   * @param array $cart_products Cart products data
   * @param array $auth User auth data
   * @param string $calculate_shipping Calculate shipping flag
   * @param string $calculate_taxes Calculate taxes flag
   * @param string $apply_cart_promotions Apply cart promotions flag
   */
  fn_set_hook('calculate_cart', $cart, $cart_products, $auth, $calculate_shipping, $calculate_taxes, $apply_cart_promotions);
  ?>

  <?php

  /**
   * Gets product data
   *
   * @param int $product_id
   * @param array $field_list List of SQL fields
   * @param string $join Join sql data
   * @param array $auth
   * @param string $lang_code
   */
  fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code);
  ?>


.. important::

    Комментарий должен находится непосредственно перед хуком.

--------
TPL-хуки
--------

Smarty-шаблоны:

.. code-block:: smarty

    {** Dynamic menu item (on the navigation) *}
    {hook name="index:dynamic_menu_item"}
    ...
    {/hook}

    {** Hooks for CSS styles *}
    {hook name="index:styles"}{/hook}

.. important::

    Открывающий тэг комментария **обязательно** должен быть именно с двумя звездочками, закрывающий — с одной. Так мы отделяем обычные комментарии от комментариев для хуков.

-------
JS-хуки
-------

Пример:

.. code-block:: javascript


    /**
     * Hook description
     */
    var hook_data = {
        'append_obj_content': append_obj_content, // int Id of bla bla
        'var_prefix': prefix, // string Prefix of var
        'object_html': unescape(append_obj.html()), // string Object
        'var_id': id, // int ID of var
        'item_id': js_items[id] // int Item ID
    };

    $.ceEvent('trigger', 'ce.picker_add_js_item', [hook_data]);

Сначала комментарий с описанием события, потом объявление переменной-объекта с параметрами, и на третьем месте сам вызов события.

В комментарии к передаваемым параметрам первое слово — тип переменной, а все остальное — описание.

=================================
Комментарии для удаленных функций
=================================

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

==============================================
Комментарии для часто встречающихся параметров
==============================================

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
