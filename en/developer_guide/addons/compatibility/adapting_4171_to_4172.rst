***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.17.2
***********************************************

.. contents::
    :backlinks: none
    :local:

==============
Common Changes
==============

-----------------------------
Changes in the Message center
-----------------------------

To increase the loading speed of the list of threads of the orders, a short order info is used `fn_get_order_short_info` in the `fn_vendor_communication_get_object` function, instead of the full order information `fn_get_order_info`.

============
Hook Changes
============

---------
New Hooks
---------

#. `fn_set_hook('load_products_features_variants_pre', $variation_products);` - Executes before loading features combinations variants for products, allows changing the contents of products as a result of finds variation products by product collections.
