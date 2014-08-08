<?php

defined('EXAMPLE') or die('Access denied');

/**
 * Description of mysql : use this methotd for connect to database with php ver. <= 5.5.0
 * @author ...
 */
class DBmysql
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
        if (!$this->link = @mysql_connect(self::$_hostname, self::$_username, self::$_password))
        {
            // this code puts error in log file something like 
            // file_put_contents('MysqlErrors.txt', mysqli_connect_error(), FILE_APPEND); 
            // or return error into log class
            throw new ErrorException('Error: Could not make a database link using ' . self::$_username . '@' . self::$_hostname);
        }

        if (!mysql_select_db(self::$_database, $this->link))
        {
            throw new ErrorException('Error: Could not connect to database ' . self::$_database);
        }

        mysql_query("SET NAMES 'utf8'", $this->link);
        mysql_query("SET CHARACTER SET utf8", $this->link);
        mysql_query("SET CHARACTER_SET_CONNECTION=utf8", $this->link);
        mysql_query("SET SQL_MODE = ''", $this->link);
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
        if ($this->link)
        {
            $resource = mysql_query($sql, $this->link);

            if ($resource)
            {
                if (is_resource($resource))
                {
                    $i = 0;

                    $data = array();

                    while ($result = mysql_fetch_assoc($resource))
                    {
                        $data[$i] = $result;

                        $i++;
                    }

                    mysql_free_result($resource);

                    $query = new stdClass();
                    $query->row = isset($data[0]) ? $data[0] : array();
                    $query->rows = $data;
                    $query->num_rows = $i;

                    unset($data);

                    return $query;
                } else
                {
                    return TRUE;
                }
            } else
            {
                throw new ErrorException('Error: ' . mysql_error($this->link) . '<br />Error No: ' . mysql_errno($this->link) . '<br />' . $sql);
                exit();
            }
        }
    }

    public function escape($value)
    {
        if ($this->link)
        {
            return mysql_real_escape_string($value, $this->link);
        }
    }

    public function getLastId()
    {
        if ($this->link)
        {
            return mysql_insert_id($this->link);
        }
    }

    private function __clone()
    {
        
    }

    private function __wakeup()
    {
        
    }

}