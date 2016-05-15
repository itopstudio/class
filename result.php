<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/15
 * Time: 19:04
 */
session_start();
require_once('common.php');
if(!Common::teacher()->isLogin()) {
    Common::redirect('index.php');
}
//教师授课列表
$teacherOwnTclassList = Common::teacher()->teacherTclassList();
$dataList = Common::teacher()->getCourseAllStudentGrades('A011518756','010388');
//将总成绩保存到session，用于导出成绩用
if(!empty($dataList['finalGrades'])) {
    $_SESSION['saveFinalGrades'] = $dataList['finalGrades'];
}
$smarty = Common::smarty();
$smarty->assign('tClassList', $teacherOwnTclassList);
//成绩数据
$smarty->assign('cexplainList', $dataList['cexplain']);
$smarty->assign('finalGradesList', $dataList['finalGrades']);
$smarty->display('result.html');