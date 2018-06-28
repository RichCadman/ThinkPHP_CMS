<?php

namespace buildTree;

use app\common\model\NewsType;

class Tree
{
    static public $treeList = [];   //存放无限极分类结果
    static public $delList = [];    //存放无限极分类结果

    public function __construct()
    {
        self::$treeList = [];   //为什么要重置为空数组，因为如果同一个文件，发生两次都调用树时，第二次调用会将第一次中的数据保存在数组($treeList) 中，因此每次清空数组($treeList)。
        self::$delList = [];
    }

    //建立无限分类树
    public function create($data, $p_id = 0, $layer = 0)
    {
        foreach ($data as $k => $v) {
            $layer++;
            if ($v['p_id'] == $p_id) {
                $v['layer'] = $layer;
                self::$treeList[] = $v;
                unset($data[$k]);
                self::create($data, $v['id'], $layer);
            }
            $layer--;
        }
        return self::$treeList;
    }

    //建立递归删除树
    public function buildTree_del($id)
    {
        $info = NewsType::where(['id' => $id])->find();
        self::$delList[] = $info;
        $find_res = NewsType::where(['p_id' => $id])->select();
        if ($find_res) {
            foreach ($find_res as $kk => $vv) {
                self::buildTree_del($vv['id']);
            }
        }

        return self::$delList;
    }

    //递归删除
    public function recursion_del($data)
    {
        try {
            //循环删除
            foreach ($data as $k => $v) {
                NewsType::where(['id' => $v['id']])->delete();
                if ($v['news_type_img']) {
                    //删除资源
                    unlink(config('app.upload_path') . $v['news_type_img']);
                }
            }
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
}