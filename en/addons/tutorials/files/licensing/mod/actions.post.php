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

// The function validates license on add-on status change
function fn_settings_actions_addons_license_addon(&$new_value, $old_value)
{
    // Receiving response from the server
    $data = fn_license_addon_get_license_information();
    // Checking the response
    fn_license_addon_parse_license_information($data);

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
        if (defined(COMPANY_ID)) {
            // In case of storefront-based licensing setting the license status as not valid for a particular storefront
            fn_license_addon_change_status_addon(false, COMPANY_ID);
        }

        // Notifying the user about the add-on status being forcibly changed
        fn_set_notification('W', fn_get_lang_var('warning'), fn_get_lang_var('addon_license_invalid'));
    }

    return true;
}

?>