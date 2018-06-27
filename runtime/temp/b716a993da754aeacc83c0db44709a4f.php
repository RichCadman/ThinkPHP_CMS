<?php /*a:6:{s:72:"E:\www-web\ThinkPHP_CMS\application\admin\view\news\editor_newstype.html";i:1530084293;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\static.html";i:1529542576;s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\menu.html";i:1528855708;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\header.html";i:1529387612;s:62:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\nav.html";i:1528625773;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\footer.html";i:1529573972;}*/ ?>
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
                        <a href="<?php echo url('News/news_type'); ?>">
                            <button class="btn btn-primary fr icon-undo"><?php echo htmlentities(app('lang')->get('back')); ?></button>
                        </a>
                        <!--<a onclick="window.history.back();"><button class="btn btn-primary fr">返回上层</button></a>-->
                    </header>
                    <hr>

                </section>

                <form id="form_data" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<?php echo htmlentities($info['id']); ?>">
                    <div class="form-group-col-2">
                        <div class="form-label">分类名称：</div>
                        <div class="form-cont">
                            <input type="text" value="<?php echo htmlentities($info['news_type_name']); ?>" name="news_type_name" class="form-control form-boxed"
                                   style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">父级规则：</div>
                        <div class="form-cont">
                            <select style="width:auto;" name="p_id">
                                <option value="0">顶级规则</option>
                                <?php if(is_array($newsTypes) || $newsTypes instanceof \think\Collection || $newsTypes instanceof \think\Paginator): $i = 0; $__LIST__ = $newsTypes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo htmlentities($v['id']); ?>" <?php if($v['id'] == $info['p_id']): ?>selected<?php endif; ?> >
                                    |--<?php echo htmlentities($v['news_type_name']); ?>
                                </option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">状态：</div>
                        <div class="form-cont">
                            <label class="radio">
                                <input type="radio" name="state" value="1" <?php if(1 == $info['state']): ?>checked<?php endif; ?> />
                                <span>显示</span>
                            </label>
                            <label class="radio">
                                <input type="radio" name="state" value="0" <?php if(0 == $info['state']): ?>checked<?php endif; ?> />
                                <span>隐藏</span>
                            </label>

                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">点击修改：</div>
                        <div class="form-cont">
                            <input type="file" name="filename" id="upload" class="form-control form-boxed"
                                   style="width:300px;">
                            <!--<button type="button" class="btn btn-primary" id="upload">上传</button>-->
                            <input type="hidden" name="news_type_img" id="news_type_img" disabled="disabled" value="">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label">原配图：</div>
                        <div class="form-cont">
                            <a href="/static/upload/<?php echo htmlentities($info['news_type_img']); ?>" target="_blank">
                                <img src="/static/upload/<?php echo htmlentities($info['news_type_img']); ?>" class="news_type_img" style="width:200px;height:200px;" alt="">
                            </a>
                        </div>
                    </div>

                    <script>
                        //图片上传
                        $('#upload').change(function () {
                            $.ajaxFileUpload({
                                url: "<?php echo url('News/upload_img'); ?>", //你处理上传文件的服务端
                                secureuri: false,
                                fileElementId: 'upload',//与页面处理代码中file相对应的ID值
                                type: "post",
                                processData: false,
                                contentType: false,
                                dataType: 'json', //返回数据类型:看后端返回的是什么数据,在IE下后端要设置请求头的Content-Type:text/html; charset=UTF-8
                                success: function (data) {
                                    if (data.status == 200) {
                                        layer.msg(data.tips);
                                        $('#news_type_img').removeAttr("disabled");
                                        $('#news_type_img').val(data.url);
                                        $('.news_type_img').attr('src','/static/upload/'+data.url);
                                    } else {
                                        layer.msg(data.tips);
                                    }
                                },
                                error: function (data, status, e) { //提交失败自动执行的处理函数
                                    layer.msg(e);
                                }
                            })
                        });
                    </script>

                    <div class="form-group-col-2">
                        <div class="form-label">排序：</div>
                        <div class="form-cont">
                            <input type="number" value="<?php echo htmlentities($info['show_order']); ?>" name="show_order" class="form-control form-boxed"
                                   style="width:300px;">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label"></div>
                        <div class="form-cont">
                            <input type="button" onclick="ajax_submit()" class="btn btn-primary" value="提交表单"/>
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
<script>
    function ajax_submit() {

        var form_data = $('#form_data').serializeArray();
        /*if(form_data[0].value == ''){
         layer.msg('请上传图片');
         return false;
         }*/
        $.post('<?php echo url("News/editor_newstype_do"); ?>', form_data, function (data) {
            if (data.status == 200) {
                layer.msg(data.tips);
                setTimeout("location.reload();", 2000);
            } else {
                layer.msg(data.tips);
            }
        })
    }
</script>
</body>
</html>
