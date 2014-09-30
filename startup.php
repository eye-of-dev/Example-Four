<?php

defined('EXAMPLE') or die('Access denied');

if (!file_exists(DIR_IMAGES))
    mkdir(DIR_IMAGES, 0777);

// From engine folder
require_once(DIR_ENGINE . 'autoload.php');
require_once(DIR_ENGINE . 'controller.php');
require_once(DIR_ENGINE . 'registry.php');
require_once(DIR_ENGINE . 'database.php');
require_once(DIR_ENGINE . 'model.php');
require_once(DIR_ENGINE . 'loader.php'); 

require_once(DIR_LIBS . 'request.php');
require_once(DIR_LIBS . 'language.php');