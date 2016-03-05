********************************************
Adapting a CS-Cart Store from 4.2.2 to 4.2.3
********************************************


The ability to define Global TTL (caching time) was added to the Redis cache:

.. code-block:: none

	$config['cache_redis_global_ttl'] = 1234;

Sessions
********

The following interface was removed:

*app/Tygh/Backend/Session/IBackend.php*

Use this abstract class instead of it:

*app/Tygh/Backend/Session/ABackend.php*

app/Tygh/BlockManager/Location.php
**********************************

Input parameters of the following function were changed:

Old:

.. code-block:: none

	public function update($location_data)

New:

.. code-block:: none

	public function update($location_data, $lang_code = DESCR_SL)

Old:

.. code-block:: none

	private function _updateDescription($location_id, $description)

New:

.. code-block:: none

	private function _updateDescription($location_id, $description, $lang_code = DESCR_SL)

Block manager: Render
*********************

There are quite many changes because of the following 2 improvements:

*	The possibility to drag-and-drop grids was added. Now it is possible to change a grid position.

*	Automatical adjustment of the grid size was added. This functionality activates when a grid is empty.

**Example:**

You have a grid with the *Filters* block and a grid with the *Main content* block. But there is no the *Filters* block on some pages. In this case a grid with the *Main content* block should be moved to the place of a grid with the *Filters* block.

So, the grid sorting and render code was changed.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The following class was changed:

*app/Tygh/CompanySingleton.php*

There are also changes in the instance creating methods and the ``getCompanyCondition`` method:


Old:

.. code-block:: none

	public static function instance($company_id = 0)

New:

.. code-block:: none

	public static function instance($company_id = 0, $params = array())


The following method was removed:

.. code-block:: none

	public function setCompany($company_id)

The app/Tygh/Http.php class
***************************

This class now can send the ``PUT`` and ``DELETE`` requests.

--------------------------------------------------------------------------------------------------------------

The **Live editor** was added. According to this, there is no more the **Translation mode** functionality.
Also, the language variables updating functionality was partly changed.

--------------------------------------------------------------------------------------------------------------

The following hooks were changed:

Old:

.. code-block:: none

	fn_set_hook('patterns_get_path', $path, $style_id);

New:

.. code-block:: none

	fn_set_hook('patterns_get_path', $this, $path, $style_id);

Old:

.. code-block:: none

	fn_set_hook('styles_get_list', $style_files, $params);

New:

.. code-block:: none

	fn_set_hook('styles_get_list', $this, $style_files, $params);

Old:

.. code-block:: none

	fn_set_hook('style_get_style_file', $path, $style_id, $type);

New:

.. code-block:: none

	fn_set_hook('styles_get_style_file', $this, $path, $style_id, $type);

Old:

.. code-block:: none

	fn_set_hook('get_user_info_before', $condition, $user_id, $user_fields);

New:

.. code-block:: none

	fn_set_hook('get_user_info_before', $condition, $user_id, $user_fields, $join);

---------------------------------------------------------------------------------------------------------------------

The new class *Tygh/Enum/ProductTracking* was added. It makes the product Inventory functionality understanding easier.

Old:

.. code-block:: none

	if ($product['tracking'] != 'D')

New:

.. code-block:: none

	if ($product['tracking'] != ProductTracking::DO_NOT_TRACK)

Now it is much more clear and readable.

Possible values:

*	``TRACK_WITHOUT_OPTIONS - 'O'``
*	``TRACK_WITH_OPTIONS - 'B'``
*	``DO_NOT_TRACK - 'D'``

Now it is not preferable to compare product tracking with letters and to use letters in the SQL requests.

Old:

.. code-block:: none

	$query .= db_quote(' AND ?:products.tracking = ?s', 'O');

New:

.. code-block:: none

	$query .= db_quote(' AND ?:products.tracking = ?s', ProductTracking::TRACK_WITHOUT_OPTIONS);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The **Hybrid Auth** (Social login) add-on was fully rewritten. If you extended its functionality, added new providers, or used hooks, check your code and adapt it to the changes, if necessary.

The lib itself was updated:

Old:

.. code-block:: none

	public static $version = "2.1.2";

New:

.. code-block:: none

	public static $version = "2.3.0-dev";

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The following constants were added:

*	``BILLING_ADDRESS_PREFIX``
*	``SHIPPING_ADDRESS_PREFIX``

Now instead of the following structure:

.. code-block:: none

	$user['b_address']

you should use:

.. code-block:: none

	$user[BILLING_ADDRESS_PREFIX . '_address']

Now it is little bit bulky but allows not use the ``b_`` and ``s_`` prefixes.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Jquery UI was updated:

Old:

.. code-block:: none

	/*! jQuery UI - v1.10.3 - 2013-11-29

New:

.. code-block:: none

	/*! jQuery UI - v1.11.1 - 2014-09-07

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Several disallowing rules were removed from **robots.txt**:

.. code-block:: none

	Disallow: /images/thumbnails/
	Disallow: /design/
	Disallow: /js/
	Disallow: /var/

Google recommends not to disallow scanning directories with Scripts and Styles.
