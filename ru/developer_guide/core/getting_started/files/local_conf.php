<?php

// Файл local_conf перепределяет любые конфиги из config.local.php

// Если работаем на живом магазине, то выводим только для своего IP, чтобы не пугать клиентов. Узнать IP поможет сайт 2ip.ru
if ($_SERVER['REMOTE_ADDR'] == '87.76.12.115') {

    // Включить DEBUG панель включенной всегда
    // define('DEBUG_MODE', true);

    // Режим разработчика, для отображения ошибок
    define('DEVELOPMENT', true);

    // Отображение ошибок SMARTY и PHP на экран.
    error_reporting(E_ALL);
    ini_set('display_errors', 'on');
    ini_set('display_startup_errors', true);

    // Выключаем PHP кэш блоков
    $config['tweaks'] = array (
        'disable_block_cache' => true, 
    );

}

// Вы можете задать конфиги для локальной копии без изменения config.local.php

/*
$config['db_host'] = '%DB_HOST%';
$config['db_name'] = '%DB_NAME%';
$config['db_user'] = '%DB_USER%';
$config['db_password'] = '%DB_PASSWORD%';

$config['http_host'] = '%HTTP_HOST%';
$config['http_path'] = '%HOST_DIR%';

$config['https_host'] = '%HTTPS_HOST%';
$config['https_path'] = '%HOST_DIR%';
*/