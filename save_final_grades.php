<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/15
 * Time: 21:15
 */
session_start();
require_once('./common.php');
$request = Common::request();
$tclassNo = $request->getQuery('tclass_no');
//导入PHPExcel扩展库
require_once('./ext/phpexcel/Classes/PHPExcel.php');
if(isset($_SESSION['saveFinalGrades'])) {
    $finalGradesData = $_SESSION['saveFinalGrades'];
    $excelTitle = array('学号','姓名','总成绩');
    $letter = array('A','B','C');
    $excel = new PHPExcel();
    //设置title
    for ($i=0; $i<count($excelTitle); $i++) {
        $excel->getActiveSheet()->setCellValue($letter[$i].'1', $excelTitle[$i]);
    }
    //写入数据
    $j = 2; //从第二行开始
    foreach ($finalGradesData as $item) {
        $itemIndex = 0;
        foreach ($letter as $titleIndex) {
            $excel->getActiveSheet()->setCellValue($titleIndex.$j, $item[$itemIndex]);
            $itemIndex++;
        }
        $j++;
    }
    //导出文件
    $excelFileName = isset($tclassNo)? $tclassNo.'.xls':'final_grades.xls';
    $excelWrite = new PHPExcel_Writer_Excel5($excel);
    //header
    header("Content-Type: application/force-download");
    header("Content-Type: application/octet-stream");
    header("Content-Type: application/download");
    header('Content-Disposition:inline;filename="'.$excelFileName.'"');
    header("Content-Transfer-Encoding: binary");
    header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("Pragma: no-cache");
    //生成文件下载
    $excelWrite->save('php://output');
    
}