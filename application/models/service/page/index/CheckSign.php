<?php
/**
 * @name CheckSign.php
 * @desc 
 * @author huangpeng
 * @date 2016/10/17 18:59
 */

class Service_Page_Index_CheckSignModel {

    /**
     * @param $inputData
     * @return bool
     */
    public function execute($inputData){
        if(Weixin_Sign::checkSign($inputData)){
            return $inputData['echostr'];
        }else{
            return false;
        }
    }

}