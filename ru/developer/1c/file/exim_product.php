<?php
if ($mode == 'import') {
        $fileinfo = pathinfo($filename);
        $xml = fn_exim_1c_get_xml($filename);
        if ($xml === false) {
            fn_echo("failure");
            exit;
        }
        if (strpos($fileinfo['filename'], 'import') == 0) {
            fn_exim_1c_import($xml, $user_data, $company_id, $lang_code);
        }
	}
}