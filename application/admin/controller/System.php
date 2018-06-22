<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/13
 * Time: 9:17
 */

namespace app\admin\controller;
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
}