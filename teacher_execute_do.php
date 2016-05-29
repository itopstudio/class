<?php
/**
 * 执行页面数据交互
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/22
 * Time: 22:30
 */

require_once ('common.php');

if(!Common::teacher()->isLogin()) {
    echo json_encode(array('status'=>0));
    exit(0);
}
$request = Common::request();
$type = $request->getPost('type');

