<?php
/**
 * @name CheckSign.php
 * @desc 
 * @author huangpeng
 * @date 2016/10/17 18:59
 */
class GetTokenAction extends Ald_Action{

    public function doGet($inputData){
        $obj = new Service_Page_Index_GetTokenModel();
        return $obj -> execute($inputData);
    }
}