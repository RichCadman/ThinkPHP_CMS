<?php
namespace app\common\model;
use think\Model;
//用户表
class Users extends Model
{
    //获取器
    public function getStateAttr($value)
    {
        $State = [0=>'禁用',1=>'正常'];
        return $State[$value];
    }
}