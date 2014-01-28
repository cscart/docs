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

    // For storefront-based licensing it is necessary to build licenses for every storefront
    $storefronts = array();

    // Obtain all active storefronts
    list($all_storefronts) = fn_get_companies(array(), $_SESSION['auth']);

    if (!empty($all_storefronts)) {
        foreach($all_storefronts as $store) {
            if (!empty($store['storefront'])) {
                // Get licenses for storefronts
                $license_number = CSettings::instance()->get_value('license_number', 'license_addon', $store['company_id']);

                // Pack the data in a handy array
                $storefronts[$store['company_id']] = array(
                    'store_uri' => $store['storefront'],
                    'license_number' => (!empty($license_number) ? $license_number : ''),
                );
            }
        }
    }


    if (!empty($storefronts)) {
    // If no licenses are available, nothing needs to be sent

        $store_ip = fn_get_ip();
        $store_ip = $store_ip['host'];

        // Preparing the store data for sending to the server
        $request = array(
            'ver' => PRODUCT_VERSION,
            'product_status' => PRODUCT_STATUS,
            'product_build' => PRODUCT_BUILD,
            'edition' => PRODUCT_TYPE,
            'store_ip' => $store_ip,
            'storefronts' => $storefronts,
        );

        // Sending the data in the JSON format to the server over a secure HTTPS channel
        list($header, $data) = fn_http_request('POST', Registry::get('addons.license_addon.license_server'), array('data' => json_encode($request)));

    } else {
        // If nothing was sent, returning false
        $data = false;
    }

    // Examples of the server response
    // '{"storefronts_status":{"1":"true","2":"false"}}'

    return $data;
}

// The function parses the server response and deactivates the add-on if necessary
function fn_license_addon_parse_license_information($data)
{
    $data = json_decode($data, true);

    list($storefronts) = fn_get_companies(array(), $_SESSION['auth']);
    if (!empty($storefronts)) {
        foreach($storefronts as $id => $store) {
            // Assigning the statuses received from the server. In case of missing status data for a particular storefront status 'false' is assigned
            fn_license_addon_change_status_addon(!empty($data['storefronts_status'][$store['company_id']]) ? $data['storefronts_status'][$store['company_id']] : 'false', $store['company_id']);
        }
    }

    return true;
}

// Add-on validity check
function fn_license_addon_check_valid()
{
    // Getting add-on status
    $result = Registry::get('addons.license_addon.license_valid');

    if (defined('SELECTED_COMPANY_ID') && SELECTED_COMPANY_ID == 'all') {
        // If no storefront is selected, the add-on is considered valid
        $result = true;
    }

    return !empty($result) && $result !== 'false' ? true : false;
}

// Changing add-on status for a particular storefront
function fn_license_addon_change_status_addon($status, $company_id = 0)
{
    // Changing add-on status for the specified storefront
    CSettings::instance()->update_value('license_valid', (!empty($status) && $status !== 'false' ? 'true' : 'false'), 'license_addon', true, (!empty($company_id) ? $company_id : (defined('COMPANY_ID') ? COMPANY_ID : null)));
}

?>