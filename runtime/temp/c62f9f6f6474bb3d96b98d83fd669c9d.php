<?php /*a:6:{s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\auth\add_rule.html";i:1529550084;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\static.html";i:1529542576;s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\menu.html";i:1528855708;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\header.html";i:1529387612;s:62:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\nav.html";i:1528625773;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\footer.html";i:1528353677;}*/ ?>
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
                        <a href="<?php echo url('Auth/rule_index'); ?>"><button class="btn btn-primary fr icon-undo"><?php echo htmlentities(app('lang')->get('back')); ?></button></a>
                        <!--<a onclick="window.history.back();"><button class="btn btn-primary fr">返回上层</button></a>-->
                    </header>
                    <hr>

                </section>

                <form id="form_data">
                    <div class="form-group-col-2">
                        <div class="form-label">规则名称：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="权限管理" name="title" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">规则：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="admin/Auth" value="admin/Database/" name="name" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">父级规则：</div>
                        <div class="form-cont" >
                            <select style="width:auto;" name="p_id">
                                <option value="0">顶级规则</option>
                                <?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo htmlentities($v['id']); ?>">|--<?php echo htmlentities($v['title']); ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">导航：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="权限管理" value="数据库管理" name="nav" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">是否显示：</div>
                        <div class="form-cont">
                            <label class="radio">
                                <input type="radio" name="is_visible" value="1"  checked="checked"/>
                                <span>显示</span>
                            </label>
                            <label class="radio">
                                <input type="radio" name="is_visible" value="2"/>
                                <span>隐藏</span>
                            </label>

                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">菜单图标：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="icon-leaf" name="icon" class="form-control form-boxed " style="width:300px;">
                            <button type="button" class="btn btn-primary JopenMaskPanel">选择</button>
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">控制器标识：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="Auth" value="Database"  name="controller" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">方法标识：</div>
                        <div class="form-cont">
                            <input type="text" placeholder="auth" name="function" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">排序：</div>
                        <div class="form-cont">
                            <input type="number" placeholder="越大越靠前" name="show_order" class="form-control form-boxed" style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label"></div>
                        <div class="form-cont">
                            <input type="button" onclick="ajax_submit()" class="btn btn-primary" value="提交表单" />
                            <!--<input type="reset" class="btn btn-disabled" value="禁止" />-->
                        </div>
                    </div>
                </form>
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
        <!--底部-->
    </div>
</div>

<div class="mask"></div>
<div class="dialog" style="width: 1400px;">
    <div class="dialog-hd">
        <strong class="lt-title"><?php echo htmlentities(app('lang')->get('icon')); ?></strong>
        <a class="rt-operate icon-remove JclosePanel" title="关闭"></a>
    </div>
    <div class="dialog-bd" >
        <!--start::-->
        <table class="table table-bordered table-striped table-hover">
            <thead>

            </thead>
            <tbody>
            <!--1-->
            <tr class="cen">
                <td><i class="icon-glass">icon-glass</i></td>
                <td><i class="icon-music">icon-music</i></td>
                <td><i class="icon-search">icon-search</i></td>
                <td><i class="icon-envelope-alt">icon-envelope-alt</i></td>
                <td><i class="icon-heart">icon-heart</i></td>
                <td><i class="icon-star">icon-star</i></td>
                <td><i class="icon-star-empty">icon-star-empty</i></td>
                <td><i class="icon-user">icon-user</i></td>
                <td><i class="icon-film">icon-film</i></td>
                <td><i class="icon-th-large">icon-th-large</i></td>

            </tr>
            <!--2-->
            <tr class="cen">
                <td><i class="icon-th">icon-th</i></td>
                <td><i class="icon-th-list">icon-th-list</i></td>
                <td><i class="icon-ok">icon-ok</i></td>
                <td><i class="icon-remove">icon-remove</i></td>
                <td><i class="icon-zoom-in">icon-zoom-in</i></td>
                <td><i class="icon-zoom-out">icon-zoom-out</i></td>
                <td><i class="icon-comments">icon-comments</i></td>
                <td><i class="icon-signal">icon-signal</i></td>
                <td><i class="icon-comments-alt">icon-comments-alt</i></td>
                <td><i class="icon-trash">icon-trash</i></td>
            </tr>
            <!--3-->
            <tr class="cen">
                <td><i class="icon-home">icon-home</i></td>
                <td><i class="icon-file-alt">icon-file-alt</i></td>
                <td><i class="icon-time">icon-time</i></td>
                <td><i class="icon-road">icon-road</i></td>
                <td><i class="icon-download-alt">icon-download-alt</i></td>
                <td><i class="icon-download">icon-download</i></td>
                <td><i class="icon-upload">icon-upload</i></td>
                <td><i class="icon-inbox">icon-inbox</i></td>
                <td><i class="icon-play-circle">icon-play-circle</i></td>
                <td><i class="icon-credit-card">icon-credit-card</i></td>
            </tr>
            <!--4-->
            <tr class="cen">
                <td><i class="icon-refresh">icon-refresh</i></td>
                <td><i class="icon-list-alt">icon-list-alt</i></td>
                <td><i class="icon-lock">icon-lock</i></td>
                <td><i class="icon-flag">icon-flag</i></td>
                <td><i class="icon-headphones">icon-headphones</i></td>
                <td><i class="icon-volume-off">icon-volume-off</i></td>
                <td><i class="icon-volume-down">icon-volume-down</i></td>
                <td><i class="icon-volume-up">icon-volume-up</i></td>
                <td><i class="icon-qrcode">icon-qrcode</i></td>
                <td><i class="icon-barcode">icon-barcode</i></td>
            </tr>
            <!--5-->
            <tr class="cen">
                <td><i class="icon-dashboard">icon-dashboard</i></td>
                <td><i class="icon-tags">icon-tags</i></td>
                <td><i class="icon-book">icon-book</i></td>
                <td><i class="icon-bookmark">icon-bookmark</i></td>
                <td><i class="icon-print">icon-print</i></td>
                <td><i class="icon-camera">icon-camera</i></td>
                <td><i class="icon-pinterest">icon-pinterest</i></td>
                <td><i class="icon-envelope">icon-envelope</i></td>
                <td><i class="icon-eye-open">icon-eye-open</i></td>
                <td><i class="icon-google-plus">icon-google-plus</i></td>
            </tr>
            <!--6-->
            <tr class="cen">
                <td><i class="icon-folder-close">icon-folder-close</i></td>
                <td><i class="icon-gift">icon-gift</i></td>
                <td><i class="icon-globe">icon-globe</i></td>
                <td><i class="icon-group">icon-group</i></td>
                <td><i class="icon-align-justify">icon-align-justify</i></td>
                <td><i class="icon-list">icon-list</i></td>
                <td><i class="icon-indent-left">icon-indent-left</i></td>
                <td><i class="icon-indent-right">icon-indent-right</i></td>
                <td><i class="icon-facetime-video">icon-facetime-video</i></td>
                <td><i class="icon-picture">icon-picture</i></td>
            </tr>
            <!--7-->
            <tr class="cen">
                <td><i class="icon-pencil">icon-pencil</i></td>
                <td><i class="icon-map-marker">icon-map-marker</i></td>
                <td><i class="icon-adjust">icon-adjust</i></td>
                <td><i class="icon-tint">icon-tint</i></td>
                <td><i class="icon-edit">icon-edit</i></td>
                <td><i class="icon-share">icon-share</i></td>
                <td><i class="icon-check">icon-check</i></td>
                <td><i class="icon-move">icon-move</i></td>
                <td><i class="icon-external-link">icon-external-link</i></td>
                <td><i class="icon-link">icon-link</i></td>
            </tr>
            <!--8-->
            <tr class="cen">
                <td><i class="icon-table">icon-table</i></td>
                <td><i class="icon-plane">icon-plane</i></td>
                <td><i class="icon-shopping-cart">icon-shopping-cart</i></td>
                <td><i class="icon-sitemap">icon-sitemap</i></td>
                <td><i class="icon-thumbs-up">icon-thumbs-up</i></td>
                <td><i class="icon-legal">icon-legal</i></td>
                <td><i class="icon-undo">icon-undo</i></td>
                <td><i class="icon-trophy">icon-trophy</i></td>
                <td><i class="icon-truck">icon-truck</i></td>
                <td><i class="icon-rss">icon-rss</i></td>
            </tr>
            <!--9-->
            <tr class="cen">
                <td><i class="icon-cogs">icon-cogs</i></td>
                <td><i class="icon-comment">icon-comment</i></td>
                <td><i class="icon-comment-alt">icon-comment-alt</i></td>
                <td><i class="icon-wrench">icon-wrench</i></td>
                <td><i class="icon-table">icon-table</i></td>
                <td><i class="icon-phone">icon-phone</i></td>
                <td><i class="icon-phone-sign">icon-phone-sign</i></td>
                <td><i class="icon-facebook-sign">icon-facebook-sign</i></td>
                <td><i class="icon-twitter-sign">icon-twitter-sign</i></td>
                <td><i class="icon-github">icon-github</i></td>
            </tr>
            </tbody>
        </table>
        <!--end::-->
    </div>
    <!--<div class="dialog-ft">-->
        <!--<button class="btn btn-info JyesBtn">确认</button>-->
        <!--<button class="btn btn-secondary JnoBtn">关闭</button>-->
    <!--</div>-->
</div>

<script>
    function ajax_submit() {

        var form_data = $('#form_data').serializeArray();
        $.post('<?php echo url("Auth/add_rule_do"); ?>', form_data, function (data) {
//            console.log(data);
            if (data.status == 200) {
                layer.msg(data.tips);
                setTimeout("location.reload();",500);
            } else {
                layer.msg(data.tips);
            }
        })
        //console.log(a);
    }
</script>
</body>
</html>
