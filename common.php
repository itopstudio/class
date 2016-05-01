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

    private static $dbName = 'stormtest2';
 */
    private static $dbHost = 'localhost';

    private static $dbUser = 'root';

    private static $dbPass = '';

    private static $dbName = 'stormtest2';

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
}
