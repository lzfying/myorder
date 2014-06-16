/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50616
 Source Host           : localhost
 Source Database       : order

 Target Server Version : 50616
 File Encoding         : utf-8

 Date: 06/16/2014 18:18:23 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `back_adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `back_adminuser`;
CREATE TABLE `back_adminuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isAdmin` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `showname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_adminuser`
-- ----------------------------
BEGIN;
INSERT INTO `back_adminuser` VALUES ('1', b'1', '1', 'test', 'test');
COMMIT;

-- ----------------------------
--  Table structure for `back_combo`
-- ----------------------------
DROP TABLE IF EXISTS `back_combo`;
CREATE TABLE `back_combo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA21E103664DD7076` (`price_id`),
  CONSTRAINT `FKA21E103664DD7076` FOREIGN KEY (`price_id`) REFERENCES `back_mealprice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_combo`
-- ----------------------------
BEGIN;
INSERT INTO `back_combo` VALUES ('4', '111', '111', null, '6');
COMMIT;

-- ----------------------------
--  Table structure for `back_combo_back_combodetail`
-- ----------------------------
DROP TABLE IF EXISTS `back_combo_back_combodetail`;
CREATE TABLE `back_combo_back_combodetail` (
  `back_combo_id` bigint(20) NOT NULL,
  `details_id` bigint(20) NOT NULL,
  UNIQUE KEY `details_id` (`details_id`),
  KEY `FKF1DFACF072CD8EAE` (`back_combo_id`),
  KEY `FKF1DFACF019E0E13` (`details_id`),
  CONSTRAINT `FKF1DFACF019E0E13` FOREIGN KEY (`details_id`) REFERENCES `back_combodetail` (`id`),
  CONSTRAINT `FKF1DFACF072CD8EAE` FOREIGN KEY (`back_combo_id`) REFERENCES `back_combo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_combo_back_combodetail`
-- ----------------------------
BEGIN;
INSERT INTO `back_combo_back_combodetail` VALUES ('4', '1'), ('4', '2');
COMMIT;

-- ----------------------------
--  Table structure for `back_combodetail`
-- ----------------------------
DROP TABLE IF EXISTS `back_combodetail`;
CREATE TABLE `back_combodetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `meal` tinyblob,
  `num` int(11) NOT NULL,
  `meal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK504CA80787BF6BFE` (`meal_id`),
  CONSTRAINT `FK504CA80787BF6BFE` FOREIGN KEY (`meal_id`) REFERENCES `back_meal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_combodetail`
-- ----------------------------
BEGIN;
INSERT INTO `back_combodetail` VALUES ('1', null, '1', '2'), ('2', null, '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `back_comment`
-- ----------------------------
DROP TABLE IF EXISTS `back_comment`;
CREATE TABLE `back_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `commentstate` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `combo_id` bigint(20) DEFAULT NULL,
  `meal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK92DFC30785CCCE56` (`combo_id`),
  KEY `FK92DFC30787BF6BFE` (`meal_id`),
  CONSTRAINT `FK92DFC30787BF6BFE` FOREIGN KEY (`meal_id`) REFERENCES `back_meal` (`id`),
  CONSTRAINT `FK92DFC30785CCCE56` FOREIGN KEY (`combo_id`) REFERENCES `back_combo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `back_meal`
-- ----------------------------
DROP TABLE IF EXISTS `back_meal`;
CREATE TABLE `back_meal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `combo_id` bigint(20) DEFAULT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `combodetail_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4F91C01B64DD7076` (`price_id`),
  KEY `FK4F91C01B85CCCE56` (`combo_id`),
  KEY `FK4F91C01B2DF76101` (`type_id`),
  KEY `FK4F91C01BBF56A7D6` (`combodetail_id`),
  CONSTRAINT `FK4F91C01BBF56A7D6` FOREIGN KEY (`combodetail_id`) REFERENCES `back_combodetail` (`id`),
  CONSTRAINT `FK4F91C01B2DF76101` FOREIGN KEY (`type_id`) REFERENCES `back_meal_type` (`id`),
  CONSTRAINT `FK4F91C01B64DD7076` FOREIGN KEY (`price_id`) REFERENCES `back_mealprice` (`id`),
  CONSTRAINT `FK4F91C01B85CCCE56` FOREIGN KEY (`combo_id`) REFERENCES `back_combo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_meal`
-- ----------------------------
BEGIN;
INSERT INTO `back_meal` VALUES ('1', '11111', '1111', null, null, '1', '1', null), ('2', '2222', '2222', null, null, '2', '2', null);
COMMIT;

-- ----------------------------
--  Table structure for `back_meal_back_comment`
-- ----------------------------
DROP TABLE IF EXISTS `back_meal_back_comment`;
CREATE TABLE `back_meal_back_comment` (
  `back_meal_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `comments_id` (`comments_id`),
  KEY `FK8329B0ABE1F940A6` (`back_meal_id`),
  KEY `FK8329B0ABC35B5601` (`comments_id`),
  CONSTRAINT `FK8329B0ABC35B5601` FOREIGN KEY (`comments_id`) REFERENCES `back_comment` (`id`),
  CONSTRAINT `FK8329B0ABE1F940A6` FOREIGN KEY (`back_meal_id`) REFERENCES `back_meal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `back_meal_back_tag`
-- ----------------------------
DROP TABLE IF EXISTS `back_meal_back_tag`;
CREATE TABLE `back_meal_back_tag` (
  `back_meal_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  PRIMARY KEY (`back_meal_id`,`tags_id`),
  KEY `FKFFFA87E64E96D4AB` (`tags_id`),
  KEY `FKFFFA87E6E1F940A6` (`back_meal_id`),
  CONSTRAINT `FKFFFA87E6E1F940A6` FOREIGN KEY (`back_meal_id`) REFERENCES `back_meal` (`id`),
  CONSTRAINT `FKFFFA87E64E96D4AB` FOREIGN KEY (`tags_id`) REFERENCES `back_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `back_meal_type`
-- ----------------------------
DROP TABLE IF EXISTS `back_meal_type`;
CREATE TABLE `back_meal_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mealType` int(11) NOT NULL,
  `meal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK990A60DE87BF6BFE` (`meal_id`),
  CONSTRAINT `FK990A60DE87BF6BFE` FOREIGN KEY (`meal_id`) REFERENCES `back_meal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_meal_type`
-- ----------------------------
BEGIN;
INSERT INTO `back_meal_type` VALUES ('1', '1', null), ('2', '2', null);
COMMIT;

-- ----------------------------
--  Table structure for `back_mealdesc`
-- ----------------------------
DROP TABLE IF EXISTS `back_mealdesc`;
CREATE TABLE `back_mealdesc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `back_mealprice`
-- ----------------------------
DROP TABLE IF EXISTS `back_mealprice`;
CREATE TABLE `back_mealprice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discount` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_mealprice`
-- ----------------------------
BEGIN;
INSERT INTO `back_mealprice` VALUES ('1', '1', '1111'), ('2', '2', '222'), ('6', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `back_order`
-- ----------------------------
DROP TABLE IF EXISTS `back_order`;
CREATE TABLE `back_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `orderNum` varchar(255) DEFAULT NULL,
  `orderPrice` double NOT NULL,
  `orderstate` varchar(255) DEFAULT NULL,
  `payWay` varchar(255) DEFAULT NULL,
  `receiver_addr` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_other` varchar(255) DEFAULT NULL,
  `receiver_tel` varchar(255) DEFAULT NULL,
  `User_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA2C865F647140EFE` (`User_id`),
  CONSTRAINT `FKA2C865F647140EFE` FOREIGN KEY (`User_id`) REFERENCES `meta_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_order`
-- ----------------------------
BEGIN;
INSERT INTO `back_order` VALUES ('1', null, '140616173939669', '1111', null, null, '11111111', '1111', '1111', '1111', null);
COMMIT;

-- ----------------------------
--  Table structure for `back_order_back_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `back_order_back_orderdetail`;
CREATE TABLE `back_order_back_orderdetail` (
  `back_order_id` bigint(20) NOT NULL,
  `orderDetails_id` bigint(20) NOT NULL,
  KEY `FK6F7694F0E188B6AE` (`back_order_id`),
  KEY `FK6F7694F0862451A1` (`orderDetails_id`),
  CONSTRAINT `FK6F7694F0862451A1` FOREIGN KEY (`orderDetails_id`) REFERENCES `back_orderdetail` (`id`),
  CONSTRAINT `FK6F7694F0E188B6AE` FOREIGN KEY (`back_order_id`) REFERENCES `back_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_order_back_orderdetail`
-- ----------------------------
BEGIN;
INSERT INTO `back_order_back_orderdetail` VALUES ('1', '1'), ('1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `back_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `back_orderdetail`;
CREATE TABLE `back_orderdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `priceType` varchar(255) DEFAULT NULL,
  `totalNum` int(11) NOT NULL,
  `combo_id` bigint(20) DEFAULT NULL,
  `meal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7CFADC785CCCE56` (`combo_id`),
  KEY `FKC7CFADC787BF6BFE` (`meal_id`),
  CONSTRAINT `FKC7CFADC787BF6BFE` FOREIGN KEY (`meal_id`) REFERENCES `back_meal` (`id`),
  CONSTRAINT `FKC7CFADC785CCCE56` FOREIGN KEY (`combo_id`) REFERENCES `back_combo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_orderdetail`
-- ----------------------------
BEGIN;
INSERT INTO `back_orderdetail` VALUES ('1', '1', '1111', null, '0', null, '1'), ('2', '1', '1', null, '0', '4', null);
COMMIT;

-- ----------------------------
--  Table structure for `back_tag`
-- ----------------------------
DROP TABLE IF EXISTS `back_tag`;
CREATE TABLE `back_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `back_treenode`
-- ----------------------------
DROP TABLE IF EXISTS `back_treenode`;
CREATE TABLE `back_treenode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `back_treenode`
-- ----------------------------
BEGIN;
INSERT INTO `back_treenode` VALUES ('1', null, '系统管理', '0', '0'), ('2', '/admin/order/orderadmin', '订单管理', '1', '1'), ('3', '/admin/user/useradmin', '用户管理', '1', '1'), ('4', '/admin/meal/mealadmin', '菜品管理', '1', '1'), ('5', '/admin/combo/comboadmin', '套餐管理', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `back_useraddress`
-- ----------------------------
DROP TABLE IF EXISTS `back_useraddress`;
CREATE TABLE `back_useraddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userDetail_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90D026717544CA7E` (`userDetail_id`),
  CONSTRAINT `FK90D026717544CA7E` FOREIGN KEY (`userDetail_id`) REFERENCES `meta_customerdetail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dic_meal_type`
-- ----------------------------
DROP TABLE IF EXISTS `dic_meal_type`;
CREATE TABLE `dic_meal_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dic_meal_type`
-- ----------------------------
BEGIN;
INSERT INTO `dic_meal_type` VALUES ('1', '主食', '1'), ('2', '菜品', '2'), ('3', '饮料', '3');
COMMIT;

-- ----------------------------
--  Table structure for `meta_customer`
-- ----------------------------
DROP TABLE IF EXISTS `meta_customer`;
CREATE TABLE `meta_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userDetail_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7DB90D87544CA7E` (`userDetail_id`),
  CONSTRAINT `FKC7DB90D87544CA7E` FOREIGN KEY (`userDetail_id`) REFERENCES `meta_customerdetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `meta_customer`
-- ----------------------------
BEGIN;
INSERT INTO `meta_customer` VALUES ('1', 'zzz@zzz.xom', '123123', '小红果', null), ('2', '11', null, '1111', null), ('3', '11111', null, '111111', null), ('4', '1111', null, '11111', null), ('5', '', null, '111111', null), ('6', '22222', null, '222222', null), ('8', '123123', null, '123123', null), ('9', '123123123', null, '1123123', null), ('10', '11111', null, '11111', '9'), ('11', '22222', null, '2222', '10'), ('12', '3333', null, '3333', '11'), ('15', '123123', null, '123123', '14'), ('16', '123123123', null, '123123', '15'), ('17', '12123123', null, '12123123', '16'), ('18', '345345', null, '345345', '17'), ('19', '1111', null, '1111', '18'), ('20', null, null, null, '19');
COMMIT;

-- ----------------------------
--  Table structure for `meta_customerdetail`
-- ----------------------------
DROP TABLE IF EXISTS `meta_customerdetail`;
CREATE TABLE `meta_customerdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `post` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB9BA72947140EFE` (`user_id`),
  CONSTRAINT `FKB9BA72947140EFE` FOREIGN KEY (`user_id`) REFERENCES `meta_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `meta_customerdetail`
-- ----------------------------
BEGIN;
INSERT INTO `meta_customerdetail` VALUES ('1', null, null, null, '0', null, null, null, null, null), ('2', null, null, null, '0', null, null, null, null, null), ('3', null, null, null, '0', '1111', null, null, null, null), ('4', null, null, null, '0', '2222222', null, null, null, null), ('5', null, null, '3333', '0', '33333', null, '3333', '3333', null), ('6', null, null, '123123', '0', '123123', null, '123123', '123123', null), ('7', null, null, '12312', '0', '3123123123', null, '123123123', '3123132', null), ('8', null, null, '123123', '0', '123123123', null, '123123', '123123', null), ('9', null, null, '111111', '0', '11111', null, '1', '11111', null), ('10', null, null, '22222', '0', '22222', null, '22222', '22222', null), ('11', null, null, null, '0', null, null, '333', null, null), ('14', null, null, null, '0', null, null, '123123', null, null), ('15', null, null, null, '0', null, null, '123123123', null, null), ('16', null, null, null, '0', null, null, '12123123', null, null), ('17', null, null, null, '0', null, null, '345345', null, null), ('18', null, null, null, '0', null, null, '1111', null, null), ('19', null, null, null, '0', null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
