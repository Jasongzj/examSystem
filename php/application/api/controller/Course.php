<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 15:23
 */

namespace app\api\controller;


use app\api\model\Couser;
use app\common\controller\Common;
use think\Db;

class Course extends Common
{
    /**
     * 课程学习首页
     */
    public function index()
    {
        $model = new Couser();
        //获取每个分类前两个课程
        $rawList = $model->alias('a')
            ->field('a.id, a.name, a.headimg, a.class_id, a.class_type, a.create_time')
            ->join('course b','a.class_id = b.class_id AND a.class_id < b.class_id')
            ->group('a.id, a.class_id')
            ->having('count(*) <= 2')
            ->order('a.class_id, a.create_time desc')
            ->select();
        //获取课程分类名
        $classNames = Db::name('class_categories')->select();
        foreach ($rawList as $key => $val) {
            $list[$val['class_id']][] = $val;
        }
        foreach ($classNames as $val) {
            $result[$val['name']][] = $list[$val['id']];
        }
        $this->result($result,'200','');
    }

    /**
     * 课程详情
     */
    public function find()
    {
        $param = $this->request->param();
        $id = $param['id'];
        $couser = Couser::get($id);
        $couser['content'] = $couser->content()->content;
        $this->result($couser,'200','');
    }


    /**
     * 获取我的课程
     */
    public function myCourse()
    {
        $param = $this->request->param();
        $userId = $param['uid'];

    }

    /**
     * 我的答疑
     */
    public function myQuestion()
    {
        $param = $this->request->param();
        $userId = $param['uid'];

    }

    /**
     * 提问详情
     */
    public function quesDetail()
    {
        $param = $this->request->param();
        $userId = $param['uid'];
    }

}