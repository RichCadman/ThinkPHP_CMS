/*
MySQL Database Backup Tools
Server:127.0.0.1:
Database:thinkphp_cms
Data:2018-07-05 15:50:45
*/
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '登陆用户名',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `unique_id` int(11) DEFAULT NULL COMMENT '登录标识',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(2) DEFAULT '1' COMMENT '是否删除  默认1正常   0禁用',
  `qq` varchar(255) DEFAULT '' COMMENT 'QQ号',
  `wx` varchar(255) DEFAULT '' COMMENT '微信',
  `phone` varchar(255) DEFAULT '' COMMENT '手机号',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `intro` text COMMENT '用户介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理员表';
-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` (`id`,`username`,`password`,`unique_id`,`last_time`,`login_count`,`status`,`qq`,`wx`,`phone`,`address`,`intro`) VALUES ('1','admin','202cb962ac59075b964b07152d234b70','39358','2018-07-05 15:49:59','33','1','417626953','lqm_956','18100386352','济南','<p>帅！！！</p><p><br/></p>');
INSERT INTO `cms_admin` (`id`,`username`,`password`,`unique_id`,`last_time`,`login_count`,`status`,`qq`,`wx`,`phone`,`address`,`intro`) VALUES ('2','刘全明','202cb962ac59075b964b07152d234b70','84248','2018-06-13 16:26:11','6','1','417626953','lqm_956','18100386352','济南','<p>帅！！！</p>');
INSERT INTO `cms_admin` (`id`,`username`,`password`,`unique_id`,`last_time`,`login_count`,`status`,`qq`,`wx`,`phone`,`address`,`intro`) VALUES ('7','小猪佩奇','4297f44b13955235245b2497399d7a93','0','0000-00-00 00:00:00','0','1','6666666','7777777','8888888','社会人','<p>人狠话不多，社会我奇哥！！！</p>');

-- ----------------------------
-- Table structure for cms_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `type` varchar(255) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='banner 表';
-- ----------------------------
-- Records of cms_banner
-- ----------------------------
INSERT INTO `cms_banner` (`id`,`img_path`,`type`) VALUES ('1','20180704\b6272d36d95292661199b2acb2127559.png','首页');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_content` varchar(255) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `check_state` tinyint(2) DEFAULT NULL COMMENT '审核状态   1未审核   0审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论表';
-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` (`id`,`news_id`,`user_id`,`comment_content`,`comment_time`,`check_state`) VALUES ('1','1','1','社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人','2018-06-21 11:50:00','1');

-- ----------------------------
-- Table structure for cms_field_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_field_config`;
CREATE TABLE `cms_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_type` varchar(255) DEFAULT '0' COMMENT '字段类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字段配置表';
-- ----------------------------
-- Records of cms_field_config
-- ----------------------------
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('1','varchar(255)');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('2','int(11)');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('3','longtext');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('4','text');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('5','tinyint(2)');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('6','datetime');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('7','decimal(10,2)');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('8','float(10,2)');
INSERT INTO `cms_field_config` (`id`,`field_type`) VALUES ('9','date');

-- ----------------------------
-- Table structure for cms_goods
-- ----------------------------
DROP TABLE IF EXISTS `cms_goods`;
CREATE TABLE `cms_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT '0' COMMENT '商品名称',
  `goods_img` varchar(255) DEFAULT '0' COMMENT '商品图片',
  `goods_num` int(11) DEFAULT '0' COMMENT '商品库存',
  `create_time` datetime DEFAULT '2018-06-26 11:06:12' COMMENT '创建时间',
  `goods_sell` int(11) DEFAULT '0' COMMENT '商品销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品表';
-- ----------------------------
-- Records of cms_goods
-- ----------------------------
INSERT INTO `cms_goods` (`id`,`goods_name`,`goods_img`,`goods_num`,`create_time`,`goods_sell`) VALUES ('1','午餐','','20','2018-06-26 11:06:12','50');

-- ----------------------------
-- Table structure for cms_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_group`;
CREATE TABLE `cms_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组表',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` varchar(255) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则","隔开',
  `menu_id` varchar(255) DEFAULT NULL COMMENT '菜单权限组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限组表';
-- ----------------------------
-- Records of cms_group
-- ----------------------------
INSERT INTO `cms_group` (`id`,`title`,`status`,`rules`,`menu_id`) VALUES ('1','管理员','1','2,3,4,5,6,7,8,9,11,12,13,14,15,16,18,25,26,52,53,54,55,20,21,22,23,24,45,46,47,48,49,50,51,28,29,30,31,32,33,34,35,37,38,39,40,42,43,44,57,58,59,60','1,10,17,19,27,36,41,56');
INSERT INTO `cms_group` (`id`,`title`,`status`,`rules`,`menu_id`) VALUES ('2','经理','1','2,3,4,5,6,7,8,9,11,12,13,14,15,16,18','1,10,17');
INSERT INTO `cms_group` (`id`,`title`,`status`,`rules`,`menu_id`) VALUES ('4','销售','1','11,15,16','10');

-- ----------------------------
-- Table structure for cms_group_access
-- ----------------------------
DROP TABLE IF EXISTS `cms_group_access`;
CREATE TABLE `cms_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户组明细表   ',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联权限组表';
-- ----------------------------
-- Records of cms_group_access
-- ----------------------------
INSERT INTO `cms_group_access` (`uid`,`group_id`) VALUES ('1','1');
INSERT INTO `cms_group_access` (`uid`,`group_id`) VALUES ('2','2');
INSERT INTO `cms_group_access` (`uid`,`group_id`) VALUES ('6','4');
INSERT INTO `cms_group_access` (`uid`,`group_id`) VALUES ('7','4');
INSERT INTO `cms_group_access` (`uid`,`group_id`) VALUES ('8','4');

-- ----------------------------
-- Table structure for cms_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_log`;
CREATE TABLE `cms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `title` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器信息',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COMMENT='日志表';
-- ----------------------------
-- Records of cms_log
-- ----------------------------
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('45','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 14:41:35');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('46','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 14:59:07');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('47','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:00:06');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('48','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:00:41');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('49','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:01:14');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('50','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:01:48');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('51','admin','编辑规则','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:01:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('52','admin','编辑规则','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:02:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('53','admin','编辑规则','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:02:21');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('54','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 15:02:39');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('55','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:23:24');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('56','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:24:16');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('57','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:24:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('58','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:26:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('59','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:33:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('60','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 17:57:31');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('61','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:09:44');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('62','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:09:58');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('63','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:10:38');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('64','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:11:15');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('65','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:11:24');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('66','admin','删除资讯分类','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:39:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('67','admin','删除资讯分类','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-19 18:39:26');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('68','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 09:14:10');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('69','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 10:23:38');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('70','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 10:24:18');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('71','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 11:40:14');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('72','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 11:40:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('73','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 11:41:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('74','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 11:43:00');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('75','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 11:43:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('76','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-20 17:31:34');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('77','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 08:57:02');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('78','admin','添加资讯','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 09:47:21');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('79','admin','添加资讯','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:08:45');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('80','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:14:32');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('81','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:14:43');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('82','admin','添加资讯','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:15:43');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('83','admin','添加资讯','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:25:36');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('84','admin','添加资讯','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:56:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('85','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:58:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('86','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:58:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('87','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:59:18');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('88','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 10:59:39');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('89','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:00:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('90','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:02:52');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('91','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:02:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('92','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:03:18');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('93','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:06:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('94','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:06:37');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('95','admin','删除资讯','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:07:51');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('96','admin','删除资讯分类','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:08:07');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('97','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:08:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('98','admin','编辑站点','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:41:51');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('99','admin','编辑站点','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 11:41:55');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('100','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:47:24');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('101','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:48:06');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('102','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:48:34');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('103','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:49:04');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('104','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:49:33');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('105','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 14:49:44');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('106','admin','编辑评论','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 15:29:30');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('107','admin','编辑评论','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 15:30:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('108','admin','删除评论','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 15:33:11');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('109','admin','编辑评论','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 15:40:58');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('110','admin','审核评论','操作','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:08:56');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('111','admin','审核评论','操作','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:09:04');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('112','admin','审核评论','操作','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:09:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('113','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:58:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('114','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:58:30');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('115','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:58:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('116','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:59:30');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('117','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 16:59:39');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('118','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:10:38');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('119','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:10:54');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('120','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:11:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('121','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:11:12');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('122','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:11:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('123','admin','删除用户','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:12:43');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('124','admin','删除用户','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:13:33');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('125','admin','下载备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:13:42');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('126','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:35');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('127','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:44');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('128','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('129','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:49');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('130','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:51');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('131','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:54');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('132','admin','删除备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:14:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('133','admin','添加用户','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:19:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('134','admin','删除用户','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-21 17:19:07');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('135','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 15:59:11');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('136','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:04:42');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('137','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:48:14');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('138','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:48:34');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('139','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:48:58');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('140','admin','编辑规则','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:51:44');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('141','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:52:14');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('142','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:52:34');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('143','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:52:45');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('144','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:52:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('145','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:56:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('146','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 16:57:48');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('147','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:43:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('148','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:43:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('149','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:44:25');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('150','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:44:50');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('151','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:45:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('152','admin','添加.cms_field_config.表','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:54:10');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('153','admin','.cms_field_config.表添加字段.field_type','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 17:55:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('154','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:06:29');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('155','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:07:07');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('156','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:07:16');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('157','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:07:21');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('158','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:07:30');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('159','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:07:42');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('160','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:09:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('161','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:09:39');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('162','admin','编辑字段类型','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:14:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('163','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:15:23');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('164','admin','删除字段类型','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:15:29');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('165','admin','删除.cms_test.表','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:27:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('166','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-23 18:27:29');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('167','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 14:43:46');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('168','admin','编辑用户','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:14:54');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('169','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:15:10');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('170','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:15:23');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('171','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:15:37');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('172','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:16:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('173','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:16:15');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('174','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:16:26');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('175','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:16:37');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('176','admin','编辑评论','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:24:17');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('177','admin','审核评论','操作','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:26:17');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('178','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','2018-06-24 15:29:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('179','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:49:24');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('180','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:50:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('181','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:51:25');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('182','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:52:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('183','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:52:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('184','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('185','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('186','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('187','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('188','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:19');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('189','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('190','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:20');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('191','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:40');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('192','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 09:53:58');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('193','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:05:38');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('194','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:14:28');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('195','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:14:55');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('196','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:15:27');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('197','admin','数据备份','数据','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:21:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('198','admin','.cms_system.表添加字段.check_login','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:37:42');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('199','admin','编辑站点','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:38:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('200','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','2018-06-25 10:38:53');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('201','admin','编辑站点','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:39:03');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('202','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:42:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('203','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:42:58');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('204','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','2018-06-25 10:43:50');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('205','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','2018-06-25 10:44:02');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('206','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:44:09');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('207','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:44:26');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('208','admin','登出系统','登出','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','2018-06-25 10:44:31');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('209','admin','编辑站点','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-25 10:44:42');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('210','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','2018-06-25 10:45:02');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('211','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:01:28');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('212','admin','添加.cms_goods.表','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:01:45');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('213','admin','.cms_goods.表添加字段.goods_name','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:02:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('214','admin','.cms_goods.表添加字段.goods_img','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:02:30');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('215','admin','.cms_goods.表添加字段.goods_num','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:02:52');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('216','admin','.cms_goods.表添加字段.create_time','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:06:35');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('217','admin','.cms_goods.表添加字段.goods_sell','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:08:39');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('218','admin','添加.cms_orders.表','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:12:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('219','admin','.cms_orders.表添加字段.order_num','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:13:28');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('220','admin','.cms_orders.表添加字段.order_time','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:31:13');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('221','admin','.cms_orders.表添加字段.uid','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:31:49');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('222','admin','.cms_orders.表添加字段.status','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 11:32:28');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('223','admin','.cms_orders.表添加字段.count','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-26 14:50:11');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('224','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 10:03:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('225','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 10:05:40');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('226','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 10:06:17');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('227','admin','删除用户','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 15:46:15');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('228','admin','删除用户','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 15:46:17');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('229','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:36:51');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('230','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:51:32');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('231','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:51:54');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('232','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:52:25');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('233','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:52:32');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('234','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:55:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('235','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 17:55:28');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('236','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-27 18:07:38');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('237','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 09:18:35');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('238','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:06:22');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('239','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:06:43');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('240','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:06:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('241','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:07:10');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('242','admin','添加资讯分类','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:07:21');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('243','admin','删除资讯分类','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:07:57');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('244','admin','删除资讯分类','删除','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:08:04');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('245','admin','编辑资讯分类','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:08:32');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('246','admin','编辑资讯','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-06-28 10:21:41');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('247','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-02 10:26:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('248','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-03 13:43:08');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('249','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:40:37');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('250','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:41:47');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('251','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:42:24');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('252','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:42:56');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('253','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:43:23');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('254','admin','添加规则','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:43:53');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('255','admin','编辑规则','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:44:00');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('256','admin','编辑权限组','编辑','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:44:07');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('257','admin','添加.cms_banner.表','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:44:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('258','admin','.cms_banner.表添加字段.img_path','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:49:05');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('259','admin','.cms_banner.表添加字段.type','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:49:16');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('260','admin','添加banner图','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-04 16:50:01');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('261','admin','登陆系统','登陆','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-05 15:49:59');
INSERT INTO `cms_log` (`id`,`name`,`title`,`type`,`ip`,`browser`,`time`) VALUES ('262','admin','添加字段类型','添加','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36','2018-07-05 15:50:33');

-- ----------------------------
-- Table structure for cms_news
-- ----------------------------
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_type_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '新闻标题',
  `short_title` varchar(255) DEFAULT NULL COMMENT '短标题',
  `content` longtext COMMENT '新闻内容',
  `short_content` text COMMENT '短内容',
  `news_img` varchar(255) DEFAULT NULL COMMENT '新闻标题',
  `click_num` int(11) DEFAULT NULL COMMENT '点击量',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `state` tinyint(2) DEFAULT '1' COMMENT '状态    1正常   0禁止',
  `create_time` date DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='资讯表';
-- ----------------------------
-- Records of cms_news
-- ----------------------------
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('1','6','小猪佩奇身上纹。。。','小猪佩奇','<p>小猪佩奇身上纹</p>','谁是社会人','20180624\fa9b88f7a2989d1bebb018cdfa057986.jpg','200','喜羊羊','1','2018-06-21','2018-06-21 09:47:21');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('3','5','今年的济南热不热？','今年的济南热不热？','<p>今年的济南热不热？</p><p>&nbsp;&nbsp;&nbsp;&nbsp;热不热自己心里没点B数吗？<br/></p><p><br/></p>','今年的济南热不热？','20180624\557de811b9585daaaa041a58f79b0de5.jpg','1121','济南','1','2018-06-21','2018-06-21 10:15:43');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('4','5','济南','济南','<p>济南</p>','济南','20180624\58d234b2c74134eb035b98706f91e336.jpg','12312','济南','1','2018-06-21','2018-06-21 10:25:36');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('5','5','济南呐1','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('6','5','济南呐2','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('7','5','济南呐3','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('8','5','济南呐4','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('9','5','济南呐5','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('10','5','济南呐6','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('11','5','济南呐7','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('12','5','济南呐8','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('13','5','济南呐9','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('14','5','济南呐10','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('15','5','济南呐11','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');
INSERT INTO `cms_news` (`id`,`news_type_id`,`title`,`short_title`,`content`,`short_content`,`news_img`,`click_num`,`author`,`state`,`create_time`,`update_time`) VALUES ('16','5','济南呐12','济南呐','<p>济南呐</p>','济南呐','20180624\2a912aa903ce0b79e6213b9929b12c73.jpg','1200','济南呐','0','2018-06-22','2018-06-21 10:56:20');

-- ----------------------------
-- Table structure for cms_news_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_news_type`;
CREATE TABLE `cms_news_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT '0' COMMENT '父级id',
  `news_type_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `news_type_img` varchar(255) DEFAULT NULL COMMENT '分类配图',
  `show_order` int(11) DEFAULT NULL COMMENT '排序位置',
  `state` tinyint(2) DEFAULT '1' COMMENT '显示状态   1显示   0隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='资讯分类表';
-- ----------------------------
-- Records of cms_news_type
-- ----------------------------
INSERT INTO `cms_news_type` (`id`,`p_id`,`news_type_name`,`news_type_img`,`show_order`,`state`,`create_time`) VALUES ('3','0','国内新闻','20180624\de41b9f5a187b8afdcff6b0c6032d278.jpg','10','1','2018-06-20 10:23:38');
INSERT INTO `cms_news_type` (`id`,`p_id`,`news_type_name`,`news_type_img`,`show_order`,`state`,`create_time`) VALUES ('5','3','济南早知道','20180624\31ab811171648781a19e4c6cbb33b07b.jpg','11','1','2018-06-21 10:14:32');
INSERT INTO `cms_news_type` (`id`,`p_id`,`news_type_name`,`news_type_img`,`show_order`,`state`,`create_time`) VALUES ('6','5','天桥那些事','20180627\c5ae22a614e25d168debf7a707b3a92d.jpg','0','1','2018-06-27 16:54:50');
INSERT INTO `cms_news_type` (`id`,`p_id`,`news_type_name`,`news_type_img`,`show_order`,`state`,`create_time`) VALUES ('11','0','一级分类','20180628\7d333590feeef7405a68d04ec3308fb6.jpg','20','1','2018-06-28 10:06:22');
INSERT INTO `cms_news_type` (`id`,`p_id`,`news_type_name`,`news_type_img`,`show_order`,`state`,`create_time`) VALUES ('12','11','二级分类','20180628\80260d852e9f8d468f54f42e265b2084.jpg','0','1','2018-06-28 10:06:43');

-- ----------------------------
-- Table structure for cms_orders
-- ----------------------------
DROP TABLE IF EXISTS `cms_orders`;
CREATE TABLE `cms_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(255) DEFAULT '0' COMMENT '订单号',
  `order_time` datetime DEFAULT '2018-06-26 11:31:11' COMMENT '订单时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `status` tinyint(2) DEFAULT '0' COMMENT '订单 状态  1支付成功   0待支付',
  `count` int(11) DEFAULT '0' COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='订单表';
-- ----------------------------
-- Records of cms_orders
-- ----------------------------
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('1','201806261549395b31f01324af4','2018-06-26 15:49:39','8884','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('2','201806261549395b31f0133c349','2018-06-26 15:49:39','6573','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('3','201806261549395b31f013407c7','2018-06-26 15:49:39','1736','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('4','201806261549395b31f01345288','2018-06-26 15:49:39','9183','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('5','201806261549395b31f013496d1','2018-06-26 15:49:39','1582','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('6','201806261549395b31f01364a6e','2018-06-26 15:49:39','7875','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('7','201806261549395b31f01378fef','2018-06-26 15:49:39','7961','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('8','201806261549395b31f0137e96d','2018-06-26 15:49:39','6394','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('9','201806261549395b31f01384bcd','2018-06-26 15:49:39','8498','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('10','201806261549395b31f0138b20e','2018-06-26 15:49:39','9822','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('11','201806261549395b31f01390afd','2018-06-26 15:49:39','7244','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('12','201806261549395b31f01396387','2018-06-26 15:49:39','4852','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('13','201806261549395b31f0139c600','2018-06-26 15:49:39','1291','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('14','201806261549395b31f013a2aa2','2018-06-26 15:49:39','1833','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('15','201806261549395b31f013a8073','2018-06-26 15:49:39','1569','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('16','201806261549405b31f0145a963','2018-06-26 15:49:40','7596','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('17','201806261549405b31f0145f1ec','2018-06-26 15:49:40','9052','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('18','201806261549405b31f01463c95','2018-06-26 15:49:40','2681','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('19','201806261549405b31f01467da5','2018-06-26 15:49:40','5200','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('20','201806261549405b31f0146d282','2018-06-26 15:49:40','1039','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('21','201806261549405b31f01478245','2018-06-26 15:49:40','1572','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('22','201806261549405b31f014810e5','2018-06-26 15:49:40','4447','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('23','201806261549405b31f0148f980','2018-06-26 15:49:40','1827','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('24','201806261549405b31f0149458a','2018-06-26 15:49:40','1251','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('25','201806261549405b31f0149a3da','2018-06-26 15:49:40','3850','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('26','201806261549405b31f0149e60b','2018-06-26 15:49:40','4723','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('27','201806261549405b31f014a7f5c','2018-06-26 15:49:40','9783','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('28','201806261549405b31f014ac53c','2018-06-26 15:49:40','5515','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('29','201806261549405b31f014b19d3','2018-06-26 15:49:40','4554','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('30','201806261549405b31f014c19f3','2018-06-26 15:49:40','4231','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('31','201806261549405b31f014c763e','2018-06-26 15:49:40','6394','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('32','201806261549405b31f014d591b','2018-06-26 15:49:40','3602','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('33','201806261549405b31f014da5ec','2018-06-26 15:49:40','9439','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('34','201806261549405b31f014dea28','2018-06-26 15:49:40','8374','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('35','201806261549405b31f014e44b2','2018-06-26 15:49:40','4183','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('36','201806261549405b31f014e8da8','2018-06-26 15:49:40','4567','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('37','201806261549415b31f0150057a','2018-06-26 15:49:41','2177','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('38','201806261549415b31f01505f4c','2018-06-26 15:49:41','7485','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('39','201806261549415b31f0150aab3','2018-06-26 15:49:41','6078','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('40','201806261549415b31f01513ac7','2018-06-26 15:49:41','5439','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('41','201806261549415b31f0151a2bd','2018-06-26 15:49:41','2885','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('42','201806261549415b31f0151f7c8','2018-06-26 15:49:41','9223','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('43','201806261549415b31f01527ec5','2018-06-26 15:49:41','8603','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('44','201806261549415b31f015325d1','2018-06-26 15:49:41','9096','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('45','201806261549415b31f01539a95','2018-06-26 15:49:41','2679','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('46','201806261549415b31f015ea7e6','2018-06-26 15:49:41','2126','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('47','201806261549425b31f01603141','2018-06-26 15:49:42','3309','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('48','201806261549425b31f0160cb6f','2018-06-26 15:49:42','2712','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('49','201806261549425b31f01613f25','2018-06-26 15:49:42','6726','0','1');
INSERT INTO `cms_orders` (`id`,`order_num`,`order_time`,`uid`,`status`,`count`) VALUES ('50','201806261549425b31f016194e4','2018-06-26 15:49:42','9507','0','1');

-- ----------------------------
-- Table structure for cms_rule
-- ----------------------------
DROP TABLE IF EXISTS `cms_rule`;
CREATE TABLE `cms_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则表',
  `p_id` int(11) DEFAULT NULL COMMENT '父级规则id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `nav` varchar(255) DEFAULT NULL COMMENT '导航',
  `is_visible` tinyint(1) unsigned DEFAULT '2' COMMENT '是否可显示 默认2不显示   1显示',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单小图标',
  `controller` varchar(255) DEFAULT NULL COMMENT '控制器标识',
  `function` varchar(255) DEFAULT NULL COMMENT '方法标识',
  `show_order` int(11) DEFAULT NULL COMMENT '排序   越大越靠前',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='规则表';
-- ----------------------------
-- Records of cms_rule
-- ----------------------------
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('1','0','admin/Auth','权限管理','1','1','','权限管理','1','icon-lock','Auth','','1');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('2','1','admin/Auth/rule_index','规则总览','1','1','','权限管理','1','','Auth','rule_index','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('3','1','admin/Auth/add_rule','添加规则','1','1','','权限管理','2','','Auth','add_rule','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('4','1','admin/Auth/editor_rule','编辑规则','1','1','','权限管理','2','','Auth','editor_rule','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('5','1','admin/Auth/del_rule','删除规则','1','1','','权限管理','2','','Auth','del_rule','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('6','1','admin/Auth/group_index','权限组总览','1','1','','权限管理','1','','Auth','group_index','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('7','1','admin/Auth/add_group','添加权限组','1','1','','权限管理','2','','Auth','add_group','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('8','1','admin/Auth/editor_group','编辑权限组','1','1','','权限管理','2','','Auth','editor_group','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('9','1','admin/Auth/del_group','删除权限组','1','1','','权限管理','2','','Auth','del_group','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('10','0','admin/Admin','管理员管理','1','1','','管理员管理','1','icon-group','Admin','','11');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('11','10','admin/Admin/admin_index','用户总览','1','1','','管理员管理','1','','Admin','admin_index','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('12','10','admin/Admin/add_admin','添加用户','1','1','','管理员管理','2','','Admin','add_admin','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('13','10','admin/Admin/editor_admin','编辑用户','1','1','','管理员管理','2','','Admin','editor_admin','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('14','10','admin/Admin/del_admin','删除用户','1','1','','管理员管理','2','','Admin','del_admin','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('15','10','admin/Admin/my','个人中心','1','1','','管理员管理','1','','Admin','my','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('16','10','admin/Admin/editor_my','编辑个人信息','1','1','','管理员管理','2','','Admin','editor_my','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('17','0','admin/System','系统管理','1','1','','系统管理','1','icon-cogs','System','','22');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('18','17','admin/System/config','系统配置','1','1','','系统管理','1','','System','config','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('19','0','admin/Database','数据库管理','1','1','','数据库管理','1','icon-folder-close','Database','','33');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('20','19','admin/Database/database','数据库列表','1','1','','数据库管理','1','','Database','database','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('21','19','admin/Database/backups','数据备份','1','1','','数据库管理','2','','Database','backups','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('22','19','admin/Database/reduction','备份列表','1','1','','数据库管理','1','','Database','reduction','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('23','19','admin/Database/restore','数据还原','1','1','','数据库管理','2','','Database','restore','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('24','19','admin/Database/delete_database','删除备份','1','1','','数据库管理','2','','Database','delete_database','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('25','17','admin/System/logs','日志管理','1','1','','系统管理','1','','System','logs','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('26','17','admin/System/clearLogs','清空日志','1','1','','系统管理','2','','System','clearLogs','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('27','0','admin/News','资讯管理','1','1','','资讯管理','1','icon-globe','News','','44');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('28','27','admin/News/news_type','资讯分类','1','1','','资讯管理','1','','News','news_type','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('29','27','admin/News/add_newstype','添加分类','1','1','','资讯管理','2','','News','add_newstype','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('30','27','admin/News/editor_newstype','编辑分类','1','1','','资讯管理','2','','News','editor_newstype','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('31','27','admin/News/del_newstype','删除分类','1','1','','资讯管理','2','','News','del_newstype','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('32','27','admin/News/news','资讯列表','1','1','','资讯管理','1','','News','news','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('33','27','admin/News/add_news','添加资讯','1','1','','资讯管理','2','','News','add_news','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('34','27','admin/News/editor_news','编辑资讯','1','1','','资讯管理','2','','News','editor_news','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('35','27','admin/News/del_news','删除资讯','1','1','','资讯管理','2','','News','del_news','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('36','0','admin/Comment','评论管理','1','1','','评论管理','2','icon-comments	','Comment','','55');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('37','36','admin/Comment/comment','评论列表','1','1','','评论管理','2','','Comment','comment','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('38','36','admin/Comment/editor_comment','编辑评论','1','1','','评论管理','2','','Comment','editor_comment','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('39','36','admin/Comment/del_comment','删除评论','1','1','','评论管理','2','','Comment','del_comment','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('40','36','admin/Comment/check_state','审核评论','1','1','','评论管理','2','','Comment','check_state','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('41','0','admin/Users','用户管理','1','1','','用户管理','1','icon-user','Users','','55');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('42','41','admin/Users/users_index','用户列表','1','1','','用户管理','1','','Users','users_index','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('43','41','admin/Users/editor_user','编辑用户','1','1','','用户管理','2','','Users','editor_user','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('44','41','admin/Users/del_user','删除用户','1','1','','用户管理','2','','Users','del_user','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('45','19','admin/Database/add_table','添加数据表','1','1','','数据库管理','2','','Database','add_table','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('46','19','admin/Database/editor_table','编辑数据表','1','1','','数据库管理','2','','Database','editor_table','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('47','19','admin/Database/del_table','删除数据表','1','1','','数据库管理','2','','Database','del_table','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('48','19','admin/Database/table_field','表字段列表','1','1','','数据库管理','2','','Database','table_field','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('49','19','admin/Database/add_filed','添加字段','1','1','','数据库管理','2','','Database','add_filed','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('50','19','admin/Database/editor_field','编辑字段','1','1','','数据库管理','2','','Database','editor_field','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('51','19','admin/Database/del_field','删除字段','1','1','','数据库管理','2','','Database','del_field','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('52','17','admin/System/field_type','字段类型配置','1','1','','系统管理','1','','System','field_type','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('53','17','admin/System/add_field_type','添加字段类型','1','1','','系统管理','2','','System','add_field_type','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('54','17','admin/System/editor_field_type','编辑字段类型','1','1','','系统管理','2','','System','editor_field_type','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('55','17','admin/System/del_field_type','删除字段类型','1','1','','系统管理','2','','System','del_field_type','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('56','0','admin/Banner','Banner管理','1','1','','Banner管理','1','icon-picture','Banner','','50');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('57','56','admin/Banner/banner','banner列表','1','1','','Banner管理','1','','Banner','banner','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('58','56','admin/Banner/add_banner','添加banner','1','1','','Banner管理','2','','Banner','add_banner','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('59','56','admin/Banner/editor_banner','编辑banner','1','1','','Banner管理','2','','Banner','editor_banner','0');
INSERT INTO `cms_rule` (`id`,`p_id`,`name`,`title`,`type`,`status`,`condition`,`nav`,`is_visible`,`icon`,`controller`,`function`,`show_order`) VALUES ('60','56','admin/Banner/del_banner','删除','1','1','','Banner管理','2','','Banner','del_banner','0');

-- ----------------------------
-- Table structure for cms_system
-- ----------------------------
DROP TABLE IF EXISTS `cms_system`;
CREATE TABLE `cms_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '系统标题',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员权限组id',
  `home_url` varchar(255) DEFAULT NULL COMMENT '前台访问地址',
  `check` tinyint(2) DEFAULT NULL COMMENT '评论是否审核   1需要    0不需要',
  `check_login` tinyint(2) DEFAULT '1' COMMENT '是否开启唯一登陆验证   1开启    0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统表';
-- ----------------------------
-- Records of cms_system
-- ----------------------------
INSERT INTO `cms_system` (`id`,`title`,`admin_id`,`home_url`,`check`,`check_login`) VALUES ('1','模块化后台管理系统','1','http://127.0.0.5','1','0');

-- ----------------------------
-- Table structure for cms_test
-- ----------------------------
DROP TABLE IF EXISTS `cms_test`;
CREATE TABLE `cms_test` (
  `test_name` varchar(255) DEFAULT '0' COMMENT '名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='测试表';
-- ----------------------------
-- Records of cms_test
-- ----------------------------
INSERT INTO `cms_test` (`test_name`,`id`) VALUES ('0','1');

-- ----------------------------
-- Table structure for cms_users
-- ----------------------------
DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `wx` varchar(255) DEFAULT NULL COMMENT '微信',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `state` tinyint(2) DEFAULT '1' COMMENT '状态   1正常   0禁止',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
-- ----------------------------
-- Records of cms_users
-- ----------------------------
INSERT INTO `cms_users` (`id`,`username`,`password`,`integral`,`phone`,`email`,`address`,`qq`,`wx`,`photo`,`create_time`,`state`) VALUES ('1','阁下贵姓','123','10','18100386352','417626953@qq.com','济南天桥区','417626953','lqm_956','20180624\d07cfcb5f61904d6fefc584e1c948862.jpg','2018-06-21 11:54:52','1');

