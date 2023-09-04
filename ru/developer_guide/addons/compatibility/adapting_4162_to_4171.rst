*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.17.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===============
Общие изменения
===============

* Библиотека Phinx была обновлена до версии **0.12.9**. Миграции не поддерживают Query Builder, потому что нам нужно поддерживать MySQLi.
* Библиотека Htmlpurifier была обновлена до версии **4.15.0**.
* Библиотека Imagine была обновлена до версии **1.3.0**.
* Библиотека Pimple была обновлена до версии **3.5.0**.
* Библиотека Twig была обновлена до версии **2.14.10**.
* Библиотека CssToInlineStyles была обновлена до версии **2.2.4**.
* Библиотека Console была обновлена до версии **4.4.49**.
* Библиотека Lock была обновлена до версии **5.4.21**.
* Библиотека Collect была обновлена до версии **8.68.0**.
* Библиотека Process была обновлена до версии **5.4.21**.
* Библиотека McryptCompat была обновлена до версии **2.0.3**.
* Библиотека CssSelector была обновлена до версии **5.4.21**.
* Библиотека Phpunit была обновлена до версии **8.5.33**.
* Библиотека Paratest была обновлена до версии **4.0.0**.
* Библиотека ComposerPatches была обновлена до версии **1.7.0**.
* Библиотека Dbunit была обновлена до версии **5.2.1**.

================
Изменения в ядре
================

--------------------------------------------------
Имя, город и адрес продавца теперь можно перевести
--------------------------------------------------

Ранее имя, город и адрес продавца отображались только на одном языке. Теперь эти поля можно перевести. Переведенные поля будут отображаться на некоторых страницах витрины, в уведомлениях покупателей и некоторых документах. 

В таблице ``company_descriptions`` появились новые поля:


* ``i18n_company`` - Переведенное имя продавца

* ``i18n_city`` - Переведенный город продавца

* ``i18n_address`` - Переведенный адрес продавца

Администратор может перевести имя, город и адрес продавца как любое другое поле. Для этого нужно переключиться на необходимый язык контента на странице редактирования информации продавца.

При сохранении информации о продавце заполняются следующие поля: ``i18n_company, i18n_city, i18n_address``. Остальные поля заполняются, только если язык контента совпадает с языком, выбранным на странице редактирования информации продавца.

Переведенные поля теперь оторбажаются на главных страницах витрины, в уведомлениях покупателей и в некоторых документах. Основные поля ``company, city, address`` таблицы ``companies`` используются в Панели администратора, в информации о доставке других элементах, где переводы полей еще не доступны.

Переведенные данные продавца теперь можно отобразить в модулях и ваших пользовательских элементах. Для этого мы добавили параметры ``use_i18n_fields`` и ``use_i18n_company_fields`` в следующие функции:

* fn_get_companies
* fn_get_company_data
* fn_get_company_name
* fn_get_company_placement_info

------------------
Изменённые функции
------------------

#. ::

        // Было:
        \Tygh\Template\Document\Order\Order::__construct($order_id, $lang_code = DESCR_SL, $currency_code = '')
        // Стало:
        \Tygh\Template\Document\Order\Order::__construct($order_id, $lang_code = DESCR_SL, $currency_code = '', array $params = [])
     

#. ::

        // Было:
        \Tygh\Template\Document\Order\Type::renderById($order_id, $code, $lang_code, $currency_code = '', $area = AREA)
        // Стало:
        \Tygh\Template\Document\Order\Type::renderById($order_id, $code, $lang_code, $currency_code = '', $area = AREA, array $order_params = [])
     

#. ::

        // Было:
        \Tygh\Mailer\AMessageBuilder::getCompany($company_id, $lang_code)
        // Стало:
        \Tygh\Mailer\AMessageBuilder::getCompany($company_id, $lang_code, $area = '')
     

#. ::

        // Было:
        function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false, $lang_code = CART_LANGUAGE)
        // Стало:
        function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false, $lang_code = CART_LANGUAGE, array $extra_params = [])
     

#. ::

        // Было:
        function fn_get_company_name($company_id, $zero_company_name_lang_var = '')
        // Стало:
        function fn_get_company_name($company_id, $zero_company_name_lang_var = '', $lang_code = DESCR_SL, array $params = [])
     
 
#. ::

        // Было:
        function fn_get_company_placement_info($company_id, $lang_code = null)
        // Стало:
        function fn_get_company_placement_info($company_id, $lang_code = null, array $params = [])
     

#. ::

        // Было:
        function fn_get_product_data($product_id, &$auth = [], $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false, $feature_variants_selected_only = false)
        // Стало:
        function fn_get_product_data($product_id, &$auth = [], $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false, $feature_variants_selected_only = false, array $params = [])
     
#. ::

        // Было:
        function fn_allow_place_order(&$cart, $auth = null, $parent_order_id = null)
        // Стало:
        function fn_allow_place_order(array &$cart, array $auth = [], $parent_order_id = null)

-------------------------------------------------------------
Шрифты Google для вашей темы теперь должны храниться локально
-------------------------------------------------------------

Это изменение будет важным для вас, если вы разрабатываете темы для CS-Cart. Суд в Мюнхене, Германия, постановил, что использование шрифтов Google, хранящихся на серверах Google, не соответствует GDPR (европейскому закону о защите данных и конфиденциальности). Некоторые владельцы магазинов уже получили жалобы, в которых им грозило обращение в суд и выплата денежных компенсаций.

Поэтому мы адаптировали стандартные темы CS-Cart так, чтобы Шрифты Google хранились локально. Мы рекомендуем сделать это и для ваших пользовательских тем. Вот как это можно сделать:

#. Загрузите шрифты в каталог темы **/media/fonts/**.

#. Измените путь к шрифту на локальный в ваших файлах .css и .less.

Обычный способ использования Шрифтов Google:

::

        @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: normal;
        font-display: swap;
        src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v20/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
        }

Новый способ использования Шрифтов Google, с шрифтами, сохраненными локально в **design/themes/responsive/media/fonts/mem8YaGs126MiZpBA-U1Vw.woff2**:

::

        @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: normal;
        font-display: swap;
        src: local('Open Sans'), local('OpenSans'), url(../media/fonts/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
        }

-------------------------------------------
Добавлен новый плейсхолдер для SQL-запросов
-------------------------------------------

**?t**

Этот плейсхолдер преобразует данные в дробное число с тремя знаками после запятой. 


* Принимает строку, число.

* Пример::

        $product_weight = '1.120';
        db_query('SELECT * FROM ?:shippings WHERE min_weight >= ?t', $product_weight);


* Запрос, который будет отправлен в базу данных::

        
      SELECT * FROM cscart_shippings WHERE min_weight >= 1.120;



====
Хуки
====

----------
Новые хуки
----------

::

        fn_set_hook('update_product_before_update', $_data, $product_info, $product_id, $lang_code); 
    
Выполняется перед обновлением товара, позволяет изменять данные.

=======
Шаблоны
=======

--------------------------
Удалены дублирующиеся хуки
--------------------------

::

        index:simple_dashboard

----------
Новые хуки
----------

::

        index:simple_dashboard_content
