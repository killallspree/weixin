<?php
/**
 * @name CheckSign.php
 * @desc 
 * @author huangpeng
 * @date 2016/10/17 18:59
 */

class Service_Page_Index_GetTokenModel {

    /**
     * @param $inputData
     * @return bool
     */
    public function execute($inputData){
        $obj = new Ald_Vender_Weixin_Token();
        return $obj -> getToken();
    }

}