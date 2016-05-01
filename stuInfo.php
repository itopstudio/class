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
$smarty = Common::smarty();
$user = Common::student()->info();
$list = Common::student()->getStudentTclassList();
$pszyList = Common::student()->getTopicList();
//print_r($pszyList);
$smarty->assign('stu',$user);
$smarty->assign('tClassList',$list);
$smarty->assign('pszyList', $pszyList);
$smarty->display('student.html');
