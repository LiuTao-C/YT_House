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

 Date: 09/04/2024 16:01:43
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
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actionlist
-- ----------------------------
INSERT INTO `actionlist` VALUES (1, 'ACT-01-001', '阿里', '2024-03-26', '航班运营', 'ISO 9001', '2024-04-01', '2024-04-15', '南方航空', '未审批', '为了提高航班安全性，需要制定ISO 9001标准', '低风险', '长周期', '多部门协同', '通过', '需要与地勤部门协同执行');
INSERT INTO `actionlist` VALUES (2, 'ACT-01-002', '腾讯', '2024-03-26', '货物运营', 'ICAO', '2024-04-05', '2024-04-20', '厦门航空', '行动中', '提升货物运输的安全标准以符合ICAO规定', '中低风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施修正措施');
INSERT INTO `actionlist` VALUES (3, 'ACT-01-003', '百度', '2024-03-26', '乘客运营', 'ATA', '2024-04-10', '2024-04-25', '春秋航空', '中止', '改进乘客运营流程以符合ATA标准', '中风险', '临时周期', '无', '未通过', '需制定符合ATA标准的流程更新计划');
INSERT INTO `actionlist` VALUES (4, 'ACT-01-004', '字节', '2024-03-26', '质量管理', 'EASA', '2024-04-15', '2024-04-30', '四川航空', '未审批', '制定符合EASA标准的质量管理流程', '中高风险', '长周期', '多部门协同', '未通过', '需要跨部门合作制定EASA标准的质量管理计划');
INSERT INTO `actionlist` VALUES (5, 'ACT-01-005', '春秋航空', '2024-03-26', '飞行支持', 'ISO 9001', '2024-04-20', '2024-05-05', '厦门航空', '行动中', '优化飞行支持流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与飞行支持部门合作执行流程优化');
INSERT INTO `actionlist` VALUES (6, 'ACT-01-006', '南方航空', '2024-03-26', '地面勤务', 'ICAO', '2024-04-25', '2024-05-10', '南方航空', '完成', '更新地面勤务设备以符合ICAO标准', '中低风险', '长周期', '无', '通过', '完成地勤设备更新工作');
INSERT INTO `actionlist` VALUES (7, 'ACT-01-007', '腾讯', '2024-03-26', '机务维修', 'ATA', '2024-05-01', '2024-05-15', '春秋航空', '行动中', '改进机务维修流程以符合ATA标准', '中风险', '长周期', '多部门协同', '通过', '与维修部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (8, 'ACT-01-008', '百度', '2024-03-26', '航班运营', 'EASA', '2024-05-05', '2024-05-20', '山东航空', '未审批', '修订航班运营手册以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的手册修订计划');
INSERT INTO `actionlist` VALUES (9, 'ACT-01-009', '阿里', '2024-03-26', '货物运营', 'ISO 9001', '2024-05-10', '2024-05-25', '中国国际航空', '未审批', '优化货物运营流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与货运部门合作执行流程优化');
INSERT INTO `actionlist` VALUES (10, 'ACT-01-010', '字节', '2024-03-26', '乘客运营', 'ICAO', '2024-05-15', '2024-05-30', '青岛航空', '行动中', '提升乘客服务水平以符合ICAO标准', '中低风险', '长周期', '多部门协同', '通过', '与客户服务部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (11, 'ACT-01-011', '南方航空', '2024-03-26', '质量管理', 'ATA', '2024-05-20', '2024-06-04', '厦门航空', '行动中', '改进质量管理体系以符合ATA标准', '中高风险', '长周期', '多部门协同', '通过', '与质量管理部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (12, 'ACT-01-012', '腾讯', '2024-03-26', '飞行支持', 'EASA', '2024-05-25', '2024-06-09', '春秋航空', '未审批', '更新飞行支持设备以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要跨部门合作制定EASA标准的设备更新计划');
INSERT INTO `actionlist` VALUES (13, 'ACT-01-013', '百度', '2024-03-26', '地面勤务', 'ISO 9001', '2024-06-01', '2024-06-16', '南方航空', '行动中', '优化地面勤务流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (14, 'ACT-01-014', '阿里', '2024-03-26', '机务维修', 'ICAO', '2024-06-06', '2024-06-21', '山东航空', '中止', '更新机务维修设备以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的设备更新计划');
INSERT INTO `actionlist` VALUES (15, 'ACT-01-015', '字节', '2024-03-26', '航班运营', 'ATA', '2024-06-11', '2024-06-26', '青岛航空', '未审批', '改进航班运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (16, 'ACT-01-016', '南方航空', '2024-03-26', '货物运营', 'EASA', '2024-06-16', '2024-07-01', '春秋航空', '行动中', '修订货物运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与货运部门合作制定EASA标准的手册修订计划');
INSERT INTO `actionlist` VALUES (17, 'ACT-01-017', '腾讯', '2024-03-26', '乘客运营', 'ISO 9001', '2024-06-21', '2024-07-06', '厦门航空', '行动中', '优化乘客服务流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (18, 'ACT-01-018', '百度', '2024-03-26', '质量管理', 'ICAO', '2024-06-26', '2024-07-11', '四川航空', '完成', '建立符合ICAO标准的质量管理体系', '中风险', '长周期', '无', '通过', '完成质量管理体系的建立');
INSERT INTO `actionlist` VALUES (19, 'ACT-01-019', '阿里', '2024-03-26', '飞行支持', 'ATA', '2024-07-01', '2024-07-16', '山东航空', '行动中', '改进飞行支持流程以符合ATA标准', '中风险', '长周期', '多部门协同', '通过', '与飞行支持部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (20, 'ACT-01-020', '字节', '2024-03-26', '地面勤务', 'EASA', '2024-07-06', '2024-07-21', '中国国际航空', '未审批', '更新地面勤务设备以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要跨部门合作制定EASA标准的设备更新计划');
INSERT INTO `actionlist` VALUES (21, 'ACT-01-021', '南方航空', '2024-03-26', '机务维修', 'ISO 9001', '2024-07-11', '2024-07-26', '春秋航空', '行动中', '优化机务维修流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (22, 'ACT-01-022', '腾讯', '2024-03-26', '航班运营', 'ICAO', '2024-07-16', '2024-07-31', '厦门航空', '中止', '修订航班运营手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划');
INSERT INTO `actionlist` VALUES (23, 'ACT-01-023', '百度', '2024-03-26', '货物运营', 'ATA', '2024-07-21', '2024-08-05', '四川航空', '未审批', '改进货物运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (24, 'ACT-01-024', '阿里', '2024-03-26', '乘客运营', 'EASA', '2024-07-26', '2024-08-10', '山东航空', '行动中', '修订乘客运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与客户服务部门合作制定EASA标准的手册修订计划');
INSERT INTO `actionlist` VALUES (25, 'ACT-01-025', '字节', '2024-03-26', '质量管理', 'ISO 9001', '2024-08-01', '2024-08-16', '中国国际航空', '行动中', '优化质量管理流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (26, 'ACT-01-026', '南方航空', '2024-03-26', '飞行支持', 'ICAO', '2024-08-06', '2024-08-21', '厦门航空', '完成', '建立符合ICAO标准的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立');
INSERT INTO `actionlist` VALUES (27, 'ACT-01-027', '腾讯', '2024-03-26', '地面勤务', 'ATA', '2024-08-11', '2024-08-26', '春秋航空', '未审批', '优化地面勤务流程以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (28, 'ACT-01-028', '百度', '2024-03-26', '机务维修', 'EASA', '2024-08-16', '2024-08-31', '四川航空', '行动中', '改进机务维修流程以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与维修部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (29, 'ACT-01-029', '阿里', '2024-03-26', '航班运营', 'ISO 9001', '2024-08-21', '2024-09-05', '山东航空', '行动中', '优化航班运营流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (30, 'ACT-01-030', '字节', '2024-03-26', '货物运营', 'ICAO', '2024-08-26', '2024-09-10', '中国国际航空', '中止', '修订货物运营手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划');
INSERT INTO `actionlist` VALUES (31, 'ACT-01-031', '南方航空', '2024-03-26', '乘客运营', 'ATA', '2024-09-01', '2024-09-16', '厦门航空', '未审批', '改进乘客运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (32, 'ACT-01-032', '腾讯', '2024-03-26', '质量管理', 'EASA', '2024-09-06', '2024-09-21', '春秋航空', '行动中', '修订质量管理流程以符合EASA标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (33, 'ACT-01-033', '百度', '2024-03-26', '飞行支持', 'ISO 9001', '2024-09-11', '2024-09-26', '四川航空', '完成', '建立符合ISO 9001要求的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立');
INSERT INTO `actionlist` VALUES (34, 'ACT-01-034', '阿里', '2024-03-26', '地面勤务', 'ICAO', '2024-09-16', '2024-10-01', '山东航空', '行动中', '优化地面勤务流程以符合ICAO标准', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (35, 'ACT-01-035', '字节', '2024-03-26', '机务维修', 'ATA', '2024-09-21', '2024-10-06', '中国国际航空', '未审批', '改进机务维修流程以符合ATA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ATA标准的流程优化计划');
INSERT INTO `actionlist` VALUES (36, 'ACT-01-036', '南方航空', '2024-03-26', '航班运营', 'EASA', '2024-09-26', '2024-10-11', '厦门航空', '行动中', '修订航班运营手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与航班运营部门合作实施修订措施');
INSERT INTO `actionlist` VALUES (37, 'ACT-01-037', '腾讯', '2024-03-26', '货物运营', 'ISO 9001', '2024-10-01', '2024-10-16', '春秋航空', '中止', '修订货物运营手册以符合ISO 9001要求', '中高风险', '长周期', '无', '未通过', '需要制定符合ISO 9001标准的手册修订计划');
INSERT INTO `actionlist` VALUES (38, 'ACT-01-038', '百度', '2024-03-26', '乘客运营', 'ICAO', '2024-10-06', '2024-10-21', '四川航空', '未审批', '优化乘客运营流程以符合ICAO标准', '中风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (39, 'ACT-01-039', '阿里', '2024-03-26', '质量管理', 'ATA', '2024-10-11', '2024-10-26', '山东航空', '行动中', '改进质量管理流程以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (40, 'ACT-01-040', '字节', '2024-03-26', '飞行支持', 'EASA', '2024-10-16', '2024-10-31', '中国国际航空', '完成', '建立符合EASA标准的飞行支持体系', '中风险', '长周期', '无', '通过', '完成飞行支持体系的建立');
INSERT INTO `actionlist` VALUES (41, 'ACT-01-041', '南方航空', '2024-03-26', '地面勤务', 'ISO 9001', '2024-10-21', '2024-11-05', '厦门航空', '行动中', '优化地面勤务流程以符合ISO 9001要求', '中低风险', '短周期', '单个部门协同', '通过', '与地勤部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (42, 'ACT-01-042', '腾讯', '2024-03-26', '机务维修', 'ICAO', '2024-10-26', '2024-11-10', '春秋航空', '未审批', '修订机务维修手册以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的手册修订计划');
INSERT INTO `actionlist` VALUES (43, 'ACT-01-043', '百度', '2024-03-26', '航班运营', 'ATA', '2024-11-01', '2024-11-16', '四川航空', '行动中', '改进航班运营流程以符合ATA标准', '中风险', '短周期', '单个部门协同', '通过', '与航班运营部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (44, 'ACT-01-044', '阿里', '2024-03-26', '货物运营', 'EASA', '2024-11-06', '2024-11-21', '山东航空', '中止', '修订货物运营手册以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的手册修订计划');
INSERT INTO `actionlist` VALUES (45, 'ACT-01-045', '字节', '2024-03-26', '乘客运营', 'ISO 9001', '2024-11-11', '2024-11-26', '中国国际航空', '未审批', '优化乘客服务流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (46, 'ACT-01-046', '南方航空', '2024-03-26', '质量管理', 'ICAO', '2024-11-16', '2024-12-01', '厦门航空', '行动中', '改进质量管理流程以符合ICAO标准', '中低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (47, 'ACT-01-047', '腾讯', '2024-03-26', '飞行支持', 'ATA', '2024-11-21', '2024-12-06', '春秋航空', '完成', '建立符合ATA标准的飞行支持体系', '中高风险', '长周期', '无', '通过', '完成飞行支持体系的建立');
INSERT INTO `actionlist` VALUES (48, 'ACT-01-048', '百度', '2024-03-26', '地面勤务', 'EASA', '2024-11-26', '2024-12-11', '四川航空', '行动中', '修订地面勤务手册以符合EASA标准', '中高风险', '长周期', '多部门协同', '通过', '与地勤部门合作实施修订措施');
INSERT INTO `actionlist` VALUES (49, 'ACT-01-049', '阿里', '2024-03-26', '机务维修', 'ISO 9001', '2024-12-01', '2024-12-16', '山东航空', '未审批', '改进机务维修流程以符合ISO 9001要求', '中风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (50, 'ACT-01-050', '字节', '2024-03-26', '航班运营', 'ICAO', '2024-12-06', '2024-12-21', '中国国际航空', '中止', '优化航班运营流程以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的流程优化计划');
INSERT INTO `actionlist` VALUES (51, 'ACT-01-051', '南方航空', '2024-03-26', '货物运营', 'ATA', '2024-12-11', '2024-12-26', '厦门航空', '行动中', '修订货物运营手册以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与货运部门合作实施修订措施');
INSERT INTO `actionlist` VALUES (52, 'ACT-01-052', '腾讯', '2024-03-26', '乘客运营', 'EASA', '2024-12-16', '2025-01-01', '春秋航空', '中止', '改进乘客运营流程以符合EASA标准', '中高风险', '长周期', '无', '未通过', '需要制定符合EASA标准的流程优化计划');
INSERT INTO `actionlist` VALUES (53, 'ACT-01-053', '百度', '2024-03-26', '质量管理', 'ISO 9001', '2024-12-21', '2025-01-05', '四川航空', '未审批', '优化质量管理流程以符合ISO 9001要求', '低风险', '短周期', '单个部门协同', '通过', '与质量管理部门合作实施流程优化');
INSERT INTO `actionlist` VALUES (54, 'ACT-01-054', '阿里', '2024-03-26', '飞行支持', 'ICAO', '2024-12-26', '2025-01-10', '山东航空', '行动中', '改进飞行支持流程以符合ICAO标准', '中高风险', '长周期', '多部门协同', '通过', '与飞行支持部门合作实施改进措施');
INSERT INTO `actionlist` VALUES (55, 'ACT-01-055', '字节', '2024-03-26', '地面勤务', 'ATA', '2025-01-01', '2025-01-16', '中国国际航空', '完成', '建立符合ATA标准的地面勤务体系', '中风险', '长周期', '无', '通过', '完成地面勤务体系的建立');
INSERT INTO `actionlist` VALUES (56, 'ACT-01-056', '南方航空', '2024-03-26', '机务维修', 'EASA', '2025-01-06', '2025-01-21', '厦门航空', '行动中', '修订机务维修手册以符合EASA标准', '中低风险', '短周期', '单个部门协同', '通过', '与维修部门合作实施修订措施');
INSERT INTO `actionlist` VALUES (57, 'ACT-01-057', '腾讯', '2024-03-26', '航班运营', 'ISO 9001', '2025-01-11', '2025-01-26', '春秋航空', '行动中', '优化航班运营流程以符合ISO 9001要求', '中风险', '长周期', '多部门协同', '通过', '与航班运营部门合作实施优化措施');
INSERT INTO `actionlist` VALUES (58, 'ACT-01-058', '百度', '2024-03-26', '货物运营', 'ICAO', '2025-01-16', '2025-01-31', '四川航空', '中止', '改进货物运营流程以符合ICAO标准', '中高风险', '长周期', '无', '未通过', '需要制定符合ICAO标准的流程优化计划');
INSERT INTO `actionlist` VALUES (59, 'ACT-01-059', '阿里', '2024-03-26', '乘客运营', 'ATA', '2025-01-21', '2025-02-05', '山东航空', '未审批', '修订乘客运营手册以符合ATA标准', '中低风险', '短周期', '单个部门协同', '通过', '与客户服务部门合作实施修订措施');
INSERT INTO `actionlist` VALUES (60, 'ACT-01-060', '字节', '2024-03-26', '质量管理', 'EASA', '2025-01-26', '2025-02-10', '中国国际航空', '行动中', '优化质量管理流程以符合EASA标准', '中风险', '长周期', '多部门协同', '通过', '与质量管理部门合作实施优化措施');

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
-- Table structure for reportfile
-- ----------------------------
DROP TABLE IF EXISTS `reportfile`;
CREATE TABLE `reportfile`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `file_size` bigint(0) NULL DEFAULT NULL,
                               `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reportfile
-- ----------------------------

-- ----------------------------
-- Table structure for reportlist
-- ----------------------------
DROP TABLE IF EXISTS `reportlist`;
CREATE TABLE `reportlist`  (
                               `id` bigint(0) NOT NULL AUTO_INCREMENT,
                               `conclusion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `evaluation_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `evaluator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `event_risk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `final_confirmation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `flight_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `nedd_expert_research` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `need_research` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `report_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `report_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `reportdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reportlist
-- ----------------------------

-- ----------------------------
-- Table structure for uploaded_files
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_files`;
CREATE TABLE `uploaded_files`  (
                                   `id` int(0) NOT NULL AUTO_INCREMENT,
                                   `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `file_data` longblob NOT NULL,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uploaded_files
-- ----------------------------

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
