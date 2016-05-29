<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/1
 * Time: 17:55
 */
require_once('common.php');

if(!Common::student()->isLogin()){
    Common::redirect('index.php');
}

$request = Common::request();
$tclassNo = $request->getQuery('tclass_no');
$courseExplainList = array();
if(!empty($tclassNo)) {
    $courseExplainList = Common::student()->getCourseAllExplainData($tclassNo);
}
$smarty = Common::smarty();
$user = Common::student()->info();
$list = Common::student()->getStudentTclassList();
$topicDataList = Common::student()->getTopicListData($tclassNo, $user[1]);
$smarty->assign('stu',$user);
$smarty->assign('tClassList',$list);
$smarty->assign('zyList', $topicDataList['zy']);

$smarty->assign('courseExplainList',$courseExplainList);
$smarty->display('student.html');
