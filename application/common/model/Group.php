<?php
/**
 * Created by PhpStorm.
 * User: Mr.liu
 * Date: 2018/6/10
 * Time: 15:10
 */

namespace app\common\model;
use think\Model;
class Group extends Model
{
    //获取器--更改状态值
    public function getStatusAttr($value)
    {
        $Status = [1=>'正常',0=>'禁用'];
        return $Status[$value];
    }
}