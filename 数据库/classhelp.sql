/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : classhelp

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-11 12:13:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for checksign
-- ----------------------------
DROP TABLE IF EXISTS `checksign`;
CREATE TABLE `checksign` (
  `checkid` int(10) NOT NULL,
  `ctitle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `flag` int(1) NOT NULL,
  `classid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(4) NOT NULL,
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of checksign
-- ----------------------------
INSERT INTO `checksign` VALUES ('1', 'jsp第一节课考勤', '0', 'JSPZZX', '9826');
INSERT INTO `checksign` VALUES ('2', 'jsp第二节课考勤', '0', 'JSPZZX', '4700');
INSERT INTO `checksign` VALUES ('3', 'jsp第3节课考勤', '0', 'JSPZZX', '8160');
INSERT INTO `checksign` VALUES ('4', 'jsp第4节课考勤', '0', 'JSPZZX', '4524');
INSERT INTO `checksign` VALUES ('5', 'jsp第5节课考勤', '1', 'JSPZZX', '5689');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `classname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `teacherid` int(10) NOT NULL,
  `teachername` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('JSPZZX', 'Jsp程序设计', '101', '张振兴');

-- ----------------------------
-- Table structure for finishcheck
-- ----------------------------
DROP TABLE IF EXISTS `finishcheck`;
CREATE TABLE `finishcheck` (
  `checkid` int(10) NOT NULL,
  `studentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of finishcheck
-- ----------------------------

-- ----------------------------
-- Table structure for finishwork
-- ----------------------------
DROP TABLE IF EXISTS `finishwork`;
CREATE TABLE `finishwork` (
  `workid` int(10) NOT NULL,
  `studentid` int(10) NOT NULL,
  `fileurl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of finishwork
-- ----------------------------

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `workid` int(10) NOT NULL,
  `worktitle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `worktxt` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacherid` int(10) NOT NULL,
  `classid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`workid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', 'jsp作业1', '1.在基于数字签名的文件传输案例基础上，增加文件的加密传输与处理。\r\n2.请结合CipherInputStream和CipherOutputStream这两个类的功能进行设计。', '2016-11-18 20:05:57', '2016-11-20 20:06:02', '', '101', 'JSPZZX');
INSERT INTO `homework` VALUES ('2', 'jsp作业2', '必须好好做', '2016-11-09 17:23:22', '2016-11-23 17:23:26', '', '101', 'JSPZZX');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentid` int(10) NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `specialty` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `classid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1001', '1995', '郭峰', '软件工程', '122878486@qq.com', '15762796681', 'JSPZZX');
INSERT INTO `student` VALUES ('1002', '1996', '宋仕秋', '软件工程', '86917316@qq.com', '15786372874', 'JSPZZX');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherid` int(10) NOT NULL,
  `tpassword` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tname` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tphone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temail` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailcode` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('101', 'zzx', '张振兴', '男', 'JSPZZX', '18596122918', 'iamguofeng@163.com', '10225418guo163');
