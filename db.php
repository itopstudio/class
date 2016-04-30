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

    private function __construct() {

    }

    public static function instance() {
        if (self::$instance === null) {
            self::$instance = new DB();
        }

        return self::$instance;
    }

    public function open($host, $user, $passwd, $dbName = '') {
        if ($this->db === null) {
            $this->db = mysqli_connect($host, $user, $passwd);
            if (!$this->db) {
                $this->db == null;
                $error = mysqli_error();
            } else {
                $this->query('set names utf8');
                $this->useDb($dbName);
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
}
