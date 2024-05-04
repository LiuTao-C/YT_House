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

 Date: 19/04/2024 09:37:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actionlist
-- ----------------------------
DROP TABLE IF EXISTS `actionlist`;
CREATE TABLE `actionlist`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `actcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `investors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `create_date` date NULL DEFAULT NULL,
                               `project_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `standards` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `schedule_start_date` date NULL DEFAULT NULL,
                               `schedule_end_date` date NULL DEFAULT NULL,
                               `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `detail_information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `risk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `action_cycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `department_collaboration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `assessment_conclusion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `corrective_measures` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actionlist
-- ----------------------------
INSERT INTO `actionlist` VALUES (1, 'ACT-01-001', '阿里', '2024-03-26', '航班运营', 'ISO 9001', '2024-04-01', '2024-04-15', '南方航空', '未审批', '为了提高航班安全性，需要制定ISO 9001标准', '低风险', '长周期', '多部门协同', '通过', '需要与地勤部门协同执行', NULL);
INSERT INTO `actionlist` VALUES (2, 'ACT-01-002', '腾讯', '2024-03-26', '货物运营', 'ICAO', '2024-04-05', '2024-04-20', '厦门航空', '行动中', '提升货物运输的安全标准以符合ICAO规定', '中低风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施修正措施', NULL);
INSERT INTO `actionlist` VALUES (3, 'ACT-01-003', '百度', '2024-03-26', '乘客运营', 'ATA', '2024-04-10', '2024-04-25', '春秋航空', '中止', '改进乘客运营流程以符合ATA标准', '中风险', '临时周期', '无', '未通过', '需制定符合ATA标准的流程更新计划', NULL);
INSERT INTO `actionlist` VALUES (4, 'ACT-01-004', '字节', '2024-03-26', '质量管理', 'EASA', '2024-04-15', '2024-04-30', '四川航空', '未审批', '制定符合EASA标准的质量管理流程', '中高风险', '长周期', '多部门协同', '未通过', '需要跨部门合作制定EASA标准的质量管理计划', NULL);
INSERT INTO `actionlist` VALUES (5, 'ACT-01-005', '春秋航空', '2024-03-26', '飞行支持', 'ISO 9001', '2024-04-20', '2024-05-05', '厦门航空', '行动中', '优化飞行支持流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与飞行支持部门合作执行流程优化', NULL);
INSERT INTO `actionlist` VALUES (6, 'ACT-01-006', '南方航空', '2024-03-26', '地面勤务', 'ICAO', '2024-04-25', '2024-05-10', '南方航空', '完成', '更新地面勤务设备以符合ICAO标准', '中低风险', '长周期', '无', '通过', '完成地勤设备更新工作', NULL);
INSERT INTO `actionlist` VALUES (7, 'ACT-01-007', '腾讯', '2024-03-26', '机务维修', 'ATA', '2024-05-01', '2024-05-15', '春秋航空', '行动中', '改进机务维修流程以符合ATA标准', '中风险', '长周期', '多部门协同', '通过', '与维修部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (8, 'ACT-01-008', '百度', '2024-03-26', '航班运营', 'EASA', '2024-05-05', '2024-05-20', '山东航空', '未审批', '修订航班运营手册以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (9, 'ACT-01-009', '阿里', '2024-03-26', '货物运营', 'ISO 9001', '2024-05-10', '2024-05-25', '中国国际航空', '未审批', '优化货物运营流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与货运部门合作执行流程优化', NULL);
INSERT INTO `actionlist` VALUES (10, 'ACT-01-010', '字节', '2024-03-26', '乘客运营', 'ICAO', '2024-05-15', '2024-05-30', '青岛航空', '行动中', '提升乘客服务水平以符合ICAO标准', '中低风险', '长周期', '多部门协同', '通过', '与客户服务部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (11, 'ACT-01-011', '南方航空', '2024-03-26', '质量管理', 'ATA', '2024-05-20', '2024-06-04', '厦门航空', '行动中', '改进质量管理体系以符合ATA标准', '中高风险', '长周期', '多部门协同', '通过', '与质量管理部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (12, 'ACT-01-012', '腾讯', '2024-03-26', '飞行支持', 'EASA', '2024-05-25', '2024-06-09', '春秋航空', '未审批', '更新飞行支持设备以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要跨部门合作制定EASA标准的设备更新计划', NULL);
INSERT INTO `actionlist` VALUES (13, 'ACT-01-013', '百度', '2024-03-26', '地面勤务', 'ISO 9001', '2024-06-01', '2024-06-16', '南方航空', '行动中', '优化地面勤务流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (14, 'ACT-01-014', '阿里', '2024-03-26', '机务维修', 'ICAO', '2024-06-06', '2024-06-21', '山东航空', '中止', '更新机务维修设备以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的设备更新计划', NULL);
INSERT INTO `actionlist` VALUES (15, 'ACT-01-015', '字节', '2024-03-26', '航班运营', 'ATA', '2024-06-11', '2024-06-26', '青岛航空', '未审批', '改进航班运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (16, 'ACT-01-016', '南方航空', '2024-03-26', '货物运营', 'EASA', '2024-06-16', '2024-07-01', '春秋航空', '行动中', '修订货物运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与货运部门合作制定EASA标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (17, 'ACT-01-017', '腾讯', '2024-03-26', '乘客运营', 'ISO 9001', '2024-06-21', '2024-07-06', '厦门航空', '行动中', '优化乘客服务流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (18, 'ACT-01-018', '百度', '2024-03-26', '质量管理', 'ICAO', '2024-06-26', '2024-07-11', '四川航空', '完成', '建立符合ICAO标准的质量管理体系', '中风险', '长周期', '无', '通过', '完成质量管理体系的建立', NULL);
INSERT INTO `actionlist` VALUES (19, 'ACT-01-019', '阿里', '2024-03-26', '飞行支持', 'ATA', '2024-07-01', '2024-07-16', '山东航空', '行动中', '改进飞行支持流程以符合ATA标准', '中风险', '长周期', '多部门协同', '通过', '与飞行支持部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (20, 'ACT-01-020', '字节', '2024-03-26', '地面勤务', 'EASA', '2024-07-06', '2024-07-21', '中国国际航空', '未审批', '更新地面勤务设备以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要跨部门合作制定EASA标准的设备更新计划', NULL);
INSERT INTO `actionlist` VALUES (21, 'ACT-01-021', '南方航空', '2024-03-26', '机务维修', 'ISO 9001', '2024-07-11', '2024-07-26', '春秋航空', '行动中', '优化机务维修流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (22, 'ACT-01-022', '腾讯', '2024-03-26', '航班运营', 'ICAO', '2024-07-16', '2024-07-31', '厦门航空', '中止', '修订航班运营手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (23, 'ACT-01-023', '百度', '2024-03-26', '货物运营', 'ATA', '2024-07-21', '2024-08-05', '四川航空', '未审批', '改进货物运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (24, 'ACT-01-024', '阿里', '2024-03-26', '乘客运营', 'EASA', '2024-07-26', '2024-08-10', '山东航空', '行动中', '修订乘客运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与客户服务部门合作制定EASA标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (25, 'ACT-01-025', '字节', '2024-03-26', '质量管理', 'ISO 9001', '2024-08-01', '2024-08-16', '中国国际航空', '行动中', '优化质量管理流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (26, 'ACT-01-026', '南方航空', '2024-03-26', '飞行支持', 'ICAO', '2024-08-06', '2024-08-21', '厦门航空', '完成', '建立符合ICAO标准的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立', NULL);
INSERT INTO `actionlist` VALUES (27, 'ACT-01-027', '腾讯', '2024-03-26', '地面勤务', 'ATA', '2024-08-11', '2024-08-26', '春秋航空', '未审批', '优化地面勤务流程以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (28, 'ACT-01-028', '百度', '2024-03-26', '机务维修', 'EASA', '2024-08-16', '2024-08-31', '四川航空', '行动中', '改进机务维修流程以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与维修部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (29, 'ACT-01-029', '阿里', '2024-03-26', '航班运营', 'ISO 9001', '2024-08-21', '2024-09-05', '山东航空', '行动中', '优化航班运营流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (30, 'ACT-01-030', '字节', '2024-03-26', '货物运营', 'ICAO', '2024-08-26', '2024-09-10', '中国国际航空', '中止', '修订货物运营手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (31, 'ACT-01-031', '南方航空', '2024-03-26', '乘客运营', 'ATA', '2024-09-01', '2024-09-16', '厦门航空', '未审批', '改进乘客运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (32, 'ACT-01-032', '腾讯', '2024-03-26', '质量管理', 'EASA', '2024-09-06', '2024-09-21', '春秋航空', '行动中', '修订质量管理流程以符合EASA标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (33, 'ACT-01-033', '百度', '2024-03-26', '飞行支持', 'ISO 9001', '2024-09-11', '2024-09-26', '四川航空', '完成', '建立符合ISO 9001要求的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立', NULL);
INSERT INTO `actionlist` VALUES (34, 'ACT-01-034', '阿里', '2024-03-26', '地面勤务', 'ICAO', '2024-09-16', '2024-10-01', '山东航空', '行动中', '优化地面勤务流程以符合ICAO标准', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (35, 'ACT-01-035', '字节', '2024-03-26', '机务维修', 'ATA', '2024-09-21', '2024-10-06', '中国国际航空', '未审批', '改进机务维修流程以符合ATA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ATA标准的流程优化计划', NULL);
INSERT INTO `actionlist` VALUES (36, 'ACT-01-036', '南方航空', '2024-03-26', '航班运营', 'EASA', '2024-09-26', '2024-10-11', '厦门航空', '行动中', '修订航班运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与航班运营部门合作实施修订措施', NULL);
INSERT INTO `actionlist` VALUES (37, 'ACT-01-037', '腾讯', '2024-03-26', '货物运营', 'ISO 9001', '2024-10-01', '2024-10-16', '春秋航空', '中止', '修订货物运营手册以符合ISO 9001要求', '中高风险', '长周期', '无', '未通过', '需要制定符合ISO 9001标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (38, 'ACT-01-038', '百度', '2024-03-26', '乘客运营', 'ICAO', '2024-10-06', '2024-10-21', '四川航空', '未审批', '优化乘客运营流程以符合ICAO标准', '中风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (39, 'ACT-01-039', '阿里', '2024-03-26', '质量管理', 'ATA', '2024-10-11', '2024-10-26', '山东航空', '行动中', '改进质量管理流程以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (40, 'ACT-01-040', '字节', '2024-03-26', '飞行支持', 'EASA', '2024-10-16', '2024-10-31', '中国国际航空', '完成', '建立符合EASA标准的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立', NULL);
INSERT INTO `actionlist` VALUES (41, 'ACT-01-041', '南方航空', '2024-03-26', '地面勤务', 'ISO 9001', '2024-10-21', '2024-11-05', '厦门航空', '行动中', '优化地面勤务流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (42, 'ACT-01-042', '腾讯', '2024-03-26', '机务维修', 'ICAO', '2024-10-26', '2024-11-10', '春秋航空', '未审批', '修订机务维修手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (43, 'ACT-01-043', '百度', '2024-03-26', '航班运营', 'ATA', '2024-11-01', '2024-11-16', '四川航空', '行动中', '改进航班运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (44, 'ACT-01-044', '阿里', '2024-03-26', '货物运营', 'EASA', '2024-11-06', '2024-11-21', '山东航空', '中止', '修订货物运营手册以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的手册修订计划', NULL);
INSERT INTO `actionlist` VALUES (45, 'ACT-01-045', '字节', '2024-03-26', '乘客运营', 'ISO 9001', '2024-11-11', '2024-11-26', '中国国际航空', '未审批', '优化乘客服务流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (46, 'ACT-01-046', '南方航空', '2024-03-26', '质量管理', 'ICAO', '2024-11-16', '2024-12-01', '厦门航空', '行动中', '改进质量管理流程以符合ICAO标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (47, 'ACT-01-047', '腾讯', '2024-03-26', '飞行支持', 'ATA', '2024-11-21', '2024-12-06', '春秋航空', '完成', '建立符合ATA标准的飞行支持体系', '中高风险', '长周期', '无', '通过', '完成飞行支持体系的建立', NULL);
INSERT INTO `actionlist` VALUES (48, 'ACT-01-048', '百度', '2024-03-26', '地面勤务', 'EASA', '2024-11-26', '2024-12-11', '四川航空', '行动中', '修订地面勤务手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与地勤部门合作实施修订措施', NULL);
INSERT INTO `actionlist` VALUES (49, 'ACT-01-049', '阿里', '2024-03-26', '机务维修', 'ISO 9001', '2024-12-01', '2024-12-16', '山东航空', '未审批', '改进机务维修流程以符合ISO 9001要求', '中风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (50, 'ACT-01-050', '字节', '2024-03-26', '航班运营', 'ICAO', '2024-12-06', '2024-12-21', '中国国际航空', '中止', '优化航班运营流程以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的流程优化计划', NULL);
INSERT INTO `actionlist` VALUES (51, 'ACT-01-051', '南方航空', '2024-03-26', '货物运营', 'ATA', '2024-12-11', '2024-12-26', '厦门航空', '行动中', '修订货物运营手册以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施修订措施', NULL);
INSERT INTO `actionlist` VALUES (52, 'ACT-01-052', '腾讯', '2024-03-26', '乘客运营', 'EASA', '2024-12-16', '2025-01-01', '春秋航空', '中止', '改进乘客运营流程以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的流程优化计划', NULL);
INSERT INTO `actionlist` VALUES (53, 'ACT-01-053', '百度', '2024-03-26', '质量管理', 'ISO 9001', '2024-12-21', '2025-01-05', '四川航空', '未审批', '优化质量管理流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化', NULL);
INSERT INTO `actionlist` VALUES (54, 'ACT-01-054', '阿里', '2024-03-26', '飞行支持', 'ICAO', '2024-12-26', '2025-01-10', '山东航空', '行动中', '改进飞行支持流程以符合ICAO标准', '中高风险', '长周期', '多部门协同', '通过', '与飞行支持部门合作实施改进措施', NULL);
INSERT INTO `actionlist` VALUES (55, 'ACT-01-055', '字节', '2024-03-26', '地面勤务', 'ATA', '2025-01-01', '2025-01-16', '中国国际航空', '完成', '建立符合ATA标准的地面勤务体系', '中风险', '长周期', '无', '通过', '完成地面勤务体系的建立', NULL);
INSERT INTO `actionlist` VALUES (56, 'ACT-01-056', '南方航空', '2024-03-26', '机务维修', 'EASA', '2025-01-06', '2025-01-21', '厦门航空', '行动中', '修订机务维修手册以符合EASA标准', '中低风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施修订措施', NULL);
INSERT INTO `actionlist` VALUES (57, 'ACT-01-057', '腾讯', '2024-03-26', '航班运营', 'ISO 9001', '2025-01-11', '2025-01-26', '春秋航空', '行动中', '优化航班运营流程以符合ISO 9001要求', '中风险', '长周期', '多部门协同', '通过', '与航班运营部门合作实施优化措施', NULL);
INSERT INTO `actionlist` VALUES (58, 'ACT-01-058', '百度', '2024-03-26', '货物运营', 'ICAO', '2025-01-16', '2025-01-31', '四川航空', '中止', '改进货物运营流程以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的流程优化计划', NULL);
INSERT INTO `actionlist` VALUES (59, 'ACT-01-059', '阿里', '2024-03-26', '乘客运营', 'ATA', '2025-01-21', '2025-02-05', '山东航空', '未审批', '修订乘客运营手册以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施修订措施', NULL);
INSERT INTO `actionlist` VALUES (60, 'ACT-01-060', '字节', '2024-03-26', '质量管理', 'EASA', '2025-01-26', '2025-02-10', '中国国际航空', '行动中', '优化质量管理流程以符合EASA标准', '中风险', '长周期', '多部门协同', '通过', '与质量管理部门合作实施优化措施', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
-- Table structure for reportfile
-- ----------------------------
DROP TABLE IF EXISTS `reportfile`;
CREATE TABLE `reportfile`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `file_size` bigint(0) NULL DEFAULT NULL,
                               `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `origin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reportfile
-- ----------------------------
INSERT INTO `reportfile` VALUES (1, '2ca8ad045ec3464f82c19594ce7ea308.jpg', 'D:\\storefile', 93843, 'jpg', '蓝版图片.jpg');
INSERT INTO `reportfile` VALUES (2, 'b59dfa8a1d07475cb2a8e1f79d08a3d8.png', 'D:\\storefile', 7074, 'png', '个人签名.png');
INSERT INTO `reportfile` VALUES (3, '2e8e4145fff44313be9be239efae5f35.png', 'D:\\storefile', 72144, 'png', 'logoA.png');
INSERT INTO `reportfile` VALUES (4, '92387325f6c947888cf316ee869c8a8a.docx', 'D:\\storefile', 210455, 'docx', '学习笔记.docx');
INSERT INTO `reportfile` VALUES (5, 'a15fe6c0c571480092fdb7dd530f11e8.xlsx', 'D:\\storefile', 9365, 'xlsx', '开发情况.xlsx');
INSERT INTO `reportfile` VALUES (6, 'a4293ac1e896487fb4254c9cd6b20a70.txt', 'D:\\storefile', 121, 'txt', '任务表.txt');

-- ----------------------------
-- Table structure for reportlist
-- ----------------------------
DROP TABLE IF EXISTS `reportlist`;
CREATE TABLE `reportlist`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `report_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `reportdate` date NULL DEFAULT NULL,
                               `reporter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `flight_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `report_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `event_risk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `evaluator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `evaluation_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `conclusion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `need_research` tinyint(1) NULL DEFAULT NULL,
                               `need_expert_research` tinyint(1) NULL DEFAULT NULL,
                               `file_id` int(0) NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reportlist
-- ----------------------------
INSERT INTO `reportlist` VALUES (1, '客舱管理', '主题1', '报告编号1', '2024-04-01', '张三', '航班号1', '报告介绍1', '事件类型1', '事件风险1', '评估员1', '评估日期1', '结论1', 1, 0, 1);
INSERT INTO `reportlist` VALUES (2, '客舱管理', '主题2', '报告编号2', '2024-04-02', '李四', '航班号2', '报告介绍2', '事件类型2', '事件风险2', '评估员2', '评估日期2', '结论2', 1, 0, 2);
INSERT INTO `reportlist` VALUES (3, '客舱管理', '主题3', '报告编号3', '2024-04-03', '王五', '航班号3', '报告介绍3', '事件类型3', '事件风险3', '评估员3', '评估日期3', '结论3', 1, 0, 3);
INSERT INTO `reportlist` VALUES (4, '客舱管理', '主题4', '报告编号4', '2024-04-04', '赵六', '航班号4', '报告介绍4', '事件类型4', '事件风险4', '评估员4', '评估日期4', '结论4', 1, 0, 4);
INSERT INTO `reportlist` VALUES (5, '客舱管理', '主题5', '报告编号5', '2024-04-05', '钱七', '航班号5', '报告介绍5', '事件类型5', '事件风险5', '评估员5', '评估日期5', '结论5', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (6, '客舱管理', '主题6', '报告编号6', '2024-04-06', '孙八', '航班号6', '报告介绍6', '事件类型6', '事件风险6', '评估员6', '评估日期6', '结论6', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (7, '客舱管理', '主题7', '报告编号7', '2024-04-07', '周九', '航班号7', '报告介绍7', '事件类型7', '事件风险7', '评估员7', '评估日期7', '结论7', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (8, '客舱管理', '主题8', '报告编号8', '2024-04-08', '吴十', '航班号8', '报告介绍8', '事件类型8', '事件风险8', '评估员8', '评估日期8', '结论8', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (9, '客舱管理', '主题9', '报告编号9', '2024-04-09', '郑十一', '航班号9', '报告介绍9', '事件类型9', '事件风险9', '评估员9', '评估日期9', '结论9', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (10, '客舱管理', '主题10', '报告编号10', '2024-04-10', '王十二', '航班号10', '报告介绍10', '事件类型10', '事件风险10', '评估员10', '评估日期10', '结论10', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (11, '客舱管理', '主题11', '报告编号11', '2024-04-11', '赵十三', '航班号11', '报告介绍11', '事件类型11', '事件风险11', '评估员11', '评估日期11', '结论11', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (12, '客舱管理', '主题12', '报告编号12', '2024-04-12', '钱十四', '航班号12', '报告介绍12', '事件类型12', '事件风险12', '评估员12', '评估日期12', '结论12', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (13, '客舱管理', '主题13', '报告编号13', '2024-04-13', '孙十五', '航班号13', '报告介绍13', '事件类型13', '事件风险13', '评估员13', '评估日期13', '结论13', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (14, '客舱管理', '主题14', '报告编号14', '2024-04-14', '周十六', '航班号14', '报告介绍14', '事件类型14', '事件风险14', '评估员14', '评估日期14', '结论14', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (15, '客舱管理', '主题15', '报告编号15', '2024-04-15', '吴十七', '航班号15', '报告介绍15', '事件类型15', '事件风险15', '评估员15', '评估日期15', '结论15', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (16, '客舱管理', '主题16', '报告编号16', '2024-04-16', '郑十八', '航班号16', '报告介绍16', '事件类型16', '事件风险16', '评估员16', '评估日期16', '结论16', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (17, '客舱管理', '主题17', '报告编号17', '2024-04-17', '王十九', '航班号17', '报告介绍17', '事件类型17', '事件风险17', '评估员17', '评估日期17', '结论17', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (18, '客舱管理', '主题18', '报告编号18', '2024-04-18', '赵二十', '航班号18', '报告介绍18', '事件类型18', '事件风险18', '评估员18', '评估日期18', '结论18', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (19, '客舱管理', '主题19', '报告编号19', '2024-04-19', '钱二十一', '航班号19', '报告介绍19', '事件类型19', '事件风险19', '评估员19', '评估日期19', '结论19', 1, 0, NULL);
INSERT INTO `reportlist` VALUES (20, '客舱管理', '主题20', '报告编号20', '2024-04-20', '孙二十二', '航班号20', '报告介绍20', '事件类型20', '事件风险20', '评估员20', '评估日期20', '结论20', 1, 0, NULL);

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
