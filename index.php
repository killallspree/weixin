<?php

if(isset($_GET['debug']) && 1 == $_GET['debug']){
    ini_set('display_errors', true);
    error_reporting(E_ALL);
}
date_default_timezone_set('Asia/Shanghai');
define('DS', DIRECTORY_SEPARATOR);
define('APP_NAME', basename(__DIR__));
define('ROOT_DIR', dirname(dirname(__DIR__)));
define('CONF_DIR', ROOT_DIR . DS . 'conf');
define('APP_DIR', ROOT_DIR . DS . 'apps' . DS . APP_NAME);
define('LOG_DIR', ROOT_DIR . DS . 'logs');
define('APP_CONF_DIR', CONF_DIR . DS . APP_NAME);
define('UPLOAD_DIR', ROOT_DIR . DS . 'webroot/static');
try{
    $app = new Yaf_Application(APP_CONF_DIR . DS . 'application.ini');
    $app->bootstrap()->run();
}catch(Exception $e){
    Ald_Log::warning('%s: exception occured: %s[%s]', $e->getMessage(), $e->getCode());
}
$cost = microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'];
Ald_Log::notice(sprintf('cost[%s]', $cost), true);
?>
