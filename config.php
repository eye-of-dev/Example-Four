<?php defined('EXAMPLE') or die('Access denied');

$root_dir = dirname(__FILE__);

define('DIR_ROOT', $root_dir);
define('DIR_CLASSES', $root_dir . '/classes/');
define('DIR_ENGINE', $root_dir . '/engine/');
define('DIR_IMAGES', $root_dir . '/images/');
define('DIR_LANG', $root_dir . '/lang/');
define('DIR_LIBS', $root_dir . '/libs/');
define('DIR_VIEW', $root_dir . '/view/');
define('DIR_MODELS', $root_dir . '/models/');

define('SITE_ROOT', $_SERVER['SERVER_NAME']);

// DB
define('DB_DRIVER', 'mysqli'); // you can use mysqli, mysql
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'secret');
define('DB_DATABASE', 'test_auth');


// LANG
define('SITE_LANG', 'en');