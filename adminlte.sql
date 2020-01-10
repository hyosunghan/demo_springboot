/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 127.0.0.1:3306
 Source Schema         : adminlte

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 23/10/2019 14:49:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime NULL DEFAULT NULL,
  `end` datetime NULL DEFAULT NULL,
  `allDay` tinyint(1) NULL DEFAULT 0,
  `borderColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backgroundColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (205, '出差', '2019-10-23 10:00:00', '2019-10-23 20:00:00', 0, 'rgb(60, 141, 188)', 'rgb(60, 141, 188)');
INSERT INTO `event` VALUES (206, '休假', '2019-10-15 00:00:00', '2019-10-17 00:00:00', 1, 'rgb(0, 192, 239)', 'rgb(0, 192, 239)');
INSERT INTO `event` VALUES (207, '生日', '2019-10-20 00:00:00', '1970-01-01 00:00:00', 1, 'rgb(243, 156, 18)', 'rgb(243, 156, 18)');
INSERT INTO `event` VALUES (208, '聚会', '2019-10-28 00:00:00', '1970-01-01 00:00:00', 1, 'rgb(0, 166, 90)', 'rgb(0, 166, 90)');
INSERT INTO `event` VALUES (209, '休假', '2019-10-25 00:00:00', '1970-01-01 00:00:00', 1, 'rgb(0, 192, 239)', 'rgb(0, 192, 239)');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2350 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (2267, '2019-10-17 18:33:20', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2268, '2019-10-17 18:35:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2269, '2019-10-17 18:35:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2270, '2019-10-18 09:29:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 0, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2271, '2019-10-18 18:26:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 21076, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2272, '2019-10-18 18:29:23', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 21035, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2273, '2019-10-19 23:15:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1733, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2274, '2019-10-19 23:16:09', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 62183, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2275, '2019-10-19 23:18:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 6037, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2276, '2019-10-19 23:19:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1078, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2277, '2019-10-19 23:25:12', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3781, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2278, '2019-10-19 23:28:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 180235, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2279, '2019-10-19 23:32:30', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 34257, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2280, '2019-10-19 23:39:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 370326, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2281, '2019-10-19 23:47:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 14965, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2282, '2019-10-20 00:22:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1837, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2283, '2019-10-20 00:31:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 4724, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2284, '2019-10-20 01:04:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1619, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2285, '2019-10-20 01:06:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1645, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2286, '2019-10-20 01:08:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 51208, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2287, '2019-10-20 01:13:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3017, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2288, '2019-10-20 01:24:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1813, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2289, '2019-10-20 01:27:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1708, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2290, '2019-10-20 01:28:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1729, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2291, '2019-10-20 02:20:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1862, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2292, '2019-10-20 02:38:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2662, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2293, '2019-10-20 02:38:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 934, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2294, '2019-10-20 03:12:00', 'admin@qq.com', '127.0.0.1', '/jump', 1763, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2295, '2019-10-20 03:13:56', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1727, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2296, '2019-10-20 03:19:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1726, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2297, '2019-10-20 03:21:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1684, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2298, '2019-10-20 03:33:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1922, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2299, '2019-10-20 03:36:48', 'admin@qq.com', '127.0.0.1', '/jump', 1714, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2300, '2019-10-20 03:43:58', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1798, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2301, '2019-10-20 03:45:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1043, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2302, '2019-10-20 03:46:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1386, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2303, '2019-10-20 03:50:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1952, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2304, '2019-10-20 03:56:42', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2041, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2305, '2019-10-20 03:58:55', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1975, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2306, '2019-10-20 04:01:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2949, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2307, '2019-10-20 04:03:21', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2188, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2308, '2019-10-20 04:06:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1998, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2309, '2019-10-20 04:08:49', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2091, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2310, '2019-10-20 04:12:05', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2087, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2311, '2019-10-20 04:16:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2042, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2312, '2019-10-20 04:17:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1447, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2313, '2019-10-20 04:33:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2184, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2314, '2019-10-20 04:37:51', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2019, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2315, '2019-10-20 04:40:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2471, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2316, '2019-10-20 04:41:52', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1981, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2317, '2019-10-20 04:43:01', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2086, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2318, '2019-10-20 04:45:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2294, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2319, '2019-10-20 04:47:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1992, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2320, '2019-10-20 04:54:50', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2111, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2321, '2019-10-20 05:00:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2059, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2322, '2019-10-20 05:04:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2097, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2323, '2019-10-20 05:10:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1621, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2324, '2019-10-20 05:26:59', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1085, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2325, '2019-10-20 21:32:04', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1089, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2326, '2019-10-20 21:35:16', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 8407, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2327, '2019-10-20 21:36:36', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 991, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2328, '2019-10-21 09:58:48', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2944, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2329, '2019-10-21 09:59:18', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3459, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2330, '2019-10-21 10:08:24', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2675, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2331, '2019-10-21 10:32:10', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2012, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2332, '2019-10-21 10:37:28', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 1756, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2333, '2019-10-21 10:43:19', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 4893, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2334, '2019-10-21 10:44:54', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3185, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2335, '2019-10-21 14:30:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 334, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2336, '2019-10-21 14:30:17', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 7760, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2337, '2019-10-21 14:31:41', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 4155, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2338, '2019-10-21 15:16:43', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2411, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2339, '2019-10-21 15:25:34', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3512, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2340, '2019-10-21 15:39:27', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2753, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2341, '2019-10-21 16:17:07', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2651, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2342, '2019-10-22 09:54:47', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2613, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2343, '2019-10-22 13:40:57', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3779, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2344, '2019-10-22 17:35:29', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3583, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2345, '2019-10-22 17:37:22', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2280, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2346, '2019-10-22 17:40:38', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2569, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2347, '2019-10-22 17:58:35', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2407, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2348, '2019-10-22 20:01:39', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 2540, '[类名]com.example.demo.controller.BaseController[方法名]jump');
INSERT INTO `syslog` VALUES (2349, '2019-10-23 11:21:14', 'admin@qq.com', '0:0:0:0:0:0:0:1', '/jump', 3955, '[类名]com.example.demo.controller.BaseController[方法名]jump');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin@qq.com', 'admin', '$2a$10$1NgiR4u5JLDurmpUlcHktegdF7FzUdgKrPPAbK.tB6Mj8Tr1mVIJi', '12345678900', 1);
INSERT INTO `users` VALUES (6, 'user@qq.com', 'user', '$2a$10$P43EI4NbpzZWb4Njt0gkzuXjGLFsOtetmzqGMN1.bNgQxKwuKh.XS', '12345678901', 1);
INSERT INTO `users` VALUES (7, 'test@qq.com', 'test', '$2a$10$gXZjFShsvClGOhBVozp.ZOwUgR7x/o19vFvrAZO5aLhXXHGd.8mdG', '12345678902', 1);

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
