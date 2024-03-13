/*
 Navicat Premium Data Transfer

 Source Server         : quarkus_test
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : quarkus_test

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 13/03/2024 15:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auditlist
-- ----------------------------
DROP TABLE IF EXISTS `auditlist`;
CREATE TABLE `auditlist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditlist
-- ----------------------------
INSERT INTO `auditlist` VALUES (1, '内部 安全检查单 春秋航空 ', '张加印', '2022-01-01');
INSERT INTO `auditlist` VALUES (2, '内部 操作规范单 南方航空', '张加印', '2022-02-01');
INSERT INTO `auditlist` VALUES (3, '内部 安全操作规范 四川航空', '张加印', '2022-03-01');
INSERT INTO `auditlist` VALUES (4, '内部 运营执行手册 厦门航空', '张加印', '2022-04-01');
INSERT INTO `auditlist` VALUES (5, '内部 安全操作规范 海南航空 ', '刘晨', '2022-05-01');

-- ----------------------------
-- Table structure for auditor
-- ----------------------------
DROP TABLE IF EXISTS `auditor`;
CREATE TABLE `auditor`  (
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`auditor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditor
-- ----------------------------
INSERT INTO `auditor` VALUES ('刘晨', '技术操作');
INSERT INTO `auditor` VALUES ('张加印', '安全部门');
INSERT INTO `auditor` VALUES ('张恒', '行政部门');
INSERT INTO `auditor` VALUES ('许恒大', '航班运营');

-- ----------------------------
-- Table structure for audittable
-- ----------------------------
DROP TABLE IF EXISTS `audittable`;
CREATE TABLE `audittable`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LeadAuditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `toDepartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audittable
-- ----------------------------
INSERT INTO `audittable` VALUES (1, '内部', '春秋航空', '航班运营', '张加印', '刘晨', '航班运营', '行政部门', '安全检查单', '2022-01-01', '2022-01-10');
INSERT INTO `audittable` VALUES (2, '内部', '南方航空', '质量与安全', '张加印', '刘晨', '航班运营', '行政部门', '操作规范单', '2022-02-01', '2022-02-10');
INSERT INTO `audittable` VALUES (3, '内部', '四川航空', '飞行支持', '张加印', '许恒大', '安全部门', '技术操作', '安全操作规范', '2022-03-01', '2022-03-10');
INSERT INTO `audittable` VALUES (4, '内部', '厦门航空', '货物装卸', '张加印', '张恒', '技术操作', '航班运营', '运营执行手册', '2022-04-01', '2022-04-10');
INSERT INTO `audittable` VALUES (5, '内部', '海南航空', '飞机操作', '刘晨', '张加印', '技术操作', '安全部门', '安全操作规范', '2022-05-01', '2022-05-10');

-- ----------------------------
-- Table structure for checkaudit
-- ----------------------------
DROP TABLE IF EXISTS `checkaudit`;
CREATE TABLE `checkaudit`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `LeadAuditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `planType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkaudit
-- ----------------------------
INSERT INTO `checkaudit` VALUES (1, '刘晨', '张加印', '内部', '春秋航空', '行政部门', '安全检查单', '2022-01-01');
INSERT INTO `checkaudit` VALUES (2, '刘晨', '张加印', '内部', '南方航空', '行政部门', '操作规范单', '2022-02-01');
INSERT INTO `checkaudit` VALUES (3, '许恒大', '张加印', '内部', '四川航空', '技术操作', '安全操作规范', '2022-03-01');
INSERT INTO `checkaudit` VALUES (4, '张恒', '张加印', '内部', '厦门航空', '航班运营', '运营执行手册', '2022-04-01');
INSERT INTO `checkaudit` VALUES (5, '张加印', '刘晨', '内部', '海南航空', '安全部门', '安全操作规范', '2022-05-01');

-- ----------------------------
-- Table structure for checkcompany
-- ----------------------------
DROP TABLE IF EXISTS `checkcompany`;
CREATE TABLE `checkcompany`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkcompany
-- ----------------------------
INSERT INTO `checkcompany` VALUES (1, '春秋航空');
INSERT INTO `checkcompany` VALUES (2, '南方航空');
INSERT INTO `checkcompany` VALUES (3, '四川航空');
INSERT INTO `checkcompany` VALUES (4, '海南航空');
INSERT INTO `checkcompany` VALUES (5, '厦门航空');

-- ----------------------------
-- Table structure for checklist
-- ----------------------------
DROP TABLE IF EXISTS `checklist`;
CREATE TABLE `checklist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `edition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checklist
-- ----------------------------
INSERT INTO `checklist` VALUES (1, '审计', '安全检查单', '1.0');
INSERT INTO `checklist` VALUES (2, '审计', '操作规范单', '1.0');
INSERT INTO `checklist` VALUES (3, 'IOSA', '运营执行手册', '1.0');
INSERT INTO `checklist` VALUES (4, 'IOSA', '行政管理规范', '1.0');
INSERT INTO `checklist` VALUES (5, 'ISAGO', '安全操作规范', '1.0');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `department_no` int(0) NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `department_no`(`department_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 200541, '技术操作');
INSERT INTO `departments` VALUES (2, 200236, '安全部门');
INSERT INTO `departments` VALUES (3, 200421, '行政部门');
INSERT INTO `departments` VALUES (4, 200800, '航班运营');
INSERT INTO `departments` VALUES (6, 1, '管理层');

-- ----------------------------
-- Table structure for known_fruits
-- ----------------------------
DROP TABLE IF EXISTS `known_fruits`;
CREATE TABLE `known_fruits`  (
  `id` int(0) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_57g3m8wr3qxoj706a6hsqg6ye`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of known_fruits
-- ----------------------------
INSERT INTO `known_fruits` VALUES (2, 'Apple');
INSERT INTO `known_fruits` VALUES (3, 'Banana');
INSERT INTO `known_fruits` VALUES (1, 'Cherry');

-- ----------------------------
-- Table structure for known_fruits_id_seq
-- ----------------------------
DROP TABLE IF EXISTS `known_fruits_id_seq`;
CREATE TABLE `known_fruits_id_seq`  (
  `next_val` bigint(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of known_fruits_id_seq
-- ----------------------------
INSERT INTO `known_fruits_id_seq` VALUES (10);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_no` int(0) NULL DEFAULT NULL,
  `name` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `department_no`(`department_no`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`department_no`) REFERENCES `departments` (`department_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (11, 'admin', 'admin', 1, 'admin');
INSERT INTO `user` VALUES (12, 'liuchen', '123456', 200541, '刘晨');
INSERT INTO `user` VALUES (13, 'zhangjiayin', '123456', 200236, '张加印');
INSERT INTO `user` VALUES (14, 'zhangheng', '123456', 200421, '张恒');
INSERT INTO `user` VALUES (15, 'xuhengda', '123456', 200800, '许恒大');

SET FOREIGN_KEY_CHECKS = 1;
