<?php
namespace log;
use \app\common\model\Log;
/**
 * Created by PhpStorm.
 * ThinkPHP VERSIONS：Think PHP 5.1.18
 * Author: Mr.liu <417626953@qq.com>
 * Date: 2018/6/7
 * Time: 15:38
 */
class Logs
{
    /**
     * @param $name 操作人
     * @param $title 操作内容
     * @param $type 操作类型
     * @param $ip IP地址
     * @param $browser 浏览器信息
     */
    //写入日志
    public static function write($title,$type)
    {
        $users = session('admin');
        $data['name'] = $users['username'];
        $data['title'] = $title;
        $data['type'] = $type;
        $data['ip'] = request()->ip();;
        $data['browser'] = $_SERVER['HTTP_USER_AGENT'];
        $data['time'] = date('Y-m-d H:i:s',time());
        Log::create($data);
    }
}