<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/1
 * Time: 20:56
 */
/**
 * 学生界面数据获取异步接口
 */
require_once('./common.php');

$request = Common::request();
$topicNo = $request->getPost('topicNo');

if(!empty($topicNo)){
    getTopic($topicNo);
}else{
    echo json_encode(array('status'=>'failed'));
}
/**
 *
 * @param $topicNo
 */
function getTopic($topicNo){
    if(is_numeric($topicNo)){
        $topicData = Common::student()->getTopic($topicNo);
        $status = 'success';
        $jsonArray = array('status'=>$status, 'data'=>$topicData);
        echo json_encode($jsonArray);
    }
}