<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/14
 * Time: 20:50
 */
require_once('./common.php');
$request = Common::request();
$doTypes = array(
    'jbzc', //基本组成
    'jfxx', //加分选项
    'ypfj'  //一票否决
);
$doType = $request->getQuery('do_type');
$tclassNo = $request->getQuery('tclass_no');
//基本组成 ajax json
$postJson = $request->getPost('data');
$postData = json_decode($postJson);
foreach ($postData as $key => $item) {
/*    $tmpItem['zcx'] = $item->zcx;
    $tmpItem['bili'] = $item->bili;
    $tmpItem['cishu'] = $item->cishu;
    $tmpItem['shuoming'] = $s*/
    $postData[$key] = (array) json_decode($item);
}
$result = false;
if(isset($doType) && isset($tclassNo)) {
    $doTypeIndex = array_search($doType, $doTypes);
    switch ($doTypeIndex) {
        case 0:
            $result = Common::teacher()->createBaseData($tclassNo, $postData);
            break;
        case 1:
            $result = Common::teacher()->createBonusOption($tclassNo, $postData);
            break;
        case 2:
            $result = Common::teacher()->createVetoPower($tclassNo, $postData);
            break;
        default:
            $result = false;
    }
}
//发送操作结果
Common::sendAjaxStatus($result);
