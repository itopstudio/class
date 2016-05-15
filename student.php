<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/1
 * Time: 17:26
 */
session_start();
require_once('./dao/DaoStudent.php');
class Student {

    private $session;
    private $sessionKey = 'student';

    private static $instance;
    private $dao;

    public function __construct(){
        $this->session = isset($_SESSION[$this->sessionKey]) ? $_SESSION[$this->sessionKey] : array();
        $this->dao = new DaoStudent();
    }

    public static function instance(){
        if(self::$instance === null){
            self::$instance = new Student();
        }

        return self::$instance;
    }

    public function isLogin(){
        return !empty($this->session);
    }

    public function login($id, $passwd){
        $dao = new DaoStudent();
        $user = $dao->getByAuth($id, $passwd);
        $this->session = $user;
        $_SESSION[$this->sessionKey] = $user;
        if(empty($user)){
            return false;
        }else{
            return true;
        }
    }

    public function logout(){
        unset($_SESSION[$this->sessionKey]);
        $this->session = null;
    }

    public function info(){
        return $this->session;
    }

    /**
     *
     * 学生页面数据获取
     */
    /**
     * @return mixed
     */
    public function getStudentTclassList(){
        $dao = new DaoStudent();
        $res = $dao->getStudentTclassList($this->session[1]);
        return $res;
    }

    public function getTopicList(){
        $dao = new DaoStudent();
        return $dao->getTopicList();
    }

    public function getTopic($topicNo = ''){
        return $this->dao->getTopicData('', $topicNo);
    }

    /**
     *
     */
    public function getCourseAllExplainData(){
/*        $data = array(
            ''
        );*/
        $data = $this->dao->getCourseExplain('');
    }
}