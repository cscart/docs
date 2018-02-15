****************
Add-on Licensing
****************

It is possible to license add-ons in CS-Cart. This might be useful for add-on developers in order to allow add-on usage for authorized users only.

Add-on Initialization: addon.xml, init.php
==========================================

In the *addons* directory of your store installation create the add-on directory, e.g. *licensed_addon*.

Create the *addon.xml* file to contain the add-on information and several licensing settings (:download:`download <files/licensing/addon.xml>`):

*addons/licensed_addon/addon.xml*

.. code-block:: xml

    <?xml version="1.0"?>
    <addon scheme="2.0">
        <id>license_addon</id>
        <name>License Addon</name>
        <priority>100500</priority>
        <position>0</position>
        <status>active</status>

        <settings edition_type="ROOT">
            <sections>
                <section id="main">
                    <items>
                        <item id="license_number"> 
                            <name>License number</name> <!-- License number. This field will be available for editing in the add-on settings -->
                            <type>input</type>
                        </item>
                        <item id="license_server">
                            <name>License Server</name> <!-- License validation URL. This is a hidden field not available for editing, so its value is set right here -->
                            <type>hidden</type>
                            <default_value>localhost/valid.php</default_value>
                        </item>
                        <item id="license_valid">
                            <name>License valid</name> <!-- This setting will hold the validation result ('true' or 'false'). Updated after every license check -->
                            <type>hidden</type>
                        </item>
                    </items>
                </section>
            </sections>
        </settings>
        <language_variables>
            <!-- Language variable for the invalid license notification -->
            <item lang="EN" id="addon_license_invalid">Add-on license is not valid</item>
        </language_variables>
    </addon>

In the same directory create the *init.php* file, that will prevent the add-on from executing. It should have the following content (:download:`download <files/licensing/init.php>`):

*addons/licensed_addon/init.php*
::

    <?php
 
    if ( !defined('AREA') ) { die('Access denied'); }
 
    ?>

Add-on Management: func.php
===========================

The *func.php* file in the add-on directory (*addons/licensed_addon*) will contain some add-on management functions (:download:`download <files/licensing/func.php>`):

*addons/licensed_addon/func.php*
::

    <?php
 
    if ( !defined('AREA') ) { die('Access denied'); }
 
    // Sending license data to the validation server
    function fn_license_addon_get_license_information()
    {
 
      // Collecting all available add-on licenses
 
     // In case of one common license this one line will suffice:
     $license_number = Registry::get('addons.license_addon.license_number');
 
        if (!empty($license_number))
        { // If no licenses are available, nothing needs to be sent
 
          $store_ip = fn_get_ip();
          $store_ip = $store_ip['host'];
 
         // Preparing the store data for sending to the server
         $request = array(
                'ver' => PRODUCT_VERSION,
                'product_status' => PRODUCT_STATUS,
                'product_build' => PRODUCT_BUILD,
                'edition' => PRODUCT_TYPE,
                'store_ip' => $store_ip,
                'store_uri' => Registry::get('config.http_location'),
                'license_number' => $license_number,
            );
 
            // Sending the data in the JSON format to the server over a secure HTTPS channel
            list($header, $data) = fn_http_request('POST', Registry::get('addons.license_addon.license_server'), array('data' => json_encode($request)));
 
        } else {
            // If nothing was sent, returning false
            $data = false;
        }
 
        // Examples of the server response
        // '{"license_status":"false"}'
 
        return $data;
    }
 
    // The function parses the server response and deactivates the add-on if necessary
    function fn_license_addon_parse_license_information($data)
    {
        $data = json_decode($data, true);
 
        if (!empty($data)) {
            // Setting add-on status according to the server response
            Registry::set('addons.license_addon.license_valid', !empty($data['license_status']) && $data['license_status'] !== 'false' ? 'true' : 'false');
        }
 
        return true;
    }
 
    // Add-on validity check
    function fn_license_addon_check_valid()
    {
        // Getting add-on status
        $result = Registry::get('addons.license_addon.license_valid');
 
        return !empty($result) && $result !== 'false' ? true : false;
    }
 
    // Changing add-on status for the whole store
    function fn_license_addon_change_status_addon($status, $company_id = 0)
    {
        // Changing add-on status
        Registry::set('addons.license_addon.license_valid', !empty($status) && $status !== 'false' ? 'true' : 'false');
    }
 
    ?>

Add-on license check
====================

The add-on license will be validated on 3 events:

*   after admin panel authorization;
*   on add-on status change;
*   on license number change.

Post-Authorization Check
++++++++++++++++++++++++

Within the add-on directory (*addons/licensed_addon*) create the *controllers/admin* subdirectory and place the *auth.post.php* file in it. It is a postcontroller for the *auth.php* controller and will contain simple license validation routine (:download:`download <files/licensing/auth.post.php>`):

*addons/licensed_addon/controllers/admin/auth.post.php*
::

    <?php
 
    if ( !defined('AREA') ) { die('Access denied'); }
 
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
 
        if ($mode == 'login') {
 
            // Requesting license data from the server
            $data = fn_license_addon_get_license_information();
 
            // Processing the data received from the server
            fn_license_addon_parse_license_information($data);
 
        }
 
    }
 
    ?>

Check on Add-on Status and License Number Change
++++++++++++++++++++++++++++++++++++++++++++++++

In order to perform validation on add-on status and license number change, you should extend the settings scheme. Create the *schemas* directory in the add-on directory. Inside it create the *settings* subdirectory with the *actions.post.php* file with the following 2 functions (:download:`download <files/licensing/actions.post.php>`):

*addons/licensed_addon/schemas/settings/actions.post.php*
::

    <?php
 
    if ( !defined('AREA') ) { die('Access denied'); }
 
    // The function validates license on add-on status change
    function fn_settings_actions_addons_license_addon(&$new_value, $old_value)
    {
        // Receiving response from the server
        $data = fn_license_addon_get_license_information();
        // Checking the response
        fn_license_addon_parse_license_information($data);
 
        // If the license is not valid, deactivating the add-on
        if (!fn_license_addon_check_valid()) {
            $new_value = 'D';
            // Notifying the user about the add-on status being forcibly changed
            fn_set_notification('W', fn_get_lang_var('warning'), fn_get_lang_var('addon_license_invalid'));
        }
 
        return true;
    }
 
    // The function validates the license on license number change
    function fn_settings_actions_addons_license_addon_license_number(&$new_value, $old_value)
    {
        // Getting response from the server
        $data = fn_license_addon_get_license_information();
        // Checking the response
        fn_license_addon_parse_license_information($data);
 
        // If the license is not valid:
        if (!fn_license_addon_check_valid()) {
            // Deactivating the add-on
            fn_update_addon_status('license_addon', 'D');
 
            // Notifying the user about the add-on status being forcibly changed
            fn_set_notification('W', fn_get_lang_var('warning'), fn_get_lang_var('addon_license_invalid'));
        }
 
        return true;
    }
 
    ?>

Access restriction on license validity check fail
=================================================

In case of one common license for all storefronts an add-on is simply deactivated, if a license validity check fails.

In case of separate storefront-based licensing an add-on can not be deactivated, and it is necessary to insert the following code at the beginning of every file to have restricted access to::

    if (!fn_license_addon_check_valid()) { return false; }

For example, the modified *auth.post.php* file might look similar to this (:download:`download <files/licensing/mod/auth.post.php>`):

*addons/licensed_addon/controllers/admin/auth.post.php*
::

    <?php
 
    if ( !defined('AREA') ) { die('Access denied'); }
 
    if (!fn_license_addon_check_valid()) { return false; }
 
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
 
        if ($mode == 'login') {
 
            // Requesting license data from the server
            $data = fn_license_addon_get_license_information();
 
            // Processing the data received from the server
            fn_license_addon_parse_license_information($data);
        }
    }
 
    ?>

Storefront-Based Add-on Licensing in CS-Cart Ultimate edition
=============================================================

The steps of creating the add-on licensed for particular storefronts are the same, but there are some differences in the code of *addon.xml*, *func.php* and *actions.post.php* files:

*   :download:`addon.xml <files/licensing/mod/addon.xml>`
*   :download:`func.php <files/licensing/mod/func.php>`
*   :download:`actions.post.php <files/licensing/mod/actions.post.php>`