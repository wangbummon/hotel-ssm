/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : ssm_hotel

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 29/03/2022 01:08:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '管理部', '河南省郑州市中原区国家大学科技园东区', '2022-03-11 03:27:15', '人事给我招俩研发');
INSERT INTO `sys_dept` VALUES (2, '人事部', '河南省郑州市二七区二七广场', '2022-03-12 15:27:19', '公关去宣传一下招人');
INSERT INTO `sys_dept` VALUES (3, '公关部', '河南省郑州市金水区龙子湖', '2022-03-13 03:27:24', '财务多开点工资');
INSERT INTO `sys_dept` VALUES (4, '财务部', '河南省郑州市上街区明珠公馆', '2022-03-13 03:27:24', '工程部干不好怎么给你们开高薪');
INSERT INTO `sys_dept` VALUES (5, '工程部', '河南省郑州市荥阳市郑上路81号', '2022-03-15 10:27:32', '研发部开发这么慢我们怎么去现场实施');
INSERT INTO `sys_dept` VALUES (8, '研发部', '就不告诉你', '2022-03-16 12:21:40', '我累了');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限菜单编号',
  `parent_id` int NULL DEFAULT NULL COMMENT '父级菜单编号',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型(菜单为menu，权限为permission)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `href` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spread` int NULL DEFAULT NULL COMMENT '是否展开（1-展开 2-折叠）',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '_self' COMMENT '打开方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (2, 0, 'menu', '酒店管理', NULL, 'fa fa-hospital-o', NULL, 1, '_self');
INSERT INTO `sys_permission` VALUES (3, 0, 'menu', '系统管理', NULL, 'fa fa-cog', NULL, 1, '_self');
INSERT INTO `sys_permission` VALUES (4, 3, 'menu', '部门管理', NULL, 'fa fa-group', '/admin/deptManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (5, 3, 'menu', '用户管理', NULL, 'fa fa-user-o', '/admin/usersManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (6, 3, 'menu', '角色管理', NULL, 'fa fa-user', '/admin/roleManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (7, 3, 'menu', '权限管理', NULL, 'fa fa-address-card', '/admin/permissionManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (8, 2, 'menu', '房型管理', NULL, 'fa fa-institution', '/admin/roomTypeManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (9, 2, 'menu', '房间管理', NULL, 'fa fa-hotel', '/admin/roomManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (24, 2, 'menu', '楼层管理', '', 'fa fa-bank', '/admin/floorManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (25, 27, 'menu', '预订管理', '', 'fa fa-money', '/admin/ordersManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (26, 27, 'menu', '入住管理', '', 'fa fa-check-square-o', '/admin/checkinManager', 2, '_self');
INSERT INTO `sys_permission` VALUES (27, 0, 'menu', '订单管理', '', 'fa fa-list-alt', '', 1, '_self');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色代码',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_USER', '系统用户', '用户必须拥有该角色才能进入系统');
INSERT INTO `sys_role` VALUES (2, 'ROLE_SUPER', '超级管理员', '超级管理员角色，拥有所有的权限');
INSERT INTO `sys_role` VALUES (7, 'ROLE_SYSTEM', '系统管理员', '只拥有系统管理的权限');

-- ----------------------------
-- Table structure for sys_role_permisson
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permisson`;
CREATE TABLE `sys_role_permisson`  (
  `rid` int NULL DEFAULT NULL COMMENT '角色编号',
  `pid` int NULL DEFAULT NULL COMMENT '菜单权限编号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permisson
-- ----------------------------
INSERT INTO `sys_role_permisson` VALUES (7, 3);
INSERT INTO `sys_role_permisson` VALUES (7, 4);
INSERT INTO `sys_role_permisson` VALUES (7, 5);
INSERT INTO `sys_role_permisson` VALUES (7, 6);
INSERT INTO `sys_role_permisson` VALUES (7, 7);
INSERT INTO `sys_role_permisson` VALUES (2, 2);
INSERT INTO `sys_role_permisson` VALUES (2, 8);
INSERT INTO `sys_role_permisson` VALUES (2, 9);
INSERT INTO `sys_role_permisson` VALUES (2, 24);
INSERT INTO `sys_role_permisson` VALUES (2, 25);
INSERT INTO `sys_role_permisson` VALUES (2, 26);
INSERT INTO `sys_role_permisson` VALUES (2, 3);
INSERT INTO `sys_role_permisson` VALUES (2, 4);
INSERT INTO `sys_role_permisson` VALUES (2, 5);
INSERT INTO `sys_role_permisson` VALUES (2, 6);
INSERT INTO `sys_role_permisson` VALUES (2, 7);
INSERT INTO `sys_role_permisson` VALUES (2, 27);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NULL DEFAULT NULL COMMENT '用户编号',
  `role_id` int NULL DEFAULT NULL COMMENT '角色编号',
  INDEX `fk_uid`(`user_id`) USING BTREE,
  INDEX `fk_rid`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (3, 1);
INSERT INTO `sys_user_role` VALUES (3, 7);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名\r\n',
  `sex` int NULL DEFAULT NULL COMMENT '性别（1-男 2-女）',
  `dept_id` int NULL DEFAULT NULL COMMENT '所属部门，对应部门表主键',
  `status` int NULL DEFAULT NULL COMMENT '状态（1-可用 2-禁用）',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `user_type` int NULL DEFAULT 2 COMMENT '用户类型（1-超级管理员 2-普通用户）',
  `hire_date` datetime NULL DEFAULT NULL COMMENT '入职日期',
  `created_user` int NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user` int NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_deptid`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, 'admin', '$2a$10$UTU2jMNu4g7PELafhksny.C253LqF4RcZambQCZ3pR6lMdMghC.Fu', '超级管理员', 1, 1, 1, 'xxxx@xx.com', '13888888888', 1, '2020-11-13 09:21:40', 1, '2020-11-13 09:21:44', 1, '2022-03-15 17:44:00', '');
INSERT INTO `sys_users` VALUES (3, 'system', '$2a$10$z0T3Bsjz/LnAfplS572bK.3ktq4VdDXKZhiUcMTFZLPrPv4R3nQSa', '系统管理员', 2, 3, 1, 'xxxx@xx.com', '13555555555', 2, '2022-03-16 08:00:00', 1, '2022-03-16 12:54:56', 1, '2022-03-22 03:31:12', '姐姐知道你看我资料，不会吃醋吧\n不像我，只会心疼giegie');
INSERT INTO `sys_users` VALUES (4, '403', '$2a$10$yVO55sbSp/Xbq13OYFMMfO2KXe/nBtdduyH9zXHpDZwzekFj2av3W', '403测试用户', 1, 5, 1, 'xxxx@xx.com', '15888888888', 2, '2022-03-18 08:00:00', 3, '2022-03-18 02:13:45', 1, '2022-03-22 03:31:15', '用于测试登录时403页面的用户');

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录密码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` int NULL DEFAULT 1 COMMENT '状态1-可用 2-异常',
  `regist_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES (1, 'test', '$2a$10$k6oi775j1IPO7qJ5WfxeNOkTp4jnMt3kj0eaCp/0CLIay3kLBf5gm', NULL, NULL, '13988887777', NULL, 1, '2022-03-25 01:22:48');
INSERT INTO `t_account` VALUES (3, 'zhangsan', '$2a$10$Md1p1Ju/mtGYIGd5p.b.vevGVWTneRt6CC.OMSdsrjy7Sdq0otRyC', NULL, NULL, '12345678912', NULL, 1, '2022-03-26 02:52:09');

-- ----------------------------
-- Table structure for t_account_role
-- ----------------------------
DROP TABLE IF EXISTS `t_account_role`;
CREATE TABLE `t_account_role`  (
  `account_id` int NOT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '前台角色id',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '前台用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account_role
-- ----------------------------
INSERT INTO `t_account_role` VALUES (1, 1);
INSERT INTO `t_account_role` VALUES (3, 1);

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `room_type_id` int NULL DEFAULT NULL COMMENT '所属房型',
  `room_id` bigint NULL DEFAULT NULL COMMENT '所属房间',
  `customer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入住人姓名',
  `id_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入住人身份证号',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `arrive_date` date NULL DEFAULT NULL COMMENT '入住日期',
  `leave_date` date NULL DEFAULT NULL COMMENT '离店日期',
  `pay_price` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `orders_id` bigint NULL DEFAULT NULL COMMENT '关联预订订单ID',
  `status` int UNSIGNED NULL DEFAULT NULL COMMENT '状态（1-入住中  2-已离店）',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` int NULL DEFAULT NULL COMMENT '创建人',
  `modify_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `modify_user` int NULL DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `pay_price`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkin
-- ----------------------------
INSERT INTO `t_checkin` VALUES (3, 2, 29, '张三', '1234567890', '13700005555', '2022-04-07', '2022-04-14', 1050.00, 6, 1, '2022-03-26 07:14:10', 1, NULL, NULL, '我才是真正的张三，谁冒充我订房间了？');
INSERT INTO `t_checkin` VALUES (4, 1, 1, '张三', '1234534568', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-26 07:39:47', 1, NULL, NULL, '给同学们倒杯卡布奇诺');
INSERT INTO `t_checkin` VALUES (5, 2, 2, '李四', '3564745254', '13488885555', '2022-03-31', '2022-04-07', 880.00, 5, 2, '2022-01-26 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (6, 1, 3, '王五', '1234513451', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-01-03 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (7, 1, 4, '赵六', '6571235345', '13488885555', '2022-03-31', '2022-04-07', 864.00, 5, 2, '2022-01-18 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (8, 3, 5, '田七', '4576812334', '13488885555', '2022-03-31', '2022-04-07', 1038.00, 5, 2, '2022-02-25 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (9, 1, 7, '孙八', '1028345446', '13488885555', '2022-03-31', '2022-04-07', 3274.00, 5, 2, '2022-02-24 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (10, 2, 6, '路人甲', '7982411238', '13488885555', '2022-03-31', '2022-04-07', 237.00, 5, 2, '2022-03-17 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (11, 1, 8, '路人乙', '1745631785', '13488885555', '2022-03-31', '2022-04-07', 838.00, 5, 2, '2022-03-21 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (12, 3, 9, '路人丙', '5789012351', '13488885555', '2022-03-31', '2022-04-07', 784.00, 5, 2, '2022-03-05 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (13, 3, 21, '路人丁', '7891243447', '13488885555', '2022-03-31', '2022-04-07', 568.00, 5, 2, '2022-03-07 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (14, 1, 25, '客户A', '0897123346', '13488885555', '2022-03-31', '2022-04-07', 983.00, 5, 2, '2022-03-24 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (15, 2, 27, '客户B', '5678923434', '13488885555', '2022-03-31', '2022-04-07', 789.00, 5, 2, '2022-03-24 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (16, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-25 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (17, 1, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-23 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (18, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-23 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (19, 1, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-24 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (20, 3, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-24 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (21, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-23 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (22, 3, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-23 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (23, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-22 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (24, 3, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-22 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (25, 1, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-25 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (26, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-25 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (27, 1, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-22 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (28, 1, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-23 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (29, 2, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-25 07:39:47', 1, NULL, NULL, NULL);
INSERT INTO `t_checkin` VALUES (30, 3, 29, '客户C', '3423457562', '13488885555', '2022-03-31', '2022-04-07', 840.00, 5, 2, '2022-03-25 07:39:47', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `check_out_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退房记录编号',
  `checkin_id` bigint NULL DEFAULT NULL COMMENT '关联入住ID',
  `consume_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` int NULL DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkout
-- ----------------------------
INSERT INTO `t_checkout` VALUES (4, '957213554003554304', 4, NULL, '2022-03-26 09:44:55', 1, NULL);

-- ----------------------------
-- Table structure for t_floor
-- ----------------------------
DROP TABLE IF EXISTS `t_floor`;
CREATE TABLE `t_floor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `floor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '楼层名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_floor
-- ----------------------------
INSERT INTO `t_floor` VALUES (1, '一楼', '酒店一楼');
INSERT INTO `t_floor` VALUES (2, '二楼', '酒店二楼');
INSERT INTO `t_floor` VALUES (3, '三楼', '酒店三楼');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '预订编号',
  `orders_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预订单号',
  `account_id` bigint NULL DEFAULT NULL COMMENT '预订人账号ID',
  `room_type_id` int NULL DEFAULT NULL COMMENT '房型编号',
  `room_id` int NULL DEFAULT NULL COMMENT '房间ID',
  `reservation_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预订人姓名',
  `id_card` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话号码',
  `status` int NULL DEFAULT 1 COMMENT '状态1-待确认  2-已确认 3-已入住',
  `reserve_date` datetime NULL DEFAULT NULL COMMENT '预定时间（创建时间）',
  `arrive_date` date NULL DEFAULT NULL COMMENT '到店时间',
  `leave_date` date NULL DEFAULT NULL COMMENT '离店时间',
  `reserve_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '预订价格',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (5, '957041899326808064', 1, 1, 1, '张三', '1234567890', '13488885555', 3, '2022-03-25 22:22:50', '2022-04-01', '2022-04-08', 840.00, '给同学们倒杯卡布奇诺');
INSERT INTO `t_orders` VALUES (6, '957109957038841856', 3, 2, 29, '张三', '123456789087', '13700005555', 3, '2022-03-26 02:53:16', '2022-04-08', '2022-04-15', 1050.00, '我才是真正的张三，谁冒充我订房间了？');
INSERT INTO `t_orders` VALUES (7, '957116987594121216', 1, 3, 46, '李四', '123123123', '13488880976', 1, '2022-03-26 03:21:12', '2022-04-15', '2022-04-22', 1960.00, '其实我是李四 没想到吧');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色编码',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色代码',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '前台角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'ROLE_NORMAL', '注册用户', NULL);
INSERT INTO `t_role` VALUES (2, 'ROLE_VIP', '高级会员', NULL);

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房间标题',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房间图片',
  `room_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房间编号',
  `room_type_id` int NULL DEFAULT NULL COMMENT '房型',
  `floor_id` int NULL DEFAULT NULL COMMENT '所属楼层',
  `status` int NULL DEFAULT NULL COMMENT '状态(1-可预订 2-已预订 3-已入住)',
  `room_desc` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '房间描述',
  `room_requirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '要求',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES (1, '单间1', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '101', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间101');
INSERT INTO `t_room` VALUES (2, '单间2', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '102', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间102');
INSERT INTO `t_room` VALUES (3, '单间3', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '103', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间103');
INSERT INTO `t_room` VALUES (4, '单间4', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '104', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间104');
INSERT INTO `t_room` VALUES (5, '单间5', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '105', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间105');
INSERT INTO `t_room` VALUES (6, '单间6', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '106', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间106');
INSERT INTO `t_room` VALUES (7, '单间7', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '107', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间107');
INSERT INTO `t_room` VALUES (8, '单间8', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '108', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间108');
INSERT INTO `t_room` VALUES (9, '单间9', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '109', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间109');
INSERT INTO `t_room` VALUES (10, '单间10', '20220324/bc573de121d24da9b531c05501dd80d7.jpg', '110', 1, 1, 1, '适合一人居住的单人间', '物品损坏照价赔偿', '单间110');
INSERT INTO `t_room` VALUES (21, '标间1', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '201', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间201');
INSERT INTO `t_room` VALUES (22, '标间2', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '202', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间202');
INSERT INTO `t_room` VALUES (23, '标间3', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '203', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间203');
INSERT INTO `t_room` VALUES (24, '标间4', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '204', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间204');
INSERT INTO `t_room` VALUES (25, '标间5', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '205', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间205');
INSERT INTO `t_room` VALUES (26, '标间6', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '206', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间206');
INSERT INTO `t_room` VALUES (27, '标间7', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '207', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间207');
INSERT INTO `t_room` VALUES (28, '标间8', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '208', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间208');
INSERT INTO `t_room` VALUES (29, '标间9', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '209', 2, 2, 2, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间209');
INSERT INTO `t_room` VALUES (30, '标间10', '20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg', '210', 2, 2, 1, '适合出差居住的商务双人间', '物品损坏照价赔偿', '标间210');
INSERT INTO `t_room` VALUES (41, '豪华套房1', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '301', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房301');
INSERT INTO `t_room` VALUES (42, '豪华套房2', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '302', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房302');
INSERT INTO `t_room` VALUES (43, '豪华套房3', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '303', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房303');
INSERT INTO `t_room` VALUES (44, '豪华套房4', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '304', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房304');
INSERT INTO `t_room` VALUES (45, '豪华套房5', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '305', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房305');
INSERT INTO `t_room` VALUES (46, '豪华套房6', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '306', 3, 3, 2, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房306');
INSERT INTO `t_room` VALUES (47, '豪华套房7', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '307', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房307');
INSERT INTO `t_room` VALUES (48, '豪华套房8', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '308', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房308');
INSERT INTO `t_room` VALUES (49, '豪华套房9', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '309', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房309');
INSERT INTO `t_room` VALUES (50, '豪华套房10', '20220324/eabe76f5f45641308ed1abbd2d83d061.jpg', '310', 3, 3, 1, '非常豪华的单人套房', '物品损坏照价赔偿', '豪华套房310');

-- ----------------------------
-- Table structure for t_room_type
-- ----------------------------
DROP TABLE IF EXISTS `t_room_type`;
CREATE TABLE `t_room_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '房型编号',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房型名称',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房型图片',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '参考价格',
  `live_num` int NULL DEFAULT NULL COMMENT '可入住人数',
  `bed_num` int NULL DEFAULT NULL COMMENT '床位数',
  `room_num` int NULL DEFAULT NULL COMMENT '房间数量',
  `reserved_num` int NULL DEFAULT NULL COMMENT '已预定数量',
  `avilable_num` int NULL DEFAULT NULL COMMENT '可住房间数',
  `lived_num` int NULL DEFAULT NULL COMMENT '已入住数量',
  `status` int NULL DEFAULT NULL COMMENT '房型状态（1-可预订 2-房型已满）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_room_type
-- ----------------------------
INSERT INTO `t_room_type` VALUES (1, '单间', '20220324/7ad4e2eea6b24efe92495bd5706a623c.jpg', 120.00, 1, 1, 10, 0, 10, 0, 1, '可一人入住的房间');
INSERT INTO `t_room_type` VALUES (2, '标间', '20220324/784e5643322844a1aff66210047ecb52.jpg', 150.00, 2, 2, 10, 0, 9, 1, 1, '可两人入住的房间');
INSERT INTO `t_room_type` VALUES (3, '豪华套房', '20220324/b9e33556afab42bea2796f915fab33cb.jpg', 280.00, 1, 1, 10, 1, 9, 0, 1, '非常豪华的套间');

SET FOREIGN_KEY_CHECKS = 1;
