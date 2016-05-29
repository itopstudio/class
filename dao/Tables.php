<?php

/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/22
 * Time: 22:38
 */
class Tables
{
    private static $instance;
    private $tables = array(
        'topic'=>array(
            'topic_content',
            'topic_deadline',
            'topic_no',
            'topic_releasetime',
            'topic_fullmark',
            'topic_proportion',
            'topic_submission_method',
            'topic_times',
            'topic_tclass_no',
            'topic_conservation',
            'topic_type'
        ),
        'Cexplain'=>array(
            'Cexplain_no',
            'Cexplain_dd_no',
            'Cexplain_assess_no',
            'Cexplain_proportion',
            'Cexplain_time',
            'Cexplain_explain'
        ),
        'judge'=>array(
            'judge_ID',
            'judge_role',
            'judge_grades',
            'judge_jgroup_no',
            'judge_no',
            'judge_submit',
            'topic_topic_no',
            'topic_file_url'
        ),
        'teacher'
    );

    /**
     * @return Tables
     */
    public static function instance(){
        if(self::$instance === null){
            self::$instance = new Tables();
        }
        return self::$instance;
    }
    /**
     * get table fields by table name
     * @param $table
     * @return mixed|string
     */
    public function getTableFields($table) {
        if($this->isTable($table)) {
            return $this->tables[$table];
        } else {
            return '';
        }
    }

    /**
     * Is table
     * @param string $table
     * @return bool
     */
    public function isTable($table = '') {
        if(!empty($table)) {
            return array_key_exists($table, $this->tables);
        } else {
            return false;
        }
    }
}