**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.8
**********************************************

==============
Common Changes
==============

MaxMind's GeoIP country database was updated to the latest version (used by the ``fn_get_country_by_ip()`` function).

============
Hook Changes
============

---------
New Hooks
---------

1. This hook is executed right before usergroups are fetched, allowing you to modify the SQL query::

     fn_set_hook('get_usergroups', $params, $lang_code, $field_list, $join, $condition, $group_by, $order_by, $limit);

2. This hook is executed at the beginning of the ``fn_get_discussions`` function, allowing you to modify the arguments passed to the function::

     fn_set_hook('get_discussions_pre', $params, $items_per_page);

3. This hook is executed right before discussions are fetched, allowing you to modify the SQL query::

     fn_set_hook('get_discussions', $params, $items_per_page, $fields, $join, $condition, $sorting, $limit); 

4. This hook is executed after all discussions are fetched from the database and all data post-processing is done::

     fn_set_hook('get_discussions_post', $params, $items_per_page, $posts);

5. This hook is executed at the beginning of the ``fn_get_discussion`` function, allowing you to modify the arguments passed to the function::

     fn_set_hook('get_discussion_pre', $object_id, $object_type, $get_posts, $params);

6. This hook is executed right before a discussion is fetched, allowing you to modify the SQL query::
 
     fn_set_hook('get_discussion_before_sql', $object_id, $object_type, $get_posts, $params, $field_list, $join, $condition, $order_by, $limit);

7. This hook is executed after a discussion is fetched from the database and all data post-processing is done::

     fn_set_hook('get_discussion_post', $object_id, $object_type, $get_posts, $params, $discussion);

8. Is executed after feed items and properties are fetched from the DB and all data post-processing is done::

     fn_set_hook('generate_rss_feed', $items_data, $additional_data, $block_data, $lang_code);

9. This hook is executed at the beginning of a function, allowing you to modify the arguments passed to the function::

     fn_set_hook('update_product_feature_variant_pre', $feature_id, $feature_type, $variant, $lang_code);

10. This hook is executed after the identifier of a product feature variant is checked::

      fn_set_hook('update_product_feature_variant', $feature_id, $feature_type, $variant, $lang_code, $variant_id);

11. This hook is executed after a product feature variant is updated/inserted::

      fn_set_hook('update_product_feature_variant_post', $feature_id, $feature_type, $variant, $lang_code, $variant_id);

==============
Core Functions
==============

-------------
New Functions
-------------

1. Check if a file or directory is writable::

      fn_is_writable($file_path)

2. Get the current promotions of the order::

      fn_promotion_get_order_promotions($order_id)

3. Calculate the offset of the given timezone to the UTC timezone::

      \Tygh\Tools\DateTimeHelper::getTimeZoneOffsetString()

4. Set the given timezone as the PHP runtime timezone and as the current MySQL connection timezone::

      fn_init_time_zone()

5. Check whether the current URL's hostname is a subdomain of the given URL's hostname::

      \Tygh\Tools\Url::isSubDomainOf()
   
6. Prepare the RSS feed items and properties::

      fn_rssf_get_items($params, $lang_code = CART_LANGUAGE) 
 
7. Sanitize a filename, replacing special characters::

      \Tygh\Tools\SecurityHelper::sanitizeFileName($filename) 
 
-----------------
Changed Functions
-----------------

The list of store locations now uses location identifiers as array keys::

    fn_get_store_locations($params, $items_per_page = 0, $lang_code = CART_LANGUAGE) 

