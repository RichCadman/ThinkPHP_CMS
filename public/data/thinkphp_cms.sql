/*
Navicat MySQL Data Transfer

Source Server         : locahost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : thinkphp_cms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-21 17:58:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '登陆用户名',
  `password` varchar(255) DEFAULT NULL,
  `unique_id` int(11) DEFAULT NULL COMMENT '登录标识',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(2) DEFAULT '1' COMMENT '是否删除  默认1正常   0禁用',
  `qq` varchar(255) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `intro` text COMMENT '用户介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '63212', '2018-06-21 08:57:02', '16', '1', '417626953', 'lqm_956', '18100386352', '济南', '<p>帅！！！</p><p><br/></p>');
INSERT INTO `cms_admin` VALUES ('2', '刘全明', '202cb962ac59075b964b07152d234b70', '84248', '2018-06-13 16:26:11', '6', '1', '417626953', 'lqm_956', '18100386352', '济南', '<p>帅！！！</p>');
INSERT INTO `cms_admin` VALUES ('7', '小猪佩奇', '4297f44b13955235245b2497399d7a93', '0', '0000-00-00 00:00:00', '0', '1', '6666666', '7777777', '8888888', '社会人', '<p>人狠话不多，社会我奇哥！！！</p>');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('1', '1', '1', '社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人社会人', '2018-06-21 11:50:00', '0');

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
INSERT INTO `cms_group` VALUES ('1', '管理员', '1', '2,3,4,5,6,7,8,9,11,12,13,14,15,16,18,25,26,20,21,22,23,24,28,29,30,31,32,33,34,35,37,38,39,40,42,43,44', '1,10,17,19,27,36,41');
INSERT INTO `cms_group` VALUES ('2', '经理', '1', '2,3,4,5,6,7,8,9,11,12,13,14,15,16,18', '1,10,17');
INSERT INTO `cms_group` VALUES ('4', '销售', '1', '11,15,16', '10');

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
INSERT INTO `cms_group_access` VALUES ('1', '1');
INSERT INTO `cms_group_access` VALUES ('2', '2');
INSERT INTO `cms_group_access` VALUES ('6', '4');
INSERT INTO `cms_group_access` VALUES ('7', '4');
INSERT INTO `cms_group_access` VALUES ('8', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of cms_log
-- ----------------------------
INSERT INTO `cms_log` VALUES ('45', 'admin', '数据备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 14:41:35');
INSERT INTO `cms_log` VALUES ('46', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 14:59:07');
INSERT INTO `cms_log` VALUES ('47', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:00:06');
INSERT INTO `cms_log` VALUES ('48', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:00:41');
INSERT INTO `cms_log` VALUES ('49', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:01:14');
INSERT INTO `cms_log` VALUES ('50', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:01:48');
INSERT INTO `cms_log` VALUES ('51', 'admin', '编辑规则', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:01:57');
INSERT INTO `cms_log` VALUES ('52', 'admin', '编辑规则', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:02:08');
INSERT INTO `cms_log` VALUES ('53', 'admin', '编辑规则', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:02:21');
INSERT INTO `cms_log` VALUES ('54', 'admin', '编辑权限组', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 15:02:39');
INSERT INTO `cms_log` VALUES ('55', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:23:24');
INSERT INTO `cms_log` VALUES ('56', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:24:16');
INSERT INTO `cms_log` VALUES ('57', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:24:59');
INSERT INTO `cms_log` VALUES ('58', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:26:20');
INSERT INTO `cms_log` VALUES ('59', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:33:47');
INSERT INTO `cms_log` VALUES ('60', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 17:57:31');
INSERT INTO `cms_log` VALUES ('61', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:09:44');
INSERT INTO `cms_log` VALUES ('62', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:09:58');
INSERT INTO `cms_log` VALUES ('63', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:10:38');
INSERT INTO `cms_log` VALUES ('64', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:11:15');
INSERT INTO `cms_log` VALUES ('65', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:11:24');
INSERT INTO `cms_log` VALUES ('66', 'admin', '删除资讯分类', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:39:20');
INSERT INTO `cms_log` VALUES ('67', 'admin', '删除资讯分类', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-19 18:39:26');
INSERT INTO `cms_log` VALUES ('68', 'admin', '登陆系统', '登陆', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 09:14:10');
INSERT INTO `cms_log` VALUES ('69', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 10:23:38');
INSERT INTO `cms_log` VALUES ('70', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 10:24:18');
INSERT INTO `cms_log` VALUES ('71', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 11:40:14');
INSERT INTO `cms_log` VALUES ('72', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 11:40:47');
INSERT INTO `cms_log` VALUES ('73', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 11:41:08');
INSERT INTO `cms_log` VALUES ('74', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 11:43:00');
INSERT INTO `cms_log` VALUES ('75', 'admin', '编辑权限组', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 11:43:19');
INSERT INTO `cms_log` VALUES ('76', 'admin', '登陆系统', '登陆', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-20 17:31:34');
INSERT INTO `cms_log` VALUES ('77', 'admin', '登陆系统', '登陆', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 08:57:02');
INSERT INTO `cms_log` VALUES ('78', 'admin', '添加资讯', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 09:47:21');
INSERT INTO `cms_log` VALUES ('79', 'admin', '添加资讯', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:08:45');
INSERT INTO `cms_log` VALUES ('80', 'admin', '添加资讯分类', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:14:32');
INSERT INTO `cms_log` VALUES ('81', 'admin', '编辑资讯分类', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:14:43');
INSERT INTO `cms_log` VALUES ('82', 'admin', '添加资讯', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:15:43');
INSERT INTO `cms_log` VALUES ('83', 'admin', '添加资讯', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:25:36');
INSERT INTO `cms_log` VALUES ('84', 'admin', '添加资讯', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:56:20');
INSERT INTO `cms_log` VALUES ('85', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:58:20');
INSERT INTO `cms_log` VALUES ('86', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:58:59');
INSERT INTO `cms_log` VALUES ('87', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:59:18');
INSERT INTO `cms_log` VALUES ('88', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 10:59:39');
INSERT INTO `cms_log` VALUES ('89', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:00:01');
INSERT INTO `cms_log` VALUES ('90', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:02:52');
INSERT INTO `cms_log` VALUES ('91', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:02:59');
INSERT INTO `cms_log` VALUES ('92', 'admin', '数据备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:03:18');
INSERT INTO `cms_log` VALUES ('93', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:06:20');
INSERT INTO `cms_log` VALUES ('94', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:06:37');
INSERT INTO `cms_log` VALUES ('95', 'admin', '删除资讯', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:07:51');
INSERT INTO `cms_log` VALUES ('96', 'admin', '删除资讯分类', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:08:07');
INSERT INTO `cms_log` VALUES ('97', 'admin', '编辑资讯', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:08:19');
INSERT INTO `cms_log` VALUES ('98', 'admin', '编辑站点', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:41:51');
INSERT INTO `cms_log` VALUES ('99', 'admin', '编辑站点', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 11:41:55');
INSERT INTO `cms_log` VALUES ('100', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:47:24');
INSERT INTO `cms_log` VALUES ('101', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:48:06');
INSERT INTO `cms_log` VALUES ('102', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:48:34');
INSERT INTO `cms_log` VALUES ('103', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:49:04');
INSERT INTO `cms_log` VALUES ('104', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:49:33');
INSERT INTO `cms_log` VALUES ('105', 'admin', '编辑权限组', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 14:49:44');
INSERT INTO `cms_log` VALUES ('106', 'admin', '编辑评论', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 15:29:30');
INSERT INTO `cms_log` VALUES ('107', 'admin', '编辑评论', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 15:30:13');
INSERT INTO `cms_log` VALUES ('108', 'admin', '删除评论', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 15:33:11');
INSERT INTO `cms_log` VALUES ('109', 'admin', '编辑评论', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 15:40:58');
INSERT INTO `cms_log` VALUES ('110', 'admin', '审核评论', '操作', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:08:56');
INSERT INTO `cms_log` VALUES ('111', 'admin', '审核评论', '操作', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:09:04');
INSERT INTO `cms_log` VALUES ('112', 'admin', '审核评论', '操作', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:09:13');
INSERT INTO `cms_log` VALUES ('113', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:58:05');
INSERT INTO `cms_log` VALUES ('114', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:58:30');
INSERT INTO `cms_log` VALUES ('115', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:58:57');
INSERT INTO `cms_log` VALUES ('116', 'admin', '添加规则', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:59:30');
INSERT INTO `cms_log` VALUES ('117', 'admin', '编辑权限组', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 16:59:39');
INSERT INTO `cms_log` VALUES ('118', 'admin', '编辑用户', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:10:38');
INSERT INTO `cms_log` VALUES ('119', 'admin', '编辑用户', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:10:54');
INSERT INTO `cms_log` VALUES ('120', 'admin', '编辑用户', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:11:08');
INSERT INTO `cms_log` VALUES ('121', 'admin', '编辑用户', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:11:12');
INSERT INTO `cms_log` VALUES ('122', 'admin', '编辑用户', '编辑', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:11:19');
INSERT INTO `cms_log` VALUES ('123', 'admin', '删除用户', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:12:43');
INSERT INTO `cms_log` VALUES ('124', 'admin', '删除用户', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:13:33');
INSERT INTO `cms_log` VALUES ('125', 'admin', '下载备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:13:42');
INSERT INTO `cms_log` VALUES ('126', 'admin', '数据备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:35');
INSERT INTO `cms_log` VALUES ('127', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:44');
INSERT INTO `cms_log` VALUES ('128', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:47');
INSERT INTO `cms_log` VALUES ('129', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:49');
INSERT INTO `cms_log` VALUES ('130', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:51');
INSERT INTO `cms_log` VALUES ('131', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:54');
INSERT INTO `cms_log` VALUES ('132', 'admin', '删除备份', '数据', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:14:57');
INSERT INTO `cms_log` VALUES ('133', 'admin', '添加用户', '添加', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:19:01');
INSERT INTO `cms_log` VALUES ('134', 'admin', '删除用户', '删除', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '2018-06-21 17:19:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news
-- ----------------------------
INSERT INTO `cms_news` VALUES ('1', '5', '小猪佩奇身上纹', '小猪佩奇', '<p>小猪佩奇身上纹</p>', '谁是社会人', '20180621\\767c5f749c320d72844d5ea7dfcf311f.jpg', '200', '喜羊羊', '1', '2018-06-21', '2018-06-21 09:47:21');
INSERT INTO `cms_news` VALUES ('3', '5', '今年的济南热不热？', '今年的济南热不热？', '<p>今年的济南热不热？</p>', '今年的济南热不热？', '20180621\\f559faaddefb2a6bb81b60a5c57ba74a.jpg', '1121', '济南', '1', '2018-06-21', '2018-06-21 10:15:43');
INSERT INTO `cms_news` VALUES ('4', '5', '济南', '济南', '<p>济南</p>', '济南', '20180621\\02f5ad4c84e3d1e4067070c502c1c3e5.jpg', '12312', '济南', '1', '2018-06-21', '2018-06-21 10:25:36');
INSERT INTO `cms_news` VALUES ('5', '5', '济南呐', '济南呐', '<p>济南呐</p>', '济南呐', '20180621\\33455140f8890615ec0b2999f14274cd.jpg', '1200', '济南呐', '0', '2018-06-22', '2018-06-21 10:56:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='资讯分类表';

-- ----------------------------
-- Records of cms_news_type
-- ----------------------------
INSERT INTO `cms_news_type` VALUES ('2', '0', '国际新闻', '20180619\\5c49f9927e1bf8950ade190b592d6c68.jpg', '20', '1', '2018-06-19 17:24:16');
INSERT INTO `cms_news_type` VALUES ('3', '0', '国内新闻', '20180620\\26f96604ecd2302252da26b578a36621.jpg', '10', '1', '2018-06-20 10:23:38');
INSERT INTO `cms_news_type` VALUES ('5', '3', '济南早知道', '20180621\\b7b28c986681abff3383c0139ac91a1f.jpg', '11', '1', '2018-06-21 10:14:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of cms_rule
-- ----------------------------
INSERT INTO `cms_rule` VALUES ('1', '0', 'admin/Auth', '权限管理', '1', '1', '', '权限管理', '1', 'icon-lock', 'Auth', '', '1');
INSERT INTO `cms_rule` VALUES ('2', '1', 'admin/Auth/rule_index', '规则总览', '1', '1', '', '权限管理', '1', '', 'Auth', 'rule_index', '0');
INSERT INTO `cms_rule` VALUES ('3', '1', 'admin/Auth/add_rule', '添加规则', '1', '1', '', '权限管理', '2', '', 'Auth', 'add_rule', '0');
INSERT INTO `cms_rule` VALUES ('4', '1', 'admin/Auth/editor_rule', '编辑规则', '1', '1', '', '权限管理', '2', '', 'Auth', 'editor_rule', '0');
INSERT INTO `cms_rule` VALUES ('5', '1', 'admin/Auth/del_rule', '删除规则', '1', '1', '', '权限管理', '2', '', 'Auth', 'del_rule', '0');
INSERT INTO `cms_rule` VALUES ('6', '1', 'admin/Auth/group_index', '权限组总览', '1', '1', '', '权限管理', '1', '', 'Auth', 'group_index', '0');
INSERT INTO `cms_rule` VALUES ('7', '1', 'admin/Auth/add_group', '添加权限组', '1', '1', '', '权限管理', '2', '', 'Auth', 'add_group', '0');
INSERT INTO `cms_rule` VALUES ('8', '1', 'admin/Auth/editor_group', '编辑权限组', '1', '1', '', '权限管理', '2', '', 'Auth', 'editor_group', '0');
INSERT INTO `cms_rule` VALUES ('9', '1', 'admin/Auth/del_group', '删除权限组', '1', '1', '', '权限管理', '2', '', 'Auth', 'del_group', '0');
INSERT INTO `cms_rule` VALUES ('10', '0', 'admin/Admin', '管理员管理', '1', '1', '', '管理员管理', '1', 'icon-group', 'Admin', '', '11');
INSERT INTO `cms_rule` VALUES ('11', '10', 'admin/Admin/admin_index', '用户总览', '1', '1', '', '管理员管理', '1', '', 'Admin', 'admin_index', '0');
INSERT INTO `cms_rule` VALUES ('12', '10', 'admin/Admin/add_admin', '添加用户', '1', '1', '', '管理员管理', '2', '', 'Admin', 'add_admin', '0');
INSERT INTO `cms_rule` VALUES ('13', '10', 'admin/Admin/editor_admin', '编辑用户', '1', '1', '', '管理员管理', '2', '', 'Admin', 'editor_admin', '0');
INSERT INTO `cms_rule` VALUES ('14', '10', 'admin/Admin/del_admin', '删除用户', '1', '1', '', '管理员管理', '2', '', 'Admin', 'del_admin', '0');
INSERT INTO `cms_rule` VALUES ('15', '10', 'admin/Admin/my', '个人中心', '1', '1', '', '管理员管理', '1', '', 'Admin', 'my', '0');
INSERT INTO `cms_rule` VALUES ('16', '10', 'admin/Admin/editor_my', '编辑个人信息', '1', '1', '', '管理员管理', '2', '', 'Admin', 'editor_my', '0');
INSERT INTO `cms_rule` VALUES ('17', '0', 'admin/System', '系统管理', '1', '1', '', '系统管理', '1', 'icon-cogs', 'System', '', '22');
INSERT INTO `cms_rule` VALUES ('18', '17', 'admin/System/config', '系统配置', '1', '1', '', '系统管理', '1', '', 'System', 'config', '0');
INSERT INTO `cms_rule` VALUES ('19', '0', 'admin/Database', '数据库管理', '1', '1', '', '数据库管理', '1', 'icon-folder-close', 'Database', '', '33');
INSERT INTO `cms_rule` VALUES ('20', '19', 'admin/Database/database', '数据库列表', '1', '1', '', '数据库管理', '1', '', 'Database', 'database', '0');
INSERT INTO `cms_rule` VALUES ('21', '19', 'admin/Database/backups', '数据备份', '1', '1', '', '数据库管理', '2', '', 'Database', 'backups', '0');
INSERT INTO `cms_rule` VALUES ('22', '19', 'admin/Database/reduction', '备份列表', '1', '1', '', '数据库管理', '1', '', 'Database', 'reduction', '0');
INSERT INTO `cms_rule` VALUES ('23', '19', 'admin/Database/restore', '数据还原', '1', '1', '', '数据库管理', '2', '', 'Database', 'restore', '0');
INSERT INTO `cms_rule` VALUES ('24', '19', 'admin/Database/delete_database', '删除备份', '1', '1', '', '数据库管理', '2', '', 'Database', 'delete_database', '0');
INSERT INTO `cms_rule` VALUES ('25', '17', 'admin/System/logs', '日志管理', '1', '1', '', '系统管理', '1', '', 'System', 'logs', '0');
INSERT INTO `cms_rule` VALUES ('26', '17', 'admin/System/clearLogs', '清空日志', '1', '1', '', '系统管理', '2', '', 'System', 'clearLogs', '0');
INSERT INTO `cms_rule` VALUES ('27', '0', 'admin/News', '资讯管理', '1', '1', '', '资讯管理', '1', 'icon-globe', 'News', '', '44');
INSERT INTO `cms_rule` VALUES ('28', '27', 'admin/News/news_type', '资讯分类', '1', '1', '', '资讯管理', '1', '', 'News', 'news_type', '0');
INSERT INTO `cms_rule` VALUES ('29', '27', 'admin/News/add_newstype', '添加分类', '1', '1', '', '资讯管理', '2', '', 'News', 'add_newstype', '0');
INSERT INTO `cms_rule` VALUES ('30', '27', 'admin/News/editor_newstype', '编辑分类', '1', '1', '', '资讯管理', '2', '', 'News', 'editor_newstype', '0');
INSERT INTO `cms_rule` VALUES ('31', '27', 'admin/News/del_newstype', '删除分类', '1', '1', '', '资讯管理', '2', '', 'News', 'del_newstype', '0');
INSERT INTO `cms_rule` VALUES ('32', '27', 'admin/News/news', '资讯列表', '1', '1', '', '资讯管理', '1', '', 'News', 'news', '0');
INSERT INTO `cms_rule` VALUES ('33', '27', 'admin/News/add_news', '添加资讯', '1', '1', '', '资讯管理', '2', '', 'News', 'add_news', '0');
INSERT INTO `cms_rule` VALUES ('34', '27', 'admin/News/editor_news', '编辑资讯', '1', '1', '', '资讯管理', '2', '', 'News', 'editor_news', '0');
INSERT INTO `cms_rule` VALUES ('35', '27', 'admin/News/del_news', '删除资讯', '1', '1', '', '资讯管理', '2', '', 'News', 'del_news', '0');
INSERT INTO `cms_rule` VALUES ('36', '0', 'admin/Comment', '评论管理', '1', '1', '', '评论管理', '2', 'icon-comments	', 'Comment', '', '55');
INSERT INTO `cms_rule` VALUES ('37', '36', 'admin/Comment/comment', '评论列表', '1', '1', '', '评论管理', '2', '', 'Comment', 'comment', '0');
INSERT INTO `cms_rule` VALUES ('38', '36', 'admin/Comment/editor_comment', '编辑评论', '1', '1', '', '评论管理', '2', '', 'Comment', 'editor_comment', '0');
INSERT INTO `cms_rule` VALUES ('39', '36', 'admin/Comment/del_comment', '删除评论', '1', '1', '', '评论管理', '2', '', 'Comment', 'del_comment', '0');
INSERT INTO `cms_rule` VALUES ('40', '36', 'admin/Comment/check_state', '审核评论', '1', '1', '', '评论管理', '2', '', 'Comment', 'check_state', '0');
INSERT INTO `cms_rule` VALUES ('41', '0', 'admin/Users', '用户管理', '1', '1', '', '用户管理', '1', 'icon-user', 'Users', '', '55');
INSERT INTO `cms_rule` VALUES ('42', '41', 'admin/Users/users_index', '用户列表', '1', '1', '', '用户管理', '1', '', 'Users', 'users_index', '0');
INSERT INTO `cms_rule` VALUES ('43', '41', 'admin/Users/editor_user', '编辑用户', '1', '1', '', '用户管理', '2', '', 'Users', 'editor_user', '0');
INSERT INTO `cms_rule` VALUES ('44', '41', 'admin/Users/del_user', '删除用户', '1', '1', '', '用户管理', '2', '', 'Users', 'del_user', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统表';

-- ----------------------------
-- Records of cms_system
-- ----------------------------
INSERT INTO `cms_system` VALUES ('1', '模块化后台管理系统', '1', 'http://127.0.0.5', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cms_users
-- ----------------------------
INSERT INTO `cms_users` VALUES ('1', '阁下贵姓', '123', '10', '18100386352', '417626953@qq.com', '济南天桥区', '417626953', 'lqm_956', '20180621\\d2bc5d6acfd1bcf54b97017f2c13d1f3.jpg', '2018-06-21 11:54:52', '1');
