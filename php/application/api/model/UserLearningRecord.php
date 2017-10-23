<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/23
 * Time: 10:40
 */

namespace app\api\model;


class UserLearningRecord extends Common
{
    protected $name = 'user_learning_record';
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;

    protected $insert = ['process' => 0]; //写入时自动写入

}