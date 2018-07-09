<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/19
 * Time: 14:50
 */

namespace app\common\model;
use think\Model;
//资讯分类表
class NewsType extends Model
{
    //获取器--更改状态值
    public function getStateAttr($value)
    {
        $State = [1=>'显示',0=>'隐藏'];
        return $State[$value];
    }

    //关联查询
    public function newsType()
    {
        return $this->hasOne('News','news_type_id','id');
    }
}