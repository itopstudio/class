<?php
/** =============================================================================
 * @name index.php
 * @date date 六  4/30 22:59:57 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('common.php');

if (!Common::teacher()->isLogin()) {
    Common::redirect('index.php');
}
$request = Common::request();
$currentTclassNo = $request->getQuery('tclass_no');
if(!empty($currentTclassNo)) {
    $currentTclassData = '';
}
//Common::assertTeacherLogin();
//教师授课列表
$teacherOwnTclassList = Common::teacher()->teacherTclassList();
$courseExplainDDList = Common::teacher()->getCourseExplainDD();
$smarty = Common::smarty();
$smarty->assign('activeTab', 1);
$smarty->assign('tClassList', $teacherOwnTclassList);
$smarty->assign('ddList', $courseExplainDDList);

$smarty->display('create.html');
