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

 Date: 08/04/2019 14:00:35
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
INSERT INTO `tb_employee` VALUES (1, '1001', 'sonkabin', '955766906007172822e851119fca4bd6', 1, 26, '1994-07-05', '15858111111', 'sonkabin@gmail.com', '339005199407064312', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:xx大学', 1, 1, 'Java:8;MySQL:4;Linux:3;Spring:3;MyBatis:3;Hibernate:3;SpringBoot:3', 3, '2018-01-01 19:18:18', '2019-01-22 07:18:58');
INSERT INTO `tb_employee` VALUES (2, '1002', '任行', '0f932f33dd242e50b88d959807b66462', 1, 24, '1996-09-18', '15833333333', 'renxing@qq.com', '339005199609224789', 'G:/static/avatars/avatar1002', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:9;MySQL:8;Spring:8;MyBatis:7;Hibernate:6;SpringBoot:7;SpringData:6;Maven:6;SpringMVC:8;Netty:6;Tomcat:7;Gradle:4;Ngnix:6;Linux:7;git:6;docker:7;Shiro:7;SpringSecurity:5;Oracle:5;Redis:8;SQL Server:4', 2, '2018-01-03 12:22:52', '2019-01-23 02:21:16');
INSERT INTO `tb_employee` VALUES (3, '1003', '张三', '8e12514181ffb7a0511bb1f9af2140ae', 1, 30, '1990-07-27', '15858118888', 'zhangsan@163.com', '33900419907319874', 'G:/static/avatars/avatar1003', '本科:cc大学;硕士:qq大学;博士及以上:oo大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;docker:1;Maven:3', 2, '2018-01-04 18:47:45', '2019-02-16 05:14:01');
INSERT INTO `tb_employee` VALUES (4, '1004', '李四', '2e163295e866cb8c3175a8301e45289a', 0, 30, '1990-06-30', '15858158888', 'lisi@163.com', '339005199007048795', 'G:/static/avatars/avatar1004', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:7;jQuery:8;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:7;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:6', 1, '2018-01-20 09:51:20', '2019-01-22 10:55:01');
INSERT INTO `tb_employee` VALUES (5, '1005', '王五', '3899f181107fc446ecef3b0b1d9d0891', 0, 28, '1992-12-24', '15858178987', 'wangwu@126.com', '339005199212287896', 'G:/static/avatars/avatar1005', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:7;jQuery:8;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:7;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:6', 1, '2018-01-20 09:53:37', '2019-01-23 02:12:50');
INSERT INTO `tb_employee` VALUES (6, '1006', '赵六', 'c0123e0cbc5ef6ba5a7e1eecb0100eba', 0, 35, '1985-02-28', '17858789874', 'zhaoliu@qq.com', '339005198503037841', 'G:/static/avatars/avatar1006', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:7;jQuery:8;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:7;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:6', 1, '2018-01-20 09:55:02', '2019-01-22 10:55:11');
INSERT INTO `tb_employee` VALUES (7, '1007', '田七', '4ddcf6ada96e50d433e92b018246db7b', 1, 33, '1987-04-20', '1785878631', 'tianqi@qq.com', '339005198704239874', 'G:/static/avatars/avatar1007', '本科:xx大学;硕士:cc大学', 1, 1, 'Vue.js:7;jQuery:8;HTML5:8;node.js:5;React.js:6;webpack:5;Bootstrap:7;CSS3:7;LESS:7;git:5;MongoDB:5;AngularJS:6', 1, '2018-01-20 09:55:54', '2019-01-22 10:55:13');
INSERT INTO `tb_employee` VALUES (8, '1008', '张凡', 'f350d6f4f2bf1c3e30301870ecee4bbc', 1, 29, '1991-08-31', '15858119999', 'zhangfan@gmail.com', '339005199109034851', 'G:/static/avatars/avatar1008', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:9;MyBatis:9;Hibernate:5;Linux:9;Spring:9;SpringBoot:8;Maven:7;SpringData:8;SpringSecurity:6;SpringMVC:9;Netty:8;Tomcat:9;MySQL:9;Oracle:7;Redis:9;Shiro:6;Ngnix:8;Linux:9;git:8;docker:8', 1, '2018-01-20 10:04:11', '2019-01-23 02:36:28');
INSERT INTO `tb_employee` VALUES (9, '1009', '张小凡', 'bc34b40c7d0a0fe9917a220080294425', 1, 29, '1991-08-31', '15858119998', 'zhangxiaofan@gmail.com', '339005199109033654', 'G:/static/avatars/avatar1009', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:50', '2019-01-22 10:55:17');
INSERT INTO `tb_employee` VALUES (10, '1010', '李琪琪', '0bd6391ce6b2bab001e2b0b348d28324', 0, 27, '1993-05-28', '15878954123', 'liqiqi@qq.com', '339005199305313654', 'G:/static/avatars/avatar1010', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:06:01', '2019-01-22 10:55:19');
INSERT INTO `tb_employee` VALUES (11, '1011', '何小茜', 'be9079046cdaca2a7ea777fa3b1ab76f', 0, 26, '1994-04-12', '15888883695', 'hexiaoqian@qq.com', '339005199404159513', 'G:/static/avatars/avatar1011', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:07:12', '2019-01-22 10:55:22');
INSERT INTO `tb_employee` VALUES (12, '1012', '方小园', '2c752a7bd9ee373b8c710a453924a38a', 0, 24, '1996-10-07', '15887453333', 'xiaoyuan@126.com', '339005199610105874', 'G:/static/avatars/avatar1012', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:08:37', '2019-04-02 13:20:20');
INSERT INTO `tb_employee` VALUES (13, '1013', '李一', 'b8d1545b8d6dc40494fa34785f7f8d49', 1, 29, '1991-08-30', '15858119991', 'liyi@gmail.com', '339005199109034852', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:31');
INSERT INTO `tb_employee` VALUES (14, '1014', '李二', '7d74de417f300b10c6e9d3b0afba7d92', 1, 29, '1991-08-30', '15858119992', 'lier@gmail.com', '339005199109034853', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:34');
INSERT INTO `tb_employee` VALUES (15, '1015', '李三', '9ca8181226387ddd3e590f3773233c0e', 1, 29, '1991-08-30', '15858119993', 'lisan@gmail.com', '339005199109034854', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:36');
INSERT INTO `tb_employee` VALUES (16, '1016', '李五', 'ae8d337b2f2a1a95a2278a3116939312', 1, 29, '1991-08-30', '15858119994', 'liwu@gmail.com', '339005199109034855', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:39');
INSERT INTO `tb_employee` VALUES (17, '1017', '李六', 'a95c4884126cf512cea102d5b910aaae', 1, 29, '1991-08-30', '15858119995', 'liliu@gmail.com', '339005199109034856', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:41');
INSERT INTO `tb_employee` VALUES (18, '1018', '李七', '6085df4eac68a577b7dbed1ccaae1e6a', 1, 29, '1991-08-30', '15858119996', 'liqi@gmail.com', '339005199109034857', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:43');
INSERT INTO `tb_employee` VALUES (19, '1019', '李八', '54d5eff621d754f82fc4b96fa256aa4c', 1, 29, '1991-08-30', '15858119997', 'liba@gmail.com', '339005199109034858', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:45');
INSERT INTO `tb_employee` VALUES (20, '1020', '李九', 'c8a1c4ef272596434310b477a76b3435', 1, 29, '1991-08-30', '15858119901', 'lijiu@gmail.com', '339005199109034859', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:48');
INSERT INTO `tb_employee` VALUES (21, '1021', '王一', 'e2d750d1861f4435b97776088016be44', 1, 29, '1991-08-30', '15858119902', 'wangyi@gmail.com', '339005199109034860', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:51');
INSERT INTO `tb_employee` VALUES (22, '1022', '王二', '1c5555ef145d112837caed8833d2cb3b', 1, 29, '1991-08-30', '15858119902', 'wanger@gmail.com', '339005199109034861', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:53');
INSERT INTO `tb_employee` VALUES (23, '1023', '王三', 'cb8fdbca5a6d847022d10e126d782d5b', 1, 29, '1991-08-30', '15858119903', 'wangsan@gmail.com', '339005199109034862', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:54');
INSERT INTO `tb_employee` VALUES (24, '1024', '王四', '6a73df3fb331633a07dcec6a6ed74fbc', 1, 29, '1991-08-30', '15858119904', 'wangsi@gmail.com', '339005199109034863', 'G:/static/avatars/avatar1001', '本科:xx大学;硕士:cc大学', 1, 1, 'Java:8;MySQL:5;Linux:3;Spring:4;MyBatis:4;Hibernate:3;SpringBoot:4;git:3;SpringMVC:5;Redis:2;docker:1;Tomcat:4;Maven:3', 1, '2018-01-20 10:04:11', '2019-01-23 02:44:56');

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
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '进行中的项目为1，已结束的项目为2',
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
INSERT INTO `tb_human_config` VALUES (1, 1, 2, '任行', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (2, 1, 3, '张三', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (3, 1, 5, '王五', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (4, 1, 6, '赵六', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (5, 1, 7, '田七', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (6, 1, 8, '张凡', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (7, 1, 9, '张小凡', 100, 2, '2018-02-24 15:52:21', '2018-03-24 15:52:28');
INSERT INTO `tb_human_config` VALUES (8, 6, 2, '任行', 100, 1, '2019-02-07 19:07:58', '2019-02-07 19:08:01');
INSERT INTO `tb_human_config` VALUES (9, 6, 5, '王五', 10, 1, '2019-02-07 19:08:40', '2019-02-07 19:08:43');
INSERT INTO `tb_human_config` VALUES (10, 6, 6, '赵六', 80, 1, '2019-02-07 19:09:13', '2019-02-07 19:09:15');
INSERT INTO `tb_human_config` VALUES (11, 6, 8, '张凡', 20, 1, '2019-02-07 19:10:08', '2019-02-07 19:10:10');
INSERT INTO `tb_human_config` VALUES (12, 6, 9, '张小凡', 100, 1, '2019-02-07 19:10:31', '2019-02-07 19:10:33');
INSERT INTO `tb_human_config` VALUES (13, 6, 12, '方小园', 100, 1, '2019-02-07 19:11:03', '2019-02-07 19:11:05');
INSERT INTO `tb_human_config` VALUES (14, 6, 13, '李一', 100, 1, '2019-02-07 19:11:35', '2019-02-07 19:11:37');
INSERT INTO `tb_human_config` VALUES (15, 6, 14, '李二', 50, 1, '2019-02-07 19:11:55', '2019-02-07 19:11:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tb_project` VALUES (1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 2, '2018-02-16', '2018-02-21', '2018-05-09', '2018-01-08 18:32:43', '2018-05-10 18:34:27');
INSERT INTO `tb_project` VALUES (2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 2, '2018-05-12', '2018-05-13', '2018-07-03', '2018-05-08 18:32:43', '2018-05-10 18:34:27');
INSERT INTO `tb_project` VALUES (3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 2, '2018-07-13', '2018-07-15', '2018-09-09', '2018-07-08 18:32:43', '2018-07-10 18:34:27');
INSERT INTO `tb_project` VALUES (4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 2, '2018-09-19', '2018-09-21', '2018-11-09', '2018-09-07 18:32:43', '2018-11-02 18:34:27');
INSERT INTO `tb_project` VALUES (5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 3, '张三', 2, '2018-11-13', '2018-11-12', '2018-12-04', '2018-11-01 18:32:43', '2018-12-04 18:34:27');
INSERT INTO `tb_project` VALUES (6, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,React.js', 3, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Oracle,Redis,SQL Server', 2, 2, '任行', 1, '2019-01-24', '2019-01-25', '2019-04-04', '2019-01-23 01:48:37', '2019-01-25 01:48:37');
INSERT INTO `tb_project` VALUES (7, 'IT教育课程考评系统', '随着互联网产业的高速发展，社会对计算机人才的需求不断增加，门槛不断变高，计算机专业就业开始出现问题。由于计算机人才掌握的技术不符合市场需求、网络面试题集杂乱无解析等，就业面试成了难关。在这样的现状下，IT行业应聘者非常需要一个完善的考评系统来检测自己的水平，模拟面试笔试，获取建议以扩大自身知识面、完善综合职业能力，提高就业竞争力，从而有自信应对IT行业就业现状。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,AngularJS', 2, 'Java,Maven,Hibernate,Spring,SpringBoot,Shiro,SpringMVC,Tomcat,Linux,git,docker', 4, 'MySQL,Oracle,MongoDB,SQL Server,memcached', 2, 3, '张三', 0, '2019-03-06', '2019-03-13', '2019-09-10', '2019-03-01 18:41:58', '2019-03-13 09:17:52');
INSERT INTO `tb_project` VALUES (8, 'IT企业人力资源管理系统', '现今的大中型IT企业所涉及的业务领域非常广，项目包含的技术种类多，决定它要面临人力资源方面的挑战。一方面，企业很难准确地预测下个项目何时启动，以及需要什么样的人员配备，这使得提前培养和储备合适的人员很困难。很多时候公司为某类项目招聘或者培训了一批人员，结果项目却搁置了。另一方面，一旦项目合同签订，客户往往期望项目尽早启动，外包企业必须在短时间内为项目准备好人员。为了应对上述挑战，这些企业必须实现人力资源以及优化人力资源的配置和利用，其中重要的一环就是建立公司统一的人力资源管理系统。', 'jQuery,webpack,Bootstrap,HTML5,CSS3,LESS,node.js,Vue.js', 2, 'Java,Maven,MyBatis,Spring,SpringBoot,SpringSecurity,SpringMVC,Tomcat,Linux,git,docker', 3, 'MySQL,Redis,Oracle', 2, 2, '任行', 0, '2019-01-22', NULL, '2019-04-11', '2019-01-15 09:12:59', '2019-01-21 09:13:26');

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
INSERT INTO `tb_project_history` VALUES (1, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (2, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (3, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (4, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (5, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (6, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (7, 1, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (8, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (9, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (10, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (11, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (12, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (13, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (14, 2, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (15, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (16, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (17, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (18, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (19, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (20, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (21, 3, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (22, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (23, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (24, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (25, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (26, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (27, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (28, 4, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (29, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 2, '任行', '需求分析,概要设计,详细设计,技术选型,后端设计与开发,后端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (30, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 3, '张三', '需求分析,概要设计,技术选型,人员调度,项目进度控制,风险跟踪,后台开发', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (31, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 5, '王五', '前端设计与开发,前端任务分配', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (32, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 6, '赵六', '前端开发,数据模拟,接口测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (33, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 7, '田七', '前端开发,页面设计', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (34, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 8, '张凡', '后端开发,数据库语句调优', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');
INSERT INTO `tb_project_history` VALUES (35, 5, 'APP评论数据分析系统', '随着互联网+智能手机端的发展，针对公司企业反映的难以获取APP产品用户对产品的反馈信息，使用倾向以及喜好程度等突出问题，现有的评论数据处理体系已不适应当前的发展需求，因此急需利用“互联网”思维建设APP评论数据分析系统，以进一步提升企业公司或开发团队对产品评论的综合管理效率，实现对APP产品科学有效管理的目标。', 9, '张小凡', '后端开发,后端测试', 3, '张三', '2019-03-25 10:04:45', '2019-03-25 10:04:55');

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
INSERT INTO `tb_recruit` VALUES (1, '何艾', '13777580611', 'heai@163.com', 'G:/static/resumes/resume0.md', 1, 1, 1, 'sonkabin', '2019-02-15 09:36:21', '2019-02-15 09:36:25');
INSERT INTO `tb_recruit` VALUES (2, '王小明', '13777080611', 'xiaoming@163.com', 'G:/static/resumes/resume1.md', 1, 2, 1, 'sonkabin', '2019-02-15 09:36:21', '2019-02-15 09:36:25');
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '员工', '2019-01-12 19:18:38', '2019-01-12 19:18:41');
INSERT INTO `tb_role` VALUES (2, '项目经理', '2019-01-12 19:19:16', '2019-01-12 19:19:18');
INSERT INTO `tb_role` VALUES (3, '管理员', '2019-01-12 19:19:36', '2019-01-12 19:19:38');

-- ----------------------------
-- Table structure for tb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_permission`;
CREATE TABLE `tb_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id，尝试使用代码而不是外键来维护关系',
  `permission_id` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tb_role_permission` VALUES (9, 3, 9);
INSERT INTO `tb_role_permission` VALUES (10, 3, 10);
INSERT INTO `tb_role_permission` VALUES (11, 3, 11);
INSERT INTO `tb_role_permission` VALUES (12, 3, 12);
INSERT INTO `tb_role_permission` VALUES (13, 3, 13);
INSERT INTO `tb_role_permission` VALUES (14, 3, 14);
INSERT INTO `tb_role_permission` VALUES (15, 3, 15);
INSERT INTO `tb_role_permission` VALUES (16, 3, 16);
INSERT INTO `tb_role_permission` VALUES (17, 3, 17);
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
INSERT INTO `tb_train` VALUES (8, 'JS模块化', '2019-02-13:10-11:AMD规范;2019-02-18:10-11:ES6规范;2019-02-25:10-11:commonjs', '前端', 'Y大', '任行;李六;王二;王五;何小茜;张小凡;李琪琪;李一;张凡;李二;李三;李九;李五;李八;王四;方小园;张三', '2019-02-12 10:00:00', 0, '2019-02-11 02:08:44', '2019-02-12 02:42:49');

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
INSERT INTO `tb_train_demand` VALUES (1, 2, '任行', '中间件', 'Zookeeper,Kafka', '2019-01-25 14:54:56', '2019-01-26 14:59:05');
INSERT INTO `tb_train_demand` VALUES (2, 3, '张三', '大数据', 'Hadoop,Hive,HBase,Spark,Zookeeper', '2019-01-26 14:59:27', '2019-01-26 15:00:12');
INSERT INTO `tb_train_demand` VALUES (3, 5, '王五', '前端', 'TypeScript,yarn', '2019-01-29 15:03:25', '2019-01-29 15:03:27');
INSERT INTO `tb_train_demand` VALUES (4, 3, '张三', '中间件', 'Zookeeper,Kafka', '2019-02-20 14:54:56', '2019-02-24 13:21:44');

SET FOREIGN_KEY_CHECKS = 1;
