*************************************
How To: Create Add-on Upgrade Package
*************************************

For example, let's take a simple add-on that adds several fields to a product and changes the products selection logic. It is called **Demo add-on** and has an id = "upgrade".

The add-on structure (*app/addons/*):

.. code-block:: none

	upgrade
	  +-- addon.xml
	  +-- func.php
	  L-- init.php

The basic *addon.xml* structure:

.. code-block:: none

	<?xml version="1.0"?>
	<addon scheme="3.0">
	    <id>upgrade</id>
	    <version>1.1</version>
	    <priority>100</priority>
	    <position>100</position>
	    <default_language>en</default_language>
	    <status>active</status>
	    <name>Demo upgrade add-on v1.1</name>
	    <description>This is description of the addon v1.1</description>
	</addon>

Several fields are also added to the ``cscart_products`` table:

.. code-block:: none

	<queries>
	    <item>ALTER TABLE `?:products` ADD `search_field` varchar(255) NOT NULL DEFAULT 'custom'</item>
	    <item for="uninstall">ALTER TABLE `?:products` DROP `search_field`</item>
	</queries>

Upgrade Connector
*****************

The first thing to do, is to create a connector. With its help Upgrade Center will connect to the upgrade server.

Create the following path: *app/addons/[ADDON_NAME]/Tygh/UpgradeCenter/Connectors/Upgrade/Connector.php*

In this example: *app/addons/upgrade/Tygh/UpgradeCenter/Connectors/Upgrade/Connector.php*

Connector must implement **IConnector** interface. Create the file header and basic functions:

.. code-block:: none

	namespace Tygh\UpgradeCenter\Connectors\Upgrade;// "Upgrage" - is an add-on name.
													// If your add-on has "my_changes" name, so namespace will look like:  ygh\UpgradeCenter\MyChanges
	use Tygh\UpgradeCenter\Connectors\IConnector as UCInterface;

	/**
	 * Core upgrade connector interface
	 */
	class Connector implements UCInterface
	{
	    /**
	     * Prepares request data for request to Upgrade server (Check for the new upgrades)
	     *
	     * @return array Prepared request information
	     */
	    public function getConnectionData()
	    {
	    }

	    /**
	     * Processes the response from the Upgrade server.
	     *
	     * @param  string $response              server response
	     * @param  bool   $show_upgrade_notice internal flag, that allows/disallows Connector displays upgrade notice (A new version of [product] available)
	     * @return array  Upgrade package information or empty array if upgrade is not available
	     */
	    public function processServerResponse($response, $show_upgrade_notice)
	    {
	    }

	    /**
	     * Downloads upgrade package from the Upgade server
	     *
	     * @param  array  $schema       Package schema
	     * @param  string $package_path Path where the upgrade pack must be saved
	     * @return bool   True if upgrade package was successfully downloaded, false otherwise
	     */
	    public function downloadPackage($schema, $package_path)
	    {
	    }
	}

First of all, let the Upgrade Center App know how to get information about new upgrades from the server. Implement the ``getConnectionData`` function.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

We will probably need the current add-on settings (license number or its current version, for example). It can be realized with the ``protected`` class variable ``$settings = array();`` and the ``__contruct()`` class method.

.. code-block:: none

	class Connector implements UCInterface
	{
	  protected $settings = array();

	  public function __construct()
	  {
	      // Initial settings
	      $addon_scheme = SchemesManager::getScheme('upgrade');

	      $this->settings = array(
	          'upgrade_server' => 'http://demo.cs-cart.com/index.php',
	          'addon_version' => $addon_scheme->getVersion()
	      );
	  }
	  // Other code
	}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The ``getConnectionData`` function does not take any parameters. It returns an array containing information about server access method, URL, and information to be sent to it (it is possible to specify headers additionaly). In the additional information of the request it is possible to specify any data (version, license, hash, etc.)

.. code-block:: none

	public function getConnectionData()
	{
	    $request_data = array(
	        'method' => 'get',
	        'url' => $this->settings['upgrade_server'], // We specified this setting before in the __construct method
	        'data' => array(
	            'dispatch' => 'updates.check',
	            'product_version' => PRODUCT_VERSION,
	            'edition' => PRODUCT_EDITION,
	            'product_build' => PRODUCT_BUILD,
	            'lang' => CART_LANGUAGE,
	            'addon_version' => $this->settings['addon_version'],
	            'some_custom_field' => TIME,
	            'hello' => 'world',
	            'super_secure_hash' => sha1(time()),
	        ),
	        'headers' => array(
	            'Content-type: text/xml'
	        )
	    );

	    return $request_data;
	}

Every time Upgrade Center checks for updates this function is processed. Upgrade Center makes a request to the server according to the received data and returns a response. Implement the response processing function ``processServerResponse``. At the beginning this function takes two parameters:

*	``$response`` - server response.
*	``$show_upgrade_notice`` - additional flag informing if we should show a notice in the new version.

It must return an array containg information about package (it will be described later).

The server returns a response in the XML format, for example:

.. code-block:: none

	<?xml version="1.0"?>
	<upgrade>
	    <available>Y</available>
	    <package>
	        <file>upgrade_from_1.1_to_1.2.tgz</file>
	        <name>Upgrade for the "Upgrade add-on" (from 1.1 to 1.2)</name>
	        <description>New version of the addon!

	            Changelog:
	            - PHP warning was displayed when calculating cart. Fixed.
	            - Taxes no longer available</description>
	        <from_version>1.1</from_version>
	        <to_version>1.2</to_version>
	        <timestamp>1412366886</timestamp>
	        <size>18123</size>
	        <custom_field>Hello CS-Cart</custom_field>
	        <my_sha_key>123</my_sha_key>
	    </package>
	</upgrade>

It will be processed as follows:

.. code-block:: none

	$parsed_data = array();
	$data = simplexml_load_string($response);

	if ((string) $data->available == 'Y') {
	    $parsed_data = array(
	        'file' => (string) $data->package->file, // Required field
	        'name' => (string) $data->package->name, // Required field
	        'description' => (string) $data->package->description, // Required field
	        'from_version' => (string) $data->package->from_version, // Required field
	        'to_version' => (string) $data->package->to_version, // Required field
	        'timestamp' => (int) $data->package->timestamp, // Required field
	        'size' => (int) $data->package->size, // Required field, size in bytes
	        'my_very_important_field' => (string) $data->package->my_sha_key,
	        'custom_field' => (string) $data->package->custom_field,
	    );

	    if ($show_upgrade_notice) {
	        fn_set_notification('W', __('notice'), __('text_upgrade_available', array(
	            '[product]' => 'Upgade add-on',
	            '[link]' => fn_url('upgrade_center.manage')
	        )), 'S');
	    }
	}

	return $parsed_data;

There is a set of mandatory and a set of additional fields. Additional ones could be used later, for example, to check on a file hash to make sure that it is not broken. Or make an additional add-on license validation, etc. A list of mandatory fields:

*	``file`` - the name of an archive with updates (later a file will have this name).
*	``name`` - the name of an update package. It will be displayed in the list of available upgrades in Upgrade Center.
*	``description`` - package description. It will be displayed in the list of available upgrades in Upgrade Center.
*	``from_version`` - version from what the upgrade is done.
*	``to_version`` - version to what the upgrade is done.
*	``timestamp`` - time of the upgrate package creation.
*	``size`` - package size in bytes.

Additional fields can be of any type and can contain any information.

After that Upgrade Center will create a scheme for the package and place it to *var/upgrades/packages/[ADDON_NAME]/schema.json*.

With this scheme Upgrade Center will download the upgrade package (it does not download it by default because the package can be very big).

To download a package, implenment the last interface function ``downloadPackage``. This function can take two values:

*	``$schema`` - package scheme that was saved before.
*	``$package_path`` - a path to the directory where a file should be saved.

An array with two values is returned. The first, boolean, is a result. The second is an additional value that will be displayed in case of falue.

.. code-block:: none

	return array(true, '');
	return array(false, __('sha_key_is_invalid'));

	public function downloadPackage($schema, $package_path)
	{
	    // Make some custom validation
	    if ($schema['my_very_important_field'] == '123' && !empty($schema['custom_field'])) {
	        $url_data = fn_get_url_data($this->settings['upgrade_server'] . '?dispatch=download&from_version=' . $schema['from_version']);

	        if (!empty($url_data)) {
	            $result = fn_copy($url_data['path'], $package_path);
	        } else {
	            $result = false;
	        }
	        $message = $result ? '' : __('failed');

	        return array($result, $message);
	    } else {
	        return array(false, __('sha_key_is_invalid'));
	    }
	}

Upgrade package
***************

Now we can transfer our upgrade packages. The next step is to create them. For example, in the new add-on version we fixed some errors in the **func.php** file and added new **config.php** file. In addition, we added one new field to the ``cscart_products`` table.

So, we should update 3 files:

*	**func.php** (update)
*	**addon.xml** (update: the table structure and the add-on version)
*	**config.php** (create)

Additionally, we should change the ``cscart_products`` table (add a new field). We will use a migration for this.

We also decided to check if a user created the **robots.txt** file (for example, it was described in your instructions on installing the previous version of the add-on). The new version of the add-on will automatically add data there, so, the file should exist and have the *writable* access rules.

Finally, we will add several language variables.

.. important:: Upgrade Center does not update existing variables. It only adds new. If you want to update a language variable, use migrations.

Create the basic upgrade package structure:

.. code-block:: none

	--- languages/
	+-- migrations/
	+-- package/
	+-- package.json
	L-- validators/

Some directories can be missing (for example, we don't have languages and migrations, or a package contains only migrations). **package.json** for now is an empty file. We will make its description later.

Fill the *package* directory. This directory is a store core and contains new files. So, to add our files, we create subdirectories and place these files there:

.. code-block:: none

	+-- package
	|   L-- app
	|       L-- addons
	|           L-- upgrade
	|               +-- addon.xml
	|               +-- config.php
	|               L-- func.php

Files are ready. Now, update languages. A directory structure is the same as in the Crowdin package. In this case we will just update english language adding some language variables, and update the add-on name and version:

.. code-block:: none

	+-- languages
	|   L-- en
	|       L-- core.po

**core.po**

.. code-block:: none

	msgid ""
	msgstr "Project-Id-Version: tygh"
	"Content-Type: text/plain; charset=UTF-8\n"
	"Language-Team: English\n"
	"Language: en_US"

	msgctxt "Languages::new_language_variable"
	msgid "Upgrade completed"
	msgstr "Upgrade completed"

	msgctxt "Addons::name::upgrade"
	msgid "Demo upgrade add-on v1.2"
	msgstr "Demo upgrade add-on v1.2"

	msgctxt "Addons::description::upgrade"
	msgid "This is description of the upgraded addon v1.2"
	msgstr "This is description of the upgraded addon v1.2"

Now, create a **Validator** that checks if the **robots.txt** file is in the store core. Create a file with any name, **CheckFileValidator.php**, for example:

.. code-block:: none

	L-- validators
	    L-- CheckFileValidator.php

This validator must implement the **IValidator** interface and have 2 mandatory functions:

*	``getName()``
*	``check($schema, $request)``

**CheckFileValidator.php**

.. code-block:: none

	namespace Tygh\UpgradeCenter\Validators;

	use Tygh\Registry;

	/**
	 * Upgrade validators: Check collisions
	 */
	class CheckFileValidator implements IValidator
	{
	    /**
	     * Global App config
	     *
	     * @var array $config
	     */
	    protected $config = array();

	    /**
	     * Validator identifier
	     *
	     * @var array $name ID
	     */
	    protected $name = 'Demo upgrade: File checker';

	    /**
	     * Validate specified data by schema
	     *
	     * @param  array $schema  Incoming validator schema
	     * @param  array $request Request data
	     * @return array Validation result and Data to be displayed
	     */
	    public function check($schema, $request)
	    {
	        $file_to_be_created = $this->config['dir']['root'] . '/robots.txt';

	        if (!file_exists($file_to_be_created)) {
	            return array(false, 'Create <strong>' . $file_to_be_created . '</strong> file first to continue upgrade');
	        } else {
	            return array(true, '');
	        }
	    }

	    /**
	     * Gets validator name (ID)
	     *
	     * @return string Name
	     */
	    public function getName()
	    {
	        return $this->name;
	    }

	    public function __construct()
	    {
	        $this->config = Registry::get('config');
	    }
	}

The number of validators in a package is not limited. It is better to divide validators by validation types, but not to make many validations in one.

.. _migrations:

Write a migration
=================

To write a migration, use phinx: `http://docs.phinx.org/en/latest/index.html <http://docs.phinx.org/en/latest/index.html>`_
Information about creating migrations you can read here: `http://docs.phinx.org/en/latest/migrations.html <http://docs.phinx.org/en/latest/migrations.html>`_

As a result we should have a file like this: *20141022083711_addon_update_version.php*. It will contain the basic migration class with the *up*, *down*, and *change* methods. We need 2 of them:

*	``up`` - while upgrade.
*	``down`` - while downgrade (in theory this method will not be used).

**20141022083711_addon_update_version.php.php**

.. code-block:: none

	use Phinx\Migration\AbstractMigration;

	class AddonUpdateVersion extends AbstractMigration
	{
	    /**
	     * Change Method.
	     *
	     * More information on this method is available here:
	     * http://docs.phinx.org/en/latest/migrations.html#the-change-method
	     *
	     * Uncomment this method if you would like to use it.
	     *
	    public function change()
	    {
	    }
	    */

	    /**
	     * Migrate Up.
	     */
	    public function up()
	    {
	        $options = $this->adapter->getOptions();
	        $pr = $options['prefix'];

	        $this->execute("UPDATE {$pr}addons SET `version` = '1.2' WHERE `addon` = 'upgrade'");
	        $this->execute("ALTER TABLE {$pr}products ADD `new_search_field` int(11) NOT NULL DEFAULT 0");
	    }

	    /**
	     * Migrate Down.
	     */
	    public function down()
	    {
	        $options = $this->adapter->getOptions();
	        $pr = $options['prefix'];

	        $this->execute("UPDATE {$pr}addons SET `version` = '1.1' WHERE `addon` = 'upgrade'");
	        $this->execute("ALTER TABLE {$pr}products DROP `new_search_field`");
	    }
	}

In this migration we updated the add-on version and added the new field. Migrations are also should be divided into files (in the example 2 migrations are grouped in one, but logically there should be 2 different migrations).

Now, fill the **package.json** file, and the package will be ready. **package.json** is a JSON file description of all files that are included in the upgrade package. We should define the updated files (with the MD5 hash of the old file). It is used for checking if a user changed this file, to inform about collisions.

.. code-block:: none

	{
	    "files": {
	        "app/addons/upgrade/addon.xml": {"status": "changed", "hash": "b0911a0d64453ab06b0872c9eb6fbc34"},
	        "app/addons/upgrade/func.php": {"status": "changed", "hash": "4fefb0fed1496f179a14b7e872eb16d9"},
	        "app/addons/upgrade/config.php": {"status": "new"},
	        "app/addons/upgrade/somefile.txt": {"status": "deleted", "hash": "df32e836628b51af570dd2425cb3e97e"}
	    },
	    "migrations": [
	        "20141022083711_addon_update_version.php"
	    ],
	    "languages": [
	        "en"
	    ],
	    "validators": [
	        "CheckFileValidator"
	    ]
	}

The package is ready. Finally, pack it to the TGZ archive and send to the connector.

.. code-block:: none

	+-- languages
	|  L-- en
	|       L-- core.po
	+-- migrations
	|   L-- 20141022083711_addon_update_version.php
	+-- package
	|   L-- app
	|       L-- addons
	|           L-- upgrade
	|               +-- addon.xml
	|               +-- config.php
	|               L-- func.php
	+-- package.json
	L-- validators
	    L-- CheckFileValidator.php
