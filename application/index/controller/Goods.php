<?php
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.5
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/26
 * Time: 11:37
 */

namespace app\index\controller;


use app\common\model\Orders;
use think\Db;

class Goods extends Base
{
    //测试并发 ab -n 100 -c 100 -w http://127.0.0.5/index.php >>f:\1.html
    //不使用锁表 ab -n 100 -c 100 http://www.xyh.com/index/index/mysql_unlock
    public function mysql_unlock()
    {
        dump($_SERVER['REMOTE_ADDR']);exit;
        $num = 1;
        $goods_id = 1;
        // 启动事务
        Db::startTrans();
        try {
            $goods_info = \app\common\model\Goods::get($goods_id);
            if (empty($goods_info)) {
                return "商品不存在";
            }
            $goods_total = $goods_info['goods_num'];//商品库存
            $goods_sell = $goods_info['goods_sell'];//商品销量
            if ($goods_total < $num) {
                return "库存不足";
            }
            $map['goods_num'] = $goods_total - $num;
            $map['goods_sell'] = $goods_sell + $num;
            $update_res = \app\common\model\Goods::where(['id' => $goods_id])->update($map);
            if ($update_res) {
                $orders_map['order_num'] = date('YmdHis', time()) . uniqid();
                $orders_map['uid'] = rand(1000, 9999);
                $orders_map['order_time'] = date('Y-m-d H:i:s', time());
                $orders_map['count'] = $num;
                $add_res = Orders::create($orders_map);
                if ($add_res) {
                    Db::commit();
                } else {
                    Db::rollback();
                }
            }
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
        }
    }

    //使用锁表
    public function mysql_lock()
    {
        $num = 1;
        $goods_id = 1;
        // 启动事务
        Db::startTrans();
        try {
            $goods_info = \app\common\model\Goods::lock(true)->where(['id' => $goods_id])->find();
            if (empty($goods_info)) {
                return "商品不存在";
            }
            $goods_total = $goods_info['goods_num'];//商品库存
            $goods_sell = $goods_info['goods_sell'];//商品销量
            if ($goods_total < $num) {
                return "库存不足";
            }
            $map['goods_num'] = $goods_total - $num;
            $map['goods_sell'] = $goods_sell + $num;
            $update_res = \app\common\model\Goods::where(['id' => $goods_id])->update($map);
            if ($update_res) {
                $orders_map['order_num'] = date('YmdHis', time()) . uniqid();
                $orders_map['uid'] = rand(1000, 9999);
                $orders_map['order_time'] = date('Y-m-d H:i:s', time());
                $orders_map['count'] = $num;
                $add_res = Orders::create($orders_map);
                if ($add_res) {
                    Db::commit();
                } else {
                    Db::rollback();
                }
            }
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
        }
    }

}