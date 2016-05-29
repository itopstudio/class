<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/7
 * Time: 19:55
 */
require_once('common.php');
if(!Common::teacher()->isLogin()) {
    Common::redirect('index.php');
}
$request = Common::request();
$tclassNo = $request->getQuery('tclass_no');
$tclassList = Common::teacher()->teacherTclassList();
if(!isset($tclassNo)) {
    $tclassNo = $tclassList[0][0];
}
$executeDataList = Common::teacher()->getExecuteData($tclassNo);
$smarty = Common::smarty();
$smarty->assign('currentTclassNo', $tclassNo);
$smarty->assign('tclassList', $tclassList);
$smarty->assign('courseExplainList', $executeDataList['courseExplain']);
$smarty->display('execute.html');
