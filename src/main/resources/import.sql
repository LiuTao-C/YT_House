/*
 Navicat Premium Data Transfer

 Source Server         : quarkus_test
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : quarkus

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 14/03/2024 17:32:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auditlist
-- ----------------------------
DROP TABLE IF EXISTS `auditlist`;
CREATE TABLE `auditlist`  (
                              `id` int(0) NOT NULL AUTO_INCREMENT,
                              `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `lead_auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `auditors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `schedule_start_date` date NULL DEFAULT NULL,
                              `schedule_end_date` date NULL DEFAULT NULL,
                              `perform_start_date` date NULL DEFAULT NULL,
                              `perform_end_date` date NULL DEFAULT NULL,
                              `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `create_date` date NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auditlist
-- ----------------------------
INSERT INTO `auditlist` VALUES (1, 'AUDIT-01-123', '内部', '南方航空', '航班运营', '张加印', '刘晨', '2023-01-01', '2023-01-05', '2023-01-02', '2023-01-06', '审计中', '张三', '2023-01-01');
INSERT INTO `auditlist` VALUES (2, 'AUDIT-02-456', '外部', '厦门航空', '质量与安全', '刘晨', '许恒大', '2023-02-01', '2023-02-05', '2023-02-02', '2023-02-06', '未开始', '李四', '2023-01-15');
INSERT INTO `auditlist` VALUES (3, 'AUDIT-03-789', '供应商', '四川航空', '飞行支持', '许恒大', '张恒', '2023-03-01', '2023-03-05', '2023-03-02', '2023-03-06', '取消', '王二', '2023-02-01');
INSERT INTO `auditlist` VALUES (4, 'AUDIT-04-101', '内部', '春秋航空', '货物装卸', '张恒', '张加印', '2023-04-01', '2023-04-05', '2023-04-02', '2023-04-06', '同意', '张三', '2023-02-15');
INSERT INTO `auditlist` VALUES (5, 'AUDIT-05-202', '外部', '南方航空', '飞机操作', '刘晨', '许恒大', '2023-05-01', '2023-05-05', '2023-05-02', '2023-05-06', '审计中', '李四', '2023-03-01');
INSERT INTO `auditlist` VALUES (6, 'AUDIT-06-303', '供应商', '厦门航空', '航班运营', '许恒大', '张加印', '2023-06-01', '2023-06-05', '2023-06-02', '2023-06-06', '未开始', '王二', '2023-03-15');
INSERT INTO `auditlist` VALUES (7, 'AUDIT-07-404', '内部', '四川航空', '质量与安全', '张加印', '张恒', '2023-07-01', '2023-07-05', '2023-07-02', '2023-07-06', '取消', '张三', '2023-04-01');
INSERT INTO `auditlist` VALUES (8, 'AUDIT-08-505', '外部', '春秋航空', '飞行支持', '刘晨', '许恒大', '2023-08-01', '2023-08-05', '2023-08-02', '2023-08-06', '同意', '李四', '2023-04-15');
INSERT INTO `auditlist` VALUES (9, 'AUDIT-09-606', '供应商', '南方航空', '货物装卸', '许恒大', '张加印', '2023-09-01', '2023-09-05', '2023-09-02', '2023-09-06', '审计中', '王二', '2023-05-01');
INSERT INTO `auditlist` VALUES (10, 'AUDIT-10-707', '内部', '厦门航空', '飞机操作', '张恒', '张恒', '2023-10-01', '2023-10-05', '2023-10-02', '2023-10-06', '未开始', '张三', '2023-05-15');

-- ----------------------------
-- Table structure for checklist
-- ----------------------------
DROP TABLE IF EXISTS `checklist`;
CREATE TABLE `checklist`  (
                              `id` int(0) NOT NULL AUTO_INCREMENT,
                              `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `create_date` date NULL DEFAULT NULL,
                              `check_list_id` int(0) NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `check_list_id`(`check_list_id`) USING BTREE,
                              CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`check_list_id`) REFERENCES `auditlist` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checklist
-- ----------------------------
INSERT INTO `checklist` VALUES (1, '航班运营 南方航空', '内部', '张三', '2023-01-01', 1);
INSERT INTO `checklist` VALUES (2, '质量与安全 厦门航空', '外部', '李四', '2023-01-15', 2);
INSERT INTO `checklist` VALUES (3, '飞行支持 四川航空', '供应商', '王二', '2023-02-01', 3);
INSERT INTO `checklist` VALUES (4, '货物装卸 春秋航空', '内部', '张三', '2023-02-15', 4);
INSERT INTO `checklist` VALUES (5, '飞机操作 南方航空', '外部', '李四', '2023-03-01', 5);
INSERT INTO `checklist` VALUES (6, '航班运营 厦门航空', '供应商', '王二', '2023-03-15', 6);
INSERT INTO `checklist` VALUES (7, '质量与安全 四川航空', '内部', '张三', '2023-04-01', 7);
INSERT INTO `checklist` VALUES (8, '飞行支持 春秋航空', '外部', '李四', '2023-04-15', 8);
INSERT INTO `checklist` VALUES (9, '货物装卸 南方航空', '供应商', '王二', '2023-05-01', 9);
INSERT INTO `checklist` VALUES (10, '飞机操作 厦门航空', '内部', '张三', '2023-05-15', 10);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
                            `id` int(0) NOT NULL AUTO_INCREMENT,
                            `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `company`(`company`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (2, '南方航空');
INSERT INTO `company` VALUES (5, '厦门航空');
INSERT INTO `company` VALUES (3, '四川航空');
INSERT INTO `company` VALUES (6, '春秋航空');
INSERT INTO `company` VALUES (4, '海南航空');
INSERT INTO `company` VALUES (1, '管理员');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE INDEX `department`(`department`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (2, '安全部门');
INSERT INTO `department` VALUES (5, '技术操作');
INSERT INTO `department` VALUES (1, '管理员');
INSERT INTO `department` VALUES (4, '航班运营');
INSERT INTO `department` VALUES (3, '行政部门');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` int(0) NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `company_id` int(0) NULL DEFAULT NULL,
                         `department_id` int(0) NULL DEFAULT NULL,
                         PRIMARY KEY (`id`) USING BTREE,
                         INDEX `company_id`(`company_id`) USING BTREE,
                         INDEX `department_id`(`department_id`) USING BTREE,
                         CONSTRAINT `user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                         CONSTRAINT `user_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '管理员', 1, 1);
INSERT INTO `user` VALUES (3, 'liuchen', '123456', '用户', 1, 2);
INSERT INTO `user` VALUES (4, 'zhangjiayin', '123456', '用户', 3, 3);
INSERT INTO `user` VALUES (5, '张恒', '123456', '用户', 4, 4);
INSERT INTO `user` VALUES (6, 'xuhengda', '123456', '用户', 3, 2);

SET FOREIGN_KEY_CHECKS = 1;
