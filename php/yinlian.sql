/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yinlian

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-10-20 19:53:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastloginip` varchar(30) DEFAULT NULL,
  `lastlogintime` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `class_categories`
-- ----------------------------
DROP TABLE IF EXISTS `class_categories`;
CREATE TABLE `class_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '培训类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='培训类目表';

-- ----------------------------
-- Records of class_categories
-- ----------------------------
INSERT INTO `class_categories` VALUES ('1', '云闪付介绍');
INSERT INTO `class_categories` VALUES ('2', '云闪付教程');
INSERT INTO `class_categories` VALUES ('3', 'ApplePay教程');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '课程名称',
  `headimg` varchar(255) NOT NULL COMMENT '课程首图',
  `describe` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `class_id` int(11) NOT NULL COMMENT '课程分类id',
  `class_type` tinyint(1) NOT NULL COMMENT '培训课程类型  0视频 1文章',
  `media_url` varchar(255) DEFAULT NULL COMMENT '培训视频链接',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  -1删除 0 正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='培训课程信息表';

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `course_answer`
-- ----------------------------
DROP TABLE IF EXISTS `course_answer`;
CREATE TABLE `course_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer` text NOT NULL COMMENT '用户回答',
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  -1删除 0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='课程提问回答表';

-- ----------------------------
-- Records of course_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `course_content`
-- ----------------------------
DROP TABLE IF EXISTS `course_content`;
CREATE TABLE `course_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `content` mediumtext NOT NULL COMMENT '课程内容',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章状态 -1删除 0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='培训课程内容表';

-- ----------------------------
-- Records of course_content
-- ----------------------------

-- ----------------------------
-- Table structure for `course_question`
-- ----------------------------
DROP TABLE IF EXISTS `course_question`;
CREATE TABLE `course_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `question` varchar(255) NOT NULL COMMENT '问题',
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  -1删除  0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='课程提问表';

-- ----------------------------
-- Records of course_question
-- ----------------------------

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '' COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------

-- ----------------------------
-- Table structure for `t2`
-- ----------------------------
DROP TABLE IF EXISTS `t2`;
CREATE TABLE `t2` (
  `id` int(11) NOT NULL,
  `gid` char(1) DEFAULT NULL,
  `col1` int(11) DEFAULT NULL,
  `col2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t2
-- ----------------------------
INSERT INTO `t2` VALUES ('1', 'A', '31', '6');
INSERT INTO `t2` VALUES ('2', 'B', '25', '83');
INSERT INTO `t2` VALUES ('3', 'C', '76', '21');
INSERT INTO `t2` VALUES ('4', 'D', '63', '56');
INSERT INTO `t2` VALUES ('5', 'E', '3', '17');
INSERT INTO `t2` VALUES ('6', 'A', '29', '97');
INSERT INTO `t2` VALUES ('7', 'B', '88', '63');
INSERT INTO `t2` VALUES ('8', 'C', '16', '22');
INSERT INTO `t2` VALUES ('9', 'D', '25', '43');
INSERT INTO `t2` VALUES ('10', 'E', '45', '28');
INSERT INTO `t2` VALUES ('11', 'A', '2', '78');
INSERT INTO `t2` VALUES ('12', 'B', '30', '79');
INSERT INTO `t2` VALUES ('13', 'C', '96', '73');
INSERT INTO `t2` VALUES ('14', 'D', '37', '40');
INSERT INTO `t2` VALUES ('15', 'E', '14', '86');
INSERT INTO `t2` VALUES ('16', 'A', '32', '67');
INSERT INTO `t2` VALUES ('17', 'B', '84', '38');
INSERT INTO `t2` VALUES ('18', 'C', '27', '9');
INSERT INTO `t2` VALUES ('19', 'D', '31', '21');
INSERT INTO `t2` VALUES ('20', 'E', '80', '63');
INSERT INTO `t2` VALUES ('21', 'A', '89', '9');
INSERT INTO `t2` VALUES ('22', 'B', '15', '22');
INSERT INTO `t2` VALUES ('23', 'C', '46', '84');
INSERT INTO `t2` VALUES ('24', 'D', '54', '79');
INSERT INTO `t2` VALUES ('25', 'E', '85', '64');
INSERT INTO `t2` VALUES ('26', 'A', '87', '13');
INSERT INTO `t2` VALUES ('27', 'B', '40', '45');
INSERT INTO `t2` VALUES ('28', 'C', '34', '90');
INSERT INTO `t2` VALUES ('29', 'D', '63', '8');
INSERT INTO `t2` VALUES ('30', 'E', '66', '40');
INSERT INTO `t2` VALUES ('31', 'A', '83', '49');
INSERT INTO `t2` VALUES ('32', 'B', '4', '90');
INSERT INTO `t2` VALUES ('33', 'C', '81', '7');
INSERT INTO `t2` VALUES ('34', 'D', '11', '12');
INSERT INTO `t2` VALUES ('35', 'E', '85', '10');
INSERT INTO `t2` VALUES ('36', 'A', '39', '75');
INSERT INTO `t2` VALUES ('37', 'B', '22', '39');
INSERT INTO `t2` VALUES ('38', 'C', '76', '67');
INSERT INTO `t2` VALUES ('39', 'D', '20', '11');
INSERT INTO `t2` VALUES ('40', 'E', '81', '36');

-- ----------------------------
-- Table structure for `test_choice`
-- ----------------------------
DROP TABLE IF EXISTS `test_choice`;
CREATE TABLE `test_choice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `choice_a` varchar(255) NOT NULL,
  `choice_b` varchar(255) NOT NULL,
  `choice_c` varchar(255) DEFAULT NULL,
  `choice_d` varchar(255) DEFAULT NULL,
  `answer` text NOT NULL COMMENT '答案',
  `class_id` int(11) unsigned NOT NULL COMMENT '课程id',
  `question_type` tinyint(1) unsigned NOT NULL COMMENT '题目类型  -1 单选 -2多选',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标识状态  -1删除 0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='选择题题库';

-- ----------------------------
-- Records of test_choice
-- ----------------------------

-- ----------------------------
-- Table structure for `test_config`
-- ----------------------------
DROP TABLE IF EXISTS `test_config`;
CREATE TABLE `test_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL COMMENT '课程id',
  `judge_num` smallint(6) DEFAULT NULL COMMENT '判断题数量',
  `judge_score` smallint(6) DEFAULT NULL COMMENT '判断题分值',
  `radio_choice_num` smallint(6) DEFAULT NULL COMMENT '单选题数量',
  `radio_choice_score` smallint(6) DEFAULT NULL COMMENT '单选题分值',
  `multi_choice_num` smallint(6) DEFAULT NULL COMMENT '多选题数量',
  `multi_choice_score` smallint(6) DEFAULT NULL COMMENT '多选题分值',
  `test_expire` datetime DEFAULT NULL COMMENT '考试时长',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标识状态  -1删除  0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='试题设置';

-- ----------------------------
-- Records of test_config
-- ----------------------------

-- ----------------------------
-- Table structure for `test_judgement`
-- ----------------------------
DROP TABLE IF EXISTS `test_judgement`;
CREATE TABLE `test_judgement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` tinyint(1) NOT NULL COMMENT '答案  1 对 0 错',
  `class_id` int(11) NOT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '标识状态  -1删除 0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='判断题题库';

-- ----------------------------
-- Records of test_judgement
-- ----------------------------

-- ----------------------------
-- Table structure for `test_score`
-- ----------------------------
DROP TABLE IF EXISTS `test_score`;
CREATE TABLE `test_score` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `class_id` int(11) NOT NULL COMMENT '培训类目id',
  `score` smallint(4) NOT NULL COMMENT '得分',
  `create_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='考试得分表';

-- ----------------------------
-- Records of test_score
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `unit` text NOT NULL COMMENT '工作单位',
  `identity_card` char(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `credit_card` varchar(20) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `points` int(11) NOT NULL COMMENT '用户积分',
  `certificate` smallint(5) unsigned NOT NULL COMMENT '证书级别  1 初级 2中级 3高级',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '',
  `open_id` varchar(64) NOT NULL COMMENT '小程序open_id',
  `union_id` varchar(64) NOT NULL COMMENT '微信union_id',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_study_record`
-- ----------------------------
DROP TABLE IF EXISTS `user_study_record`;
CREATE TABLE `user_study_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户学习记录表';

-- ----------------------------
-- Records of user_study_record
-- ----------------------------

-- ----------------------------
-- Table structure for `user_token`
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of user_token
-- ----------------------------
