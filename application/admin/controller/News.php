<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/14
 * Time: 9:23
 */

namespace app\admin\controller;

use \app\common\model\NewsType as NewsTypes;
use \app\common\model\News as Newss;
use log\Logs;

//资讯分类管理
class News extends Base
{
    /*--------------------资讯-----------------------*/

    //资讯列表
    public function news()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $where = [];
            if (input('get.search')) {
                $where[] = ['title', 'like', '%' . input('get.search') . '%'];
            }
            $info = Newss::with(['newsType' => function ($query) {
                $query->field('news_type_name,id');
            }])->where($where)->order('id desc')->paginate(15, false, ['query' => request()->param()]);
            //dump($info);exit;
            unset($where);
            $this->assign(array(
                'info' => $info,
                'display' => 'News',
                'current' => 'news_type',
            ));
            unset($info);
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加资讯
    public function add_news()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            //资讯分类
            $info = NewsTypes::order('p_id asc')->select();
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $list = $treeClass->create($info);
            $this->assign(array(
                'display' => 'News',
                'current' => 'add_news',
                'newsType' => $list,
            ));
            unset($info);
            unset($list);
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_news_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['update_time'] = current_datetime();
            $res = Newss::create($data);
            unset($data);
            if ($res) {
                //添加日志
                Logs::write('添加资讯', '添加');
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

    //编辑资讯
    public function editor_news()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            //资讯内容
            $info = Newss::get(input('get.id/d'))->getData();
            //资讯分类
            $newsType = NewsTypes::order('p_id asc')->select();
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $list = $treeClass->create($newsType);
            $this->assign(array(
                'display' => 'News',
                'current' => 'add_news',
                'newsType' => $list,
                'info' => $info
            ));
            unset($info);
            unset($list);
            unset($newsType);
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_news_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = Newss::where(['id' => $data['id']])->update($data);
            if ($res) {
                //添加日志
                Logs::write('编辑资讯', '编辑');
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

    //删除资讯
    public function del_news()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('post.id/d');
            $del_res = Newss::where(['id' => $id])->delete();
            if ($del_res) {
                //添加日志
                Logs::write('删除资讯', '删除');
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

    //资讯推荐
    public function recommend()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('post.id/d');
            $find_res = Newss::get($id)->getData();
            $map['is_recommend'] = $find_res['is_recommend'] * -1;
            $editor_res = Newss::where(['id' => $id])->update($map);
            unset($map);
            if ($editor_res) {
                //添加日志
                Logs::write('编辑资讯', '编辑');
                $msg['status'] = 200;
                $msg['tips'] = '操作成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '操作失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    /*--------------------资讯分类--------------------*/

    //分类列表
    public function news_type()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $info = NewsTypes::order('p_id asc')->select();
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $list = $treeClass->create($info);
            /*dump($list);
            exit;*/
//            $info = NewsTypes::where(['p_id' => 0])->order('id desc')->paginate(3);
            /*foreach ($info as $k => &$v) {
                $p_id = $v['id'];
                $v['items'] = NewsTypes::where(['p_id' => $p_id])->select();
            }*/
            $this->assign(array(
                'info' => $list,
                'display' => 'News',
                'current' => 'news_type',
            ));
            unset($info);
            unset($list);
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加分类
    public function add_newstype()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $info = NewsTypes::where(['state' => 1])->order('p_id asc')->select();
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $list = $treeClass->create($info);
            $this->assign(array(
                'display' => 'News',
                'current' => 'add_newstype',
                'info' => $list,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //上传图片
    public function upload_img()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('filename');
        // 移动到框架应用根目录/uploads/ 目录下  2M大小
        $info = $file->validate(['size' => 2097152, 'ext' => 'jpg,png,gif'])->move('./static/upload');
        if ($info) {
            // 成功上传后 获取上传信息
            $msg['status'] = 200;
            $msg['tips'] = '图片上传成功';
            $msg['url'] = $info->getSaveName();
            return json($msg);
        } else {
            // 上传失败获取错误信息
            $msg['status'] = 400;
            $msg['tips'] = $file->getError();
            return json($msg);
        }
    }

    //添加
    public function add_newstype_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['create_time'] = current_datetime();
            $res = NewsTypes::create($data);
            unset($data);
            if ($res) {
                //添加日志
                Logs::write('添加资讯分类', '添加');
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

    //编辑分类
    public function editor_newstype()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('id/d');
            //查询数据
            $info = NewsTypes::get($id)->getData();
            //查询规则组
            $newsTypes = NewsTypes::where(['state' => 1])->order('p_id asc')->select();
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $list = $treeClass->create($newsTypes);
            $this->assign(array(
                'display' => 'News',
                'current' => 'editor_rule',
                'info' => $info,
                'newsTypes' => $list,
            ));
            unset($info);
            unset($list);
            return view();

        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_newstype_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $res = NewsTypes::where(['id' => $data['id']])->update($data);
            unset($data);
            if ($res) {
                //添加日志
                Logs::write('编辑资讯分类', '编辑');
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

    //删除分类
    public function del_newstype()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        unset($userinfo);
        if ($res) {
            $id = input('post.id/d');
            //递归创建无限分类树
            $treeClass = new \buildTree\Tree();
            $buildList = $treeClass->buildTree_del($id);
            //删除当前及子数据
            $del_res = $treeClass->recursion_del($buildList);
            unset($buildList);
            if ($del_res) {
                //添加日志
                Logs::write('删除资讯分类', '删除');
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
