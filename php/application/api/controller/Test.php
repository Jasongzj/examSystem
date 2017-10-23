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

    /**
     * 生成考试题
     */
    public function generateTest()
    {
        $param = $this->request->param();
        $userId = $param['uid'];
    }

    /**
     * 计算考试结果
     */
    public function testResult()
    {
        $param = $this->request->param();
        $userId = $param['uid'];

        //记录考试成绩
    }

    /**
     * 获取考试排名
     */
    public function testRank()
    {
        $param = $this->request->param();
        $userId = $param['uid'];
    }
}