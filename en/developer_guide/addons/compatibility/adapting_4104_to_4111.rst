***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.11.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Common Changes
==============

------------------------------------------------------------
Linking of Themes to Storefronts in CS-Cart and Multi-Vendor
------------------------------------------------------------

Themes are now directly linked to storefronts.

* For Multi-Vendor Ultimate it means that a marketplace can have multiple themes installed at the same time now.

* For CS-Cart it means that a theme is no longer linked to ``company``; instead it is linked to the company via another entity — ``storefront``.

In CS-Cart, each company corresponds to one storefront. For backward compatibility, we've added middleware that determines the storefront by the passed company ID in all the right places. **That middleware will be removed in the future versions of CS-Cart.**

The following entities are now connected to storefrnots: *Layouts*, *Containers*, *Blocks*.

Since a theme is no longer connected to company, **the corresponding setting** ``theme_name`` **was removed** and moved to storefront properties.

The functions that are now storefront-dependent are listed :ref:`in a separate subsection of Changed Functions <4111-storefront-dependent-functions>`. Using these functions without passing the storefront in the corresponding parameters can lead to unexpected results.

-------------------------------------------------------------------
Linking of Payment & Shipping Methods and Promotions to Storefronts
-------------------------------------------------------------------

Multi-Vendor Ultimate now supports linking of payment methods, shipping methods, and promotions to storefronts.

CS-Cart uses this new mechanism as well; it no longer uses sharing for the purpose of linking payment methods, shipping methods, and promotions to storefronts.

------------------------------
Changes in Add-on Installation
------------------------------

When an add-on is installed from archive, all the files that could be left from the add-on in the past will be removed:

* app/addons/{addon}
* design/backend/css/addons/{addon}
* design/backend/mail/templates/addons/{addon}
* design/backend/media/fonts/addons/{addon}
* design/backend/media/images/addons/{addon}
* design/backend/templates/addons/{addon}
* design/themes/{theme}/css/addons/{addon}
* design/themes/{theme}/mail/templates/addons/{addon}
* design/themes/{theme}/media/fonts/addons/{addon}
* design/themes/{theme}/media/images/addons/{addon}
* design/themes/{theme}/templates/addons/{addon}
* js/addons/{addon}
* var/langs/{lang_code}/addons/{addon}.po

------------------------
Changes in Notifications
------------------------

The mechanism of **notification events** fr multi-channel notifications was added. Its main components are listed below.

++++++++++++++++
Event Dispatcher
++++++++++++++++

Triggers events that result in sending notifications to the receivers.

An event consists of a string identifier and the data passed in the event. It is an object of the ``\Tygh\Notifications\EventDispatcher`` class, registered in ``Tygh::$app['event.dispatcher']``.

Here is the example of triggering an event::

  Tygh::$app['event.dispatcher']->dispatch('profile.updated', ['user_id' => $user_data, 'user_id' => $user_id]);

++++++++
Messages
++++++++

Messages are formed based on the schema of the transport, and the data passed to the dispatcher.

They contain all the data required for notifications via the transport related to this type of messages.

A message must be an instance of the ``\Tygh\Notifications\Transports\BaseMessageSchema`` class.

Examples:

* ``\Tygh\Notifications\Transports\Mail\MailMessageSchema``—a message sent to email.

* ``\Tygh\Notifications\Transports\Internal\InternalMessageSchema``—a message sent to the Notification Center.

+++++++++++++++++++++++++++++++
Transports for Sending Messages
+++++++++++++++++++++++++++++++

Transports send messages of specific types. They implement the ``\Tygh\Notifications\Transports\ITransport`` interface and are registered in ``Tygh::$app['event.transports.{TransportId}']``.

The list of identifiers is contained in the schema of tranpsorts: ``Tygh::$app['event.transports_schema']``.

Examples of implementation:

* ``\Tygh\Notifications\Transports\MailTransport``—sends messages to email.

* ``\Tygh\Notifications\Transports\InternalTransport``—sends messages to the Notification Center.


+++++++++++++++
Receiver Schema
+++++++++++++++

This schema contains the identifiers of all possible receivers in the system. It is registered in ``Tygh::$app['event.receivers_schema']`` and can be extended via the ``get_notification_rules`` hook.

++++++++++++
Event Schema
++++++++++++

This schema contains all the events in the system and describes their possible receivers. It is registered in ``Tygh::$app['event.events_schema']``.

The list of events, transports, and receivers can be extended via the *notification/events.php* schema.

Every element of the schema has the following structure::

  (string) EventId => [
      'group' => (string) GroupId,
      'name' => [
          'template' => (string) TemplateLanguageVariable,
          'params' => [
              (string) SubstitutionName => (string) Substitution
              ...
          ],
      ],
      'data_provider' => (callable) DataProvider,
      'receivers' => [
          (string) ReceiverId => [
              (string) TransportId => BaseMessageSchema::create([
                  'area'            => (string) area,
                  'from'            => (string) from,
                  'to'              => (callable) DataValue::create(key),
                  'template_code'   => (string) template_code,
                  ...
                  'language_code'   => (callable) DataValue::create(parent_key.key, default_value),
                  'data_modifier'   => (callable) function (array $data) {
                      return array_merge($data, $added_data_value);
                  }
              ]),
              ...
          ],
          ...
      ],
  ],


* ``EventId``—the identifier of the event; it is used as the first argument in ``\Tygh\Notifications\EventDispatcher::dispatch``.

* ``GroupId``—the identifier of the group of events. It is used on the notification settings page for easier navigation.

* ``TemplateLanguageVariable``—the name of the language variable for naming the event on the notification settings page.

* ``SubstitutionName`` and ``Substitution``—the name and value of the parameters used for adapting the language variable to the specifics of the event.

* ``DataProvider``—implements the ``Notification\DataProviders\DataProvider`` interface; used for receiving the fields specific for the event based on the ``data`` passed in ``\Tygh\Notifications\EventDispatcher::dispatch``.

* ``ReceiverId``—the identifier of the receiver. All existing identifiers of receivers can be obtained from ``Tygh::$app['event.receivers_schema']``.

* ``TransportId``—the identifier of the transport. Transports must offer it in ``\Tygh\Notifications\Transports\ITransport::getId``.

* ``BaseMessageSchema``—creates an instance of the schema class with the data prepared for sending. The input parameters must contain the processed data necessary for sending the message.

  They can be presented as text: ``area``, ``from``, ``template_code``. Or they can be presented as an instance of the  ``DataValue`` class.

* ``DataValue``—the class that allows receiving data from the input array by key. If the passed key isn't in the array, then ``default_value`` will be taken (by default it's ``null``).

* ``data_modifier``—a callable parameter; a function can perform additional transformation of fields passed in ``data``.

++++++++++++++++++
Notification Rules
++++++++++++++++++

The rules describe what types of messages, and via what transports should be sent to receivers when an event occurs.

Rules are registered in ``Tygh::$app['event.notification_settings']``.

By default, it is assumed that if an event is listed in ``Tygh::$app['event.events_schema']``, it requires notifications via all transports and to all receivers listed in the event description.

For further changes, use the notification settings page.

+++++++++++++++++++++
Notification Settings
+++++++++++++++++++++

Notification settings are configured under **Administration → Settings** (``notifications_settings.manage``) for the entire system. 

The settings are tables for every potential receiver of messages. If message delivery via the transport is described in the event schema for a certain receiver, then the intersection of transport column and event line will have a control element (checkbox).

Entities without control elements (for example, events without receivers, transports without events, receivers with events) will be hidden from the interface.

When changed, the rules from these table are saved to the database (``notification_settings``).

++++++++++++++++++++++++++++++
Overloading Notification Rules
++++++++++++++++++++++++++++++

This is a way to prevent sending event notifications, even when rules require that.

Rules are an object of the  ``\Tygh\Notifications\Settings\Ruleset`` class built by the factory of rules ``Tygh::$app['event.notification_settings.factory']``.

Rules are passed as one of the parameters when an event is triggered.

Example: the order editing page has checkboxes *Notify customer*, *Notify orders department*, and *Notify vendor*. They can prevent sending a message about order changes even if the notification rules explicitly demand that.

::

  Tygh::$app['event.dispatcher']->dispatch(
      'order.updated',
      $order_info,
      Tygh::$app['event.notification_settings.factory']->create([
          UserTypes::CUSTOMER => false,
          UserTypes::ADMIN    => true,
          UserTypes::VENDOR   => true,
      ])
  );

----------------------------
Changes to Security Settings
----------------------------

Previously, the *Enable secure connection for the storefront* setting (``settings_vendor_values``) accepted the following values:

* ``secure_storefront::none`` = Disable
* ``secure_storefront::partial`` = Secure profile, checkout and order pages
* ``secure_storefront::full`` = Secure full site

Now, global setting ``settings_vendor_values`` appears as a checkbox and has only 2 values — *secure connection enabled* (``Y``) and *secure connection disabled* (``N``).

Setting *Keep HTTPS connection once a secure page is visited* (``keep_https``) was removed.

Setting *Form is secure (SSL)* (``form_is_secure``) from the Form Builder (``form_builder``) add-on was removed. 

------------------
Changes to Caching
------------------

The ability to specify "time to live" (TTL) for cache regardless of ``cache_level`` was added.

Here is an example of registering cache with dependencies on database tables and limited time to live::

  Registry::registerCache(
      'products', 
      [
          'update_handlers' => ['products'], // The list of tables that cache depends on cache 
          'ttl' => 86400  // Time to live in seconds
      ], 
      Registry::cacheLevel('static')
  );

+++++++++++++++++++++++++++++++++++++++
Support of TTL in Block Manager Schemas
+++++++++++++++++++++++++++++++++++++++

The block manager schemas now allow you to set cache TTL.

To set TTL, use the ``ttl`` key in section ``cache`` of the block description. For example::

  'payment_methods' => [
      'content'   => [
          'items' => [
              'type'     => 'function',
              'function' => ['fn_get_payment_methods_images'],
          ],
      ],
      'templates' => 'blocks/payments.tpl',
      'wrappers'  => 'blocks/wrappers',
      'cache'     => [
          'ttl' => 86400  // Cache TTL in seconds
          'update_handlers' => ['payments', 'payment_descriptions'],
      ],
  ],

Cache TTL can be redefined depending on filling. For example::

  'products' => [
      'content'   => [
          'items' => [
              'type'           => 'enum',
              'object'         => 'products',
              'items_function' => 'fn_get_products',
              'fillings'       => [
                  /* ... */
                  'most_popular'    => [
                      'params'    => [
                          'popularity_from' => 1,
                          'sort_by'         => 'popularity',
                          'sort_order'      => 'desc',
                          'request'         => [
                              'cid' => '%CATEGORY_ID'
                          ]
                      ],
                      'cache_ttl' => SECONDS_IN_DAY // Cache TTL in seconds
                  ],
              ],
          ],
      ],
      /* ... */
      'cache'     => [/* ... */]
  ],

---------------------------------------------------
Updating categories in fn_update_product_categories
---------------------------------------------------

Starting with version 4.11.1, the data returned by function ``fn_update_product_categories`` may include the identifiers of the newly-added categories.

=========
Functions
=========

-----------
New Classes
-----------

#. ``\Tygh\Enum\ProductFilterProductFieldTypes``—contains product properties that can be used for product filters.

#. ``\Tygh\Enum\ObjectStatuses``—contains standard statuses of different objects: orders, products, etc.

#. ``\Tygh\Notifications\EventDispatcher``—provides the event dispatcher functionality.

#. ``\Tygh\Notifications\EventIdProviders\IProvider``—describes the provider of a unique identifier of the message.

#. ``\Tygh\Notifications\EventIdProviders\OrderProvider``— provides the means to distinguish order-based notification events.

#. ``\Tygh\Notifications\Messages\IMessage``—describes an event message.

#. ``\Tygh\Notifications\Messages\InternalMessage``—implements Notifications center message.

#. ``\Tygh\Notifications\Messages\MailMessage``—implements a message that is sent via MailTransport.

#. ``\Tygh\Notifications\Messages\Order\EdpMailMessage``—represents a message about donwloadable files.

#. ``\Tygh\Notifications\Messages\Order\OrderAdminMailMessage``—represents a message that is sent to administrator or vendor on an order status change.

#. ``\Tygh\Notifications\Messages\Order\OrderCustomerMailMessage``—represents a message that is sent to the customer on an order status change.

#. ``\Tygh\Notifications\Messages\Order\ShipmentCustomerMailMessage``—represents a message that is sent to the customer on an order shipment update.

#. ``\Tygh\Notifications\Settings\Factory``—creates notification settings rulesets.

#. ``\Tygh\Notifications\Settings\Ruleset``—provides the means to manually set notification settings for specific transports and receivers.

#. ``\Tygh\Notifications\Transports\ITransport``—describes a transport that processes event messages.

#. ``\Tygh\Notifications\Transports\InternalTransport``—implements a transport that creates notifications in the Notification center based on an event message.

#. ``\Tygh\Notifications\Transports\MailTransport``—implements a transport that send emails based on an event message.

#. ``\Tygh\Notifications\Transports\ITransportFactory``—describes a factory that creates notification transports.

#. ``Tygh\Notifications\Transports\TransportFactory``—implements a transport factory that loads transports from the application container.

#. ``\Tygh\Addons\Suppliers\Notifications\Messages\SupplierMailMessage``—represents a message that is sent to a supplier on an order status change.

#. ``\Tygh\Addons\GiftCertificates\Notifications\Messages\CustomerMailMessage``—represents a message that is sent to the customer on a gift certificate status change.

#. ``\Tygh\Addons\VendorDataPremoderation\Notifications\Messages\PremoderationMailMessage``—represents a message that is sent to a vendor via email on product approval/disapproval.

#. ``\Tygh\Addons\VendorDataPremoderation\Notifications\Messages\PremoderationInternalMessage``—represents a message that is sent to a vendor by the Notifications center on product approval/disapproval.

#. ``\Tygh\Storefront\RelationsManager``—provides lazy-loading functionality for storefronts.

#. ``\Tygh\Addons\VendorDataPremoderation\Comparator``—checks objects for changes that require premoderation.

#. ``\Tygh\Addons\VendorDataPremoderation\Diff``—stores a set of changed object data sources.

#. ``\Tygh\Addons\VendorDataPremoderation\PremoderationSchema``—represents a set of object premoderation rules.

#. ``\Tygh\Addons\VendorDataPremoderation\PremoderationSettingsInterface``—describes a structure of the premoderation settings storage.

#. ``\Tygh\Addons\VendorDataPremoderation\ProductPremoderationSettings``—checks whether the fields configured via the "Require approval for updates of" add-on setting require premoderation.

#. ``\Tygh\Addons\VendorDataPremoderation\State``—stores an object state collected from multiple data sources.

#. ``\Tygh\Addons\VendorDataPremoderation\StateFactory``—loads object states.

-------------
New Functions
-------------

#. Check if a promotion has a coupon code condition::

     fn_promotion_has_coupon_condition($conditions_group)

#. Get product statuses to show in the status picker on the product management pages::

     fn_get_product_statuses($status, $add_hidden = false, $lang_code = CART_LANGUAGE)

#. Get product statuses to show in the status picker on the product search form::

     fn_get_all_product_statuses($lang_code = CART_LANGUAGE)

#. Get the IDs of companies that own specified products::

     fn_get_company_ids_by_product_ids(array $product_ids)

#. Obtain vendor's root admin or the first admin if root is not found::

     fn_get_company_admin_user_id($company_id)

#. Approve products::

     fn_vendor_data_premoderation_approve_products(array $product_ids, $update_product = true)

#. Disapprove products::

     fn_vendor_data_premoderation_disapprove_products(array $product_ids, $update_product = true, $reason = '')

#. Request approval for products::

     fn_vendor_data_premoderation_request_approval_for_products(array $product_ids, $update_product = true)

#. Get current product statuses::

     fn_vendor_data_premoderation_get_current_product_statuses(array $product_ids)

#. Check whether product data was changed and its validation is required::

     fn_vendor_data_premoderation_is_product_changed(State $initial_state, State $resulting_state)

#. Get products premoderation details::

     fn_vendor_data_premoderation_get_premoderation($product_ids)

#. Update product premoderation details::

     fn_vendor_data_premoderation_update_premoderation($product_id, $original_status, $reason = '')

#. Delete product premoderation details::

     fn_vendor_data_premoderation_delete_premoderation($product_ids)

#. Check whether a product changed by a company requires prior approval::

     fn_vendor_data_premoderation_product_requires_approval(array $company_data, $is_created = false)

#. Remove add-on files::

     fn_remove_addon_files($addon, $ftp_access = null)

#. Remove files by FTP::

     fn_rm_by_ftp($target, array $ftp_access)

#. Check whether a theme that was set for the storefront is installed::

     \Tygh\Storefront\Repository::isThemeInstalled($storefront_id, $theme_name)

#. Get storefronts with a specific layout assigned to::

     \Tygh\Storefront\Repository::findByLayoutId($layout_id, $get_single = true)

#. Set a theme for the storefront::

     \Tygh\Storefront\Repository::setTheme($storefront_id, $theme_name)

#. Check whether the theme is installed for the storefront::

     \Tygh\Themes\Themes::isInstalled($storefront_id)

#. Install a theme for the storefront::

     \Tygh\Storefront\Repository::installTheme($storefront_id, $theme_name, $copy_layouts_from_storefront_id = null)

#. Create or update a gift certificate::

     fn_update_gift_certificate($data, $id = 0, $params = [])

#. Check whether there are multiple storefronts related to the same object::

     \Tygh\Storefront\Repository::getSharingDetails(array $params)

#. Get the value of the related entity::

     \Tygh\Storefront\Storefront::getRelationValue($relation_name)

#. Set the value of the related entity::

     \Tygh\Storefront\Storefront::setRelationValue($relation_name, $value)

#. Remove a relation value from set::

     \Tygh\Storefront\Storefront::removeRelationValues($relation_name, $removed_values)

#. Add a relation value to set::

     \Tygh\Storefront\Storefront::addRelationValues($relation_name, $added_values)

#. Add a new record to the robots_data table::

     \Tygh\Common\Robots::addRobotsDataForNewStorefront($storefront_id, $clone_storefront_id = null)

#. Get robots data for specified storefront::

     \Tygh\Common\Robots::getRobotsDataByStorefrontId($storefront_id)

#. Set a new robots data for specified storefront::

     \Tygh\Common\Robots::setRobotsDataForStorefrontId($storefront_id, $content)

#. Delete robots data for specified storefront::

     \Tygh\Common\Robots::deleteRobotsDataByStorefrontId($storefront_id)

#. Gets all rules about notifications from database::

     fn_get_notification_settings()

#. Set a rule about notification to database::

     fn_set_notification_settings($event_id, $transport_id, $receiver, $allowed = 1)

#. Get the amount of product for the specified warehouse::

     \Tygh\Addons\Warehouses\ProductStock::getAmountForWarehouse($warehouse_id)

#. Set amount of product on specified warehouse::

     \Tygh\Addons\Warehouses\ProductStock::setAmountForWarehouse($warehouse_id, $amount)

#. Generate the sitemap of a storefront::

     fn_google_sitemap_generate_sitemap_for_storefront(Storefront $storefront, array $settings)

#. Get the full path to the directory where the sitemap is stored::

     fn_google_sitemap_get_sitemap_dir($storefront_id)

#. Get the full path to the sitemap file::

     fn_google_sitemap_get_sitemap_path($storefront_id, $index = null)

#. Get the list of languages to generate sitemap for::

     fn_google_sitemap_get_sitemap_languages(Storefront $storefront)

#. Get the list of storefronts to generate sitemap for::

     fn_google_sitemap_get_storefronts()

#. Recreate a directory to store sitemaps in::

     fn_google_sitemap_recreate_sitemap_dir($storefront_id)

#. Create an index file for generated sitemaps::

     fn_google_sitemap_create_sitemap_index(Storefront $storefront, $last_modified_time, $file_counter)

#. Return storefront ID if it is present in $uri, otherwise return ``false``::

     fn_get_storefront_id_from_uri($uri)

#. Generate a one-time password for user::

     fn_user_generate_otp($user_id, $ttl = 300)

#. Generate a one-time password and send it to user::

     fn_user_send_otp($user_id, $ttl = 300)

#. Verify the one-time password::

     fn_user_verify_otp($user_id, $password)

#. Delete user's one-time password::

     fn_user_delete_otp($user_id)

#. Sign user in by one-time password::

     fn_user_login_by_otp($user_id, $password)

#. Delete ekey by params::

     fn_delete_ekey($ekey, $object_type = null, $object_id = null)

#. Get the currently selected view identifier::

     \Tygh\Navigation\LastView\Backend::getCurrentViewId()

#. Get product state::

     fn_vendor_data_premoderation_get_product_state($product_id)

-----------------
Changed Functions
-----------------

#.

   ::

     // Old:
     fn_uninstall_addon($addon_name, $show_message = true, $allow_unmanaged = false);

     // New:
     fn_uninstall_addon($addon_name, $show_message = true, $allow_unmanaged = false, $execute_schema_queries = true);


#.

   ::

     // Old:
     \Tygh\Providers\StorefrontProvider::__construct()

     // New:
     \Tygh\Providers\StorefrontProvider::__construct($url, array $request = [])



#.

   ::

     // Old:
     Tygh\Storefront\Factory::__construct(Connection $db, DataLoader $data_loader, Normalizer $normalizer)

     // New:
     Tygh\Storefront\Factory::__construct(Connection $db, RelationsManager $relations_manager, Normalizer $normalizer)


#.

   ::

     // Old:
     Tygh\Storefront\Repository::__construct(Connection $db, Factory $factory, Normalizer $normalizer)

     // New:
     Tygh\Storefront\Repository::__construct(Connection $db, Factory $factory, Normalizer $normalizer, RelationsManager $relation_manager, Robots $robots)


#.

   ::

     // Old:
     \Tygh\Storefront\Storefront::__construct$storefront_id, $url, $is_default, $redirect_customer, $status, $access_key, DataLoader $data_loader, $country_codes = null, $company_ids = null, $currency_ids = null, $language_ids = null)

     // New:
     \Tygh\Storefront\Storefront::__construct$storefront_id, $url, $is_default, $redirect_customer, $status, $access_key, RelationsManager $relation_manager, $name, $theme_name, array $relations = [])


#.

   ::

     // Old:
     fn_order_notification(&$order_info, $edp_data = array(), $force_notification = array())

     // New:
     fn_order_notification(&$order_info, $edp_data = array(), $force_notification = array(), $event_id = null)


#.

   ::

     // Old:
     function fn_google_sitemap_generate_link($object, $value, $languages, $extra = [])

     // New:
     function fn_google_sitemap_generate_link($type, $id, $languages, $extra = [], $storefront_id = null)


#.

   ::

     // Old:
     function fn_google_sitemap_generate_link($object, $value, $languages, $extra = [])

     // New:
     function fn_google_sitemap_generate_link($type, $id, $languages, $extra = [], $storefront_id = null)


#.

   ::

     // Old:
     function fn_google_sitemap_get_content($map_page = 0)

     // New:
     function fn_google_sitemap_get_content()


#.

   ::

     // Old:
     function fn_google_sitemap_check_counter(&$file, &$link_counter, &$file_counter, $links, $header, $footer, $type)

     // New:
     function fn_google_sitemap_check_counter(&$file, &$link_counter, &$file_counter, $links, $header, $footer, $type, Storefront $storefront)


#.

   ::

     // Old:
     function fn_delete_user_cart($user_ids, $data = '')

     // New:
     function fn_delete_user_cart($user_ids, $data = '', $storefront_id = 0)


#.

   ::

     // Old:
     fn_form_cart_from_abandoned($customer_id)

     // New:
     fn_form_cart_from_abandoned($params)


#.

   ::

     // Old:
     fn_get_available_shippings($company_id = null)

     // New:
     fn_get_available_shippings($company_id = null, $get_service_params = false)


#.

   ::

     // Old:
     fn_generate_ekey($object_id, $type, $ttl = 0, $ekey = '')

     // New:
     fn_generate_ekey($object_id, $type, $ttl = 0, $ekey = '', array $data = [])


#.

   ::

     // Old:
     \Tygh\Navigation\LastView\ACommon::__construct($area = AREA)

     // New:
     \Tygh\Navigation\LastView\ACommon::__construct($area = AREA, $controller = null, $mode = null, $action = null)


.. _4111-storefront-dependent-functions:

++++++++++++++++++++++++++++++
Storefront-Dependent Functions
++++++++++++++++++++++++++++++

#.

   ::

     // Old:
     \Tygh\BlockManager\Exim::instance($company_id = 0, $layout_id = 0, $theme_name = '')

     // New:
     \Tygh\BlockManager\Exim::instance($company_id = 0, $layout_id = 0, $theme_name = '', $storefront_id = null)


#.

   ::

     // Old:
     \Tygh\BlockManager\Layout::copy($to_company_id)

     // New:
     \Tygh\BlockManager\Layout::copy($to_company_id, $to_storefront_id = null)



#.

   ::

     // Old:
     \Tygh\BlockManager\Layout::instance($company_id = 0, $params = [])

     // New:
     \Tygh\BlockManager\Layout::instance($company_id = 0, $params = [], $storefront_id = null)


#.

   ::

     // Old:
     \Tygh\Less::parseUrls($content, $from_path, $to_path, $area = AREA)

     // New:
     \Tygh\Less::parseUrls($content, $from_path, $to_path, $area = AREA, $storefront_id = null)


#.

   ::

     // Old:
     \Tygh\SmartyEngine\Core::setArea($area, $area_type = '', $company_id = null)

     // New:
     \Tygh\SmartyEngine\Core::setArea($area, $area_type = '', $company_id = null, $storefront_id = null)


#.

   ::

     // Old:
     \Tygh\Themes\Themes::areaFactory($area = AREA, $company_id = null)

     // New:
     \Tygh\Themes\Themes::areaFactory($area = AREA, $company_id = null, $storefront_id = null)


#.

   ::

     // Old:
     fn_get_theme_path($path = '[theme]/', $area = AREA, $company_id = null, $use_cache = true)

     // New:
     fn_get_theme_path($path = '[theme]/', $area = AREA, $company_id = null, $use_cache = true, $storefront_id = null)

#.

   ::

     // Old:
     fn_install_theme($theme_name, $company_id = null, $install_layouts = true)

     // New:
     fn_install_theme($theme_name, $company_id = null, $install_layouts = true, $storefront_id = null)

#.

   ::

     // Old:
     fn_get_logos($company_id = null, $layout_id = null, $style_id = null)

     // New:
     fn_get_logos($company_id = null, $layout_id = null, $style_id = null, $storefront_id = null)

#.

   ::

     // Old:
     fn_update_logo($logo_data, $company_id = null)

     // New:
     fn_update_logo($logo_data, $company_id = null, $storefront_id = null)

#.

   ::

     // Old:
     fn_clone_layouts($data, $company_id, $to_company_id)

     // New:
     fn_clone_layouts($data, $company_id, $to_company_id, $storefront_id = null, $to_storefront_id = null)

#.

   ::

     // Old:
     \Tygh\BlockManager\Block::instance($company_id = 0, $params = [])

     // New:
     \Tygh\BlockManager\Block::instance($company_id = 0, $params = [], $storefront_id = null)

#.

   ::

     // Old:
     \Tygh\BlockManager\Block::copy($snapping_ids, $company_id, $replace_duplicates = false, $storefront_id = null)

     // New:
     \Tygh\BlockManager\Block::copy($snapping_ids, $company_id, $replace_duplicates = false)

#.

   ::

     // Old:
     \Tygh\BlockManager\Block::findDuplicate($block_id, $type, $properties, $name, $content, $lang_code = CART_LANGUAGE)

     // New:
     \Tygh\BlockManager\Block::findDuplicate($block_id, $type, $properties, $name, $content, $lang_code = CART_LANGUAGE, $storefront_id = null)

#.

   ::

     // Old:
     \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name, $content = '')

     // New:
     \Tygh\BlockManager\Exim::getUniqueBlockKey($type, $properties, $name, $content = '', $storefront_id = null)

--------------------
Deprecated Functions
--------------------

#. Function ``fn_change_approval_status`` is deprecated. Instead, please use:

   * ``fn_vendor_data_premoderation_approve_products``

   * ``fn_vendor_data_premoderation_disapprove_products``

   * ``fn_vendor_data_premoderation_request_approval_for_products``

#. Function ``fn_order_notification`` is deprecated. Please use the ``Tygh::$app['event.dispatcher']`` service for sending messages.

#. Function ``fn_gift_certificate_notification`` is deprecated. Please use the ``Tygh::$app['event.dispatcher']`` service for sending messages.

-----------------
Removed Functions
-----------------

* ``fn_init_store_params_by_host``
* ``\Tygh\Common\Robots::addRobotsDataForNewCompany``
* ``\Tygh\Common\Robots::getRobotsDataByCompanyId``
* ``\Tygh\Common\Robots::setRobotsDataForCompanyId``
* ``\Tygh\Common\Robots::deleteRobotsDataByCompanyId``

---------------
Removed Classes
---------------

Class ``\Tygh\Storefront\DataLoader`` removed. Please use ``\Tygh\Storefront\RelationsManager`` instead.

=====
Hooks
=====

---------
New Hooks
---------

#. This hook is executed after filter style has been determined by the filter data for Storefront REST API. The hook allows you to modify the detected filter style::

     fn_set_hook('storefront_rest_api_get_filter_style_post', $filter, $filter_style, $field_type);

#. This hook is executed after the options of a specific price list are fetched::

     fn_set_hook('yml_export_get_options_post', $price_id, $options);

#. This hook allows you to perform actions before image pairs are updated::

     fn_set_hook('update_image_pairs_pre', $icons, $detailed, $pairs_data, $object_id, $object_type, $object_ids, $update_alt_desc, $lang_code, $from_exist_pairs);

#. This hook allows you to change image import parameters before import::

     fn_set_hook('exim_import_images_pre', $prefix, $image_file, $detailed_file, $position, $type, $object_id, $object, $import_options, $perform_import);

#. This hook is executed before Last View Tools initialized. The hook allows you to modify request parameters::

     fn_set_hook('last_view_init_view_tools_pre', $this, $params);

#. This hook is executed when an object status changes, right before the status is updated in the database. The hook allows you to change the saved data::

     fn_set_hook('tools_update_status_before_query', $params, $old_status, $status_data, $condition);

#. This hook is executed after the list of product statuses is obtained. The hook allows you to add or remove product statuses from the list::

     fn_set_hook('get_product_statuses_post', $status, $add_hidden, $lang_code, $statuses);

#. This hook is executed after the list of product statuses is obtained. The hook allows you to add or remove product statuses from the list::

     fn_set_hook('get_all_product_statuses_post', $lang_code, $statuses);

#. This hook is executed before products are approved. The hook allows you to change the list of approved product IDs::

     fn_set_hook('vendor_data_premoderation_approve_products_pre', $product_ids, $update_product);

#. This hook is executed before products are disapproved. The hook allows you to change the list of disapproved product IDs::

     fn_set_hook('vendor_data_premoderation_disapprove_products_pre', $product_ids, $update_product, $reason);

#. This hook is executed before product approval is requested. The hook allows you to change the list of moderated product IDs::

     fn_set_hook('vendor_data_premoderation_request_approval_for_products_pre', $product_ids, $update_product);

#. This hook is executed before an instance of the layout export/import manager is obtained. The hook allows you to modify the parameters passed to the function::

     fn_set_hook('exim_instance_pre', $company_id, $layout_id, $theme_name, $storefront_id);

#. This hook is executed before an instance of the layout manager is obtained. The hook allows you to modify the parameters passed to the function::

     fn_set_hook('layout_instance_pre', $company_id, $params, $storefront_id);

#. This hook is executed before a theme factory for the site area is obtained. The hook allows you to modify the parameters passed to the function::

     fn_set_hook('themes_area_factory_pre', $area, $company_id, $storefront_id);

#. This hook is executed before theme installation. The hook allows you to modify parameters passed to the function::

     fn_set_hook('install_theme_pre', $theme_name, $company_id, $install_layouts, $storefront_id);

#. This hook is executed before an instance of a block manager is obtained. The hook allows you to modify the parameters passed to the function::

     fn_set_hook('block_instance_pre', $company_id, $params, $storefront_id);

#. This hook is executed after an order is created in the administration panel. The hook allows you to perform additional actions and modify returned results::

     fn_set_hook('place_order_manually_post', $cart, $params, $customer_auth, $action, $issuer_id, $force_notification, $order_info, $edp_data, $is_order_placed_notification_required);

#. This hook is executed after order details are updated in the admin panel. The hook allows you to perform additional actions like sending notifications::

     fn_set_hook('update_order_details_post', $params, $order_info, $edp_data, $force_notification);

#. This hook is executed when during a sitemap entry link generation. The hook allows you to generate link for custom sitemap entries::

     fn_set_hook('google_sitemap_generate_link_get_object_link', $type, $id, $languages, $extra, $storefront_id);

#. This hook is executed after a sitemap for the storefront has been created. The hook allows you to write additional items into the sitemap::

     fn_set_hook('google_sitemap_generate_sitemap_for_storefront_after_items', $storefront, $settings, $file, $last_modified_time, $link_counter, $file_counter);

#. This hook is executed after store location has been deleted. The hook modifies deletion results and allow you to delete the corresponding data::

     fn_set_hook('store_locator_delete_store_location_post', $store_location_id, $affected_rows, $deleted);

#. This hook is executed before store location is selected. The hook allows you to modify the condition or joins of the selection::

     fn_set_hook('store_locator_get_store_location_before_select', $store_location_id, $lang_code, $fields, $join, $condition);

#. This hook is executed after store location has been updated. The hook allows you to update the data::

     fn_set_hook('store_locator_update_store_location_post', $store_location_data, $store_location_id, $lang_code);

#. This hook is executed after a rate area has been updated. The hook allows you to modify the data returned by the function::

     fn_set_hook('update_destination_post', $data, $destination_id, $lang_code);

#. This hook is executed after rate areas have been removed. The hook allows you to clean up any associated data::

     fn_set_hook('delete_destinations_post', $destination_ids);

#. This hook is executed before promotions are fetched. The hook allows you to modify the parameters passed to the function::

     fn_set_hook('get_promotions_pre', $params, $items_per_page, $lang_code);

#. This hook allows you to override the parameters of the selection of blocks::

     fn_set_hook('get_blocks', $params, $items_per_page, $lang_code, $fields, $sortings, $conditions, $joins);

#. This hook is executed after the store location is obtained. The hook allows you to modify the location data::

     fn_set_hook('store_locator_get_store_location_post', $store_location_id, $lang_code, $store_location);

#. This hook is executed during creation or updating a store location, right before the location data is stored in the database. The hook allows you to modify the saved location data::

     fn_set_hook('store_locator_update_store_location_before_update', $store_location_data, $store_location_id, $lang_code);

#. This hook is executed before product files are deleted. The hook allows you to check product files before deletion::

     fn_set_hook('delete_product_files_before_delete', $file_ids, $product_id);

#. This hook is executed before product file folders are deleted. The hook allows you to check product folders and files before deletion::

     fn_set_hook('delete_product_file_folders_before_delete', $folder_ids, $file_ids, $product_id);

#. This hook is executed before product file is updated. The hook allows you to change product file data::

     fn_set_hook('update_product_file_pre', $product_file, $file_id, $lang_code);

#. This hook is executed when the variants of the "Require approval for updates of" setting of a product for the Vendor Data Premoderation add-on are obtained. The hook allows you to add new variants or modify the existing ones::

     fn_set_hook('settings_variants_addons_vendor_data_premoderation_product_premoderation_fields_post', $variants);

-------------
Changed Hooks
-------------

#.

   ::

     // Old:
     fn_set_hook('get_theme_path_pre', $path, $area, $company_id, $theme_names);

     // New:
     fn_set_hook('get_theme_path_pre', $path, $area, $company_id, $theme_names, $use_cache, $storefront_id);

#.

   ::

     // Old:
     fn_set_hook('get_logos_pre', $company_id, $layout_id, $style_id);

     // New:
     fn_set_hook('get_logos_pre', $company_id, $layout_id, $style_id, $storefront_id);

#.

   ::

     // Old:
     fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id);

     // New:
     fn_set_hook('update_product_categories_post', $product_id, $product_data, $existing_categories, $rebuild, $company_id, $saved_category_ids);

#.

   ::

     // Old:
     fn_set_hook('get_store_locations_before_select', $params, $fields, $joins, $conditions);

     // New:
     fn_set_hook('get_store_locations_before_select', $params, $fields, $joins, $conditions, $sortings, $items_per_page, $lang_code);

#.

   ::

     // Old:
     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition);

     // New:
     fn_set_hook('get_available_shippings', $company_id, $fields, $join, $condition, $get_service_params);

#.

   ::

     // Old:
     fn_set_hook('get_product_files_before_select', $params, $fields, $join, $condition);

     // New:
     fn_set_hook('get_product_files_before_select', $params, $fields, $join, $condition, $sortings, $lang_code);

----------------
Deprecated Hooks
----------------

#. Hook ``change_approval_status_pre`` is deprecated. Instead, please use: 

   * ``vendor_data_premoderation_approve_products_pre``

   * ``vendor_data_premoderation_disapprove_products_pre``

   * ``vendor_data_premoderation_request_approval_for_products_pre``

#. Hooks ``send_order_notification`` and ``order_notification`` are deprecated. Instead, please use:

   * ``place_order_manually_post``

   * ``update_order_details_post``

   * ``change_order_status_post``

#. Hook ``sitemap_link_object`` is deprecated. Please use ``google_sitemap_generate_link_get_object_link`` instead.

#. Hook ``sitemap_link`` is deprecated. Please use ``google_sitemap_generate_link_post`` instead.

#. Hook ``sitemap_item`` is deprecated. Please use ``google_sitemap_generate_sitemap_for_storefront_after_items`` instead.
