<?php
/** =============================================================================
 * @name request.php
 * @date date 日  5/ 1 15:32:12 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
class Request {
    private static $instance;

    private $post;

    private $get;

    private $request;

    public static function instance() {
        if (self::$instance === null) {
            self::$instance = new Request();
        }

        return self::$instance;
    }

    public function __construct() {
        $this->post = $_POST;
        $this->get = $_GET;
        $this->request = $_REQUEST;
    }

    public function getPost($name, $default = null) {
        return isset($this->post[$name]) ? $this->post[$name] : $default;
    }

    public function getQuery($name, $default = null) {
        return isset($this->get[$name]) ? $this->get[$name] : $default;
    }

    public function getParam($name, $default = null) {
        return isset($this->request[$name]) ? $this->request[$name] : $default;
    }
}
