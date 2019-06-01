/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : adminlte

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-06-01 23:01:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('12', '拉克丝', '光光', '13456789876', 'qwe@qq.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` varchar(32) NOT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` varchar(32) DEFAULT NULL,
  `orderStatus` varchar(32) DEFAULT NULL,
  `productId` int(32) DEFAULT NULL,
  `memberId` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'orders-12345', '2018-02-03 12:00', '2', '没什么', '线上支付', '已关闭', '676', '12');
INSERT INTO `orders` VALUES ('3', 'orders-1123', '2018-02-03 12:00', '2', '没什么', '线上支付', '待处理', '676', '12');
INSERT INTO `orders` VALUES ('4', 'orders-1234', '2018-02-03 12:00', '2', '没什么', '线上支付', '已关闭', '676', '12');
INSERT INTO `orders` VALUES ('5', 'orders-345', '2018-02-03 12:00', '2', '没什么', '线上支付', '待处理', '676', '12');
INSERT INTO `orders` VALUES ('6', 'orders-456', '2018-02-03 12:00', '2', '没什么', '线上支付', '已关闭', '676', '12');
INSERT INTO `orders` VALUES ('7', 'orders-567', '2018-02-03 12:00', '2', '没什么', '线上支付', '待处理', '676', '12');
INSERT INTO `orders` VALUES ('8', 'orders-8798', '2018-02-03 12:00', '2', '没什么', '线上支付', '已关闭', '676', '12');

-- ----------------------------
-- Table structure for orders_traveller
-- ----------------------------
DROP TABLE IF EXISTS `orders_traveller`;
CREATE TABLE `orders_traveller` (
  `ordersId` int(32) NOT NULL,
  `travellerId` int(32) NOT NULL,
  PRIMARY KEY (`ordersId`,`travellerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_traveller
-- ----------------------------
INSERT INTO `orders_traveller` VALUES ('1', '2');
INSERT INTO `orders_traveller` VALUES ('1', '3');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '创建', '/create');
INSERT INTO `permission` VALUES ('2', '删除', '/delete');
INSERT INTO `permission` VALUES ('3', '查询', '/query');
INSERT INTO `permission` VALUES ('4', '修改', '/update');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` varchar(32) NOT NULL DEFAULT '',
  `productPrice` bigint(10) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('676', 'product-001', '北京三日游', '北京', '2019-05-09 01:05', '1200', '不错的旅行', '已开启');
INSERT INTO `product` VALUES ('677', 'product-002', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('684', 'product-003', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('685', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('686', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('687', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('688', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('689', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('690', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('691', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('692', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('693', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('694', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('695', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('696', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('697', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('698', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('699', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('700', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('701', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('702', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('703', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('704', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('705', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('706', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('707', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('708', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('709', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('710', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('711', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('712', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('713', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('714', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('715', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('716', 'product-004', '上海七日游', '上海', '2019-05-09 01:05', '2400', '不错呦', '已关闭');
INSERT INTO `product` VALUES ('717', '678', '', '', '2019-05-07 03:10', '123', '', '已关闭');
INSERT INTO `product` VALUES ('718', '999', '', '', '', '123', '', '已关闭');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '管理员权限');
INSERT INTO `role` VALUES ('2', 'user', '业务员权限');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(32) NOT NULL DEFAULT '0',
  `roleId` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('2', '3');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(32) NOT NULL,
  `visitTime` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(32) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` varchar(32) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('2', '哈哈', '男', '12312312312', '军官证', '610526000000000001', '成人');
INSERT INTO `traveller` VALUES ('3', '呵呵', '女', '12312312312', '残疾证', '610526999999999992', '成人');
INSERT INTO `traveller` VALUES ('12', '贾科斯', '男', '18907635246', '身份证', '610526198239273028', '儿童');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin@qq.com', 'admin', '$2a$10$1NgiR4u5JLDurmpUlcHktegdF7FzUdgKrPPAbK.tB6Mj8Tr1mVIJi', '12345678900', '已启用');
INSERT INTO `users` VALUES ('2', 'user@cn.com', 'user', '$2a$10$1NgiR4u5JLDurmpUlcHktegdF7FzUdgKrPPAbK.tB6Mj8Tr1mVIJi', '12345678901', '已启用');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `usersId` int(32) NOT NULL DEFAULT '0',
  `roleId` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usersId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('2', '2');
