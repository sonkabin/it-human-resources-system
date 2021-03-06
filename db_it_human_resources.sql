/*
 Navicat Premium Data Transfer

 Source Server         : sjm
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : db_it_human_resources

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 08/05/2019 20:13:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emp_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` tinyint(2) NULL DEFAULT NULL,
  `age` tinyint(2) NULL DEFAULT NULL,
  `birth` date NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `inservice` tinyint(2) NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `skills` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `tb_employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES (1, '1001', '王飞', '955766906007172822e851119fca4bd6', 1, 26, '1994-07-05', '15858111111', 'sonkabin@gmail.com', '339005199407064312', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:xx大学', 1, 1, '', 3, '2018-01-01 19:18:18', '2019-01-22 07:18:58');
INSERT INTO `tb_employee` VALUES (2, '1002', '任行', '0f932f33dd242e50b88d959807b66462', 1, 24, '1996-09-18', '15833333333', 'renxing@qq.com', '339005199609224789', 'G:/static/avatars/avatar1002', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:9;MySQL:8;Spring:8;MyBatis:7;Hibernate:6;SpringBoot:7;SpringData:6;Maven:6;SpringMVC:8;Netty:6;Tomcat:7;Gradle:4;Ngnix:6;Linux:7;git:6;docker:7;Shiro:7;SpringSecurity:5;Oracle:5;Redis:8;SQL Server:4', 2, '2018-01-03 12:22:52', '2019-04-24 15:32:30');
INSERT INTO `tb_employee` VALUES (3, '1003', '张三', '8e12514181ffb7a0511bb1f9af2140ae', 1, 30, '1990-07-23', '15858118888', 'zhangsan@163.com', '33900419907319874', 'G:/static/avatars/avatar1003', '本科:cc大学;硕士:qq大学;博士及以上:oo大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;docker:1;Maven:3', 2, '2018-01-04 18:47:45', '2019-04-24 15:46:46');
INSERT INTO `tb_employee` VALUES (4, '1004', '李四', '2e163295e866cb8c3175a8301e45289a', 0, 30, '1990-06-30', '15858158888', 'lisi@163.com', '339005199007048795', 'G:/static/avatars/avatar1004', '本科:xx大学;硕士:cc大学', 1, 1, '', 4, '2018-01-20 09:51:20', '2019-01-22 10:55:01');
INSERT INTO `tb_employee` VALUES (5, '1005', '王五', '3899f181107fc446ecef3b0b1d9d0891', 0, 28, '1992-12-24', '15858178987', 'wangwu@126.com', '339005199212287896', 'G:/static/avatars/avatar1005', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:6;jQuery:8;HTML5:7;node.js:6;React.js:7;webpack:5;Bootstrap:6;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:7', 1, '2018-01-20 09:53:37', '2019-01-23 02:12:50');
INSERT INTO `tb_employee` VALUES (6, '1006', '赵六', 'c0123e0cbc5ef6ba5a7e1eecb0100eba', 0, 35, '1985-02-28', '17858789874', 'zhaoliu@qq.com', '339005198503037841', 'G:/static/avatars/avatar1006', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:8;jQuery:8;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:7;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:6', 1, '2018-01-20 09:55:02', '2019-01-22 10:55:11');
INSERT INTO `tb_employee` VALUES (7, '1007', '田七', '4ddcf6ada96e50d433e92b018246db7b', 1, 33, '1987-04-20', '1785878631', 'tianqi@qq.com', '339005198704239874', 'G:/static/avatars/avatar1007', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:5;jQuery:7;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:6;CSS3:6;LESS:7;git:5;MongoDB:5;AngularJS:5', 1, '2018-01-20 09:55:54', '2019-01-22 10:55:13');
INSERT INTO `tb_employee` VALUES (8, '1008', '张凡', 'f350d6f4f2bf1c3e30301870ecee4bbc', 1, 29, '1991-08-31', '15858119999', 'zhangfan@gmail.com', '339005199109034851', 'G:/static/avatars/avatar1008', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:9;MyBatis:9;Hibernate:5;Linux:9;Spring:9;SpringBoot:8;Maven:7;SpringData:8;SpringSecurity:6;SpringMVC:9;Netty:8;Tomcat:9;MySQL:9;Oracle:7;Redis:9;Shiro:6;Ngnix:8;Linux:9;git:8;docker:8', 1, '2018-01-20 10:04:11', '2019-01-23 02:36:28');
INSERT INTO `tb_employee` VALUES (9, '1009', '张小凡', 'bc34b40c7d0a0fe9917a220080294425', 1, 29, '1991-08-31', '15858119998', 'zhangxiaofan@gmail.com', '339005199109033654', 'G:/static/avatars/avatar1009', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:50', '2019-01-22 10:55:17');
INSERT INTO `tb_employee` VALUES (10, '1010', '李琪琪', '0bd6391ce6b2bab001e2b0b348d28324', 0, 27, '1993-05-28', '15878954123', 'liqiqi@qq.com', '339005199305313654', 'G:/static/avatars/avatar1010', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:06:01', '2019-01-22 10:55:19');
INSERT INTO `tb_employee` VALUES (11, '1011', '何小茜', 'be9079046cdaca2a7ea777fa3b1ab76f', 0, 26, '1994-04-12', '15888883695', 'hexiaoqian@qq.com', '339005199404159513', 'G:/static/avatars/avatar1011', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:07:12', '2019-01-22 10:55:22');
INSERT INTO `tb_employee` VALUES (12, '1012', '方小园', '2c752a7bd9ee373b8c710a453924a38a', 0, 24, '1996-10-07', '15887453333', 'xiaoyuan@126.com', '339005199610105874', 'G:/static/avatars/avatar1012', '本科:xx大学;硕士:cc大学', 0, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:08:37', '2019-04-02 13:20:20');
INSERT INTO `tb_employee` VALUES (13, '1013', '李一', 'b8d1545b8d6dc40494fa34785f7f8d49', 1, 29, '1991-08-30', '15858119991', 'liyi@gmail.com', '339005199109034852', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:31');
INSERT INTO `tb_employee` VALUES (14, '1014', '李二', '7d74de417f300b10c6e9d3b0afba7d92', 1, 29, '1991-08-30', '15858119992', 'lier@gmail.com', '339005199109034853', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:34');
INSERT INTO `tb_employee` VALUES (15, '1015', '李三', '9ca8181226387ddd3e590f3773233c0e', 1, 29, '1991-08-30', '15858119993', 'lisan@gmail.com', '339005199109034854', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:36');
INSERT INTO `tb_employee` VALUES (16, '1016', '李五', 'ae8d337b2f2a1a95a2278a3116939312', 1, 29, '1991-08-30', '15858119994', 'liwu@gmail.com', '339005199109034855', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:39');
INSERT INTO `tb_employee` VALUES (17, '1017', '李六', 'a95c4884126cf512cea102d5b910aaae', 1, 29, '1991-08-30', '15858119995', 'liliu@gmail.com', '339005199109034856', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:4;jQuery:6;HTML5:6;node.js:4;React.js:4;webpack:4;Bootstrap:4;CSS3:6;LESS:6;git:2;MongoDB:4;AngularJS:4', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:41');
INSERT INTO `tb_employee` VALUES (18, '1018', '李七', '6085df4eac68a577b7dbed1ccaae1e6a', 1, 29, '1991-08-30', '15858119996', 'liqi@gmail.com', '339005199109034857', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:43');
INSERT INTO `tb_employee` VALUES (19, '1019', '李八', '54d5eff621d754f82fc4b96fa256aa4c', 1, 29, '1991-08-30', '15858119997', 'liba@gmail.com', '339005199109034858', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:6;MySQL:6;Linux:4;Spring:5;MyBatis:5;Hibernate:5;SpringBoot:4;git:3;SpringMVC:6;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:45');
INSERT INTO `tb_employee` VALUES (20, '1020', '李九', 'c8a1c4ef272596434310b477a76b3435', 1, 29, '1991-08-30', '15858119901', 'lijiu@gmail.com', '339005199109034859', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:6;Linux:3;Spring:5;MyBatis:5;Hibernate:5;SpringBoot:4;git:4;SpringMVC:7;Redis:2;docker:1;Tomcat:5;Maven:4', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:48');
INSERT INTO `tb_employee` VALUES (21, '1021', '王一', 'e2d750d1861f4435b97776088016be44', 1, 29, '1991-08-30', '15858119902', 'wangyi@gmail.com', '339005199109034860', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:6;MySQL:3;Linux:3;Spring:3;MyBatis:3;Hibernate:3;SpringBoot:1;git:3;SpringMVC:3;Redis:1;docker:1;Tomcat:3;Maven:1', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:51');
INSERT INTO `tb_employee` VALUES (22, '1022', '王二', '1c5555ef145d112837caed8833d2cb3b', 1, 29, '1991-08-30', '15858119902', 'wanger@gmail.com', '339005199109034861', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:53');
INSERT INTO `tb_employee` VALUES (23, '1023', '王三', 'cb8fdbca5a6d847022d10e126d782d5b', 1, 29, '1991-08-30', '15858119903', 'wangsan@gmail.com', '339005199109034862', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:54');
INSERT INTO `tb_employee` VALUES (24, '1024', '王四', '6a73df3fb331633a07dcec6a6ed74fbc', 1, 29, '1991-08-30', '15858119904', 'wangsi@gmail.com', '339005199109034863', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:56');

-- ----------------------------
-- Table structure for tb_employee_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee_evaluation`;
CREATE TABLE `tb_employee_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `total_score` int(11) NULL DEFAULT NULL,
  `total_num` int(11) NULL DEFAULT NULL,
  `manager_score` int(1) NULL DEFAULT NULL COMMENT '项目经理给的评分，权重0.6，其他员工权重0.4',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '0表示未评价，1表示已对其他人评价',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_employee_evaluation
-- ----------------------------
INSERT INTO `tb_employee_evaluation` VALUES (1, 2, '任行', 1, 46, 4, 12, 1, '2019-05-05 15:40:48', '2019-05-05 15:40:50');
INSERT INTO `tb_employee_evaluation` VALUES (2, 5, '王五', 1, 47, 5, 10, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (3, 6, '赵六', 1, 39, 4, 10, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (4, 7, '田七', 1, 44, 4, 10, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (5, 8, '张凡', 1, 43, 4, 11, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (6, 9, '张小凡', 1, 45, 4, 11, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (7, 2, '任行', 2, 0, 0, 12, 0, '2019-05-05 15:40:48', '2019-05-05 15:40:50');
INSERT INTO `tb_employee_evaluation` VALUES (8, 5, '王五', 2, 0, 0, 10, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (9, 6, '赵六', 2, 0, 0, 10, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (10, 7, '田七', 2, 0, 0, 10, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (11, 8, '张凡', 2, 0, 0, 11, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (12, 9, '张小凡', 2, 0, 0, 11, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (13, 2, '任行', 3, 52, 5, NULL, 1, '2019-05-05 15:40:48', '2019-05-05 15:40:50');
INSERT INTO `tb_employee_evaluation` VALUES (14, 5, '王五', 3, 49, 5, NULL, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (15, 6, '赵六', 3, 47, 5, NULL, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (16, 7, '田七', 3, 51, 5, NULL, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (17, 8, '张凡', 3, 50, 5, NULL, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (18, 9, '张小凡', 3, 43, 5, NULL, 1, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (19, 15, '李三', 6, 0, 0, NULL, 0, '2019-05-05 15:40:48', '2019-05-05 15:40:50');
INSERT INTO `tb_employee_evaluation` VALUES (20, 19, '李八', 6, 0, 0, NULL, 0, '2019-05-05 16:10:24', '2019-05-05 16:10:26');
INSERT INTO `tb_employee_evaluation` VALUES (21, 5, '王五', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (22, 6, '赵六', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (23, 8, '张凡', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (24, 9, '张小凡', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (25, 12, '方小园', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (26, 13, '李一', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (27, 14, '李二', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');
INSERT INTO `tb_employee_evaluation` VALUES (28, 23, '王三', 6, 0, 0, NULL, 0, '2019-05-06 14:13:01', '2019-05-06 14:13:03');

-- ----------------------------
-- Table structure for tb_human_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_human_config`;
CREATE TABLE `tb_human_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目编号（外键）',
  `emp_id` int(11) NULL DEFAULT NULL COMMENT '员工编号（外键）',
  `emp_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `portion` tinyint(2) NULL DEFAULT NULL COMMENT '此项目工作时间比例',
  `release_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '将员工从该项目中释放的理由',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '员工参与此项目的状态，为1表示参与项目中，为2表示已退出项目',
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请员工的理由',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `tb_human_config_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tb_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_human_config_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_human_config
-- ----------------------------
INSERT INTO `tb_human_config` VALUES (1, 1, 2, '任行', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (2, 1, 3, '张三', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (3, 1, 5, '王五', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (4, 1, 6, '赵六', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (5, 1, 7, '田七', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (6, 1, 8, '张凡', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (7, 1, 9, '张小凡', 100, NULL, 2, NULL, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (8, 6, 2, '任行', 100, NULL, 1, NULL, '2019-02-07 19:07:58', '2019-02-07 19:08:01');
INSERT INTO `tb_human_config` VALUES (9, 6, 5, '王五', 10, NULL, 1, NULL, '2019-02-07 19:08:40', '2019-02-07 19:08:43');
INSERT INTO `tb_human_config` VALUES (10, 6, 6, '赵六', 80, NULL, 1, NULL, '2019-02-07 19:09:13', '2019-02-07 19:09:15');
INSERT INTO `tb_human_config` VALUES (11, 6, 8, '张凡', 20, NULL, 1, NULL, '2019-02-07 19:10:08', '2019-02-07 19:10:10');
INSERT INTO `tb_human_config` VALUES (12, 6, 9, '张小凡', 100, NULL, 1, NULL, '2019-02-07 19:10:31', '2019-02-07 19:10:33');
INSERT INTO `tb_human_config` VALUES (13, 6, 12, '方小园', 100, NULL, 1, NULL, '2019-02-07 19:11:03', '2019-02-07 19:11:05');
INSERT INTO `tb_human_config` VALUES (14, 6, 13, '李一', 100, NULL, 1, NULL, '2019-02-07 19:11:35', '2019-02-07 19:11:37');
INSERT INTO `tb_human_config` VALUES (15, 6, 14, '李二', 50, NULL, 1, NULL, '2019-02-07 19:11:55', '2019-02-07 19:11:57');
INSERT INTO `tb_human_config` VALUES (16, 6, 15, '李三', 60, '项目已临近尾声，项目当前拥有的成员过多，故释放该成员', 2, '需要加快项目进度，项目人手不足', '2019-02-11 19:11:55', '2019-04-25 14:02:45');
INSERT INTO `tb_human_config` VALUES (17, 6, 19, '李八', 100, '项目已临近尾声，项目当前拥有的成员过多，故释放该成员', 2, '需要加快项目进度，项目人手不足', '2019-02-12 14:14:31', '2019-04-25 14:14:33');
INSERT INTO `tb_human_config` VALUES (18, 6, 23, '王三', 40, NULL, 1, '需要加快项目进度，项目人手不足', '2019-02-25 14:15:07', '2019-02-25 14:15:09');

-- ----------------------------
-- Table structure for tb_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '招聘职位',
  `num` tinyint(2) NULL DEFAULT NULL COMMENT '招聘人数',
  `edu_background` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历要求',
  `experience` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作经验',
  `salary` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '薪资',
  `responsibility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '岗位职责',
  `demand` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任职要求',
  `status` tinyint(2) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_job
-- ----------------------------
INSERT INTO `tb_job` VALUES (1, 'Java开发工程师', 1, '大专', '3', '15k-20k', '参与产品需求讨论、技术方案确定，以及技术研发和产品上线工作;负责后台管理平台功能开发;负责前端API服务接口开发;负责互联网产品与业务系统的接口设计和规范化开发工作;领导安排的其他工作', '3年以上JAVA开发经验，有扎实的Java基础(熟悉IO、多线程、集合等基础框架，熟悉分布式、缓存、消息等机制）;熟悉常用的java开发框架,如spring mvc、spring mybatis等, 熟练掌握 Spring Boot 技术体系;熟悉Spring Cloud微服务开发模式;熟悉Mysql、Redis、分布式消息中间件Rabbitmq;具有良好的编码规范，对自己的编码质量有严格的要求，具备快速的学习能力及问题解决能力;喜爱编程，有强烈的责任心和团队精神，乐于分享与沟通。', 0, '2019-02-13 09:00:56', '2019-04-04 12:01:03');
INSERT INTO `tb_job` VALUES (2, 'Java开发工程师', 2, '大专', '2', '12k-14k', '参与公司产品的需求分析、设计、JAVA程序开发、测试工作;根据要求，参与编写相关设计文档、部署文档等;参与软件系统的系统架构设计、关键技术问题攻关工作;研究开发相关的技术细节；完成程序的单元测试；根据需要不断修改完善软件;完成上级领导交办的其他工作', '大专以上学历;2年以上的JAVA开发经验;熟悉设计模式，熟练使用主流开源框架，如STRUTS、SPRING、HIBERNATE、IBATIS等;熟悉各种WEB前端技术，AJAX/CSS/JAVASCRIPT/JQUERY，HTML5等;熟悉 nio，多线程开发;使用TOMCAT或WEBLOGIC等应用服务器软件的管理、配置、开发和测试', 0, '2019-02-13 09:03:55', '2019-02-13 09:03:58');
INSERT INTO `tb_job` VALUES (3, 'Web前端工程师', 1, '本科', '2', '11k-14k', '负责部门前端业务需求的研发与技术支持，负责产品的HTML页面架构设计和开发工作;根据产品需求，与后台开发工程师配合，分析并给出最优的页面前端结构解决方案;应用新技术，设计开发极具用户体验的前端产品应用场景，能够保障进度，不断提升效率和产能，追求高性能，有针对性实施前后端分离;创建相关前端框架标准及规范', '两年以上的前端项目开发经验，能力强者学历不限;熟练使用(X)HTML/CSS/JavaScript开发语言，熟悉JavaScript的核心技术，包括并不限于AJAX、DOM、BOM、JSON等，熟练解决多种浏览器兼容、以及跨域访问等问题;精通Javascript以及相关的类库(JQuery等)的使用，等独立封装基于JQuery的相关插件;对前端开发规范、工程化、组件化、测试有深入认识和实践，有nodejs和移动端开发经验优先;能使用 Photoshop 等进行基本的图片处理;熟悉Web前端MVC/MVVM架构，有HTML5 App或者 React、Vue 等开发经验者优先', 0, '2019-02-13 09:09:16', '2019-02-13 09:09:19');
INSERT INTO `tb_job` VALUES (4, 'WEB前端实习生', 5, '本科', '0', '6k-8k', '负责前端JS开发框架的搭建，前端代码编写;根据前端UI设计实现页面的切换;现有系统的浏览器兼容性调整;Web前端表现层及与前后端交互的架构设计和开发', '本科及以上学历，2019届毕业生;具备良好的逻辑思维;高度的责任心，优秀的沟通能力和团队协作能力;热爱互联网，喜欢钻研', 0, '2019-02-13 09:11:58', '2019-02-13 09:12:00');
INSERT INTO `tb_job` VALUES (5, 'Java开发实习生', 2, '本科', '0', '6k-8k', '在Java开发工程师的带领下定期完成量化的工作要求;根据Java开发进度和任务分配，完成相应模块软件的开发任务', '理解JVM原理，熟练运用Java基本类库;有Java网络开发经验，理解Http协议;有SpringMVC、SpringBoot等框架使用经验，能够独立开发Web应用;有MySQL使用经验，熟练使用SQL;有良好的编码习惯和代码风格;有较强的沟通能力，并能在一定程度上主导开发沟通;有责任感，使命必达，能与他人协作完成工作', 0, '2019-02-13 09:14:08', '2019-02-13 09:14:11');
INSERT INTO `tb_job` VALUES (6, '数据库开发实习生', 3, '本科', '0', '6k-8k', '根据业务需求，完成产品&解决方案后台逻辑设计，并通过数据库语言实现业务逻辑;负责数据需求开发、测试、数据迁移;依据公司、部门要求，编写相关开发过程文档', '2020届应届毕业生，本科及以上学历，计算机软件、通讯相关专业;熟悉ORACLE存储过程编程，有一定的数据库设计经验，具有扎实SQL功底，掌握数据库SQL优化，了解etl体系，了解shell编程;精通SQL Server、了解ORACEL等主流数据库，SQL熟练，能写复杂的存储过程，程序优化能力强;了解ETL和OLAP相关知识，熟悉SSIS和SSAS，使用过市场主流的BI工具、或OLAP应用经验优先', 0, '2019-02-13 09:16:47', '2019-02-13 09:16:51');
INSERT INTO `tb_job` VALUES (7, 'DBA数据库工程师', 1, '大专', '2', '11k-14k', '负责业务业系统数据库架构设计，概念模型、逻辑模型及物理模型设计;负责SQL存储过程的编写等数据库应用开发;制定并执行数据库的高性能、高可用和高可扩展性保障方案;负责数据库服务器及数据库系统的日常维护和监控，保障线上业务的正常运转，及时处理运维事故，降低故障风险;负责进行SQL代码优化，制定并执行生产环境数据库持续性能调化方案;负责MySQL、Redis、MongoDB等数据库的性能监控、调优、维护相关开发文档', '计算机或相关专业，大专以上学历，有SQL Server DBA相关工作经验;熟悉SQL Server日常管理，性能分析和优化，深入掌握SQL和T-SQL，熟悉关系数据库原理和设计;熟悉MYSQL数据库体系结构,熟悉复杂存储过程等的编写，具备较好SQL优化能力;对数据结构、程序设计与算法分析有较深的功底;熟悉MongoDB、Redis、HBase 等NoSql数据库技术;有大型游戏数据库设计开发经验者优先', 0, '2019-02-13 09:19:10', '2019-02-13 09:19:12');

-- ----------------------------
-- Table structure for tb_job_description_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_job_description_template`;
CREATE TABLE `tb_job_description_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `experience` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `responsibility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `demand` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_job_description_template
-- ----------------------------
INSERT INTO `tb_job_description_template` VALUES (1, 'Java开发工程师', '0', '在Java开发工程师的带领下定期完成量化的工作要求;根据Java开发进度和任务分配，完成相应模块软件的开发任务', '理解JVM原理，熟练运用Java基本类库;有Java网络开发经验，理解Http协议;有SpringMVC、SpringBoot等框架使用经验，能够独立开发Web应用;有MySQL使用经验，熟练使用SQL;有良好的编码习惯和代码风格;有较强的沟通能力，并能在一定程度上主导开发沟通;有责任感，使命必达，能与他人协作完成工作', '2019-04-04 12:09:59', '2019-04-04 12:10:01');
INSERT INTO `tb_job_description_template` VALUES (2, 'Java开发工程师', '1', '参与公司产品的需求分析、设计、JAVA程序开发、测试工作;根据要求，参与编写相关设计文档、部署文档等;根据需要不断修改完善软件;完成上级领导交办的其他工作', '大专以上学历;1年以上的JAVA开发经验;熟悉设计模式，熟练使用主流开源框架，如STRUTS、SPRING、HIBERNATE、IBATIS等;熟悉 nio，多线程开发', '2019-04-04 12:16:59', '2019-04-04 12:17:01');
INSERT INTO `tb_job_description_template` VALUES (3, 'Java开发工程师', '2', '参与公司产品的需求分析、设计、JAVA程序开发、测试工作;根据要求，参与编写相关设计文档、部署文档等;参与软件系统的系统架构设计、关键技术问题攻关工作;研究开发相关的技术细节；完成程序的单元测试；根据需要不断修改完善软件;完成上级领导交办的其他工作', '大专以上学历;2年以上的JAVA开发经验;熟悉设计模式，熟练使用主流开源框架，如STRUTS、SPRING、HIBERNATE、IBATIS等;熟悉各种WEB前端技术，AJAX/CSS/JAVASCRIPT/JQUERY，HTML5等;熟悉 nio，多线程开发;使用TOMCAT或WEBLOGIC等应用服务器软件的管理、配置、开发和测试;熟悉JVM原理', '2019-04-04 12:10:53', '2019-04-04 12:10:55');
INSERT INTO `tb_job_description_template` VALUES (4, 'Java开发工程师', '3', '参与产品需求讨论、技术方案确定，以及技术研发和产品上线工作;负责后台管理平台功能开发;负责前端API服务接口开发;负责互联网产品与业务系统的接口设计和规范化开发工作;领导安排的其他工作', '3年以上JAVA开发经验，有扎实的Java基础(熟悉IO、多线程、集合等基础框架，熟悉分布式、缓存、消息等机制）;熟悉常用的java开发框架,如spring mvc、spring mybatis等, 熟练掌握 Spring Boot 技术体系;熟悉Spring Cloud微服务开发模式;熟悉Mysql、Redis、分布式消息中间件Rabbitmq;具有良好的编码规范，对自己的编码质量有严格的要求，具备快速的学习能力及问题解决能力;喜爱编程，有强烈的责任心和团队精神，乐于分享与沟通。', '2019-04-04 12:11:19', '2019-04-04 12:11:21');
INSERT INTO `tb_job_description_template` VALUES (5, 'Web前端工程师', '0', '负责前端JS开发框架的搭建，前端代码编写;根据前端UI设计实现页面的切换;现有系统的浏览器兼容性调整;Web前端表现层及与前后端交互的架构设计和开发', '本科及以上学历，2019届毕业生;具备良好的逻辑思维;高度的责任心，优秀的沟通能力和团队协作能力;热爱互联网，喜欢钻研', '2019-04-04 12:12:43', '2019-04-04 12:12:45');
INSERT INTO `tb_job_description_template` VALUES (6, 'Web前端工程师', '1', '根据产品需求，与后台开发工程师配合，分析并给出最优的页面前端结构解决方案;Web前端表现层及与前后端交互的架构设计和开发', '精通Javascript以及相关的类库(JQuery等)的使用，等独立封装基于JQuery的相关插件;对前端开发规范、工程化、组件化、测试有深入认识和实践，有nodejs和移动端开发经验优先;熟悉Web前端MVC/MVVM架构，有HTML5 App或者 React、Vue 等开发经验者优先', '2019-04-04 12:15:14', '2019-04-04 12:15:16');
INSERT INTO `tb_job_description_template` VALUES (7, 'Web前端工程师', '2', '负责部门前端业务需求的研发与技术支持，负责产品的HTML页面架构设计和开发工作;根据产品需求，与后台开发工程师配合，分析并给出最优的页面前端结构解决方案;应用新技术，设计开发极具用户体验的前端产品应用场景，能够保障进度，不断提升效率和产能，追求高性能，有针对性实施前后端分离;创建相关前端框架标准及规范', '两年以上的前端项目开发经验，能力强者学历不限;熟练使用(X)HTML/CSS/JavaScript开发语言，熟悉JavaScript的核心技术，包括并不限于AJAX、DOM、BOM、JSON等，熟练解决多种浏览器兼容、以及跨域访问等问题;精通Javascript以及相关的类库(JQuery等)的使用，等独立封装基于JQuery的相关插件;对前端开发规范、工程化、组件化、测试有深入认识和实践，有nodejs和移动端开发经验优先;能使用 Photoshop 等进行基本的图片处理;熟悉Web前端MVC/MVVM架构，有HTML5 App或者 React、Vue 等开发经验者优先', '2019-04-04 12:13:19', '2019-04-04 12:13:22');
INSERT INTO `tb_job_description_template` VALUES (8, 'Web前端工程师', '3', '负责部门前端业务需求的研发与技术支持，负责产品的HTML页面架构设计和开发工作;根据产品需求，与后台开发工程师配合，分析并给出最优的页面前端结构解决方案;应用新技术，设计开发极具用户体验的前端产品应用场景，能够保障进度，不断提升效率和产能，追求高性能，有针对性实施前后端分离;创建相关前端框架标准及规范', '三年以上的前端项目开发经验，能力强者学历不限;熟练使用(X)HTML/CSS/JavaScript开发语言，熟悉JavaScript的核心技术，包括并不限于AJAX、DOM、BOM、JSON等，熟练解决多种浏览器兼容、以及跨域访问等问题;精通Javascript以及相关的类库(JQuery等)的使用，等独立封装基于JQuery的相关插件;对前端开发规范、工程化、组件化、测试有深入认识和实践，有nodejs和移动端开发经验优先;能使用 Photoshop 等进行基本的图片处理;熟悉Web前端MVC/MVVM架构，有HTML5 App或者 React、Vue 等开发经验者优先', '2019-04-04 12:13:53', '2019-04-04 12:13:55');
INSERT INTO `tb_job_description_template` VALUES (9, 'DBA数据库工程师', '0', '根据业务需求，完成产品&解决方案后台逻辑设计，并通过数据库语言实现业务逻辑;负责数据需求开发、测试、数据迁移;依据公司、部门要求，编写相关开发过程文档', '本科及以上学历，计算机软件、通讯相关专业;熟悉ORACLE存储过程编程，有一定的数据库设计经验，具有扎实SQL功底，掌握数据库SQL优化，了解etl体系，了解shell编程;精通SQL Server、了解ORACEL等主流数据库，SQL熟练，能写复杂的存储过程，程序优化能力强;了解ETL和OLAP相关知识，熟悉SSIS和SSAS，使用过市场主流的BI工具、或OLAP应用经验优先', '2019-04-04 12:18:25', '2019-04-04 12:18:28');
INSERT INTO `tb_job_description_template` VALUES (10, 'DBA数据库工程师', '1', '负责MySQL、Redis、MongoDB等数据库的性能监控、调优、维护相关开发文档;根据业务需求，完成产品&解决方案后台逻辑设计，并通过数据库语言实现业务逻辑;负责数据需求开发、测试、数据迁移;依据公司、部门要求，编写相关开发过程文档', '精通SQL Server、了解ORACEL等主流数据库，SQL熟练，能写复杂的存储过程，程序优化能力强;了解ETL和OLAP相关知识，熟悉SSIS和SSAS;熟悉SQL Server日常管理，性能分析和优化，深入掌握SQL和T-SQL，熟悉关系数据库原理和设计', '2019-04-04 12:20:20', '2019-04-04 12:20:22');
INSERT INTO `tb_job_description_template` VALUES (11, 'DBA数据库工程师DBA数据库工程师', '2', '负责业务业系统数据库架构设计，概念模型、逻辑模型及物理模型设计;负责SQL存储过程的编写等数据库应用开发;制定并执行数据库的高性能、高可用和高可扩展性保障方案;负责数据库服务器及数据库系统的日常维护和监控，保障线上业务的正常运转，及时处理运维事故，降低故障风险;负责进行SQL代码优化，制定并执行生产环境数据库持续性能调化方案;负责MySQL、Redis、MongoDB等数据库的性能监控、调优、维护相关开发文档', '计算机或相关专业，大专以上学历，有SQL Server DBA相关工作经验;熟悉SQL Server日常管理，性能分析和优化，深入掌握SQL和T-SQL，熟悉关系数据库原理和设计;熟悉MYSQL数据库体系结构,熟悉复杂存储过程等的编写，具备较好SQL优化能力;对数据结构、程序设计与算法分析有较深的功底;熟悉MongoDB、Redis、HBase 等NoSql数据库技术;有大型游戏数据库设计开发经验者优先', '2019-04-04 12:19:01', '2019-04-04 12:19:03');
INSERT INTO `tb_job_description_template` VALUES (12, 'DBA数据库工程师', '3', '负责业务业系统数据库架构设计，概念模型、逻辑模型及物理模型设计;负责SQL存储过程的编写等数据库应用开发;制定并执行数据库的高性能、高可用和高可扩展性保障方案;负责数据库服务器及数据库系统的日常维护和监控，保障线上业务的正常运转，及时处理运维事故，降低故障风险;负责进行SQL代码优化，制定并执行生产环境数据库持续性能调化方案;负责MySQL、Redis、MongoDB等数据库的性能监控、调优、维护相关开发文档', '计算机或相关专业，大专以上学历，有SQL Server DBA相关工作经验;熟悉SQL Server日常管理，性能分析和优化，深入掌握SQL和T-SQL，熟悉关系数据库原理和设计;熟悉MYSQL数据库体系结构,熟悉复杂存储过程等的编写，具备较好SQL优化能力;对数据结构、程序设计与算法分析有较深的功底;熟悉MongoDB、Redis、HBase 等NoSql数据库技术;有大型游戏数据库设计开发经验者优先', '2019-04-04 12:19:20', '2019-04-04 12:19:21');

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `sender` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者',
  `receiver_id` int(11) NULL DEFAULT NULL,
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '读取状态',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES (1, '您的项目[APP评论数据分析系统]中成员[方小圆]离职，请尽快进行人员配置，保证项目按时交付，谢谢！', 'HR', 2, '任行', 0, '2019-04-26 15:32:19', '2019-04-26 15:32:24');
INSERT INTO `tb_message` VALUES (2, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 5, '王五', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (3, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 6, '赵六', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (4, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 8, '张凡', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (5, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 9, '张小凡', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (6, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 12, '方小园', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (7, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 13, '李一', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (8, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 14, '李二', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (9, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 15, '李三', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (10, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 19, '李八', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');
INSERT INTO `tb_message` VALUES (11, '您已加入项目[APP评论数据分析系统]，项目经理为[任行]', '系统', 23, '王三', 1, '2019-01-24 14:51:37', '2019-01-24 14:51:43');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限代码',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限的中文释义',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (1, 'employee:query', '查询员工', '2019-02-17 19:48:53', '2019-02-17 19:48:55');
INSERT INTO `tb_permission` VALUES (2, 'employee:add', '新增员工', '2019-02-17 19:51:44', '2019-02-17 19:51:47');
INSERT INTO `tb_permission` VALUES (3, 'employee:update', '修改员工', '2019-02-17 19:50:56', '2019-02-17 19:50:58');
INSERT INTO `tb_permission` VALUES (4, 'employee:delete', '删除员工', '2019-02-17 19:52:16', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (5, 'role:query', '查询角色权限', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (6, 'role:add', '新增角色权限', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (7, 'role:update', '修改角色权限', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (8, 'role:delete', '删除角色权限', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (9, 'train:query', '查询培训', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (10, 'train:add', '新增培训', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (11, 'train:update', '修改培训', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (12, 'train:delete', '删除培训', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (13, 'job:add', '新增职位', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (14, 'job:update', '修改职位', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (15, 'job:delete', '删除职位', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (16, 'candidate:query', '查询应聘者', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (17, 'candidate:update', '修改应聘者简历状态', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (18, 'contribute:query', '查询项目贡献', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (19, 'contribute:add', '新增项目贡献', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (20, 'contribute:update', '修改项目贡献', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (21, 'contribute:delete', '删除项目贡献', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (22, 'config:query', '查询项目人员配置', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (23, 'config:add', '新增项目人员配置', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (24, 'config:update', '修改项目人员配置', '2019-02-17 19:52:18', '2019-02-17 19:52:18');
INSERT INTO `tb_permission` VALUES (25, 'project:query', '查询项目', '2019-02-17 19:48:53', '2019-02-17 19:48:55');
INSERT INTO `tb_permission` VALUES (26, 'project:add', '新增项目', '2019-02-17 19:51:44', '2019-02-17 19:51:47');
INSERT INTO `tb_permission` VALUES (27, 'project:update', '修改项目', '2019-02-17 19:50:56', '2019-02-17 19:50:58');
INSERT INTO `tb_permission` VALUES (28, 'project:delete', '删除项目', '2019-02-17 19:52:16', '2019-02-17 19:52:18');

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目背景',
  `front_end_skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `front_end_num` int(2) NULL DEFAULT NULL,
  `back_end_skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `back_end_num` int(2) NULL DEFAULT NULL,
  `db_skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `db_num` int(2) NULL DEFAULT NULL,
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '项目经理id',
  `manager_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manager_status` tinyint(2) NULL DEFAULT NULL COMMENT '项目经理是否评价',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '0表示未启动，1表示进行中，2表示已结束',
  `predict_start` date NULL DEFAULT NULL COMMENT '预计开始时间',
  `start_date` date NULL DEFAULT NULL COMMENT '开始时间',
  `predict_end` date NULL DEFAULT NULL COMMENT '预计结束时间',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `manager_id`(`manager_id`) USING BTREE,
  CONSTRAINT `tb_project_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `tb_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES (1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 1, 2, '2018-02-16', '2018-02-21', '2018-05-09', '2018-01-08 18:32:43', '2018-05-10 18:34:27');
INSERT INTO `tb_project` VALUES (2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 1, 2, '2018-05-12', '2018-05-13', '2018-07-03', '2018-05-08 18:32:43', '2018-05-10 18:34:27');
INSERT INTO `tb_project` VALUES (3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 0, 2, '2018-07-13', '2018-07-15', '2018-09-09', '2018-07-08 18:32:43', '2018-07-10 18:34:27');
INSERT INTO `tb_project` VALUES (6, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 2, '任行', 0, 1, '2019-01-24', '2019-01-25', '2019-05-25', '2019-01-23 01:48:37', '2019-01-25 01:48:37');
INSERT INTO `tb_project` VALUES (7, 'IT教育课程考评系统', '随着互联网产业的高速发展，社会对计算机人才的需求不断增加，门槛不断变高，计算机专业就业开始出现问题。由于计算机人才掌握的技术不符合市场需求、网络面试题集杂乱无解析等，就业面试成了难关。在这样的现状下，IT行业应聘者非常需要一个完善的考评系统来检测自己的水平，模拟面试笔试，获取建议以扩大自身知识面、完善综合职业能力，提高就业竞争力，从而有自信应对IT行业就业现状。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,AngularJS', 2, 'Java,Maven,Hibernate,Spring,SpringBoot,Shiro,SpringMVC,Tomcat,Linux,git,docker', 4, 'MySQL,Oracle,MongoDB,SQL Server,memcached', 2, 3, '张三', 0, 0, '2019-05-20', NULL, '2019-09-10', '2019-03-01 18:41:58', '2019-03-13 09:17:52');
INSERT INTO `tb_project` VALUES (8, 'IT企业人力资源管理系统', '现今的大中型IT企业所涉及的业务领域非常广，项目包含的技术种类多，决定它要面临人力资源方面的挑战。一方面，企业很难准确地预测下个项目何时启动，以及需要什么样的人员配备，这使得提前培养和储备合适的人员很困难。很多时候公司为某类项目招聘或者培训了一批人员，结果项目却搁置了。另一方面，一旦项目合同签订，客户往往期望项目尽早启动，外包企业必须在短时间内为项目准备好人员。为了应对上述挑战，这些企业必须实现人力资源以及优化人力资源的配置和利用，其中重要的一环就是建立公司统一的人力资源管理系统。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,AngularJS', 2, 'Java,Maven,Hibernate,Spring,SpringBoot,Shiro,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,MongoDB,SQL Server,memcached', 2, 3, '张三', 0, 0, '2019-07-01', NULL, '2020-01-07', '2019-06-30 09:12:59', '2019-07-03 09:13:26');

-- ----------------------------
-- Table structure for tb_project_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_project_history`;
CREATE TABLE `tb_project_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `project_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emp_id` int(11) NULL DEFAULT NULL,
  `emp_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manage_id` int(11) NULL DEFAULT NULL,
  `manage_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  INDEX `manage_id`(`manage_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  CONSTRAINT `tb_project_history_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_project_history_ibfk_2` FOREIGN KEY (`manage_id`) REFERENCES `tb_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_project_history_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `tb_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_project_history
-- ----------------------------
INSERT INTO `tb_project_history` VALUES (1, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (2, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (3, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (4, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (5, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (6, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (7, 1, 'BIM三维模型展示系统', '随着互联网的发展，众多技术的更新迭代，建筑行业在互联网高速发展的背景下飞速发展，但是与同为第二产业的其他行业相比，2016年建筑行业产值利润率仅有3.48%。不仅如此，建筑行业中有相当一部分比例的成本花费在运行维护上。那么想要在运维上减少支出，运维所浪费的成本问题亟待解决，而运用BIM运维技术就是一种有效减少运维成本的方式。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (8, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (9, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (10, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (11, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (12, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (13, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (14, 2, '企业在线学习平台', '随着全球技术知识增长的迅速，许多公司对于员工个人素质的提高和业务能力提升尤为重视，希望员工能利用好碎片化时间，充实自己的知识和技能。希望培训系统能够更好的适应培训的短小、快速的特点，做到精准题型、精准培训，在最少的时间内，获得最大的培训收益', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (15, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (16, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (17, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (18, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (19, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (20, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (21, 3, '就业信息化系统', '目前就业网站虽然不在少数，发展的都比较完善，但是大部分网站都侧重于招聘信息的发布和检索，却很少考虑到用人单位、求职者的互动关系，导致一些就业信息不同步、就业信息准确性难以保障的问题。而且，求职者难以得到就业的形势、国家相关政策法规以及用人单位的热度和评价等信息。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (29, 6, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 15, '李三', '后端开发,后端测试', 2, '任行', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (30, 6, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 19, '李八', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `answer` tinyint(2) NULL DEFAULT NULL,
  `domain` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (1, '以下关于 abstract 关键字的说法，正确的是', 'abstract 可以与final 并列修饰同一个类。;abstract 类中不可以有private的成员。;abstract 类中必须全部是abstract方法。;abstract 方法必须在abstract类或接口中。', 3, 'Java', '2019-04-13 14:26:24', '2019-04-13 14:26:27');
INSERT INTO `tb_question` VALUES (2, '关于 Socket 通信编程，以下描述错误的是', '服务器端通过new ServerSocket()创建TCP连接对象;服务器端通过TCP连接对象调用accept()方法创建通信的Socket对象;客户端通过new Socket()方法创建通信的Socket对象;客户端通过new ServerSocket()创建TCP连接对象', 3, 'Java', '2019-04-13 14:28:37', '2019-04-13 14:28:39');
INSERT INTO `tb_question` VALUES (3, '命令javac-d参数的用途是', '指定编译后类层次的根目录;指定编译时需要依赖类的路径;指定编译时的编码;没有这一个参数', 0, 'Java', '2019-04-13 14:39:27', '2019-04-13 14:39:28');
INSERT INTO `tb_question` VALUES (4, '下面哪个行为被打断不会导致InterruptedException', 'Thread.join;Thread.sleep;Object.wait;CyclicBarrier.await;Thread.suspend', 4, 'Java', '2019-04-13 14:42:32', '2019-04-13 14:42:35');
INSERT INTO `tb_question` VALUES (5, 'volatile关键字的说法错误的是', '能保证线程安全;volatile关键字用在多线程同步中，可保证读取的可见性;JVM保证从主内存加载到线程工作内存的值是最新的;volatile能禁止进行指令重排序', 0, 'Java', '2019-04-13 14:44:10', '2019-04-13 14:44:12');
INSERT INTO `tb_question` VALUES (6, '下列哪种说法是正确的', '实例方法可直接调用超类的实例方法;实例方法可直接调用超类的类方法;实例方法可直接调用本类的类方法;实例方法可直接调用其他类的实例方法', 2, 'Java', '2019-04-13 15:01:24', '2019-04-13 15:01:25');
INSERT INTO `tb_question` VALUES (7, 'java中，StringBuilder和StringBuffer的区别，下面说法错误的是', 'StringBuffer是线程安全的;StringBuilder是非线程安全的;StringBuffer对 String 类型进行改变的时候其实都等同于生成了一个新的 String 对象，然后将指针指向新的 String 对象。;效率比较String<StringBuffer<StringBuilder，但是在 String S1 = “This is only a” + “ simple” + “ test”时，String效率最高。', 2, 'Java', '2019-04-13 15:03:59', '2019-04-13 15:04:00');
INSERT INTO `tb_question` VALUES (8, '下列有关Thread的描述，哪个是正确的', '启动一个线程的方法是：thread. run();结束一个线程的通常做法是：thread. stop();将一个线程标记成daemon线程，意味着当主线程结束，并且没有其它正在运行的非daemon线程时，该daemon线程也会自动结束。;让一个线程等待另一个线程的通知的方法是：thread. sleep()', 2, 'Java', '2019-04-13 15:07:31', '2019-04-13 15:07:34');
INSERT INTO `tb_question` VALUES (9, '语句：char foo=\'中\'，是否正确？（假设源文件以GB2312编码存储，并且以javac – encoding GB2312命令编译）', '正确;错误', 0, 'Java', '2019-04-13 15:09:51', '2019-04-13 15:09:53');
INSERT INTO `tb_question` VALUES (10, '在java7中，下列不能做switch()的参数类型是', 'int型;枚举类型;字符串;浮点型', 3, 'Java', '2019-04-13 15:10:53', '2019-04-13 15:10:55');
INSERT INTO `tb_question` VALUES (11, 'instanceof运算符能够用来判断一个对象是否为:', '一个类的实例;一个实现指定接口的类的实例;全部正确;一个子类的实例', 2, 'Java', '2019-04-13 15:15:56', '2019-04-13 15:15:58');
INSERT INTO `tb_question` VALUES (12, '下面有关java内存模型的描述，说法错误的是', 'JMM通过控制主内存与每个线程的本地内存之间的交互，来为java程序员提供内存可见性保证;“synchronized” — 保证在块开始时都同步主内存的值到工作内存，而块结束时将变量同步回主内存;“volatile” — 保证修饰后在对变量读写前都会与主内存更新。;如果在一个线程构造了一个不可变对象之后（对象仅包含final字段），就可以保证了这个对象被其他线程正确的查看', 3, 'Java', '2019-04-13 15:17:17', '2019-04-13 15:17:19');
INSERT INTO `tb_question` VALUES (13, '下面有关java的一些细节问题，描述错误的是', '构造方法不需要同步化;一个子类不可以覆盖掉父类的同步方法;定义在接口中的方法默认是public的;容器保存的是对象的引用', 1, 'Java', '2019-04-13 15:18:49', '2019-04-13 15:18:51');
INSERT INTO `tb_question` VALUES (14, 'java用（）机制实现了进程之间的同步执行', '监视器;虚拟机;多个CPU;异步调用', 0, 'Java', '2019-04-13 15:19:42', '2019-04-13 15:19:43');
INSERT INTO `tb_question` VALUES (15, '变量a是一个64位有符号的整数，初始值用16进制表示为：0Xf000000000000000； 变量b是一个64位有符号的整数，初始值用16进制表示为：0x7FFFFFFFFFFFFFFF。 则a-b的结果用10进制表示为多少？（）', '1;-(2^62+2^61+2^60+1);2^62+2^61+2^60+1;2^59+(2^55+2^54+…+2^2+2^1+2^0)', 2, 'Java', '2019-04-13 15:20:48', '2019-04-13 15:20:49');
INSERT INTO `tb_question` VALUES (16, '下列关于Java并发的说法中正确的是', 'CopyOnWriteArrayList适用于写多读少的并发场景;ReadWriteLock适用于读多写少的并发场景;ConcurrentHashMap的写操作不需要加锁，读操作需要加锁;只要在定义int类型的成员变量i的时候加上volatile关键字，那么多线程并发执行i++这样的操作的时候就是线程安全的了', 1, 'Java', '2019-04-13 15:23:55', '2019-04-13 15:23:57');
INSERT INTO `tb_question` VALUES (17, '设int x=1,float y=2,则表达式x/y的值是', '0;1;2;以上都不是', 3, 'Java', '2019-04-13 15:24:48', '2019-04-13 15:24:49');
INSERT INTO `tb_question` VALUES (18, '以下哪项不属于java类加载过程', '生成java.lang.Class对象;int类型对象成员变量赋予默认值;执行static块代码;类方法解析', 1, 'Java', '2019-04-13 15:26:41', '2019-04-13 15:26:42');
INSERT INTO `tb_question` VALUES (19, 'Java数据库连接库JDBC用到哪种设计模式', '生成器;桥接模式;抽象工厂;单例模式', 1, 'Java', '2019-04-13 15:29:37', '2019-04-13 15:29:38');
INSERT INTO `tb_question` VALUES (20, '在java7中,下列哪个说法是正确的:', 'ConcurrentHashMap使用synchronized关键字保证线程安全;HashMap实现了Collection接口;Arrays.asList方法返回java.util.ArrayList对象;SimpleDateFormat对象是线程不安全的', 3, 'Java', '2019-04-13 15:30:34', '2019-04-13 15:30:36');
INSERT INTO `tb_question` VALUES (21, '关于ApplicationContext接口，下列说法错误的是', '它是beanfactory的子接口;ApplicationContext是基于beanfactory而建立的，ApplicationContext继承了beanFactory的功能;fileSystemXmlApplicationContext是其子接口;ApplicationContext提供了对资源文件进行访问的支持', 2, 'Spring', '2019-04-13 15:36:37', '2019-04-13 15:36:38');
INSERT INTO `tb_question` VALUES (22, '关于AOP错误的是', 'AOP将散落在系统中的“方面”代码集中实现;AOP有助于提高系统可维护性;AOP已经表现出将要替代面向对象的趋势;AOP是一种设计模式，Spring提供了一种实现', 2, 'Spring', '2019-04-13 15:40:12', '2019-04-13 15:40:13');
INSERT INTO `tb_question` VALUES (23, '下面有关SPRING的事务传播特性，说法错误的是', 'PROPAGATION_SUPPORTS：支持当前事务，如果当前没有事务，就以非事务方式执行;PROPAGATION_REQUIRED：支持当前事务，如果当前没有事务，就抛出异常;PROPAGATION_REQUIRES_NEW：新建事务，如果当前存在事务，把当前事务挂起;PROPAGATION_NESTED：支持当前事务，新增Savepoint点，与当前事务同步提交或回滚', 1, 'Spring', '2019-04-13 15:41:21', '2019-04-13 15:41:22');
INSERT INTO `tb_question` VALUES (24, '下面哪一项对Servlet描述错误', 'Servlet是一个特殊的Java类，它必须直接或间接实现Servlet接口;Servlet接口定义了Servelt的生命周期方法;当多个客户请求一个Servlet时，服务器为每一个客户启动一个进程;Servlet客户线程调用service方法响应客户的请求', 2, 'Spring', '2019-04-13 15:43:05', '2019-04-13 15:43:06');
INSERT INTO `tb_question` VALUES (25, '在Servlet里，能实现重定向的方法有', '运用javax.servlet.http.HttpServletRequest接口的sendRedirect方法;运用javax.servlet.http.HttpServletResponse接口的sendRedirect方法;运用javax.servlet.RequestDispatcher接口的forward方法;运用javax.servlet.ResponseDispatcher接口的forward方法', 1, 'Spring', '2019-04-13 15:43:43', '2019-04-13 15:43:44');
INSERT INTO `tb_question` VALUES (26, '下面关于spring mvc 和struts2的描述，错误的是', 'spring mvc的入口是filter，而struts2是servlet;spring mvc是基于方法的设计，而struts2是基于类的设计;struts2有以自己的interceptor机制，spring mvc用的是独立的AOP方式;spring mvc的方法之间基本上独立的，独享request response数据，struts2所有Action变量是共享的', 0, 'Spring', '2019-04-13 15:44:24', '2019-04-13 15:44:25');
INSERT INTO `tb_question` VALUES (27, 'Servlet接口的方法有哪些', 'doGet方法;doPost方法;init方法;forward方法', 2, 'Spring', '2019-04-13 15:45:01', '2019-04-13 15:45:02');
INSERT INTO `tb_question` VALUES (28, 'spring的PROPAGATION_REQUIRES_NEW事务，下面哪些说法是正确的', '内部事务回滚会导致外部事务回滚;内部事务回滚了，外部事务仍然可以提交;外部事务回滚了，内部事务也跟着回滚;外部事务回滚了，内部事务仍然可以提交', 1, 'Spring', '2019-04-13 15:45:54', '2019-04-13 15:45:55');
INSERT INTO `tb_question` VALUES (29, '关于Spring MVC的核心控制器DispatcherServlet的作用，以下说法错误的是（ ）', '它负责处理HTTP请求;加载配置文件;实现业务操作;初始化上下应用对象ApplicationContext', 2, 'Spring', '2019-04-13 15:49:41', '2019-04-13 15:49:43');
INSERT INTO `tb_question` VALUES (30, '关于spring说法错误的是', 'spring是一个轻量级JAVA EE的框架集合;spring是“依赖注入”模式的实现;使用spring可以实现声明事务;spring提供了AOP方式的日志系统', 3, 'Spring', '2019-04-13 15:54:51', '2019-04-13 15:54:52');
INSERT INTO `tb_question` VALUES (31, '网络服务的daemon是:', 'netd;httpd;inetd;lpd', 0, 'Linux', '2019-04-13 16:28:47', '2019-04-13 16:28:48');
INSERT INTO `tb_question` VALUES (32, '\r\n每5分钟运行一次crond任务exam，下面哪项正确', '*/12 * * * * exam;5/* * * * * exam;* * */12 * * exam;*/5 * * * * exam', 3, 'Linux', '2019-04-13 16:29:29', '2019-04-13 16:29:30');
INSERT INTO `tb_question` VALUES (33, '假如你需要找出/etc/my.conf文件属于哪个包(package),你可以执行', 'rpm -requires/etc/my.conf;rpm -q/etc/my.conf;rpm -q|grep /etc/my.conf;rpm -qf /etc/my.conf', 3, 'Linux', '2019-04-13 16:30:06', '2019-04-13 16:30:07');
INSERT INTO `tb_question` VALUES (34, '终止一个前台进程可能用到的命令和操作', 'kill;ctrl+c;shut down;halt', 1, 'Linux', '2019-04-13 16:30:47', '2019-04-13 16:30:48');
INSERT INTO `tb_question` VALUES (35, '为了查看不断更新的日志文件，可以使用的指令是', 'cat -n;vi;more;tail -f', 2, 'Linux', '2019-04-13 16:32:10', '2019-04-13 16:32:11');
INSERT INTO `tb_question` VALUES (36, '在重新启动Linux系统的同时把内存中的信息写入硬盘，应使用（）命令实现', '#shutdown -r now;#halt;#reboot;#init3', 0, 'Linux', '2019-04-13 16:32:45', '2019-04-13 16:32:46');
INSERT INTO `tb_question` VALUES (37, '以下哪一个命令只查找源代码、二进制文件和帮助文件，而不是所以类型的文件？此命令查找的目录是由环境变量$PATH指定的', 'whereis;whatis;which;apropos', 0, 'Linux', '2019-04-13 16:33:22', '2019-04-13 16:33:23');
INSERT INTO `tb_question` VALUES (38, '你在服务器的D盘中启用磁盘配额，为每个用户分配10GB的磁盘空间。你选择“拒绝将磁盘空间分配给超过配额限制的用户”选项，某个用户说他不能把Microsoft Word 2000文档保存到他们部门的共享文件夹下。你怎样才能确保用户始终能超过10GB的数据保存到主目录中？', '在D盘配额配置中清除“拒绝将磁盘空间给超过配额限制的用户”选项;以管理员身份登录服务器，并获得所有共享组文件夹中文件的所有权;在服务器上创建一个新卷，把共享组文件夹移动到新的卷中;增加D卷上的配额限定，准许额外的空间给共享文件', 0, 'Linux', '2019-04-13 16:34:21', '2019-04-13 16:34:22');
INSERT INTO `tb_question` VALUES (39, '执行指令find / -name “test.c”,按ctrl+z后的提示有[1] 166,可以继续执行的方式有', 'kill 166;Ctrl+h;fg 1;bg 1', 2, 'Linux', '2019-04-13 16:35:22', '2019-04-13 16:35:23');
INSERT INTO `tb_question` VALUES (40, 'crontab文件由6个域组成，每个域之间用空格分隔，下列哪个排列方式是正确的？', 'MIN HOUR DAY MONTH YEAR COMMAND;MIN HOUR DAY MONTH DAYOFWEEK COMMAND;COMMAND HOUR DAY MONTH DAYOFWEEK;COMMAND YEAR MONTH DAY HOUR MIN', 1, 'Linux', '2019-04-13 16:37:28', '2019-04-13 16:37:29');
INSERT INTO `tb_question` VALUES (41, '下面选项关于linux下查看cpu,内存,swap,硬盘信息的命令描述错误的是？', 'cat  /proc/cpuinfo 查看CPU相关参数的linux系统命令;cat  /proc/meminfo 查看linux系统内存信息的linux系统命令;du -h: 查看硬盘信息;cat /proc/swaps ：查看所有swap分区的信息', 2, 'Linux', '2019-04-13 16:38:12', '2019-04-13 16:38:13');
INSERT INTO `tb_question` VALUES (42, '目录在linux文件系统中是以怎样的形式存在的？', '文件夹;文件;inode;软链接', 1, 'Linux', '2019-04-13 16:39:09', '2019-04-13 16:39:10');
INSERT INTO `tb_question` VALUES (43, '如果您想列出当前目录以及子目录下所有扩展名为“.txt”的文件，那么您可以使用的命令是（）', 'ls -d.txt;ls *.txt;find -name“*.txt”;find“.txt”', 2, 'Linux', '2019-04-13 16:40:49', '2019-04-13 16:40:50');
INSERT INTO `tb_question` VALUES (44, 'vivek希望将他的login ID从vivek改为viv，应该执行下列哪个命令？', 'usermod -l viv vivek;usermod -l vivek viv;usermod -m viv vivek;usermod -m vivek viv', 0, 'Linux', '2019-04-13 16:41:17', '2019-04-13 16:41:18');
INSERT INTO `tb_question` VALUES (45, '当前目录下有a和b两个文件，执行命令“ls>c”，请问文件c里面的内容是什么？', 'a;b;ab;abc', 3, 'Linux', '2019-04-13 16:41:58', '2019-04-13 16:41:59');
INSERT INTO `tb_question` VALUES (46, '下面有关孤儿进程和僵尸进程的描述，说法错误的是？', '孤儿进程：一个父进程退出，而它的一个或多个子进程还在运行，那么那些子进程将成为孤儿进程。;僵尸进程：一个进程使用fork创建子进程，如果子进程退出，而父进程并没有调用wait或waitpid获取子进程的状态信息，那么子进程的进程描述符仍然保存在系统中。这种进程称之为僵死进程。;孤儿进程将被init进程(进程号为1)所收养，并由init进程对它们完成状态收集工作。;孤儿进程和僵尸进程都可能使系统不能产生新的进程，都应该避免', 3, 'Linux', '2019-04-13 16:42:31', '2019-04-13 16:42:32');
INSERT INTO `tb_question` VALUES (47, '\r\n一个文件名字为rr.Z，可以用来解压缩的命令是：', 'tar;gzip;compress;uncompress', 3, 'Linux', '2019-04-13 16:43:14', '2019-04-13 16:43:15');
INSERT INTO `tb_question` VALUES (48, '下面关于Linux文件系统的inode描述错误的是：', 'inode和文件是一一对应的;inode描述了文件大小和指向数据块的指针;通过inode可获得文件占用的块数;通过inode可实现文件的逻辑结构和物理结构的转换', 0, 'Linux', '2019-04-13 16:44:48', '2019-04-13 16:44:49');
INSERT INTO `tb_question` VALUES (49, '命令:06 03 * * 3 lp /usr/local/message | mail -s \"server message\" root在（ ）自动执行：', '每周三06:03分;每周六03:03分;每周三03:06分;每周六03:06分', 2, 'Linux', '2019-04-13 16:46:11', '2019-04-13 16:46:12');
INSERT INTO `tb_question` VALUES (50, '下列选项中，会导致用户进程从用户态切换到内核的操作是? I. 整数除以零 II. sin( )函数调用   III. read系统调用', '仅 I、II;仅 I、III;仅 II 、III;I、II和III', 1, 'Linux', '2019-04-13 16:47:11', '2019-04-13 16:47:12');
INSERT INTO `tb_question` VALUES (51, '在Hibernate的HQL查询中，setFirstResults(3)方法中参数值3指的是', '从第3条记录开始;从第4条记录开始;查询3条记录;查询4条记录', 1, 'Hibernate', '2019-04-13 17:03:59', '2019-04-13 17:04:03');
INSERT INTO `tb_question` VALUES (52, '在Hibernate中，如果数据库是MySql或者SQLServer，则generator属性值不可以使用', 'hilo;native;sequence;indentity', 2, 'Hibernate', '2019-04-13 16:52:39', '2019-04-13 16:52:40');
INSERT INTO `tb_question` VALUES (53, '在Hibernate中，如果数据库是Oracle或者DB2，则generator属性值不可以使用', 'hilo;native;sequence;indentity', 3, 'Hibernate', '2019-04-13 16:53:07', '2019-04-13 16:53:08');
INSERT INTO `tb_question` VALUES (54, '在Hibernate中，下列哪个选项不属于Session的方法', 'load;save;open;delete', 2, 'Hibernate', '2019-04-13 16:54:25', '2019-04-13 16:54:26');
INSERT INTO `tb_question` VALUES (55, '在Hibernate中， generator属性值如果是native，则表示', '由Hibernate自动以自增的方式生成标识符，每次增量为1;由Hibernate自动以自增的方式生成标识符，每次增量为自定义;根据底层数据库对自动生成标识符的支持来选择;由Java应用程序负责生成标识符', 2, 'Hibernate', '2019-04-13 16:55:03', '2019-04-13 16:55:04');
INSERT INTO `tb_question` VALUES (56, ' 在Hibernate中，inverse属性值为（    ）时，会标识被控方', 'all;false;true;none', 2, 'Hibernate', '2019-04-13 16:55:54', '2019-04-13 16:55:55');
INSERT INTO `tb_question` VALUES (57, '在Hibernate中，如果需要标识主控方，则inverse属性值应为', 'all;false;true;none', 1, 'Hibernate', '2019-04-13 16:56:16', '2019-04-13 16:56:17');
INSERT INTO `tb_question` VALUES (58, '在Hibernate中，从性能方面考虑，inverse属性值通常设置为', 'all;false;true;none', 1, 'Hibernate', '2019-04-13 16:56:34', '2019-04-13 16:56:35');
INSERT INTO `tb_question` VALUES (59, '在Hibernate中，<set>元素有一个cascade属性，如果希望Hibernate级联保存集合中的对象，则cascade属性应该取什么值', 'none;save;save-update;delete', 2, 'Hibernate', '2019-04-13 16:57:42', '2019-04-13 16:57:43');
INSERT INTO `tb_question` VALUES (60, '下面哪一项不属于优化Hibernate所鼓励的', '使用单向一对多关联，不使用双向一对多;不用一对一，用多对一取代;配置对象缓存，不使用集合缓存;继承类使用显式多态', 0, 'Hibernate', '2019-04-13 15:29:37', '2019-04-13 15:29:38');
INSERT INTO `tb_question` VALUES (61, 'golang虽然没有显式的提供继承语法，但是通过匿名组合实现了继承。这一说法是否正确。', 'true;false', 0, 'Go', '2019-04-16 17:42:01', '2019-04-16 17:42:02');
INSERT INTO `tb_question` VALUES (62, 'channel本身必然是同时支持读写的，所以不存在单向channel。这一说法是否正确。', 'true;false', 1, 'Go', '2019-04-16 17:42:26', '2019-04-16 17:42:27');
INSERT INTO `tb_question` VALUES (63, '指针是基础类型,这一说法是否正确。', 'true;false', 1, 'Go', '2019-04-16 17:42:48', '2019-04-16 17:42:49');
INSERT INTO `tb_question` VALUES (64, '关于map，下面说法正确的是（）', 'map反序列化时json.unmarshal的入参必须为map的地址;在函数调用中传递map，则子函数中对map元素的增加不会导致父函数中map的修改;在函数调用中传递map，则子函数中对map元素的修改不会导致父函数中map的修改;不能使用内置函数delete删除map的元素', 0, 'Go', '2019-04-16 17:43:21', '2019-04-16 17:43:22');
INSERT INTO `tb_question` VALUES (65, '\r\n数组是一个值类型,这一说法是否正确。', 'true;false', 0, 'Go', '2019-04-16 17:44:30', '2019-04-16 17:44:31');
INSERT INTO `tb_question` VALUES (66, 'import后面的最后一个元素是包名（）', 'true;false', 1, 'Go', '2019-04-16 17:44:55', '2019-04-16 17:44:56');
INSERT INTO `tb_question` VALUES (67, '通过成员变量或函数首字母的大小写来决定其作用域,这一说法是否正确。', 'true;false', 0, 'Go', '2019-04-16 17:46:42', '2019-04-16 17:46:44');
INSERT INTO `tb_question` VALUES (68, 'golang中没有构造函数的概念，对象的创建通常交由一个全局的创建函数来完成，以NewXXX来命名。这一说法是否正确。', 'true;false', 0, 'Go', '2019-04-16 17:47:04', '2019-04-16 17:47:05');
INSERT INTO `tb_question` VALUES (69, '内置函数delete可以删除数组切片内的元素,这一说法是否正确。', 'true;false', 1, 'Go', '2019-04-16 17:48:55', '2019-04-16 17:48:57');
INSERT INTO `tb_question` VALUES (70, '函数执行时，如果由于panic导致了异常，则延迟函数不会执行。这一说法是否正确。', 'true;false', 1, 'Go', '2019-04-16 17:47:43', '2019-04-16 17:47:45');

-- ----------------------------
-- Table structure for tb_recruit
-- ----------------------------
DROP TABLE IF EXISTS `tb_recruit`;
CREATE TABLE `tb_recruit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简历在系统中存放的路径',
  `job_id` int(11) NULL DEFAULT NULL COMMENT '职位外键',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '处理情况',
  `emp_id` int(11) NULL DEFAULT NULL COMMENT '处理人id',
  `emp_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE,
  CONSTRAINT `tb_recruit_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_recruit_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `tb_job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_recruit
-- ----------------------------
INSERT INTO `tb_recruit` VALUES (1, '何艾', '13777580611', 'heai@163.com', 'G:/static/resumes/resume0.md', 1, 1, 4, '李四', '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (2, '王小明', '13777080611', 'xiaoming@163.com', 'G:/static/resumes/resume1.md', 1, 2, 4, '李四', '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (3, '董光', '13777980611', 'dguang@163.com', 'G:/static/resumes/resume2.md', 1, 0, NULL, NULL, '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (4, '李秀丽', '13777710611', 'lixiuli@163.com', 'G:/static/resumes/resume3.md', 3, 0, NULL, NULL, '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (5, '吴广', '13777710622', 'wuguang@126.com', 'G:/static/resumes/resume4.md', 3, 0, NULL, NULL, '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (6, '孙毅', '15896321475', 'sunyi@qq.com', 'G:/static/resumes/resume5.md', 2, 0, NULL, NULL, '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (7, '钱凯', '15896327894', 'qiankai@qq.com', 'G:/static/resumes/resume6.md', 2, 0, NULL, NULL, '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (8, '雷文', '15896327000', 'leiwen@gmail.com', 'G:/static/resumes/resume7.pdf', 1, 0, NULL, NULL, '2019-02-16 04:17:57', '2019-02-16 04:17:57');

-- ----------------------------
-- Table structure for tb_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_report`;
CREATE TABLE `tb_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_project` int(11) NULL DEFAULT NULL,
  `avg_work_time` float(11, 0) NULL DEFAULT NULL,
  `avg_project` float(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '员工', '2019-01-12 19:18:38', '2019-01-12 19:18:41');
INSERT INTO `tb_role` VALUES (2, '项目经理', '2019-01-12 19:19:16', '2019-01-12 19:19:18');
INSERT INTO `tb_role` VALUES (3, '管理员', '2019-01-12 19:19:36', '2019-01-12 19:19:38');
INSERT INTO `tb_role` VALUES (4, 'HR', '2019-01-12 19:19:36', '2019-01-12 19:19:36');

-- ----------------------------
-- Table structure for tb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_permission`;
CREATE TABLE `tb_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id，尝试使用代码而不是外键来维护关系',
  `permission_id` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role_permission
-- ----------------------------
INSERT INTO `tb_role_permission` VALUES (1, 3, 1);
INSERT INTO `tb_role_permission` VALUES (2, 3, 2);
INSERT INTO `tb_role_permission` VALUES (3, 3, 3);
INSERT INTO `tb_role_permission` VALUES (4, 3, 4);
INSERT INTO `tb_role_permission` VALUES (5, 3, 5);
INSERT INTO `tb_role_permission` VALUES (6, 3, 6);
INSERT INTO `tb_role_permission` VALUES (7, 3, 7);
INSERT INTO `tb_role_permission` VALUES (8, 3, 8);
INSERT INTO `tb_role_permission` VALUES (9, 4, 9);
INSERT INTO `tb_role_permission` VALUES (10, 4, 10);
INSERT INTO `tb_role_permission` VALUES (11, 4, 11);
INSERT INTO `tb_role_permission` VALUES (12, 4, 12);
INSERT INTO `tb_role_permission` VALUES (13, 4, 13);
INSERT INTO `tb_role_permission` VALUES (14, 4, 14);
INSERT INTO `tb_role_permission` VALUES (15, 4, 15);
INSERT INTO `tb_role_permission` VALUES (16, 4, 16);
INSERT INTO `tb_role_permission` VALUES (17, 4, 17);
INSERT INTO `tb_role_permission` VALUES (18, 1, 18);
INSERT INTO `tb_role_permission` VALUES (19, 2, 18);
INSERT INTO `tb_role_permission` VALUES (20, 2, 19);
INSERT INTO `tb_role_permission` VALUES (21, 2, 20);
INSERT INTO `tb_role_permission` VALUES (22, 2, 21);
INSERT INTO `tb_role_permission` VALUES (23, 2, 22);
INSERT INTO `tb_role_permission` VALUES (24, 2, 23);
INSERT INTO `tb_role_permission` VALUES (25, 2, 24);
INSERT INTO `tb_role_permission` VALUES (26, 2, 25);
INSERT INTO `tb_role_permission` VALUES (27, 2, 26);
INSERT INTO `tb_role_permission` VALUES (28, 2, 27);
INSERT INTO `tb_role_permission` VALUES (29, 2, 28);
INSERT INTO `tb_role_permission` VALUES (30, 4, 1);
INSERT INTO `tb_role_permission` VALUES (31, 4, 2);
INSERT INTO `tb_role_permission` VALUES (32, 4, 3);
INSERT INTO `tb_role_permission` VALUES (33, 4, 4);
INSERT INTO `tb_role_permission` VALUES (34, 1, 25);

-- ----------------------------
-- Table structure for tb_skill
-- ----------------------------
DROP TABLE IF EXISTS `tb_skill`;
CREATE TABLE `tb_skill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `domain` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_skill
-- ----------------------------
INSERT INTO `tb_skill` VALUES (1, 'Java', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (2, 'Maven', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (3, 'MyBatis', '后端', '2019-01-08 19:46:37', '2019-01-08 19:46:40');
INSERT INTO `tb_skill` VALUES (4, 'Hibernate', '后端', '2019-01-08 19:46:53', '2019-01-08 19:46:58');
INSERT INTO `tb_skill` VALUES (5, 'Spring', '后端', '2019-01-08 19:47:08', '2019-01-08 19:47:12');
INSERT INTO `tb_skill` VALUES (6, 'SpringBoot', '后端', '2019-01-08 19:47:27', '2019-01-08 19:47:30');
INSERT INTO `tb_skill` VALUES (7, 'SpringData', '后端', '2019-01-08 19:47:41', '2019-01-08 19:47:45');
INSERT INTO `tb_skill` VALUES (8, 'Shiro', '后端', '2019-01-08 19:48:03', '2019-01-08 19:48:06');
INSERT INTO `tb_skill` VALUES (9, 'SpringSecurity', '后端', '2019-01-08 19:48:16', '2019-01-08 19:48:19');
INSERT INTO `tb_skill` VALUES (10, 'SpringMVC', '后端', '2019-01-08 19:48:39', '2019-01-08 19:48:43');
INSERT INTO `tb_skill` VALUES (11, 'Netty', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (12, 'Tomcat', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (13, 'Gradle', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (14, 'Go', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (15, 'Beego', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (16, 'Gin', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (17, 'Iris', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (18, 'MySQL', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (19, 'Oracle', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (20, 'SQL Server', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (21, 'Redis', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (22, 'MongoDB', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (23, 'memcached', '数据库', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (24, 'jQuery', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (25, 'node.js', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (26, 'AngularJS', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (27, 'webpack', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (28, 'React.js', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (29, 'Vue.js', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (30, 'Bootstrap', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (31, 'HTML5', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (32, 'CSS3', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (33, 'LESS', '前端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (34, 'Ngnix', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (35, 'Linux', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (36, 'git', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');
INSERT INTO `tb_skill` VALUES (37, 'docker', '后端', '2019-01-08 19:45:35', '2019-01-08 19:45:40');

-- ----------------------------
-- Table structure for tb_skill_proficiency
-- ----------------------------
DROP TABLE IF EXISTS `tb_skill_proficiency`;
CREATE TABLE `tb_skill_proficiency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `proficiency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_train
-- ----------------------------
DROP TABLE IF EXISTS `tb_train`;
CREATE TABLE `tb_train`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '培训课程名',
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '培训时间',
  `domain` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '培训领域',
  `speaker` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主讲人',
  `emps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '报名员工',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '报名截止时间',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '培训课程状态，0表示未开始，1表示进行中，2表示已完成',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_train
-- ----------------------------
INSERT INTO `tb_train` VALUES (1, '设计模式培训', '2019-02-22:14-16:六大常用模式介绍与实现;2019-02-28:14-16:其他模式介绍与实现', '编码', 'K大', '李六;王二;王五;何小茜;张小凡;李琪琪;李一;张三', '2019-01-26 16:00:00', 2, '2019-01-22 16:37:08', '2019-02-28 16:37:10');
INSERT INTO `tb_train` VALUES (2, 'Java虚拟机', '2019-03-01:14-16:Java虚拟机基本知识;2019-03-08:14-16:Java虚拟机高级部分1;2019-03-16:14-16:Java虚拟机高级部分2;2019-03-22:14-16:Java虚拟机调优和错误解决', '架构', 'R大', '任行;张三;李六;王二;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园', '2019-02-13 09:00:00', 2, '2019-02-09 09:31:41', '2019-02-13 09:31:45');
INSERT INTO `tb_train` VALUES (3, 'Java虚拟机', '2019-03-01:14-16:Java虚拟机基本知识;2019-03-08:14-16:Java虚拟机高级部分1;2019-03-16:14-16:Java虚拟机高级部分2;2019-03-22:14-16:Java虚拟机调优和错误解决', '架构', 'R大', '任行;张三;李六;王二;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园', '2019-02-16 09:00:00', 2, '2019-02-09 09:31:41', '2019-02-21 09:31:45');
INSERT INTO `tb_train` VALUES (4, 'Java虚拟机', '2019-03-01:14-16:Java虚拟机基本知识;2019-03-08:14-16:Java虚拟机高级部分1;2019-03-16:14-16:Java虚拟机高级部分2;2019-03-22:14-16:Java虚拟机调优和错误解决', '架构', 'R大', '任行;张三;李六;王二;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园', '2019-02-17 09:00:00', 2, '2019-02-09 09:31:41', '2019-02-26 09:31:45');
INSERT INTO `tb_train` VALUES (5, 'Java虚拟机', '2019-03-01:14-16:Java虚拟机基本知识;2019-03-08:14-16:Java虚拟机高级部分1;2019-03-16:14-16:Java虚拟机高级部分2;2019-03-22:14-16:Java虚拟机调优和错误解决', '架构', 'R大', '任行;张三;李六;王二;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园', '2019-02-24 09:00:00', 2, '2019-02-09 09:31:41', '2019-02-28 09:31:45');
INSERT INTO `tb_train` VALUES (6, '设计模式培训', '2019-02-22:14-16:六大常用模式介绍与实现;2019-02-28:14-16:其他模式介绍与实现', '编码', 'K大', '李六;王二;王五;何小茜;张小凡;李琪琪;李一', '2019-01-26 16:00:00', 2, '2019-01-22 16:37:08', '2019-02-28 16:37:10');
INSERT INTO `tb_train` VALUES (7, 'Java虚拟机', '2019-03-01:14-16:Java虚拟机基本知识;2019-03-08:14-16:Java虚拟机高级部分1;2019-03-16:14-16:Java虚拟机高级部分2;2019-03-22:14-16:Java虚拟机调优和错误解决', '架构', 'R大', '任行;李六;王二;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园', '2019-02-13 09:00:00', 2, '2019-02-09 09:31:41', '2019-02-13 09:31:45');
INSERT INTO `tb_train` VALUES (8, 'JS模块化', '2019-05-20:10-11:AMD规范;2019-05-24:10-11:ES6规范;2019-05-28:10-11:commonjs', '前端', 'Y大', '任行;李六;王二;王五;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园;张三', '2019-05-12 10:00:00', 0, '2019-02-11 02:08:44', '2019-02-12 02:42:49');

-- ----------------------------
-- Table structure for tb_train_demand
-- ----------------------------
DROP TABLE IF EXISTS `tb_train_demand`;
CREATE TABLE `tb_train_demand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_train_demand
-- ----------------------------
INSERT INTO `tb_train_demand` VALUES (1, 2, '任行', '中间件', 'Zookeeper,Kafka', '2019-03-25 14:54:56', '2019-03-26 14:59:05');
INSERT INTO `tb_train_demand` VALUES (2, 3, '张三', '大数据', 'Hadoop,Hive,HBase,Spark,Zookeeper', '2019-03-26 14:59:27', '2019-03-26 15:00:12');
INSERT INTO `tb_train_demand` VALUES (3, 5, '王五', '前端', 'TypeScript,yarn', '2019-03-29 15:03:25', '2019-03-29 15:03:27');
INSERT INTO `tb_train_demand` VALUES (4, 3, '张三', '中间件', 'Zookeeper,Kafka', '2019-04-20 14:54:56', '2019-04-24 13:21:44');

SET FOREIGN_KEY_CHECKS = 1;
