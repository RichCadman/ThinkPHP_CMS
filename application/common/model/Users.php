<?php
namespace app\common\model;
use think\Model;
/**
 * Created by PhpStorm.
 * User: Mr.liu
 * Date: 2018/6/3
 * Time: 16:15
 */
class Users extends Model
{
    //获取器
    public function getStateAttr($value)
    {
        $State = [0=>'禁用',1=>'正常'];
        return $State[$value];
    }
}