/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : coupon

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-05 13:08:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', 'root');

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
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of click_info
-- ----------------------------
INSERT INTO `click_info` VALUES ('1', '10000000', '0', '192.1.1', '火狐', '20160721114814');
INSERT INTO `click_info` VALUES ('2', 'acsyws', '1', '192.1.168', '猎豹', '20160721114815');
INSERT INTO `click_info` VALUES ('3', '10000000', '0', '192.1.20', 'IE', '20160721114815');
INSERT INTO `click_info` VALUES ('4', '10000000', '0', '192.1.167', '谷歌', '20160721114815');
INSERT INTO `click_info` VALUES ('5', '10000000', '0', '192.1.1', '火狐', '20160721134856');
INSERT INTO `click_info` VALUES ('6', 'acsyws', '1', '192.1.168', '猎豹', '20160721134857');
INSERT INTO `click_info` VALUES ('7', '10000000', '0', '192.1.204', 'IE', '20160721134857');
INSERT INTO `click_info` VALUES ('8', 'acsyws', '1', '192.1.167', '谷歌', '20160721134857');
INSERT INTO `click_info` VALUES ('9', '10000000', '0', '192.1.158', '火狐', '20160721144710');
INSERT INTO `click_info` VALUES ('10', 'acsyws', '1', '192.1.168', '猎豹', '20160721144710');
INSERT INTO `click_info` VALUES ('11', '10000000', '0', '192.1.204', 'IE', '20160721144710');
INSERT INTO `click_info` VALUES ('12', 'acsyws', '1', '192.1.167', '谷歌', '20160721144710');
INSERT INTO `click_info` VALUES ('13', '10000000', '0', '192.1.155', '火狐', '20160721150110');
INSERT INTO `click_info` VALUES ('14', 'acsyws', '1', '192.1.168', '猎豹', '20160721150110');
INSERT INTO `click_info` VALUES ('15', '10000000', '0', '192.1.205', 'IE', '20160721150110');
INSERT INTO `click_info` VALUES ('16', 'acsyws', '1', '192.1.167', '谷歌', '20160721150110');
INSERT INTO `click_info` VALUES ('17', '10000000', '0', '192.1.144', '火狐', '20160721150154');
INSERT INTO `click_info` VALUES ('18', 'acsyws', '1', '192.1.168', '猎豹', '20160721150154');
INSERT INTO `click_info` VALUES ('19', '10000000', '0', '192.1.205', 'IE', '20160721150154');
INSERT INTO `click_info` VALUES ('20', 'acsyws', '1', '192.1.167', '谷歌', '20160721150154');
INSERT INTO `click_info` VALUES ('21', '10000000', '0', '192.1.101', '火狐', '20160721151607');
INSERT INTO `click_info` VALUES ('22', 'acsyws', '1', '192.1.168', '猎豹', '20160721151607');
INSERT INTO `click_info` VALUES ('158', '10000013', '0', '192.168.0.102', 'Firefox/47.0', '20160801233204');
INSERT INTO `click_info` VALUES ('159', '10000010', '0', '192.168.0.103', 'Firefox/47.0', '20160801233211');
INSERT INTO `click_info` VALUES ('160', '10000012', '0', '192.168.0.104', 'Firefox/47.0', '20160801233240');
INSERT INTO `click_info` VALUES ('161', '10000012', '0', '192.168.0.106', 'Firefox/47.0', '20160801233322');
INSERT INTO `click_info` VALUES ('162', '10000012', '0', '192.168.0.108', 'Firefox/47.0', '20160801233426');
INSERT INTO `click_info` VALUES ('163', '10000013', '0', '192.168.0.109', 'Firefox/47.0', '20160801234420');
INSERT INTO `click_info` VALUES ('164', '10000013', '0', '192.168.0.101', 'Firefox/47.0', '20160801234904');
INSERT INTO `click_info` VALUES ('165', '10000010', '0', '192.168.0.125', 'Firefox/47.0', '20160802135719');
INSERT INTO `click_info` VALUES ('166', '10000010', '0', '192.168.0.125', 'Firefox/47.0', '20160802140210');
INSERT INTO `click_info` VALUES ('167', '10000010', '0', '192.168.0.125', 'Firefox/47.0', '20160802140631');
INSERT INTO `click_info` VALUES ('168', '10000013', '0', '192.168.0.125', 'Firefox/47.0', '20160802140955');
INSERT INTO `click_info` VALUES ('169', '10000010', '0', '192.168.0.125', 'Firefox/47.0', '20160802141337');
INSERT INTO `click_info` VALUES ('170', '10000010', '0', '192.168.0.125', 'Firefox/47.0', '20160802141501');
INSERT INTO `click_info` VALUES ('171', '10000013', '0', '192.168.0.125', 'Firefox/47.0', '20160802141909');
INSERT INTO `click_info` VALUES ('173', 'acsyws', '1', '192.168.0.125', 'Firefox/47.0', '20160802141943');
INSERT INTO `click_info` VALUES ('174', 'acsyws', '1', '192.168.0.125', 'Firefox/47.0', '20160802142257');
INSERT INTO `click_info` VALUES ('175', 'acsyws', '1', '192.168.0.125', 'Firefox/47.0', '20160802142346');
INSERT INTO `click_info` VALUES ('176', 'acsyws', '1', '192.168.0.125', 'Firefox/47.0', '20160802142408');
INSERT INTO `click_info` VALUES ('177', 'acsyws', '1', '192.168.0.125', 'Firefox/47.0', '20160802142505');
INSERT INTO `click_info` VALUES ('204', '10000011', '0', '192.168.0.125', 'Android', '20160802144913');
INSERT INTO `click_info` VALUES ('210', '10000011', '0', '192.168.0.125', 'Android', '20160802145147');
INSERT INTO `click_info` VALUES ('212', '10000011', '0', '192.168.0.125', 'Android', '20160802145640');
INSERT INTO `click_info` VALUES ('213', '10000013', '0', '192.168.0.125', 'Android', '20160802145704');
INSERT INTO `click_info` VALUES ('218', '10000013', '0', '192.168.0.125', 'Android', '20160802145722');
INSERT INTO `click_info` VALUES ('220', '10000013', '0', '192.168.0.125', 'Firefox/47.0', '20160802150533');
INSERT INTO `click_info` VALUES ('221', '10000011', '0', '192.168.0.125', 'Android', '20160802151530');
INSERT INTO `click_info` VALUES ('222', '10000011', '0', '192.168.0.125', 'Android', '20160802152046');
INSERT INTO `click_info` VALUES ('223', '10000011', '0', '192.168.0.125', 'Android', '20160802152058');
INSERT INTO `click_info` VALUES ('224', '10000011', '0', '192.168.0.125', 'Android', '20160802152256');
INSERT INTO `click_info` VALUES ('225', '10000011', '0', '192.168.0.125', 'Android', '20160802152318');
INSERT INTO `click_info` VALUES ('226', '10000011', '0', '192.168.0.125', 'Android', '20160802152346');
INSERT INTO `click_info` VALUES ('227', '10000011', '0', '192.168.0.125', 'Android', '20160802152350');
INSERT INTO `click_info` VALUES ('228', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802152636');
INSERT INTO `click_info` VALUES ('229', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802153554');
INSERT INTO `click_info` VALUES ('230', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802153558');
INSERT INTO `click_info` VALUES ('234', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802153922');
INSERT INTO `click_info` VALUES ('235', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802153934');
INSERT INTO `click_info` VALUES ('236', '10000012', '0', '192.168.0.125', 'Safari/537.36', '20160802153953');
INSERT INTO `click_info` VALUES ('252', '10000014', '0', '192.168.0.125', 'Firefox/47.0', '20160802164626');
INSERT INTO `click_info` VALUES ('253', '10000014', '0', '192.168.0.125', 'Safari/537.36', '20160802164637');
INSERT INTO `click_info` VALUES ('265', '1000awd', '2', '192.168.0.125', 'Firefox/47.0', '1470217705131');
INSERT INTO `click_info` VALUES ('266', '10000015', '0', '192.168.0.125', 'Firefox/47.0', '1470219080858');
INSERT INTO `click_info` VALUES ('267', '10000015', '0', '192.168.0.125', 'Firefox/47.0', '1470219122782');
INSERT INTO `click_info` VALUES ('268', '10000015', '0', '192.168.0.125', 'Firefox/47.0', '1470219129776');
INSERT INTO `click_info` VALUES ('269', '10000016', '0', '192.168.0.125', 'Firefox/47.0', '1470219400690');
INSERT INTO `click_info` VALUES ('270', '10000016', '0', '192.168.0.100', 'Firefox/47.0', '1470235888872');
INSERT INTO `click_info` VALUES ('271', '10000016', '0', '192.168.0.100', 'Safari/537.36', '1470235910398');
INSERT INTO `click_info` VALUES ('272', '10000016', '0', '192.168.0.100', 'Safari/537.36', '1470237270171');
INSERT INTO `click_info` VALUES ('273', '10061awd', '0', '192.168.0.125', 'Firefox/47.0', '1470360447133');
INSERT INTO `click_info` VALUES ('274', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470360617595');
INSERT INTO `click_info` VALUES ('275', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470360787437');
INSERT INTO `click_info` VALUES ('276', '10061awd', '0', '192.168.0.125', 'Firefox/47.0', '1470361263068');
INSERT INTO `click_info` VALUES ('277', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470361284952');
INSERT INTO `click_info` VALUES ('278', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362146696');
INSERT INTO `click_info` VALUES ('279', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362176277');
INSERT INTO `click_info` VALUES ('280', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362181132');
INSERT INTO `click_info` VALUES ('281', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362189536');
INSERT INTO `click_info` VALUES ('282', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362233547');
INSERT INTO `click_info` VALUES ('283', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362388295');
INSERT INTO `click_info` VALUES ('284', '10061awd', '0', '192.168.0.125', 'Safari/537.36', '1470362502370');
INSERT INTO `click_info` VALUES ('285', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470365671919');
INSERT INTO `click_info` VALUES ('286', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470367073222');
INSERT INTO `click_info` VALUES ('287', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470368706834');
INSERT INTO `click_info` VALUES ('288', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470368805034');
INSERT INTO `click_info` VALUES ('289', '1002awd', '2', '192.168.0.125', 'Safari/537.36', '1470368823450');
INSERT INTO `click_info` VALUES ('290', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', '1470368910738');
INSERT INTO `click_info` VALUES ('291', '1002awd', '2', '192.168.0.125', 'Safari/537.36', '1470368923180');

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_activity
-- ----------------------------
INSERT INTO `coupon_activity` VALUES ('103', '10000000', '代码牛分享活动', '分享可得50红包', '4', null, null, null, null, '20160707000000', null);
INSERT INTO `coupon_activity` VALUES ('104', '10000001', '微信红包', '分享即可得到10块红包', '3', null, null, null, null, '20160707000000', null);
INSERT INTO `coupon_activity` VALUES ('105', '10000002', '饿了吗分享红包', '分享就给抽奖', '2', null, null, null, null, '20160707000000', null);
INSERT INTO `coupon_activity` VALUES ('106', '10000003', '吃饭优惠活动', '吃饭便宜1000快', '5', null, null, null, null, '20160726175854', null);
INSERT INTO `coupon_activity` VALUES ('111', '10000004', '喝饮料送钱', '送你一百块', '2', null, null, null, null, '20160726182541', '20160727170635');
INSERT INTO `coupon_activity` VALUES ('112', '10000005', 'sdaf', 'asdfasdfasf', '4', null, null, null, null, '20160726183146', null);
INSERT INTO `coupon_activity` VALUES ('113', '10000006', '苏打粉', '撒旦法违法挖', '2', null, null, null, null, '20160726183457', null);
INSERT INTO `coupon_activity` VALUES ('114', '10000007', 'dsaf', 'dafasfa', '3', null, null, null, null, '20160726184048', null);
INSERT INTO `coupon_activity` VALUES ('115', '10000008', '撒啊', '啊啊啊啊啊啊', '4', null, null, null, null, '20160726213439', null);
INSERT INTO `coupon_activity` VALUES ('116', '10000009', '活动一号', '活动一号活动一号活动一号', '5', null, null, null, null, '20160728103012', null);
INSERT INTO `coupon_activity` VALUES ('117', '10000010', '活动二号', '活动二号活动二号活动二号究极进化', '5', null, null, null, null, '20160728103302', '20160728103603');
INSERT INTO `coupon_activity` VALUES ('118', '10000011', '优酷优惠券', '苏打粉', '6', null, null, null, null, '20160729181317', '20160729184310');
INSERT INTO `coupon_activity` VALUES ('119', '10000012', 'adsfsda', '倒萨发达省份多少啊发生的 大神', '7', null, null, null, null, '20160801101920', null);
INSERT INTO `coupon_activity` VALUES ('120', '10000013', '打的萨撒撒旦发生的盛大', '阿朵抒发抒发抒发司法所大厦法定身份撒旦多少啊', '8', null, null, null, null, '20160801224103', null);
INSERT INTO `coupon_activity` VALUES ('121', '10000014', '饿了吗红包', '点击就送10000000', '5', null, null, null, null, '20160802154932', '20160802154951');
INSERT INTO `coupon_activity` VALUES ('122', '10000015', 'QQ红包', '来就送', '5', '10000', '5', '1470672000000', '1471449600000', '1470211517444', '0');
INSERT INTO `coupon_activity` VALUES ('123', '10000016', '斗地主红包', '斗地主斗地主', '4', '655', '0', '1469116800000', '1471536000000', '1470219382010', '0');
INSERT INTO `coupon_activity` VALUES ('124', '10061awd', '一一', '一一一一', '8', '8888', '8', '1470153600000', '1470931200000', '1470360394395', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '1000awd', '小火堆', null, 'ss', '5', '1000', '22', null, null);
INSERT INTO `organization` VALUES ('2', '1001awd', '代码牛', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470319450439', '代码牛', '9', '2000', '0', '0', '0');
INSERT INTO `organization` VALUES ('3', '1003awd', '滴滴打车', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470306237858', '嘀嘀嘀', '4', '500', '0', '0', '0');
INSERT INTO `organization` VALUES ('4', '1002awd', '优步', null, '大大大', '4', '800', '20', '1470240000000', '1471968000000');
INSERT INTO `organization` VALUES ('6', '1004awd', '小小火堆', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470360570232', '小小火堆', '2', '5000', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

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
INSERT INTO `share` VALUES ('13', '10000010', '0', '15757175891', '20160729182245');
INSERT INTO `share` VALUES ('14', '10000000', '0', '15757175891', '20160729212420');
INSERT INTO `share` VALUES ('15', '10000000', '0', '15757175891', '20160801102125');
INSERT INTO `share` VALUES ('16', '10000010', '0', '15757175892', '20160802140648');
INSERT INTO `share` VALUES ('17', '10000013', '0', '15757175891', '20160802145818');
INSERT INTO `share` VALUES ('18', '10000012', '0', '15757175891', '20160802154705');
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
