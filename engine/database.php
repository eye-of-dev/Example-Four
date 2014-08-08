<?php

defined('EXAMPLE') or die('Access denied');

/**
 * Description of database
 * @author ...
 */
class Database
{

    private $_driver;

    function __construct($driver, $hostname, $username, $password, $database)
    {

        $file = DIR_LIBS . $driver . '.php';

        if (file_exists($file))
        {
            require_once DIR_LIBS . $driver . '.php';

            $class = 'DB' . $driver;

            $this->_driver = $class::getInstance($hostname, $username, $password, $database);
        } else
        {
            exit('Error: Could not load database driver type ' . $driver . '!');
        }
    }

    public function query($sql)
    {
        return $this->_driver->query($sql);
    }

    public function escape($value)
    {
        return $this->_driver->escape($value);
    }

    public function getLastId()
    {
        return $this->_driver->getLastId();
    }

}
