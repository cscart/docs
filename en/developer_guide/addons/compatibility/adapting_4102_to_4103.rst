***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.10.3
***********************************************

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed when a supplier's shipping methods are updated, before the shipping methods links are removed. The hook allows you to modify the list of shipping methods that would be removed::

     fn_set_hook('suppliers_update_supplier_shippings_before_delete_shippings', $supplier_id, $shippings, $current_supplier_data, $deleted_shippings);

#. This hook is executed before a product feature is updated, right before feature values are removed from products that aren't present in the new categories of the feature. The hook allows you to prevent product feature values removal, or to modify the feature data stored in the database::

     fn_set_hook('update_product_feature', $feature_data, $feature_id, $lang_code, $old_feature_data, $old_categories, $new_categories);

==============
Core Functions
==============

-----------
New Classes
-----------

``\Tygh\Enum\VendorStatuses``—enumeration of vendor statuses.

-------------
New Functions
-------------

#. Fill empty location fields in the specified section by copying them from the secondary profile fields section::

     \Tygh\Location\Manager::fillEmptyLocationFields(array $array, $primary_section)

#. Take the first payment from vendor according to the vendor plan::

     \Tygh\Models\Company::initialPayment()

#. Filter the list of source entities by their availability for the shared entity's companies::

     fn_suppliers_filter_objects_by_sharing(array $objects_list, $source_type, $source_id_field, $shared_type, $shared_object_id)

#. Find categories and their data by given category path::

     fn_get_categories_from_path(array $category_names, $company_id, $lang_code)

-----------------
Changed Functions
-----------------

::

  // Old:
  \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

  // New:
  \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
