<?php
/**
 * Created by PhpStorm.
 * User: Mr.liu
 * Date: 2018/6/9
 * Time: 18:20
 */

namespace app\common\model;
use think\Model;
//规则表
class Rule extends Model
{
    //获取器--更改状态值
    public function getIsVisibleAttr($value)
    {
        $IsVisible = [1=>'显示',2=>'隐藏'];
        return $IsVisible[$value];
    }
}