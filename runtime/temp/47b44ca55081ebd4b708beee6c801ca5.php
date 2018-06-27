<?php /*a:1:{s:63:"E:\www-web\ThinkPHP_CMS\application\admin\view\login\login.html";i:1529892335;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录-后台管理系统</title>
    <meta name="keywords" content="设置关键词..."/>
    <meta name="description" content="设置描述..."/>
    <meta name="author" content="DeathGhost"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
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
</head>
<body class="login-page">
<section class="login-contain">
    <header>
        <h1><?php echo htmlentities($system['title']); ?></h1>
        <p>management system</p>
    </header>
    <div class="form-content">
        <ul>
            <li>
                <div class="form-group">
                    <label class="control-label">管理员账号：</label>
                    <input type="text" placeholder="管理员账号..." name="username" class="form-control form-underlined"
                           id="adminName"/>
                </div>
            </li>
            <li>
                <div class="form-group">
                    <label class="control-label">管理员密码：</label>
                    <input type="password" placeholder="管理员密码..." name="password" class="form-control form-underlined"
                           id="adminPwd"/>
                </div>
            </li>
            <li>
                <div class="form-group">
                    <label class="control-label">验证码：</label>
                    <input type="text" placeholder="验证码" id="verify" name="verify" style="width: 30%" class="form-control form-underlined"
                           />
                    <img src="<?php echo captcha_src(); ?>" alt="captcha" onclick="this.src='<?php echo captcha_src(); ?>?rnd=' + Math.random();" alt="">
                </div>
            </li>
            <!--<li>
                <label class="check-box">
                    <input type="checkbox" name="remember"/>
                    <span>记住账号密码</span>
                </label>
            </li>-->
            <li>
                <button class="btn btn-lg btn-block" id="entry">立即登录</button>
            </li>
            <li>
                <p class="btm-info">©Copyright 2006-2010 <a href="#" target="_blank"
                                                            title="DeathGhost">DeathGhost.cn</a></p>
                <address class="btm-info">鼎赞科技</address>
            </li>
        </ul>
    </div>
</section>
<div class="mask"></div>
<div class="dialog">
    <div class="dialog-hd">
        <strong class="lt-title">标题</strong>
        <a class="rt-operate icon-remove JclosePanel" title="关闭"></a>
    </div>
    <div class="dialog-bd">
        <!--start::-->
        <p>这里是基础弹窗,可以定义文本信息，HTML信息这里是基础弹窗,可以定义文本信息，HTML信息。</p>
        <!--end::-->
    </div>
    <div class="dialog-ft">
        <button class="btn btn-info JyesBtn">确认</button>
        <button class="btn btn-secondary JnoBtn">关闭</button>
    </div>
</div>
<script>
    $(function () {
        $('#entry').click(function () {
            if ($('#adminName').val() == '') {
                layer.msg('请输入管理员账号');
            } else if ($('#adminPwd').val() == '') {
                layer.msg('请输入管理员密码');
            } else if ($('#verify').val() == '') {
                layer.msg('请输入验证码');
            } else {
                $('.mask,.dialog').hide();
                var username = $('#adminName').val();
                var password = $('#adminPwd').val();
                var verify = $('#verify').val();
                $.post('<?php echo url("Login/login_do"); ?>', {username: username, password: password,verify:verify}, function (data) {
                    if (data.status == 200) {
                        layer.msg(data.tips);
                        setTimeout("location.href = '<?php echo url("Index/index"); ?>'",500);
                    } else {
                        layer.msg(data.tips);
                    }
                })
            }
        });
    });
</script>
</body>
</html>
