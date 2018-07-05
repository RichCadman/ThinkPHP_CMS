<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/7/4
 * Time: 16:05
 */

namespace app\admin\controller;


use log\Logs;

class Banner extends Base
{
    //banner列表
    public function banner()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $where = [];
            if (input('get.search')) {
                $where[] = ['type', 'like', '%' . input('get.search') . '%'];
            }
            $info = \app\common\model\Banner::where($where)
                ->order('id desc')
                ->paginate(15, false, ['query' => request()->param()]);
            //dump($info);exit;
            $this->assign(array(
                'info' => $info,
                'display' => 'Banner',
                'current' => 'banner',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加banner
    public function add_banner()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //banner分类
            $types = [
                [
                    'value' => '首页',
                ],
                [
                    'value' => '公司简介',
                ],
                [
                    'value' => '产品信息',
                ],
                [
                    'value' => '项目合作',
                ],
                [
                    'value' => '人才招聘',
                ],
                [
                    'value' => '联系我们',
                ],
            ];
            $this->assign(array(
                'display' => 'Banner',
                'current' => 'add_banner',
                'types' => $types,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_banner_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['update_time'] = current_datetime();
            $res = \app\common\model\Banner::create($data);
            if ($res) {
                //添加日志
                Logs::write('添加banner图', '添加');
                $msg['status'] = 200;
                $msg['tips'] = '添加成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '添加失败';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //编辑banner
    public function editor_banner()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //资讯内容
            $info = \app\common\model\Banner::get(input('get.id/d'));
            //banner分类
            $types = [
                [
                    'value' => '首页',
                ],
                [
                    'value' => '公司简介',
                ],
                [
                    'value' => '产品信息',
                ],
                [
                    'value' => '项目合作',
                ],
                [
                    'value' => '人才招聘',
                ],
                [
                    'value' => '联系我们',
                ],
            ];
            $this->assign(array(
                'display' => 'Banner',
                'current' => 'editor_banner',
                'types' => $types,
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
    public function editor_banner_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = \app\common\model\Banner::where(['id' => $data['id']])->update($data);
            if ($res) {
                //添加日志
                Logs::write('编辑banner图', '编辑');
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

    //删除
    public function del_banner()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $id = input('post.id/d');
            $del_res = \app\common\model\Banner::where(['id' => $id])->delete();
            if ($del_res) {
                //添加日志
                Logs::write('删除banner图', '删除');
                $msg['status'] = 200;
                $msg['tips'] = '删除成功';
                return json($msg);
            } else {
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