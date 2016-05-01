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
        $sql = $this->toInsert(array_intersect_key($data, array_flip($this->fields)));
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

        $sql = 'insert into '.$this->table. '(';
        $values = array();
        foreach ($data as $key => $value) {
            $sql .= '`'.$key.'`,';
            $values[] = $this->db->quote($value);
        }

        $sql = substr($sql, 0, strlen($sql) - 1).') values('.join(',', $values).')';

        return $sql;
    }

    public function toUpdate($data, $where) {
        if (empty($data)) {
            return '';
        }

        $sql = 'update '.$this->table.' set ';
        $sets = array();
        foreach ($data as $key => $value) {
            $sets[] = $key.' = '.$this->db->quote($value);
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
        if (is_string($where)) {
            $sql .= $where;
        } else if (is_array($where)) {
            foreach ($where as $key => $data) {
                if (is_string($key)) {
                    $sql .= $key.' ';
                } 
                $value = $this->db->quote($data);
                
                $sql .= $value.' ';
            }
        } else {
            $sql = '';
        }

        return $sql;
    }

    public function getDb(){
        return $this->db;
    }
}
