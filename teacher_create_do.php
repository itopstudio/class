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
if(isset($doType) && isset($tclassNo)) {
    $doTypeIndex = array_search($doType, $doTypes);
    $formData = $request->getPost($doType);
    switch ($doTypeIndex) {
        case 0:
            Common::teacher()->createBaseData($tclassNo, $formData);
            break;
        case 1:
            Common::teacher()->createBonusOption($tclassNo, $formData);
            break;
        case 2:
            Common::teacher()->createVetoPower($tclassNo, $formData);
            break;
        default:
            echo json_decode(array('status'=>0));
    }
}
