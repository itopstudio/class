<?php
/** =============================================================================
 * @name DaoUser.php
 * @date date 日  5/ 1 13:04:29 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('DaoBase.php');

class DaoTeacher extends DaoBase {
    public function __construct() {
        $fields = array(
            'teacher_ID',
            'teacher_name',
            'teacher_sex',
            'teacher_school',
            'teacher_depart',
            'teacher_position',
            'teacher_password',
        );
        parent::__construct('teacher', $fields);
    }

    public function getByAuth($id, $passwd) {
        return $this->getRow(array(
            'teacher_ID=' => $id,
            'and',
            'teacher_password=' => $passwd,
        ));
    }

    /**
     * 获取教师授课列表
     * @param $teacherId
     * @return array
     */
    public function getTeacherTclassList($teacherId) {
        if(!empty($teacherId)) {
            $sql = 'SELECT * FROM tclass,course WHERE tclass_teacher_ID='.$teacherId .' AND tclass_course_no=Cno';
            $res = $this->getDb()->query($sql);
            if($res) {
                return $res;
            }
        }
        return array();
    }

    /**
     * 获取授课信息
     * @param $tClassNo
     * @return array
     */
    public function getTclassData($tClassNo) {
        if(!empty($tClassNo)) {
            $sql = 'SELECT * FROM tclass,course WHERE tclass_class_no='.$tClassNo.' AND tclass_course_no=Cno';
            $res = $this->getDb->query($sql);
            if($res) {
                return $res[0];
            }
        }
        return array();
    }

    public function getTclass() {

    }
}
