<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/13
 * Time: 11:53
 */

namespace app\admin\controller;

use think\facade\Config;
use log\Logs;
//数据库管理
class Database extends Base
{
    //数据库列表
    public function database()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            //$info = db()->query("SHOW TABLE STATUS");
            $info = db()->query("show full fields from cms_admin");
            dump($info);exit;
            $this->assign(array(
                'info' => $info,
                'display' => 'Database',
                'current' => 'database',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //数据备份
    public function backups()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $config = Config::get();
            $sql = new \database\Baksql($config['database']);
            $res = $sql->backup();//此处可以以数组形式传入表名$table = array('table1','table2');用于备份单个表或多个表
            if ($res == 1) {
                //添加日志
                Logs::write('数据备份','数据');
                $msg['status'] = 200;
                $msg['tips'] = '备份成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '备份失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //备份列表
    public function reduction()
    {

        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $config = Config::get();
            $sql = new \database\Baksql($config['database']);
            $info = $sql->get_filelist(1);//按时间倒序排列
            $this->assign(array(
                'info' => $info,
                'display' => 'Database',
                'current' => 'reduction',
            ));
            return view();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //数据还原
    public function restore()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $filename = input('filename');
            $config = Config::get();
            $sql = new \database\Baksql($config['database']);
            $res = $sql->restore($filename);
            if ($res) {
                //添加日志
                Logs::write('数据还原','数据');
                $msg['status'] = 200;
                $msg['tips'] = '还原成功';
                return json($msg);
            } else {
                $msg['status'] = 400;
                $msg['tips'] = '还原失败';
                return json($msg);
            }
        } else {
            $msg['status'] = 600;
            $msg['tips'] = '权限不足';
            return json($msg);
        }

    }

    //删除备份
    public function delete_database()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $filename = input('filename');
            $config = Config::get();
            $sql = new \database\Baksql($config['database']);
            $del_res = $sql->delfilename($filename);
            if ($del_res) {
                //添加日志
                Logs::write('删除备份','数据');
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

    //下载备份
    public function dowonload()
    {
        $filename = input('filename');
        $config = Config::get();
        $sql = new \database\Baksql($config['database']);
        $sql->downloadFile($filename);
        //添加日志
        Logs::write('下载备份','数据');
    }
}