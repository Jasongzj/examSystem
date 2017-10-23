<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 15:26
 */
namespace app\api\model;

class Course extends Common
{
    protected $name = 'course';

    /**
     * 关联课程文章内容表
     * @return \think\model\relation\HasOne
     */
    public function content()
    {
        return $this->hasOne('CourseContent','course_id');
    }

    public function question()
    {
        return $this->hasMany('CourseQuestion', 'course_id');
    }
}