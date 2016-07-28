**************************************************
Изображения товаров и комбинаций параметров товара
**************************************************

В данной статье будет показан процесс изменения функционала платформы с помощью модуля.
Будет описан подход к модификации платформы:

1.  Поиск кода (контроллера и функции), который нужно изменить.

2.  Внесение изменений с помощью модуля.

3.  Отладка и поиск ошибок.

.. note::

    Описанный подход поможет реализовать модификации не связанные с описанным примером.

.. contents:: Содержание
    :local: 
    :depth: 2

Описание примера  
----------------

В стандартной функциональности каждый товар имеет основное изображение, которое отображается первым на всех страницах. У товара могут быть различные параметры и комбинации параметров, например "Цвет" и "Размер". Для каждого параметра и комбинации параметров можно задать своё изображение. Если у товара настроены изображения для комбинаций параметров, то на всех страницах будет отображаться изображение первой комбинации (порядок можно настраивать). 

Будем изменять. 

Обычно, чтобы отобразить на страницах самые низкие цены, первой по порядку устанавливается самая недорогая комбинация товара, соответственно, покупателю будет показана эта фотография. 

Например, имеем один товар "Футболка" разных цветов:

*   Белая - 100 рублей
*   Чёрная - 200 рублей 

Первой будет показана белая футболка. Если таких футболок много, то будет целая страница белых футболок. 

Сделаем так, чтобы можно было отобразить выбранное изображение, а не изображение первой по порядку комбинации параметров товара.

Старт 
-----

На старте имеем стандартную функциональность и стандартные шаблоны платформы:

.. list-table::
    :header-rows: 1
    :widths: 30 30

    *   -   Страница категории

        -   Страница товара

    *   -   .. fancybox:: img/catalog_14.png
                :alt: Изображения списка товаров

        -   .. fancybox:: img/catalog_12.png
                :alt: Изображения списка товаров

**Настройки в панели администратора.**

Товар с основным изображением желтой футболки и комбинациями параметров с изображениями разных цветов:

.. list-table::
    :widths: 20 30

    *   -   Товар

        -   .. fancybox:: img/catalog_20.png
                :alt: Изображения списка товаров

    *   -   Параметры

        -   .. fancybox:: img/catalog_21.png
                :alt: Изображения списка товаров

    *   -   Варианты параметра "Цвет".

        -   .. fancybox:: img/catalog_24.png
                :alt: Изображения списка товаров

    *   -   Комбинации параметров по параметру "Цвет".

        -   .. fancybox:: img/catalog_23.png
                :alt: Изображения списка товаров

В данной ситуации первой по порядку будет отображена белая футболка как самая дешёвая. Мы сделаем так, чтобы отображалась основная картинка товара - желтая футболка.


Определяем контроллер 
---------------------

Переходим на страницу списка товаров в зоне клиента (витрина).

.. fancybox:: img/catalog_14.png
    :alt: Изображения списка товаров

В первую очередь нужно определить контроллер, так как именно контроллер получает из базы данных и обрабатывает все данные, которые отображаются на странице. :doc:`Больше о контроллерах </developer_guide/core/controllers/index>`

1.  Смотрим URL страницы, в которую необходимо внести изменения.
    
    URL: ``ваш_домен/index.php?dispatch=categories.view&category_id=224``

    Нас интересует параметр ``dispatch=categories.view``, именно он определяет контроллер и режим (mode) работы контроллера. 

    .. fancybox:: img/catalog_16.png
        :alt: Отображение списка товаров  

    В данном случае:

    *   контроллер: ``categories``
    *   режим (mode): ``view``

2.  Открываем файл контроллера.

    Контроллеры витрины (зоны покупателя) расположены в папке: ``app/controllers/frontend/``.

    Название php файла контроллера соответствует значению параметра из URL, нам необходим файл: ``categories.php``.

    Открываем файл: ``app/controllers/frontend/categories.php``

3.  Находим участок кода контроллера, отвечающий за обработку данной страницы. 

    Ранее из URL мы определили режим (mode) работы контроллера: ``view`` 

    Это означает, что нас интересует блок кода, который заключен в условие ``$mode == 'view'``, находим данный блок кода:

    ::

        } elseif ($mode == 'view') {

            // php функции

        }


4.  Проверяем, туда ли мы попали. 

    Для проверки лучше всего использовать функцию ``fn_print_r('test')`` . Вставляем данную функцию в начало блока ``$mode == 'view'``.

    ::

        } elseif ($mode == 'view') {
            fn_print_r('test')

    Перезагрузите страницу категории в браузере, в левом верхнем углу должно появится слово ``test``.

    .. fancybox:: img/catalog_17.png
        :alt: Отображение списка товаров  

    Функция ``fn_print_r()`` позволяет распечатывать переменные и массивы данных на экран в удобном для чтения виде.


Ищем функцию, отвечающую за обработку
-------------------------------------

1.  Находим функцию, которая получает данные о товарах. 

    ::

        list($products, $search) = fn_get_products($params, Registry::get('settings.Appearance.products_per_page'), CART_LANGUAGE);

    .. note:: Почему она?

        Именно в этой функции впервые упоминается ``$products`` с информацией о товарах.

2.  Проверяем информацию в массиве ``$products``.

    Добавляем ``fn_print_r($products)`` после функции ``fn_get_products``.

    ::

        list($products, $search) = fn_get_products($params, Registry::get('settings.Appearance.products_per_page'), CART_LANGUAGE);

        fn_print_r($products);

    Вам будет распечатан массив данных всех товаров, которые будут отображены на данной странице. 

    .. fancybox:: img/catalog_18.png
        :alt: Отображение списка товаров      

    Находим ячейку нужного нам товара и распечатываем только его, чтобы не занимать пространство. В данном примере используется товар с ``product_id = 7`` , он расположен в ячейке ``[2]``.

    Печатаем. *Убирайте старые fn_print_r, чтобы не загромождать экран лишней информацией*

    ::

        fn_print_r($products[2]);

    Смотрим и проверяем массив на наличие данных об изображениях. К сожалению, их нет в настоящий момент, значит они будут получены далее в контроллере. Идём дальше. 

2.  Изучаем дальнейшую работу с массивом ``$products`` в контроллере ``categories.php``. 

    Следующей функцией, которая работает с данным массивом, является ``fn_gather_additional_products_data``. Судя по входящим в данную функцию параметрам, именно она получит изображения для товаров, а также информацию об опциях, скидках и т.д. 

    Вставляем ``fn_print_r($products[2]);`` после данной функции и смотрим результат. 

    ::

        fn_gather_additional_products_data($products, array(
            'get_icon' => true,
            'get_detailed' => true,
            'get_additional' => true,
            'get_options' => true,
            'get_discounts' => true,
            'get_features' => false
        ));

        fn_print_r($products[2]);    

    Результат:

    .. fancybox:: img/catalog_19.png
        :alt: Отображение списка товаров      


    Отлично! В нашем массиве появились данные о главном изображении ``[main_pair]``, а также ячейка с данными об опциях товара ``[product_options]``.

    Судя по информации в ячейке ``[main_pair]``, будет отображена **белая** (белая.jpg) футболка.

    ``[main_pair]`` - всегда содержит информацию о первом (главном) изображении товара, который будет отображен. Обычно это основное изображение товара. Однако в случае, когда параметры содержат собственные изображения, первым отображается изображение первой комбинации параметров. 

    Делаем вывод, что в именно в этой функции получается основное изображение товара, и там же оно подменяется на изображение комбинации.

    Мы нашли нужную нам функцию.

3.  Переходим к детальному изучению функции ``fn_gather_additional_products_data``.

    Практически все функции, используемые в контроллерах, находятся в папке ``app/functions/`` . Данная папка содержит файлы с функциями, названия которых соответствует направлению работы функций.

    Воспользуемся поиском по файлам в папке ``app/functions/`` , в результате функция ``fn_gather_additional_products_data`` найдена в файле ``fn.catalog.php`` , чего и следовало ожидать.

    Открываем файл ``app/functions/fn.catalog.php`` и находим функцию:

    ::

        function fn_gather_additional_products_data(&$products, $params)
        {

    **Наша цель — найти код, отвечающий за получение изображений к товарам.**

    Ищем упоминание ``image`` и ``['main_pair']``

    По логике находится блок:

    ::

        if ($params['get_icon'] == true || $params['get_detailed'] == true) {
            if (empty($product['main_pair']) && !empty($products_images[$product_id])) {
                $product['main_pair'] = reset($products_images[$product_id]);
            }
        }

    Проверяем правильность найденного кода. 

    Так как данный код запускается в цикле по всем товарам, а нам нужно проверить только информацию по тестовому товару, то можно использовать:

    ::

        if ($params['get_icon'] == true || $params['get_detailed'] == true) {
            if (empty($product['main_pair']) && !empty($products_images[$product_id])) {
                $product['main_pair'] = reset($products_images[$product_id]);
            }
        }

        if ($product['product_id'] == 7) {
            fn_print_r($product['main_pair']);
        }   

    Тем самым на экран будет распечатана информация только товара с id = 7 .

    В результате видим, что получены данные о **желтом** (желтом.jpg) изображении для товара, а отображается белое. Значит где-то дальше будет изменено на белое из комбинации, таким образом, ищем код, который далее изменяет ``['main_pair']``.

    .. fancybox:: img/catalog_25.png
        :alt: Отображение списка товаров


    Чуть дальше в функции ``fn_gather_additional_products_data`` находится участок кода, который отвечает за получение параметров (опций) и их изображений:

    ::

        // Get product options images
        if (!empty($product['combination_hash']) && !empty($product['product_options'])) {
            $image = fn_get_image_pairs($product['combination_hash'], 'product_option', 'M', $params['get_icon'], $params['get_detailed'], CART_LANGUAGE);
            if (!empty($image)) {
                $product['main_pair'] = $image;
            }
        }

    Код ``$product['main_pair'] = $image;`` явно перезаписывает основное изображение на изображение из параметра (опции).

4.  Проверяем до и после найденного кода.

    .. code-block:: php
        :emphasize-lines: 2, 10, 16

        if ($product_id == 7) {
            fn_print_r('До', $product['main_pair']);
        }

                if (!empty($params['get_icon']) || !empty($params['get_detailed'])) {
                    // Get product options images
                    if (!empty($product['combination_hash']) && !empty($product['product_options'])) {
                        $image = fn_get_image_pairs($product['combination_hash'], 'product_option', 'M', $params['get_icon'], $params['get_detailed'], CART_LANGUAGE);
                        if (!empty($image)) {
                            $product['main_pair'] = $image;
                        }
                    }
                }

        if ($product_id == 7) {
            fn_print_r('После', $product['main_pair']);
        }

    Результат:

    .. fancybox:: img/catalog_26.png
        :alt: Отображение списка товаров

    Была ``желтая.jpg``, стала ``белая.jpg``

    Как видим, именно эта часть кода подменяет основное изображение на изображение комбинации параметра.

    .. important::

        Также Вы можете увидеть, что функция fn_print_r(), может печатать несколько параметров, переданных через запятую fn_print_r($a, $b, 1, 'текст');

    **Успех! Найдено место, которое нужно исправить**

Вносим изменения с помощью модуля
---------------------------------

Так как мы нашли участок кода, который нам нужно поправить для достижения цели, то стараемся это сделать с помощью модуля.

1.  Ищем способ внести изменения без вмешательства в платформу.

    Ищем ближайшие хуки выше и ниже места, в которое нужно внести изменение. 

    Ближайший хук сверху:

    .. code-block:: php 

        fn_set_hook('gather_additional_product_data_before_options', $product, $auth, $params);

    Ближайший хук снизу:

    .. code-block:: php

        fn_set_hook('gather_additional_product_data_before_discounts', $product, $auth, $params);

    Каждый php хук имеет название и список переменных, которые будут в нём доступны для изменения.

    Не всегда подойдут ближайшие хуки, так как в них может не быть необходимых данных. Иногда приходится использовать даже хуки из других функций.

    Когда хуки найдены, необходимо подключится и изменить функционал с их помощью.

    Вносим необходимые изменения с помощью модуля.

2.  Инициализация хуков в модуле.

    Будем использовать стандартный модуль "Мои изменения" (my_changes). Этот модуль является простой заготовкой, по умолчанию он не выполняет никаких функций и создан для практики и расширения функционала.

    Включите модуль "Мои изменения" в панели администратора. 

    Откройте папку ``app/addons/my_changes/``

    Создайте новый пустой файл: ``init.php`` 

    Внесите следующий код:

    .. code-block:: php 

        <?php

        if (!defined('BOOTSTRAP')) { die('Access denied'); }

        fn_register_hooks(
            'gather_additional_product_data_before_options',
            'gather_additional_product_data_before_discounts'
        );

    Данным кодом мы инициализировали два хука для нашего модуля. 

3.  Создаём функции, которые будут подключаться к хукам.

    Создайте новый пустой файл:

    ``app/addons/my_changes/func.php`` 

    Создайте две новые функции:

    .. code-block:: php 

        <?php

        if (!defined('BOOTSTRAP')) { die('Access denied'); }

        function fn_my_changes_gather_additional_product_data_before_options(&$product, &$auth, &$params)
        {
            // Для хука fn_set_hook('gather_additional_product_data_before_options', $product, $auth, $params)
        }

        function fn_my_changes_gather_additional_product_data_before_discounts(&$product, &$auth, &$params)
        {
            // Для хука fn_set_hook('gather_additional_product_data_before_discounts', $product, $auth, $params);
        } 
    
    Чтобы хук работал, его название должно состоять из **fn_идентификатор_модуля_название_хука(данные доступные в хуке)**.

    Обязательно добавляйте **&** для входящих параметров, если их необходимо изменить.
 
4.  Проверяем правильность подключения хуков. 

    Убираем все старые ``fn_print_r()`` и добавляем функции печати в хуки файла ``app/addons/my_changes/func.php``

    .. code-block:: php

        function fn_my_changes_gather_additional_product_data_before_options(&$product, &$auth, &$params)
        {
            fn_print_r('Первый хук', $product['product_id']);
        }

        function fn_my_changes_gather_additional_product_data_before_discounts(&$product, &$auth, &$params)
        {
            fn_print_r('Второй хук', $product['product_id']);
        } 

    В результате будут выведены на экран ID товаров:

    .. fancybox:: img/catalog_27.png
        :alt: Отображение списка товаров

    Так как сами хуки расположены внутри цикла функции ``fn_gather_additional_products_data``, который проходит по всем товарам, то и хуки сработают для каждого товара. Если хуки находятся вне цикла, Вам потребуется самостоятельно пройтись циклом по всем товарам и внести необходимые изменения. 

    В настоящий момент мы имеем:

    a)  Место, где есть информация об основном изображении (первый хук).

    б)  Место, где уже произошло изменение изображения (второй хук).

    Нам нужно каким-то образом сохранить информацию об изображении в первом хуке и вернуть её на её законное место во втором. 

5.  Получаем и сохраняем информацию об изображении в первом хуке.

    Как мы выяснили ранее, данная информация содержится в ячейке ``$product['main_pair']`` . Сохранять её будем также в массиве ``$product``, так как данная информация нам потребуется в рамках одного цикла.

    Сохраним значение ``$product['main_pair']`` в новую ячейку ``$product['original_image']``

    :: 

        function fn_my_changes_gather_additional_product_data_before_options(&$product, &$auth, &$params)
        {
            if (!empty($product['main_pair']) {
                $product['original_image'] = $product['main_pair'];
            }
        }    

    Проверим, существует ли ``$product['original_image']`` во втором хуке.

    :: 

        function fn_my_changes_gather_additional_product_data_before_options(&$product, &$auth, &$params)
        {
            fn_print_r($product['original_image']);
        }    

    В результате должны быть распечатаны массивы с информацией о картинках. 

    Если всё хорошо, то просто возвращаем ``$product['main_pair']`` из ``$product['original_image']``. 

    Нам необходимо, чтобы данные изменения работали только на странице категории. Для этого необходимо получить название контроллера в настоящий момент и добавить проверку.

    Данные о текущем запуске платформы доступны в ``Registry::get('runtime')``:

    ::

        use Tygh\Registry;

        // ...

        $controller = Registry::get('runtime.controller');


Финиш
-----

Должно получиться два файла в модуле my_changes:

1.  ``app/addons/my_changes/func.php``

    ::

        <?php

        use Tygh\Registry;

        if (!defined('BOOTSTRAP')) { die('Access denied'); }

        function fn_my_changes_gather_additional_product_data_before_options(&$product, &$auth, &$params)
        {
            $controller = Registry::get('runtime.controller');
            if ($controller == 'categories' && !empty($product['main_pair'])) {
                $product['original_image'] = $product['main_pair'];
            }
        }

        function fn_my_changes_gather_additional_product_data_before_discounts(&$product, &$auth, &$params)
        {
            $controller = Registry::get('runtime.controller');
            if ($controller == 'categories' && !empty($product['original_image'])) {
                $product['main_pair'] = $product['original_image'];
            }
        } 

2.  ``app/addons/my_changes/init.php``

    ::

        <?php

        if (!defined('BOOTSTRAP')) { die('Access denied'); }

        fn_register_hooks(
            'gather_additional_product_data_before_options',
            'gather_additional_product_data_before_discounts'
        );

3.  Выключите / включите модуль "Мои изменения" для проверки результата.

    .. list-table::
        :header-rows: 1
        :widths: 30 30

        *   -   Модуль выключён

            -   Модуль включен

        *   -   .. fancybox:: img/catalog_29.png
                    :alt: Изображения списка товаров

            -   .. fancybox:: img/catalog_28.png
                    :alt: Изображения списка товаров

Тот, кто прочитал до этого момента, будет приятно удивлён тому, что этим способом можно изменить очень многое. 
