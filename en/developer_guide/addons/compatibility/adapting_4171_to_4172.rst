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

To increase the loading speed of the list of threads for orders, the `fn_vendor_communication_get_object` function uses a short order information provided by `fn_get_order_short_info`, instead of the full order information from `fn_get_order_info`.


============
Hook Changes
============

---------
New Hooks
---------

#. `fn_set_hook('load_products_features_variants_pre', $variation_products);` - Executes before loading features variations and allows changing products's properties. 
