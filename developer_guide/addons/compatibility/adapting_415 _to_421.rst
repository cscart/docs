===================================
Adapt Your Add-Ons To CS-Cart 4.2.1 
===================================

Familiarize yourself with the list of changes that can affect your add-ons operation when updating from 4.1.5 to 4.2.1 version.

They are not so numerous, but some of them affected CS-Cart functionality rather heavily.

Here is the list of main changes

--------------------------------------------------------------------------------------------------------------------

New **Responsive** theme was added. You should check your add-ons design with the new theme and adapt it if needed.

--------------------------------------------------------------------------------------------------------------------

**SEO**

Because of the fact that the SEO add-on was highly modified (see the list of changes in our blog), PHP functions were changed too. 
If your add-on works with the SEO functionality, check it.

As for hooks, here is the list of added, removed, and modified hooks:

Removed:

*	``seo_static_cache``
*	``seo_empty_object_name``

Changed:

*	``get_seo_vars``
*	``get_rewrite_rules``
*	``seo_is_indexed_page``
*	``seo_url``

For more information open:
`http://www.cs-cart.com/index.php?dispatch=hooks_base.manage&ver=4.2.1RC#238973 <http://www.cs-cart.com/index.php?dispatch=hooks_base.manage&ver=4.2.1RC#238973>`_

Choose "Compare with": "CS-Cart Lifetime License" "4.1.5" and click **Search**.

--------------------------------------------------------------------------------------------------------------------

**Languages**

PO files format was changed.

Old:

.. code-block:: none

	#. Editing product
	msgctxt "Languages"
	msgid "editing_product"
	msgstr "Редактирование товара”

New:

.. code-block:: none

	msgctxt "Languages:tools_addons_restore_defaults"
	msgid "Restore defaults"
	msgstr "Восстановить стандартные настройки”

According to this, all PO files related functions were changed too.

---------------------------------------------------------------------------------------------------------------------

**Settings**

The following settings:

*	Enable secure connection at checkout
*	Enable secure connection in the administration panel
*	Enable secure connection for authentication, profile and orders pages
*	Keep HTTPS connection once a secure page is visited

were moved from the **General** section of the administration panel to **Security**.

.. code-block:: none

	settings.General.secure_checkout -> settings.Security.secure_checkout
	settings.General.keep_http -> settings.Security.keep_https
	settings.General.secure_admin -> settings.Security.secure_admin
	settings.General.secure_auth -> settings.Security.secure_auth

.. code-block:: none

	- Registry::get('settings.General.secure_checkout');
	+ Registry::get('settings.Security.secure_checkout');

Example:

.. code-block:: none

	$secure_admin_value = Registry::get('settings.Security.secure_admin');


Also the following settings changed their names:

.. code-block:: none

	save_selected_layout -> save_selected_view
	default_products_layout -> default_products_view
	default_products_layout_templates -> default_products_view_templates
	default_product_details_layout -> default_product_details_view

.. code-block:: none

	- Registry::get('settings.Appearance.save_selected_layout');
	+ Registry::get('settings.Appearance.save_selected_view');

---------------------------------------------------------------------------------------------------------------------

We have completely switched to HTML5. There is no more need in the following structure in JavaScript code:

.. code-block:: none

	//<![CDATA[
	...
	//]]>

----------------------------------------------------------------------------------------------------------------------

All the config variables with the resources paths were moved to ``$config['resources’]``.

.. code-block:: none

	$config['resources'] = array(
	'knowledge_base' => 'http://kb.cs-cart.com/installation',
	'updates_server' => 'http://updates.cs-cart.com',
	'twitter' => 'cscart',
	'feedback_api' => 'http://www.cs-cart.com/index.php?dispatch=feedback',
	'product_url' => 'http://www.cs-cart.com',
	'helpdesk_url' => 'http://www.cs-cart.com/helpdesk',
	'license_url' => 'http://www.cs-cart.com/licenses.html',
	'marketplace_url' => 'http://marketplace.cs-cart.com',
	'admin_protection_url' => 'http://kb.cs-cart.com/adminarea-protection',
	//'demo_store_url' => 'http://demo.cs-cart.com/' . strtolower(PRODUCT_EDITION) . '/'
	);

	$config['updates_server'] = 'http://updates.cs-cart.com'; //was left for now for the backward compatibility, but will be removed soon.

.. code-block:: none

	bad: Registry::get('config.updates_server’)
	good: Registry::get('config.resources.updates_server')

-------------------------------------------------------------------------------------------------------------------------

**Exim**

The ability to import Order items for a non-existing order was removed.

-------------------------------------------------------------------------------------------------------------------------

**Exim**

The ability to import language variables for a non-existing language was removed.

-------------------------------------------------------------------------------------------------------------------------

**Layouts: Blocks** 

The ``disable_cache`` flag for *fillings* was returned.
Now it is possible to disable cache for certain *fillings* values (when creating the *Random products* block, for example).

.. code-block:: none

	'products' => array (
	'content' => array (
	'items' => array (
	...

	'fillings' => array (
	'random_products' => array (
	'params' => array (
	'sort_by' => 'popularity',
	'sort_order' => 'desc',
	),
	'disable_cache' => true,
	),
	),

	...
	),
	),
	),

---------------------------------------------------------------------------------------------------------------------------------

Smarty was updated to the latest version (3.1.15 -> 3.1.18).

---------------------------------------------------------------------------------------------------------------------------------

The new helpful function was added:

.. code-block:: none

	+ /**
	+  * Gets company storefront URLs
	+  * @param integer $company_id company ID
	+  * @param array $company_data company data (if passed, company_id won't be used)
	+  * @return array storefront URLs
	+  */
	+ function fn_get_storefront_urls($company_id, $company_data = array())

----------------------------------------------------------------------------------------------------------------------------------

The ``is_permanent`` flag was added to the **fn_redirect** function. Now it is possible to create 301 redirects.

.. code-block:: none

	- function fn_redirect($location, $allow_external_redirect = false)
	+ function fn_redirect($location, $allow_external_redirect = false, $is_permanent = false)

---------------------------------------------------------------------------------------------------------------------------------

The ``PRODUCT_NAME`` constant was added.

---------------------------------------------------------------------------------------------------------------------------------

**Suppliers**

The ability to create a common shipping method for all suppliers was added.
The corresponding code was changed.

---------------------------------------------------------------------------------------------------------------------------------

If it is necessary to extend one add-on with another, now it is possible to select all hook functionality inside the add-on. For example, *news_and_emails* uses *seo*. Not to spread the *seo* functionality across all the *news_and_emails* functionality, it can be passed to a hook:

*design/backend/templates/addons/news_and_emails/addons/seo/hooks/*

The principles of working are the same as for the other hooks. One exception is that hooks from the *addons* catalog inside the *news_and_emails* add-on will be included only when the appropriate add-on is enabled (the *SEO* add-on in this example). 

The 3rd parameter was added for registering the php hooks::

	fn_register_hooks( array('get_news_data', '', 'seo') )

The name of a function processing a hook is **fn_seo_get_news_data**. It is called out when the **SEO** add-on is enabled.

.. note::

	All the described actions take place in the **News and emails** add-on.

----------------------------------------------------------------------------------------------------------------------------------

**Banners**

Now demo banners are always installed.

----------------------------------------------------------------------------------------------------------------------------------

The web configuration file for ISS servers was added (for *htaccess*).
Check the *var/conf/* directory.

----------------------------------------------------------------------------------------------------------------------------------

The ``instance`` method of the **Settings** class now allows to get settings of the defined company: 

.. code-block:: none

	- public static function instance()
	+ public static function instance($company_id = null)

------------------------------------------------------------------------------------------------------------------------------------

*htaccess* now allows to download the **.yml** and **.xml** files from the *var/* directory.

-------------------------------------------------------------------------------------------------------------------------------------

**Hooks**

.. code-block:: none

	- fn_set_hook('update_shipping_post', $shipping_data, $shipping_id, $lang_code);
	+fn_set_hook('update_shipping_post', $shipping_data, $shipping_id, $lang_code, $action);

--------------------------------------------------------------------------------------------------------------------------------------

We have added a new version of the **addon.xml** file:

.. code-block:: none

	<addon scheme="3.0">

So, all the add-ons which have XML v3, support PO-files with translations.