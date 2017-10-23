<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/23
 * Time: 16:12
 */

namespace app\api\model;


class CourseQuestion extends Common
{
    protected $name = 'course_question';


    public function answer()
    {
        return $this->hasOne('CourseAnswer', 'question_id');
    }
}