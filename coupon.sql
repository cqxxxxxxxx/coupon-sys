/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : coupon

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-24 16:45:23
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
  `role` int(11) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '$2a$10$8fv83uq2P6C2blbQcEwGD.3yHkOSZhdGk7.WHH8Ra.gw69EudBSwC', '$2a$10$8fv83uq2P6C2blbQcEwGD.', '1', null, null);

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
  `sendtime` bigint(20) DEFAULT NULL COMMENT '链接发送的时间',
  `created` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of click_info
-- ----------------------------
INSERT INTO `click_info` VALUES ('292', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470383279792');
INSERT INTO `click_info` VALUES ('293', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470383341447');
INSERT INTO `click_info` VALUES ('294', '1002aw', '1', '192.168.0.125', 'Firefox/47.0', null, '1470383418466');
INSERT INTO `click_info` VALUES ('295', '1002aw', '1', '192.168.0.125', 'Firefox/47.0', null, '1470383431651');
INSERT INTO `click_info` VALUES ('296', 'vwZLr3', '1', '192.168.0.125', 'Firefox/47.0', null, '1470383576169');
INSERT INTO `click_info` VALUES ('297', '1006wd', '1', '192.168.0.125', 'Safari/537.36', null, '1470386671886');
INSERT INTO `click_info` VALUES ('298', '1006wd', '1', '192.168.0.125', 'Safari/537.36', null, '1470386702961');
INSERT INTO `click_info` VALUES ('299', '1006wd', '1', '192.168.0.125', 'Safari/537.36', null, '1470387142829');
INSERT INTO `click_info` VALUES ('300', '10061awd', '0', '192.168.0.125', 'Firefox/47.0', null, '1470388796349');
INSERT INTO `click_info` VALUES ('301', '10061a', '1', '192.168.0.125', 'Firefox/47.0', null, '1470388841962');
INSERT INTO `click_info` VALUES ('302', '100awd', '1', '192.168.0.125', 'Firefox/47.0', null, '1470389130785');
INSERT INTO `click_info` VALUES ('303', '100awd', '1', '192.168.0.125', 'Firefox/47.0', null, '1470389158683');
INSERT INTO `click_info` VALUES ('304', '100awd', '1', '192.168.0.125', 'Firefox/47.0', null, '1470389201705');
INSERT INTO `click_info` VALUES ('305', '10061a', '1', '192.168.0.125', 'Safari/537.36', null, '1470389761908');
INSERT INTO `click_info` VALUES ('306', '10061awd', '0', '192.168.0.125', 'Safari/537.36', null, '1470389847484');
INSERT INTO `click_info` VALUES ('307', '1002awd', '2', '192.168.0.125', 'Safari/537.36', null, '1470389907326');
INSERT INTO `click_info` VALUES ('308', '1002awd', '2', '192.168.0.125', 'Safari/537.36', null, '1470389975997');
INSERT INTO `click_info` VALUES ('309', 'ssss1112', '0', '192.168.0.114', 'Firefox/47.0', null, '1470491238680');
INSERT INTO `click_info` VALUES ('310', 'ssss15', '1', '192.168.0.114', 'Firefox/47.0', null, '1470491264734');
INSERT INTO `click_info` VALUES ('311', '1002awd', '2', '192.168.0.114', 'Firefox/47.0', null, '1470539252818');
INSERT INTO `click_info` VALUES ('312', '1002awd', '2', '192.168.0.114', 'Firefox/47.0', null, '1470539311552');
INSERT INTO `click_info` VALUES ('313', '1002awd', '2', '192.168.0.111', 'Firefox/47.0', null, '1470582013577');
INSERT INTO `click_info` VALUES ('314', '100sswr', '2', '192.168.0.111', 'Firefox/47.0', null, '1470582688498');
INSERT INTO `click_info` VALUES ('315', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470618080590');
INSERT INTO `click_info` VALUES ('316', '111111qq', '0', '192.168.0.125', 'Safari/537.36', null, '1470618882419');
INSERT INTO `click_info` VALUES ('317', 'ssss1112', '0', '192.168.0.125', 'Firefox/47.0', null, '1470632312382');
INSERT INTO `click_info` VALUES ('318', 'ssss1112', '0', '192.168.0.125', 'Safari/537.36', null, '1470636139179');
INSERT INTO `click_info` VALUES ('319', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470636449372');
INSERT INTO `click_info` VALUES ('320', 'ssss1112', '0', '192.168.0.125', 'Safari/537.36', null, '1470637319019');
INSERT INTO `click_info` VALUES ('321', 'ssss1112', '0', '192.168.0.125', 'Safari/537.36', null, '1470637463699');
INSERT INTO `click_info` VALUES ('322', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637585486');
INSERT INTO `click_info` VALUES ('323', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637600777');
INSERT INTO `click_info` VALUES ('324', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637621011');
INSERT INTO `click_info` VALUES ('325', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637628934');
INSERT INTO `click_info` VALUES ('326', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637669517');
INSERT INTO `click_info` VALUES ('327', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637688075');
INSERT INTO `click_info` VALUES ('328', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637823175');
INSERT INTO `click_info` VALUES ('329', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470637936083');
INSERT INTO `click_info` VALUES ('330', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470638030713');
INSERT INTO `click_info` VALUES ('331', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470638430040');
INSERT INTO `click_info` VALUES ('332', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470638794652');
INSERT INTO `click_info` VALUES ('333', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470638809701');
INSERT INTO `click_info` VALUES ('334', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639017431');
INSERT INTO `click_info` VALUES ('335', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639045937');
INSERT INTO `click_info` VALUES ('336', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639129041');
INSERT INTO `click_info` VALUES ('337', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639587944');
INSERT INTO `click_info` VALUES ('338', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639753385');
INSERT INTO `click_info` VALUES ('339', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639771335');
INSERT INTO `click_info` VALUES ('340', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639775798');
INSERT INTO `click_info` VALUES ('341', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470639783699');
INSERT INTO `click_info` VALUES ('342', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470640071049');
INSERT INTO `click_info` VALUES ('343', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470640221105');
INSERT INTO `click_info` VALUES ('344', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470640685101');
INSERT INTO `click_info` VALUES ('345', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470640730165');
INSERT INTO `click_info` VALUES ('346', 'sss111', '1', '192.168.0.125', 'Safari/601.1', null, '1470640785370');
INSERT INTO `click_info` VALUES ('347', 'sss111', '1', '192.168.0.125', 'Safari/601.1', null, '1470640821289');
INSERT INTO `click_info` VALUES ('348', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470642725474');
INSERT INTO `click_info` VALUES ('349', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470644025744');
INSERT INTO `click_info` VALUES ('350', '111111qq', '0', '192.168.0.125', 'Safari/537.36', null, '1470644042123');
INSERT INTO `click_info` VALUES ('351', '1111qq', '1', '192.168.0.125', 'Safari/601.1', null, '1470644090577');
INSERT INTO `click_info` VALUES ('352', 'ssss1112', '0', '192.168.0.125', 'Safari/537.36', null, '1470645679092');
INSERT INTO `click_info` VALUES ('353', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470645910722');
INSERT INTO `click_info` VALUES ('354', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470820495842');
INSERT INTO `click_info` VALUES ('355', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470820947536');
INSERT INTO `click_info` VALUES ('356', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470821620507');
INSERT INTO `click_info` VALUES ('357', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470821634319');
INSERT INTO `click_info` VALUES ('358', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470821780496');
INSERT INTO `click_info` VALUES ('359', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470821794684');
INSERT INTO `click_info` VALUES ('360', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822161371');
INSERT INTO `click_info` VALUES ('361', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822171635');
INSERT INTO `click_info` VALUES ('362', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822183008');
INSERT INTO `click_info` VALUES ('363', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822292473');
INSERT INTO `click_info` VALUES ('364', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822415609');
INSERT INTO `click_info` VALUES ('365', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822430581');
INSERT INTO `click_info` VALUES ('366', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822739543');
INSERT INTO `click_info` VALUES ('367', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470822888908');
INSERT INTO `click_info` VALUES ('368', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823160119');
INSERT INTO `click_info` VALUES ('369', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823555507');
INSERT INTO `click_info` VALUES ('370', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823634657');
INSERT INTO `click_info` VALUES ('371', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823675035');
INSERT INTO `click_info` VALUES ('372', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823814719');
INSERT INTO `click_info` VALUES ('373', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823825054');
INSERT INTO `click_info` VALUES ('374', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823830168');
INSERT INTO `click_info` VALUES ('375', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470823914922');
INSERT INTO `click_info` VALUES ('376', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470824017418');
INSERT INTO `click_info` VALUES ('377', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470824072446');
INSERT INTO `click_info` VALUES ('378', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470824243122');
INSERT INTO `click_info` VALUES ('379', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470824880677');
INSERT INTO `click_info` VALUES ('380', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470824966674');
INSERT INTO `click_info` VALUES ('381', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825031831');
INSERT INTO `click_info` VALUES ('382', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825120860');
INSERT INTO `click_info` VALUES ('383', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825229196');
INSERT INTO `click_info` VALUES ('384', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825232034');
INSERT INTO `click_info` VALUES ('385', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825403411');
INSERT INTO `click_info` VALUES ('386', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825428474');
INSERT INTO `click_info` VALUES ('387', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825430729');
INSERT INTO `click_info` VALUES ('388', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470825437230');
INSERT INTO `click_info` VALUES ('389', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470877705885');
INSERT INTO `click_info` VALUES ('390', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470877768431');
INSERT INTO `click_info` VALUES ('391', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470877982076');
INSERT INTO `click_info` VALUES ('392', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470877996636');
INSERT INTO `click_info` VALUES ('393', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470877998877');
INSERT INTO `click_info` VALUES ('394', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470878352224');
INSERT INTO `click_info` VALUES ('395', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470879348663');
INSERT INTO `click_info` VALUES ('396', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470879478754');
INSERT INTO `click_info` VALUES ('397', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470879507646');
INSERT INTO `click_info` VALUES ('398', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470879543648');
INSERT INTO `click_info` VALUES ('399', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470879574310');
INSERT INTO `click_info` VALUES ('400', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470880036130');
INSERT INTO `click_info` VALUES ('401', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470880044926');
INSERT INTO `click_info` VALUES ('402', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470880415303');
INSERT INTO `click_info` VALUES ('403', '100sswr', '2', '192.168.0.125', 'Safari/537.36', null, '1470880428827');
INSERT INTO `click_info` VALUES ('404', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470880607212');
INSERT INTO `click_info` VALUES ('405', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470880778366');
INSERT INTO `click_info` VALUES ('406', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470880794359');
INSERT INTO `click_info` VALUES ('407', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1470881148839');
INSERT INTO `click_info` VALUES ('408', '111111qq', '0', '192.168.0.125', 'Safari/537.36', null, '1470881189860');
INSERT INTO `click_info` VALUES ('409', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881436485');
INSERT INTO `click_info` VALUES ('410', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881465885');
INSERT INTO `click_info` VALUES ('411', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881516736');
INSERT INTO `click_info` VALUES ('412', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881529108');
INSERT INTO `click_info` VALUES ('413', '111111qq', '0', '192.168.0.125', 'Safari/537.36', null, '1470881546193');
INSERT INTO `click_info` VALUES ('414', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881730615');
INSERT INTO `click_info` VALUES ('415', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881756062');
INSERT INTO `click_info` VALUES ('416', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881799574');
INSERT INTO `click_info` VALUES ('417', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470881957905');
INSERT INTO `click_info` VALUES ('418', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470882098118');
INSERT INTO `click_info` VALUES ('419', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882133431');
INSERT INTO `click_info` VALUES ('420', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470882199872');
INSERT INTO `click_info` VALUES ('421', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882341168');
INSERT INTO `click_info` VALUES ('422', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882465949');
INSERT INTO `click_info` VALUES ('423', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882577000');
INSERT INTO `click_info` VALUES ('424', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882673978');
INSERT INTO `click_info` VALUES ('425', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882727651');
INSERT INTO `click_info` VALUES ('426', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470882801659');
INSERT INTO `click_info` VALUES ('427', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470882991406');
INSERT INTO `click_info` VALUES ('428', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883027949');
INSERT INTO `click_info` VALUES ('429', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470883130935');
INSERT INTO `click_info` VALUES ('430', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883380910');
INSERT INTO `click_info` VALUES ('431', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470883453120');
INSERT INTO `click_info` VALUES ('432', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883494818');
INSERT INTO `click_info` VALUES ('433', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883701497');
INSERT INTO `click_info` VALUES ('434', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883943975');
INSERT INTO `click_info` VALUES ('435', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1470883950289');
INSERT INTO `click_info` VALUES ('436', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470883958248');
INSERT INTO `click_info` VALUES ('437', '111111qq', '0', '192.168.0.125', 'Safari/601.1', null, '1470884105590');
INSERT INTO `click_info` VALUES ('438', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470887908400');
INSERT INTO `click_info` VALUES ('439', '1002awd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470888280547');
INSERT INTO `click_info` VALUES ('440', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470892800102');
INSERT INTO `click_info` VALUES ('441', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470892807702');
INSERT INTO `click_info` VALUES ('442', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470892851960');
INSERT INTO `click_info` VALUES ('443', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470892930173');
INSERT INTO `click_info` VALUES ('444', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1470893024671');
INSERT INTO `click_info` VALUES ('445', 'ssss1112', '0', '192.168.0.125', 'Firefox/47.0', null, '1470893149515');
INSERT INTO `click_info` VALUES ('446', 'ssss1112', '0', '192.168.0.125', 'Firefox/47.0', null, '1470893186124');
INSERT INTO `click_info` VALUES ('447', 'cqxcqx534', '0', '192.168.0.125', 'Firefox/47.0', null, '1470896206275');
INSERT INTO `click_info` VALUES ('448', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1470897023220');
INSERT INTO `click_info` VALUES ('449', '111111qq', '0', '192.168.0.125', 'Firefox/47.0', null, '1470897064940');
INSERT INTO `click_info` VALUES ('450', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1470898608746');
INSERT INTO `click_info` VALUES ('451', 'cqxcqx534', '0', '192.168.0.125', 'Firefox/47.0', null, '1470898940755');
INSERT INTO `click_info` VALUES ('452', 'cqxcqx534', '0', '192.168.0.125', 'Safari/537.36', null, '1470898982458');
INSERT INTO `click_info` VALUES ('453', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899508047');
INSERT INTO `click_info` VALUES ('454', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899561390');
INSERT INTO `click_info` VALUES ('455', 'ssss1112', '0', '192.168.0.125', 'Safari/601.1', null, '1470899641936');
INSERT INTO `click_info` VALUES ('456', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899911938');
INSERT INTO `click_info` VALUES ('457', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899959004');
INSERT INTO `click_info` VALUES ('458', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899974452');
INSERT INTO `click_info` VALUES ('459', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899978439');
INSERT INTO `click_info` VALUES ('460', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899987070');
INSERT INTO `click_info` VALUES ('461', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470899999120');
INSERT INTO `click_info` VALUES ('462', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470900003768');
INSERT INTO `click_info` VALUES ('463', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470900006234');
INSERT INTO `click_info` VALUES ('464', 'cqxcqx534', '0', '192.168.0.125', 'Safari/601.1', null, '1470900011970');
INSERT INTO `click_info` VALUES ('465', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1471252408426');
INSERT INTO `click_info` VALUES ('466', 'awdeeeee', '2', '192.168.0.125', 'Firefox/47.0', null, '1471252458206');
INSERT INTO `click_info` VALUES ('467', 'awdeeeee', '2', '192.168.0.125', 'Firefox/47.0', null, '1471252490905');
INSERT INTO `click_info` VALUES ('468', 'awdeeeee', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253043131');
INSERT INTO `click_info` VALUES ('469', 'awdeeeee', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253073417');
INSERT INTO `click_info` VALUES ('470', 'awdeeeee', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253105625');
INSERT INTO `click_info` VALUES ('471', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253131070');
INSERT INTO `click_info` VALUES ('472', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253280265');
INSERT INTO `click_info` VALUES ('473', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253509942');
INSERT INTO `click_info` VALUES ('474', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471253562271');
INSERT INTO `click_info` VALUES ('475', 'cqxcqxcqx', '2', '192.168.0.125', 'Safari/537.36', null, '1471253656446');
INSERT INTO `click_info` VALUES ('476', 'cqxcqxcqx', '2', '192.168.0.125', 'Safari/601.1', null, '1471253709039');
INSERT INTO `click_info` VALUES ('477', 'cqxcqxcqx', '2', '192.168.0.125', 'Safari/601.1', null, '1471253802180');
INSERT INTO `click_info` VALUES ('478', 'cqxcqxcqx', '2', '192.168.0.125', 'Safari/601.1', null, '1471254615272');
INSERT INTO `click_info` VALUES ('479', '100sswr', '2', '192.168.0.125', 'Safari/601.1', null, '1471254649129');
INSERT INTO `click_info` VALUES ('480', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471255333823');
INSERT INTO `click_info` VALUES ('481', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471255960868');
INSERT INTO `click_info` VALUES ('482', 'dsafdas', '0', '192.168.0.125', 'Firefox/47.0', null, '1471256367139');
INSERT INTO `click_info` VALUES ('483', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471256369694');
INSERT INTO `click_info` VALUES ('484', 'dsafdas', '0', '192.168.0.125', 'Firefox/47.0', null, '1471256444575');
INSERT INTO `click_info` VALUES ('485', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471256936314');
INSERT INTO `click_info` VALUES ('486', 'cqxcqx5341', '2', '192.168.0.125', 'Firefox/47.0', null, '1471257836620');
INSERT INTO `click_info` VALUES ('487', '100sswr', '2', '192.168.0.125', 'Firefox/47.0', null, '1471257874063');
INSERT INTO `click_info` VALUES ('488', 'dsafdas', '0', '192.168.0.102', 'Firefox/47.0', null, '1471265556597');
INSERT INTO `click_info` VALUES ('489', '1441wefafweaf', '2', '192.168.0.125', 'Firefox/47.0', null, '1471310385794');
INSERT INTO `click_info` VALUES ('490', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471310427129');
INSERT INTO `click_info` VALUES ('491', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1471310764557');
INSERT INTO `click_info` VALUES ('492', 'cqxcqxcqx', '2', '192.168.0.125', 'Firefox/47.0', null, '1471318223257');
INSERT INTO `click_info` VALUES ('493', 'cqxcqx5341', '2', '192.168.0.125', 'Firefox/47.0', null, '1471318236762');
INSERT INTO `click_info` VALUES ('494', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/537.36', null, '1471318659555');
INSERT INTO `click_info` VALUES ('495', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471318674032');
INSERT INTO `click_info` VALUES ('496', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471318697174');
INSERT INTO `click_info` VALUES ('497', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471318903673');
INSERT INTO `click_info` VALUES ('498', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471319097451');
INSERT INTO `click_info` VALUES ('499', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471319119765');
INSERT INTO `click_info` VALUES ('500', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471319139927');
INSERT INTO `click_info` VALUES ('501', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471319535603');
INSERT INTO `click_info` VALUES ('502', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/537.36', null, '1471319857871');
INSERT INTO `click_info` VALUES ('503', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/537.36', null, '1471319872425');
INSERT INTO `click_info` VALUES ('504', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/537.36', null, '1471319900224');
INSERT INTO `click_info` VALUES ('505', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/537.36', null, '1471319961369');
INSERT INTO `click_info` VALUES ('506', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471320398733');
INSERT INTO `click_info` VALUES ('507', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471320496729');
INSERT INTO `click_info` VALUES ('508', 'cqxcqx5341', '2', '192.168.0.125', 'Safari/601.1', null, '1471320508555');
INSERT INTO `click_info` VALUES ('509', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471320606242');
INSERT INTO `click_info` VALUES ('510', '100dddd', '2', '192.168.0.125', 'Firefox/47.0', null, '1471320660142');
INSERT INTO `click_info` VALUES ('511', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471320671368');
INSERT INTO `click_info` VALUES ('512', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471320680701');
INSERT INTO `click_info` VALUES ('513', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471320698441');
INSERT INTO `click_info` VALUES ('514', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471321029399');
INSERT INTO `click_info` VALUES ('515', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471324366851');
INSERT INTO `click_info` VALUES ('516', '1441wefafweaf', '2', '192.168.0.125', 'Safari/537.36', null, '1471324429278');
INSERT INTO `click_info` VALUES ('517', '1441wefafweaf', '2', '192.168.0.125', 'Safari/601.1', null, '1471324486434');
INSERT INTO `click_info` VALUES ('518', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471324504029');
INSERT INTO `click_info` VALUES ('519', '100dddd', '2', '192.168.0.125', 'Safari/601.1', null, '1471324560043');
INSERT INTO `click_info` VALUES ('520', '1441wefafweaf', '2', '192.168.0.125', 'Safari/601.1', null, '1471324567344');
INSERT INTO `click_info` VALUES ('521', '1441wefafweaf', '2', '192.168.0.125', 'Safari/601.1', null, '1471324694665');
INSERT INTO `click_info` VALUES ('522', '1441wefafweaf', '2', '192.168.0.125', 'Safari/601.1', null, '1471324728404');
INSERT INTO `click_info` VALUES ('708', 'wewewewe', '0', '10.203.4.67', 'LBBROWSER)', null, '1471937787225');
INSERT INTO `click_info` VALUES ('709', 'wewewewe', '0', '101.71.255.233', 'Language/zh_CN', null, '1471937796923');
INSERT INTO `click_info` VALUES ('710', 'cqxxxx', '1', '10.203.4.67', 'LBBROWSER)', '1471937725986', '1471937860046');
INSERT INTO `click_info` VALUES ('711', 'cqxxxx', '1', '101.71.255.233', 'Language/zh_CN', '1471937725986', '1471937872024');
INSERT INTO `click_info` VALUES ('712', 'wewewewe', '0', '10.203.4.67', 'Safari/537.36', null, '1471937987945');
INSERT INTO `click_info` VALUES ('713', 'cqxxxx', '1', '10.203.4.67', 'Safari/537.36', '1471937725986', '1471938060600');
INSERT INTO `click_info` VALUES ('714', 'cqxxxx', '1', '10.203.4.67', 'LBBROWSER)', '1471937725986', '1471938189277');
INSERT INTO `click_info` VALUES ('715', 'cqxxxx', '1', '101.71.255.233', 'Language/zh_CN', '1471937725986', '1471938203899');
INSERT INTO `click_info` VALUES ('716', 'cqxxxx', '1', '10.203.4.67', 'LBBROWSER)', '1471937725986', '1471938383669');
INSERT INTO `click_info` VALUES ('717', 'cqxxxx', '1', '10.203.4.67', 'Safari/537.36', '1471937725986', '1471939043516');
INSERT INTO `click_info` VALUES ('718', 'cqxxxx', '1', '10.203.4.67', 'LBBROWSER)', '1471937725986', '1471939109217');
INSERT INTO `click_info` VALUES ('719', 'cqxxxx', '1', '101.71.255.233', 'Language/zh_CN', '1471937725986', '1471939655246');
INSERT INTO `click_info` VALUES ('720', 'cqxcqx534', '0', '10.203.4.67', 'Firefox/47.0', null, '1472026845636');
INSERT INTO `click_info` VALUES ('721', 'cqxxxxxxxxxx', '0', '10.203.4.67', 'Firefox/47.0', null, '1472027552775');
INSERT INTO `click_info` VALUES ('722', 'cqxcqx5341', '2', '10.203.4.67', 'Firefox/47.0', null, '1472027587174');
INSERT INTO `click_info` VALUES ('723', 'ssssss', '1', '10.203.4.67', 'Firefox/47.0', '1471937725986', '1472027653152');

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_activity
-- ----------------------------
INSERT INTO `coupon_activity` VALUES ('125', 'ssss1111', '安德森', '撒', '1', '1111', '0', '1471968000000', '1472140800000', '1470490504486', '0');
INSERT INTO `coupon_activity` VALUES ('126', 'ssss1112', '安德森啊啊', '撒', '1', '1111', '4', '1470153600000', '1472140800000', '1470491224768', '0');
INSERT INTO `coupon_activity` VALUES ('127', '111111qq', 'da', 'dsafsdsa', '11', '2222', '539', '1470153600000', '1471449600000', '1470618065143', '1470886721567');
INSERT INTO `coupon_activity` VALUES ('128', 'cqxcqx534', '啊拉拉', '倒萨发送到', '5', '100', '40', '1470153600000', '1472572800000', '1470896187843', '1471855045098');
INSERT INTO `coupon_activity` VALUES ('130', 'hahahaha', 'dididididi', 'dsafsa', '20', '500', '0', '1469980800000', '1472054400000', '1471919302752', '1471927713659');
INSERT INTO `coupon_activity` VALUES ('132', 'cqxxxxxxxxxx', 'dsacadscsa', 'dsaf', '22', '1111', '44', '1471276800000', '1472572800000', '1471929865390', '1471929905846');
INSERT INTO `coupon_activity` VALUES ('133', 'laldididi', 'sdaf', 'dsaf', '11', '1111', '0', '1469980800000', '1472313600000', '1471936828024', '1471936841314');
INSERT INTO `coupon_activity` VALUES ('134', 'fdsafadsf', '1212e', '12312', '11', '12222', '0', '1470153600000', '1472486400000', '1471936910713', '0');
INSERT INTO `coupon_activity` VALUES ('135', 'wewewewe', 'sdafasd', 'sadfadf', '11', '12222', '11', '1470931200000', '1472313600000', '1471937109823', '0');

-- ----------------------------
-- Table structure for `intermediate`
-- ----------------------------
DROP TABLE IF EXISTS `intermediate`;
CREATE TABLE `intermediate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT 'code为空则为全部的访问总和',
  `name` varchar(50) DEFAULT NULL COMMENT '访问量还是独立访问量之类的',
  `date` varchar(50) DEFAULT NULL COMMENT '日期 YYYY-MM-DD格式',
  `num` int(11) DEFAULT '0' COMMENT 'name对应的访问量或者分享数之类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intermediate
-- ----------------------------
INSERT INTO `intermediate` VALUES ('4', null, 'views', '2016-08-23', '100');
INSERT INTO `intermediate` VALUES ('5', null, 'dViews', '2016-08-23', '20');
INSERT INTO `intermediate` VALUES ('6', null, 'registrations', '2016-08-23', '11');
INSERT INTO `intermediate` VALUES ('7', null, 'appRegistrations', '2016-08-23', '12');
INSERT INTO `intermediate` VALUES ('8', null, 'pInvites', '2016-08-23', '10');
INSERT INTO `intermediate` VALUES ('9', null, 'dpInvites', '2016-08-23', '5');
INSERT INTO `intermediate` VALUES ('10', null, 'views', '2016-08-24', '150');
INSERT INTO `intermediate` VALUES ('11', null, 'dViews', '2016-08-24', '200');
INSERT INTO `intermediate` VALUES ('12', null, 'registrations', '2016-08-24', '100');
INSERT INTO `intermediate` VALUES ('13', null, 'appRegistrations', '2016-08-24', '10');
INSERT INTO `intermediate` VALUES ('14', null, 'pInvites', '2016-08-24', '20');
INSERT INTO `intermediate` VALUES ('15', null, 'dpInvites', '2016-08-24', '10');
INSERT INTO `intermediate` VALUES ('19', null, 'views', '2016-08-25', '120');
INSERT INTO `intermediate` VALUES ('20', null, 'dViews', '2016-08-25', '111');
INSERT INTO `intermediate` VALUES ('21', null, 'registrations', '2016-08-25', '20');
INSERT INTO `intermediate` VALUES ('22', null, 'appRegistrations', '2016-08-25', '15');
INSERT INTO `intermediate` VALUES ('23', null, 'pInvites', '2016-08-25', '1');
INSERT INTO `intermediate` VALUES ('24', null, 'dpInvites', '2016-08-25', '1');
INSERT INTO `intermediate` VALUES ('25', 'cqxcqx534', 'views', '2016-08-24', '2');
INSERT INTO `intermediate` VALUES ('26', 'cqxcqx534', 'dViews', '2016-08-24', '2');
INSERT INTO `intermediate` VALUES ('27', 'cqxcqx534', 'registrations', '2016-08-24', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '1000awd', '小火堆', null, 'ss', '5', '1000', '22', null, null);
INSERT INTO `organization` VALUES ('2', '1001awd', '代码牛', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470319450439', '代码牛', '9', '2000', '0', '1470758400000', '1471536000000');
INSERT INTO `organization` VALUES ('3', '1003awd', '滴滴打车', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470306237858', '嘀嘀嘀', '4', '500', '0', '0', '0');
INSERT INTO `organization` VALUES ('4', '1002awd', '优步', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470888272732', '大大大', '11', '800', '39', '1470153600000', '1471449600000');
INSERT INTO `organization` VALUES ('6', '1004awd', '小小火堆', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470360570232', '小小火堆', '2', '5000', '0', '0', '0');
INSERT INTO `organization` VALUES ('7', '100sswr', 'dasf', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470885663422', 'dddsafa', '22', '111', '36', '0', '0');
INSERT INTO `organization` VALUES ('8', '100dddd', '大大大', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471487994662', '大大大', '11', '1111', '220', '1470672000000', '1472054400000');
INSERT INTO `organization` VALUES ('10', 'cqxcqx5341', 'sda', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1470898595581', 'sdaf', '11', '111', '22', '1470758400000', '1472572800000');
INSERT INTO `organization` VALUES ('11', 'awdeeeee', 'saadsaf', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471252445991', 'fadsf', '1', '1', '5', '1469980800000', '1472140800000');
INSERT INTO `organization` VALUES ('12', '1441wefafweaf', 'sdafas', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471310351260', 'sdafasdf', '11', '111', '22', '1470240000000', '1471536000000');
INSERT INTO `organization` VALUES ('13', 'chaojiwudi', '大师傅', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471578883883', '1苏打粉', '22', '1111', '0', '1469980800000', '1471104000000');
INSERT INTO `organization` VALUES ('14', 'balalabalala', 'sadfasdf', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471919347897', 'dsafsfdas', '111', '111', '111', '1471449600000', '1472572800000');
INSERT INTO `organization` VALUES ('15', 'eminem1', 'adas', 'http://7xl7mb.com1.z0.glb.clouddn.com/sv1471928323361', 'sdfa', '11', '2222', '22', '1470067200000', '1472572800000');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0为官方 1为个人',
  `phone` varchar(255) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `checked_time` bigint(20) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('1', 'acsyws', '1', '15757175891', '1', null, '20160721131308');
INSERT INTO `share` VALUES ('2', 'acsyws', '1', '15757174551', '0', null, '20160721131308');
INSERT INTO `share` VALUES ('7', '10000000', '0', '15555550000', '0', null, '20160724162047');
INSERT INTO `share` VALUES ('8', '10000000', '0', '12322220111', '0', null, '20160725141459');
INSERT INTO `share` VALUES ('9', '10000010', '0', '15757174000', '1', null, '20160728102728');
INSERT INTO `share` VALUES ('10', 'acsyws', '1', '15757171111', '0', null, '20160728162620');
INSERT INTO `share` VALUES ('11', 'acsyws', '1', '15757157112', '1', null, '20160729170819');
INSERT INTO `share` VALUES ('12', 'acsyws', '1', '15757175890', '0', null, '20160729170924');
INSERT INTO `share` VALUES ('16', '10000010', '0', '15757175892', '0', null, '20160802140648');
INSERT INTO `share` VALUES ('19', '1000awd', '2', '15757175893', '0', null, '1470217214189');
INSERT INTO `share` VALUES ('31', '10000015', '0', '15757175895', '0', null, '1470217214189');
INSERT INTO `share` VALUES ('32', '1000awd', '2', '15757175896', '0', null, '1470217256997');
INSERT INTO `share` VALUES ('33', '1000awd', '2', '15757175897', '0', null, '1470217444521');
INSERT INTO `share` VALUES ('34', '1000awd', '2', '15757175898', '0', null, '1470217456833');
INSERT INTO `share` VALUES ('35', '10061awd', '0', '13888888288', '0', null, '1470360525207');
INSERT INTO `share` VALUES ('36', '1002awd', '2', '15757175899', '0', null, '1470360624998');
INSERT INTO `share` VALUES ('37', '1002awd', '2', '15757175810', '0', null, '1470360798703');
INSERT INTO `share` VALUES ('38', '1002awd', '2', '15115144444', '0', null, '1470367088101');
INSERT INTO `share` VALUES ('39', '1002awd', '2', '15757174441', '0', null, '1470370535121');
INSERT INTO `share` VALUES ('40', '1002awd', '2', '15757174442', '0', null, '1470370702646');
INSERT INTO `share` VALUES ('42', '1006wd', '1', '15757175960', '0', null, '1470387200579');
INSERT INTO `share` VALUES ('43', '1006wd', '1', '15757175961', '0', null, '1470387343413');
INSERT INTO `share` VALUES ('44', '10061a', '1', '15757175963', '0', null, '1470388903247');
INSERT INTO `share` VALUES ('45', '100awd', '1', '15757175965', '0', null, '1470389215197');
INSERT INTO `share` VALUES ('46', 'ssss15', '1', '15757176049', '0', null, '1470491286984');
INSERT INTO `share` VALUES ('47', '1002awd', '2', '15757817512', '0', null, '1470539323108');
INSERT INTO `share` VALUES ('48', '1002awd', '2', '15757175555', '0', null, '1470582699041');
INSERT INTO `share` VALUES ('49', 'ssss1112', '0', '15757171234', '0', null, '1470636462258');
INSERT INTO `share` VALUES ('50', 'ssss1112', '0', '15757171235', '0', null, '1470637293267');
INSERT INTO `share` VALUES ('51', 'sss111', '1', '15757171236', '0', null, '1470640841416');
INSERT INTO `share` VALUES ('52', 'ssss1112', '0', '15757171238', '0', null, '1470642736379');
INSERT INTO `share` VALUES ('53', '111111qq', '0', '13588382891', '0', null, '1470644054714');
INSERT INTO `share` VALUES ('54', '100sswr', '2', '13588382892', '0', null, '1470878049907');
INSERT INTO `share` VALUES ('55', '100sswr', '2', '13588382893', '0', null, '1470878188370');
INSERT INTO `share` VALUES ('56', '100sswr', '2', '13588382894', '0', null, '1470878207284');
INSERT INTO `share` VALUES ('57', '100sswr', '2', '13588382898', '0', null, '1470878282403');
INSERT INTO `share` VALUES ('58', '100sswr', '2', '13588382899', '0', null, '1470878380522');
INSERT INTO `share` VALUES ('59', '100sswr', '2', '13588383851', '0', null, '1470880838932');
INSERT INTO `share` VALUES ('60', '100sswr', '2', '13588454444', '0', null, '1470881873178');
INSERT INTO `share` VALUES ('61', '111111qq', '0', '13588282891', '0', null, '1470882107112');
INSERT INTO `share` VALUES ('62', '111111qq', '0', '13588483891', '0', null, '1470882142721');
INSERT INTO `share` VALUES ('63', '100sswr', '2', '15754855891', '0', null, '1470882210188');
INSERT INTO `share` VALUES ('64', '111111qq', '0', '13588483892', '0', null, '1470882220714');
INSERT INTO `share` VALUES ('65', '111111qq', '0', '13588483893', '0', null, '1470882277579');
INSERT INTO `share` VALUES ('66', '111111qq', '0', '13588483894', '0', null, '1470882337449');
INSERT INTO `share` VALUES ('67', '111111qq', '0', '13588483898', '0', null, '1470882371305');
INSERT INTO `share` VALUES ('68', '111111qq', '0', '13588483899', '0', null, '1470882392963');
INSERT INTO `share` VALUES ('69', '111111qq', '0', '13588483810', '0', null, '1470882416746');
INSERT INTO `share` VALUES ('70', '111111qq', '0', '13588483812', '0', null, '1470882469982');
INSERT INTO `share` VALUES ('71', '111111qq', '0', '13588483813', '0', null, '1470882484563');
INSERT INTO `share` VALUES ('72', '111111qq', '0', '13588483815', '0', null, '1470882581531');
INSERT INTO `share` VALUES ('73', '100sswr', '2', '15754855894', '0', null, '1470882598755');
INSERT INTO `share` VALUES ('74', '111111qq', '0', '13588483816', '0', null, '1470882676299');
INSERT INTO `share` VALUES ('75', '111111qq', '0', '13588483817', '0', null, '1470882740720');
INSERT INTO `share` VALUES ('76', '100sswr', '2', '13588454445', '0', null, '1470882788629');
INSERT INTO `share` VALUES ('77', '111111qq', '0', '13588968951', '0', null, '1470882818149');
INSERT INTO `share` VALUES ('78', '111111qq', '0', '13588435155', '0', null, '1470883000487');
INSERT INTO `share` VALUES ('79', '100sswr', '2', '15754855898', '0', null, '1470883033747');
INSERT INTO `share` VALUES ('80', '111111qq', '0', '13588435156', '0', null, '1470883148165');
INSERT INTO `share` VALUES ('81', '100sswr', '2', '15754855899', '0', null, '1470883396719');
INSERT INTO `share` VALUES ('82', '111111qq', '0', '13588435158', '0', null, '1470883449778');
INSERT INTO `share` VALUES ('83', '111111qq', '0', '13588435159', '0', null, '1470883456035');
INSERT INTO `share` VALUES ('84', '100sswr', '2', '15754855810', '0', null, '1470883518714');
INSERT INTO `share` VALUES ('85', '100sswr', '2', '15754855811', '0', null, '1470883552113');
INSERT INTO `share` VALUES ('86', '100sswr', '2', '15754855812', '0', null, '1470883648444');
INSERT INTO `share` VALUES ('87', '100sswr', '2', '15754855813', '0', null, '1470883705053');
INSERT INTO `share` VALUES ('88', '111111qq', '0', '13588435160', '0', null, '1470883711660');
INSERT INTO `share` VALUES ('89', '111111qq', '0', '13544781811', '0', null, '1470883968065');
INSERT INTO `share` VALUES ('90', '100sswr', '2', '13544822122', '0', null, '1470883987329');
INSERT INTO `share` VALUES ('91', '111111qq', '0', '13588968952', '0', null, '1470884099810');
INSERT INTO `share` VALUES ('92', '111111qq', '0', '13577845555', '0', null, '1470884111861');
INSERT INTO `share` VALUES ('93', '100sswr', '2', '13588383854', '0', null, '1470885389185');
INSERT INTO `share` VALUES ('94', '111111qq', '0', '13577845558', '0', null, '1470885393478');
INSERT INTO `share` VALUES ('95', '1002awd', '2', '13577514411', '0', null, '1470887916442');
INSERT INTO `share` VALUES ('96', '100dddd', '2', '13588255555', '0', null, '1470892830799');
INSERT INTO `share` VALUES ('97', '100dddd', '2', '13588255556', '0', null, '1470893036860');
INSERT INTO `share` VALUES ('98', 'ssss1112', '0', '15755547741', '0', null, '1470893188215');
INSERT INTO `share` VALUES ('99', 'cqxcqxcqx', '2', '13522121212', '0', null, '1470897034617');
INSERT INTO `share` VALUES ('100', '111111qq', '0', '15711454444', '0', null, '1470897074313');
INSERT INTO `share` VALUES ('101', 'cqxcqxcqx', '2', '13544444444', '0', null, '1470898618164');
INSERT INTO `share` VALUES ('102', 'awdeeeee', '2', '15757175850', '0', null, '1471252470623');
INSERT INTO `share` VALUES ('103', 'awdeeeee', '2', '15757175221', '0', null, '1471252503974');
INSERT INTO `share` VALUES ('104', 'awdeeeee', '2', '15757175225', '0', null, '1471252577930');
INSERT INTO `share` VALUES ('105', 'awdeeeee', '2', '15757175226', '0', null, '1471252873243');
INSERT INTO `share` VALUES ('106', 'awdeeeee', '2', '15757175227', '0', null, '1471252887364');
INSERT INTO `share` VALUES ('107', 'cqxcqxcqx', '2', '15757175245', '0', null, '1471253143682');
INSERT INTO `share` VALUES ('108', 'cqxcqxcqx', '2', '15757175246', '0', null, '1471253288271');
INSERT INTO `share` VALUES ('109', 'cqxcqxcqx', '2', '15757175462', '0', null, '1471254622975');
INSERT INTO `share` VALUES ('110', 'cqxcqxcqx', '2', '15757175141', '0', null, '1471256945280');
INSERT INTO `share` VALUES ('111', 'cqxcqx5341', '2', '13577847848', '0', null, '1471257853982');
INSERT INTO `share` VALUES ('112', '1441wefafweaf', '2', '13577847814', '0', null, '1471310393307');
INSERT INTO `share` VALUES ('113', '100dddd', '2', '13577777777', '0', null, '1471310783671');
INSERT INTO `share` VALUES ('114', '100dddd', '2', '13588352212', '0', null, '1471325115685');
INSERT INTO `share` VALUES ('115', '1441wefafweaf', '2', '13588358554', '0', null, '1471325145202');
INSERT INTO `share` VALUES ('116', '', '1', '13777171111', '0', null, '1471484920987');
INSERT INTO `share` VALUES ('117', '', '1', '13577787878', '0', null, '1471485127727');
INSERT INTO `share` VALUES ('118', '', '1', '13577787879', '0', null, '1471485348680');
INSERT INTO `share` VALUES ('119', '', '1', '13577787853', '0', null, '1471485402768');
INSERT INTO `share` VALUES ('120', 'vwZLr3', '1', '13588897979', '0', null, '1471485608346');
INSERT INTO `share` VALUES ('121', 'cqxcqx534', '0', '13777772321', '0', null, '1471485711857');
INSERT INTO `share` VALUES ('122', '100dddd', '2', '13712321414', '0', null, '1471485969481');
INSERT INTO `share` VALUES ('123', '100dddd', '2', '15757171123', '0', null, '1471488021799');
INSERT INTO `share` VALUES ('124', 'cqxcqx534', '0', '15757174514', '0', '0', '1471573031240');
INSERT INTO `share` VALUES ('125', '100dddd', '2', '15757175866', '0', '0', '1471574519023');
INSERT INTO `share` VALUES ('126', '100dddd', '2', '15774444555', '0', '0', '1471576528846');
INSERT INTO `share` VALUES ('127', '100dddd', '2', '15744445565', '0', '0', '1471576618372');
INSERT INTO `share` VALUES ('128', 'cqxcqx534', '0', '15757714441', '0', '0', '1471576691708');
INSERT INTO `share` VALUES ('129', 'cqxcqx534', '0', '15757714442', '0', '0', '1471576748650');
INSERT INTO `share` VALUES ('130', '100dddd', '2', '13599944522', '0', '0', '1471576778919');
INSERT INTO `share` VALUES ('131', '100dddd', '2', '15745474114', '0', '0', '1471576819647');
INSERT INTO `share` VALUES ('132', 'cqxcqx534', '0', '15757174444', '0', '0', '1471577001383');
INSERT INTO `share` VALUES ('133', '100dddd', '2', '15745474117', '0', '0', '1471577290575');
INSERT INTO `share` VALUES ('134', '100dddd', '2', '15745474119', '0', '0', '1471577321697');
INSERT INTO `share` VALUES ('135', '100dddd', '2', '15745474150', '0', '0', '1471577505638');
INSERT INTO `share` VALUES ('136', '100dddd', '2', '15745474155', '0', '0', '1471577630911');
INSERT INTO `share` VALUES ('137', '100dddd', '2', '13588787441', '0', '0', '1471577721929');
INSERT INTO `share` VALUES ('138', '100dddd', '2', '13578413685', '0', '0', '1471577774930');
INSERT INTO `share` VALUES ('139', '100dddd', '2', '15672547874', '0', '0', '1471577890034');
INSERT INTO `share` VALUES ('140', '100dddd', '2', '15722244114', '0', '0', '1471578167483');
INSERT INTO `share` VALUES ('141', 'cqxcqx534', '0', '15714552211', '0', '0', '1471578189861');
INSERT INTO `share` VALUES ('142', 'wfdaet', '1', '13555286666', '0', '0', '1471578234162');
INSERT INTO `share` VALUES ('143', '100dddd', '2', '15757173254', '1', '0', '1471597145360');
INSERT INTO `share` VALUES ('144', 'abcwss', '1', '15733324411', '1', '0', '1471597360839');
INSERT INTO `share` VALUES ('145', 'cqxcqx534', '0', '15743565136', '1', '0', '1471597381309');
INSERT INTO `share` VALUES ('146', 'vwZLr3', '1', '13574112456', '1', '0', '1471856236641');
INSERT INTO `share` VALUES ('147', 'heiheihei', '0', '15757175841', '0', '0', '1471919211472');
INSERT INTO `share` VALUES ('148', 'balalabalala', '2', '15757175842', '0', '0', '1471919458045');
INSERT INTO `share` VALUES ('149', 'vwZLr3', '1', '15757144844', '0', '0', '1471919722215');
INSERT INTO `share` VALUES ('150', 'vwZLr3', '1', '13544444114', '0', '0', '1471925509133');
INSERT INTO `share` VALUES ('151', 'eminem1', '2', '13822112245', '0', '0', '1471928372530');
INSERT INTO `share` VALUES ('152', 'eminem', '1', '13577411412', '0', '0', '1471928489205');
INSERT INTO `share` VALUES ('153', 'cqxxxxxxxxxx', '0', '13574412321', '0', '0', '1471929922148');
INSERT INTO `share` VALUES ('154', 'cqxxxxx', '2', '13571151515', '0', '0', '1471930034353');
INSERT INTO `share` VALUES ('155', 'cqxcqx', '1', '15741144122', '0', '0', '1471930100915');
INSERT INTO `share` VALUES ('156', 'eminem1', '2', '13688894464', '0', '0', '1471937735831');
INSERT INTO `share` VALUES ('157', 'wewewewe', '0', '15858585858', '0', '0', '1471937807869');
INSERT INTO `share` VALUES ('158', 'cqxcqx534', '0', '13577411115', '0', '0', '1472026885426');
INSERT INTO `share` VALUES ('159', 'cqxxxxxxxxxx', '0', '13587445457', '0', '0', '1472027560654');
INSERT INTO `share` VALUES ('160', 'cqxcqx5341', '2', '13584541534', '0', '0', '1472027594503');
INSERT INTO `share` VALUES ('161', 'ssssss', '1', '13685231534', '0', '0', '1472027659922');
