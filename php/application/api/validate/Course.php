<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/23
 * Time: 11:50
 */

namespace app\api\validate;


use think\Validate;

class Course extends Validate
{
    protected $rule = [
        'user_id' => 'number',
        'course_id' => 'require|number',
    ];

    protected $message = [
        'user_id.number'     => '用户id必须是数字',
        'course_id.require' => '缺少课程id',
        'course_id.number'   => '课程id必须是数字'
    ];


}