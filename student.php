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

    /**
     *
     * @return array
     */
    public function getTopicListData($tclassNo, $studentId){
        $explainTypes = array(
            array('name'=>'作业','jc'=>'zy'),
            array('name'=>'随堂测试', 'jc'=>'stzy'),
            array('name'=>'答辩', 'jc'=>'db'),
            array('name'=>'考勤', 'jc'=>'kq'),
            array('name'=>'期中考试', 'jc'=>'qzks'),
            array('name'=>'期末考试', 'jc'=>'qmks')
        );
        $tempData = array();
        $dataList =array(
            'zy'=>$tempData,
            'stzy'=>$tempData,
            'db'=>$tempData,
            'kq'=>$tempData,
            'qzks'=>$tempData,
            'qmks'=>$tempData
        );
        if(!empty($tclassNo) && !empty($studentId)) {
            $data = $this->dao->getTopicList($tclassNo, $studentId);
            if(is_array($data)) {
                foreach ($data as $item) {
                    foreach ($explainTypes as $value) {
                        if ($item[1] == $value['name']) {
                            $dataList[$value['jc']][] = $item;
                        }
                    }
                }
            }
        }
        return $dataList;

    }

    public function getTopic($topicNo = ''){
        return $this->dao->getTopicData('', $topicNo);
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

    public function updateJudgeInfo($postJudgeNo='', $topicFileUrl='') {
        if(!empty($postJudgeNo) && !empty($topicFileUrl)) {
            $student = self::info();
            $studentId = $student[1];
            $this->dao->updateStudentJudgeDataToDb($postJudgeNo, $topicFileUrl, $studentId);
        }
    }
}