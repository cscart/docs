**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.6.1
**********************************************

==============
Common Changes
==============

#. ``fn_cleanup_payment_info`` no longer obfuscates card expiration date.

#. The results of the ``fn_get_secure_controllers`` function are treated differently now. This function returns an array with controllers as keys, and each controller has one of the following values:

   * ``active``—the controller must always work via HTTPS.

   * ``passive``—the controller can work either via HTTP, or via HTTPS. 

   Previously, when ``fn_get_secure_controllers`` returned ``passive`` for a controller, there was still a redirect from HTTP to HTTPS when *Secure full site* was chosen under **Settings → Security**. Now, when the function returns passive for a controller, and *Secure full site* is on, there won't be a redirect from HTTP to HTTPS for that controller. This is useful when you want a controller to work via HTTP even when the *Secure full site* mode is on.

#. The code responsible for YML file generation was removed from the **Yandex.Market** add-on. The settings still remain in the database; that way they can be exported to the **YML Export** add-on. Those settings will be removed in one of the future versions.
    
#. An extra parameter called ``log_prepocessor`` was added to the ``\Tygh\Http class``. This parameter helps to process the responses to HTTP requests, before those responses are logged. Use this new parameter to pass the function that you want to use to process the responses.
    
#. The ``ignore_settings`` parameter was added to the block manager schema to hide specific settings. For example, this parameter is now used in the **Banners** block to hide the **Filter by categories** setting.
    
#. The ability to create database backups using the ``mysqldump`` utility was added to speed up the backup process.
    
#. The ``backup_db_mysqldump`` tweak was added; it allows using the ``mysqldump`` utility to create database backups.

------------------------------------
Custom Vendor Design in Multi-Vendor
------------------------------------

#. Vendors can now manage blocks on specific layouts and use the Theme Editor.

#. The new ``vendors/dispatches`` schema was added to specify which locations are owned by a vendor and are affected by vendor's custom design. By default, the following layout pages can be customized by vendors:

   * Detailed product page (*products.view*)

   * Vendor micro-store (*companies.products*)

   * Vendor page (*companies.view*)

   * Pages (*pages.view*)

#. The new ``vendors/containers`` schema was added to specify which containers can be altered by vendors. By default, only the **CONTENT** container can be edited.

#. The new ``is_managed_by`` parameter was added to the ``block_manager/blocks`` schema to prevent vendors from adding or editing specific blocks in their layouts.
    
#. The ``vendor_can_edit`` parameter was added to the theme styles schema to allow vendors to configure specific sections of the Theme Editor. By default, the following sections are available for vendors in **Responsive** and **Bright** themes:

   * General

   * Colors

   * Fonts

   * Backgrounds

   * Custom CSS

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to modify the processed data received from a realtime shipping service::

     fn_set_hook('realtime_services_process_response_post', $result, $shipping_key, $object, $rate);

#. This hook allows you to change the parameters of the notification::

     fn_set_hook('set_notification_pre', $type, $title, $message, $message_state, $extra, $init_message);

#. This hook is executed after routing is performed and before runtime variables are set. The hook allows you to modify runtime variables::

     fn_set_hook('get_route_runtime', $req, $area, $result, $is_allowed_url, $controller, $mode, $action, $dispatch_extra, $current_url_params, $current_url)

#. This hook is executed before the uploaded pattern files are saved. The hook allows you to modify the uploaded files and their location::

     fn_set_hook('patterns_save', $this, $style_id, $style, $uploaded_data, $path, $rel_path);
 
#. This hook is executed when a relative path to the patterns directory is acquired, allowing you to modify it::

     fn_set_hook('patterns_get_rel_path', $this, $path, $style_id);

#. This hook is executed before the LESS content of a style is saved into a file. The hook allows you to modify the style data and saving path::

     fn_set_hook('styles_update', $this, $style_id, $style, $style_path, $less);

#. This hook is executed before the logos are deleted during style deletion. The hook allows you to cancel the deletion of logos::

     fn_set_hook('styles_delete_before_logos', $this, $style_id, $delete_logos);

#. This hook is executed before the layout's style is updated in the database, allowing you to prevent this action::

     fn_set_hook('styles_set_style_pre', $this, $layout_id, $style_id, $update_for_layout, $result);

#. This hook is executed before the styles file is copied. The hook allows you to modify the path to source and destination files::

     fn_set_hook('styles_copy', $this, $from, $to, $clone_logos);

#. This hook is executed before the custom CSS content of a style is saved into a file. The hook allows you to modify style data and the saving path::

     fn_set_hook('styles_add_custom_css', $this, $style_id, $style_path, $custom_css);

#. This hook is executed after the removability of a style is checked, allowing you to modify the results of the check::

     fn_set_hook('styles_is_removable_post', $this, $style, $is_removable);

#. This hook is executed before the file with merged styles is obtained (or before the styles are merged, when the file is missing). The hook allows you to modify the name of the loaded styles file::

     fn_set_hook('merge_styles_file_hash', $files, $styles, $prepend_prefix, $params, $area, $css_dirs, $hash);

#. This hook is executed when the path where to store temporary style file for the Theme editor is determined. The hook allows you to modify the path::

     fn_set_hook('get_theme_editor_tmp_css_path', $css_filename, $cache_dir);

#. This hook is executed before the viewed layout data is stored into the Registry. The hook allows you to modify layout data::

     fn_set_hook('init_layout', $params, $layout);

#. This hook is executed before the session is closed and a response to an AJAX request is provided. The hook allows you to modify the response sent after the AJAX request::

     fn_set_hook('ajax_destruct_before_response', $this, $text, $embedded_is_enabled);

#. This hook is executed after the tax was updated/inserted::

     fn_set_hook('update_tax_post', $tax_data, $tax_id, $lang_code);

#. This hook is executed after the data of the cloned product is received. The hook allows you to modify the data before cloning, or to forbid cloning::

     fn_set_hook('clone_product_data', $product_id, $data, $is_cloning_allowed);

#. This hook is executed before the values of the features of a product are saved. The hook allows you to change the values of features before saving them::

     fn_set_hook('update_product_features_value_pre', $product_id, $product_features, $add_new_variant, $lang_code, $params, $category_ids); 

#. This hook is executed for each product when an order is re-ordered. The hook allows you to modify the data of a product in the order::

     fn_set_hook('reorder_product', $order_info, $cart, $auth, $product, $amount, $price, $zero_price_action);

#. This hook is executed when a product code is requested by the product ID. The hook allows you to substitute the product code::

     fn_set_hook('get_product_code', $product_id, $product_options, $product_code);

#. This hook is executed before the quantity of the product in stock is updated. The hook allows you to modify the remaining inventory::

     fn_set_hook('update_product_amount_pre', $product_id, $amount, $product_options, $sign, $tracking, $current_amount, $product_code);

#. This hook is executed before the checks for the remaining quantity of products. The hook allows you to change the logic of inventory checking::

     fn_set_hook('check_amount_in_stock_before_check', $product_id, $amount, $product_options, $cart_id, $is_edp, $original_amount, $cart, $update_id, $product, $current_amount);

#. This hook is executed when a product is added to cart, once the price of the product is determined. The hook allows you to change the price of the product in the cart::

     fn_set_hook('add_product_to_cart_get_price', $product_data, $cart, $auth, $update, $_id, $data, $product_id, $amount, $price, $zero_price_action, $allow_add);

#. This hook is executed before the product's image pairs are obtained. The hook allows you to substitute the detailed image::

     fn_set_hook('get_cart_product_icon', $product_id, $product_data, $selected_options, $image);

#. This hook is executed before products are exported to a data feed. The hook allows you to substitute the detailed image::

     fn_set_hook('data_feeds_export', $datafeed_id, $options, $pattern, $fields, $datafeed_data);

#. This hook allows you to change the format of the price; you can change the price and the number of digits after the decimal point, or convert the price to another currency::

     fn_set_hook('format_price_pre', $price, $currency, $decimals, $return_as_float);

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
New Hooks from "Russian Localization — Russian Payments" Add-On
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. This hook is executed after Yandex.Checkout receipt items are populated. The hook allows you to modify the items in the receipt::

     fn_set_hook('yandex_checkpoint_get_receipt_after_items', $order, $currency, $extra, $items);

#. This hook is executed before Yandex.Checkout receipt is returned. The hook allows you to modify receipt data::

     fn_set_hook('yandex_checkpoint_get_receipt_post', $order, $currency, $extra, $receipt);

#. This hook is executed after a check has been performed, whether or not a Yandex.Checkout refund is partial. The hook allows you to modify the results of the check::

     fn_set_hook('yandex_checkpoint_is_partial_refund_post', $refund_data, $order_info, $is_partial_refund);

#. This hook is executed after the order data for a refund via Yandex.Checkout has been built. The hook allows you to modify the content of the order::

     fn_set_hook('yandex_checkpoint_build_refunded_order_post', $refund_data, $order_info, $refunded_order_info);

#. This hook is executed when the subtotal discount is distributed during receipt calculation, after the order price has been calculated. The hook allows you to modify order content, cost and discount value::

     fn_set_hook('yandex_checkpoint_apply_discounts', $order, $apply_discount_remainder, $order_cost, $discount);

#. This hook is executed when the subtotal discount is distributed during receipt calculation, after the discount for products, shipping, and surcharge have been distributed. The hook allows to distribute discount to other entities::

     fn_set_hook('yandex_checkpoint_apply_discounts_after_order', $order, $apply_discount_remainder, $order_cost, $discount, $discount_remainder);

-------------
Changed Hooks
-------------

#.

  ::

    // old:
    fn_set_hook('init_secure_controllers', $secure_controllers);
    // new:
    fn_set_hook('init_secure_controllers', $secure_controllers, $secure_storefront_mode);

#.

  ::

    // old:
    fn_set_hook('calculate_cart_items', $cart, $cart_products, $auth);
    // new:
    fn_set_hook('calculate_cart_items', $cart, $cart_products, $auth, $apply_cart_promotions);

#.

  ::

    // old:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data);
    // new:
    fn_set_hook('update_product_categories_pre', $product_id, $product_data, $rebuild);

#.

  ::
 
     // old:
     fn_set_hook('layout_get_default', $this, $theme_name, $condition);
     // new:
     fn_set_hook('layout_get_default', $this, $theme_name, $condition, $fields, $join);

#.

  ::

    // old:
    fn_set_hook('layout_get_list', $this, $params, $condition);
    // new:
    fn_set_hook('layout_get_list', $this, $params, $condition, $fields, $join);

==============
Core Functions
==============

-------------
New Functions
-------------

#. Assign a new main category to a product that had its main category deleted::

     fn_adopt_orphaned_products($category_ids)

#. Convert the values of all profile fields with the "Date" type in a user's profile to timestamps::

     fn_convert_profile_dates_to_timestamps($user_data, $profile_fields)

#. Get mailer transport instance by company identifier::

     \Tygh\Mailer::getTransportByCompanyId($company_id)

#. Get company identifier from message::

     \Tygh\Mailer::getCompanyIdFromMessage($message)

#. Create transport instance by company identifier::

     \Tygh\Mailer\TransportFactory::createTransportByCompanyId($company_id)

#. Get company identifier::

     \Tygh\Mailer\Message::getCompanyId()

#. Set company identifier::

     \Tygh\Mailer\Message::setCompanyId($company_id)

#. Remove blocks that are not snapped::

     \Tygh\BlockManager\Block::removeDetached

#. Find a block that is the exact copy of the specified block::

     \Tygh\BlockManager\Block::findDuplicate

#. Copy container from the default layout to a vendor's layout (used in Multi-Vendor)::

     \Tygh\BlockManager\Container::copyFor

#. Remove container (used in Multi-Vendor)::

     \Tygh\BlockManager\Container::remove

#. Check if a container uses default content::

     \Tygh\BlockManager\Container::usesDefaultContent 

#. Check if the content of the container should be displayed::

     \Tygh\BlockManager\Container::hasDisplayableContent 

#. Check if the content of the container can be reset to default::

     \Tygh\BlockManager\Container::canBeResetToDefault

#. Return a message that should be displayed for the linked container::

     \Tygh\BlockManager\Container::getLinkedMessage

#. Get a URL for setting custom container configuration or for resetting container configuration to default::

     \Tygh\BlockManager\Container::getConfigurationUrl 

#. Add the properties used in the block manager::

     \Tygh\BlockManager\Container::addBlockManagerProperties

#. Return containers where a vendor can manage blocks::

     \Tygh\BlockManager\Container::getOwned

#. Check if a vendor can manage (add/edit) a block (used in Multi-Vendor)::

     \Tygh\BlockManager\SchemesManager::isManageable

#. Return the company ID of the block's owner::

     \fn_get_blocks_owner

#. Provide the list of dispatches that are owned by the vendor::

     \fn_get_vendor_dispatches

#. Check if the style can be removed::

     \Tygh\Themes\Styles::isRemovable

#. Return the company ID of the style's owner::

     \fn_get_styles_owner

#. Return the path to store's cached CSS file for the Theme Editor::

     \fn_get_theme_editor_tmp_css_path

#. Check if theme customization is enabled for the vendor, and provide his/her ID::

     \fn_mve_get_vendor_id_from_customization_mode

#. Provide overridden styles path for vendors::

     \fn_mve_get_vendor_style_path

#. Populate parameters for ``Datakeeper::backup()`` by filling the missing values with the default ones::

     \Tygh\DataKeeper::populateBackupParams

#. Get temp path to the store's files backup::

     \Tygh\DataKeeper::getFilesBackupPath

#. Get temp path to the store's database backup::

     \Tygh\DataKeeper::getDatabaseBackupPath

#. Escape shell arguments fore safe use with exec/system/passthru::

     \Tygh\Tools\SecurityHelper::escapeShellArgs

#. Add the robots.txt instructions to the ``robots_data`` table for a newly-created storefront. If the new storefront is cloned from an existing one, the robots.txt instructions will be cloned from that storefront as well; otherwise the instructions will be taken from the first company::

     Tygh\Common\Robots::addRobotsDataForNewCompany

#. Get the robots.txt instructions from the ``robots_data`` table for a storefront with the specified company identifier::

     Tygh\Common\Robots::getRobotsDataByCompanyId

#. Add an entry with the robots.txt instructions for a storefront with the specified ``company_id`` to the ``robots_data`` table; update the entry with the specified ``company_id``, if it already exists in the ``robots_data`` table::

     Tygh\Common\Robots::setRobotsDataForCompanyId

#. Get the content of the robots.txt file, if it exists. Return void otherwise::

     Tygh\Common\Robots::getRobotsTxtContent

#. Delete an entry with the specified ``company_id`` from the ``robots_data`` table::

     Tygh\Common\Robots::deleteRobotsDataByCompanyId

#. Get the routing information from the request::

     \fn_get_dispatch_routing

#. Get vendor ID by requested object::

     \fn_mve_get_vendor_id_by_request

#. Search ekeys::

     \fn_get_ekeys

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
New Functions from "Russian Localization — Russian Payments" Add-On
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Check whether or not the receipt should be sent to Yandex.Checkout::

     \fn_is_yandex_checkpoint_receipt_required 

#. Provide VAT type for Yandex.Checkout receipt::

     \fn_get_yandex_checkpoint_tax_type

#. Provide price for Yandex.Checkout receipt::
 
     \fn_get_yandex_checkpoint_price

#. Provide item description for Yandex.Checkout receipt::

     \fn_get_yandex_checkpoint_description 

#. Manually include taxes that are not included into the price to the prices of items in the order::

     \fn_yandex_checkpoint_apply_taxes 

#. Get a receipt from Yandex.Checkout::

     \fn_yandex_checkpoint_get_receipt

#. Determine whether or not a Yandex.Checkout refund is partial::

     \fn_yandex_checkpoint_is_partial_refund

#. Build content of an order that is partially refunded via Yandex.Checkout::

     \fn_yandex_checkpoint_build_refunded_order

#. Distribute subtotal discount between order items (products, shipping, payment surcharge)::

     \fn_yandex_checkpoint_apply_discounts

#. Provide receipt XML node for a return request::

     \Tygh\Payments\Processors\YandexMoneyMWS\Client::formatReceipt


-----------
New Classes
-----------

#. ``\Tygh\Mailer\ICompanyTransportFactory``—the interface of the class responsible for the creation of transport object by ``company_id``.

#. ``\Tygh\Enum\BlockManagerActions``—contains actions that can be performed on a snapped element in the block manager.

#. ``\Tygh\Enum\ContainerPositions``—contains the positions of containers in the block manager.

#. ``\Tygh\Tools\Backup\ADatabaseBackupper``—implements an abstract database backup creation component.

#. ``\Tygh\Tools\Backup\FallbackDatabaseBackupper``—implements the database backup creation component that performs all operations using CS-Cart's/Multi-Vendor's mechanisms for working with the database.

#. ``\Tygh\Tools\Backup\MysqldumpDatabaseBackupper``—implements the database backup creation component that performs all operations using a system call to the **mysqldump** utility.


#. ``\Tygh\Tools\Backup\DatabaseBackupperFactory``—provides the means to create native and fallback backup components to back up a database.

#. ``\Tygh\Exceptions\NativeBackupperException`` is thrown when native backup creation component can't be instantiated within ``DatabaseBackupperFactory``.

#. ``\Tygh\Providers\BackupperProvider``—the provider class that registers factories to create backup creation component.

#. ``\Tygh\Tools\Backup\DatabaseBackupperValidator``—provides the means to ensure that database can be properly backed up and restored using a database backup creation component.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
New Classes from "Russian Localization — Russian Payments" Add-On
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. ``\Tygh\Enum\YandexCheckpointTaxedItems``—contains the IDs of taxed item types for Yandex.Checkout.
 
#. ``\Tygh\Enum\YandexCheckpointVatTypes``—contains IDs of product VAT types for Yandex.Checkout.


-----------------
Changed Functions
-----------------

#. The ability to force the rebuilding of category tree with ``fn_update_product_categories()`` was added::

     // old:
     fn_update_product_categories($product_id, $product_data)
     // new:
     fn_update_product_categories($product_id, $product_data, $rebuild = false)

#.

  ::

    // old:
    \Tygh\BlockManager\Block::copy($snapping_ids, $company_id)
    // new:
    \Tygh\BlockManager\Block::copy($snapping_ids, $company_id, $replace_duplicates = false)


#.

  ::

    // old:
    \Tygh\BlockManager\Container::getListByArea($location_id, $area = AREA)
    // new:
    \Tygh\BlockManager\Container::getListByArea($location_id, $area = AREA, $positions = array(), $dynamic_object = array(), $dynamic_object_scheme = array())

#.

  ::

    // old:
    \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name)
    // new:
    \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name, $content = '')

#.

  ::

    // old:
    \Tygh\BlockManager\Grid::copy($container_id, $new_container_id)
    // new:
    \Tygh\BlockManager\Grid::copy($container_id, $new_container_id, $replace_block_duplicates = false)

#.

  ::

    // old:
    \Tygh\CompanySingleton::getCompanyCondition($db_field, $add_and = true)
    // new:
    \Tygh\CompanySingleton::getCompanyCondition($db_field, $add_and = true, $show_admin = false)

#.

  ::

    // old:
    Datakeeper::backupDatabase($params = array())
    // new:
    Datakeeper::backupDatabase($params = array(), $backupper = null)

#.

  ::

    // old:
    function db_export_to_file($file_name, $dbdump_tables, $dbdump_schema, $dbdump_data, $log = true, $show_progress = true, $move_progress_bar = true, $change_table_prefix = array())
    // new:
    function db_export_to_file($file_name, $dbdump_tables, $dbdump_schema, $dbdump_data, $log = true, $show_progress = true, $move_progress_bar = true, $change_table_prefix = array(), $backupper = null)

#. ``fn_clone_product($product_id);`` can now return *false*. It happens when the cloning fails.

#.

  ::

    // old::
    \Tygh\Payments\Processors\YandexMoneyMWS\Client::returnPayment($client_order_id, $invoice_id, $amount, $cause = '#', $currency = '643')
    // new:
    \Tygh\Payments\Processors\YandexMoneyMWS\Client::returnPayment($client_order_id, $invoice_id, $amount, $cause = '#', $currency = self::YANDEX_CHECKPOINT_RUB, $receipt = null)

-----------------
Removed Functions
-----------------

#. ``fn_pp_adaptive_payments_add_columns`` (**PayPal Adaptive Payments** add-on).
