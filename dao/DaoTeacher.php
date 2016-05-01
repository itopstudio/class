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
}
