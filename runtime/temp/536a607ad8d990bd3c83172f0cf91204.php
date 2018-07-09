<?php /*a:6:{s:61:"E:\www-web\ThinkPHP_CMS\application\admin\view\news\news.html";i:1530710786;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\static.html";i:1529542576;s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\menu.html";i:1528855708;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\header.html";i:1529387612;s:62:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\nav.html";i:1528625773;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\footer.html";i:1529573972;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
<title><?php echo htmlentities($action_name); ?></title>
<meta name="keywords"  content="设置关键词..." />
<meta name="description" content="设置描述..." />
<meta name="author" content="DeathGhost" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="icon" href="/static/admin/images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="/static/admin/css/style.css" />
<script src="/static/admin/javascript/jquery.js"></script>
<script src="/static/admin/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="/static/admin/javascript/plug-ins/echarts.min.js"></script>
<script src="/static/admin/javascript/plug-ins/layerUi/layer.js"></script>
<script src="/static/admin/editor/ueditor.config.js"></script>
<script src="/static/admin/editor/ueditor.all.js"></script>
<script src="/static/admin/javascript/plug-ins/pagination.js"></script>
<script src="/static/admin/javascript/public.js"></script>
<script src="/static/admin/javascript/ajaxfileupload.js"></script>

<!--时间插件-->
<script type="text/javascript" src="/static/admin/jeDate/src/jedate.js"></script>
<link type="text/css" rel="stylesheet" href="/static/admin/jeDate/skin/jedate.css">


<!--UEditor编辑器-->
<script type="text/javascript" charset="utf-8" src="/static/UEditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/UEditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/static/UEditor/lang/zh-cn/zh-cn.js"></script>


<style>
    header button {
        margin-left:20px;
    }
</style>

<!--<script src="/static/admin/javascript/pages/login.js"></script>-->
</head>
<body>
<div class="main-wrap">
    <!--菜单-->
    <div class="side-nav">
    <div class="side-logo">
        <div class="logo">
				<span class="logo-ico">
					<i class="i-l-1"></i>
					<i class="i-l-2"></i>
					<i class="i-l-3"></i>
				</span>
            <strong><?php echo htmlentities($system['title']); ?></strong>
        </div>
    </div>

    <nav class="side-menu content mCustomScrollbar" data-mcs-theme="minimal-dark">
        <h2>
            <a href="<?php echo url('Index/index'); ?>" class="InitialPage"><i class="icon-dashboard"></i>数据概况</a>
        </h2>
        <!--菜单-->
        <ul>
            <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                <!--判断是否有权限显示-->
                <?php if(in_array($v['id'],$menu_arr)): ?>
                    <li class="<?php echo $display==$v['controller'] ? 'open'  :  ''; ?>">
                        <dl>
                            <dt>
                                <i class="<?php echo htmlentities($v['icon']); ?>"></i><?php echo htmlentities($v['title']); ?><i class="icon-angle-right"></i>
                            </dt>
                            <?php if($v['items']): if(is_array($v['items']) || $v['items'] instanceof \think\Collection || $v['items'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['items'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($i % 2 );++$i;?>
                                    <!--判断是否有权限显示-->
                                    <?php if(in_array($vv['id'],$rule_arr)): ?>
                                        <dd>
                                            <a href="<?php echo url($vv['controller'].'/'.$vv['function']); ?>"><?php echo htmlentities($vv['title']); ?></a>
                                        </dd>
                                    <?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
                        </dl>
                    </li>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </nav>
    <footer class="side-footer">© DeathGhost 版权所有</footer>
</div>
    <!--菜单-->
    <div class="content-wrap">
        <!--头部-->
        <header class="top-hd">
    <div class="hd-lt">
        <a class="icon-reorder"></a>
    </div>
    <div class="hd-rt">
        <ul>
            <li>
                <a href="<?php echo htmlentities($system['home_url']); ?>" target="_blank"><i class="icon-home"></i><?php echo htmlentities(app('lang')->get('go_home')); ?></a>
            </li>
            <li>
                <a href="javascript:void(0)" id="clearCache"><i class="icon-random"></i><?php echo htmlentities(app('lang')->get('clear_cache')); ?></a>
            </li>
            <li>
                <a href="javascript:location.reload();"><i class="icon-repeat"></i><?php echo htmlentities(app('lang')->get('reload')); ?></a>
            </li>
            <?php if(app('session')->get('admin.id') == 1): ?>
            <li>
                <a href="javascript:void(0)" id="restore"><i class="icon-refresh"></i><?php echo htmlentities(app('lang')->get('restore')); ?></a>
            </li>
            <?php endif; ?>
            <li>
                <a><i class="icon-user"></i>管理员:<em><?php echo htmlentities(app('session')->get('admin.username')); ?></em></a>
            </li>
            <li>
                <a href="javascript:void(0)" id="JsSignOut"><i class="icon-signout"></i><?php echo htmlentities(app('lang')->get('login_out')); ?></a>
            </li>
        </ul>
    </div>
</header>
<script>
    //安全退出
    $('#JsSignOut').click(function(){
        layer.confirm('确定登出管理中心？', {
            title:'系统提示',
            btn: ['确定','取消']
        }, function(){
            location.href = '<?php echo url("Login/login"); ?>';
        });
    });

    //清空缓存
    $('#clearCache').click(function(){
        layer.confirm('确定清除缓存文件？', {
            title:'系统提示',
            btn: ['确定','取消']
        }, function(){
            $.post('<?php echo url("Index/clear_cache"); ?>', function (data) {
                if (data.status == 200) {
                    layer.msg(data.tips);
                } else {
                    layer.msg(data.tips);
                }
            })
        },function(){
            layer.msg('Request Error !');
        });
    });

    //一键还原
    $('#restore').click(function(){
        layer.confirm('该操作将会恢复系统默认权限，仅针对管理员，确认操作吗？', {
            title:'系统提示',
            btn: ['确定','取消']
        }, function(){
            $.post('<?php echo url("System/restore"); ?>', function (data) {
                if (data.status == 200) {
                    layer.msg(data.tips);
                    setTimeout("location.reload();",2000);
                } else {
                    layer.msg(data.tips);
                }
            })
        },function(){
            layer.msg('Request Error !');
        });
    });

</script>
        <!--头部-->
        <main class="main-cont content mCustomScrollbar">
            <div class="page-wrap">
                <!--开始::内容-->
                <section class="page-hd">
                    <header style="clearfix">
                        <div class="fl">
    <h2 class="title"><?php echo htmlentities($action_name); ?></h2>
    <p class="title-description">
        <a href="">首页</a> > <a href=""><?php echo htmlentities($controller_name); ?></a> > <a href=""><?php echo htmlentities($action_name); ?></a>
    </p>
</div>
                        <button onclick="add()" class="btn btn-primary fr icon-plus"><?php echo htmlentities(app('lang')->get('add')); ?></button>
                        <!--<a onclick="window.history.back();"><button class="btn btn-primary fr icon-undo">返回上层</button></a>-->
                        <script>
                            function add() {
                                $.get('<?php echo url("News/add_news"); ?>', function (data) {
                                    if (data.status == 400) {
                                        layer.msg(data.tips);
                                    } else {
                                        location.href = "<?php echo url('News/add_news'); ?>";
                                    }
                                })
                            }
                        </script>
                    </header>
                    <hr>

                </section>

                <div class="clear mt-20" style="padding-bottom: 20px;margin-top: -10px">
                    <!--<div class="fl">-->
                        <!--<button class="btn btn-secondary"><i class="icon-double-angle-left"></i>上一周</button>-->
                        <!--<button class="btn btn-secondary">下一周<i class="icon-double-angle-right"></i></button>-->
                    <!--</div>-->
                    <div class="fr input-group">
                        <form action="" method="get">
                            <input type="text" name="search" class="form-control" placeholder="搜索资讯标题..." style="width:290px;"/>
                            <button type="submit" class="btn btn-secondary-outline">搜索</button>
                        </form>

                    </div>
                </div>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>标题</th>
                        <!--<th>配图</th>-->
                        <th>所属分类</th>
                        <th>作者</th>
                        <th>点击量</th>
                        <th>编辑时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <tr class="cen">
                        <td><?php echo htmlentities($v['id']); ?></td>
                        <td ><?php echo htmlentities($v['title']); ?></td>
                        <!--<td>-->
                            <!--<a href="/static/upload/<?php echo htmlentities($v['news_img']); ?>" target="_blank">-->
                                <!--<img src="/static/upload/<?php echo htmlentities($v['news_img']); ?>" style="width: 50px;height: 50px;" alt="">-->
                            <!--</a>-->
                        <!--</td>-->
                        <?php if(!(empty($v['news_type']) || (($v['news_type'] instanceof \think\Collection || $v['news_type'] instanceof \think\Paginator ) && $v['news_type']->isEmpty()))): ?>
                            
                                <td><?php echo htmlentities($v['news_type']['news_type_name']); ?></td>
                            
                        <?php else: ?>
                            <td>暂无分类</td>
                        <?php endif; ?>
                        <td><?php echo htmlentities($v['author']); ?></td>
                        <td><?php echo htmlentities($v['click_num']); ?></td>
                        <td><?php echo htmlentities($v['update_time']); ?></td>
                        <td><?php echo htmlentities($v['state']); ?></td>
                        <td>
                            <a href="javascript:void(0)" onclick="comment(this,<?php echo htmlentities($v['id']); ?>)" title="<?php echo htmlentities(app('lang')->get('comment')); ?>" class="mr-5 icon-comments"><?php echo htmlentities(app('lang')->get('comment')); ?></a>
                            <a href="javascript:void(0)" onclick="editor(this,<?php echo htmlentities($v['id']); ?>)" title="<?php echo htmlentities(app('lang')->get('editor')); ?>" class="mr-5 icon-edit"><?php echo htmlentities(app('lang')->get('editor')); ?></a>
                            <!--<a title="详情" class="mr-5">详情</a>-->
                            <a href="javascript:void(0)" onclick="del(this,<?php echo htmlentities($v['id']); ?>)" title="<?php echo htmlentities(app('lang')->get('del')); ?>" class="icon-trash"><?php echo htmlentities(app('lang')->get('del')); ?></a>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
                <?php echo $info; ?>

                <!--开始::结束-->
            </div>
        </main>
        <!--底部-->
        <footer class="btm-ft">
    <p class="clear">
        <span class="fl">©Copyright 2016 <a href="#" title="DeathGhost" target="_blank">DeathGhost.cn</a></span>
        <span class="fr text-info">
					<em class="uppercase">
						<i class="icon-user"></i>
						author:deathghost
					</em> |
					<em class="uppercase"><i class="icon-envelope-alt"></i>
						更多模板： <a href="http://www.mycodes.net/" target="_blank">源码之家</a>
					</em>
					<a onclick="reciprocate()" class="text-primary"><i class="icon-qrcode"></i>捐赠</a>
				</span>
    </p>
</footer>

<script>
    //捐赠
    function reciprocate() {
        layer.open({
            type: 1,
            skin: 'layui-layer-demo',
            closeBtn: 1,
            anim: 2,
            shadeClose: false,
            title: '喝杯咖啡O(∩_∩)O',
            content: '<div class="pl-20 pr-20">'
            + '<table class="table table-bordered table-striped mt-10">'
            + '<tr>'
            + '<td><img src="/static/admin/images/wechat_qrcode.jpg" style="width:auto;max-width:100%;height:120px;"/></td>'
            + '<td><img src="/static/admin/images/alipay_qrcode.jpg" style="width:auto;max-width:100%;height:120px;"/></td>'
            + '</tr>'
            + '<tr class="cen">'
            + '<td class="text-primary">微信打赏</td>'
            + '<td class="text-primary">支付宝打赏</td>'
            + '</tr>'
            + '</table>'
            + '</div>'
        });
    }
</script>
        <!--底部-->
    </div>
</div>
<script type="text/javascript">
    // 删除数据方法
    function del(obj, id) {
        layer.confirm('确定删除吗？', {
            title: '系统提示',
            btn: ['确定', '取消']
        }, function () {
            $.post('<?php echo url("News/del_news"); ?>', {id: id}, function (data) {
                // 判断是否成功
                if (data.status == 200) {
                    $(obj).parent().parent().remove();
                    layer.msg(data.tips);
                    setTimeout("location.reload();", 500);
                } else if (data.status == 400) {
                    layer.msg(data.tips);
                } else if (data.status == 600) {
                    layer.msg(data.tips);
                }
            });
        });
    }

    // 编辑数据方法
    function editor(obj, id) {
        $.get('<?php echo url("News/editor_news"); ?>',{id:id}, function (data) {
            // 判断是否成功
            if (data.status == 400) {
                layer.msg(data.tips);
            } else {
                location.href = "<?php echo url('News/editor_news'); ?>" + "?id=" + id;
            }
        });
    }

    // 查看评论方法
    function comment(obj, id) {
        $.get('<?php echo url("Comment/comment"); ?>',{news_id:id}, function (data) {
            // 判断是否成功
            if (data.status == 400) {
                layer.msg(data.tips);
            } else {
                location.href = "<?php echo url('Comment/comment'); ?>" + "?news_id=" + id;
            }
        });
    }
</script>
</body>
</html>
