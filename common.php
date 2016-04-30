<?php
/** =============================================================================
 * @name common.php
 * @date date 六  4/30 23:24:58 2016
 * @author lancelot<chenjunan@baidu.com>
 * @package 
 * =============================================================================
 */
class Common {
    private static $dbHost = 'cp01-public.epc:8806';

    private static $dbUser = 'dftroot';

    private static $dbPass = 'DFT@TAlrB=xyBzQyXUtElmR6kltW';

    private static $dbName = 'stormtest2';

    public static function smarty() {
        require_once('./smarty/Smarty.class.php');
        return new Smarty();
    }

    public static function db() {
        require_once('db.php');
        $db = DB::instance()->open(self::$dbHost, self::$dbUser, self::$dbPass, self::$dbName);
        return $db;
    }
}
