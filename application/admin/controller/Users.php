<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/21
 * Time: 16:25
 */

namespace app\admin\controller;


use log\Logs;

class Users extends Base
{
    //用户列表
    public function users_index()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $where = [];
            if (input('get.search')){
                $where[] = ['username', 'like', '%'.input('get.search').'%'];
            }

            $info = \app\common\model\Users::where($where)
                ->order('id desc')
                ->paginate(15,false,['query'=>request()->param()]);
            unset($where);
            $this->assign(array(
                'display' => 'Users',
                'current' => 'users_index',
                'info' => $info,
            ));
            unset($info);
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //编辑用户
    public function editor_user()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('id/d');
            //查询用户数据
            $info = \app\common\model\Users::get($id)->getData();
            $this->assign(array(
                'display' => 'Users',
                'current' => 'editor_admin',
                'info' => $info,
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
    public function editor_user_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = \app\common\model\Users::where(['id' => $data['id']])->update($data);
            unset($data);
            if ($res) {
                //添加日志
                Logs::write('编辑用户','编辑');
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

    //删除用户
    public function del_user()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('post.id/d');
            $del_res = \app\common\model\Users::where(['id' => $id])->delete();
            if($del_res){
                //添加日志
                Logs::write('删除用户','删除');
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

}