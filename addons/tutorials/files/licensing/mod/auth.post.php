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