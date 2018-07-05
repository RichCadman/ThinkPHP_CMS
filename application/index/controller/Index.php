<?php

namespace app\index\controller;

use app\common\model\News;

class Index
{
    public function index()
    {
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
