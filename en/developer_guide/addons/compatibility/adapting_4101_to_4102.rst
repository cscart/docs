***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.10.2
***********************************************

==============
Common Changes
==============

A new field ``runtime.is_restoring_cart_from_backend`` was added. The ``Registry`` class uses it for all situations of restoring cart content when going from ``backend`` to ``frontend``. It accepts only the ``true`` value.

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

::

  // Old:
  \Tygh\Location\Manager::getLocationField($array, $field, $default_value = null)

  // New:
  \Tygh\Location\Manager::getLocationField(($array, $field, $default_value = null, $primary_section = SHIPPING_ADDRESS_PREFIX)
