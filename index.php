<?php
/** =============================================================================
 * @name index.php
 * @date date 日  5/ 1 16:39:16 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('common.php');

if (Common::teacher()->isLogin()) {
    Common::redirect('create.php');
}
$smarty = Common::smarty();
$smarty->assign('teacherLoginUrl', 'tlogin.php');
$smarty->assign('studentLoginUrl', 'slogin.php');
$smarty->display('index.html');
