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

$smarty = Common::smarty();
$smarty->display('execute.html');
