<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/7
 * Time: 16:28
 */

namespace app\common\model;
use think\Model;
//管理员表
class Admin extends Model
{

    //关联查询
    public function groupName()
    {
        return $this->belongsToMany('Group','GroupAccess','group_id','uid');
    }

    //获取器--更改状态值
    public function getStatusAttr($value)
    {
        $Status = [1=>'正常',0=>'禁用'];
        return $Status[$value];
    }
}