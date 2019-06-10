***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.10.2
***********************************************

==============
Common Changes
==============

A new field ``runtime.is_restoring_cart_from_backend`` was added. The ``Registry`` class uses it for all situations of restoring cart content when going from ``backend`` to ``frontend``. It accepts only the ``true`` value.

============
Hook Changes
============

---------
New Hooks
---------

This hook is executed before the user data is updated at checkout. It allows you to modify the user data::

  fn_set_hook('checkout_update_steps_before_update_user_data', $cart, $auth, $params, $user_id, $user_data);

==============
Core Functions
==============

-------------
New Functions
-------------

Copy the values for empty location fields in the specified section from the secondary section::

  \Tygh\Location\Manager::fillEmptyLocationFields(array $array, $primary_section)

-----------------
Changed Functions
-----------------

#.

  ::

    // Old:
    \Tygh\Location\Manager::storeLocation($update_profile = false)

    // New:
    \Tygh\Location\Manager::storeLocation()

#.

  ::

    // Old:
    \Tygh\Location\Manager::setLocationFromUserData(array $user_data, $update_profile = false)

    // New:
    \Tygh\Location\Manager::setLocationFromUserData(array $user_data)

#.

  ::

    // Old:
    fn_checkout_set_cart_profile_id(&$cart, $profile_id)

    // New:
    fn_checkout_set_cart_profile_id(&$cart, $auth, $profile_id)


#.

  ::

    // Old:
    \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

    // New:
    \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
