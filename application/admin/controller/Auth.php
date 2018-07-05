<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/5/25
 * Time: 9:46
 */

namespace app\admin\controller;
use app\common\model\Group;
use app\common\model\Rule;
use log\Logs;
//权限操作类
class Auth extends Base
{
    //规则总览
    public function rule_index()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Rule::where(['p_id' => 0])->order('id desc')->paginate(2);
            foreach ($info as $k => &$v){
                $p_id = $v['id'];
                $v['items'] = Rule::where(['p_id' => $p_id])->select();
            }
            $this->assign(array(
                'info' => $info,
                'display' => 'Auth',
                'current' => 'rule_index',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }

    }

    //添加规则页面
    public function add_rule()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Rule::where(['p_id' => 0])->select();
            //$info = db('rule')->select();
            $this->assign(array(
                'display' => 'Auth',
                'current' => 'add_rule',
                'info' => $info,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }

    }

    //添加规则
    public function add_rule_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = Rule::create($data);
            if ($res) {
                //添加日志
                Logs::write('添加规则','添加');
                $msg['status'] = 200;
                $msg['tips'] = '添加成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '添加失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //编辑规则页面
    public function editor_rule()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('id/d');
            //查询数据
            $info = Rule::get($id)->getData();
            //查询规则组
            $rule = Rule::where(['p_id' => 0])->select();
            $this->assign(array(
                'display' => 'Auth',
                'current' => 'editor_rule',
                'info' => $info,
                'rule' => $rule,
            ));
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //修改规则
    public function editor_rule_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = Rule::where(['id' => $data['id']])->update($data);
            if ($res) {
                //添加日志
                Logs::write('编辑规则','编辑');
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

    //删除规则
    public function del_rule()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('post.id/d');
            $del_res = Rule::where(['id' => $id])->delete();
            if($del_res){
                //删除子数据
                Rule::where(['p_id' => $id])->delete();
                //添加日志
                Logs::write('删除规则','删除');
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

    //--------------------------------权限组---------------------

    //权限组总览
    public function group_index()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Group::order('id asc')->paginate(10);

            $this->assign(array(
                'display' => 'Auth',
                'current' => 'group_index',
                'info' => $info,
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加权限组页面
    public function add_group()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Rule::where(['p_id' => 0])->select();
            foreach ($info as $k => &$v){
                $p_id = $v['id'];
                $v['items'] = Rule::where(['p_id' => $p_id])->select();
            }
            $this->assign(array(
                'display' => 'Auth',
                'current' => 'add_group',
                'info' => $info,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }

    }

    //添加权限组
    public function add_group_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $check = Group::where('title',$data['title'])->find();
            if($check){
                $msg['status'] = 800;
                $msg['tips'] = '该用户组已存在';
                return json($msg);
            }else{
                //获取所有规则ID
                $rules = $data['rules'];
                //处理操作权限组
                //数组转为字符串
                $data['rules'] = $rules_str = implode(",", $rules);
                //处理显示权限组
                //根据提交过来的规则id组查询他们的p_id
                $info = Rule::all($rules_str);
                //循环得出p_id
                foreach ($info as $k => $v) {
                    $menu_id[] = $v['p_id'];
                }
                //数组去重
                $menu_id = array_unique($menu_id);
                //数组转为字符串
                $data['menu_id'] = implode(",", $menu_id);
                //添加到用户组
                $add_res = Group::create($data);
                if ($add_res) {
                    //添加日志
                    Logs::write('添加权限组','添加');
                    $msg['status'] = 200;
                    $msg['tips'] = '添加成功';
                    return json($msg);
                }else{
                    $msg['status'] = 400;
                    $msg['tips'] = '添加失败';
                    return json($msg);
                }
            }

        } else {
            return 'request method error!';
        }
    }

    //编辑权限组页面
    public function editor_group()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Rule::where(['p_id' => 0])->select();
            foreach ($info as $k => &$v){
                $p_id = $v['id'];
                $v['items'] = Rule::where(['p_id' => $p_id])->select();
            }
            $id = input('id/d');
            $group = Group::where(['id' => $id])->find()->getData();
            //获取权限值
            $rules = $group['rules'];
            $rules_str = explode(",", $rules);
            $this->assign(array(
                'current' => 'editor_group',
                'display' => 'Auth',
                'info' => $info,
                'str' => $rules_str,
                'group' => $group,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑权限组
    public function editor_group_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //权限组id
            $id = $data['id'];
            //查看提交标题是否与其他权限组标题冲突
            $check = Group::where('id','<>',$id)
                ->where('title',$data['title'])
                ->find();
//            return json($check);exit;
            if ($check) {
                $msg['status'] = 600;
                $msg['tips'] = '该用户组已存在';
                return json($msg);
            } else {
                //数组转为字符串
                $data['rules'] = $rules_str = implode(",",  $data['rules']);
                //处理显示权限组
                //根据提交过来的规则id组查询他们的p_id
                $info = Rule::all($rules_str);
                //循环得出p_id
                foreach ($info as $k => $v) {
                    $menu_id[] = $v['p_id'];
                }
                //数组去重
                $menu_id = array_unique($menu_id);
                //数组转为字符串
                $data['menu_id'] = implode(",", $menu_id);
                $editor_res = Group::where(['id'=>$id])->update($data);
                //var_dump($msg);exit;
//                $res = db('group')->where("id", "$id")->update($msg);
                if ($editor_res) {
                    //添加日志
                    Logs::write('编辑权限组','编辑');
                    $msg['status'] = 200;
                    $msg['tips'] = '编辑成功';
                    return json($msg);
                }else{
                    $msg['status'] = 400;
                    $msg['tips'] = '编辑失败';
                    return json($msg);
                }
            }
        } else {
            return 'request method error!';
        }

    }

    //删除权限组
    public function del_group()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('post.id/d');
            $del_res = Group::where(['id' => $id])->delete();
            if($del_res){
                //添加日志
                Logs::write('删除权限组','删除');
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