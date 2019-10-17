/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.128
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 192.168.2.128:3306
 Source Schema         : adminlte

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 17/10/2019 14:11:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (12, '拉克丝', '光光', '13456789876', 'qwe@qq.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderTime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `peopleCount` int(11) NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderStatus` tinyint(1) NULL DEFAULT NULL,
  `productId` int(32) NULL DEFAULT NULL,
  `memberId` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'orders-12345', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (2, 'orders-7896', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (3, 'orders-1123', '2018-02-03 12:00', 2, '没什么', '线上支付', 1, 676, 12);
INSERT INTO `orders` VALUES (4, 'orders-1234', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (5, 'orders-345', '2018-02-03 12:00', 2, '没什么', '线上支付', 1, 676, 12);
INSERT INTO `orders` VALUES (6, 'orders-456', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (7, 'orders-879', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (8, 'orders-8798', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (9, 'orders-12', '2018-02-03 12:00', 2, '没什么', '线上支付', 1, 676, 12);
INSERT INTO `orders` VALUES (10, 'orders-4563', '2018-02-03 12:00', 2, '没什么', '线上支付', 1, 676, 12);
INSERT INTO `orders` VALUES (11, 'orders-3452', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);
INSERT INTO `orders` VALUES (12, 'orders-890', '2018-02-03 12:00', 2, '没什么', '线上支付', 0, 676, 12);

-- ----------------------------
-- Table structure for orders_traveller
-- ----------------------------
DROP TABLE IF EXISTS `orders_traveller`;
CREATE TABLE `orders_traveller`  (
  `ordersId` int(32) NOT NULL,
  `travellerId` int(32) NOT NULL,
  PRIMARY KEY (`ordersId`, `travellerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders_traveller
-- ----------------------------
INSERT INTO `orders_traveller` VALUES (1, 2);
INSERT INTO `orders_traveller` VALUES (1, 3);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '创建', '/create');
INSERT INTO `permission` VALUES (2, '删除', '/delete');
INSERT INTO `permission` VALUES (3, '查询', '/query');
INSERT INTO `permission` VALUES (4, '修改', '/update');
INSERT INTO `permission` VALUES (16, '测试', '/test');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DepartureTime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productPrice` bigint(10) NULL DEFAULT NULL,
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product`(`id`, `productNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 721 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (676, 'product-001', '北京三日游', '北京', '2019-05-09 01:05', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES (693, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (694, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (695, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (696, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (697, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (698, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (699, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (700, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (701, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (702, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (703, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (704, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (705, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (706, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (707, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (708, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (709, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (710, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (711, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (712, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 0);
INSERT INTO `product` VALUES (713, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (714, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (715, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (716, 'product-004', '上海七日游', '上海', '2019-05-09 01:05', 2400, '不错呦', 1);
INSERT INTO `product` VALUES (717, '678', '', '', '2019-05-07 03:10', 123, '', 1);
INSERT INTO `product` VALUES (718, '999', '', '', '', 123, '', 1);
INSERT INTO `product` VALUES (719, 'asd', 'asd', 'asd', '2019-10-01 10:20', 123, 'asd', 0);
INSERT INTO `product` VALUES (720, 'asdqwe', 'asd', 'asd', '2019-10-01 10:20', 123, '', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员');
INSERT INTO `role` VALUES (2, 'user', '业务员');
INSERT INTO `role` VALUES (10, 'test', '测试');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int(32) NOT NULL DEFAULT 0,
  `roleId` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (4, 1);
INSERT INTO `role_permission` VALUES (16, 1);
INSERT INTO `role_permission` VALUES (16, 10);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` int(32) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (799, '2019-10-15 14:23:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 10, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (801, '2019-10-15 14:24:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 9, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (802, '2019-10-15 14:25:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/batchDelete', 15, '[类名]com.example.demo.controller.SysLogController[方法名]delete');
INSERT INTO `syslog` VALUES (803, '2019-10-15 14:25:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 7, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (804, '2019-10-15 14:42:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 78, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (805, '2019-10-15 14:42:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/batchDelete', 9, '[类名]com.example.demo.controller.SysLogController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (806, '2019-10-15 14:43:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/batchDelete', 24, '[类名]com.example.demo.controller.SysLogController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (830, '2019-10-15 15:06:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 44, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (831, '2019-10-15 15:06:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/batchDelete', 49, '[类名]com.example.demo.controller.SysLogController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (832, '2019-10-15 15:06:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 13, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (833, '2019-10-15 15:06:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 43, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (834, '2019-10-15 15:06:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 43, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (835, '2019-10-15 15:06:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (836, '2019-10-15 15:28:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 40, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (837, '2019-10-15 15:28:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 76010, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (838, '2019-10-15 15:33:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 6, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (839, '2019-10-15 15:34:03', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 18275, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (840, '2019-10-15 15:37:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 18223, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (841, '2019-10-15 15:39:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 4606, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (842, '2019-10-15 15:41:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 212, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (843, '2019-10-15 15:44:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 12, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (844, '2019-10-15 15:44:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 37, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (845, '2019-10-15 15:44:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 9, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (846, '2019-10-15 15:44:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (847, '2019-10-15 15:44:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/batchDelete', 14, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (848, '2019-10-15 15:44:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (849, '2019-10-15 15:44:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/add', 0, '[类名]com.example.demo.controller.PermissionController[方法名]addPermission');
INSERT INTO `syslog` VALUES (870, '2019-10-15 15:57:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 14, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (871, '2019-10-15 15:57:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/delete', 9, '[类名]com.example.demo.controller.SysLogController[方法名]delete');
INSERT INTO `syslog` VALUES (872, '2019-10-15 15:57:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 9, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (873, '2019-10-15 16:12:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 46, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (874, '2019-10-15 16:13:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 43, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (875, '2019-10-15 16:13:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/query', 4, '[类名]com.example.demo.controller.PermissionController[方法名]query');
INSERT INTO `syslog` VALUES (876, '2019-10-15 16:13:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (877, '2019-10-15 16:15:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (878, '2019-10-15 16:15:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 10, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (879, '2019-10-15 16:16:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 18, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (880, '2019-10-15 16:16:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 22, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (881, '2019-10-15 16:17:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 25, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (882, '2019-10-15 16:18:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 42, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (883, '2019-10-15 16:19:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 22, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (884, '2019-10-15 16:19:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 46, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (885, '2019-10-15 16:24:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 46, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (886, '2019-10-15 16:26:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 45, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (887, '2019-10-15 16:29:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 48, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (888, '2019-10-15 16:32:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 44, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (889, '2019-10-15 16:32:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 21, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (890, '2019-10-15 16:34:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 46, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (891, '2019-10-15 16:36:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 49, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (892, '2019-10-15 16:37:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 48, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (893, '2019-10-15 16:38:05', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 40, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (894, '2019-10-15 16:41:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 41, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (895, '2019-10-15 16:41:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 38, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (896, '2019-10-15 16:53:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 47, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (897, '2019-10-15 16:54:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 49, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (898, '2019-10-15 16:54:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 43, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (899, '2019-10-15 16:56:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 45, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (900, '2019-10-15 16:57:03', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/query', 3, '[类名]com.example.demo.controller.PermissionController[方法名]query');
INSERT INTO `syslog` VALUES (901, '2019-10-15 16:57:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/save', 5, '[类名]com.example.demo.controller.PermissionController[方法名]savePermission');
INSERT INTO `syslog` VALUES (902, '2019-10-15 16:57:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (903, '2019-10-15 16:57:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/delete', 80, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (904, '2019-10-15 16:57:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (905, '2019-10-15 17:01:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 48, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (906, '2019-10-15 17:01:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/query', 4, '[类名]com.example.demo.controller.PermissionController[方法名]query');
INSERT INTO `syslog` VALUES (907, '2019-10-15 17:02:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/save', 4, '[类名]com.example.demo.controller.PermissionController[方法名]savePermission');
INSERT INTO `syslog` VALUES (908, '2019-10-15 17:02:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (909, '2019-10-15 17:02:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/delete', 61, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (910, '2019-10-15 17:02:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (911, '2019-10-15 17:02:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/query', 7, '[类名]com.example.demo.controller.PermissionController[方法名]query');
INSERT INTO `syslog` VALUES (912, '2019-10-15 17:02:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/save', 67660, '[类名]com.example.demo.controller.PermissionController[方法名]savePermission');
INSERT INTO `syslog` VALUES (913, '2019-10-15 17:03:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (914, '2019-10-15 17:03:54', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/delete', 16, '[类名]com.example.demo.controller.PermissionController[方法名]batchDelete');
INSERT INTO `syslog` VALUES (915, '2019-10-15 17:03:54', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (916, '2019-10-15 17:11:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 43, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (917, '2019-10-15 17:11:14', 'admin@qq.com', '127.0.0.1', '/permission/query', 6, '[类名]com.example.demo.controller.PermissionController[方法名]query');
INSERT INTO `syslog` VALUES (918, '2019-10-15 17:11:18', 'admin@qq.com', '127.0.0.1', '/permission/save', 11972, '[类名]com.example.demo.controller.PermissionController[方法名]savePermission');
INSERT INTO `syslog` VALUES (919, '2019-10-15 17:11:30', 'admin@qq.com', '127.0.0.1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1020, '2019-10-15 18:00:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 45, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1021, '2019-10-15 18:00:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/delete', 55, '[类名]com.example.demo.controller.SysLogController[方法名]delete');
INSERT INTO `syslog` VALUES (1022, '2019-10-15 18:00:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 21, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1023, '2019-10-15 18:01:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 12, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1024, '2019-10-15 18:01:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 12, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1025, '2019-10-15 18:01:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 8, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1026, '2019-10-15 18:02:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 7, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1027, '2019-10-15 18:02:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 8, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1028, '2019-10-15 18:02:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 5, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1029, '2019-10-15 18:02:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 5, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1030, '2019-10-15 18:03:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 8, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1031, '2019-10-15 18:03:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 5, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1032, '2019-10-15 18:04:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 9, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1033, '2019-10-15 18:04:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1034, '2019-10-15 18:05:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1035, '2019-10-15 18:05:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1036, '2019-10-15 18:05:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1037, '2019-10-15 18:05:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1038, '2019-10-15 18:05:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 6, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1039, '2019-10-15 18:05:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 7, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1040, '2019-10-15 18:07:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 6, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1041, '2019-10-15 18:07:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 74, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1042, '2019-10-15 18:08:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 10, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1660, '2019-10-16 18:13:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 8, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1661, '2019-10-16 18:13:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/delete', 13, '[类名]com.example.demo.controller.SysLogController[方法名]delete');
INSERT INTO `syslog` VALUES (1662, '2019-10-16 18:13:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 4, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1663, '2019-10-16 18:13:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 50, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1664, '2019-10-16 18:15:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1665, '2019-10-16 18:16:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 34, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1666, '2019-10-16 18:23:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 119, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1667, '2019-10-16 18:24:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 74, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1668, '2019-10-16 18:25:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 125, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1669, '2019-10-16 18:26:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 10, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1670, '2019-10-16 18:26:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/query', 3, '[类名]com.example.demo.controller.UsersController[方法名]query');
INSERT INTO `syslog` VALUES (1671, '2019-10-16 18:26:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/save', 110, '[类名]com.example.demo.controller.UsersController[方法名]createUsers');
INSERT INTO `syslog` VALUES (1672, '2019-10-16 18:26:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 6, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1673, '2019-10-16 18:26:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 77, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1674, '2019-10-16 18:26:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1675, '2019-10-16 18:26:55', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 47, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1676, '2019-10-16 18:27:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1677, '2019-10-16 18:27:27', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 48, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1678, '2019-10-16 18:27:38', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 49, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1679, '2019-10-16 18:27:49', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 48, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1680, '2019-10-16 18:27:52', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 41, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1681, '2019-10-16 18:28:00', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1682, '2019-10-16 18:28:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 37, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1683, '2019-10-16 18:28:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 42, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1684, '2019-10-16 18:31:21', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 124, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1685, '2019-10-16 18:31:29', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 78, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1686, '2019-10-16 18:31:57', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1687, '2019-10-16 18:31:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 48, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1688, '2019-10-16 18:32:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 58, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1689, '2019-10-16 18:33:29', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 131, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1690, '2019-10-16 18:38:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 130, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1691, '2019-10-16 18:38:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 87, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1692, '2019-10-16 18:38:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 74, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1693, '2019-10-16 18:38:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 84, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1694, '2019-10-16 18:38:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 76, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1695, '2019-10-16 18:38:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 68, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1696, '2019-10-16 18:38:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 73, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1697, '2019-10-16 18:39:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 62, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1698, '2019-10-16 18:39:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 69, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1699, '2019-10-16 18:39:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 84, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1700, '2019-10-16 18:39:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 86, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1701, '2019-10-16 18:39:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 70, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1702, '2019-10-16 18:39:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 93, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1703, '2019-10-16 18:39:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 88, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1704, '2019-10-16 18:39:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 72, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1705, '2019-10-16 18:39:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 62, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1706, '2019-10-16 18:39:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 63, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1707, '2019-10-16 18:39:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 61, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1708, '2019-10-16 18:41:01', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 127, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1709, '2019-10-16 18:41:12', 'user@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 10, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1710, '2019-10-16 18:41:15', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 69, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1711, '2019-10-16 18:46:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 126, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1712, '2019-10-16 18:47:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 69, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1713, '2019-10-16 18:49:09', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 127, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1714, '2019-10-16 18:49:38', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1715, '2019-10-16 18:49:45', 'admin@qq.com', '127.0.0.1', '/index', 67, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1716, '2019-10-16 18:52:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 61, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1717, '2019-10-16 18:52:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 51, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1718, '2019-10-16 18:52:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 48, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1719, '2019-10-16 18:52:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 52, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1720, '2019-10-16 18:53:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 46, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1721, '2019-10-16 18:53:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 11, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1722, '2019-10-16 18:53:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 44, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1723, '2019-10-16 19:10:05', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 140, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1724, '2019-10-16 19:11:15', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 127, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1725, '2019-10-16 19:11:36', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 70, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1726, '2019-10-16 19:11:42', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 57, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1727, '2019-10-16 19:11:50', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1728, '2019-10-16 19:11:59', 'user@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1729, '2019-10-16 19:12:12', 'user@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1730, '2019-10-16 19:12:20', 'user@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1731, '2019-10-16 19:13:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 1, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1732, '2019-10-16 19:14:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1733, '2019-10-16 19:16:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1734, '2019-10-16 19:18:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1735, '2019-10-16 19:18:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1736, '2019-10-16 19:18:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1737, '2019-10-16 19:18:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1738, '2019-10-16 19:18:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1739, '2019-10-16 19:18:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1740, '2019-10-16 19:18:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/header', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1741, '2019-10-16 19:23:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/i', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1742, '2019-10-16 19:23:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 126, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1743, '2019-10-16 19:27:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1744, '2019-10-16 19:27:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1745, '2019-10-16 19:27:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1746, '2019-10-16 19:28:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1747, '2019-10-16 19:28:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1748, '2019-10-16 19:28:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1749, '2019-10-16 19:28:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1750, '2019-10-16 19:29:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1751, '2019-10-16 19:29:54', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 123, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1752, '2019-10-16 19:30:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1753, '2019-10-16 19:30:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1754, '2019-10-16 19:30:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 99, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1755, '2019-10-16 19:30:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1756, '2019-10-16 19:30:14', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1757, '2019-10-16 19:30:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 82, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1758, '2019-10-16 19:30:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1759, '2019-10-16 19:30:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1760, '2019-10-16 19:30:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 64, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1761, '2019-10-16 19:30:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1762, '2019-10-16 19:30:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1763, '2019-10-16 19:30:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 73, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1764, '2019-10-16 19:31:58', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 130, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1765, '2019-10-16 19:32:05', 'user@qq.com', '127.0.0.1', '/index', 64, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1766, '2019-10-16 19:33:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1767, '2019-10-16 19:33:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 128, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1768, '2019-10-16 19:33:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1769, '2019-10-16 19:33:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1770, '2019-10-16 19:33:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 87, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1771, '2019-10-16 19:33:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 1, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1772, '2019-10-16 19:33:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1773, '2019-10-16 19:33:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 72, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1774, '2019-10-16 19:34:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1775, '2019-10-16 19:34:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 137, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1776, '2019-10-16 19:34:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1777, '2019-10-16 19:34:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1778, '2019-10-16 19:34:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 81, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1779, '2019-10-16 19:35:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1780, '2019-10-16 19:35:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 123, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1781, '2019-10-16 19:35:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 1, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1782, '2019-10-16 19:35:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1783, '2019-10-16 19:35:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 79, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1784, '2019-10-16 19:35:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1785, '2019-10-16 19:35:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1786, '2019-10-16 19:35:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 63, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1787, '2019-10-16 19:36:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1788, '2019-10-16 19:37:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]header');
INSERT INTO `syslog` VALUES (1789, '2019-10-16 19:37:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 120, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1790, '2019-10-16 21:39:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 154, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1791, '2019-10-16 21:40:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1792, '2019-10-16 21:40:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 40, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1793, '2019-10-16 21:42:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 75396, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1794, '2019-10-16 21:43:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 124, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1795, '2019-10-16 21:47:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 132, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1796, '2019-10-16 21:50:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 138, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1797, '2019-10-16 21:51:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 140, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1798, '2019-10-16 21:52:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1799, '2019-10-16 21:52:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1800, '2019-10-16 21:57:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1801, '2019-10-16 21:57:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 123, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1802, '2019-10-16 21:59:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 11, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1803, '2019-10-16 21:59:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 82, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1804, '2019-10-16 21:59:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 62, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1805, '2019-10-16 22:05:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1806, '2019-10-16 22:05:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1807, '2019-10-16 22:05:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 53, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1808, '2019-10-16 22:05:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 6, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1809, '2019-10-16 22:05:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1810, '2019-10-16 22:05:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1811, '2019-10-16 22:05:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 45, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1812, '2019-10-16 22:09:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 41, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1813, '2019-10-16 22:09:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 119, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1814, '2019-10-16 22:09:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1815, '2019-10-16 22:09:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1816, '2019-10-16 22:09:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 74, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1817, '2019-10-16 22:09:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 5, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1818, '2019-10-16 22:09:55', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 11, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1819, '2019-10-16 22:09:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 66, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1820, '2019-10-16 22:10:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 10, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (1821, '2019-10-16 22:10:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1822, '2019-10-16 22:10:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1823, '2019-10-16 22:10:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 57, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1824, '2019-10-16 22:10:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 6, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1825, '2019-10-16 22:10:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 6, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1826, '2019-10-16 22:10:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 56, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1827, '2019-10-16 22:10:31', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1828, '2019-10-16 22:10:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1829, '2019-10-16 22:10:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 45, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1830, '2019-10-16 22:10:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 6, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1831, '2019-10-16 22:10:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]root');
INSERT INTO `syslog` VALUES (1832, '2019-10-16 22:10:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1833, '2019-10-16 22:10:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 45, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1834, '2019-10-16 22:17:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1835, '2019-10-16 22:17:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 122, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1836, '2019-10-16 22:17:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 81, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1837, '2019-10-16 22:17:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 7, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1838, '2019-10-16 22:17:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1839, '2019-10-16 22:18:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1840, '2019-10-16 22:18:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 52, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1841, '2019-10-16 22:21:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 42, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1842, '2019-10-16 22:25:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 40, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1843, '2019-10-16 22:25:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 10, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1844, '2019-10-16 22:25:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 17, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1845, '2019-10-16 22:25:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 20, '[类名]com.example.demo.controller.RoleController[方法名]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (1846, '2019-10-16 22:26:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 6, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1847, '2019-10-16 22:27:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 45, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1848, '2019-10-16 22:27:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 18, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1849, '2019-10-16 22:28:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/query', 3, '[类名]com.example.demo.controller.RoleController[方法名]query');
INSERT INTO `syslog` VALUES (1850, '2019-10-16 22:28:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 6, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1851, '2019-10-16 22:28:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 9, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1852, '2019-10-16 22:29:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/query', 9, '[类名]com.example.demo.controller.UsersController[方法名]query');
INSERT INTO `syslog` VALUES (1853, '2019-10-16 22:29:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 117, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1854, '2019-10-16 22:29:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 8, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1855, '2019-10-16 22:30:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 136, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1856, '2019-10-16 22:31:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 84, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1857, '2019-10-16 22:32:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 144, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1858, '2019-10-16 22:43:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 136, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1859, '2019-10-16 22:43:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 1, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1860, '2019-10-16 22:43:44', 'user@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1861, '2019-10-16 22:43:44', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 70, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1862, '2019-10-16 22:45:45', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 146, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1863, '2019-10-16 22:46:15', 'user@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 10, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1864, '2019-10-16 22:46:21', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 83, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1865, '2019-10-16 22:49:51', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 141, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1866, '2019-10-16 22:55:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 131, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1867, '2019-10-16 22:55:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 87, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1868, '2019-10-16 22:55:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 57, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1869, '2019-10-16 22:55:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 8, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (1870, '2019-10-16 22:55:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1871, '2019-10-16 22:55:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 53, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1872, '2019-10-16 23:02:22', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 136, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1873, '2019-10-16 23:06:48', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 76, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1874, '2019-10-16 23:09:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 138, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1875, '2019-10-16 23:09:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 72, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1876, '2019-10-16 23:09:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 59, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1877, '2019-10-16 23:09:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1878, '2019-10-16 23:09:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1879, '2019-10-16 23:09:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 67, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1880, '2019-10-16 23:09:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1881, '2019-10-16 23:09:58', 'user@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1882, '2019-10-16 23:09:58', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 57, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1883, '2019-10-16 23:10:18', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1884, '2019-10-16 23:10:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1885, '2019-10-16 23:10:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 43, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1886, '2019-10-16 23:10:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 11, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1887, '2019-10-16 23:10:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 14, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1888, '2019-10-16 23:11:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 1, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1889, '2019-10-16 23:11:17', 'user@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1890, '2019-10-16 23:11:17', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 47, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1891, '2019-10-16 23:11:41', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1892, '2019-10-16 23:11:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1893, '2019-10-16 23:11:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 42, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1894, '2019-10-16 23:12:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 5, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1895, '2019-10-16 23:24:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 142, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1896, '2019-10-16 23:24:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1897, '2019-10-16 23:24:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1898, '2019-10-16 23:25:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 85, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1899, '2019-10-16 23:33:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 132, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1900, '2019-10-16 23:33:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 68, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1901, '2019-10-16 23:33:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 1, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1902, '2019-10-16 23:33:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1903, '2019-10-16 23:34:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 65, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1904, '2019-10-16 23:36:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1905, '2019-10-16 23:36:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1906, '2019-10-16 23:36:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 61, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1907, '2019-10-16 23:36:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1908, '2019-10-16 23:36:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1909, '2019-10-16 23:36:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 82, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1910, '2019-10-16 23:36:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1911, '2019-10-16 23:36:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1912, '2019-10-16 23:37:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 86, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1913, '2019-10-16 23:37:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1914, '2019-10-16 23:38:03', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1915, '2019-10-16 23:38:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 44, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1916, '2019-10-16 23:44:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1917, '2019-10-16 23:44:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 123, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1918, '2019-10-16 23:44:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1919, '2019-10-16 23:45:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1920, '2019-10-16 23:45:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 70, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1921, '2019-10-16 23:45:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 53, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1922, '2019-10-16 23:45:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1923, '2019-10-16 23:46:00', 'user@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1924, '2019-10-16 23:46:00', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 58, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1925, '2019-10-16 23:47:08', 'user@qq.com', '0:0:0:0:0:0:0:1', '/index', 55, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1926, '2019-10-16 23:47:15', 'user@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (1927, '2019-10-16 23:47:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1928, '2019-10-16 23:47:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 46, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1929, '2019-10-16 23:48:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 17, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1930, '2019-10-16 23:49:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 78, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1931, '2019-10-17 09:41:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 8, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1932, '2019-10-17 09:41:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1933, '2019-10-17 09:41:55', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 15, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (1934, '2019-10-17 09:42:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 7, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1935, '2019-10-17 09:42:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 14, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1936, '2019-10-17 09:42:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 7, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (1937, '2019-10-17 09:42:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 14, '[类名]com.example.demo.controller.SysLogController[方法名]findAllSysLog');
INSERT INTO `syslog` VALUES (1938, '2019-10-17 09:43:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 5, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1939, '2019-10-17 09:43:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 20, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (1940, '2019-10-17 09:43:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 5, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1941, '2019-10-17 09:43:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/query', 4, '[类名]com.example.demo.controller.UsersController[方法名]query');
INSERT INTO `syslog` VALUES (1942, '2019-10-17 09:43:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/save', 3, '[类名]com.example.demo.controller.UsersController[方法名]createUsers');
INSERT INTO `syslog` VALUES (1943, '2019-10-17 09:43:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 3, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1944, '2019-10-17 09:43:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/query', 3, '[类名]com.example.demo.controller.UsersController[方法名]query');
INSERT INTO `syslog` VALUES (1945, '2019-10-17 09:44:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/save', 5, '[类名]com.example.demo.controller.UsersController[方法名]createUsers');
INSERT INTO `syslog` VALUES (1946, '2019-10-17 09:44:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 3, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1947, '2019-10-17 09:44:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findUserByIdAndAllRole', 9, '[类名]com.example.demo.controller.UsersController[方法名]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (1948, '2019-10-17 09:44:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 5, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (1949, '2019-10-17 09:44:31', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1950, '2019-10-17 09:44:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1951, '2019-10-17 09:44:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 3, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1952, '2019-10-17 09:45:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1953, '2019-10-17 09:46:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 1, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1954, '2019-10-17 09:46:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1955, '2019-10-17 09:49:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1956, '2019-10-17 09:49:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 148, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1957, '2019-10-17 09:49:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 15, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1958, '2019-10-17 09:51:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1959, '2019-10-17 09:51:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1960, '2019-10-17 09:51:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1961, '2019-10-17 09:51:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 24, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1962, '2019-10-17 09:55:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 43, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1963, '2019-10-17 09:55:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 11, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1964, '2019-10-17 09:59:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 40, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1965, '2019-10-17 09:59:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findById/{id}', 0, '[类名]com.example.demo.controller.ProductController[方法名]findById');
INSERT INTO `syslog` VALUES (1966, '2019-10-17 09:59:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 14, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1967, '2019-10-17 10:00:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 40, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1968, '2019-10-17 10:00:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findById/{id}', 0, '[类名]com.example.demo.controller.ProductController[方法名]findById');
INSERT INTO `syslog` VALUES (1969, '2019-10-17 10:00:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 14, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1970, '2019-10-17 10:03:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findById/{id}', 0, '[类名]com.example.demo.controller.ProductController[方法名]findById');
INSERT INTO `syslog` VALUES (1971, '2019-10-17 10:04:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1972, '2019-10-17 10:04:05', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 1, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1973, '2019-10-17 10:04:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1974, '2019-10-17 10:05:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1975, '2019-10-17 10:05:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 106, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1976, '2019-10-17 10:05:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1977, '2019-10-17 10:05:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 1, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1978, '2019-10-17 10:05:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1979, '2019-10-17 10:05:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findById/{id}', 0, '[类名]com.example.demo.controller.ProductController[方法名]findById');
INSERT INTO `syslog` VALUES (1980, '2019-10-17 10:20:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 43, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1981, '2019-10-17 10:20:05', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1982, '2019-10-17 10:29:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 41, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1983, '2019-10-17 10:31:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 16, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1984, '2019-10-17 10:31:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findById/{id}', 0, '[类名]com.example.demo.controller.ProductController[方法名]findById');
INSERT INTO `syslog` VALUES (1985, '2019-10-17 10:32:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1986, '2019-10-17 10:32:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1987, '2019-10-17 10:32:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1988, '2019-10-17 10:46:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 170, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1989, '2019-10-17 10:46:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1990, '2019-10-17 10:46:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1991, '2019-10-17 10:50:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (1992, '2019-10-17 10:50:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 130, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1993, '2019-10-17 10:50:14', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 11, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1994, '2019-10-17 10:50:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 1, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1995, '2019-10-17 10:51:11', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (1996, '2019-10-17 10:51:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 4, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (1997, '2019-10-17 10:51:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (1998, '2019-10-17 10:51:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 64, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (1999, '2019-10-17 10:51:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2000, '2019-10-17 10:51:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 4, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2001, '2019-10-17 10:51:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2002, '2019-10-17 10:51:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 2, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2003, '2019-10-17 10:53:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 6, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2004, '2019-10-17 10:53:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 52, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2005, '2019-10-17 10:57:00', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 6, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2006, '2019-10-17 10:57:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/', 0, '[类名]com.example.demo.controller.BaseController[方法名]login');
INSERT INTO `syslog` VALUES (2007, '2019-10-17 10:57:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2008, '2019-10-17 10:57:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 127, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2009, '2019-10-17 10:57:25', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 12, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2010, '2019-10-17 10:57:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 3, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2011, '2019-10-17 10:57:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 13, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2012, '2019-10-17 10:57:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (2013, '2019-10-17 10:57:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2014, '2019-10-17 10:57:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 4, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2015, '2019-10-17 11:08:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 39, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2016, '2019-10-17 11:08:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 5, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2017, '2019-10-17 11:08:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 175, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2018, '2019-10-17 11:10:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2019, '2019-10-17 11:10:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 127, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2020, '2019-10-17 11:10:18', 'admin@qq.com', '127.0.0.1', '/product/findAll', 14, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2021, '2019-10-17 11:10:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 1, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (2022, '2019-10-17 11:10:33', 'admin@qq.com', '127.0.0.1', '/product/save', 4, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2023, '2019-10-17 11:10:33', 'admin@qq.com', '127.0.0.1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2024, '2019-10-17 11:10:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 73, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2025, '2019-10-17 11:10:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 55, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2026, '2019-10-17 11:10:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2027, '2019-10-17 11:10:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2028, '2019-10-17 11:11:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2029, '2019-10-17 11:11:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 55, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2030, '2019-10-17 11:11:46', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2031, '2019-10-17 11:11:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (2032, '2019-10-17 11:12:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 96607, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2033, '2019-10-17 11:13:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2034, '2019-10-17 11:14:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 41, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (2035, '2019-10-17 11:15:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/add', 0, '[类名]com.example.demo.controller.PermissionController[方法名]addPermission');
INSERT INTO `syslog` VALUES (2036, '2019-10-17 11:15:06', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/save', 15392, '[类名]com.example.demo.controller.PermissionController[方法名]savePermission');
INSERT INTO `syslog` VALUES (2037, '2019-10-17 11:15:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (2038, '2019-10-17 11:15:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/delete', 105, '[类名]com.example.demo.controller.PermissionController[方法名]delete');
INSERT INTO `syslog` VALUES (2039, '2019-10-17 11:15:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 5, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (2040, '2019-10-17 11:15:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 15, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2041, '2019-10-17 11:15:31', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (2042, '2019-10-17 11:15:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 100477, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2043, '2019-10-17 11:17:26', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 11, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2044, '2019-10-17 11:18:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 40, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2045, '2019-10-17 11:18:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 110, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2046, '2019-10-17 11:18:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2047, '2019-10-17 11:18:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/add', 0, '[类名]com.example.demo.controller.ProductController[方法名]addProduct');
INSERT INTO `syslog` VALUES (2048, '2019-10-17 11:18:53', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 7964, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2049, '2019-10-17 11:19:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2050, '2019-10-17 11:19:03', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 69, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2051, '2019-10-17 11:19:08', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2052, '2019-10-17 11:19:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 3, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2053, '2019-10-17 11:19:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 4, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2054, '2019-10-17 11:19:15', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2055, '2019-10-17 11:19:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 7, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2056, '2019-10-17 11:19:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2057, '2019-10-17 11:19:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/query', 3, '[类名]com.example.demo.controller.ProductController[方法名]query');
INSERT INTO `syslog` VALUES (2058, '2019-10-17 11:19:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/save', 43, '[类名]com.example.demo.controller.ProductController[方法名]saveProduct');
INSERT INTO `syslog` VALUES (2059, '2019-10-17 11:19:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2060, '2019-10-17 11:27:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 42, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2061, '2019-10-17 11:27:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 4, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2062, '2019-10-17 11:27:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 9, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2063, '2019-10-17 11:27:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 60, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2064, '2019-10-17 11:27:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2065, '2019-10-17 11:27:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 7, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2066, '2019-10-17 11:27:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2067, '2019-10-17 11:27:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 5, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2068, '2019-10-17 11:27:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2069, '2019-10-17 11:27:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 6, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2070, '2019-10-17 11:27:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2071, '2019-10-17 11:27:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 12, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2072, '2019-10-17 11:27:32', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2073, '2019-10-17 11:27:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 5, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2074, '2019-10-17 11:27:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2075, '2019-10-17 11:27:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 16, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2076, '2019-10-17 11:27:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2077, '2019-10-17 11:27:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 12, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2078, '2019-10-17 11:27:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 10, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2079, '2019-10-17 11:27:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 18, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2080, '2019-10-17 11:27:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2081, '2019-10-17 11:28:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 41, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2082, '2019-10-17 11:28:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/delete', 64, '[类名]com.example.demo.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES (2083, '2019-10-17 11:28:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2084, '2019-10-17 13:29:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 41, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2085, '2019-10-17 13:32:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/change', 53, '[类名]com.example.demo.controller.ProductController[方法名]change');
INSERT INTO `syslog` VALUES (2086, '2019-10-17 13:32:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 10, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2087, '2019-10-17 13:32:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/change', 5, '[类名]com.example.demo.controller.ProductController[方法名]change');
INSERT INTO `syslog` VALUES (2088, '2019-10-17 13:32:40', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 6, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2089, '2019-10-17 13:32:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/change', 17, '[类名]com.example.demo.controller.ProductController[方法名]change');
INSERT INTO `syslog` VALUES (2090, '2019-10-17 13:32:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2091, '2019-10-17 13:32:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/change', 19, '[类名]com.example.demo.controller.ProductController[方法名]change');
INSERT INTO `syslog` VALUES (2092, '2019-10-17 13:32:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 7, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2093, '2019-10-17 13:33:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 12, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2094, '2019-10-17 13:34:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 11, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2095, '2019-10-17 13:34:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 16, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2096, '2019-10-17 13:34:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/users/findAll', 11, '[类名]com.example.demo.controller.UsersController[方法名]findAllUsers');
INSERT INTO `syslog` VALUES (2097, '2019-10-17 13:34:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/role/findAll', 24, '[类名]com.example.demo.controller.RoleController[方法名]findAllRole');
INSERT INTO `syslog` VALUES (2098, '2019-10-17 13:34:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/permission/findAll', 12, '[类名]com.example.demo.controller.PermissionController[方法名]findAllPermission');
INSERT INTO `syslog` VALUES (2099, '2019-10-17 13:34:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名]com.example.demo.controller.ProductController[方法名]findAllProduct');
INSERT INTO `syslog` VALUES (2100, '2019-10-17 13:35:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2101, '2019-10-17 13:38:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 40, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2102, '2019-10-17 13:43:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findById/{id}', 21, '[类名]com.example.demo.controller.OrdersController[方法名]findOrdersById');
INSERT INTO `syslog` VALUES (2103, '2019-10-17 13:43:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 11, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2104, '2019-10-17 13:57:02', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 41, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2105, '2019-10-17 13:57:14', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findById/{id}', 16, '[类名]com.example.demo.controller.OrdersController[方法名]findOrdersById');
INSERT INTO `syslog` VALUES (2106, '2019-10-17 13:57:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 10, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2107, '2019-10-17 13:58:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 42, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2108, '2019-10-17 13:58:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findById/{id}', 13, '[类名]com.example.demo.controller.OrdersController[方法名]findOrdersById');
INSERT INTO `syslog` VALUES (2109, '2019-10-17 13:59:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 10, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2110, '2019-10-17 13:59:31', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 8, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2111, '2019-10-17 13:59:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 5, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2112, '2019-10-17 14:06:33', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 41, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2113, '2019-10-17 14:06:37', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2114, '2019-10-17 14:06:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/change', 45, '[类名]com.example.demo.controller.OrdersController[方法名]change');
INSERT INTO `syslog` VALUES (2115, '2019-10-17 14:06:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2116, '2019-10-17 14:06:44', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2117, '2019-10-17 14:06:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 94, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2118, '2019-10-17 14:07:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 15, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2119, '2019-10-17 14:07:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 67, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2120, '2019-10-17 14:07:45', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 7, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');
INSERT INTO `syslog` VALUES (2121, '2019-10-17 14:10:45', 'admin@qq.com', '127.0.0.1', '/index', 137, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2122, '2019-10-17 14:10:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findById/{id}', 13, '[类名]com.example.demo.controller.OrdersController[方法名]findOrdersById');
INSERT INTO `syslog` VALUES (2123, '2019-10-17 14:10:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/index', 87, '[类名]com.example.demo.controller.BaseController[方法名]index');
INSERT INTO `syslog` VALUES (2124, '2019-10-17 14:11:13', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/orders/findAll', 6, '[类名]com.example.demo.controller.OrdersController[方法名]findAllOrders');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES (2, '哈哈', '男', '12312312312', '军官证', '610526000000000001', '成人');
INSERT INTO `traveller` VALUES (3, '呵呵', '女', '12312312312', '残疾证', '610526999999999992', '成人');
INSERT INTO `traveller` VALUES (12, '贾科斯', '男', '18907635246', '身份证', '610526198239273028', '儿童');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin@qq.com', 'admin', '$2a$10$1NgiR4u5JLDurmpUlcHktegdF7FzUdgKrPPAbK.tB6Mj8Tr1mVIJi', '12345678900', 1);
INSERT INTO `users` VALUES (6, 'user@qq.com', 'user', '$2a$10$P43EI4NbpzZWb4Njt0gkzuXjGLFsOtetmzqGMN1.bNgQxKwuKh.XS', '12345678901', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `usersId` int(32) NOT NULL DEFAULT 0,
  `roleId` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`usersId`, `roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (1, 2);
INSERT INTO `users_role` VALUES (1, 10);

SET FOREIGN_KEY_CHECKS = 1;
