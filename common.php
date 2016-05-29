<?php
/** =============================================================================
 * @name common.php
 * @date date 六  4/30 23:24:58 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
class Common {
/*    private static $dbHost = 'cp01-public.epc:8806';

    private static $dbUser = 'dftroot';

    private static $dbPass = 'DFT@TAlrB=xyBzQyXUtElmR6kltW';

    private static $dbName = 'stormtest2';*/

    private static $dbHost = 'localhost';

    private static $dbUser = 'root';

    private static $dbPass = 'root';

    private static $dbName = 'wxl';

    private static $smarty;

    public static function smarty() {
        if (self::$smarty === null) {
            require_once('./smarty/Smarty.class.php');
            self::$smarty = new Smarty();
        }

        return self::$smarty;
    }

    public static function teacherNav($activeTab = 1) {
        $teacher = self::teacher()->info();
        $smarty = self::smarty();
        $smarty->assign('activeTab', $activeTab);
    }

    public static function db() {
        require_once('db.php');
        $db = DB::instance(self::$dbHost, self::$dbUser, self::$dbPass, self::$dbName);
        return $db;
    }

    public static function teacher() {
        require_once('teacher.php');
        return Teacher::instance();
    }

    public static function assertTeacherLogin($url = 'login.php') {
        if (!self::teacher()->isLogin()) {
            self::redirect($url);
        }
    }

    public static function redirect($url) {
        header('Location: '.$url);
        exit(0);
    }

    public static function request() {
        require_once('request.php');
        return Request::instance();
    }

    public static function renderError($message) {
        $smarty = self::smarty();
        $smarty->assign('message', $message);
        $smarty->display('error.html');
    }

    //Student Start

    public static function student(){
        require_once('student.php');
        return Student::instance();
    }

    public static function assertStudentLogin($url = 'login.php') {
        if (!self::teacher()->isLogin()) {
            self::redirect($url);
        }
    }
    
    public static function tables() {
        require_once ('./dao/Tables.php');
        return Tables::instance();
    }

    /**
     * Check proportion's sum is 100;
     * @param string $proportionArr
     * @return int|string
     */
    public static function checkProportion($proportionArr = '') {
        $sum = 0;
        if(!empty($proportionArr) && is_array($proportionArr)) {
            foreach ($proportionArr as $value) {
                if(!is_numeric($value)) {
                    return 0;
                }
                $sum+=$value;
            }
            return $sum<=100 ? $sum : 0;
        } else {
            return 0;
        }

    }

    /**
     * 发送操作结果
     * @param string $status
     */
    public static function sendAjaxStatus($status = '') {
        $result = array('status'=>1);
        if(empty($status) && $status == false) {
            $result['status'] = 0;
        }
        echo json_encode($result);
    }
    
}
