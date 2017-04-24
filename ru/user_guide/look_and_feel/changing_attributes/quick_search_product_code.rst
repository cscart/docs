********************************************************
How To: Configure Quick Search to Search by Product Code
********************************************************

.. warning::

    Эта страница уже неактуальна. Пожалуйста, :doc:`вернитесь на главную страницу раздела <index>`.

По умолчанию, быстрый поиск осуществляется по названию и описанию товара. Чтобы осуществлять поиск по коду товара, выполните следующие шаги:

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
            'items_per_page' => $items_per_page,
        );

4. Замените его на следующий код:
 
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
            'items_per_page' => $items_per_page,
            'pcode_from_q' => 'Y'
        );

5. Сохраните изменения.
