**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.7.2
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed after the tags are deleted from the database by their numeric identifiers::

     fn_set_hook('delete_tags_post', $tag_ids);

#. This hook is executed after the tags are deleted by the specified parameters::

     fn_set_hook('delete_tags_by_params_post', $params); 

#. This hook is executed after the data of the tags has been updated::

     fn_set_hook('update_tags_post', $tags_data, $for_all_companies);

#. This hook is executed during the processing of fields of an export/import pattern::

     fn_set_hook('exim_get_pattern_definition_export_fields', $pattern_id, $get_for, $extra, $field_id, $field_data, $schema);

#. This hook is executed right before the queries for deleting an option are run::

     fn_set_hook('delete_product_option_before_delete', $option_id, $pid, $product_id, $product_link, $can_continue);

#. This hook is executed after objects have been imported into a store::

     fn_set_hook('import_post', $pattern, $import_data, $options, $result, $processed_data);


==============
Core Functions
==============

-------------
New Functions
-------------

#. Get product variation identifiers:: 

     Tygh\Addons\ProductVariations\Product\Manager::getProductVariations

#. Check if the configurable product has variations:: 

     fn_google_export_configurable_product_has_variations($product)

#. Get the product data for the product variations::

     fn_google_export_get_product_variation_data($product, $product_options)

#. Get the company ID of the vendor whose content is being viewed::

     fn_get_runtime_vendor_id()

-----------------------------------------
New Functions Specific to Russian Version
-----------------------------------------

#. Check if the product's offer type is apparel: ``Tygh\Ym\Yml2::isApparelProduct``

#. Get the offer type for product:: ``Tygh\Ym\Offers\Base::getOfferType``

-----------------
Changed Functions
-----------------

#. 

  ::

    // old:
    function fn_exim_get_pattern_definition($pattern_id, $get_for = '')

    // new:
    function fn_exim_get_pattern_definition($pattern_id, $get_for = '', $extra = array())

#.

  ::

    // old:
    function fn_get_files_dir_path()

    // new:
    function fn_get_files_dir_path($company_id = null)

#.

  ::

    // old:
    function fn_get_public_files_path()

    // new:
    function fn_get_public_files_path($company_id = null)

#. 

  ::

    // old:
    function fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object)

    // new:
    function fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object, $import_options = null)


-----------
New Classes
-----------

#. ``\Tygh\Enum\ImagePairTypes`` — enumeration of image types.
