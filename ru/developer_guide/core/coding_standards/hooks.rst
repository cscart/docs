****
Хуки
****

У каждого :doc:`хука <../../addons/hooking/index>` должен быть комментарий с описанием (например, точка входа, или что делает хук), а также с описанием параметров (только для :doc:`PHP-хуков <../../addons/hooking/index>`). 

База хуков доступна по адресу https://www.cs-cart.com/api

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

6. Для хуков в классах: каждый хук должен содержать название класса, в котором он вызывается.

7. Для хуков в классах: каждый хук должен первым параметром передавать инстанс класса::

    <?php
    
    class Patterns
    {
        public function save($style_id, $style, $uploaded_data)
        {
            ...
            
            /**
             * Executes before saving the uploaded pattern files, allows you to modify the uploaded files and their location.
             *
             * @param \Tygh\Themes\Patterns $this          Patterns instance
             * @param string                $style_id      Style name
             * @param array                 $style         Style data
             * @param array                 $uploaded_data Uploaded files
             * @param string                $path          Path where patterns will be saved
             * @param string                $rel_path      Relative patterns path
             */
            fn_set_hook('patterns_save', $this, $style_id, $style, $uploaded_data, $path, $rel_path);
            
            ...

=========================
Как и куда добавлять хуки
=========================

Исходим из того, что в каждой функции должно быть минимум два хука:

1. **pre hook** вида ``get_product_name_pre`` в самом начале функции. В него должны передаваться все параметры, которые прходят в функцию.

2. **post hook** вида ``get_product_name_post`` в конце функции. Параметры в него должны передаваться в такой последовательности:

   * все параметры, пришедшие в функцию;

   * параметр, который функция возвращает;

   * остальные вспомогательные параметры. 

Также могут быть дополнительные хуки:

3. **SQL hook** вида ``get_product_name``, в который мы передаем все SQL-переменные. Создавайте по максимуму все значения ``$fields``, ``$condition``, ``$sorting``, ``$limit``, и т.д., даже если вам кажется, что это совсем не нужно. Пусть они будут пустыми. Пример::

     fn_set_hook('get_product_name', $product_id, $lang_code, $as_array, $field_list, $join, $condition);
    
4. **extra hooks**, как пример, можно посмотреть на функцию выбора товаров::

     fn_set_hook('get_products_before_select', $params, $join, $condition, $u_condition, $inventory_join_cond, $sortings, $total, $items_per_page, $lang_code, $having);

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

Ниже приведены форматы для комментариев для `базы хуков <https://www.cs-cart.com/api>`_.

------------------
PHP-хуки и функции
------------------

Формат комментариев заимствован у PHPDocumentor. Такой формат комментариев должен применяться повсеместно ко всем функциям.

Для генерации документации используется программа Doxygen (вот `руководство <http://www.stack.nl/~dimitri/doxygen/>`_).

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
   * Processes cart data after calculating all prices and other data (taxes, shippings etc)
   *
   * @param array  $cart               Cart data
   * @param array  $cart_products      Cart products
   * @param array  $auth               Auth data
   * @param string $calculate_shipping // 1-letter flag
   *      A - calculate all available methods
   *      E - calculate selected methods only (from cart[shipping])
   *      S - skip calculation
   * @param bool $calculate_taxes       Flag determines if taxes should be calculated
   * @param bool $apply_cart_promotions Flag determines if promotions should be applied to the cart
   */
  fn_set_hook('calculate_cart', $cart, $cart_products, $auth, $calculate_shipping, $calculate_taxes, $apply_cart_promotions);    
  ?>

  <?php

  /**
   * Change SQL parameters for product data select
   *
   * @param int $product_id Product ID
   * @param string $field_list List of fields for retrieving
   * @param string $join String with the complete JOIN information (JOIN type, tables and fields) for an SQL-query
   * @param mixed $auth Array with authorization data
   * @param string $lang_code Two-letter language code (e.g. 'en', 'ru', etc.)
   * @param string $condition Condition for selecting product data
   */
  fn_set_hook('get_product_data', $product_id, $field_list, $join, $auth, $lang_code, $condition);
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

