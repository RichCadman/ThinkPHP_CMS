<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/13
 * Time: 9:17
 */

namespace app\admin\controller;
use app\common\model\FieldConfig;
use app\common\model\Group;
use app\common\model\Log;
use app\common\model\Rule;
use app\common\model\System as Systems;
use log\Logs;
//系统管理
class System extends Base
{
    //站点配置
    public function config()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Systems::find();
            $this->assign(array(
                'info' => $info,
                'display' => 'System',
                'current' => 'config',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //编辑站点
    public function editor_config_do()
    {
        $data = input('post.');
        $res = Systems::where(['id' => $data['id']])->update($data);
        if ($res) {
            //添加日志
            Logs::write('编辑站点','编辑');
            $msg['status'] = 200;
            $msg['tips'] = '编辑成功';
            return json($msg);
        }else{
            $msg['status'] = 400;
            $msg['tips'] = '编辑失败';
            return json($msg);
        }
    }

    //一键还原
    public function restore()
    {
        //权限组管理员id
        $system = Systems::find();
        $admin_id = $system['admin_id'];
        //查询所有二级规则
        $rules = Rule::where('p_id','<>',0)->select();
        //二维数组转为一维数组
        foreach ($rules as $v){
            $rule[] = $v['id'];
        }
        //数组转为字符串
        $data['rules'] = implode(",", $rule);
        //获取一级规则id
        foreach ($rules as $v){
            $menu_id[] = $v['p_id'];
        }
        //数组去重
        $menu_id = array_unique($menu_id);
        //数组转为字符串
        $data['menu_id'] = implode(",", $menu_id);
        //更新管理员权限组
        $update_res = Group::where(['id' => $admin_id])->update($data);
        if($update_res){
            $msg['status'] = 200;
            $msg['tips'] = '还原成功';
            return json($msg);
        }else{
            $msg['status'] = 400;
            $msg['tips'] = '还原失败';
            return json($msg);
        }
    }

    //日志管理
    public function logs()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = Log::order('id desc')->paginate(15);
            $this->assign(array(
                'info' => $info,
                'display' => 'System',
                'current' => 'logs',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //清空日志
    public function clearLogs()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //清空日志
            $delete_res = Log::where('id','>',0)->delete();
            if($delete_res){
                $msg['status'] = 200;
                $msg['tips'] = '清空成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '清空失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //字段类型配置
    public function field_type()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = FieldConfig::order('id desc')->paginate(15);
            $this->assign(array(
                'info' => $info,
                'display' => 'System',
                'current' => 'field_type',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加字段类型
    public function add_field_type()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $this->assign(array(
                'display' => 'System',
                'current' => 'add_field_type',
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_field_type_do()
    {
        if (IS_POST) {
            $data = input('post.');
            $res = FieldConfig::create($data);
            if ($res) {
                //添加日志
                Logs::write('添加字段类型','添加');
                $msg['status'] = 200;
                $msg['tips'] = '添加成功';
                return json($msg);
            }else{
                $msg['status'] = 400;
                $msg['tips'] = '添加失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '请求类型错误';
            return json($msg);
        }
    }

    //编辑字段类型
    public function editor_field_type()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //资讯内容
            $info = FieldConfig::get(input('get.id/d'));
            $this->assign(array(
                'display' => 'System',
                'current' => 'editor_field_type',
                'info' => $info
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_field_type_do()
    {
        $data = input('post.');
        $res = FieldConfig::where(['id' => $data['id']])->update($data);
        if ($res) {
            //添加日志
            Logs::write('编辑字段类型','编辑');
            $msg['status'] = 200;
            $msg['tips'] = '编辑成功';
            return json($msg);
        }else{
            $msg['status'] = 400;
            $msg['tips'] = '编辑失败';
            return json($msg);
        }
    }

    //删除字段类型
    public function del_field_type()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('post.id/d');
            $del_res = FieldConfig::where(['id' => $id])->delete();
            if($del_res){
                //添加日志
                Logs::write('删除字段类型','删除');
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