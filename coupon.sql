/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : coupon

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-08 10:26:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `click_info`
-- ----------------------------
DROP TABLE IF EXISTS `click_info`;
CREATE TABLE `click_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0官方 1个人 2企业等组织',
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of click_info
-- ----------------------------
INSERT INTO `click_info` VALUES ('292', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470383279792');
INSERT INTO `click_info` VALUES ('293', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470383341447');
INSERT INTO `click_info` VALUES ('294', '1002aw', '1', '192.168.0.125', 'Firefox/47.0', '1470383418466');
INSERT INTO `click_info` VALUES ('295', '1002aw', '1', '192.168.0.125', 'Firefox/47.0', '1470383431651');
INSERT INTO `click_info` VALUES ('296', 'vwZLr3', '1', '192.168.0.125', 'Firefox/47.0', '1470383576169');
INSERT INTO `click_info` VALUES ('297', '1006wd', '1', '192.168.0.125', 'Safari/537.36', '1470386671886');
INSERT INTO `click_info` VALUES ('298', '1006wd', '1', '192.168.0.125', 'Safari/537.36', '1470386702961');
INSERT INTO `click_info` VALUES ('299', '1006wd', '1', '192.168.0.125', 'Safari/537.36', '1470387142829');
INSERT INTO `click_info` VALUES ('300', '10061awd', '0', '192.168.0.125', 'Firefox/47.0', '1470388796349');
INSERT INTO `click_info` VALUES ('301', '10061a', '1', '192.168.0.125', 'Firefox/47.0', '1470388841962');
INSERT INTO `click_info` VALUES ('302', '100awd', '1', '192.168.0.125', 'Firefox/47.0', '1470389130785');
INSERT INTO `click_info` VALUES ('303', '100awd', '1', '192.168.0.125', 'Firefox/47.0', '1470389158683');
INSERT INTO `click_info` VALUES ('304', '100awd', '1', '192.168.0.125', 'Firefox/47.0', '1470389201705');
INSERT INTO `click_info` VALUES ('305', '10061a', '1', '192.168.0.125', 'Safari/537.36', '1470389761908');
INSERT INTO `click_info` VALUES ('306', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470389847484');
INSERT INTO `click_info` VALUES ('307', '1002awd', '2', '192.168.0.125', 'Safari/537.36', '1470389907326');
INSERT INTO `click_info` VALUES ('308', '1002awd', '2', '192.168.0.125', 'Safari/537.36', '1470389975997');
INSERT INTO `click_info` VALUES ('309', 'ssss1112', '0', '192.168.0.114', 'Firefox/47.0', '1470491238680');
INSERT INTO `click_info` VALUES ('310', 'ssss15', '1', '192.168.0.114', 'Firefox/47.0', '1470491264734');
INSERT INTO `click_info` VALUES ('311', '1002awd', '2', '192.168.0.114', 'Firefox/47.0', '1470539252818');
INSERT INTO `click_info` VALUES ('312', '1002awd', '2', '192.168.0.114', 'Firefox/47.0', '1470539311552');
INSERT INTO `click_info` VALUES ('313', '1002awd', '2', '192.168.0.111', 'Firefox/47.0', '1470582013577');
INSERT INTO `click_info` VALUES ('314', '100sswr', '2', '192.168.0.111', 'Firefox/47.0', '1470582688498');
INSERT INTO `click_info` VALUES ('315', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', '1470618080590');
INSERT INTO `click_info` VALUES ('316', '111111qq', '0', '192.168.0.125', 'Safari/537.36', '1470618882419');

-- ----------------------------
-- Table structure for `coupon_activity`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_activity`;
CREATE TABLE `coupon_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT '活动编号 8位数',
  `title` varchar(255) NOT NULL COMMENT '活动主题',
  `des` text COMMENT '活动内容',
  `num` int(11) DEFAULT NULL COMMENT '给券的数量',
  `total_limit` int(11) DEFAULT NULL COMMENT '总共允许发多少优惠券',
  `sended` int(11) DEFAULT NULL COMMENT '已经发出的优惠券数量',
  `starttime` bigint(20) DEFAULT NULL COMMENT '活动开始时间',
  `endtime` bigint(20) DEFAULT NULL COMMENT '活动结束时间',
  `created` bigint(20) DEFAULT NULL COMMENT '活动注册时间',
  `updated` bigint(20) DEFAULT NULL COMMENT '活动更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_activity
-- ----------------------------
INSERT INTO `coupon_activity` VALUES ('125', 'ssss1111', '安德森', '撒', '1', '1111', '0', '1471968000000', '1472140800000', '1470490504486', '0');
INSERT INTO `coupon_activity` VALUES ('126', 'ssss1112', '安德森啊啊', '撒', '1', '1111', '0', '1470153600000', '1472140800000', '1470491224768', '0');
INSERT INTO `coupon_activity` VALUES ('127', '111111qq', 'da', 'ewa', '22', '2222', '0', '1470153600000', '1471449600000', '1470618065143', '0');

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT '7位 相当于邀请码',
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo保存的是一个网页，网页里是个图片',
  `des` text COMMENT '介绍',
  `num` int(11) NOT NULL COMMENT '每个人可以领取的数量',
  `total_limit` int(11) NOT NULL COMMENT '总共优惠券数量',
  `sended` int(11) DEFAULT '0' COMMENT '已经送出去的优惠券数量',
  `starttime` bigint(20) DEFAULT NULL COMMENT '活动开始时间',
  `endtime` bigint(20) DEFAULT NULL COMMENT '活动结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '1000awd', '小火堆', null, 'ss', '5', '1000', '22', null, null);
INSERT INTO `organization` VALUES ('2', '1001awd', '代码牛', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470319450439', '代码牛', '9', '2000', '0', '0', '0');
INSERT INTO `organization` VALUES ('3', '1003awd', '滴滴打车', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470306237858', '嘀嘀嘀', '4', '500', '0', '0', '0');
INSERT INTO `organization` VALUES ('4', '1002awd', '优步', null, '大大大', '4', '800', '28', '1470240000000', '1471968000000');
INSERT INTO `organization` VALUES ('6', '1004awd', '小小火堆', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470360570232', '小小火堆', '2', '5000', '0', '0', '0');
INSERT INTO `organization` VALUES ('7', '100sswr', 'dasf', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470582040038', 'asdf', '2', '111', '0', '1470240000000', '1472227200000');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0为官方 1为个人',
  `phone` varchar(255) NOT NULL,
  `created` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('1', 'acsyws', '1', '15757175891', '20160721131308');
INSERT INTO `share` VALUES ('2', 'acsyws', '1', '15757174551', '20160721131308');
INSERT INTO `share` VALUES ('7', '10000000', '0', '15555550000', '20160724162047');
INSERT INTO `share` VALUES ('8', '10000000', '0', '12322220111', '20160725141459');
INSERT INTO `share` VALUES ('9', '10000010', '0', '15757174000', '20160728102728');
INSERT INTO `share` VALUES ('10', 'acsyws', '1', '15757171111', '20160728162620');
INSERT INTO `share` VALUES ('11', 'acsyws', '1', '15757157112', '20160729170819');
INSERT INTO `share` VALUES ('12', 'acsyws', '1', '15757175890', '20160729170924');
INSERT INTO `share` VALUES ('16', '10000010', '0', '15757175892', '20160802140648');
INSERT INTO `share` VALUES ('19', '1000awd', '2', '15757175893', '1470217214189');
INSERT INTO `share` VALUES ('31', '10000015', '0', '15757175895', '1470217214189');
INSERT INTO `share` VALUES ('32', '1000awd', '2', '15757175896', '1470217256997');
INSERT INTO `share` VALUES ('33', '1000awd', '2', '15757175897', '1470217444521');
INSERT INTO `share` VALUES ('34', '1000awd', '2', '15757175898', '1470217456833');
INSERT INTO `share` VALUES ('35', '10061awd', '0', '13888888288', '1470360525207');
INSERT INTO `share` VALUES ('36', '1002awd', '2', '15757175899', '1470360624998');
INSERT INTO `share` VALUES ('37', '1002awd', '2', '15757175810', '1470360798703');
INSERT INTO `share` VALUES ('38', '1002awd', '2', '15115144444', '1470367088101');
INSERT INTO `share` VALUES ('39', '1002awd', '2', '15757174441', '1470370535121');
INSERT INTO `share` VALUES ('40', '1002awd', '2', '15757174442', '1470370702646');
INSERT INTO `share` VALUES ('42', '1006wd', '1', '15757175960', '1470387200579');
INSERT INTO `share` VALUES ('43', '1006wd', '1', '15757175961', '1470387343413');
INSERT INTO `share` VALUES ('44', '10061a', '1', '15757175963', '1470388903247');
INSERT INTO `share` VALUES ('45', '100awd', '1', '15757175965', '1470389215197');
INSERT INTO `share` VALUES ('46', 'ssss15', '1', '15757176049', '1470491286984');
INSERT INTO `share` VALUES ('47', '1002awd', '2', '15757817512', '1470539323108');
INSERT INTO `share` VALUES ('48', '1002awd', '2', '15757175555', '1470582699041');
