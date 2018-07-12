<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/21
 * Time: 14:15
 */

namespace app\admin\controller;
use \app\common\model\News;
use log\Logs;

class Comment extends Base
{
    //评论列表
    public function comment()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $where = [];
            if (input('get.search')){
                $where[] = ['b.comment_content', 'like', '%'.input('get.search').'%'];
            }
            $news_id = input('news_id/d');
            $commentList = News::alias('a')
                ->join(['cms_comment'=>'b'],'a.id=b.news_id')
                ->join(['cms_users'=>'c'],'b.user_id=c.id')
                ->field('a.title,b.id,b.comment_content,b.comment_time,b.check_state,c.username')
                ->where(['a.id' => $news_id])
                ->where($where)
                ->paginate(15,false,['query'=>request()->param()]);
            unset($where);
            $this->assign(array(
                'commentList' => $commentList,
                'display' => 'News',
                'current' => 'comment',
                'news_id' => $news_id,
            ));
            unset($commentList);
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑评论
    public function editor_comment()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $comment_id = input('comment_id/d');
            $info = \app\common\model\Comment::get($comment_id);
            $this->assign(array(
                'info' => $info,
                'display' => 'News',
                'current' => 'editor_comment',
            ));
            unset($info);
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_comment_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $editor_res = \app\common\model\Comment::where(['id' => $data['id']])->update($data);
            unset($data);
            if ($editor_res) {
                //添加日志
                Logs::write('编辑评论','编辑');
                $msg['status'] = 200;
                $msg['tips'] = '编辑成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '编辑失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //删除评论
    public function del_comment()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('post.id/d');
            $del_res = \app\common\model\Comment::where(['id' => $id])->delete();
            if($del_res){
                //添加日志
                Logs::write('删除评论','删除');
                $msg['status'] = 200;
                $msg['tips'] = '删除成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '删除失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //评论详情
    public function details()
    {
        $comment_id = input('comment_id/d');
        if (!$comment_id) {
            return 'no param!';
        }
        $info = \app\common\model\Comment::get($comment_id);
        return json($info);
    }

    //审核评论
    public function check_state()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $editor_res = \app\common\model\Comment::where(['id' => $data['id']])->update($data);
            if($editor_res){
                //添加日志
                Logs::write('审核评论','操作');
                $msg['status'] = 200;
                $msg['tips'] = '操作成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '操作失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }
}