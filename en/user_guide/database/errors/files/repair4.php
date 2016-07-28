<?php

use Tygh\Bootstrap;
use Tygh\Registry;

if (empty($_REQUEST['table'])) {
	die("Please specify what table should be restored by adding the 'table' parameter to the repair script, e.g. <b>repair4.php?table=cscart_quick_search</b>");
}

define('AREA', 'C');

error_reporting(E_ALL);
ini_set('display_errors', '1');

// Register autoloader
$this_dir = dirname(__FILE__);
$classLoader = require($this_dir . '/app/lib/vendor/autoload.php');
$classLoader->add('Tygh', $this_dir . '/app');

// Prepare environment and process request vars
list($_REQUEST, $_SERVER) = Bootstrap::initEnv($_GET, $_POST, $_SERVER, $this_dir);

// Get config data
$config = require(DIR_ROOT . '/config.php');

require($config['dir']['functions'] . 'fn.database.php');
require($config['dir']['functions'] . 'fn.control.php');
require($config['dir']['functions'] . 'fn.common.php');

Registry::set('class_loader', $classLoader);
Registry::set('config', $config);

// Connect to database
if (!db_initiate(Registry::get('config.db_host'), Registry::get('config.db_user'), Registry::get('config.db_password'), Registry::get('config.db_name'))) {
    throw new DatabaseException('Cannot connect to the database server');
}

$table = preg_replace('/[^a-z_A-Z0-9]/', '', $_REQUEST['table']);
$result = db_get_row("REPAIR TABLE $table");



if ($result['Msg_text'] == 'OK') {
	echo "The <b>$table</b> table has been repaired successfully.";
} else {
	echo 'Error: ' . $result['Msg_text'];
}