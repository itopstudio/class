<?php
/** =============================================================================
 * @name Base.php
 * @date date 日  5/ 1 09:18:33 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
class DaoBase {
    private $db;

    private $table;

    private $fields;

    public function __construct($table, $fields = array()) {
        require_once('../common.php');
        $this->db = Common::db()->open();
        $this->table = $table;
        $this->fields = $fields;
    }

    public function getRow($where = '', $append = '') {
        $sql = toSelect($where, $append.' limit 1');
        $res = $this->db($query);
        if (!empty($res)) {
            return $res[0];
        } else {
            return array();
        }
    }

    public function getRows($where = '', $append = '') {
        $sql = toSelect($where, $append.' limit 1');
        $res = $this->db($query);

        return $res;
    }

    public function insert($data) {
        
    }

    public function toSelect($where = '', $append = '') {
        $sql = 'select '.join(',', $this->fields).' from '.$this->table;

        if (!empty($where)) {
            $sql .= 'where ';
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
            }
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

        $sql = 'insert into '.$table. '(';
        $values = array();
        foreach ($data as $key => $value) {
            $sql .= '`'.$key.'`,';
            $values[] = $this->db->quote($value);
        }

        $sql = substr($sql, 0, strlen($sql) - 1).') values('.join(',', $values).')';

        return $sql;
    }
}
