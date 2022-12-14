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

In 4.16.1, we introduce a new tool that allows you to work with cities. For example, you'll be able to make a drop-down list with cities for any country on checkout.

The add-on is marked as unmanaged. It means that it won't appear in the admin panel, and customers won't know about it yet. But you can install it via console::

  cd /path/to/store
  php admin.php -p --dispatch=addons.install --addon=cities

The new "Cities" add-on is hidden because it doesn't have the database of cities yet. But if you'd like to use it, you already can. Just enable it via console and add the list of cities to the database.

============
Core Changes
============

------------------------------------------------------
HTML Block with Smarty Support Is Marked as Deprecated
------------------------------------------------------

CS-Cart has an HTML block with Smarty support that allows you to add Smarty-code to pages. However, existing blocks were not safe, so we added new safe blocks in 4.16.1. After the update, the blocks will continue to work correctly, but you will not be able to update their content. If you want to use additional functions in the new block, extend the ``block_manager/smarty_allowed_functions.php`` schema.

Use a new type and template of the block:

* type: ``safe_smarty_block``;
* template: ``blocks/safe_smarty_block.tpl``.

-------------
New Functions
-------------

#. Update notifications by search parameters in bulk::

       \Tygh\NotificationsCenter\IRepository::bulkUpdate(Notification $notification_template, array $update_fields = [], array $params = []);

#. Get setting value for all storefronts::

       \Tygh\Settings::getAllStorefrontValues($setting_name, $section_name = '');

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed before saving storefront. Allows to perform additional actions::

       fn_set_hook('storefront_repository_save_pre', $storefront, $storefront_data);

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
