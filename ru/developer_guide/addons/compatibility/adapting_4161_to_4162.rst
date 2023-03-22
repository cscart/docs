*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.16.2
*******************************************************

.. contents::
    :local:
    :backlinks: none

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется перед конкатенацией исходного запроса и запроса с вариантами характеристик; позволяет изменять SQL-запрос фильтрации::

       fn_set_hook('generate_feature_conditions_with_variants', $items, $selected_items, $join, $condition, $lang_code, $params, $variant_features, $value_features, $valueint_features, $_join, $conditions);
