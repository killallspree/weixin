<?php
/**
 * @name IndexController
 * @author huangpeng
 * @desc 默认控制器
 * @see http://www.php.net/manual/en/class.yaf-controller-abstract.php
 */
class IndexController extends Yaf_Controller_Abstract {
    public $actions = array(
        'checksign' => 'actions/index/CheckSign.php',
        'gettoken' => 'actions/index/GetToken.php',
    );
}
