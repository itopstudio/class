<?php
/** =============================================================================
 * @name login.php
 * @date date 日  5/ 1 15:25:49 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
require_once('common.php');

$request = Common::request();
$formData = $request->getPost('teacher');

if (!empty($formData)) {
    $id = $formData['id'];
    $passwd = $formData['password'];
    if (Common::teacher()->login($id, $passwd)) {
        Common::redirect('create.php');
    } else {
        Common::renderError('用户名或密码错误');
    }
} else {
    Common::redirect('index.php');
}
