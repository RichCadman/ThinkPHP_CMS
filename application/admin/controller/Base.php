<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/7
 * Time: 13:52
 */

namespace app\admin\controller;
use app\common\model\Group;
use app\common\model\GroupAccess;
use app\common\model\Rule;
use app\common\model\System;
use think\Controller;
use think\Request;

class Base extends Controller
{
    //初始化
    public function initialize()
    {
        if (!session('?admin')) {
            $this->redirect('Login/login');
        }
        //系统配置
        $system = System::find();
        //渲染输出
        $this->assign(array(
            'system' => $system,
        ));

        /*定义常量 */
        define('MODULE_NAME', request()->module());
        define('CONTROLLER_NAME', request()->controller());
        define('ACTION_NAME', request()->action());
        define('IS_POST', request()->isPost());

        //获取请求的控制器
        $controller_url = MODULE_NAME.'/'.CONTROLLER_NAME;
        $controller = Rule::where(['name'=>$controller_url])->find();
        //echo Rule::getLastSql();exit;
        //获取请求的方法
        $action_url = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        $action = Rule::where(['name'=>$action_url])->find();
        //渲染输出
        $this->assign(array(
            'controller_name' => $controller['title'],
            'action_name' => $action['title'],
        ));

        //菜单
        $menu = Rule::where(['is_visible' => 1,'p_id' => 0])->order('show_order desc')->cache(3600)->select();
        foreach($menu as &$v){
            $p_id = $v['id'];
            $v['items'] = Rule::where(['is_visible' => 1,'p_id' => $p_id])->cache(3600)->select();
        }
        //渲染输出
        $this->assign('menu',$menu);
        //查询当前用户的所属权限组
        $admin = session('admin');
        $admin_id = $admin['id'];
        $group_access_info = GroupAccess::where(['uid' => $admin_id])->cache(3600)->find();

        //获取用户组ID
        $group_id = $group_access_info['group_id'];
        //根据用户组ID查询权限组的menu_id
        $group_info = Group::where(['id' => $group_id])->cache(3600)->find();

        //获取当前登录用户的一级菜单组
        $menu_info = $group_info['menu_id'];
        //转为数组
        $menu_arr = explode(',',$menu_info);
        //渲染输出
        $this->assign('menu_arr',$menu_arr);

        //获取当前登录用户的二级菜单组
        $rule_info = $group_info['rules'];
        //转为数组
        $rule_arr = explode(',',$rule_info);
        //渲染输出
        $this->assign('rule_arr',$rule_arr);

    }
}