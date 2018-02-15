<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

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