*************************************************************************
Как настроить быстрый поиск по всем введённым словам, а не по целой фразе
*************************************************************************

.. warning::

    Эта страница уже неактуальна. Пожалуйста, :doc:`вернитесь на главную страницу раздела. <index>`

По умолчанию, быстрый поиск ищет конкретную введённую фразу. Чтобы осуществлять поиск по коду всем введённым словам, выполните следующие шаги:

#. Найдите папку *app/functions* в директории с установленным CS-Cart.

#. Откройте файл **fn.catalog.php**.

#. Найдите в файле следующий код::

     $default_params = array (
            'area' => AREA,
            'use_caching' => true,
            'extend' => array('product_name', 'prices', 'categories'),
            'custom_extend' => array(),
            'pname' => '',
            'pshort' => '',
            'pfull' => '',
            'pkeywords' => '',
            'feature' => array(),
            'type' => 'simple',
            'page' => 1,
            'action' => '',
            'filter_variants' => array(),
            'features_hash' => '',
            'limit' => 0,
            'bid' => 0,
            'match' => '',
            'tracking' => array(),
            'get_frontend_urls' => false,
            'items_per_page' => $items_per_page
        );

#. Замените его на следующий код::
 
     $default_params = array (
            'area' => AREA,
            'use_caching' => true,
            'extend' => array('product_name', 'prices', 'categories'),
            'custom_extend' => array(),
            'pname' => '',
            'pshort' => '',
            'pfull' => '',
            'pkeywords' => '',
            'feature' => array(),
            'type' => 'simple',
            'page' => 1,
            'action' => '',
            'filter_variants' => array(),
            'features_hash' => '',
            'limit' => 0,
            'bid' => 0,
            'match' => 'all',
            'tracking' => array(),
            'get_frontend_urls' => false,
            'items_per_page' => $items_per_page
        );

#. Сохраните изменения.

.. note::

    Чтобы искать не по всем, а по любому из введённых слов, замените ``all`` на ``any`` в коде из шага 4.
