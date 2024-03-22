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

 Date: 20/03/2024 15:46:02
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auditlist` VALUES (11, 'AUDIT-11-121', '外部', '南方航空', '质量与安全', '陈尘', '张亮', '2023-11-01', '2023-11-05', '2023-11-02', '2023-11-06', '审计中', '王二', '2023-04-01');
INSERT INTO `auditlist` VALUES (12, 'AUDIT-12-232', '供应商', '厦门航空', '飞机操作', '刘昊然', '陈桂林', '2023-12-01', '2023-12-05', '2023-12-02', '2023-12-06', '同意', '张三', '2023-04-15');
INSERT INTO `auditlist` VALUES (13, 'AUDIT-13-343', '内部', '四川航空', '航班运营', '朱光玉', '杨国福', '2024-01-01', '2024-01-05', '2024-01-02', '2024-01-06', '未开始', '李四', '2023-05-01');
INSERT INTO `auditlist` VALUES (14, 'AUDIT-14-454', '外部', '春秋航空', '货物装卸', '刘昊然', '张亮', '2024-02-01', '2024-02-05', '2024-02-02', '2024-02-06', '取消', '王二', '2023-05-15');
INSERT INTO `auditlist` VALUES (15, 'AUDIT-15-565', '供应商', '南方航空', '飞行支持', '陈尘', '陈桂林', '2024-03-01', '2024-03-05', '2024-03-02', '2024-03-06', '审计中', '张三', '2023-06-01');
INSERT INTO `auditlist` VALUES (16, 'AUDIT-16-676', '内部', '厦门航空', '质量与安全', '张亮', '朱光玉', '2024-04-01', '2024-04-05', '2024-04-02', '2024-04-06', '同意', '李四', '2023-06-15');
INSERT INTO `auditlist` VALUES (17, 'AUDIT-17-787', '外部', '四川航空', '飞行支持', '朱光玉', '刘昊然', '2024-05-01', '2024-05-05', '2024-05-02', '2024-05-06', '未开始', '王二', '2023-07-01');
INSERT INTO `auditlist` VALUES (18, 'AUDIT-18-898', '供应商', '春秋航空', '航班运营', '陈桂林', '陈尘', '2024-06-01', '2024-06-05', '2024-06-02', '2024-06-06', '审计中', '张三', '2023-07-15');
INSERT INTO `auditlist` VALUES (19, 'AUDIT-19-909', '内部', '南方航空', '质量与安全', '刘昊然', '张亮', '2024-07-01', '2024-07-05', '2024-07-02', '2024-07-06', '取消', '李四', '2023-08-01');
INSERT INTO `auditlist` VALUES (20, 'AUDIT-20-010', '外部', '厦门航空', '飞机操作', '陈尘', '朱光玉', '2024-08-01', '2024-08-05', '2024-08-02', '2024-08-06', '同意', '王二', '2023-08-15');
INSERT INTO `auditlist` VALUES (21, 'AUDIT-21-111', '供应商', '四川航空', '货物装卸', '陈桂林', '陈尘', '2024-09-01', '2024-09-05', '2024-09-02', '2024-09-06', '审计中', '张三', '2023-09-01');
INSERT INTO `auditlist` VALUES (22, 'AUDIT-22-222', '外部', '厦门航空', '飞行支持', '陈尘', '朱光玉', '2024-11-01', '2023-11-05', '2025-11-02', '2024-11-07', '审计中', '王二', '2023-10-01');
INSERT INTO `auditlist` VALUES (23, 'AUDIT-23-333', '外部', '南方航空', '飞行支持', '陈尘', '朱光玉', '2024-11-01', '2024-11-05', '2024-11-02', '2024-11-06', '审计中', '王二', '2023-10-01');
INSERT INTO `auditlist` VALUES (24, 'AUDIT-24-121', '供应商', '南方航空', '货物装卸', '杨国福', '朱光玉', '2024-11-01', '2024-11-05', '2024-11-02', '2024-11-06', '审计中', '王二', '2023-12-01');
INSERT INTO `auditlist` VALUES (25, 'AUDIT-25-232', '内部', '厦门航空', '飞机操作', '朱光玉', '杨国福', '2024-12-01', '2024-12-05', '2024-12-02', '2024-12-06', '同意', '张三', '2023-12-15');
INSERT INTO `auditlist` VALUES (26, 'AUDIT-26-343', '外部', '四川航空', '航班运营', '张亮', '刘昊然', '2025-01-01', '2025-01-05', '2025-01-02', '2025-01-06', '未开始', '李四', '2024-01-01');
INSERT INTO `auditlist` VALUES (27, 'AUDIT-27-454', '供应商', '春秋航空', '质量与安全', '朱光玉', '杨国福', '2025-02-01', '2025-02-05', '2025-02-02', '2025-02-06', '审计中', '王二', '2024-01-15');
INSERT INTO `auditlist` VALUES (28, 'AUDIT-28-565', '内部', '南方航空', '飞行支持', '杨国福', '朱光玉', '2025-03-01', '2025-03-05', '2025-03-02', '2025-03-06', '同意', '张三', '2024-02-01');
INSERT INTO `auditlist` VALUES (29, 'AUDIT-29-676', '外部', '厦门航空', '货物装卸', '陈桂林', '刘昊然', '2025-04-01', '2025-04-05', '2025-04-02', '2025-04-06', '取消', '李四', '2024-02-15');
INSERT INTO `auditlist` VALUES (30, 'AUDIT-30-787', '供应商', '四川航空', '飞机操作', '杨国福', '朱光玉', '2025-05-01', '2025-05-05', '2025-05-02', '2025-05-06', '未开始', '王二', '2024-03-01');
INSERT INTO `auditlist` VALUES (31, 'AUDIT-31-898', '内部', '春秋航空', '航班运营', '朱光玉', '杨国福', '2025-06-01', '2025-06-05', '2025-06-02', '2025-06-06', '审计中', '张三', '2024-03-15');
INSERT INTO `auditlist` VALUES (32, 'AUDIT-32-909', '外部', '南方航空', '质量与安全', '陈桂林', '陈尘', '2025-07-01', '2025-07-05', '2025-07-02', '2025-07-06', '同意', '李四', '2024-04-01');
INSERT INTO `auditlist` VALUES (33, 'AUDIT-33-010', '供应商', '厦门航空', '飞行支持', '陈尘', '陈桂林', '2025-08-01', '2025-08-05', '2025-08-02', '2025-08-06', '取消', '王二', '2024-04-15');
INSERT INTO `auditlist` VALUES (34, 'AUDIT-34-121', '外部', '四川航空', '质量与安全', '陈尘', '张亮', '2025-09-01', '2025-09-05', '2025-09-02', '2025-09-06', '审计中', '王二', '2024-05-01');
INSERT INTO `auditlist` VALUES (35, 'AUDIT-35-232', '供应商', '南方航空', '航班运营', '刘昊然', '陈桂林', '2025-10-01', '2025-10-05', '2025-10-02', '2025-10-06', '同意', '张三', '2024-05-15');
INSERT INTO `auditlist` VALUES (36, 'AUDIT-36-343', '内部', '厦门航空', '飞机操作', '朱光玉', '杨国福', '2025-11-01', '2025-11-05', '2025-11-02', '2025-11-06', '未开始', '李四', '2024-06-01');
INSERT INTO `auditlist` VALUES (37, 'AUDIT-37-454', '外部', '春秋航空', '货物装卸', '刘昊然', '张亮', '2025-12-01', '2025-12-05', '2025-12-02', '2025-12-06', '取消', '王二', '2024-06-15');
INSERT INTO `auditlist` VALUES (38, 'AUDIT-38-565', '供应商', '四川航空', '飞行支持', '陈尘', '陈桂林', '2026-01-01', '2026-01-05', '2026-01-02', '2026-01-06', '审计中', '张三', '2024-07-01');
INSERT INTO `auditlist` VALUES (39, 'AUDIT-39-676', '内部', '南方航空', '质量与安全', '张亮', '朱光玉', '2026-02-01', '2026-02-05', '2026-02-02', '2026-02-06', '同意', '李四', '2024-07-15');
INSERT INTO `auditlist` VALUES (40, 'AUDIT-40-787', '外部', '厦门航空', '航班运营', '朱光玉', '刘昊然', '2026-03-01', '2026-03-05', '2026-03-02', '2026-03-06', '未开始', '王二', '2024-08-01');
INSERT INTO `auditlist` VALUES (41, 'AUDIT-41-898', '供应商', '四川航空', '飞机操作', '陈桂林', '陈尘', '2026-04-01', '2026-04-05', '2026-04-02', '2026-04-06', '取消', '张三', '2024-08-15');
INSERT INTO `auditlist` VALUES (42, 'AUDIT-42-909', '内部', '春秋航空', '质量与安全', '刘昊然', '张亮', '2026-05-01', '2026-05-05', '2026-05-02', '2026-05-06', '审计中', '李四', '2024-09-01');
INSERT INTO `auditlist` VALUES (43, 'AUDIT-43-010', '外部', '南方航空', '飞行支持', '陈尘', '朱光玉', '2026-06-01', '2026-06-05', '2026-06-02', '2026-06-06', '同意', '王二', '2024-09-15');

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
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checklist
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (2, '安全部门');
INSERT INTO `department` VALUES (5, '技术操作');
INSERT INTO `department` VALUES (1, '管理员');
INSERT INTO `department` VALUES (4, '航班运营');
INSERT INTO `department` VALUES (3, '行政部门');

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
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `company_id` int(0) NULL DEFAULT NULL,
                         `department_id` int(0) NULL DEFAULT NULL,
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '管理员', 1, 1);
INSERT INTO `user` VALUES (3, 'liuchen', '123456', '用户', 1, 2);
INSERT INTO `user` VALUES (4, 'zhangjiayin', '123456', '用户', 3, 3);
INSERT INTO `user` VALUES (5, '张恒', '123456', '用户', 4, 4);
INSERT INTO `user` VALUES (6, 'xuhengda', '123456', '用户', 3, 2);

SET FOREIGN_KEY_CHECKS = 1;
