******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.7.2
******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Этот хук выполняется после удаления тегов из базы данных по их числовым идентификаторам::

     fn_set_hook('delete_tags_post', $tag_ids);

#. Этот хук выполняется после удаления тегов по указанным параметрам::

     fn_set_hook('delete_tags_by_params_post', $params); 

#. Этот хук выполняется после обновления данных о тегах::

     fn_set_hook('update_tags_post', $tags_data, $for_all_companies);

#. Этот хук выполняется во время обработки полей паттерна импорта/экспорта::

     fn_set_hook('exim_get_pattern_definition_export_fields', $pattern_id, $get_for, $extra, $field_id, $field_data, $schema);

#. Этот хук выполняется сразу пере тем, как выполняются запросы на удаление опции::

     fn_set_hook('delete_product_option_before_delete', $option_id, $pid, $product_id, $product_link, $can_continue);

#. Этот хук выполняется после того, как объекты были импортированы в магазин::

     fn_set_hook('import_post', $pattern, $import_data, $options, $result, $processed_data);


====================
Изменения в функциях
====================

-------------
Новые функции
-------------

#. Получает идентификаторы вариаций товара:: 

     Tygh\Addons\ProductVariations\Product\Manager::getProductVariations

#. Проверяет, есть ли у настраиваемого товара вариации:: 

     fn_google_export_configurable_product_has_variations($product)

#. Получает данные товара для вариаций товара::

     fn_google_export_get_product_variation_data($product, $product_options)

#. Получает идентификатор продавца, чей контент сейчас просматривается::

     fn_get_runtime_vendor_id()

-------------------------------------
Новые функции только в русской версии
-------------------------------------

#. Проверяет, установлен ли у товара тип товарного предложения "Одежда": ``Tygh\Y\Yml2::isApparelProduct``

#. Получает тип предложения товара:: ``Tygh\Ym\Offers\Base::getOfferType``

------------------
Изменённые функции
------------------

#. 

  ::

    // Было:
    function fn_exim_get_pattern_definition($pattern_id, $get_for = '')

    // Стало:
    function fn_exim_get_pattern_definition($pattern_id, $get_for = '', $extra = array())

#.

  ::

    // Было:
    function fn_get_files_dir_path()

    // Стало:
    function fn_get_files_dir_path($company_id = null)

#.

  ::

    // Было:
    function fn_get_public_files_path()

    // Стало:
    function fn_get_public_files_path($company_id = null)

#. 

  ::

    // Было:
    function fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object)

    // Стало:
    function fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object, $import_options = null)


------------
Новые классы
------------

#. ``\Tygh\Enum\ImagePairTypes`` — перечисление типов изображений.
