<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/22
 * Time: 14:54
 */
require_once ('common.php');
require_once ('upload.class.php');
$UPLOAD_LIMIT_FILE_TYPE = array(
    'word',
    'zip',
    'rar',
    'pdf'
);
const UPLOAD_BASE_DIR = 'upload';
if(!Common::student()->isLogin()){
    echo json_encode(array('status'=>0));
    exit(0);
}
$request = Common::request();
$postJudgeNo = $request->getQuery('judge_no');
$postFile = $request->getFile('file');
if(isset($postJudgeNo) && isset($postFile)) {
    $uploader = new Upload(UPLOAD_BASE_DIR, $UPLOAD_LIMIT_FILE_TYPE);
    if($uploader->check($postFile)) {
        $uploadResult = $uploader->start();
        if(!empty($uploadResult)) {
            Common::student()->updateJudgeInfo($postJudgeNo, $uploadResult);
            $result = array('status'=>1, 'file'=>$uploadResult);
            echo json_encode($result);
        }
    }
} else {
    return json_encode(array('status'=>0));
}