***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.16.2
***********************************************

.. contents::
    :local:
    :backlinks: none

============
Core Changes
============

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed right before the concatenation of the original query and the query with variants of the features. It allos you to modify the filter SQL-query::

       fn_set_hook('generate_feature_conditions_with_variants', $items, $selected_items, $join, $condition, $lang_code, $params, $variant_features, $value_features, $valueint_features, $_join, $conditions);

.. meta::
   :description: Information about hook changes in CS-Cart version 4.16.2 for add-on and theme developers.