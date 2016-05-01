<?php
/** =============================================================================
 * @name mysql.php
 * @date date 六  4/30 23:30:35 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
class DB {
    private static $instance = null;

    private $db = null;

    private $error = null;

    private static $host;

    private static $user;

    private static $passwd;

    private static $dbName;

    private function __construct() {

    }

    public static function instance($host, $user, $passwd, $dbName = '') {
        if (self::$instance === null) {
            self::$instance = new DB();
        }

        self::$host = $host;
        self::$user = $user;
        self::$passwd = $passwd;
        self::$dbName = $dbName;

        return self::$instance;
    }

    public function open() {
        $this->close();

        if ($this->db === null) {
            $this->db = mysqli_connect(self::$host, self::$user, self::$passwd);
            if (!$this->db) {
                $this->db == null;
                $error = mysqli_error();
            } else {
                $this->query('set names utf8');
                $this->useDb(self::$dbName);
            }
        }

        return $this;
    }

    public function close() {
        if ($this->db !== null) {
            mysqli_close($this->db);
            $this->db = null;
        }
    }

    public function assertOpen() {
        if ($this->db === null) {
            throw new Exception('last database connect');
        }
    }

    public function useDb($dbName) {
        if ($dbName == '' || $dbName === null) {
            return false;
        }
        return $this->query('use '.$dbName) !== false;
    }

    public function query($sql) {
        $this->assertOpen();
        $res = mysqli_query($this->db, $sql);
        if (!$res) {
            $this->error = mysqli_error($this->db);
            return false;
        }

        if ($res instanceof mysqli_result) {
            return $res->fetch_all();
        }

        return $res;
    }

    public function quote($string) {
        if (!is_string($string)) {
            return $string;
        }
        return mysqli_real_escape_string($this->db, $string);
    }
}
