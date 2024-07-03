***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.18.2
***********************************************

.. contents::
    :backlinks: none
    :local:

============
Core changes
============

Added `google/auth`, `firebase/php-jwt`, `psr/cache` packages. 

.. important::

    Do not use them, they will be removed in the near future.

============
Hook changes
============


=========
New hooks
=========

#. Changes request params before store location cities selecting::

        `fn_set_hook('get_store_location_cities', $params, $condition);`
#. Executes before the request data is returned::

        `fn_set_hook('rus_online_cache_register_receipt_request_json_post', $this, $result, $receipt);` 
