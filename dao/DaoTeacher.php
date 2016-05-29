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
            'teacher_ID' => $id,
            'teacher_password' => $passwd,
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
            return $this->getRowsBySql($sql);
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
            $sql = 'SELECT * FROM tclass,course WHERE tclass_class_no=' . $tClassNo . ' AND tclass_course_no=Cno';
            return $this->getRowsBySql($sql);
        }else {
            return array();
        }
    }

    public function getTclass() {
        //ToDo
    }

    /**
     * 获取字典类型相关数据
     * @param $ddDataType
     * @return array
     */
    public function getDDDataList($ddDataType) {
        $sql = 'SELECT DD_no,DD_Cexplain_name FROM dd WHERE DD_data_type='.$ddDataType.' AND dd_usewhether=1';
        return $this->getRowsBySql($sql);
    }

    /**
     * @param string $insertData
     * @return bool|mixed|mysqli_result|string
     */
    public function createBaseDataToDb($insertData = '') {
        $table = 'Cexplain';
        if(!empty($insertData)) {
            $this->setTable($table);
            return $this->insert($insertData);
        }
        return '';
    }


    public function insertBonusOption($tclassNo = '', $insertData = '') {
        if(!empty($tclassNo) && !empty($insertData)) {
            $insertTable = '';
            $this->setTable($insertTable);
            if($this->insert($insertData)){

            }
        }
        return '';
    }

    /**
     *
     * @param string $tclassNo
     * @param string $courseNo
     * @return array
     */
    public function getTclassStudentGrades($tclassNo = '', $courseNo = '') {
        $resArr = array(
            'cexplain'=>'',
            'finalGrades'=>''
        );
        $topicTypes = '';
        //获取考核组成项
        if(!empty($courseNo)) {
            $sql = 'SELECT DD_Cexplain_name,Cexplain_proportion,Cexplain_time FROM cexplain, assess,dd 
                    WHERE Cexplain_assess_no=assess_no AND Cexplain_dd_no=DD_no AND assess_course_no='.$courseNo;
            $res = $this->getRowsBySql($sql);
            if($res) {
                $resArr['cexplain'] = $res;
                $topicTypes = $res;
/*                $i = 0;
                foreach ($res as $value) {
                    $topicTypes[$i] = $value[2];
                    $i++;
                }*/
            }
        }
        //获取总成绩
        if(!empty($tclassNo)) {
            $sql = 'SELECT finalgrades.student_ID, student_name, finalGrades FROM student, finalgrades 
                    WHERE student.student_ID = finalgrades.student_ID AND Tclass_no =\''.$tclassNo.'\'';
            $res = $this->getRowsBySql($sql);
            if($res) {
                $resArr['finalGrades'] = $res;
            }
        }
        //获取各作业项成绩
        if(!empty($topicTypes)) {
            //ToDo
        }
        return $resArr;
    }

    public function getExecuteData($tclassNo='') {
        if(!empty($tclassNo)) {
            
        }
    }

}
