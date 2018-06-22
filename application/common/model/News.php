<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/20
 * Time: 11:43
 */

namespace app\common\model;
use think\Model;

class News extends Model
{
    //关联查询资讯分类
    public function newsType()
    {
        return $this->hasOne('NewsType','id','news_type_id');
    }

    //获取器--更改状态值
    public function getStateAttr($value)
    {
        $State = [1=>'显示',0=>'隐藏'];
        return $State[$value];
    }

    //获取器--更改状态值
    public function getCheckStateAttr($value)
    {
        $CheckState = [1=>'未审核',0=>'审核通过'];
        return $CheckState[$value];
    }
}