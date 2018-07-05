<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>黑色个人博客HTML5模板</title>
    <meta name="keywords" content="个人博客模板,博客模板,响应式" />
    <meta name="description" content="个人博客模板，神秘、俏皮。" />
    <link href="../static/index/css/base.css" rel="stylesheet">
    <link href="../static/index/css/style.css" rel="stylesheet">
    <link href="../static/index/css/media.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <!--[if lt IE 9]>
    <script src="../static/index/js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<div class="ibody">
    <header>
        <h1>如影随形</h1>
        <h2>影子是一个会撒谎的精灵，它在虚空中流浪和等待被发现之间;在存在与不存在之间....</h2>
        <div class="logo"><a href="/"></a></div>
        <nav id="topnav"><a href="index.html">首页</a><a href="about.html">关于我</a><a href="newlist.html">慢生活</a><a href="share.html">模板分享</a><a href="new.html">模板主题</a></nav>
    </header>
    <article>
        <h2 class="about_h">您现在的位置是：<a href="/">首页</a>><a href="1/">慢生活</a></h2>
        <div class="bloglist">
            <?php foreach ($info as $k => $v){ ?>
            <div class="newblog">
                <ul>
                    <h3><a href="/"><?php echo $v['title'] ?></a></h3>
                    <div class="autor"><span>作者：<?php echo $v['author'] ?></span><span>分类：[<a href="/">日记</a>]</span><span>浏览（<a href="/"><?php echo $v['click_num'] ?></a>）</span><span>评论（<a href="/">30</a>）</span></div>
                    <p><?php echo $v['content'] ?><a href="./html/newsDetail_<?php echo $v['id'] ?>" target="_blank" class="readmore">全文</a></p>
                </ul>
                <figure><img src="../static/upload/<?php echo $v['news_img'] ?>" ></figure>
                <div class="dateview"><?php echo $v['create_time'] ?></div>
            </div>
            <?php } ?>
        </div>
        <div class="page">
            <?php if($pagecount ==1){ ?>
                <b><?php echo $pagecount; ?></b>
            <?php } elseif($pagecount <= $pageShow) {
                for($j = 1; $j <= $pagecount; $j++){
                    if($j < $i) {?>
                        <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                    <?php } elseif ($j == $i) { ?>
                        <b><?php echo $j; ?></b>
                    <?php } else { ?>
                        <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                    <?php } ?>
                <?php } ?>
            <?php } else {
                if ($i + 3 <= $pagecount) {
                    if (($i - 3) > 3){
                        for ($j = $i - 3; $j <= $i + 3; $j++) {
                            if($j < $i) {?>
                                <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                            <?php } elseif ($j == $i) { ?>
                                <b><?php echo $j; ?></b>
                            <?php } else { ?>
                                <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                            <?php } ?>
                        <?php } ?>
                    <?php } else {
                        for ($j = $i; $j <= $i + (7 - $j); $j++) {
                            if(($j - $i + 1) < $i) {?>
                                <a href="./newsList_p<?php echo $j - $i + 1; ?>.html"><?php echo $j - $i + 1; ?></a>
                            <?php } elseif ($j == $i) { ?>
                                <b><?php echo $j; ?></b>
                            <?php } else { ?>
                                <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>

                <?php } elseif ($i + 2 <= $pagecount) {
                    for ($j = $i - 2; $j <= $i + 2; $j++) {
                        if($j < $i) {?>
                            <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                        <?php } elseif ($j == $i) { ?>
                            <b><?php echo $j; ?></b>
                        <?php } else { ?>
                            <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                        <?php } ?>
                    <?php } ?>
                <?php } elseif ($i + 1 <= $pagecount) {
                    for ($j = $i - 1; $j <= $i + 1; $j++) {
                        if($j < $i) {?>
                            <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                        <?php } elseif ($j == $i) { ?>
                            <b><?php echo $j; ?></b>
                        <?php } else { ?>
                            <a href="./newsList_p<?php echo $j; ?>.html"><?php echo $j; ?></a>
                        <?php } ?>
                    <?php } ?>
                <?php } elseif ($i == $pagecount) {
                    for ($j = $i; $j <= $i; $j++) {?>
                        <b><?php echo $j; ?></b>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
        </div>
    </article>
    <aside>
        <div class="rnav">
            <li class="rnav1 "><a href="/">日记</a></li>
            <li class="rnav2 "><a href="/">欣赏</a></li>
            <li class="rnav3 "><a href="/">程序人生</a></li>
            <li class="rnav4 "><a href="/">经典语录</a></li>
        </div>
        <div class="ph_news">
            <h2>
                <p>点击排行</p>
            </h2>
            <ul class="ph_n">
                <li><span class="num1">1</span><a href="/">有一种思念，是淡淡的幸福,一个心情一行文字</a></li>
                <li><span class="num2">2</span><a href="/">励志人生-要做一个潇洒的女人</a></li>
                <li><span class="num3">3</span><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></li>
                <li><span>4</span><a href="/">Green绿色小清新的夏天-个人博客模板</a></li>
                <li><span>5</span><a href="/">女生清新个人博客网站模板</a></li>
                <li><span>6</span><a href="/">Wedding-婚礼主题、情人节网站模板</a></li>
                <li><span>7</span><a href="/">Column 三栏布局 个人网站模板</a></li>
                <li><span>8</span><a href="/">时间煮雨-个人网站模板</a></li>
                <li><span>9</span><a href="/">花气袭人是酒香—个人网站模板</a></li>
            </ul>
            <h2>
                <p>栏目推荐</p>
            </h2>
            <ul>
                <li><a href="/">有一种思念，是淡淡的幸福,一个心情一行文字</a></li>
                <li><a href="/">励志人生-要做一个潇洒的女人</a></li>
                <li><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></li>
                <li><a href="/">Green绿色小清新的夏天-个人博客模板</a></li>
                <li><a href="/">女生清新个人博客网站模板</a></li>
                <li><a href="/">Wedding-婚礼主题、情人节网站模板</a></li>
                <li><a href="/">Column 三栏布局 个人网站模板</a></li>
                <li><a href="/">时间煮雨-个人网站模板</a></li>
                <li><a href="/">花气袭人是酒香—个人网站模板</a></li>
            </ul>
            <h2>
                <p>最新评论</p>
            </h2>
            <ul class="pl_n">
                <dl>
                    <dt><img src="images/s8.jpg"> </dt>
                    <dt> </dt>
                    <dd>DanceSmile
                        <time>49分钟前</time>
                    </dd>
                    <dd><a href="/">文章非常详细，我很喜欢.前端的工程师很少，我记得几年前yahoo花高薪招聘前端也招不到</a></dd>
                </dl>
                <dl>
                    <dt><img src="images/s7.jpg"> </dt>
                    <dt> </dt>
                    <dd>yisa
                        <time>2小时前</time>
                    </dd>
                    <dd><a href="/">我手机里面也有这样一个号码存在</a></dd>
                </dl>
                <dl>
                    <dt><img src="images/s6.jpg"> </dt>
                    <dt> </dt>
                    <dd>小林博客
                        <time>8月7日</time>
                    </dd>
                    <dd><a href="/">博客色彩丰富，很是好看</a></dd>
                </dl>
                <dl>
                    <dt><img src="images/003.jpg"> </dt>
                    <dt> </dt>
                    <dd>DanceSmile
                        <time>49分钟前</time>
                    </dd>
                    <dd><a href="/">文章非常详细，我很喜欢.前端的工程师很少，我记得几年前yahoo花高薪招聘前端也招不到</a></dd>
                </dl>
                <dl>
                    <dt><img src="images/002.jpg"> </dt>
                    <dt> </dt>
                    <dd>yisa
                        <time>2小时前</time>
                    </dd>
                    <dd><a href="/">我手机里面也有这样一个号码存在</a></dd>
                </dl>
            </ul>
            <h2>
                <p>最近访客</p>
                <ul>
                    <img src="images/vis.jpg"><!-- 直接使用“多说”插件的调用代码 -->
                </ul>
            </h2>
        </div>
        <div class="copyright">
            <ul>
                <p> Design by <a href="/">DanceSmile</a></p>
                <p>蜀ICP备11002373号-1</p>
                </p>
            </ul>
        </div>
    </aside>
    <script src="../static/index/js/silder.js"></script>
    <div class="clear"></div>
    <!-- 清除浮动 -->
</div>
</body>
</html>