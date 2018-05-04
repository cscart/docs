**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.7.4
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed after a call request has been created::

     fn_set_hook('call_requests_do_call_request_post', $params, $product_data, $cart, $auth, $result);

#. This hook is executed after a newsletter subscriber has been updated::

     fn_set_hook('newsletters_update_subscriptions_post', $subscriber_id, $user_list_ids, $subscriber, $params);

#. This hook is executed after the product subscription update has been processed::

     fn_set_hook('update_product_notifications_post', $data, $subscribed, $deleted);

#. This hook is executed when processing options (settings) of an export/import pattern (a patters in a set of fields and settings of the export/import)::

     fn_set_hook('exim_get_pattern_definition_options', $pattern_id, $get_for, $extra, $option_id, $option_data, $schema);

==============
Core Functions
==============

-------------
New Functions
-------------

Check the total of the specified order against the session's order total to make sure that the order was placed properly::

  fn_paypal_order_total_is_correct($order_id)

-----------------
Changed Functions
-----------------

::

  // Old:
  function fn_recover_password_generate_key($user_email, $notify = true)
  // New:
  function fn_recover_password_generate_key($user_email, $notify = true, $company_id = '', $area = AREA)
