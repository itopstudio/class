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
$tclassList = Common::teacher()->teacherTclassList();
if(empty($currentTclassNo)) {
    $currentTclassNo = $tclassList[0][0];
}
$courseExplainDDList = Common::teacher()->getCourseExplainDD();
$smarty = Common::smarty();
$smarty->assign('activeTab', 1);
$smarty->assign('tClassList', $tclassList);
$smarty->assign('ddList', $courseExplainDDList);
$smarty->assign('currentTclassNo', $currentTclassNo);
$smarty->display('create.html');
