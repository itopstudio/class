<?php
/** =============================================================================
 * @name index.php
 * @date date 六  4/30 22:59:57 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('common.php');

$smarty = Common::smarty();
$db = Common::db();

$arr1 = array('a','b','c');
$arr2 = array('a' => 1, 'c' => 2, 'd' =>3);

print_r(array_intersect_key($arr1, $arr2));
