<?php
/** =============================================================================
 * @name Base.php
 * @date date 日  5/ 1 09:18:33 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once(dirname(__FILE__).'/../common.php');

class DaoBase {
    private $db;

    private $table;

    private $fields;

    public function __construct($table, $fields = array()) {
        $this->db = Common::db()->open();
        $this->table = $table;
        $this->fields = $fields;
    }

    public function getRow($where = '', $append = '') {
        $sql = $this->toSelect($where, $append.' limit 1');
        $res = $this->db->query($sql);
        if (!empty($res)) {
            return $res[0];
        } else {
            return array();
        }
    }

    public function getRows($where = '', $append = '') {
        $sql = $this->toSelect($where, $append.' limit 1');
        $res = $this->db->query($sql);

        return $res;
    }

    public function insert($data) {
        $sql = $this->toInsert($data);
        $res = $this->db->query($sql);
        return $res;
    }

    public function update($data, $where) {
        $sql = $this->toUpdate($data, $where);
        $res = $this->db->query($sql);
        return $res;
    }

    public function delete($where) {
        $sql = $this->toDelete($where);
        $res = $this->db->query($sql);
        return $res;
    }

    public function toSelect($where = '', $append = '') {
        $sql = 'select '.join(',', $this->fields).' from '.$this->table;
        if (!empty($where)) {
            $sql .= $this->parseCondition($where);
        }

        if (!empty($append)) {
            $sql .= $append;
        }
        return $sql;
    }

    public function toInsert($data) {
        if (empty($data)) {
            return '';
        }
        $tmpData = isset($data[0])? $data[0]:$data;
        $tmpDataArr = array();
        if(!isset($data[0])) {
            $tmpDataArr[0] = $data;
        } else {
            $tmpDataArr = $data;
        }
        $tmpDataKeys = array_intersect_key($tmpData, array_flip($this->fields));
        $sql = 'insert into '.$this->table. '(';
        foreach ($tmpDataKeys as $key => $field) {
            $sql .= '`'.$key.'`,';
        }
        $values = array();
        foreach ($tmpDataArr as $tmpKey => $value1) {
            if(is_array($value1)) {
                $items = array();
                foreach ($value1 as $value2) {
                    $items[] = $this->db->quote($value2);
                }
                $values[] = '('.join(',', $items).')';
            }
        }
        $sql = substr($sql, 0, strlen($sql) - 1).') values'.join(',', $values);
        return $sql;
    }

    public function toUpdate($data, $where) {
        if (empty($data)) {
            return '';
        }

        $sql = 'update '.$this->table.' set ';
        $sets = array();
        foreach ($data as $key => $value) {
            $sets[] = $key.'=\''.$this->db->quote($value).'\'';
        }
        $sql .= join(',', $sets);
        $sql .= $this->parseCondition($where);
        return $sql;
    }

    public function toDelete($where) {
        $sql = 'delete from '.$this->table.$this->parseCondition($where);
        return $sql;
    }

    private function parseCondition($where) {
        $sql = ' where ';
        $items = array();
        if (is_string($where)) {
            $sql .= $where;
        } else if (is_array($where)) {
            foreach ($where as $key => $data) {
                $value = $this->db->quote($data);
                $items[] = $key.'='.'\''.$value.'\'';
            }
        } else {
            $sql = '';
        }
        $sql = $sql.join(' AND ', $items);
        return $sql;
    }

    public function getDb(){
        return $this->db;
    }

    /**
     * 通过自写sql获取数据
     * @param $sql
     * @return array|bool|mixed|mysqli_result
     */
    public function getRowsBySql($sql) {
        $res = $this->getDb()->query($sql);
        if($res) {
            return $res;
        }else {
            return array();
        }
    }

    /**
     * 修改表名便于操作其它表
     * @param $table
     */
    public function setTable($table) {
        $tables = Common::tables();
        if($tables->isTable($table)) {
            $this->table = $table;
            $this->fields = $tables->getTableFields($table);
        }
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
            $res = $this->getRowsBySql($sql);
            return $res;
        }
        return array();
    }

    /**
     * @param $tclassNo
     * @return string
     */
    public function getCourseExplainByTclassNo($tclassNo) {
        if(!empty($tclassNo)) {
            $sql = 'SELECT tclass_course_no FROM tclass WHERE Tclass_no=\''.$tclassNo.'\'';
            $res = $this->getRowsBySql($sql);
            if($res) {
                return $this->getCourseExplain($res[0][0]);
            }
        }
        return '';
    }

    /**
     *
     * @param string $tclassNo
     * @return array|bool|mixed|mysqli_result|string
     */
    public function getTclassByPK($tclassNo = '') {
        if(!empty($tclassNo)) {
            $sql = 'SELECT * FROM tclass WHERE Tclass_no=\''.$tclassNo.'\'';
            $res = $this->getRowsBySql($sql);
            if($res) {
                return $res;
            }
        } else {
            return '';
        }
    }
}
