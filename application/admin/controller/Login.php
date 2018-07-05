<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/7
 * Time: 16:28
 */

namespace app\admin\controller;

use \app\common\model\Admin;
use \app\common\model\System;
use log\Logs;
use think\Controller;
class Login extends Controller
{
    //登陆页面
    public function login()
    {
        if (session('?admin')) {
            //添加日志
            Logs::write('登出系统', '登出');
        }
        //系统配置
        $system = System::find();
        //渲染输出
        $this->assign(array(
            'system' => $system,
        ));
        session('admin', null);
        return view();
    }

    //验证码
    public function verify()
    {
        $captcha = new Captcha();
        return $captcha->entry();
    }

    //登陆
    public function login_do()
    {
        if (request()->isPost()) {
            $map = input('post.');
            if (!captcha_check($map['verify'])) {
                // 验证失败
                $msg['status'] = 800;
                $msg['tips'] = '验证码错误';
                return json($msg);
            } else {
                $where['password'] = md5($map['password']);
                $where['username'] = $map['username'];
                $user = Admin::where($where)->find();
                if ($user) {
                    //检查状态
                    if ($user['status'] == '正常') {
                        $this->updateUser($user['id']);//更新用户信息
                        $this->setSession($user['id']);//设置session
                        //添加日志
                        Logs::write('登陆系统', '登陆');
                        $msg['status'] = 200;
                        $msg['tips'] = '登陆成功';
                        return json($msg);
                    } else {
                        //禁止登陆
                        $msg['status'] = 600;
                        $msg['tips'] = '禁止登陆';
                        return json($msg);
                    }

                } else {
                    $msg['status'] = 400;
                    $msg['tips'] = '登陆失败';
                    return json($msg);
                }
            }
        } else {
            return 'request method error!';
        }
    }

    //更新用户信息
    public function updateUser($user)
    {
        //更新登陆状态
        $find = Admin::get($user);
        $find->unique_id = rand('10000', '99999');
        //最后一次登录时间
        $find->last_time = date('Y-m-d H:i:s', time());
        $find->login_count = $find['login_count'] + 1;
        $find->save();
    }

    //设置session
    public function setSession($user)
    {
        $userinfo = Admin::get($user);
        session('admin', $userinfo);
    }
}