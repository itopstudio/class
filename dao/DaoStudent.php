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
            'student_ID' => $id,
            'student_password' => $passwd,
        ));
    }

    /**
     * 获取学生选课列表
     * @param $stuId
     */
    public function getStudentTclassList($stuId)
    {
        $sql = 'SELECT Tclass_no,Cname,Tclass_specialty,Tclass_class_no FROM course,tclass,ref_tclass_student
                WHERE ref_T_S_student_ID='.$stuId.' AND ref_T_S_Tclass_no=Tclass_no AND tclass_course_no=Cno';
        $res = $this->getDb()->query($sql);
        return $res;
    }


    /**
     * @param string $topicTclassNo
     * @param string $studentId
     * @return array|bool|mixed|mysqli_result
     */
    public function getTopicList($topicTclassNo='', $studentId=''){
        if(!empty($topicTclassNo)) {
            $sql = 'SELECT topic_no,topic_type,topic_releasetime,topic_deadline,topic_content,topic_fullmark,topic_proportion,topic_submission_method,judge_ID,judge_no,topic_file_url,judge_grades,judge_submit FROM topic,judge WHERE topic_tclass_no=\''.$topicTclassNo.'\' AND judge_ID=\''.$studentId.'\' AND topic_no=topic_topic_no';
            $res = $this->getRowsBySql($sql);
            if($res) {
                return $res;
            }
        }else{
            return '';
        }
    }

    /**
     * @param string $postJudgeNo
     * @param string $topicFileUrl
     * @param string $judgeId
     * @return bool|mixed|mysqli_result|string
     */
    public function updateStudentJudgeDataToDb($postJudgeNo = '', $topicFileUrl = '', $judgeId = '') {
        $judge = array();
        $table = 'judge';
        if(!empty($postJudgeNo) && !empty($topicFileUrl)) {
            $judge['judge_submit'] = 1;
            $judge['topic_file_url'] = $topicFileUrl;
            $where = array(
                'judge_no'=>$postJudgeNo,
                'judge_ID'=>$judgeId
            );
            $this->setTable($table);
            $res = $this->update($judge, $where);
            if ($res) {
                return $res;
            }
        }
        return '';
    }
}