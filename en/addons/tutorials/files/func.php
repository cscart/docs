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

function fn_advanced_addon_get_category_data_pre($category_id, $field_list, $get_main_pair, $skip_company_condition, $lang_code)
{
	//Getting authentication data to identify user
	$auth = $_SESSION['auth'];

	//Checking if the user is logged in and resides at the customer area
	if (!empty($auth['user_id']) && AREA == 'C') {
		//Checking if the database has data on the user.
		//Creating new record if necessary, appending existing data if possible.

		$viewed_categories = db_get_field('SELECT categories FROM ?:advanced_addon_data WHERE user_id = ?i', $auth['user_id']);

		if (!empty($viewed_categories)) {
			$viewed_categories = unserialize($viewed_categories);
		}

		$viewed_categories[$category_id] = true;
		$viewed_categories = serialize($viewed_categories);

		db_query('REPLACE INTO ?:advanced_addon_data VALUES (?i, ?s)', $auth['user_id'], $viewed_categories);
	}
}

?>
