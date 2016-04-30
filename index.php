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

$res = $db->query('select * from admin');
print_r($res);

$smarty->display('index.html');
