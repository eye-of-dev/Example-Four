<?php

defined('EXAMPLE') or die('Access denied');

/**
 * Description of mysqli
 */
class DBmysqli
{
    /*
     * db config variables
     */
    private static $_hostname;
    private static $_username;
    private static $_password;
    private static $_database;
    // db object
    private $link;
    // class object
    protected static $_instance;

    private function __construct()
    {
        $this->link = @new mysqli(self::$_hostname, self::$_username, self::$_password, self::$_database);

        if (mysqli_connect_error())
        {
            throw new ErrorException('Error: Could not make a database link (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
        }

        $this->link->set_charset("utf8");
    }

    public static function getInstance($hostname, $username, $password, $database)
    {
        self::$_hostname = $hostname;
        self::$_username = $username;
        self::$_password = $password;
        self::$_database = $database;

        // get an instance of this class
        if (self::$_instance === null)
        {
            self::$_instance = new self;
        }
        return self::$_instance;
    }

    public function query($sql)
    {
        $query = $this->link->query($sql);

        if (!$this->link->errno)
        {
            if (isset($query->num_rows))
            {
                $data = array();
                while ($row = $query->fetch_assoc())
                {
                    $data[] = $row;
                }
                $result = new stdClass();
                $result->num_rows = $query->num_rows;
                $result->row = isset($data[0]) ? $data[0] : array();
                $result->rows = $data;

                unset($data);

                return $result;
            } else
            {
                return true;
            }
        } else
        {
            throw new ErrorException('Error: ' . $this->link->error . '<br />Error No: ' . $this->link->errno . '<br />' . $sql);
        }
    }

    public function escape($value)
    {
        if ($this->link)
        {
            return $this->link->real_escape_string($value);
        }
    }

    public function getLastId()
    {
        if ($this->link)
        {
            return $this->link->insert_id;
        }
    }

    private function __clone()
    {
        
    }

    private function __wakeup()
    {
        
    }

}
