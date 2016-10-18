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
            echo $inputData['echostr'];die();
        }else{
            throw new Ald_Exception_AppWarning(Weixin_Const_Errno::ERR_SIGN);
        }
    }

}