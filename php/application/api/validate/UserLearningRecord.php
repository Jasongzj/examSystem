<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/23
 * Time: 10:47
 */

namespace app\api\validate;


use think\Validate;

class UserLearningRecord extends Validate
{
    protected $rule = [
      'user_id' => 'require|number',
      'course_id' => 'require|number',
    ];

    protected $message = [
        'user_id.require'   => '缺少用户id',
        'user_id.number'     => '用户id必须是数字',
        'course_id.require' => '缺少课程id',
        'course_id.number'   => '课程id必须是数字'
    ];

    protected $scene = [
        'myCourse' => 'user_id',

    ];
}