<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/7/3
 * Time: 11:18
 */

namespace app\admin\controller;
use app\common\model\News;
//静态页面生成类
class CreateHtml extends Base
{
    //初始化
    public function initialize()
    {
        parent::initialize();
        $this->expire_time = 3600;
    }

    //生成静态页
    public function create()
    {
        $this->assign(array(
            'display' => 'CreateHtml',
            'current' => 'create',
        ));
        return view();
    }
    //生成所有
    public function createAll()
    {
        $this->createIndex();
        $this->articleList();
        $this->articleDetail();

        $msg['status'] = 200;
        $msg['tips'] = '操作成功';
        return json($msg);
    }

    //删除静态文件并生成
    public function deleteCreateAll()
    {
        deldir('./html');
        unlink('./index.html');
        $this->createIndex();
        $this->articleList();
        $this->articleDetail();

        $msg['status'] = 200;
        $msg['tips'] = '操作成功';
        return json($msg);
    }

    //生成首页
    public function createIndex()
    {
        if(is_file('./index.html') && (time() - filemtime('./index.html') < $this->expire_time))
        {
            //缓存未失效则直接加载静态文件
            require_once('./index.html');
            ob_clean();
        }
        else
        {
            //缓存失效了则重新生成
            try
            {
                $info = News::select();
            }
            catch(Exception $e)
            {
                // TODO
            }
            ob_start();
            require_once('template/index.php');//引入模版文件
            file_put_contents('./index.html', ob_get_contents());//生成静态文件
            ob_clean();
        }
    }

    //生成资讯列表页（含分页）
    public function articleList()
    {
        $newsCount = News::count();
        //每页显示记录数
        $page_size = 1;
        //总页数
        $total_page = ceil(intval($newsCount)/intval($page_size));   //分页数(向上取整)
        if($total_page>0){
            for ($ii=1;$ii<=$total_page;$ii++){
                $filename = './html/newsList_p'.$ii.'.html';
                if(is_file($filename) && (time() - filemtime($filename) < $this->expire_time))
                {
                    //缓存未失效则直接加载静态文件
                    require($filename);
                    ob_clean();
                }
                else
                {
                    //缓存失效了则重新生成
                    try
                    {
                        //获取当前页
                        $cur_page = $ii;
                        //限制当前页
                        //最小不能小于1，最大不能大于总页数
                        //$cur_page = 1
                        if($cur_page<1){
                            $cur_page = 1;
                        }else if($cur_page>$total_page&&$total_page!=0){//$cur_page = 1
                            //$total_page = 0
                            $cur_page = $total_page;
                        }
                        $offset = ($cur_page-1)*$page_size;//偏移量
                        //查询数据
                        $info = News::limit($offset,$page_size)->select();

                        //首页 上一页
                        //上一页 = 当前页-1
                        $prev = $cur_page-1; //1-1=0
                        $flist = "";
                        if($prev>0){
                            $flist = "<a href='./newsList_p1.html'>&lt;&lt;</a>
                                        <a href='./newsList_p$prev.html'>&lt;</a>";
                        }
                        //尾页 下一页
                        //下一页 = 当前页 + 1
                        $next = $cur_page + 1;//40+1=41(可以看下一页）
                        //41+1=42(没有下一页)
                        $llist = "";
                        if($next<=$total_page){
                            $llist = "
                             <a href='./newsList_p$next.html'>&gt;</a>
                             <a href='./newsList_p$total_page.html'>&gt;&gt;</a>";
                        }

                        $num = 3;
                        $mlist = "";
                        for($i=$num;$i>=1;$i--){
                            $n = $cur_page-$i;
                            if($n>=1){
                                $mlist.="<a href='./newsList_p$n.html'>$n</a>";
                            }
                        }
                        //当前页
                        $mlist.= "<b>$cur_page</b>";
                        //5 6 7
                        for($i=1;$i<=$num;$i++){
                            $n = $cur_page+$i;
                            if($n<=$total_page){
                                $mlist.="<a href='./newsList_p$n.html'>$n</a>";//567
                            }

                        }
                        $host = 'http://'.$_SERVER['SERVER_NAME'].'/index.php/index';
                    }
                    catch(Exception $e)
                    {
                        // TODO
                    }
                    ob_start();
                    require('template/newsList.php');//引入模版文件
                    if ($ii == 1) {
                        file_put_contents('./html/newsList.html', ob_get_contents());//生成静态文件
                    }
                    file_put_contents('./html/newsList_p'.$ii.'.html', ob_get_contents());//生成静态文件
                    ob_clean();
                }
            }
        }
    }

    //生成资讯详情页
    public function articleDetail()
    {
        $info = News::select();
        foreach ($info as $k => $v){
            $id = $v['id'];
            $filename = './html/newsDetail_'.$id.'.html';
            if(is_file($filename) && (time() - filemtime($filename) < $this->expire_time))
            {
                //缓存未失效则直接加载静态文件
                require('./html/newsDetail_'.$id.'.html');
            }
            else
            {
                //缓存失效了则重新生成
                try
                {
                    $newsDetail = News::where(['id' => $id])->find();
                    $host = 'http://'.$_SERVER['SERVER_NAME'].'/index.php/index';
                }
                catch(Exception $e)
                {
                    // TODO
                }
                ob_start();
                require('template/newsDetail.php');//引入模版文件
                file_put_contents('./html/newsDetail_'.$id.'.html', ob_get_contents());//生成静态文件
                ob_clean();
            }
        }
    }
}