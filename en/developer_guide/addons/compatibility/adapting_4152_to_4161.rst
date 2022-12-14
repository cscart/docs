***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.16.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Add-on Changes
==============


---------------
"Cities" Add-on
---------------

In 4.16.1, we introduce a new tool that allows you to work with cities. For example, you'll be able to make a drop-down list with cities for any country on the checkout.

The add-on is unmanaged in the admin panel, but you can install it via console::

#. ``cd /path/to/store``
#. ``php admin.php -p --dispatch=addons.install --addon=cities``

The database of cities in the new add-on is empty. If you want to use the "Cities", complete the database by yourself.

============
Core Changes
============

---------------------------------------------
HTML Block with Smarty Support is Deprecated
--------------------------------------------

A deprecated block is converted to a safe block if you try to create it via layout import. Use the type and layout of the new block instead of the deprecated one: the type is ``safe_smarty_block``, the template is ``blocks/safe_smarty_block.tpl``. To activate additional functions in the new block, you need to expand the ``block_manager/smarty_allowed_functions.php`` scheme.

Blocks that were created before the update will continue to work correctly, but you won't be able to update their content.

-------------
New Functions
-------------

#. Updates notifications by search parameters in bulk::

       \Tygh\NotificationsCenter\IRepository::bulkUpdate(Notification $notification_template, array $update_fields = [], array $params = []);

#. Gets setting value for all storefronts::

       \Tygh\Settings::getAllStorefrontValues($setting_name, $section_name = '');

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed before saving storefront. Allows to perform additional actions.::

       fn_set_hook('storefront_repository_save_pre', $storefront, $storefront_data);;

#. This hook gets a product before getting its link::

       fn_set_hook('google_sitemap_write_products_to_sitemap_before_getting_link', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $products, $product, $page, $params, $sitemap_items);

#. This hook get params before getting products::

       fn_set_hook('google_sitemap_write_products_to_sitemap_before_getting_products', $storefront, $last_modified_time, $change_frequency, $priority, $file, $link_counter, $file_counter, $sitemap_header, $sitemap_footer, $languages, $products, $product, $page, $params);

================
Template Changes
================

---------
New Hooks
---------

``menu:storefront_icon``
