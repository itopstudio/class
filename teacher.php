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
     * 
     * @param string $tclassNo
     * @param string $baseData
     * @return bool
     */
    public function createBaseData($tclassNo = '', $baseData = '') {
        if(!empty($tclassNo) && !empty($baseData)) {
            $tclassData = $this->dao->getTclassByPK($tclassNo);
            print_r($tclassData);
            if(!empty($tclassData)) {
                $assessNo = $tclassData[0][3];
                $insertData = array();
                //insert Cexplain table
                foreach ($baseData as $item) {
                    $tmpItem['Cexplain_dd_no'] = $item['zcx'];
                    $tmpItem['Cexplain_assess_no'] = $assessNo;
                    $tmpItem['Cexplain_proportion'] = $item['bili'];
                    $tmpItem['Cexplain_time'] = $item['cishu'];
                    $tmpItem['Cexplain_explain'] = $item['shuoming'];
                    $insertData[] = $tmpItem;
                }
                $res = $this->dao->createBaseDataToDb($insertData);
                if($res) {
                    return true;
                }
            }
        }
        return false;
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

    /**
     * 执行部分
     */
    public function getExecuteData($tclassNo='') {
        $executeDataList = array(
            'courseExplain'=>''
        );

        if(!empty($tclassNo)) {
            //获取考核项
            $executeDataList['courseExplain'] = $this->getCourseAllExplainData($tclassNo);
        }
        return $executeDataList;
    }

    /**
     * @param $tclassNo
     * @return array
     */
    public function getCourseAllExplainData($tclassNo){
        $data = $this->dao->getCourseExplainByTclassNo($tclassNo);
        $explainTypes = array(
            array('name'=>'作业','jc'=>'zy'),
            array('name'=>'随堂测试', 'jc'=>'stzy'),
            array('name'=>'答辩', 'jc'=>'db'),
            array('name'=>'考勤', 'jc'=>'kq'),
            array('name'=>'期中考试', 'jc'=>'qzks'),
            array('name'=>'期末考试', 'jc'=>'qmks')
        );
        $tempData = array(
            '',
            '',
            '0',
            '0'
        );
        $dataList =array(
            'zy'=>$tempData,
            'stzy'=>$tempData,
            'db'=>$tempData,
            'kq'=>$tempData,
            'qzks'=>$tempData,
            'qmks'=>$tempData
        );
        foreach ($data as $key=>$item) {
            foreach ($explainTypes as $value) {
                if($item[0] == $value['name']) {
                    $dataList[$value['jc']] = $item;
                    break;
                }
            }
        }
        return $dataList;
    }

    public function createTopic($topicData='') {
        if(!empty($topicData)) {
            $this->dao->setTable('topic');
            $this->dao->insert($topicData);
        }
    }
}
