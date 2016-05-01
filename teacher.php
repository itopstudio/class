<?php
/** =============================================================================
 * @name user.php
 * @date date 日  5/ 1 13:02:55 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
session_start();
require_once('dao/DaoTeacher.php');

class Teacher {
    private $session;

    private $sessionKey = 'teacher';

    private static $instance;

    private function __construct() {
        $this->session = isset($_SESSION[$this->sessionKey]) ? $_SESSION[$this->sessionKey] : array();
    }

    public function instance() {
        if (self::$instance === null) {
            self::$instance = new Teacher();
        }

        return self::$instance;
    }

    public function isLogin() {
        return !empty($this->session);
    }

    public function login($id, $passwd) {
        $dao = new DaoTeacher();
        $user = $dao->getByAuth($id, $passwd);
        $this->session = $user;
        $_SESSION[$this->sessionKey] = $user;
        if (empty($user)) {
            return false;
        } else {
            return true;
        }
    }

    public function logout() {
        unset($_SESSION[$this->sessionKey]);
        $this->session = null;
    }

    public function info() {
        return $this->session;
    }
}
