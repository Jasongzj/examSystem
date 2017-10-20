<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 18:20
 */

namespace app\api\controller;


use app\common\controller\Common;

class Test extends Common
{
    /**
     * 我的考试记录
     */
    public function testRecord()
    {
        $param = $this->request->param();
        $userId = $param['uid'];
    }
}