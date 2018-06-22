<?php
namespace app\admin\controller;

use \log\Logs;
use think\facade\Env;
class Index extends Base
{
    /**
     * 首页
     * @return string
     */
    public function index()
    {
        /*//添加日志
        Logs::write('下载备份','数据');*/
        //系统配置
        $config = [
            '操作系统' => PHP_OS,
            '服务器时间' => date("Y-n-j H:i:s"),
            'PHP版本号' => PHP_VERSION,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time').'秒',
            'ThinkPHP版本' => '5.1.14',
            '主机名' => $_SERVER['SERVER_NAME'],
            'WEB服务端口' => $_SERVER['SERVER_PORT'],
            '网站文档目录' => $_SERVER["DOCUMENT_ROOT"],
            '浏览器信息' => substr($_SERVER['HTTP_USER_AGENT'], 0, 40),
            '通信协议' => $_SERVER['SERVER_PROTOCOL'],
            '请求方法' => $_SERVER['REQUEST_METHOD'],
            '北京时间' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
            '服务器域名/IP' => $_SERVER['SERVER_NAME'] . ' [ ' . gethostbyname($_SERVER['SERVER_NAME']) . ' ]',
            '用户的IP地址' => $_SERVER['REMOTE_ADDR'],
            '剩余空间' => round((disk_free_space(".") / (1024 * 1024)), 2) . 'M',
        ];
        $this->assign(array(
            'display' => 'Index',
            'config' => $config,
        ));
        return view();
    }

    //清除缓存
    public function clear_cache()
    {
        deldir(Env::get('runtime_path'));
        $msg['status'] = 200;
        $msg['tips'] = '清除成功';
        return json($msg);
        //添加日志
        Logs::write('清除缓存','清除缓存');
    }
}
