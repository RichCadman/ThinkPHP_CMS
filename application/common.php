<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * @Title: deldir
 * @Description: todo(删除文件和文件夹)
 * @param string $dir
 * @param string $folder【y :同时删除文件夹,n:只删除文件】
 * @return boolean
 * @author 苏晓信
 * @date 2018年1月26日
 * @throws
 */
function deldir($dir, $folder = 'n')
{
    //删除当前文件夹下得文件（并不删除文件夹）：
    $dh = opendir($dir);
    while ($file = readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $dir . "/" . $file;
            if (!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                deldir($fullpath, $folder);
            }
        }
    }
    closedir($dh);
    //删除当前文件夹
    if ($folder == 'y') {
        if (rmdir($dir)) {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * 获取当前时间
 * return $data 格式 2018-06-19 17:18:55
 */
function current_datetime()
{
    $datetime = date("Y-m-d H:i:s",time());
    return $datetime;
}

/**
 * @Title: csubstr
 * @Description: todo(中文字符串截取长度)
 * @param string $str
 * @param int $length
 * @param string $charset
 * @param int $start
 * @param boolean $suffix
 * @return string
 * @author 苏晓信
 * @date 2018年2月2日
 * @throws
 */
function csubstr($str, $length, $charset="", $start=0, $suffix=true) {
    if (empty($charset))
        $charset = "utf-8";
    if (function_exists("mb_substr")) {
        if (mb_strlen($str, $charset) <= $length)
            return $str;
        $slice = mb_substr($str, $start, $length, $charset);
    }else {
        $re['utf-8'] = "/[\x01-\x7f]¦[\xc2-\xdf][\x80-\xbf]¦[\xe0-\xef][\x80-\xbf]{2}¦[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]¦[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk'] = "/[\x01-\x7f]¦[\x81-\xfe][\x40-\xfe]/";
        $re['big5'] = "/[\x01-\x7f]¦[\x81-\xfe]([\x40-\x7e]¦\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        if (count($match[0]) <= $length)
            return $str;
        $slice = join("", array_slice($match[0], $start, $length));
    }
    if ($suffix)
        return $slice . "...";
    return $slice;
}

/**
 * 加密
 * @param $password
 * @return string
 */
function encryption($password)
{
    $prve = sha1('破解密码?不可能的,这辈子不可能的!');
    $current = md5($password);
    $last = md5('有事联系417626953@qq.com');
    return md5($prve.$current.$last);
}