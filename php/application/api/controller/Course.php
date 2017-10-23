<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 15:23
 */

namespace app\api\controller;


use app\api\model\CourseQuestion;
use app\api\model\UserLearningRecord;
use app\common\controller\Common;
use think\Db;
use think\Validate;
use app\api\model\Course as CourseModel;
use app\api\model\User;

class Course extends Common
{
    /**
     * 课程学习首页
     */
    public function index()
    {
        $model = new CourseModel();
        //获取每个分类前两个课程
        $rawList = $model->alias('a')
            ->field('a.id, a.name, a.headimg, a.class_id, a.class_type, a.create_time')
            ->join('course b','a.class_id = b.class_id AND a.create_time < b.create_time', 'left')
            ->where('status', 0)
            ->group('a.id, a.class_id')
            ->having('count(*) <= 2')
            ->order('a.class_id, a.create_time desc')
            ->select();
        //将结果按分类id组合
        $list = [];
        foreach ($rawList as $key => $val) {
            $list[$val['class_id']][] = $val;
        }

        //获取课程分类名
        $classNames = Db::name('class_categories')->select();
        $result = [];
        foreach ($classNames as $val) {
            $result[$val['name']][] = $list[$val['id']];
        }
        $this->result($result,200,'');
    }

    /**
     * 获取课程详情并开始学习
     */
    public function find($id, $uid = '')
    {
        $param['course_id'] = $id;
        $param['user_id'] = $uid;
        $validate = validate('Course');
        if (!$validate->check($param)) {
            $this->result('', 600, $validate->getError());
        }
        $course = CourseModel::get($id);
        if ($course['class_type'] == 2) {
            $course['content'] = $course->content()->content;
            //记入用户学习记录
            if (!empty($uid)) {
                $userModel = new UserLearningRecord();
                $record = $userModel->createData($param);
                if (!$record) {
                    $this->result('',600, $userModel->getError());
                }
            }
        }
        //获取答疑提问
        $question = $course->question()->where('status', 0)->select();
        if (!empty($question)) {
            //获取用户信息
            $userIds = array_column($question,'user_id');
            $userModel = new User();
            $userList = $userModel->where('id', 'in', $userIds)->field('id, nickname, avatar_url')->select();
            foreach ($userList as $val) {
                $userMap[$val['id']] = $val;
            }
            foreach ($question as $key => $ques) {
                $question[$key]['user_info'] = $userMap[$ques['user_id']];
            }
        }
        $course['question'] = $question;
        $this->result($course,200,'success');
    }

    /**
     * 获取课程列表
     */
    public function findList($id, $page = '1', $limit = '10')
    {
        $model = new CourseModel();
        $list = $model->where('class_id', $id)
            ->where('status', 0)
            ->page($page, $limit)
            ->select();
        if (empty($list)) {
            $this->result([],600,'暂无课程内容');
        }
        $this->result($list, 200,'');
    }

    /**
     * 获取我学习的课程
     */
    public function myCourse($id, $page = '1', $limit = '10')
    {
        if (empty($id) || !is_numeric($id)) {
            $this->result('', 600, '缺少参数或格式错误');
        }
        $model = new UserLearningRecord();
        $list = $model->where('user_id', $id)->select();
        if (!$list) {
            $this->result('', 600, '暂未学习课程');
        }
        $courseIds = array_column($list, 'course_id');
        $courseModel = new CourseModel();
        $courseList = $courseModel->where('id', 'in', $courseIds)->page($page, $limit)->select();
        $this->result($courseList, 200, '');
    }

    /**
     * 我的答疑
     */
    public function myQuestion($id)
    {
        if (empty($id) || !is_numeric($id)) {
            $this->result('', 600, '缺少参数或格式错误');
        }
        $model = new CourseQuestion();


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