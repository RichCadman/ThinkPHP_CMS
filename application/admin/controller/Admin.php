<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/7
 * Time: 13:51
 */

namespace app\admin\controller;

use app\common\model\Admin as Admins;
use app\common\model\Group;
use app\common\model\GroupAccess;
use log\Logs;

//管理员类
class Admin extends Base
{
    //用户总览
    public function admin_index()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Admins::with("groupName")->order('id asc')->paginate(10);
            //$info = $info->groupName;
            //dump($info);exit;
            $this->assign(array(
                'display' => 'Admin',
                'current' => 'admin_index',
                'info' => $info,
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加用户页面
    public function add_admin()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //查询权限组
            $group = Group::all();
            $this->assign(array(
                'display' => 'Admin',
                'current' => 'add_admin',
                'group' => $group,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_admin_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //判断名称是否已经存在
            $check = Admins::where('username', $data['username'])->find();
            if ($check) {
                $msg['status'] = 600;
                $msg['tips'] = '该用户名已存在';
                return json($msg);
            } else {
                //添加用户
                //$add_res = Admins::create($data, ['username,password,qq,wx,phone,address']);
                $add_res = Admins::create([
                    'username' => $data['username'],
                    'password' => md5($data['password']),
                    'qq' => $data['qq'],
                    'wx' => $data['wx'],
                    'phone' => $data['phone'],
                    'address' => $data['address'],
                ]);
                if ($add_res->id) {
                    //添加该用户权限组
                    GroupAccess::create([
                        'uid' => $add_res->id,
                        'group_id' => $data['group_id'],
                    ]);
                    //添加日志
                    Logs::write('添加用户', '添加');
                    $msg['status'] = 200;
                    $msg['tips'] = '添加成功';
                    return json($msg);
                } else {
                    $msg['status'] = 400;
                    $msg['tips'] = '添加失败';
                    return json($msg);
                }
            }
        } else {
            return 'request method error!';
        }

    }

    //编辑用户页面
    public function editor_admin()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('id/d');
            //查询用户数据
            $info = Admins::get($id)->getData();
            //查询权限组
            $group = Group::all();
            //查询用户权限组id
            $group_access = GroupAccess::where(['uid' => $id])->find();
            $this->assign(array(
                'display' => 'Admin',
                'current' => 'editor_admin',
                'info' => $info,
                'group' => $group,
                'group_access' => $group_access,
            ));
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑基本信息
    public function editor_admin_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //判断名称是否已经存在
            //查看提交标题是否与其他权限组标题冲突
            $check = Admins::where('id', '<>', $data['id'])
                ->where('username', $data['username'])
                ->find();
            if ($check) {
                $msg['status'] = 600;
                $msg['tips'] = '该用户名已存在';
                return json($msg);
            } else {
                $res = Admins::where(['id' => $data['id']])->update($data);
                if ($res) {
                    //添加日志
                    $users = session('admin');
                    Logs::write('编辑基本信息', '编辑');
                    //更新session
                    $userinfo = Admins::get($users['id']);
                    session('admin', $userinfo);
                    $msg['status'] = 200;
                    $msg['tips'] = '编辑成功';
                    return json($msg);
                } else {
                    $msg['status'] = 400;
                    $msg['tips'] = '编辑失败';
                    return json($msg);
                }
            }
        } else {
            return 'request method error!';
        }
    }

    //修改密码
    public function editor_password_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['password'] = md5($data['password']);
            $res = Admins::where(['id' => $data['id']])->update($data);
            if ($res) {
                //添加日志
                Logs::write('修改密码', '编辑');
                $msg['status'] = 200;
                $msg['tips'] = '编辑成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '编辑失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //修改权限组
    public function editor_group_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['password'] = md5($data['password']);
            $res = Admins::where(['id' => $data['id']])->update($data);
            if ($res) {
                //添加日志
                Logs::write('修改密码', '编辑');
                $msg['status'] = 200;
                $msg['tips'] = '编辑成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '编辑失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //删除用户
    public function del_admin()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('post.id/d');
            if ($id == 1) {
                $msg['status'] = 800;
                $msg['tips'] = '无法删除管理员';
                return json($msg);
            } else {
                $del_res = Admins::where(['id' => $id])->delete();
                if ($del_res) {
                    //添加日志
                    Logs::write('删除用户', '删除');
                    $msg['status'] = 200;
                    $msg['tips'] = '删除成功';
                    return json($msg);
                } else {
                    $msg['status'] = 400;
                    $msg['tips'] = '删除失败';
                    return json($msg);
                }
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //个人中心
    public function my()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $users = session('admin');
            $info = Admins::with("groupName")->select($users['id']);
            $this->assign(array(
                'display' => 'Admin',
                'current' => 'my',
                'info' => $info,
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //编辑个人信息
    public function editor_my()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('id/d');
            //查询用户数据
            $info = Admins::get($id)->getData();
            $this->assign(array(
                'display' => 'Admin',
                'current' => 'editor_admin',
                'info' => $info,
            ));
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

}