<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/26
 * Time: 11:37
 */
namespace app\index\controller;

use app\common\model\News;

class Index
{
    public function index()
    {
        echo '小哥哥，快来玩';
        return view();
    }

    //加载资讯的点击量
    public function onloadClickNum()
    {
        $id = input('post.id');
        $info = News::where(['id' => $id])->field('click_num')->find();
        return json($info);
    }

}
