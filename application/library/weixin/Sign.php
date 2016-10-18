<?php
/**
 * @name Sign.php
 * @desc 
 * @author huangpeng
 * @date 2016/10/17 19:04
 */

class Weixin_Sign{

    /**
     * 生成签名
     * @param $token
     * @param $timestamp
     * @param $nonce
     * @return string
     */
    public static function genSign($token, $timestamp, $nonce){
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode($tmpArr);
        return sha1($tmpStr);
    }

    /**
     * 检查签名
     * @param $data
     * @return bool
     */
    public static function checkSign($data){
        if(!isset($data['token']) || !isset($data['timestamp']) || !isset($data['nonce']) || !isset($data['signature'])){
            return false;
        }
        $genSign = self::genSign($data['token'], $data['timestamp'], $data['nonce']);
        if($genSign != $data['signature']){
            return false;
        }else{
            return true;
        }
    }

}