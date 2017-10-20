<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 15:26
 */
namespace app\api\model;

class Couser extends Common
{
    protected $name = 'course';

    public function content()
    {
        return $this->hasOne('CourseContent','course_id');
    }


}