<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/1
 * Time: 16:15
 */
require_once('common.php');

$request = Common::request();
$formData = $request->getPost('student');

if(!empty($formData)){
    $id = $formData['id'];
    $passwd = $formData['password'];
    if(Common::student()->login($id, $passwd)){
        Common::redirect('stuInfo.php');
    }else{
        Common::renderError('用户名或密码错误');
    }
}else{
    Common::redirect('index.php');
}