<?php /*a:5:{s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\index\index.html";i:1529461368;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\static.html";i:1529542576;s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\menu.html";i:1528855708;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\header.html";i:1531362095;s:65:"E:\www-web\ThinkPHP_CMS\application\admin\view\public\footer.html";i:1529573972;}*/ ?>
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
            $.get('<?php echo url("Index/clear_cache"); ?>', function (data) {
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
            $.get('<?php echo url("System/restore"); ?>', function (data) {
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
            <!--开始::内容-->
            <div class="page-wrap">
                <section class="page-hd">
                    <header>
                        <h2 class="title"><i class="icon-home"></i>系统配置信息</h2>
                        <!--<p class="title-description">-->
                            <!--简约风模快化后台管理模板，自由打造个性化后台管理系统,-->
                            <!--<em class="text-primary">HTML5</em>+<em class="text-primary">CSS3</em>经典组合;-->
                            <!--该模板由<a class="text-primary" title="DeathGhost.cn">DeathGhost</a>个人提供,仅供参考。-->
                        <!--</p>-->
                    </header>
                    <hr>
                </section>
                <table class="table table-bordered  mb-15 mt-15">
                    <tbody>
                    <?php if(is_array($config) || $config instanceof \think\Collection || $config instanceof \think\Paginator): $i = 0; $__LIST__ = $config;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <tr class="cen">
                        <td style="width:auto">
                            <?php echo htmlentities($key); ?>：
                        </td>
                        <td style="width:auto">
                            <?php echo htmlentities($v); ?>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
                <!--<blockquote class="blockquote mb-20">-->
                    <!--<p class="text-success">原始模板为php文件格式，css为less分类编辑，您所看到的生成后的html版本</p>-->
                    <!--<p class="text-success">当前页面左侧导航根据根据路径而定，这里可能未产生效果</p>-->
                    <!--<p class="text-success">引入样式建议link的方式引入页面，避免使用css导入样式，特此说明</p>-->
                    <!--<p>本模板基于HTML5+CSS3的基础上进行设计制作，仅支持高版本浏览器，如果亲还在使用低版本浏览器，-->
                        <!--暂时只能i'm sorryO(∩_∩)O咯~望亲见谅！</p>-->
                    <!--<p>内容包含：页面基础排版（flex/column-count）布局、按钮系列组、表格系列、进度条、分页、表单、-->
                        <!--文本编辑器、统计图表、TAB选项卡、CSS3基础动画及第三方弹层插件等常见页面使用元素。</p>-->
                <!--</blockquote>-->
                <!--<div class="panel panel-default">-->
                    <!--<div class="panel-bd capitalize">-->
                        <!--浏览器兼容：google chrome、microsoft edge、360浏览器、火狐浏览器、uc浏览器等高版本浏览器。-->
                    <!--</div>-->
                <!--</div>-->

                <!--<div class="clear mt-20">-->
                    <!--<div class="fl">-->
                        <!--<button class="btn btn-secondary"><i class="icon-double-angle-left"></i>上一周</button>-->
                        <!--<button class="btn btn-secondary">下一周<i class="icon-double-angle-right"></i></button>-->
                    <!--</div>-->
                    <!--<div class="fr input-group">-->
                        <!--<input type="text" class="form-control" placeholder="搜索..." style="width:290px;"/>-->
                        <!--<button class="btn btn-secondary-outline">搜索</button>-->
                    <!--</div>-->
                <!--</div>-->
                <!--<table class="table table-bordered  mb-15 mt-15">-->
                    <!--<thead>-->
                    <!--<tr class="cen">-->
                        <!--<th>今日订单数（单位：单）</th>-->
                        <!--<th>今日订单额（单位：元）</th>-->
                        <!--<th>今日销售量（单位：件）</th>-->
                        <!--<th>库存警告（单位：件）</th>-->
                    <!--</tr>-->
                    <!--</thead>-->
                    <!--<tbody>-->
                    <!--<tr class="cen">-->
                        <!--<td><b>839</b></td>-->
                        <!--<td><b>￥12000.00</b></td>-->
                        <!--<td><b>932</b></td>-->
                        <!--<td><b class="text-warning">8</b></td>-->
                    <!--</tr>-->
                    <!--</tbody>-->
                <!--</table>-->
                <!--<div class="lt clear">-->
                    <!--<div class="fl">-->
                        <!--<button class="btn btn-warning"><i class="icon-cog"></i>批量编辑</button>-->
                        <!--<button class="btn btn-danger"><i class="icon-trash"></i>批量删除</button>-->
                        <!--<button class="btn btn-disabled" disabled="disabled"><i class="icon-remove-sign"></i>不可编辑</button>-->
                    <!--</div>-->
                    <!--<div class="pagination fr"></div>-->
                <!--</div>-->
                <!--<table class="table table-bordered  mb-15 mt-15">-->
                    <!--<tbody>-->
                    <!--<tr class="cen">-->
                        <!--<td style="width:50%">-->
                            <!--<div id="demo1" style="height:300px"></div>-->
                        <!--</td>-->
                        <!--<td style="width:50%">-->
                            <!--<div id="demo2" style="height:300px"></div>-->
                        <!--</td>-->
                    <!--</tr>-->
                    <!--</tbody>-->
                <!--</table>-->

                <!--瀑布流布局3列：：嵌套-->
                <!--<div class="flow-layout col-3">-->
                    <!--<ul>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--后台模板不存在页面<abbr class="capitalize">seo</abbr>优化问题，这里将head单独提出来，加载公共引入文件。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--整体结构比较清晰，大家可根据项目对其调整； 该模板色值预定义6类，对应每个模块颜色。-->
                                    <!--即：<span class="text-muted">text-muted</span>、-->
                                    <!--<span class="text-primary">text-primary</span>、-->
                                    <!--<span class="text-success">text-success</span>、-->
                                    <!--<span class="text-info">text-info</span>、-->
                                    <!--<span class="text-warning">text-warning</span>、-->
                                    <!--<span class="text-danger">text-danger</span>需要重新定义或增删自行修改即可。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--<span class="text-primary">文本编辑器</span>及<span class="text-primary">数据统计图表</span>均引用百度相关插件，可另行处理。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--样式通过简单的<span class="text-info capitalize">less格式</span>分类引入，需要二次编辑处理可以对其进行调整。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd capitalize">-->
                                    <!--javascript包含公共库及第三方插件以及页面js文件。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--<span class="text-info capitalize">images</span>文件为模板所需图片文件；<span class="text-info capitalize">upload</span>为测试图片，亲们可根据项目定义路径。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                        <!--<li class="child-wrap">-->
                            <!--<div class="panel panel-default">-->
                                <!--<div class="panel-bd">-->
                                    <!--正式项目可以文件进行实际操作时直接归置到该模板的根目录下即可，而<span class="text-danger capitalize">现在所看到的仅为demo演示而已</span>，<span class="text-muted">可对其删除</span>。-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</li>-->
                    <!--</ul>-->
                <!--</div>-->
            </div>


            <script>
                //分页
                $(".pagination").createPage({
                    pageCount:5,
                    current:1,
                    backFn:function(p){
                        console.log(p);
                    }
                });
                //demo1
                var dom = document.getElementById("demo1");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                function randomData() {
                    now = new Date(+now + oneDay);
                    value = value + Math.random() * 21 - 10;
                    return {
                        name: now.toString(),
                        value: [
                            [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                            Math.round(value)
                        ]
                    }
                }

                var data = [];
                var now = +new Date(1997, 9, 3);
                var oneDay = 24 * 3600 * 1000;
                var value = Math.random() * 1000;
                for (var i = 0; i < 1000; i++) {
                    data.push(randomData());
                }

                option = {
                    tooltip: {
                        trigger: 'axis',
                        formatter: function (params) {
                            params = params[0];
                            var date = new Date(params.name);
                            return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
                        },
                        axisPointer: {
                            animation: false
                        }
                    },
                    xAxis: {
                        type: 'time',
                        splitLine: {
                            show: false
                        }
                    },
                    yAxis: {
                        type: 'value',
                        boundaryGap: [0, '100%'],
                        splitLine: {
                            show: false
                        }
                    },
                    series: [{
                        name: '模拟数据',
                        type: 'line',
                        showSymbol: false,
                        hoverAnimation: false,
                        data: data
                    }]
                };

                setInterval(function () {

                    for (var i = 0; i < 5; i++) {
                        data.shift();
                        data.push(randomData());
                    }

                    myChart.setOption({
                        series: [{
                            data: data
                        }]
                    });
                }, 1000);;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }

                //demo2
                var dom = document.getElementById("demo2");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: ['周一','周二','周三','周四','周五','周六','周日']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'邮件营销',
                            type:'line',
                            stack: '总量',
                            data:[120, 132, 101, 134, 90, 230, 210]
                        },
                        {
                            name:'联盟广告',
                            type:'line',
                            stack: '总量',
                            data:[220, 182, 191, 234, 290, 330, 310]
                        },
                        {
                            name:'视频广告',
                            type:'line',
                            stack: '总量',
                            data:[150, 232, 201, 154, 190, 330, 410]
                        },
                        {
                            name:'直接访问',
                            type:'line',
                            stack: '总量',
                            data:[320, 332, 301, 334, 390, 330, 320]
                        },
                        {
                            name:'搜索引擎',
                            type:'line',
                            stack: '总量',
                            data:[820, 932, 901, 934, 1290, 1330, 1320]
                        }
                    ]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            </script>
            <!--开始::结束-->
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
</body>
</html>
