/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 05/12/2019 17:41:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???',
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?ǳ',
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?绰???',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'chenhao', 'haohao', '15967767897', 'chenhao@qq.com');
INSERT INTO `member` VALUES ('2', '曹振光', '亮亮', '15677778888', 'guang@qq.com');
INSERT INTO `member` VALUES ('3', '寰宸晨', '环环', '13999997777', 'huan@qq.com');
INSERT INTO `member` VALUES ('4', 'xiaoming', 'mm', '13848484858', 'xiao@qq.com');
INSERT INTO `member` VALUES ('5', 'nihao', 'nn', '13388884444', 'nihao@qq.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `travellerId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('1', '1');
INSERT INTO `order_traveller` VALUES ('1', '2');
INSERT INTO `order_traveller` VALUES ('2', '3');
INSERT INTO `order_traveller` VALUES ('4', '4');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  `orderTime` datetime(0) NULL DEFAULT NULL COMMENT '?µ?ʱ?',
  `peopleCount` int(11) NULL DEFAULT NULL COMMENT '???????',
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????',
  `payType` int(11) NULL DEFAULT NULL COMMENT '֧????ʽ(0֧???? 1΢?? 2???',
  `orderStatus` int(11) NULL DEFAULT NULL COMMENT '????״̬(0δ֧?? 1??֧??)',
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??Ʒid???',
  `memberId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??Ա??ϵ??id???',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, 'hwua02', '2019-07-16 19:10:31', 2, NULL, 0, 1, '0574b9ab9d7611e9aa6e74d02bd4fd82', '2');
INSERT INTO `orders` VALUES (3, 'hwua03', '2019-07-17 19:12:40', 1, NULL, 0, 1, '0574b9ab9d7611e9aa6e74d02bd4fd82', '3');
INSERT INTO `orders` VALUES (4, 'hwua04', '2019-07-19 19:13:35', 2, NULL, 1, 1, '0574b9ab9d7611e9aa6e74d02bd4fd82', '4');
INSERT INTO `orders` VALUES (5, 'hwua05', '2019-07-20 19:14:10', 1, NULL, 0, 1, '0574b9ab9d7611e9aa6e74d02bd4fd82', '5');
INSERT INTO `orders` VALUES (6, 'hwua06', '2019-07-20 19:15:11', 1, NULL, 0, 1, '089c3dd89d7711e9aa6e74d02bd4fd82', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?',
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Ȩ???',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??Դ·??',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('430f74ba-a155-11e9-b4b3-74d02bd4fd82', 'order:deleteOrder', '/order/deleteOrders');
INSERT INTO `permission` VALUES ('7d980fa4-a152-11e9-b4b3-74d02bd4fd82', 'product:add', '/product/addProduct');
INSERT INTO `permission` VALUES ('a87a3f4e-a15b-11e9-b4b3-74d02bd4fd82', 'order:deleteOrder1', '/order/deleteOrders1.do');
INSERT INTO `permission` VALUES ('cbd32583-a152-11e9-b4b3-74d02bd4fd82', 'product:delete', '/product/deleteProducts');
INSERT INTO `permission` VALUES ('e0463b3b-a15a-11e9-b4b3-74d02bd4fd82', 'order:queryOrdersInfo', '/order/findOrderById');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??Ʒ???',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??Ʒ?',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????',
  `DepartureTime` datetime(0) NULL DEFAULT NULL COMMENT '????ʱ?',
  `productPrice` double(10, 2) NULL DEFAULT NULL COMMENT '??Ʒ?۸',
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??Ʒ???',
  `productStatus` int(11) NULL DEFAULT NULL COMMENT '??Ʒ״̬(0?ر?,1???',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `productNum`(`productNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0574b9ab9d7611e9aa6e74d02bd4fd82', 'huwa-01', '欧洲7日游', '上海', '2019-07-02 23:46:00', 20000.00, '欧洲7日游欧洲7日游欧洲7日游欧洲7日游欧洲7日游欧洲7日游欧洲7日游', 1);
INSERT INTO `product` VALUES ('089c3dd89d7711e9aa6e74d02bd4fd82', 'huwa-09', '上海迪士尼1日游', '上海', '2019-08-11 08:00:00', 800.00, '上海迪士尼1日游上海迪士尼1日游上海迪士尼1日游上海迪士尼1日游上海迪士尼1日游', 1);
INSERT INTO `product` VALUES ('1e6b78bf9d7611e9aa6e74d02bd4fd82', 'huwa-04', '马尔代夫7日游', '杭州', '2019-07-02 23:46:00', 2000.00, '马尔代夫7日游马尔代夫7日游马尔代夫7日游马尔代夫7日游马尔代夫7日游', 1);
INSERT INTO `product` VALUES ('3497e9cc9d7611e9aa6e74d02bd4fd82', 'huwa-05', '夏威夷7日游', '上海', '2019-07-07 08:35:00', 10000.00, '夏威夷7日游夏威夷7日游夏威夷7日游夏威夷7日游夏威夷7日游夏威夷7日游', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?',
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??ɫ?',
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??ɫ???',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('160d9216-a152-11e9-b4b3-74d02bd4fd82', 'productManager', '产品经理');
INSERT INTO `role` VALUES ('3253d51f-9e49-11e9-8bcf-74d02bd4fd82', 'admin', '管理员');
INSERT INTO `role` VALUES ('4b56a3e3-a152-11e9-b4b3-74d02bd4fd82', 'orderManager', '订单经理');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('7d980fa4-a152-11e9-b4b3-74d02bd4fd82', '160d9216-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('cbd32583-a152-11e9-b4b3-74d02bd4fd82', '160d9216-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('e0463b3b-a15a-11e9-b4b3-74d02bd4fd82', '160d9216-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('430f74ba-a155-11e9-b4b3-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('7d980fa4-a152-11e9-b4b3-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('a87a3f4e-a15b-11e9-b4b3-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('cbd32583-a152-11e9-b4b3-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('e0463b3b-a15a-11e9-b4b3-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('430f74ba-a155-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('a87a3f4e-a15b-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('cbd32583-a152-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `role_permission` VALUES ('e0463b3b-a15a-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?',
  `visitTime` datetime(0) NULL DEFAULT NULL COMMENT '????ʱ?',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????û?',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????ip',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????url',
  `executionTime` int(11) NULL DEFAULT NULL COMMENT 'ִ??ʱ??',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???ʷ???',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('0002f240-a179-11e9-b4b3-74d02bd4fd82', '2019-07-08 20:07:47', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 16, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('0108f7c1-a0c6-11e9-9482-74d02bd4fd82', '2019-07-07 22:46:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 37, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('01a7d225-a0c6-11e9-9482-74d02bd4fd82', '2019-07-07 22:46:30', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 19, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('01ea5030-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:04', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 35, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('023483d4-a0c6-11e9-9482-74d02bd4fd82', '2019-07-07 22:46:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 20, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('024c9955-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:06', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 8, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('0268d7ad-a179-11e9-b4b3-74d02bd4fd82', '2019-07-08 20:07:51', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 12, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('0293130541c211da51e7a749222e7e85', '2019-12-02 13:52:25', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/7/10', 7, 'findAll');
INSERT INTO `syslog` VALUES ('02a5167a-9ebc-11e9-a715-74d02bd4fd82', '2019-07-05 08:29:54', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 234, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('02d6aea5-9e3a-11e9-8bcf-74d02bd4fd82', '2019-07-04 16:59:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 196, 'findAllOrders');
INSERT INTO `syslog` VALUES ('02f15a73-a15d-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:47:26', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/addPermissionToRole.do', 13, 'addPermissionToRole');
INSERT INTO `syslog` VALUES ('02f68aa6-a15d-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:47:26', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/addPermissionToRole.do', 27, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('039212f5-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:07', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 19, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('03ad6700-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:09', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/deletePermission.do', 11, 'deletePermissionById');
INSERT INTO `syslog` VALUES ('03afb0f8-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:09', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/deletePermission.do', 8, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('03b697f4-9ec0-11e9-a715-74d02bd4fd82', '2019-07-05 08:58:34', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 156, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('03de65b9-a5de-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:20:58', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 60, 'queryPage');
INSERT INTO `syslog` VALUES ('04237fa6-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:08', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 19, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('044f2e57-a0c6-11e9-9482-74d02bd4fd82', '2019-07-07 22:46:35', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 43, 'findAllOrders');
INSERT INTO `syslog` VALUES ('04789636-0f59-11ea-9426-f48e38b1de28', '2019-11-25 15:55:59', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 1, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('04a3ff9c-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:10', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 8, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('04c14895-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:09', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 11, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('04ebc11b-9ec0-11e9-a715-74d02bd4fd82', '2019-07-05 08:58:36', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 14, 'queryRoleById');
INSERT INTO `syslog` VALUES ('05554d60-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:10', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 18, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('0564934e-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:12', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/deletePermission.do', 7, 'deletePermissionById');
INSERT INTO `syslog` VALUES ('0566b636-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:12', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/deletePermission.do', 6, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('05e4d9d573ecf345f5f6bbb99cf7eee4', '2019-12-03 11:50:04', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 649, 'login');
INSERT INTO `syslog` VALUES ('06b31134-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:14', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 15, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('0715529f-9e3a-11e9-8bcf-74d02bd4fd82', '2019-07-04 16:59:28', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrderById', 34, 'findOrderByOrderId');
INSERT INTO `syslog` VALUES ('074c73fc-a0c6-11e9-9482-74d02bd4fd82', '2019-07-07 22:46:40', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrderById', 10, 'findOrderByOrderId');
INSERT INTO `syslog` VALUES ('07982708-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:22:37', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 121, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('07b01288-a15b-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:33:15', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 21, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('0840f26f-9ebf-11e9-a715-74d02bd4fd82', '2019-07-05 08:51:33', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 14, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('086a6c44c53904b6ca134e7053713c1c', '2019-12-02 13:52:23', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/5/10', 56, 'findAll');
INSERT INTO `syslog` VALUES ('0960e3c80497da0842b0d707035557ad', '2019-12-02 13:52:15', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 7, 'findAll');
INSERT INTO `syslog` VALUES ('09acf7bbd1fc80c50e10249e7a0875fd', '2019-12-02 13:52:21', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/3/10', 7, 'findAll');
INSERT INTO `syslog` VALUES ('0b0239d5-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:22:43', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 23, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('0bc451276427ad6b5f7c27dde0d9d54b', '2019-12-02 13:38:43', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 32, 'list');
INSERT INTO `syslog` VALUES ('0c15eab0-a5df-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:28:21', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 45, 'findAllOrders');
INSERT INTO `syslog` VALUES ('0c7095f7-a179-11e9-b4b3-74d02bd4fd82', '2019-07-08 20:08:08', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 13, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('0da926a3-9ebf-11e9-a715-74d02bd4fd82', '2019-07-05 08:51:42', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 12, 'queryRoleById');
INSERT INTO `syslog` VALUES ('0e04a924f4ab9d64a4605ffc50569da2', '2019-12-02 13:41:56', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/5', 9, 'findById');
INSERT INTO `syslog` VALUES ('0e3392f0-0f59-11ea-9426-f48e38b1de28', '2019-11-25 15:56:15', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 4, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('0f8fbf02-a15a-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:26:19', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 15, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('118b90e6-0f5c-11ea-9426-f48e38b1de28', '2019-11-25 16:17:49', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 15, 'findAllOrders');
INSERT INTO `syslog` VALUES ('1235edb4dba36475477f7179f71bcd77', '2019-12-02 13:34:58', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/login.do', 632, 'login');
INSERT INTO `syslog` VALUES ('14b62df4-9edf-11e9-a715-74d02bd4fd82', '2019-07-05 12:40:57', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 168, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('15c35c25-9edf-11e9-a715-74d02bd4fd82', '2019-07-05 12:40:59', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 5, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('15c55b9c-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:23:01', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 36, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('160de038-a152-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:29:14', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 3, 'saveRole');
INSERT INTO `syslog` VALUES ('160fdc0f-a152-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:29:14', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 5, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('16828b13-0f5c-11ea-9426-f48e38b1de28', '2019-11-25 16:17:58', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 5, 'queryPage');
INSERT INTO `syslog` VALUES ('171df8ca-9e6d-11e9-8afe-74d02bd4fd82', '2019-07-04 23:04:59', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 139, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('179df715-0f5a-11ea-9426-f48e38b1de28', '2019-11-25 16:03:41', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 22, 'findAllOrders');
INSERT INTO `syslog` VALUES ('17a9dff8e98baa0e1f832729c4dcff4d', '2019-12-02 13:41:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/close', 169, 'get');
INSERT INTO `syslog` VALUES ('18b6a026-9e6d-11e9-8afe-74d02bd4fd82', '2019-07-04 23:05:01', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 19, 'queryRoleById');
INSERT INTO `syslog` VALUES ('18be2304-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:23', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 32, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('196045a2-9ffa-11e9-9b74-74d02bd4fd82', '2019-07-06 22:26:53', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 133, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('19e8cc78fe184bb3144e04099336c232', '2019-12-02 13:38:39', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 11, 'userList');
INSERT INTO `syslog` VALUES ('1a4c55d3-9e50-11e9-8bcf-74d02bd4fd82', '2019-07-04 19:37:29', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 6, 'savePermission');
INSERT INTO `syslog` VALUES ('1a50c2b4-9e50-11e9-8bcf-74d02bd4fd82', '2019-07-04 19:37:29', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 16, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('1ad5f7c0-a135-11e9-b4b3-74d02bd4fd82', '2019-07-08 12:01:47', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 118, 'queryPage');
INSERT INTO `syslog` VALUES ('1b31f911-9edf-11e9-a715-74d02bd4fd82', '2019-07-05 12:41:08', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 41, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('1b5552f4-9f18-11e9-a715-74d02bd4fd82', '2019-07-05 19:29:10', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryAllUsers', 104, 'queryPqgeUsers');
INSERT INTO `syslog` VALUES ('1bec87f50a9e7df4cb0d326186728e2c', '2019-12-02 14:53:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/login.do', 26, 'login');
INSERT INTO `syslog` VALUES ('1c0c0c33-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:23:11', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 9, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('1c9b453a-9f18-11e9-a715-74d02bd4fd82', '2019-07-05 19:29:12', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryUserByUserId', 22, 'queryUserByUserId');
INSERT INTO `syslog` VALUES ('1cb2d254-9edf-11e9-a715-74d02bd4fd82', '2019-07-05 12:41:11', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 16, 'queryRoleById');
INSERT INTO `syslog` VALUES ('1d2f496b-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 38, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('20156e94-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:23:18', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 15, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('22026760-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:39', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 19, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('222794d58611f5b77a57e6bed7c9c72a', '2019-12-02 13:52:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/2/10', 8, 'findAll');
INSERT INTO `syslog` VALUES ('2333488f-a5e0-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:36:09', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 47, 'findAllOrders');
INSERT INTO `syslog` VALUES ('2365bc9d7fc97675292690d5b623ee5e', '2019-12-02 13:52:41', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/9/10', 10, 'findAll');
INSERT INTO `syslog` VALUES ('23fb7fa6-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:42', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 4, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('23fe4681288901fa50c8b29e11899585', '2019-12-02 13:48:25', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 38, 'findAll');
INSERT INTO `syslog` VALUES ('240f53e8-a5e0-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:36:11', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 41, 'findAllOrders');
INSERT INTO `syslog` VALUES ('24fbe080-9e6b-11e9-8afe-74d02bd4fd82', '2019-07-04 22:51:03', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 138, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('254678e6-a5e0-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:36:13', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 29, 'findAllOrders');
INSERT INTO `syslog` VALUES ('255bff1d-9f12-11e9-a715-74d02bd4fd82', '2019-07-05 18:46:30', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryAllUsers', 145, 'queryPqgeUsers');
INSERT INTO `syslog` VALUES ('26cf2dfa-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:23:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 8, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('271d3db1-9f12-11e9-a715-74d02bd4fd82', '2019-07-05 18:46:33', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryAllRoles', 11, 'queryAllRoles');
INSERT INTO `syslog` VALUES ('274ac1b1-a5de-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:21:57', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 10, 'queryPage');
INSERT INTO `syslog` VALUES ('2846d4e83e46ccea67566f076d2d5306', '2019-12-03 13:49:41', 'frank', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 105, 'findAll');
INSERT INTO `syslog` VALUES ('285570767624fa2d2cd3f21ad72b2726', '2019-12-02 13:41:26', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 4, 'productList');
INSERT INTO `syslog` VALUES ('2859f272-a69f-11e9-940f-74d02bd4fd82', '2019-07-15 09:23:32', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 14, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('28f3b257-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:50', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 13, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('290410e7-a5de-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:22:00', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrdersByProductId', 32, 'findOrdersByProductId');
INSERT INTO `syslog` VALUES ('291ac2d7-9f12-11e9-a715-74d02bd4fd82', '2019-07-05 18:46:36', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/addRoleToUser.do', 11, 'addRoleToUser');
INSERT INTO `syslog` VALUES ('291d33e0-9f12-11e9-a715-74d02bd4fd82', '2019-07-05 18:46:36', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/addRoleToUser.do', 8, 'queryPqgeUsers');
INSERT INTO `syslog` VALUES ('2b984f4d-9f12-11e9-a715-74d02bd4fd82', '2019-07-05 18:46:40', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryUserByUserId', 23, 'queryUserByUserId');
INSERT INTO `syslog` VALUES ('2d13be6f-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:29', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 150, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('2d6f0d52a6125a7881942a42ba3777b1', '2019-12-03 15:54:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 3, 'userList');
INSERT INTO `syslog` VALUES ('2de81469-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:05:59', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 21, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('2e1e616898f50500d8e99ad72821fb14', '2019-12-02 15:57:55', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 54, 'userList');
INSERT INTO `syslog` VALUES ('2e34a07c-9e49-11e9-8bcf-74d02bd4fd82', '2019-07-04 18:47:56', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 130, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('2e8a374b-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:31', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 3, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('2f16a1fd58700e99298220bc572777ec', '2019-12-02 13:38:46', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/permission/permission-list', 21, 'list');
INSERT INTO `syslog` VALUES ('2f8a50c8ade75f916cc7621538b54b3c', '2019-12-02 14:37:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 87, 'findAll');
INSERT INTO `syslog` VALUES ('2f9fa89e8f5389b21fd86d7302339dd9', '2019-12-03 13:47:51', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 29, 'userList');
INSERT INTO `syslog` VALUES ('30a7dfaedca6c19d13d6e892f09e7302', '2019-12-02 13:42:06', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 6, 'userList');
INSERT INTO `syslog` VALUES ('318d7813-0f59-11ea-9426-f48e38b1de28', '2019-11-25 15:57:15', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 3, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('32080c5f-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:06:06', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 13, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('322d571e-0f5b-11ea-9426-f48e38b1de28', '2019-11-25 16:11:35', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findOrderById', 13, 'findOrderByOrderId');
INSERT INTO `syslog` VALUES ('32550da4-9e49-11e9-8bcf-74d02bd4fd82', '2019-07-04 18:48:03', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 8, 'saveRole');
INSERT INTO `syslog` VALUES ('3258b731-9e49-11e9-8bcf-74d02bd4fd82', '2019-07-04 18:48:03', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 13, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('329f502a-a5de-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:22:16', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 8, 'queryPage');
INSERT INTO `syslog` VALUES ('32b8265f-a15c-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:41:37', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 56, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('332d91fd-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:39', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 12, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('33c74669-9e6d-11e9-8afe-74d02bd4fd82', '2019-07-04 23:05:47', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 19, 'queryRoleById');
INSERT INTO `syslog` VALUES ('346874c4-a15c-11e9-b4b3-74d02bd4fd82', '2019-07-08 16:41:40', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 6, 'queryRoleById');
INSERT INTO `syslog` VALUES ('34a0a5ee-a5de-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:22:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 20, 'queryPage');
INSERT INTO `syslog` VALUES ('358ad7a8-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:06:12', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 9, 'queryRoleById');
INSERT INTO `syslog` VALUES ('359c783c-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:43', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/findById.do', 3, 'queryPermissionById');
INSERT INTO `syslog` VALUES ('361e8f198228a09ff913d4006d24f50e', '2019-12-03 13:37:52', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 633, 'login');
INSERT INTO `syslog` VALUES ('369bb3fba829214836bb64a6795d782c', '2019-12-03 15:55:05', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/save.do', 79, 'save');
INSERT INTO `syslog` VALUES ('36bca517b36f48c4312e8264253eb1a5', '2019-12-02 14:37:51', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 8, 'userList');
INSERT INTO `syslog` VALUES ('37962cc4-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:46', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 13, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('37a12489c1da79ce47ab6b5dac34f2bb', '2019-12-02 13:36:32', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 8, 'findById');
INSERT INTO `syslog` VALUES ('37d686ffd62a7467562ff6d6a8ac9c58', '2019-12-05 17:26:36', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 20, 'productList');
INSERT INTO `syslog` VALUES ('37d70048606827ef71dc9189af96c376', '2019-12-02 13:41:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/open', 139, 'put');
INSERT INTO `syslog` VALUES ('37e018bb-9e6c-11e9-8afe-74d02bd4fd82', '2019-07-04 22:58:44', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 126, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('3859928e-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:06:16', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 9, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('38854b34-9ede-11e9-a715-74d02bd4fd82', '2019-07-05 12:34:48', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/queryAll.do', 12, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('38e7a6abfbc4dd25772baaad779faddc', '2019-12-02 13:41:07', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/detail/a151fe9f-9f1e-11e9-a715-74d02bd4fd82', 8, 'detail');
INSERT INTO `syslog` VALUES ('391011ae-9e6c-11e9-8afe-74d02bd4fd82', '2019-07-04 22:58:46', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/findById.do', 14, 'queryRoleById');
INSERT INTO `syslog` VALUES ('3930e66a51f24477d862774d71d51c9c', '2019-12-02 13:41:34', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 33, 'orderList');
INSERT INTO `syslog` VALUES ('3a68e90c-a5db-11e9-8d7d-74d02bd4fd82', '2019-07-14 10:01:01', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 44, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('3c552c3e-9f14-11e9-a715-74d02bd4fd82', '2019-07-05 19:01:27', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryAllUsers', 126, 'queryPqgeUsers');
INSERT INTO `syslog` VALUES ('3d37afbc06d48479c91893fff227ef58', '2019-12-02 13:38:49', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 2, 'userList');
INSERT INTO `syslog` VALUES ('3e293e22-0f57-11ea-9426-f48e38b1de28', '2019-11-25 15:43:17', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 27, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('3e2f20c9344629946c2029c80abefc17', '2019-12-02 13:26:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 100, 'findAll');
INSERT INTO `syslog` VALUES ('3e32f3ed-9f14-11e9-a715-74d02bd4fd82', '2019-07-05 19:01:30', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryUserByUserId', 18, 'queryUserByUserId');
INSERT INTO `syslog` VALUES ('3e533d6b-a5d8-11e9-8d7d-74d02bd4fd82', '2019-07-14 09:39:39', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/product/queryPageInfo', 167, 'queryPage');
INSERT INTO `syslog` VALUES ('3e93ff8b-9e49-11e9-8bcf-74d02bd4fd82', '2019-07-04 18:48:23', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 7, 'saveRole');
INSERT INTO `syslog` VALUES ('3e981e4a-9e49-11e9-8bcf-74d02bd4fd82', '2019-07-04 18:48:23', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/saveRole.do', 15, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('3ff4c77c-9e50-11e9-8bcf-74d02bd4fd82', '2019-07-04 19:38:32', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 7, 'savePermission');
INSERT INTO `syslog` VALUES ('3ff9d09e-9e50-11e9-8bcf-74d02bd4fd82', '2019-07-04 19:38:32', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 8, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('4023505e1c5fbd27b5110656c32c7ad8', '2019-12-02 13:41:15', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/detail/3253d51f-9e49-11e9-8bcf-74d02bd4fd82', 10, 'detail');
INSERT INTO `syslog` VALUES ('403ab96df5f8aa1b4ddaa729bf6dda9f', '2019-12-02 15:57:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 622, 'login');
INSERT INTO `syslog` VALUES ('40e8c27f-a154-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:44:45', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 36, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('41140b76-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:06:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 8, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('4153dfe6-9f04-11e9-a715-74d02bd4fd82', '2019-07-05 17:07:04', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryAllUsers', 89, 'queryPqgeUsers');
INSERT INTO `syslog` VALUES ('41fc98986243c91600d517d29b794cd2', '2019-12-02 15:59:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 88, 'findAll');
INSERT INTO `syslog` VALUES ('424ee76e-a154-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:44:47', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 25, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('425106e1-a5d8-11e9-8d7d-74d02bd4fd82', '2019-07-14 09:39:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/order/findAllOrders', 82, 'findAllOrders');
INSERT INTO `syslog` VALUES ('42ad9d35-9ff7-11e9-9b74-74d02bd4fd82', '2019-07-06 22:06:34', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 16, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('4310fb5f-a155-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:51:58', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 16, 'savePermission');
INSERT INTO `syslog` VALUES ('43139379-a155-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:51:58', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/permission/savePermission.do', 7, 'queryPagePermission');
INSERT INTO `syslog` VALUES ('43145b27-9f04-11e9-a715-74d02bd4fd82', '2019-07-05 17:07:07', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/user/queryUserByUserId', 21, 'queryUserByUserId');
INSERT INTO `syslog` VALUES ('43404fd7-a154-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:44:49', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 7, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('4395df66175e0395482d6b615e2b3261', '2019-12-02 13:36:11', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 14, 'findById');
INSERT INTO `syslog` VALUES ('43981c63-0f59-11ea-9426-f48e38b1de28', '2019-11-25 15:57:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 26, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('439952b4-a14c-11e9-b4b3-74d02bd4fd82', '2019-07-08 14:47:33', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 247, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('440be032-a154-11e9-b4b3-74d02bd4fd82', '2019-07-08 15:44:50', 'zhangsan', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/syslog/findAll.do', 10, 'queryPageSyslog');
INSERT INTO `syslog` VALUES ('447768e4-0f57-11ea-9426-f48e38b1de28', '2019-11-25 15:43:27', 'chenhao', '0:0:0:0:0:0:0:1', '/crm02_war_exploded/role/queryAllRole.do', 12, 'queryPageInfo');
INSERT INTO `syslog` VALUES ('471e104decb7211d6c50ea3810535ece', '2019-12-02 13:41:26', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/open', 299, 'put');
INSERT INTO `syslog` VALUES ('494698eaf293fcae22a196ad7967be2d', '2019-12-02 19:49:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 3, 'login');
INSERT INTO `syslog` VALUES ('49f9a91b40ea628437fcea9857b0665b', '2019-12-02 13:26:09', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/login.do', 27, 'login');
INSERT INTO `syslog` VALUES ('4ae42a000a10dfe46b7a2afdac59316b', '2019-12-02 13:54:00', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 5, 'findById');
INSERT INTO `syslog` VALUES ('4d74eb5b5d066365e0dbb2c5b292a487', '2019-12-02 16:02:04', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 12, 'login');
INSERT INTO `syslog` VALUES ('4e1bc8eaa97352302e5d1f971e4143bd', '2019-12-02 13:53:56', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 31, 'orderList');
INSERT INTO `syslog` VALUES ('540740e960a121c97d9eaa43592bc028', '2019-12-02 13:52:44', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/8/10', 9, 'findAll');
INSERT INTO `syslog` VALUES ('5485a7c37cd55903d09af035b3f9fd52', '2019-12-03 15:55:35', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/addRolesToUser', 265, 'addRolesToUser');
INSERT INTO `syslog` VALUES ('5b0d3b4a54840971edac72f7da2bf291', '2019-12-02 13:36:58', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 18, 'findById');
INSERT INTO `syslog` VALUES ('5d5c1cf539b59679dbe03051255dddff', '2019-12-02 16:00:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 616, 'login');
INSERT INTO `syslog` VALUES ('5f49cf89a4b6231ac086ce6ba2d71ee7', '2019-12-02 13:52:18', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 6, 'findAll');
INSERT INTO `syslog` VALUES ('60fc0eaa68200787fb2aaf72b80ec2a9', '2019-12-02 16:09:19', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 656, 'login');
INSERT INTO `syslog` VALUES ('636033f0cef365429154315784bd74ba', '2019-12-05 17:26:51', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/search', 50, 'search');
INSERT INTO `syslog` VALUES ('675a1f7dd0abbcb6ea5f045cb11bbca5', '2019-12-02 16:02:08', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 16, 'userList');
INSERT INTO `syslog` VALUES ('67ab4bb4ede65aac4d3420ef226d5f6b', '2019-12-02 13:32:54', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 28, 'orderList');
INSERT INTO `syslog` VALUES ('684be8144922fa78b5ca00438d3ce608', '2019-12-03 13:48:08', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/detail/c032874a-a12a-11e9-b4b3-74d02bd4fd82', 14, 'detail');
INSERT INTO `syslog` VALUES ('687274ebc2d859d068d876418e3fb8b0', '2019-12-02 16:01:40', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 15, 'login');
INSERT INTO `syslog` VALUES ('693ec88e4ddf1c61cc51d4441df0751e', '2019-12-02 13:52:22', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/4/10', 4, 'findAll');
INSERT INTO `syslog` VALUES ('6cbb8610a7109ab94bc2cfdae76d136b', '2019-12-02 13:31:16', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 23, 'orderList');
INSERT INTO `syslog` VALUES ('6d67b839c7919c8aa11c942f31ec15e7', '2019-12-05 17:34:51', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 318, 'list');
INSERT INTO `syslog` VALUES ('724683bb1badbf7e263e0507071d8ff2', '2019-12-03 13:47:42', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 10, 'login');
INSERT INTO `syslog` VALUES ('729c38b0c4fcc843bec6d99bdc9f5707', '2019-12-05 17:34:46', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 24, 'userList');
INSERT INTO `syslog` VALUES ('72cfc19dc9372ba4517bec9bb38bb868', '2019-12-05 17:34:48', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/detail/6533ef9aed719225bf974342a2138f53', 21, 'detail');
INSERT INTO `syslog` VALUES ('73a2de168992359c1c3b3b6c1fb7d4e7', '2019-12-02 16:01:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 7, 'login');
INSERT INTO `syslog` VALUES ('74dd7981b648c3b2fd137c7db94cea88', '2019-12-02 13:31:24', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 23, 'orderList');
INSERT INTO `syslog` VALUES ('80091c1d4b6d4385ae266c823d9ad995', '2019-12-02 13:38:36', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 47, 'orderList');
INSERT INTO `syslog` VALUES ('8070f14d16fcb9f9d33178a17958d1ab', '2019-12-02 13:41:45', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 23, 'orderList');
INSERT INTO `syslog` VALUES ('80cc249857a7ddf4d5c1770d5a9a99f8', '2019-12-03 15:55:35', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 2, 'userList');
INSERT INTO `syslog` VALUES ('80e00307779100b40a35a5edfac1cd30', '2019-12-02 13:52:24', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/6/10', 12, 'findAll');
INSERT INTO `syslog` VALUES ('844a6168a8fa065482ee20959ca17ac9', '2019-12-02 13:52:25', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/8/10', 7, 'findAll');
INSERT INTO `syslog` VALUES ('846e2e589d6ba656339d6ec385b141cc', '2019-12-02 13:38:22', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 8, 'findById');
INSERT INTO `syslog` VALUES ('857c1270ad28ae21e4ccad6dd5717a5a', '2019-12-05 17:26:42', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/search', 168, 'search');
INSERT INTO `syslog` VALUES ('89e25c971f666b155b6893c8004b63cf', '2019-12-02 16:02:06', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 9, 'list');
INSERT INTO `syslog` VALUES ('8de3c7f81fffe4568e8fd0f342f5a2c8', '2019-12-02 14:53:32', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 92, 'list');
INSERT INTO `syslog` VALUES ('96789cddde96341469e41ecb7c043a18', '2019-12-02 13:41:22', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 25, 'productList');
INSERT INTO `syslog` VALUES ('9b0e25abf8d151b9526736ca5d349d10', '2019-12-02 13:26:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 126, 'orderList');
INSERT INTO `syslog` VALUES ('9ed36659b84e4ae56fabd28e78209c6a', '2019-12-02 13:31:18', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 21, 'orderList');
INSERT INTO `syslog` VALUES ('9f8b252a91eab9f73d6002abbf343a41', '2019-12-02 13:41:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/permission/permission-list', 4, 'list');
INSERT INTO `syslog` VALUES ('a26adf680b48fd4a03f064e3f7bd1e15', '2019-12-02 13:52:39', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/10/10', 13, 'findAll');
INSERT INTO `syslog` VALUES ('a5cd0f0f22058f86e49b49f0fa916eda', '2019-12-02 15:00:42', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 10, 'userList');
INSERT INTO `syslog` VALUES ('a6083491c11a385e1b18096b81d81db7', '2019-12-02 14:37:34', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/login.do', 641, 'login');
INSERT INTO `syslog` VALUES ('ad57bed5065d99670ad528cfa768b2f4', '2019-12-03 13:49:12', 'frank', '0:0:0:0:0:0:0:1', '/crm/login.do', 7, 'login');
INSERT INTO `syslog` VALUES ('af24a25ae2e2dd0e8b4b1913b6ce0799', '2019-12-02 13:31:24', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 28, 'orderList');
INSERT INTO `syslog` VALUES ('b4cfe9cb3dad8df94c41e39bb75925a8', '2019-12-02 16:09:23', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 21, 'userList');
INSERT INTO `syslog` VALUES ('b731423e5c4260106a03b376eec7175d', '2019-12-02 13:26:15', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 31, 'userList');
INSERT INTO `syslog` VALUES ('b75e2a92075dd0761e064de1d3f76c55', '2019-12-02 13:35:03', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/1/6', 119, 'orderList');
INSERT INTO `syslog` VALUES ('bae2264facc63b18268268af77b022ab', '2019-12-02 13:41:14', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 5, 'list');
INSERT INTO `syslog` VALUES ('bb7a1537d55dbd47309230b1da21de6c', '2019-12-02 13:37:18', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 6, 'findById');
INSERT INTO `syslog` VALUES ('bf33c0a2c03e9f4f8e6d4dbbc98efc22', '2019-12-03 15:55:22', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 5, 'userList');
INSERT INTO `syslog` VALUES ('c33469b53022238d3f7b105954ff4256', '2019-12-05 13:44:16', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 67, 'productList');
INSERT INTO `syslog` VALUES ('c65b330e6842eb3d3f26e60fb0803edc', '2019-12-02 16:12:41', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/1/10', 16, 'findAll');
INSERT INTO `syslog` VALUES ('c82161ccebba4d451be6d29cba0053df', '2019-12-03 15:55:28', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-role-add/6533ef9aed719225bf974342a2138f53', 18, 'userRoleAdd');
INSERT INTO `syslog` VALUES ('c9d80cf2daa80374a375c145e34b2169', '2019-12-02 13:52:28', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/9/10', 11, 'findAll');
INSERT INTO `syslog` VALUES ('cd14fe0a828aa7139de6052164c9aca8', '2019-12-02 13:31:22', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 16, 'orderList');
INSERT INTO `syslog` VALUES ('cd33d10a7518795ea98ff7ef7a368db6', '2019-12-02 13:41:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 2, 'productList');
INSERT INTO `syslog` VALUES ('d1c0142a0b0633fb5358f68f8609e49e', '2019-12-02 13:52:49', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/sysLog/findAll/7/10', 10, 'findAll');
INSERT INTO `syslog` VALUES ('d5827c20f2a5c332b9e3b36ade8a4c6a', '2019-12-02 13:31:20', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/order-list/0/6', 35, 'orderList');
INSERT INTO `syslog` VALUES ('dbfc901ee2d5e63144c378b05497a76f', '2019-12-02 16:12:39', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 10, 'login');
INSERT INTO `syslog` VALUES ('dca20947ca61f00907985264743c8933', '2019-12-02 13:35:06', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 8, 'findById');
INSERT INTO `syslog` VALUES ('e2219edcf2b0e9912ffccbf7adc412fb', '2019-12-05 17:34:59', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/role/detail/3253d51f-9e49-11e9-8bcf-74d02bd4fd82', 11, 'detail');
INSERT INTO `syslog` VALUES ('e7a064cbee8e38c0dc44e9a5c5c3e667', '2019-12-02 15:59:29', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/login.do', 11, 'login');
INSERT INTO `syslog` VALUES ('e84084e8fe90c7a89ac89130dc0cb226', '2019-12-02 14:38:16', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 8, 'userList');
INSERT INTO `syslog` VALUES ('e9fd4ab534df5ca944e86b47ceb618e5', '2019-12-03 16:08:40', 'liwei', '0:0:0:0:0:0:0:1', '/crm/role/role-list/1/6', 132, 'list');
INSERT INTO `syslog` VALUES ('eb8a8d81f8d7082c7571376ca0143206', '2019-12-02 13:41:31', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/product/product-list', 4, 'productList');
INSERT INTO `syslog` VALUES ('ec3486ab917cbf016d0282aa42be2cff', '2019-12-03 13:48:02', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/detail/ab07416d-a153-11e9-b4b3-74d02bd4fd82', 24, 'detail');
INSERT INTO `syslog` VALUES ('ed85d6b53abc518d866b8bdb33ed92d2', '2019-12-03 15:54:25', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/user/user-list', 46, 'userList');
INSERT INTO `syslog` VALUES ('f02d952fe05bd965f244f3cde7b71372', '2019-12-02 13:41:52', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/3', 6, 'findById');
INSERT INTO `syslog` VALUES ('fac83ec2e504119a75568dc61ecfbb10', '2019-12-02 13:41:35', 'chenhao', '0:0:0:0:0:0:0:1', '/crm/orders/findById/2', 12, 'findById');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?Ա',
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?绰???',
  `credentialsType` int(11) NULL DEFAULT NULL COMMENT '֤?????? 0????֤ 1???? 2????֤',
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '֤?????',
  `travellerType` int(11) NULL DEFAULT NULL COMMENT '?ÿ?????0???? 1?',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '小红', '女', '15799993333', 0, '43434341414141414151', 0);
INSERT INTO `traveller` VALUES ('2', '小明', '男', '15799993334', 0, '43434341414141414152', 0);
INSERT INTO `traveller` VALUES ('3', '小军', '男', '15799993335', 0, '43434341414141414153', 1);
INSERT INTO `traveller` VALUES ('4', '小黄', '女', '15799993336', 0, '43434341414141414154', 1);
INSERT INTO `traveller` VALUES ('5', '小蔡', '女', '15799993337', 0, '43434341414141414155', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'email',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'username',
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'password',
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'phoneNum',
  `STATUS` int(11) NULL DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('6533ef9aed719225bf974342a2138f53', '573803837@qq.com', 'liwei', 'cf35ed95c6ce3e5ece7b3cdfb0e061e0', '', NULL);
INSERT INTO `users` VALUES ('a151fe9f-9f1e-11e9-a715-74d02bd4fd82', '123456@qq.com', 'chenhao', '1e6e0f1a82472653d010b775fff3a4f5', '13456985666', 1);
INSERT INTO `users` VALUES ('ab07416d-a153-11e9-b4b3-74d02bd4fd82', '123125@qq.com', 'zhangsan', 'bab3f3fba4216ffcc5146bf9f5916e5a', '13337778889', 1);
INSERT INTO `users` VALUES ('c032874a-a12a-11e9-b4b3-74d02bd4fd82', '123124@qq.com', 'frank', 'fe760e475995aa44e053071ec9e7da33', '13456985777', 1);
INSERT INTO `users` VALUES ('d4016ec6-ccac-44fc-8512-ab8b051c4b2f', '111@163.com', '赵煜东', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('6533ef9aed719225bf974342a2138f53', '160d9216-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `users_role` VALUES ('ab07416d-a153-11e9-b4b3-74d02bd4fd82', '160d9216-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `users_role` VALUES ('a151fe9f-9f1e-11e9-a715-74d02bd4fd82', '3253d51f-9e49-11e9-8bcf-74d02bd4fd82');
INSERT INTO `users_role` VALUES ('6533ef9aed719225bf974342a2138f53', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `users_role` VALUES ('ab07416d-a153-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');
INSERT INTO `users_role` VALUES ('c032874a-a12a-11e9-b4b3-74d02bd4fd82', '4b56a3e3-a152-11e9-b4b3-74d02bd4fd82');

SET FOREIGN_KEY_CHECKS = 1;
