*******************************************
Отображение артикула (sku) в списке товаров
*******************************************

Добавим отображение артикула товара на странице категории (списка товаров), а также немного изменим порядок отображения информации. 

Отображение списка товаров по умолчанию:

.. fancybox:: img/catalog_07.png
    :alt: Отображение списка товаров

1.  Откройте файл:

    ``/design/themes/название_темы/templates/blocks/product_list_templates/products_without_options.tpl``

    Данный файл служит для подключения шаблона с заданными параметрами. Названия параметров соответствуют отображаемой информации.


    .. literalinclude:: files/products_without_options.tpl
        :emphasize-lines: 3,6
        :linenos:
        :language: smarty

2.  Найдите и измените строку с параметром ``show_sku`` для отображения артикула товара:

    .. list-table::
        :header-rows: 1
        :widths: 30 30

        *   -   Было

            -   Стало

        *   -       .. code-block:: smarty

                        show_sku=false

            -       .. code-block:: smarty

                        show_sku=true

    Сохраните файл и очистите кэш. Готово!

        **Путешествие параметра** (*если неинтересно, можно переходить к следующему пункту*)

        Параметры будут переданы в шаблон:

        ``/design/themes/название_темы/templates/blocks/list_templates/products_list.tpl``

        В данном шаблоне будет подключен файл:

        ``/design/themes/название_темы/templates/common/product_data.tpl``

        Подключение выполняется с помощью строки:

        .. code-block:: smarty

            {include file="common/product_data.tpl" product=$product min_qty=true}


        Данный файл содержит условия и необходимый код для каждого параметра:

        .. code-block:: smarty

            {if $show_sku}
                {** HTML и Smarty код отображения **}
            {/if}


        Файл ``common/product_data.tpl`` используется для отрисовки HTML большинства продуктовых страниц и блоков. Обычно подключается в шаблоне следующей конструкцией. Рекомендуем изучить его возможности.

3.  Мы отобразили код товара на странице списка товаров.

    .. fancybox:: img/catalog_10.png
        :alt: Отображение списка товаров

4.  Изменим расположение артикула, перенесём его под краткое описание товара.

    Откройте файл:

    ``/design/themes/название_темы/templates/blocks/list_templates/products_list.tpl``

    Найдите строку отвечающую за отображение артикула:

    .. code-block:: smarty

        {assign var="sku" value="sku_$obj_id"}{$smarty.capture.$sku nofilter}

    Перенесите её в необходимое вам место, например под детальное описание:

    .. code-block:: smarty
        :emphasize-lines: 6

        <div class="ty-product-list__description">
            {assign var="prod_descr" value="prod_descr_`$obj_id`"}
            {$smarty.capture.$prod_descr nofilter}
        </div>

        {assign var="sku" value="sku_$obj_id"}{$smarty.capture.$sku nofilter}


    Готово!

    .. fancybox:: img/catalog_11.png
        :alt: Отображение списка товаров