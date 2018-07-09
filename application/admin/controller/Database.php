<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/13
 * Time: 11:53
 */

namespace app\admin\controller;

use app\common\model\FieldConfig;
use think\facade\Config;
use log\Logs;

//数据库管理
class Database extends Base
{
    //数据表列表
    public function database()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = db()->query("SHOW TABLE STATUS");
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

    //添加数据表
    public function add_table()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $this->assign(array(
                'display' => 'Database',
                'current' => 'add_table',
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_table_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //表名
            $tableName = $data['tableName'];
            //引擎
            $Engine = $data['Engine'];
            //注释
            $comment = $data['tableComment'];
            try {
                db()->execute("CREATE TABLE $tableName(
                      id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY
                    )ENGINE=$Engine AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='$comment'");
                //添加日志
                Logs::write("添加.$tableName.表",'添加');
                $msg['status'] = 200;
                $msg['tips'] = '添加成功';
                $msg['tableName'] = $tableName;
                return json($msg);
            } catch (\Exception $e) {
                $msg['status'] = 400;
                $msg['tips'] = '表名格式错误';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //编辑数据表
    public function editor_table()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $database = config('database.database');
            $tableName = input('get.tableName');
            //引擎
            $Engine = array(
                'InnoDB',
                'MyISAM',
            );
            $info = db()->query("select * from information_schema.TABLES where information_schema.TABLES.TABLE_SCHEMA = '$database' and information_schema.TABLES.TABLE_NAME = '$tableName';");
            $info = $info[0];
//            dump($info);exit;
            $this->assign(array(
                'info' => $info,
                'display' => 'Database',
                'current' => 'editor_table',
                'Engine'  => $Engine,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_table_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //旧表名
            $oldTableName = $data['oldTableName'];
            //表名
            $tableName = $data['tableName'];
            //引擎
            $Engine = $data['Engine'];
            //注释
            $comment = $data['tableComment'];
            try {
                //修改引擎
                db()->execute("ALTER  TABLE $oldTableName ENGINE=$Engine");
                //修改注释
                db()->execute("ALTER  TABLE $oldTableName COMMENT '$comment'");
                //修改表名
                db()->execute("ALTER  TABLE $oldTableName RENAME TO $tableName");
                //添加日志
                Logs::write("编辑.$tableName.表",'编辑');
                $msg['status'] = 200;
                $msg['tips'] = '修改成功';
                $msg['tableName'] = $tableName;
                return json($msg);
            } catch (\Exception $e) {
                $msg['status'] = 400;
                $msg['tips'] = '表名格式错误';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //删除数据表
    public function del_table()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $tableName = input('post.tableName');
            try {
                db()->execute("DROP TABLE $tableName ");
                //添加日志
                Logs::write("删除.$tableName.表",'删除');
                $msg['status'] = 200;
                $msg['tips'] = '删除成功';
                return json($msg);
            } catch (\Exception $e) {
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

    /*-----------------------字段管理--------------------------*/

    //表字段列表
    public function table_field()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $tableName = input('get.tableName');
            $info = db()->query("show full fields from $tableName");
            $this->assign(array(
                'info' => $info,
                'display' => 'Database',
                'current' => 'database',
                'tableName' => $tableName,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加字段
    public function add_filed()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $tableName = input('get.tableName');
            //字段类型
            $fieldType = FieldConfig::order('id asc')->select();
            //是否是NULL
            $IsNull = array(
                'YES' => 'NULL',
                'NO' => 'NOT NULL',
            );
//            dump($info);exit;
            $this->assign(array(
                'display' => 'Database',
                'current' => 'add_filed',
                'tableName' => $tableName,
                'fieldType' => $fieldType,
                'IsNull' => $IsNull,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //添加
    public function add_filed_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //表名
            $tableName = $data['tableName'];
            //字段
            $field = $data['Field'];
            //字段类型
            $type = $data['Type'];
            //是否可为NULL
            //$isNull = $data['Null'];
            //默认值
            //$default = $data['Default'] ? $data['Default'] : 0;
            //是否自增长
            //$Extra = $data['Extra'];
            //备注
            $comment = $data['Comment'];
            //新增
            try {
                /*if ($Extra) {
                    db()->execute("alter table $tableName add $field $type PRIMARY KEY $Extra COMMENT '$comment'");
                } else {
                    db()->execute("alter table $tableName add $field $type $Extra  COMMENT '$comment'");
                }*/
                db()->execute("alter table $tableName add $field $type COMMENT '$comment'");
                //添加日志
                Logs::write(".$tableName.表添加字段.$field",'添加');
                $msg['status'] = 200;
                $msg['tips'] = '添加成功';
                $msg['tableName'] = $tableName;
                return json($msg);
            } catch (\Exception $e) {
                $msg['status'] = 400;
                $msg['tips'] = '字段类型或默认值错误';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //编辑字段
    public function editor_field()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $tableName = input('get.tableName');
            $field = input('get.field');
            $info = db()->query("show full fields from $tableName where Field = '$field'");
            $info = $info[0];
            //字段类型
            $fieldType = FieldConfig::order('id asc')->select();
            //是否是NULL
            $IsNull = array(
                'NO' => 'NOT NULL',
                'YES' => 'NULL',
            );
//            dump($info);exit;
            $this->assign(array(
                'info' => $info,
                'display' => 'Database',
                'current' => 'database',
                'tableName' => $tableName,
                'fieldType' => $fieldType,
                'IsNull' => $IsNull,
            ));
            return view();
        } else {
            $msg['status'] = 400;
            $msg['tips'] = '权限不足';
            return json($msg);
        }
    }

    //编辑
    public function editor_field_do()
    {
        if (request()->isPost()) {
            $data = input('post.');
            //表名
            $tableName = $data['tableName'];
            //旧字段
            $oldField = $data['oldField'];
            //新字段
            $field = $data['Field'];
            //字段类型
            $type = $data['Type'];
            //是否可为NULL
            //$isNull = $data['Null'];
            //默认值
            //$default = $data['Default'];
            //备注
            $comment = $data['Comment'];
            //更新
            try {
                db()->execute("alter table $tableName change $oldField $field $type COMMENT '$comment'");
                //添加日志
                Logs::write(".$tableName.表编辑字段.$field",'编辑');
                $msg['status'] = 200;
                $msg['tips'] = '编辑成功';
                $msg['tableName'] = $tableName;
                return json($msg);
            } catch (\Exception $e) {
                $msg['status'] = 400;
                $msg['tips'] = '字段类型或默认值错误';
                return json($msg);
            }
        } else {
            return 'request method error!';
        }
    }

    //删除字段
    public function del_field()
    {
        $Auth = new \auth\Auth;
        $userinfo = session('admin');
        $uid = $userinfo['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $tableName = input('post.tableName');
            $field = input('post.field');
            try {
                db()->execute("ALTER TABLE $tableName DROP $field");
                //添加日志
                Logs::write(".$tableName.表删除字段.$field",'删除');
                $msg['status'] = 200;
                $msg['tips'] = '删除成功';
                return json($msg);
            } catch (\Exception $e) {
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

    /*------------------------数据备份---------------------*/

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
                Logs::write('数据备份', '数据');
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
                Logs::write('数据还原', '数据');
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
                Logs::write('删除备份', '数据');
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
        Logs::write('下载备份', '数据');
    }

}