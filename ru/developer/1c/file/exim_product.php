<?php
if ($fileinfo['filename'] == 'import') {
	if (Registry::get('addons.rus_exim_1c.exim_1c_export_check_prices') != 'Y') {
		if (isset($xml->Классификатор)) {
			fn_exim_1c_import_categories($xml->Классификатор, 0, $user_data['user_type']);
			fn_exim_1c_collect_features($xml->Классификатор);
		}
		if (isset($xml->Каталог)) {
			fn_exim_1c_import_products($xml->Каталог, $user_data);
		}
	}
}