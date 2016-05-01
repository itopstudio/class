<?php
/** =============================================================================
 * @name index.php
 * @date date 六  4/30 22:59:57 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('common.php');

//Common::assertTeacherLogin();

$smarty = Common::smarty();
$smarty->assign('activeTab', 1);
$smarty->display('create.html');
