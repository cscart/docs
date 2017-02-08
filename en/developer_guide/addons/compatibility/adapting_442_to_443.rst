**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.4.3
**********************************************

==============
Common Changes
==============

1. The **PhpMailer** library was updated to version 5.2.22.

2. The **symfony/console** library was added as a core dependency.

3. The ability to upgrade a store via console was implemented:

   * Run an upgrade::
   
       php admin.php --dispatch=upgrade_center.console upgrade

   * Show instructions on how to use the command::

       php admin.php --dispatch=upgrade_center.console help upgrade
    
4. **Google reCAPTCHA** was integrated as a separate add-on.

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to modify the addresses used to form the URLs with the selected protocol in the admin and customer areas::

     fn_set_hook('url_set_locations', $url, $area, $protocol, $lang_code, $locations);

#. This hook is executed before any search SQL conditions are generated::

     fn_set_hook('get_products_search_conditions_pre', $params, $items_per_page, $lang_code, $search_text_fields_table_alias, $fields, $sortings, $condition, $join, $having);

#. This hook is executed before the package information is calculated. It allows you to modify the arguments passed to the function::

     fn_set_hook('shippings_get_package_info_pre', $group, $include_free_shipping);

#. This hook is executed right after cost, weight, amount of products and shipping freight for the package are calculated. It allows you to modify the data and to affect how products are distributed by boxes according to their shipping properties and the settings of a shipping method::

     fn_set_hook('shippings_get_package_info', $group, $include_free_shipping, $package_info);

#. This hook is executed right before returning package information, allowing you to modify it::

     fn_set_hook('shippings_get_package_info_post', $group, $include_free_shipping, $package_info, $package_groups);

-------------
Changed Hooks
-------------

::

  // old:
  fn_set_hook('fill_user_fields', $exclude);

  // new:
  fn_set_hook('fill_user_fields', $exclude, $user_data);

==============
Core Functions
==============

-------------
New functions
-------------

#. Get the name of the add-on by identifier::

     \Tygh\Addons\SchemesManager::getName($addon_id, $lang_code)

#. Calculate the offset of given time zone to UTC time zone in seconds::

     \Tygh\Tools\DateTimeHelper::getTimeZoneOffset($time_zone_name)

#. Return human-readable value of a setting::

     \Tygh\Settings::getValueReadable($setting_data, $value = null)

#. ``\Tygh\Web\Antibot`` class was added to integrate Google reCAPTCHA. It is available as 'antibot' application component (``Tygh::$app['antibot']``). Functions ``fn_image_verification()`` and ``fn_needs_image_verification()`` are using it internally now.

-----------------
Changed Functions
-----------------

#. ``\Tygh\Tools\DateTimeHelper::getTimeZoneOffsetString($time_zone_name)`` now returns **false** on failure.

#. ``fn_get_attachment($attachment_id)`` now returns **false**, if the attachment could not be obtained.

#.

   ::

     // old:
     \Tygh\UpgradeCenter\App::setNotification($type, $title, $message)

     // new:
     \Tygh\UpgradeCenter\App::setNotification($type, $title, $message, $message_state = '')
