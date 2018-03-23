**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.7.3
**********************************************

============
Hook Changes
============

---------
New Hooks
---------

This hook allows to change message parameters before creating the message object instance::

  fn_mve_mailer_create_message_before($mailer, $message, $area, $lang_code, $transport, $builder)

-------------
Changed Hooks
-------------

``fn_set_hook('send_mail_pre', $transport, $message, $area, $lang_code);`` is now deprecated and will be removed in version 5.x.x. Use **mailer_create_message_before** instead.

==============
Core Functions
==============

-------------
New Functions
-------------

Obfuscate sensitive data (card number and CVC/CVV2) in the payment information of orders::

  fn_batch_cleanup_payment_info(array $params = array())

---------------------------------------------
Changed Functions Specific to Russian Version
---------------------------------------------

::

  // old:
  \Tygh\Commerceml\RusEximCommerceml::setDataProductByOptions($product_id, $product_options, &$external_id, &$product_name)

  // new:
  \Tygh\Commerceml\RusEximCommerceml::setDataProductByOptions(&$product_id, $product_options, &$external_id, &$product_name)
