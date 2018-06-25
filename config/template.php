<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 模板设置
// +----------------------------------------------------------------------

return [
    // 模板引擎类型 支持 php think 支持扩展
    'type'         => 'Think',
    // 默认模板渲染规则 1 解析为小写+下划线 2 全部转换小写 3 保持操作方法
    'auto_rule'    => 1,
    // 模板路径
    'view_path'    => '',
    // 模板后缀
    'view_suffix'  => 'html',
    // 模板文件名分隔符
    'view_depr'    => DIRECTORY_SEPARATOR,
    // 模板引擎普通标签开始标记
    'tpl_begin'    => '{',
    // 模板引擎普通标签结束标记
    'tpl_end'      => '}',
    // 标签库标签开始标记
    'taglib_begin' => '{',
    // 标签库标签结束标记
    'taglib_end'   => '}',

    //输出替换
    'tpl_replace_string'  =>  [
        //static
        '__STATIC__' => '/static',
        //后台
        '__ASTATIC__'=>'/static/admin',
        '__AJS__' => '/static/admin/javascript',
        '__ACSS__' => '/static/admin/css',
        '__AIMAGES__' => '/static/admin/images',
        '__AEDITOR__' => '/static/admin/editor',

        //前台
        '__HSTATIC__'=>'/static/index',
        '__HJS__' => '/static/index/javascript',
        '__HCSS__' => '/static/index/css',
        '__HIMG__' => '/static/index/images',

        //上传
        '__UPLOAD__' => '/static/upload',

        //UEditor编辑器
        '__UEDITOR__' => '/static/UEditor',
    ],
];