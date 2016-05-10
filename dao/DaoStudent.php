<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/1
 * Time: 16:11
 */
require_once('DaoBase.php');
class DaoStudent extends DaoBase{

    private static $table = 'student';
    private static $fields = array(
        'student_name',
        'student_ID',
        'student_sex',
        'student_age',
        'student_class_no',
        'student_password'
    );
    //作业类型
    private static $topicTypes = array(
        'normalTask'=>'平时作业',   //平时作业
        'largeTask',    //大作业
        'defence',
        'attendance',
        'halfTest',
        'finalTest',
        'bonus'
    );

    public function __construct()
    {
        parent::__construct(self::$table, self::$fields);
    }

    public function getByAuth($id, $passwd) {
        return $this->getRow(array(
            'student_ID=' => $id,
            'and',
            'student_password=' => $passwd,
        ));
    }

    /**
     * 获取学生选课列表
     * @param $stuId
     */
    public function getStudentTclassList($stuId)
    {
        $sql = 'SELECT Cname,Tclass_specialty,Tclass_class_no FROM course,tclass,ref_tclass_student
                WHERE ref_T_S_student_ID='.$stuId.' AND ref_T_S_Tclass_no=Tclass_no AND tclass_course_no=Cno';
        $res = $this->getDb()->query($sql);
        return $res;
    }

    /**
     * 获取课程考核方式
     * @param $courseNo
     * @return array
     */
    public function getCourseExplain($courseNo){
        if(!empty($courseNo)){
            $sql = 'SELECT
	                  DD_Cexplain_name,assess_Course_no,Cexplain_proportion,Cexplain_time,Cexplain_explain
                    FROM
                      dd,assess,cexplain
                    WHERE
                    DD_no=Cexplain_dd_no AND assess_no=Cexplain_assess_no
                    AND assess_Course_no='.$courseNo;
            $res = $this->getDb()->query($sql);
            return $res;
        }
        return array();
    }
    /**
     * Get topics
     * @param string $type
     * @param string $topicTclassNo
     * @return array
     */
    public function getTopicList($type='', $topicTclassNo=''){
        if(!empty($type) && !empty($topicTclassNo)) {
            $sql = 'SELECT * FROM topic WHERE topic_type='.$type.' AND topic_tclass_no='.$topicTclassNo;
            $res = $this->getDb()->query($sql);
            return $res[0];
        }else{
            return array();
        }
    }

    /**
     * @param string $type
     * @param string $topicId
     */
    public function getTopicData($type='', $topicNo=''){
        $typeNo = '';

        $sql = 'SELECT * FROM topic WHERE topic_no='.$topicNo;
        $res = $this->getDb()->query($sql);
        return $res[0];
    }
}