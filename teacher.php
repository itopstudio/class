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

    private $dao;

    private function __construct() {
        $this->session = isset($_SESSION[$this->sessionKey]) ? $_SESSION[$this->sessionKey] : array();
        $this->dao = new DaoTeacher();
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

    /**
     * 老师页面
     */
    public function teacherTclassList(){
        $teacherId = '019942';
        return $this->dao->getTeacherTclassList($teacherId);
    }

    /**
     * 获取课程考核数据字典列表
     * @return array
     */
    public function getCourseExplainDD() {
        $ddDataType = 2;
        return $this->dao->getDDDataList($ddDataType);
    }


    public function getTclassData($tclassNo) {

    }

    /**
     * 创建
     */


    public function createBaseData($courseNo = '', $baseData = '') {
        $result = '';
        if(!empty($baseData)) {
        }
        return $result;
    }

    /**
     * 添加加分项
     * @param string $tclassNo
     * @param string $bonusOption
     * @return string
     */
    public function createBonusOption($tclassNo = '', $bonusOption = '') {
        $result = '';
        if(!empty($bonusOption)) {

        }
        return $result;
    }

    /**
     * 添加一票否决选项
     * @param string $tclassNo
     * @param string $vetoPower
     * @return string
     */
    public function createVetoPower($tclassNo = '', $vetoPower = '') {
        $result = '';
        if(!empty($vetoPower)) {

        }
        return $result;
    }

    /**
     * @param string $tclassNo
     * @param string $courseNo
     * @return array|string
     */
    public function getCourseAllStudentGrades($tclassNo = '', $courseNo = '') {
        return $this->dao->getTclassStudentGrades($tclassNo, $courseNo);
        if(!empty($tclassNo)) {

        }
        return '';
    }
}
