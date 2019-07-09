*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.10.3
*******************************************************

=================
Изменения в хуках
=================

----------
Новые хуки
----------

#. Выполняется при обновлении способов доставки поставщика, перед удалением привязки способов доставки. Позволяет изменить список способов доставки, привязка которых будет убрана::

     fn_set_hook('suppliers_update_supplier_shippings_before_delete_shippings', $supplier_id, $shippings, $current_supplier_data, $deleted_shippings);

#. Выполняется перед обновлением характеристики товара, прямо перед тем, как у товаров, которых нет в новых категориях характеристики, удаляются варианты этой харакеристики. Хук позволяет отменить удаление вариантов характеристики или изменить данные характеристики в БД::

     fn_set_hook('update_product_feature', $feature_data, $feature_id, $lang_code, $old_feature_data, $old_categories, $new_categories);

====================
Изменения в функциях
====================

------------
Новые классы
------------

``\Tygh\Enum\VendorStatuses`` — перечисление статусов продавцов.


-------------
Новые функции
-------------

#. Заполняет пустые поля с информацией о местоположении в указанной секции. Данные для этого берутся из второстепенной секции::

     \Tygh\Location\Manager::fillEmptyLocationFields(array $array, $primary_section)

#. Взимает с продавца первую оплату по тарифному плану::

     \Tygh\Models\Company::initialPayment()

#. Фильтрует список исходных сущностей по их доступности для компаний, к которым относится общая сущность::

     fn_suppliers_filter_objects_by_sharing(array $objects_list, $source_type, $source_id_field, $shared_type, $shared_object_id)

#. Ищет категории и их данные по переданному пути категорий::

     fn_get_categories_from_path(array $category_names, $company_id, $lang_code)

------------------
Изменённые функции
------------------

::

  // Было:
  \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

  // Стало:
  \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
