<?php
if ($mode == 'query') {
	$params['company_name'] = true;
	$params['place'] = 'exim_1c';
	if (Registry::get('addons.rus_exim_1c.exim_1c_export_add_true_orders') == 'Y') {
		$statuses = Registry::get('addons.rus_exim_1c.exim_1c_export_order_statuses');
		if (!empty($statuses)) {
			foreach($statuses as $key => $status) {
				if (!empty($status)) {
					$params['status'][] = $key;
				}
			}
		}
	}
	
	list($orders, $search) = fn_get_orders($params);
	
}
