<?php
/**
 * @name 
 * @desc 
 * @author huangpeng
 * @date 2016/8/15 17:51
 */

class Weixin_Const_Error {
    public static $MAP = array(
        Weixin_Const_Errno::ERR => '系统错误',
        Weixin_Const_Errno::ERR_SIGN => '签名错误',
    );

    public static function error($errno){
        if(isset(self::$MAP[$errno])){
            return self::$MAP[$errno];
        }
        return '';
    }
} 