/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : wxl

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-29 17:50:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('001', '刘柯弟', '超级管理员', 'd1ac549dbfdec4a0d49baec903648bb4');
INSERT INTO `admin` VALUES ('002', '张浩', '超级管理员', 'd1ac549dbfdec4a0d49baec903648bb4');

-- ----------------------------
-- Table structure for `assess`
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess` (
  `assess_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '考核体系编号',
  `assess_Course_no` varchar(10) NOT NULL COMMENT '课程编号',
  `assess_teacher_no` varchar(10) NOT NULL COMMENT '老师职工号',
  `assess_explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考核说明',
  `assess_cexplain_submit` int(2) DEFAULT '0' COMMENT '是否创建考核',
  PRIMARY KEY (`assess_no`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assess
-- ----------------------------
INSERT INTO `assess` VALUES ('7', '010388', '019942', '通信软件基础', '0');
INSERT INTO `assess` VALUES ('74', '010393', '019942', '通信软件基础实训(1)', '0');
INSERT INTO `assess` VALUES ('75', '010394', '019942', '通信软件基础实训(2)', '0');
INSERT INTO `assess` VALUES ('76', '010395', '019942', 'IT类软件工程基础实训(1)', '0');
INSERT INTO `assess` VALUES ('78', '010398', '019942', 'IT类软件工程基础实训(3)', '0');
INSERT INTO `assess` VALUES ('79', '010610', '019942', '通信软件开发应用实训1', '0');
INSERT INTO `assess` VALUES ('80', '010243', '019942', '可编程逻辑器件设计', '0');

-- ----------------------------
-- Table structure for `cexplain`
-- ----------------------------
DROP TABLE IF EXISTS `cexplain`;
CREATE TABLE `cexplain` (
  `Cexplain_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Cexplain_dd_no` varchar(10) NOT NULL COMMENT '项目说明编号',
  `Cexplain_assess_no` varchar(10) NOT NULL COMMENT '考核项编号',
  `Cexplain_proportion` int(11) NOT NULL COMMENT '比例',
  `Cexplain_time` int(11) DEFAULT NULL COMMENT '次数',
  `Cexplain_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考核项说明',
  PRIMARY KEY (`Cexplain_no`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cexplain
-- ----------------------------
INSERT INTO `cexplain` VALUES ('68', '23', '6', '20', '9', '超过四次不到取消考资格2');
INSERT INTO `cexplain` VALUES ('70', '6', '1', '30', '5', '作业交给助教XXX，电话XXXX');
INSERT INTO `cexplain` VALUES ('71', '4', '6', '50', '1', '第十周周四七八节2101');
INSERT INTO `cexplain` VALUES ('73', '23', '73', '23', '32', '水电费');
INSERT INTO `cexplain` VALUES ('74', '23', '', '23', '32', '水电费');
INSERT INTO `cexplain` VALUES ('140', '3', '74', '25', '1', '期末考试2');
INSERT INTO `cexplain` VALUES ('141', '3', '75', '25', '1', '期末考试3');
INSERT INTO `cexplain` VALUES ('143', '3', '7', '50', '1', '期末考试');
INSERT INTO `cexplain` VALUES ('144', '4', '7', '2', '2', '2');
INSERT INTO `cexplain` VALUES ('145', '5', '7', '3', '3', '4');
INSERT INTO `cexplain` VALUES ('146', '6', '7', '4', '4', '4');
INSERT INTO `cexplain` VALUES ('147', '22', '7', '5', '5', '5');
INSERT INTO `cexplain` VALUES ('148', '23', '7', '6', '6', '6');

-- ----------------------------
-- Table structure for `cgroup`
-- ----------------------------
DROP TABLE IF EXISTS `cgroup`;
CREATE TABLE `cgroup` (
  `Cgroup_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程组号',
  `Cgroup_name` varchar(10) NOT NULL COMMENT '课程组名',
  `cgroup_teacher_no` varchar(10) NOT NULL COMMENT '老师职工号',
  `Cgroup_explain` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '描述',
  PRIMARY KEY (`Cgroup_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cgroup
-- ----------------------------
INSERT INTO `cgroup` VALUES ('1', '通信软件课程组', '019942', '通信软件开发，通信软件基础及相关实训');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '课程名' COMMENT '课程名',
  `Cno` varchar(10) NOT NULL COMMENT '课程编号',
  `Course_Cgroup_no` varchar(10) NOT NULL COMMENT '课程组号',
  `Course_explain` varchar(30) NOT NULL COMMENT '课程描述',
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('英文学术会议交流与报告', '0', '', '实验');
INSERT INTO `course` VALUES ('毕业实习', '010004', '', '实验');
INSERT INTO `course` VALUES ('毕业设计', '010005', '', '实验');
INSERT INTO `course` VALUES ('毕业设计', '010008', '', '实验');
INSERT INTO `course` VALUES ('科技写作', '010036', '', '限选,.5,8,0');
INSERT INTO `course` VALUES ('创造心理学', '010040', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('外国文化2', '010042', '', '实验');
INSERT INTO `course` VALUES ('电信业务与支撑系统实训', '010074', '', '实验');
INSERT INTO `course` VALUES ('传输工程综合实训', '010075', '', '实验');
INSERT INTO `course` VALUES ('宽带接入网综合实训', '010076', '', '实验');
INSERT INTO `course` VALUES ('基础科研训练(2)', '010081', '', '实验');
INSERT INTO `course` VALUES ('工程规划与设计实习', '010089', '', '实验');
INSERT INTO `course` VALUES ('信号与系统', '010111', '', '限选,4.0,64,0');
INSERT INTO `course` VALUES ('信号与系统', '010114', '', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('电子系统综合设计与仿真', '010161', '', '限选,3.5,32,24');
INSERT INTO `course` VALUES ('通信原理', '010201', '', '限选,4.0,56,8');
INSERT INTO `course` VALUES ('数字信号处理', '010212', '', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('信号处理基础', '010220', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('现代通信技术', '010223', '', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('DSP原理与应用', '010241', '', '限选,2.5,24,16');
INSERT INTO `course` VALUES ('信息论基础', '010251', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('高级多媒体技术', '010285', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('电子系统综合设计实训', '010292', '', '实验');
INSERT INTO `course` VALUES ('电子系统综合设计实训', '010299', '', '实验');
INSERT INTO `course` VALUES ('通信业务开发与设计', '010342', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('专业概论2', '010364', '', '限选,.5,8,0');
INSERT INTO `course` VALUES ('无线网络规划与优化', '010373', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('IT行业市场竞争分析', '010381', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('信息论与编码', '010384', '', '必修,3.0,48,0');
INSERT INTO `course` VALUES ('通信软件基础', '010388', '1', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('通信软件基础实训(1)', '010393', '1', '实验');
INSERT INTO `course` VALUES ('通信软件基础实训(2）', '010394', '1', '实验');
INSERT INTO `course` VALUES ('IT类软件工程基础实训(2)', '010397', '1', '实验');
INSERT INTO `course` VALUES ('可编程逻辑器件原理与', '010426', '', '限选,3.0,32,16');
INSERT INTO `course` VALUES ('现代通信系统', '010435', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('下一代广播电视网络技', '010441', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('综合项目设计', '010444', '', '实验');
INSERT INTO `course` VALUES ('企业工程实习', '010445', '', '实验');
INSERT INTO `course` VALUES ('IT项目组织与管理', '010446', '', '实验');
INSERT INTO `course` VALUES ('行业工程标准与规范', '010447', '', '实验');
INSERT INTO `course` VALUES ('微波与卫星通信技术', '010452', '', '限选,2.5,40,0');
INSERT INTO `course` VALUES ('通信前沿技术', '010454', '', '限选,.5,8,0');
INSERT INTO `course` VALUES ('网络交换与路由', '010455', '', '必修,5.0,80,0');
INSERT INTO `course` VALUES ('网络与新媒体', '010456', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('移动通信技术', '010457', '', '限选,4.0,64,0');
INSERT INTO `course` VALUES ('网络业务及应用', '010458', '', '必修,2.0,32,0');
INSERT INTO `course` VALUES ('通信与网络软件设计', '010459', '1', '必修,3.0,16,32');
INSERT INTO `course` VALUES ('IPTV网络工程综合', '010464', '', '实验');
INSERT INTO `course` VALUES ('PTN平台综合实训', '010466', '', '实验');
INSERT INTO `course` VALUES ('VOIP综合实训', '010467', '', '实验');
INSERT INTO `course` VALUES ('交换技术综合实验', '010468', '', '实验');
INSERT INTO `course` VALUES ('数字电视网络工程实验', '010469', '', '实验');
INSERT INTO `course` VALUES ('综合布线及概预算综合', '010473', '', '实验');
INSERT INTO `course` VALUES ('无线网络规划与优化综', '010475', '', '实验');
INSERT INTO `course` VALUES ('广播电视工程综合实训', '010478', '', '实验');
INSERT INTO `course` VALUES ('动力环境监控综合实验', '010481', '', '实验');
INSERT INTO `course` VALUES ('移动通信', '010486', '', '限选,3.5,56,0');
INSERT INTO `course` VALUES ('无线网络规划与优化综合', '010491', '', '实验');
INSERT INTO `course` VALUES ('微处理器系统结构与嵌', '010507', '', '限选,6.0,64,32');
INSERT INTO `course` VALUES ('电子系统设计实训1', '010510', '', '实验');
INSERT INTO `course` VALUES ('通信技术导论', '010511', '', '必修,4.0,64,0');
INSERT INTO `course` VALUES ('IT工程项目管理与实训', '010605', '', '限选,3.5,48,8');
INSERT INTO `course` VALUES ('多媒体信息处理技术', '010609', '', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('通信软件开发应用实训', '010610', '1', '实验');
INSERT INTO `course` VALUES ('通信系统综合设计实训', '010615', '', '实验');
INSERT INTO `course` VALUES ('通信软件开发应用', '010616', '1', '必修,4.0,64,0');
INSERT INTO `course` VALUES ('数字图像处理技术', '010618', '', '限选,3.0,48,0');
INSERT INTO `course` VALUES ('通信系统综合设计', '010630', '', '实验');
INSERT INTO `course` VALUES ('专业竞赛', '010632', '', '实验');
INSERT INTO `course` VALUES ('电子系统设计实训3', '011135', '', '实验');
INSERT INTO `course` VALUES ('语音信号处理', '011224', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('信息系统分析与设计', '011312', '', '必修,3.0,48,0');
INSERT INTO `course` VALUES ('通信网概论', '011320', '', '限选,2.0,32,0');
INSERT INTO `course` VALUES ('课程设计(通信信息网', '011390', '', '实验');
INSERT INTO `course` VALUES ('广播电视网络工程设计', '011482', '', '必修,3.0,16,32');
INSERT INTO `course` VALUES ('现代交换与网络A', '011485', '', '限选,4.5,72,0');
INSERT INTO `course` VALUES ('现代交换技术', 'D01048', '', '实验');
INSERT INTO `course` VALUES ('专业实训4（现代交换', 'D01050', '', '实验');
INSERT INTO `course` VALUES ('专业实训5（TD-S', 'D01051', '', '实验');

-- ----------------------------
-- Table structure for `dd`
-- ----------------------------
DROP TABLE IF EXISTS `dd`;
CREATE TABLE `dd` (
  `DD_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据字典编号',
  `DD_Data_type` int(11) NOT NULL COMMENT '数据字典类别',
  `DD_user_id` char(10) NOT NULL COMMENT '数据字典归属用户',
  `DD_usewhether` bit(1) NOT NULL COMMENT '数据字典是否可用',
  `DD_Cexplain_name` char(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据字典详细描述',
  `DD_remark1` varchar(255) DEFAULT NULL,
  `DD_remark2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DD_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd
-- ----------------------------
INSERT INTO `dd` VALUES ('1', '1', '0', '', '系统', null, null);
INSERT INTO `dd` VALUES ('2', '1', '0', '', '考核组成', null, null);
INSERT INTO `dd` VALUES ('3', '2', '0', '', '期末考试', null, null);
INSERT INTO `dd` VALUES ('4', '2', '0', '', '期中考试', null, null);
INSERT INTO `dd` VALUES ('5', '2', '0', '', '随堂测试', null, null);
INSERT INTO `dd` VALUES ('6', '2', '0', '', '作业', null, null);
INSERT INTO `dd` VALUES ('7', '0', '0', '', '学院', null, null);
INSERT INTO `dd` VALUES ('8', '7', '0', '', '通信与信息工程学院', null, null);
INSERT INTO `dd` VALUES ('9', '7', '0', '', '光电工程学院', null, null);
INSERT INTO `dd` VALUES ('10', '8', '0', '', '广电工程系', null, null);
INSERT INTO `dd` VALUES ('11', '8', '0', '', '电子信息工程系', null, null);
INSERT INTO `dd` VALUES ('12', '8', '0', '', '通信工程系', null, null);
INSERT INTO `dd` VALUES ('13', '8', '0', '', '辅导员', '1', null);
INSERT INTO `dd` VALUES ('14', '8', '0', '', '通信技术与网络实验中心', null, null);
INSERT INTO `dd` VALUES ('15', '8', '0', '', '通信学院办公室', '1', null);
INSERT INTO `dd` VALUES ('16', '8', '0', '', '通信学院', '1', null);
INSERT INTO `dd` VALUES ('18', '8', '0', '', '校外聘用', '1', null);
INSERT INTO `dd` VALUES ('19', '1', '0', '', '考核组成性质', null, null);
INSERT INTO `dd` VALUES ('20', '19', '0', '', '评审', null, null);
INSERT INTO `dd` VALUES ('21', '19', '0', '', '评定', null, null);
INSERT INTO `dd` VALUES ('22', '2', '0', '', '答辩', null, null);
INSERT INTO `dd` VALUES ('23', '2', '9', '', '考勤', null, null);

-- ----------------------------
-- Table structure for `finalgrades`
-- ----------------------------
DROP TABLE IF EXISTS `finalgrades`;
CREATE TABLE `finalgrades` (
  `Tclass_no` char(100) CHARACTER SET utf8 NOT NULL,
  `student_ID` char(50) CHARACTER SET utf8 NOT NULL,
  `finalGrades` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`Tclass_no`,`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- ----------------------------
-- Records of finalgrades
-- ----------------------------
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210014', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210020', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210030', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210036', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210073', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210101', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210104', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210112', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210113', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210118', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210119', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210124', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210131', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210135', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210144', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210158', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210161', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210201', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210208', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210210', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210216', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210219', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210222', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210227', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210265', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210294', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210323', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210333', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210337', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210339', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210368', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210376', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210392', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210394', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210401', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210407', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210412', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210415', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210419', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210434', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210438', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210439', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210440', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210442', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210449', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210451', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210454', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210473', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210475', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210507', '0.00');
INSERT INTO `finalgrades` VALUES ('A011518756', '2014210514', '0.00');
INSERT INTO `finalgrades` VALUES ('SJ1511024', '', '0.00');

-- ----------------------------
-- Table structure for `jgroup`
-- ----------------------------
DROP TABLE IF EXISTS `jgroup`;
CREATE TABLE `jgroup` (
  `jgroup_name` varchar(8) NOT NULL COMMENT '评审组名',
  `jgroup_no` varchar(10) NOT NULL COMMENT '评审组编号',
  `jgroup_Tproportion` varchar(3) NOT NULL COMMENT '老师成绩所占比例',
  PRIMARY KEY (`jgroup_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jgroup
-- ----------------------------
INSERT INTO `jgroup` VALUES ('任课教师', '1', '100');
INSERT INTO `jgroup` VALUES ('评审组3', '331', '70');
INSERT INTO `jgroup` VALUES ('评审组2', '332', '60');
INSERT INTO `jgroup` VALUES ('评审组1', '333', '50');

-- ----------------------------
-- Table structure for `judge`
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
  `judge_ID` varchar(20) NOT NULL COMMENT '学生/老师编号',
  `judge_role` varchar(3) NOT NULL COMMENT '角色',
  `judge_grades` double(3,0) DEFAULT NULL COMMENT '成绩',
  `judge_jgroup_no` varchar(20) NOT NULL COMMENT '评审组编号',
  `judge_no` int(20) NOT NULL AUTO_INCREMENT COMMENT '评审员编号',
  `judge_submit` tinyint(1) NOT NULL COMMENT '是否提交',
  `topic_topic_no` int(30) NOT NULL,
  `topic_file_url` varchar(128) DEFAULT NULL COMMENT '作业上传地址',
  PRIMARY KEY (`judge_no`,`topic_topic_no`,`judge_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES ('2014210014', '学生', '100', '1', '3192', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210020', '学生', '90', '1', '3193', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210030', '学生', '80', '1', '3194', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210036', '学生', '0', '1', '3195', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210073', '学生', '0', '1', '3196', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210101', '学生', '0', '1', '3197', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210104', '学生', '0', '1', '3198', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210112', '学生', '0', '1', '3199', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210113', '学生', '0', '1', '3200', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210118', '学生', '0', '1', '3201', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210119', '学生', '0', '1', '3202', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210124', '学生', '0', '1', '3203', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210131', '学生', '0', '1', '3204', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210135', '学生', '0', '1', '3205', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210144', '学生', '0', '1', '3206', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210158', '学生', '0', '1', '3207', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210161', '学生', '0', '1', '3208', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210201', '学生', '0', '1', '3209', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210208', '学生', '0', '1', '3210', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210210', '学生', '0', '1', '3211', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210216', '学生', '0', '1', '3212', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210219', '学生', '0', '1', '3213', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210222', '学生', '0', '1', '3214', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210227', '学生', '0', '1', '3215', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210265', '学生', '0', '1', '3216', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210294', '学生', '0', '1', '3217', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210323', '学生', '0', '1', '3218', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210333', '学生', '0', '1', '3219', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210337', '学生', '0', '1', '3220', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210339', '学生', '0', '1', '3221', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210368', '学生', '0', '1', '3222', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210376', '学生', '0', '1', '3223', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210392', '学生', '0', '1', '3224', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210394', '学生', '0', '1', '3225', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210401', '学生', '0', '1', '3226', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210407', '学生', '0', '1', '3227', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210412', '学生', '0', '1', '3228', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210415', '学生', '0', '1', '3229', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210419', '学生', '0', '1', '3230', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210434', '学生', '0', '1', '3231', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210438', '学生', '0', '1', '3232', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210439', '学生', '0', '1', '3233', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210440', '学生', '0', '1', '3234', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210442', '学生', '0', '1', '3235', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210449', '学生', '0', '1', '3236', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210451', '学生', '0', '1', '3237', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210454', '学生', '0', '1', '3238', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210473', '学生', '0', '1', '3239', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210475', '学生', '0', '1', '3240', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210507', '学生', '0', '1', '3241', '0', '1125', null);
INSERT INTO `judge` VALUES ('2014210014', '学生', '80', '1', '3243', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210020', '学生', '90', '1', '3244', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210030', '学生', '100', '1', '3245', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210036', '学生', '0', '1', '3246', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210073', '学生', '0', '1', '3247', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210101', '学生', '0', '1', '3248', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210104', '学生', '0', '1', '3249', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210112', '学生', '0', '1', '3250', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210113', '学生', '0', '1', '3251', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210118', '学生', '0', '1', '3252', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210119', '学生', '0', '1', '3253', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210124', '学生', '0', '1', '3254', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210131', '学生', '0', '1', '3255', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210135', '学生', '0', '1', '3256', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210144', '学生', '0', '1', '3257', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210158', '学生', '0', '1', '3258', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210161', '学生', '0', '1', '3259', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210201', '学生', '0', '1', '3260', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210208', '学生', '0', '1', '3261', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210210', '学生', '0', '1', '3262', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210216', '学生', '0', '1', '3263', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210219', '学生', '0', '1', '3264', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210222', '学生', '0', '1', '3265', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210227', '学生', '0', '1', '3266', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210265', '学生', '0', '1', '3267', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210294', '学生', '0', '1', '3268', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210323', '学生', '0', '1', '3269', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210333', '学生', '0', '1', '3270', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210337', '学生', '0', '1', '3271', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210339', '学生', '0', '1', '3272', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210368', '学生', '0', '1', '3273', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210376', '学生', '0', '1', '3274', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210392', '学生', '0', '1', '3275', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210394', '学生', '0', '1', '3276', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210401', '学生', '0', '1', '3277', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210407', '学生', '0', '1', '3278', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210412', '学生', '0', '1', '3279', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210415', '学生', '0', '1', '3280', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210419', '学生', '0', '1', '3281', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210434', '学生', '0', '1', '3282', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210438', '学生', '0', '1', '3283', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210439', '学生', '0', '1', '3284', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210440', '学生', '0', '1', '3285', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210442', '学生', '0', '1', '3286', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210449', '学生', '0', '1', '3287', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210451', '学生', '0', '1', '3288', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210454', '学生', '0', '1', '3289', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210473', '学生', '0', '1', '3290', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210475', '学生', '0', '1', '3291', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210507', '学生', '0', '1', '3292', '0', '1126', null);
INSERT INTO `judge` VALUES ('2014210014', '学生', '100', '1', '3294', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210020', '学生', '85', '1', '3295', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210030', '学生', '90', '1', '3296', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210036', '学生', '0', '1', '3297', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210073', '学生', '0', '1', '3298', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210101', '学生', '0', '1', '3299', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210104', '学生', '0', '1', '3300', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210112', '学生', '0', '1', '3301', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210113', '学生', '0', '1', '3302', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210118', '学生', '0', '1', '3303', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210119', '学生', '0', '1', '3304', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210124', '学生', '0', '1', '3305', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210131', '学生', '0', '1', '3306', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210135', '学生', '0', '1', '3307', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210144', '学生', '0', '1', '3308', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210158', '学生', '0', '1', '3309', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210161', '学生', '0', '1', '3310', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210201', '学生', '0', '1', '3311', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210208', '学生', '0', '1', '3312', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210210', '学生', '0', '1', '3313', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210216', '学生', '0', '1', '3314', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210219', '学生', '0', '1', '3315', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210222', '学生', '0', '1', '3316', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210227', '学生', '0', '1', '3317', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210265', '学生', '0', '1', '3318', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210294', '学生', '0', '1', '3319', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210323', '学生', '0', '1', '3320', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210333', '学生', '0', '1', '3321', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210337', '学生', '0', '1', '3322', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210339', '学生', '0', '1', '3323', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210368', '学生', '0', '1', '3324', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210376', '学生', '0', '1', '3325', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210392', '学生', '0', '1', '3326', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210394', '学生', '0', '1', '3327', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210401', '学生', '0', '1', '3328', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210407', '学生', '0', '1', '3329', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210412', '学生', '0', '1', '3330', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210415', '学生', '0', '1', '3331', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210419', '学生', '0', '1', '3332', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210434', '学生', '0', '1', '3333', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210438', '学生', '0', '1', '3334', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210439', '学生', '0', '1', '3335', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210440', '学生', '0', '1', '3336', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210442', '学生', '0', '1', '3337', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210449', '学生', '0', '1', '3338', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210451', '学生', '0', '1', '3339', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210454', '学生', '0', '1', '3340', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210473', '学生', '0', '1', '3341', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210475', '学生', '0', '1', '3342', '0', '1129', null);
INSERT INTO `judge` VALUES ('2014210507', '学生', '0', '1', '3343', '0', '1129', null);
INSERT INTO `judge` VALUES ('2012120013', '学生', '0', '1', '3344', '1', '1129', '');

-- ----------------------------
-- Table structure for `ref_judge_jgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ref_judge_jgroup`;
CREATE TABLE `ref_judge_jgroup` (
  `ref_J_JG_ID` varchar(10) NOT NULL COMMENT '组成编号',
  `ref_J_JG_judge_no` varchar(10) NOT NULL COMMENT '评审员编号',
  `ref_J_JG_jgroup_no` varchar(10) NOT NULL COMMENT '评审组编号',
  PRIMARY KEY (`ref_J_JG_judge_no`,`ref_J_JG_jgroup_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_judge_jgroup
-- ----------------------------
INSERT INTO `ref_judge_jgroup` VALUES ('739', '442', '331');
INSERT INTO `ref_judge_jgroup` VALUES ('740', '443', '332');
INSERT INTO `ref_judge_jgroup` VALUES ('741', '444', '333');
INSERT INTO `ref_judge_jgroup` VALUES ('742', '445', '1');

-- ----------------------------
-- Table structure for `ref_sconstitue_jgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ref_sconstitue_jgroup`;
CREATE TABLE `ref_sconstitue_jgroup` (
  `ref_sconstitue_jgroup_no` varchar(10) NOT NULL COMMENT '评判编号',
  `ref_sconstitue_jgroup_jgroup_no` varchar(10) NOT NULL COMMENT '评审组编号',
  `ref_sconstitue_jgroup_sconstitue_no` varchar(10) NOT NULL COMMENT '具体组成编号',
  PRIMARY KEY (`ref_sconstitue_jgroup_jgroup_no`,`ref_sconstitue_jgroup_sconstitue_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_sconstitue_jgroup
-- ----------------------------
INSERT INTO `ref_sconstitue_jgroup` VALUES ('850', '331', '553');
INSERT INTO `ref_sconstitue_jgroup` VALUES ('851', '332', '554');
INSERT INTO `ref_sconstitue_jgroup` VALUES ('852', '333', '555');

-- ----------------------------
-- Table structure for `ref_s_sgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ref_s_sgroup`;
CREATE TABLE `ref_s_sgroup` (
  `ref_S_Sgroup_no` varchar(12) NOT NULL COMMENT '学生分组关系编号',
  `ref_S_Sgroup_ID` varchar(10) NOT NULL COMMENT '学号',
  `ref_S_Sgroup_sgroup` varchar(10) NOT NULL COMMENT '学生组号',
  PRIMARY KEY (`ref_S_Sgroup_ID`,`ref_S_Sgroup_sgroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_s_sgroup
-- ----------------------------

-- ----------------------------
-- Table structure for `ref_tclass_student`
-- ----------------------------
DROP TABLE IF EXISTS `ref_tclass_student`;
CREATE TABLE `ref_tclass_student` (
  `ref_T_S_ID` varchar(10) DEFAULT NULL COMMENT '组成教学班编号',
  `ref_T_S_Tclass_no` varchar(10) NOT NULL COMMENT '教学班编号',
  `ref_T_S_student_ID` varchar(10) NOT NULL COMMENT '学生学号',
  `student_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ref_T_S_Tclass_no`,`ref_T_S_student_ID`),
  UNIQUE KEY `belong_T_S_ID` (`ref_T_S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_tclass_student
-- ----------------------------
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2012120013', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2012216492', '重修');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2013210106', '重修');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2013210301', '重修');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210020', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210030', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210036', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210073', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210101', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210104', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210112', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210113', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210118', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210119', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210124', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210131', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210135', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210144', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210158', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210161', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210201', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210208', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210210', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210216', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210219', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210222', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210227', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210265', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210294', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210323', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210333', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210337', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210339', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210368', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210376', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210392', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210394', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210401', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210407', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210412', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210415', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210419', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210434', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210438', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210439', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210440', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210442', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210449', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210451', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210454', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210473', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210475', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210507', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'A011518756', '2014210514', '正常');
INSERT INTO `ref_tclass_student` VALUES ('1', 'A01905642', '2012120013', null);
INSERT INTO `ref_tclass_student` VALUES ('17', 'A01905642', '2012216302', null);
INSERT INTO `ref_tclass_student` VALUES ('18', 'A01905642', '2012216318', null);
INSERT INTO `ref_tclass_student` VALUES ('19', 'A01905642', '2012216319', null);
INSERT INTO `ref_tclass_student` VALUES ('20', 'A01905642', '2012216431', null);
INSERT INTO `ref_tclass_student` VALUES ('21', 'A01905642', '2012216507', null);
INSERT INTO `ref_tclass_student` VALUES ('22', 'A01905642', '2012216586', null);
INSERT INTO `ref_tclass_student` VALUES ('2', 'A01905642', '2013210019', null);
INSERT INTO `ref_tclass_student` VALUES ('3', 'A01905642', '2013210021', null);
INSERT INTO `ref_tclass_student` VALUES ('4', 'A01905642', '2013210025', null);
INSERT INTO `ref_tclass_student` VALUES ('5', 'A01905642', '2013210045', null);
INSERT INTO `ref_tclass_student` VALUES ('6', 'A01905642', '2013210048', null);
INSERT INTO `ref_tclass_student` VALUES ('7', 'A01905642', '2013210057', null);
INSERT INTO `ref_tclass_student` VALUES ('8', 'A01905642', '2013210084', null);
INSERT INTO `ref_tclass_student` VALUES ('9', 'A01905642', '2013210150', null);
INSERT INTO `ref_tclass_student` VALUES ('10', 'A01905642', '2013210160', null);
INSERT INTO `ref_tclass_student` VALUES ('11', 'A01905642', '2013210199', null);
INSERT INTO `ref_tclass_student` VALUES ('12', 'A01905642', '2013210264', null);
INSERT INTO `ref_tclass_student` VALUES ('13', 'A01905642', '2013210389', null);
INSERT INTO `ref_tclass_student` VALUES ('14', 'A01905642', '2013210445', null);
INSERT INTO `ref_tclass_student` VALUES ('15', 'A01905642', '2013210493', null);
INSERT INTO `ref_tclass_student` VALUES ('16', 'A01905642', '2013210505', null);
INSERT INTO `ref_tclass_student` VALUES ('23', 'S36673042', '2013210001', null);
INSERT INTO `ref_tclass_student` VALUES ('24', 'S36673042', '2013210018', null);
INSERT INTO `ref_tclass_student` VALUES ('25', 'S36673042', '2013210024', null);
INSERT INTO `ref_tclass_student` VALUES ('26', 'S36673042', '2013210030', null);
INSERT INTO `ref_tclass_student` VALUES ('27', 'S36673042', '2013210031', null);
INSERT INTO `ref_tclass_student` VALUES ('28', 'S36673042', '2013210034', null);
INSERT INTO `ref_tclass_student` VALUES ('29', 'S36673042', '2013210047', null);
INSERT INTO `ref_tclass_student` VALUES ('30', 'S36673042', '2013210059', null);
INSERT INTO `ref_tclass_student` VALUES ('31', 'S36673042', '2013210076', null);
INSERT INTO `ref_tclass_student` VALUES ('32', 'S36673042', '2013210094', null);
INSERT INTO `ref_tclass_student` VALUES ('33', 'S36673042', '2013210107', null);
INSERT INTO `ref_tclass_student` VALUES ('34', 'S36673042', '2013210124', null);
INSERT INTO `ref_tclass_student` VALUES ('35', 'S36673042', '2013210137', null);
INSERT INTO `ref_tclass_student` VALUES ('36', 'S36673042', '2013210142', null);
INSERT INTO `ref_tclass_student` VALUES ('37', 'S36673042', '2013210151', null);
INSERT INTO `ref_tclass_student` VALUES ('38', 'S36673042', '2013210172', null);
INSERT INTO `ref_tclass_student` VALUES ('39', 'S36673042', '2013210180', null);
INSERT INTO `ref_tclass_student` VALUES ('40', 'S36673042', '2013210181', null);
INSERT INTO `ref_tclass_student` VALUES ('41', 'S36673042', '2013210185', null);
INSERT INTO `ref_tclass_student` VALUES ('42', 'S36673042', '2013210188', null);
INSERT INTO `ref_tclass_student` VALUES ('43', 'S36673042', '2013210189', null);
INSERT INTO `ref_tclass_student` VALUES ('44', 'S36673042', '2013210190', null);
INSERT INTO `ref_tclass_student` VALUES ('45', 'S36673042', '2013210192', null);
INSERT INTO `ref_tclass_student` VALUES ('46', 'S36673042', '2013210215', null);
INSERT INTO `ref_tclass_student` VALUES ('47', 'S36673042', '2013210219', null);
INSERT INTO `ref_tclass_student` VALUES ('48', 'S36673042', '2013210220', null);
INSERT INTO `ref_tclass_student` VALUES ('49', 'S36673042', '2013210222', null);
INSERT INTO `ref_tclass_student` VALUES ('50', 'S36673042', '2013210235', null);
INSERT INTO `ref_tclass_student` VALUES ('51', 'S36673042', '2013210249', null);
INSERT INTO `ref_tclass_student` VALUES ('52', 'S36673043', '2012210636', null);
INSERT INTO `ref_tclass_student` VALUES ('53', 'S36673043', '2013210256', null);
INSERT INTO `ref_tclass_student` VALUES ('54', 'S36673043', '2013210265', null);
INSERT INTO `ref_tclass_student` VALUES ('55', 'S36673043', '2013210338', null);
INSERT INTO `ref_tclass_student` VALUES ('56', 'S36673043', '2013210339', null);
INSERT INTO `ref_tclass_student` VALUES ('57', 'S36673043', '2013210342', null);
INSERT INTO `ref_tclass_student` VALUES ('58', 'S36673043', '2013210379', null);
INSERT INTO `ref_tclass_student` VALUES ('59', 'S36673043', '2013210380', null);
INSERT INTO `ref_tclass_student` VALUES ('60', 'S36673043', '2013210401', null);
INSERT INTO `ref_tclass_student` VALUES ('61', 'S36673043', '2013210403', null);
INSERT INTO `ref_tclass_student` VALUES ('62', 'S36673043', '2013210408', null);
INSERT INTO `ref_tclass_student` VALUES ('63', 'S36673043', '2013210412', null);
INSERT INTO `ref_tclass_student` VALUES ('64', 'S36673043', '2013210413', null);
INSERT INTO `ref_tclass_student` VALUES ('65', 'S36673043', '2013210418', null);
INSERT INTO `ref_tclass_student` VALUES ('66', 'S36673043', '2013210421', null);
INSERT INTO `ref_tclass_student` VALUES ('67', 'S36673043', '2013210422', null);
INSERT INTO `ref_tclass_student` VALUES ('68', 'S36673043', '2013210434', null);
INSERT INTO `ref_tclass_student` VALUES ('69', 'S36673043', '2013210440', null);
INSERT INTO `ref_tclass_student` VALUES ('70', 'S36673043', '2013210469', null);
INSERT INTO `ref_tclass_student` VALUES ('71', 'S36673043', '2013210476', null);
INSERT INTO `ref_tclass_student` VALUES ('72', 'S36673043', '2013210485', null);
INSERT INTO `ref_tclass_student` VALUES ('73', 'S36673043', '2013210501', null);
INSERT INTO `ref_tclass_student` VALUES ('74', 'S36673043', '2013210502', null);
INSERT INTO `ref_tclass_student` VALUES ('75', 'S36673043', '2013210508', null);
INSERT INTO `ref_tclass_student` VALUES ('76', 'S36673043', '2013210516', null);
INSERT INTO `ref_tclass_student` VALUES ('77', 'S36673043', '2013210525', null);
INSERT INTO `ref_tclass_student` VALUES ('78', 'S36673043', '2013210531', null);
INSERT INTO `ref_tclass_student` VALUES ('79', 'S36673043', '2013210534', null);
INSERT INTO `ref_tclass_student` VALUES ('80', 'S36673043', '2013210558', null);
INSERT INTO `ref_tclass_student` VALUES ('81', 'S36673043', '2013210576', null);
INSERT INTO `ref_tclass_student` VALUES ('82', 'S36673579', '2012216277', null);
INSERT INTO `ref_tclass_student` VALUES ('83', 'S36673579', '2012216278', null);
INSERT INTO `ref_tclass_student` VALUES ('84', 'S36673579', '2012216279', null);
INSERT INTO `ref_tclass_student` VALUES ('85', 'S36673579', '2012216280', null);
INSERT INTO `ref_tclass_student` VALUES ('86', 'S36673579', '2012216282', null);
INSERT INTO `ref_tclass_student` VALUES ('87', 'S36673579', '2012216283', null);
INSERT INTO `ref_tclass_student` VALUES ('88', 'S36673579', '2012216287', null);
INSERT INTO `ref_tclass_student` VALUES ('89', 'S36673579', '2012216290', null);
INSERT INTO `ref_tclass_student` VALUES ('90', 'S36673579', '2012216296', null);
INSERT INTO `ref_tclass_student` VALUES ('91', 'S36673579', '2012216297', null);
INSERT INTO `ref_tclass_student` VALUES ('92', 'S36673579', '2012216298', null);
INSERT INTO `ref_tclass_student` VALUES ('93', 'S36673579', '2012216300', null);
INSERT INTO `ref_tclass_student` VALUES ('94', 'S36673579', '2012216305', null);
INSERT INTO `ref_tclass_student` VALUES ('95', 'S36673579', '2012216306', null);
INSERT INTO `ref_tclass_student` VALUES ('96', 'S36673579', '2012216307', null);
INSERT INTO `ref_tclass_student` VALUES ('97', 'S36673579', '2012216312', null);
INSERT INTO `ref_tclass_student` VALUES ('98', 'S36673579', '2012216327', null);
INSERT INTO `ref_tclass_student` VALUES ('99', 'S36673579', '2012216331', null);
INSERT INTO `ref_tclass_student` VALUES ('100', 'S36673583', '2012216281', null);
INSERT INTO `ref_tclass_student` VALUES ('101', 'S36673583', '2012216295', null);
INSERT INTO `ref_tclass_student` VALUES ('102', 'S36673583', '2012216403', null);
INSERT INTO `ref_tclass_student` VALUES ('103', 'S36673583', '2012216404', null);
INSERT INTO `ref_tclass_student` VALUES ('104', 'S36673583', '2012216405', null);
INSERT INTO `ref_tclass_student` VALUES ('105', 'S36673583', '2012216406', null);
INSERT INTO `ref_tclass_student` VALUES ('106', 'S36673583', '2012216407', null);
INSERT INTO `ref_tclass_student` VALUES ('107', 'S36673583', '2012216408', null);
INSERT INTO `ref_tclass_student` VALUES ('108', 'S36673583', '2012216409', null);
INSERT INTO `ref_tclass_student` VALUES ('109', 'S36673583', '2012216410', null);
INSERT INTO `ref_tclass_student` VALUES ('110', 'S36673583', '2012216411', null);
INSERT INTO `ref_tclass_student` VALUES ('111', 'S36673583', '2012216412', null);
INSERT INTO `ref_tclass_student` VALUES ('112', 'S36673583', '2012216414', null);
INSERT INTO `ref_tclass_student` VALUES ('113', 'S36673583', '2012216416', null);
INSERT INTO `ref_tclass_student` VALUES ('114', 'S36673583', '2012216417', null);
INSERT INTO `ref_tclass_student` VALUES ('115', 'S36673583', '2012216418', null);
INSERT INTO `ref_tclass_student` VALUES ('116', 'S36673583', '2012216419', null);
INSERT INTO `ref_tclass_student` VALUES ('117', 'S36673583', '2012216420', null);
INSERT INTO `ref_tclass_student` VALUES ('118', 'S36673583', '2012216423', null);
INSERT INTO `ref_tclass_student` VALUES ('119', 'S36673583', '2012216424', null);
INSERT INTO `ref_tclass_student` VALUES ('120', 'S36673583', '2012216425', null);
INSERT INTO `ref_tclass_student` VALUES ('121', 'S36673583', '2012216426', null);
INSERT INTO `ref_tclass_student` VALUES ('122', 'S36673583', '2012216427', null);
INSERT INTO `ref_tclass_student` VALUES ('123', 'S36673583', '2012216429', null);
INSERT INTO `ref_tclass_student` VALUES ('124', 'S36673583', '2012216430', null);
INSERT INTO `ref_tclass_student` VALUES ('125', 'S36673583', '2012216431', null);
INSERT INTO `ref_tclass_student` VALUES ('126', 'S36673583', '2012216432', null);
INSERT INTO `ref_tclass_student` VALUES ('127', 'S36673583', '2012216434', null);
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2012210592', '补修');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210298', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210299', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210300', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210301', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210302', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210303', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210304', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210305', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210306', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210307', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210308', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210309', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210310', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210311', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210312', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210313', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210314', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210315', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210316', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210317', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210319', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210320', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210321', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210322', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210325', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210326', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210327', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210328', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210329', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511017', '2014210330', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2012212523', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210019', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210021', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210025', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210045', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210048', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210057', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210084', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210150', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210160', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210199', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210264', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210389', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210445', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511024', '2013210505', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210014', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210030', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210073', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210104', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210113', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210119', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210131', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210161', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210201', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210208', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210216', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210222', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210227', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210294', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210323', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210337', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210339', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210392', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210394', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210415', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210434', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210449', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210451', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210454', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511090', '2014210514', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210020', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210036', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210101', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210112', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210118', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210124', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210135', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210144', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210158', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210210', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210219', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210265', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210333', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210368', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210376', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210401', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210407', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210412', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210419', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210438', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210439', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210440', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210442', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210473', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210475', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511091', '2014210507', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210018', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210030', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210031', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210034', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210059', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210124', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210137', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210151', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210172', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210180', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210181', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210188', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210189', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210190', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210220', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210342', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210380', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210403', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210408', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210412', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210418', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210421', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210434', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210469', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210516', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210525', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ1511092', '2013210558', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2012210028', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2012210045', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2012210287', '补修');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210004', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210014', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210015', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210017', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210022', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210026', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210035', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210037', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210039', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210053', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210072', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210075', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210096', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210097', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210098', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210102', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210108', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210113', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210118', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210123', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210133', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210135', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210136', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210138', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210139', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210140', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210338', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210440', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210476', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210493', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SJ151990', '2013210534', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2012210636', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2012213530', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210001', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210018', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210024', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210030', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210031', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210034', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210047', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210059', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210076', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210124', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210137', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210142', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210151', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210172', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210180', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210181', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210188', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210189', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210190', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210192', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210215', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210219', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210222', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210235', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210249', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210256', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210265', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210339', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210379', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210380', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210403', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210412', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210413', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210418', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210421', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210434', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210469', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210485', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210501', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210502', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210508', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210516', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210525', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210531', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210558', '正常');
INSERT INTO `ref_tclass_student` VALUES (null, 'SK01151714', '2013210576', '正常');

-- ----------------------------
-- Table structure for `ref_teacher_cgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ref_teacher_cgroup`;
CREATE TABLE `ref_teacher_cgroup` (
  `ref_T_C_ID` varchar(10) NOT NULL,
  `ref_T_C_Cgroup_no` varchar(10) NOT NULL COMMENT '课程组编号',
  `ref_T_C_Teacher_ID` varchar(10) NOT NULL COMMENT '老师编号',
  `ref_T_C_Headteacher_ID` varchar(10) NOT NULL COMMENT '考核负责人',
  PRIMARY KEY (`ref_T_C_Cgroup_no`,`ref_T_C_Teacher_ID`),
  UNIQUE KEY `ref_T_C_ID` (`ref_T_C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_teacher_cgroup
-- ----------------------------
INSERT INTO `ref_teacher_cgroup` VALUES ('4', '1', '010334', '');
INSERT INTO `ref_teacher_cgroup` VALUES ('5', '1', '010351', '');
INSERT INTO `ref_teacher_cgroup` VALUES ('1', '1', '010411', '');
INSERT INTO `ref_teacher_cgroup` VALUES ('3', '1', '019901', '');
INSERT INTO `ref_teacher_cgroup` VALUES ('2', '1', '019942', '');

-- ----------------------------
-- Table structure for `sconstitue`
-- ----------------------------
DROP TABLE IF EXISTS `sconstitue`;
CREATE TABLE `sconstitue` (
  `Sconstitue_no` int(255) NOT NULL AUTO_INCREMENT COMMENT '具体组成编号',
  `Sconstitue_properties` varchar(4) CHARACTER SET gb2312 COLLATE gb2312_bin NOT NULL COMMENT '性质',
  `Sconstitue_full_mark` tinyint(3) NOT NULL COMMENT '满分',
  `sconstitue_jgroup_no` varchar(10) NOT NULL COMMENT '评审组编号',
  `sconstitue_cexplain_no` int(11) NOT NULL COMMENT '项目名编号',
  PRIMARY KEY (`Sconstitue_no`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sconstitue
-- ----------------------------
INSERT INTO `sconstitue` VALUES ('1', '评审', '100', '336', '0');
INSERT INTO `sconstitue` VALUES ('553', '评定', '100', '331', '1');
INSERT INTO `sconstitue` VALUES ('554', '评定', '100', '332', '2');
INSERT INTO `sconstitue` VALUES ('555', '评审', '100', '333', '3');
INSERT INTO `sconstitue` VALUES ('556', '评审', '100', '334', '4');
INSERT INTO `sconstitue` VALUES ('557', '评审', '100', '335', '5');
INSERT INTO `sconstitue` VALUES ('558', '评审', '100', '336', '6');
INSERT INTO `sconstitue` VALUES ('559', '评审', '100', '336', '32');
INSERT INTO `sconstitue` VALUES ('560', '评定', '100', '336', '33');
INSERT INTO `sconstitue` VALUES ('569', '评定', '100', '336', '43');
INSERT INTO `sconstitue` VALUES ('570', '评定', '100', '336', '44');
INSERT INTO `sconstitue` VALUES ('571', '评定', '100', '336', '45');
INSERT INTO `sconstitue` VALUES ('572', '评定', '100', '336', '46');
INSERT INTO `sconstitue` VALUES ('573', '评定', '100', '336', '47');
INSERT INTO `sconstitue` VALUES ('574', '评定', '100', '336', '48');
INSERT INTO `sconstitue` VALUES ('575', '评定', '100', '336', '49');
INSERT INTO `sconstitue` VALUES ('576', '评定', '100', '336', '50');
INSERT INTO `sconstitue` VALUES ('577', '评定', '100', '336', '51');
INSERT INTO `sconstitue` VALUES ('578', '评定', '100', '336', '52');
INSERT INTO `sconstitue` VALUES ('579', '评定', '100', '336', '53');
INSERT INTO `sconstitue` VALUES ('580', '评定', '100', '336', '54');
INSERT INTO `sconstitue` VALUES ('581', '评定', '100', '336', '55');
INSERT INTO `sconstitue` VALUES ('582', '评定', '100', '336', '56');
INSERT INTO `sconstitue` VALUES ('583', '评定', '100', '336', '57');
INSERT INTO `sconstitue` VALUES ('584', '评定', '100', '336', '58');
INSERT INTO `sconstitue` VALUES ('585', '评定', '100', '336', '59');
INSERT INTO `sconstitue` VALUES ('586', '评定', '100', '336', '60');
INSERT INTO `sconstitue` VALUES ('587', '评定', '100', '336', '61');
INSERT INTO `sconstitue` VALUES ('588', '评定', '100', '336', '62');
INSERT INTO `sconstitue` VALUES ('589', '评审', '100', '336', '63');
INSERT INTO `sconstitue` VALUES ('590', '评审', '100', '336', '64');
INSERT INTO `sconstitue` VALUES ('591', '评审', '100', '336', '65');
INSERT INTO `sconstitue` VALUES ('592', '评定', '100', '336', '66');
INSERT INTO `sconstitue` VALUES ('593', '评定', '100', '336', '67');
INSERT INTO `sconstitue` VALUES ('594', '评定', '100', '336', '68');
INSERT INTO `sconstitue` VALUES ('595', '评审', '100', '336', '69');
INSERT INTO `sconstitue` VALUES ('596', '评定', '100', '336', '70');
INSERT INTO `sconstitue` VALUES ('597', '评定', '100', '336', '71');
INSERT INTO `sconstitue` VALUES ('598', '评审', '100', '336', '72');
INSERT INTO `sconstitue` VALUES ('599', '', '100', '336', '73');
INSERT INTO `sconstitue` VALUES ('600', '', '100', '336', '74');
INSERT INTO `sconstitue` VALUES ('601', '评定', '100', '336', '75');
INSERT INTO `sconstitue` VALUES ('602', '评定', '100', '336', '76');
INSERT INTO `sconstitue` VALUES ('603', '评审', '100', '336', '77');
INSERT INTO `sconstitue` VALUES ('604', '评审', '100', '336', '78');
INSERT INTO `sconstitue` VALUES ('605', '评审', '100', '336', '79');
INSERT INTO `sconstitue` VALUES ('606', '评审', '100', '336', '80');
INSERT INTO `sconstitue` VALUES ('607', '评审', '100', '336', '81');
INSERT INTO `sconstitue` VALUES ('608', '评定', '100', '336', '82');
INSERT INTO `sconstitue` VALUES ('609', '评审', '100', '336', '83');
INSERT INTO `sconstitue` VALUES ('610', '评审', '100', '336', '84');
INSERT INTO `sconstitue` VALUES ('611', '评审', '100', '336', '85');
INSERT INTO `sconstitue` VALUES ('612', '评审', '100', '336', '86');
INSERT INTO `sconstitue` VALUES ('613', '评审', '100', '336', '87');
INSERT INTO `sconstitue` VALUES ('614', '评审', '100', '336', '88');
INSERT INTO `sconstitue` VALUES ('615', '评审', '100', '336', '89');
INSERT INTO `sconstitue` VALUES ('616', '评审', '100', '336', '90');
INSERT INTO `sconstitue` VALUES ('617', '评审', '100', '336', '91');
INSERT INTO `sconstitue` VALUES ('618', '评审', '100', '336', '92');
INSERT INTO `sconstitue` VALUES ('619', '评审', '100', '336', '93');
INSERT INTO `sconstitue` VALUES ('620', '评审', '100', '336', '94');
INSERT INTO `sconstitue` VALUES ('621', '评定', '100', '336', '95');
INSERT INTO `sconstitue` VALUES ('622', '评审', '100', '336', '96');
INSERT INTO `sconstitue` VALUES ('623', '评定', '100', '336', '97');
INSERT INTO `sconstitue` VALUES ('624', '评定', '100', '336', '98');
INSERT INTO `sconstitue` VALUES ('625', '评定', '100', '336', '99');
INSERT INTO `sconstitue` VALUES ('626', '评审', '100', '336', '100');
INSERT INTO `sconstitue` VALUES ('627', '评审', '100', '336', '101');
INSERT INTO `sconstitue` VALUES ('628', '评审', '100', '336', '102');
INSERT INTO `sconstitue` VALUES ('629', '评审', '100', '336', '103');
INSERT INTO `sconstitue` VALUES ('630', '评审', '100', '336', '104');
INSERT INTO `sconstitue` VALUES ('631', '评审', '100', '336', '105');
INSERT INTO `sconstitue` VALUES ('632', '评审', '100', '336', '106');
INSERT INTO `sconstitue` VALUES ('633', '评审', '100', '336', '107');
INSERT INTO `sconstitue` VALUES ('634', '评审', '100', '336', '108');
INSERT INTO `sconstitue` VALUES ('635', '评审', '100', '336', '109');
INSERT INTO `sconstitue` VALUES ('636', '评审', '100', '336', '110');
INSERT INTO `sconstitue` VALUES ('637', '评审', '100', '336', '111');
INSERT INTO `sconstitue` VALUES ('638', '评定', '100', '336', '112');
INSERT INTO `sconstitue` VALUES ('639', '评定', '100', '336', '113');
INSERT INTO `sconstitue` VALUES ('640', '评定', '100', '336', '114');
INSERT INTO `sconstitue` VALUES ('641', '评定', '100', '336', '115');
INSERT INTO `sconstitue` VALUES ('642', '评定', '100', '336', '116');
INSERT INTO `sconstitue` VALUES ('643', '评定', '100', '336', '117');
INSERT INTO `sconstitue` VALUES ('644', '评定', '100', '336', '118');
INSERT INTO `sconstitue` VALUES ('645', '评定', '100', '336', '119');
INSERT INTO `sconstitue` VALUES ('646', '评定', '100', '336', '120');
INSERT INTO `sconstitue` VALUES ('647', '评定', '100', '336', '121');
INSERT INTO `sconstitue` VALUES ('648', '评审', '100', '336', '122');
INSERT INTO `sconstitue` VALUES ('649', '评审', '100', '336', '123');
INSERT INTO `sconstitue` VALUES ('650', '评审', '100', '336', '124');
INSERT INTO `sconstitue` VALUES ('651', '评审', '100', '336', '125');
INSERT INTO `sconstitue` VALUES ('652', '评审', '100', '336', '126');
INSERT INTO `sconstitue` VALUES ('653', '评审', '100', '336', '127');
INSERT INTO `sconstitue` VALUES ('654', '评审', '100', '336', '128');
INSERT INTO `sconstitue` VALUES ('655', '评审', '100', '336', '129');
INSERT INTO `sconstitue` VALUES ('656', '评审', '100', '336', '130');
INSERT INTO `sconstitue` VALUES ('657', '评审', '100', '336', '131');
INSERT INTO `sconstitue` VALUES ('658', '评审', '100', '336', '132');
INSERT INTO `sconstitue` VALUES ('659', '评审', '100', '336', '133');
INSERT INTO `sconstitue` VALUES ('660', '评审', '100', '336', '134');
INSERT INTO `sconstitue` VALUES ('661', '评审', '100', '336', '135');
INSERT INTO `sconstitue` VALUES ('662', '评审', '100', '336', '136');
INSERT INTO `sconstitue` VALUES ('663', '评审', '100', '336', '137');
INSERT INTO `sconstitue` VALUES ('664', '评审', '100', '336', '138');
INSERT INTO `sconstitue` VALUES ('665', '评审', '100', '336', '139');
INSERT INTO `sconstitue` VALUES ('666', '评审', '100', '336', '140');
INSERT INTO `sconstitue` VALUES ('667', '评审', '100', '336', '141');

-- ----------------------------
-- Table structure for `sgroup`
-- ----------------------------
DROP TABLE IF EXISTS `sgroup`;
CREATE TABLE `sgroup` (
  `sgroup_no` varchar(10) NOT NULL COMMENT '学生组号',
  `sgroup_name` varchar(10) NOT NULL COMMENT '学生组名',
  `sgroup_grades` tinyint(3) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`sgroup_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgroup
-- ----------------------------
INSERT INTO `sgroup` VALUES ('664', '学生组3', '86');
INSERT INTO `sgroup` VALUES ('665', '学生组2', '87');
INSERT INTO `sgroup` VALUES ('666', '学生组1', '88');

-- ----------------------------
-- Table structure for `stopic`
-- ----------------------------
DROP TABLE IF EXISTS `stopic`;
CREATE TABLE `stopic` (
  `Stopic_sgroup_no` varchar(10) NOT NULL COMMENT '学生组号',
  `Stopic_sconstitue_no` varchar(10) NOT NULL COMMENT '具体组成编号',
  `Stopic_jgroup_no` varchar(10) NOT NULL COMMENT '评审组编号',
  `stopic_topic_no` varchar(10) NOT NULL COMMENT '题目编号',
  PRIMARY KEY (`Stopic_sgroup_no`,`Stopic_sconstitue_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stopic
-- ----------------------------
INSERT INTO `stopic` VALUES ('664', '553', '1', '997');
INSERT INTO `stopic` VALUES ('665', '554', '1', '998');
INSERT INTO `stopic` VALUES ('666', '555', '1', '999');
INSERT INTO `stopic` VALUES ('667', '553', '1', '996');
INSERT INTO `stopic` VALUES ('668', '556', '1', '996');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_name` varchar(4) NOT NULL COMMENT '姓名',
  `student_ID` varchar(10) NOT NULL COMMENT '学号',
  `student_sex` varchar(2) NOT NULL COMMENT '性别',
  `student_age` tinyint(2) NOT NULL COMMENT '年龄',
  `student_class_no` varchar(10) NOT NULL COMMENT '班级编号',
  `student_password` varchar(16) NOT NULL COMMENT '密码',
  PRIMARY KEY (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('陈思谋', '2012120013', '男', '0', '01141501', '2012120013');
INSERT INTO `student` VALUES ('肖钇同', '2012120020', '男', '0', '0101409', '2012120020');
INSERT INTO `student` VALUES ('周杰', '2012210636', '男', '0', '0191302', '2012210636');
INSERT INTO `student` VALUES ('孙康瑞', '2012210734', '男', '0', '0101414', '2012210734');
INSERT INTO `student` VALUES ('高东君', '2012212523', '男', '0', '191303', '2012212523');
INSERT INTO `student` VALUES ('柏月智', '2012216277', '男', '0', '5111201', '2012216277');
INSERT INTO `student` VALUES ('崔欢喜', '2012216278', '男', '0', '5111201', '2012216278');
INSERT INTO `student` VALUES ('董俊良', '2012216279', '男', '0', '5111201', '2012216279');
INSERT INTO `student` VALUES ('樊柳', '2012216280', '女', '0', '5111201', '2012216280');
INSERT INTO `student` VALUES ('耿小龙', '2012216281', '男', '0', '5111205', '2012216281');
INSERT INTO `student` VALUES ('李晶晶', '2012216282', '女', '0', '5111201', '2012216282');
INSERT INTO `student` VALUES ('李润其', '2012216283', '男', '0', '5111201', '2012216283');
INSERT INTO `student` VALUES ('罗嘉欣', '2012216287', '女', '0', '5111201', '2012216287');
INSERT INTO `student` VALUES ('谭佳嘉', '2012216290', '女', '0', '5111201', '2012216290');
INSERT INTO `student` VALUES ('王渝龙', '2012216295', '男', '0', '5111205', '2012216295');
INSERT INTO `student` VALUES ('向怡璇', '2012216296', '女', '0', '5111201', '2012216296');
INSERT INTO `student` VALUES ('薛元汉', '2012216297', '男', '0', '5111201', '2012216297');
INSERT INTO `student` VALUES ('杨静', '2012216298', '女', '0', '5111201', '2012216298');
INSERT INTO `student` VALUES ('杨小莉', '2012216300', '女', '0', '5111201', '2012216300');
INSERT INTO `student` VALUES ('游航', '2012216302', '男', '0', '5111201', '2012216302');
INSERT INTO `student` VALUES ('张佩琦', '2012216305', '女', '0', '5111201', '2012216305');
INSERT INTO `student` VALUES ('赵磊', '2012216306', '男', '0', '5111201', '2012216306');
INSERT INTO `student` VALUES ('朱灿', '2012216307', '男', '0', '5111201', '2012216307');
INSERT INTO `student` VALUES ('古思维', '2012216312', '男', '0', '5111201', '2012216312');
INSERT INTO `student` VALUES ('李秋林', '2012216318', '男', '0', '5111202', '2012216318');
INSERT INTO `student` VALUES ('凌程', '2012216319', '男', '0', '5111202', '2012216319');
INSERT INTO `student` VALUES ('谭?', '2012216327', '男', '0', '5111201', '2012216327');
INSERT INTO `student` VALUES ('肖瑜', '2012216331', '男', '0', '5111201', '2012216331');
INSERT INTO `student` VALUES ('陈聪语', '2012216403', '男', '0', '5111205', '2012216403');
INSERT INTO `student` VALUES ('陈飞', '2012216404', '男', '0', '5111205', '2012216404');
INSERT INTO `student` VALUES ('郭坤仑', '2012216405', '男', '0', '5111205', '2012216405');
INSERT INTO `student` VALUES ('黄玉琴', '2012216406', '女', '0', '5111205', '2012216406');
INSERT INTO `student` VALUES ('兰楠', '2012216407', '女', '0', '5111205', '2012216407');
INSERT INTO `student` VALUES ('李春梅', '2012216408', '女', '0', '5111205', '2012216408');
INSERT INTO `student` VALUES ('林孟', '2012216409', '女', '0', '5111205', '2012216409');
INSERT INTO `student` VALUES ('林源凯', '2012216410', '男', '0', '5111205', '2012216410');
INSERT INTO `student` VALUES ('刘建', '2012216411', '男', '0', '5111205', '2012216411');
INSERT INTO `student` VALUES ('刘佩松', '2012216412', '男', '0', '5111205', '2012216412');
INSERT INTO `student` VALUES ('秦文英', '2012216414', '女', '0', '5111205', '2012216414');
INSERT INTO `student` VALUES ('万家豪', '2012216416', '男', '0', '5111205', '2012216416');
INSERT INTO `student` VALUES ('王皓然', '2012216417', '男', '0', '5111205', '2012216417');
INSERT INTO `student` VALUES ('王黎楠', '2012216418', '女', '0', '5111205', '2012216418');
INSERT INTO `student` VALUES ('王世宽', '2012216419', '男', '0', '5111205', '2012216419');
INSERT INTO `student` VALUES ('王阳', '2012216420', '男', '0', '5111205', '2012216420');
INSERT INTO `student` VALUES ('蔚文彦', '2012216423', '男', '0', '5111205', '2012216423');
INSERT INTO `student` VALUES ('吴冰', '2012216424', '男', '0', '5111205', '2012216424');
INSERT INTO `student` VALUES ('向亚军', '2012216425', '男', '0', '5111205', '2012216425');
INSERT INTO `student` VALUES ('徐浪', '2012216426', '男', '0', '5111205', '2012216426');
INSERT INTO `student` VALUES ('薛世斌', '2012216427', '男', '0', '5111205', '2012216427');
INSERT INTO `student` VALUES ('杨城', '2012216428', '男', '0', '0101405', '2012216428');
INSERT INTO `student` VALUES ('殷琪琪', '2012216429', '女', '0', '5111205', '2012216429');
INSERT INTO `student` VALUES ('张鸣洁', '2012216430', '男', '0', '5111205', '2012216430');
INSERT INTO `student` VALUES ('张睿', '2012216431', '男', '0', '5111205', '2012216431');
INSERT INTO `student` VALUES ('郑南翔', '2012216432', '男', '0', '5111205', '2012216432');
INSERT INTO `student` VALUES ('周琴', '2012216434', '女', '0', '5111205', '2012216434');
INSERT INTO `student` VALUES ('罗浩', '2012216507', '男', '0', '5121202', '2012216507');
INSERT INTO `student` VALUES ('雷宏', '2012216586', '男', '0', '5121205', '2012216586');
INSERT INTO `student` VALUES ('许梦姣', '2013210001', '女', '0', '0191301', '2013210001');
INSERT INTO `student` VALUES ('曹亚帅', '2013210019', '男', '0', '191303', '2013210019');
INSERT INTO `student` VALUES ('鲁航宇', '2013210021', '男', '0', '191303', '2013210021');
INSERT INTO `student` VALUES ('杨闰哲', '2013210024', '男', '20', '0101306', '2013210024');
INSERT INTO `student` VALUES ('李卓颖', '2013210025', '男', '0', '191303', '2013210025');
INSERT INTO `student` VALUES ('马斯鸣', '2013210030', '男', '20', '0101306', '2013210030');
INSERT INTO `student` VALUES ('谭浩', '2013210031', '男', '20', '0101306', '2013210031');
INSERT INTO `student` VALUES ('蒋华强', '2013210034', '男', '0', '0191301', '2013210034');
INSERT INTO `student` VALUES ('王娟娟', '2013210045', '女', '0', '191303', '2013210045');
INSERT INTO `student` VALUES ('张兰', '2013210047', '女', '0', '0191301', '2013210047');
INSERT INTO `student` VALUES ('秦瑶', '2013210048', '女', '0', '191303', '2013210048');
INSERT INTO `student` VALUES ('陈毅', '2013210057', '男', '0', '191303', '2013210057');
INSERT INTO `student` VALUES ('王留洋', '2013210059', '男', '0', '0191301', '2013210059');
INSERT INTO `student` VALUES ('陈旭', '2013210076', '男', '0', '0191301', '2013210076');
INSERT INTO `student` VALUES ('周阳', '2013210082', '女', '0', '0191301', '2013210082');
INSERT INTO `student` VALUES ('赵思雨', '2013210084', '女', '0', '191303', '2013210084');
INSERT INTO `student` VALUES ('吴思皓', '2013210094', '男', '0', '0191301', '2013210094');
INSERT INTO `student` VALUES ('朱俊', '2013210107', '男', '0', '0191301', '2013210107');
INSERT INTO `student` VALUES ('刘贻静', '2013210124', '女', '0', '0191301', '2013210124');
INSERT INTO `student` VALUES ('郑佳宇', '2013210137', '男', '0', '0191301', '2013210137');
INSERT INTO `student` VALUES ('朱忆昆', '2013210142', '男', '0', '0191301', '2013210142');
INSERT INTO `student` VALUES ('刘焓', '2013210150', '男', '0', '191303', '2013210150');
INSERT INTO `student` VALUES ('向光杰', '2013210151', '男', '0', '0191301', '2013210151');
INSERT INTO `student` VALUES ('谭颀', '2013210160', '女', '0', '191303', '2013210160');
INSERT INTO `student` VALUES ('黄坤欣', '2013210172', '男', '0', '0191301', '2013210172');
INSERT INTO `student` VALUES ('杨綦祯', '2013210180', '男', '0', '0191301', '2013210180');
INSERT INTO `student` VALUES ('何晨', '2013210181', '男', '0', '0191301', '2013210181');
INSERT INTO `student` VALUES ('王晓宇', '2013210185', '男', '0', '0191301', '2013210185');
INSERT INTO `student` VALUES ('刘源', '2013210188', '男', '0', '0191301', '2013210188');
INSERT INTO `student` VALUES ('袁聪', '2013210189', '男', '0', '0191301', '2013210189');
INSERT INTO `student` VALUES ('陈超', '2013210190', '男', '0', '0191301', '2013210190');
INSERT INTO `student` VALUES ('颜洁', '2013210192', '男', '0', '0191301', '2013210192');
INSERT INTO `student` VALUES ('周湘云', '2013210199', '女', '0', '191303', '2013210199');
INSERT INTO `student` VALUES ('王宁', '2013210215', '男', '0', '0191301', '2013210215');
INSERT INTO `student` VALUES ('张镇鹏', '2013210219', '男', '0', '0191301', '2013210219');
INSERT INTO `student` VALUES ('张浩', '2013210220', '男', '0', '0191301', '2013210220');
INSERT INTO `student` VALUES ('王科', '2013210221', '女', '0', '0191306', '2013210221');
INSERT INTO `student` VALUES ('王森', '2013210222', '男', '0', '0191301', '2013210222');
INSERT INTO `student` VALUES ('许海', '2013210230', '男', '0', '0101409', '2013210230');
INSERT INTO `student` VALUES ('王利婷', '2013210235', '女', '0', '0191301', '2013210235');
INSERT INTO `student` VALUES ('孙童童', '2013210249', '男', '0', '0191301', '2013210249');
INSERT INTO `student` VALUES ('凌正山', '2013210256', '男', '0', '0191302', '2013210256');
INSERT INTO `student` VALUES ('王圣', '2013210264', '男', '0', '191303', '2013210264');
INSERT INTO `student` VALUES ('蔡鲁川', '2013210265', '男', '0', '0191302', '2013210265');
INSERT INTO `student` VALUES ('代东良', '2013210338', '男', '0', '0191302', '2013210338');
INSERT INTO `student` VALUES ('赵晓川', '2013210339', '男', '0', '0191302', '2013210339');
INSERT INTO `student` VALUES ('雷攀', '2013210342', '男', '0', '0191302', '2013210342');
INSERT INTO `student` VALUES ('任灵杰', '2013210379', '男', '0', '0191302', '2013210379');
INSERT INTO `student` VALUES ('余杨', '2013210380', '男', '0', '0191302', '2013210380');
INSERT INTO `student` VALUES ('闫淼', '2013210389', '女', '0', '191303', '2013210389');
INSERT INTO `student` VALUES ('唐羽', '2013210401', '男', '0', '0191302', '2013210401');
INSERT INTO `student` VALUES ('张靖', '2013210403', '男', '0', '0191302', '2013210403');
INSERT INTO `student` VALUES ('郭茂铭', '2013210408', '男', '0', '0191302', '2013210408');
INSERT INTO `student` VALUES ('刘柯弟', '2013210412', '男', '0', '0191302', '2013210412');
INSERT INTO `student` VALUES ('左然', '2013210413', '男', '0', '0191302', '2013210413');
INSERT INTO `student` VALUES ('冯源', '2013210418', '男', '0', '0191302', '2013210418');
INSERT INTO `student` VALUES ('周正韬', '2013210421', '男', '0', '0191302', '2013210421');
INSERT INTO `student` VALUES ('杨梵', '2013210422', '男', '0', '0191302', '2013210422');
INSERT INTO `student` VALUES ('李梦飞', '2013210434', '女', '0', '0191302', '2013210434');
INSERT INTO `student` VALUES ('王诚志', '2013210440', '男', '0', '0191302', '2013210440');
INSERT INTO `student` VALUES ('姜博', '2013210445', '男', '0', '191303', '2013210445');
INSERT INTO `student` VALUES ('王影', '2013210469', '女', '0', '0191302', '2013210469');
INSERT INTO `student` VALUES ('马戎', '2013210476', '男', '0', '0191302', '2013210476');
INSERT INTO `student` VALUES ('周志浩', '2013210485', '男', '0', '0191302', '2013210485');
INSERT INTO `student` VALUES ('何江湖', '2013210493', '男', '0', '191303', '2013210493');
INSERT INTO `student` VALUES ('余丽', '2013210501', '女', '0', '0191302', '2013210501');
INSERT INTO `student` VALUES ('马?', '2013210502', '女', '0', '0191302', '2013210502');
INSERT INTO `student` VALUES ('廉颖慧', '2013210505', '女', '0', '191303', '2013210505');
INSERT INTO `student` VALUES ('叶海娇', '2013210508', '女', '0', '0191302', '2013210508');
INSERT INTO `student` VALUES ('彭洲', '2013210516', '男', '0', '0191302', '2013210516');
INSERT INTO `student` VALUES ('郭建川', '2013210525', '男', '0', '0191302', '2013210525');
INSERT INTO `student` VALUES ('杨立坤', '2013210531', '男', '0', '0191302', '2013210531');
INSERT INTO `student` VALUES ('许炜阳', '2013210534', '男', '0', '0191302', '2013210534');
INSERT INTO `student` VALUES ('唐德泽', '2013210558', '男', '0', '0191302', '2013210558');
INSERT INTO `student` VALUES ('何青松', '2013210576', '男', '0', '0191302', '2013210576');
INSERT INTO `student` VALUES ('佘佳玲', '2014210002', '女', '0', '0101401', '2014210002');
INSERT INTO `student` VALUES ('尤洋洋', '2014210003', '女', '0', '0101401', '2014210003');
INSERT INTO `student` VALUES ('孟倩英', '2014210004', '女', '0', '0101401', '2014210004');
INSERT INTO `student` VALUES ('宋艾遥', '2014210005', '女', '0', '0101401', '2014210005');
INSERT INTO `student` VALUES ('莫雪莎', '2014210007', '女', '0', '0191403', '2014210007');
INSERT INTO `student` VALUES ('王婧', '2014210008', '女', '0', '0101401', '2014210008');
INSERT INTO `student` VALUES ('李鑫', '2014210009', '女', '0', '0101401', '2014210009');
INSERT INTO `student` VALUES ('冉俊玲', '2014210010', '女', '0', '0101401', '2014210010');
INSERT INTO `student` VALUES ('钟艾玲', '2014210011', '女', '0', '0101401', '2014210011');
INSERT INTO `student` VALUES ('徐浩', '2014210012', '男', '0', '0101401', '2014210012');
INSERT INTO `student` VALUES ('沙桐', '2014210013', '男', '0', '0101401', '2014210013');
INSERT INTO `student` VALUES ('冯秋明', '2014210014', '男', '0', '0191401', '2014210014');
INSERT INTO `student` VALUES ('陶子鸣', '2014210015', '男', '0', '0101401', '2014210015');
INSERT INTO `student` VALUES ('冯航涛', '2014210016', '男', '0', '0191403', '2014210016');
INSERT INTO `student` VALUES ('夏小刚', '2014210017', '男', '0', '0101401', '2014210017');
INSERT INTO `student` VALUES ('欧阳转', '2014210018', '男', '0', '0101401', '2014210018');
INSERT INTO `student` VALUES ('宋子亮', '2014210019', '男', '0', '0101401', '2014210019');
INSERT INTO `student` VALUES ('丁鸽', '2014210020', '男', '0', '0191402', '2014210020');
INSERT INTO `student` VALUES ('王尚尚', '2014210021', '男', '0', '0101401', '2014210021');
INSERT INTO `student` VALUES ('陈镤镭', '2014210022', '男', '0', '0191403', '2014210022');
INSERT INTO `student` VALUES ('陈证元', '2014210024', '男', '0', '0101401', '2014210024');
INSERT INTO `student` VALUES ('张浩', '2014210025', '男', '0', '0101401', '2014210025');
INSERT INTO `student` VALUES ('贺燕华', '2014210026', '男', '0', '0101401', '2014210026');
INSERT INTO `student` VALUES ('李鑫', '2014210028', '男', '0', '0101401', '2014210028');
INSERT INTO `student` VALUES ('彭泓月', '2014210029', '男', '0', '0101401', '2014210029');
INSERT INTO `student` VALUES ('景坤飞', '2014210030', '男', '0', '0191401', '2014210030');
INSERT INTO `student` VALUES ('张何堰', '2014210031', '男', '0', '0101401', '2014210031');
INSERT INTO `student` VALUES ('段书桥', '2014210033', '男', '0', '0101401', '2014210033');
INSERT INTO `student` VALUES ('刘慧', '2014210034', '女', '0', '0101402', '2014210034');
INSERT INTO `student` VALUES ('周玉佳', '2014210035', '女', '0', '0101402', '2014210035');
INSERT INTO `student` VALUES ('成书杉', '2014210036', '女', '0', '0191402', '2014210036');
INSERT INTO `student` VALUES ('杨梦梅', '2014210037', '女', '0', '0101402', '2014210037');
INSERT INTO `student` VALUES ('陈露', '2014210038', '女', '0', '0101402', '2014210038');
INSERT INTO `student` VALUES ('李蔚星', '2014210039', '女', '0', '0101402', '2014210039');
INSERT INTO `student` VALUES ('杜静菲', '2014210040', '女', '0', '0191403', '2014210040');
INSERT INTO `student` VALUES ('曾勤', '2014210041', '女', '0', '0101402', '2014210041');
INSERT INTO `student` VALUES ('谢攀', '2014210042', '女', '0', '0101402', '2014210042');
INSERT INTO `student` VALUES ('龙鑫', '2014210043', '女', '0', '0101402', '2014210043');
INSERT INTO `student` VALUES ('夏吉玲', '2014210044', '女', '0', '0101402', '2014210044');
INSERT INTO `student` VALUES ('赵祥祥', '2014210045', '男', '0', '0101402', '2014210045');
INSERT INTO `student` VALUES ('侯宗壮', '2014210046', '男', '0', '0101402', '2014210046');
INSERT INTO `student` VALUES ('苏炳?', '2014210047', '男', '0', '0101402', '2014210047');
INSERT INTO `student` VALUES ('韦昌权', '2014210048', '男', '0', '0101402', '2014210048');
INSERT INTO `student` VALUES ('宋振远', '2014210049', '男', '0', '0101402', '2014210049');
INSERT INTO `student` VALUES ('胡凌', '2014210050', '男', '0', '0101402', '2014210050');
INSERT INTO `student` VALUES ('王江维', '2014210051', '男', '0', '0191403', '2014210051');
INSERT INTO `student` VALUES ('陈瑞', '2014210052', '男', '0', '0101402', '2014210052');
INSERT INTO `student` VALUES ('刘鑫', '2014210053', '男', '0', '0101402', '2014210053');
INSERT INTO `student` VALUES ('李文龙', '2014210054', '男', '0', '0101402', '2014210054');
INSERT INTO `student` VALUES ('吴坤', '2014210055', '男', '0', '0191403', '2014210055');
INSERT INTO `student` VALUES ('李思贤', '2014210056', '男', '0', '0101402', '2014210056');
INSERT INTO `student` VALUES ('李筑聪', '2014210057', '男', '0', '0101402', '2014210057');
INSERT INTO `student` VALUES ('刘颖杰', '2014210058', '男', '0', '0101402', '2014210058');
INSERT INTO `student` VALUES ('李劲宇', '2014210059', '男', '0', '0101402', '2014210059');
INSERT INTO `student` VALUES ('王磊', '2014210060', '男', '0', '0101402', '2014210060');
INSERT INTO `student` VALUES ('刘迅', '2014210061', '男', '0', '0101402', '2014210061');
INSERT INTO `student` VALUES ('江川', '2014210062', '男', '0', '0101402', '2014210062');
INSERT INTO `student` VALUES ('周武林', '2014210063', '男', '0', '0101402', '2014210063');
INSERT INTO `student` VALUES ('刘圣平', '2014210064', '男', '0', '0101402', '2014210064');
INSERT INTO `student` VALUES ('刘松林', '2014210065', '男', '0', '0101402', '2014210065');
INSERT INTO `student` VALUES ('刘磊', '2014210066', '男', '0', '0101402', '2014210066');
INSERT INTO `student` VALUES ('胡迎春', '2014210067', '女', '0', '0101403', '2014210067');
INSERT INTO `student` VALUES ('龙欣', '2014210068', '女', '0', '0101403', '2014210068');
INSERT INTO `student` VALUES ('曹玲', '2014210069', '女', '0', '0101403', '2014210069');
INSERT INTO `student` VALUES ('刘燕清', '2014210070', '女', '0', '0101403', '2014210070');
INSERT INTO `student` VALUES ('毛骄', '2014210071', '女', '0', '0101403', '2014210071');
INSERT INTO `student` VALUES ('卓玛', '2014210072', '女', '0', '0101403', '2014210072');
INSERT INTO `student` VALUES ('张若羽', '2014210073', '女', '0', '0191401', '2014210073');
INSERT INTO `student` VALUES ('李露露', '2014210074', '女', '0', '0101403', '2014210074');
INSERT INTO `student` VALUES ('李小可', '2014210075', '女', '0', '0101403', '2014210075');
INSERT INTO `student` VALUES ('杜春玲', '2014210076', '女', '0', '0101403', '2014210076');
INSERT INTO `student` VALUES ('陈欢', '2014210077', '女', '0', '0101403', '2014210077');
INSERT INTO `student` VALUES ('张斌', '2014210078', '男', '0', '0101403', '2014210078');
INSERT INTO `student` VALUES ('何瑞', '2014210079', '男', '0', '0101403', '2014210079');
INSERT INTO `student` VALUES ('彭绍志', '2014210080', '男', '0', '0101403', '2014210080');
INSERT INTO `student` VALUES ('吴育辉', '2014210081', '男', '0', '0101403', '2014210081');
INSERT INTO `student` VALUES ('史雪飞', '2014210082', '男', '0', '0101403', '2014210082');
INSERT INTO `student` VALUES ('魏晨', '2014210083', '男', '0', '0101403', '2014210083');
INSERT INTO `student` VALUES ('陈亚彪', '2014210084', '男', '0', '0191403', '2014210084');
INSERT INTO `student` VALUES ('吕仲韬', '2014210086', '男', '0', '0101403', '2014210086');
INSERT INTO `student` VALUES ('石明坤', '2014210087', '男', '0', '0101403', '2014210087');
INSERT INTO `student` VALUES ('王鲲鹏', '2014210089', '男', '0', '0101403', '2014210089');
INSERT INTO `student` VALUES ('曾阳', '2014210090', '男', '0', '0101403', '2014210090');
INSERT INTO `student` VALUES ('杨恒', '2014210091', '男', '0', '0191403', '2014210091');
INSERT INTO `student` VALUES ('寿炳', '2014210092', '男', '0', '0101403', '2014210092');
INSERT INTO `student` VALUES ('周林川', '2014210093', '男', '0', '0101403', '2014210093');
INSERT INTO `student` VALUES ('夏黄卫', '2014210094', '男', '0', '0101403', '2014210094');
INSERT INTO `student` VALUES ('刘洋', '2014210095', '男', '0', '0101403', '2014210095');
INSERT INTO `student` VALUES ('邹文杰', '2014210096', '男', '0', '0101403', '2014210096');
INSERT INTO `student` VALUES ('冉迎希', '2014210097', '男', '0', '0101403', '2014210097');
INSERT INTO `student` VALUES ('唐德智', '2014210098', '男', '0', '0101403', '2014210098');
INSERT INTO `student` VALUES ('方强', '2014210099', '男', '0', '0101403', '2014210099');
INSERT INTO `student` VALUES ('简晓雯', '2014210100', '女', '0', '0101404', '2014210100');
INSERT INTO `student` VALUES ('邓夏茹', '2014210101', '女', '0', '0191402', '2014210101');
INSERT INTO `student` VALUES ('陈金玉', '2014210102', '女', '0', '0101404', '2014210102');
INSERT INTO `student` VALUES ('张楠楠', '2014210103', '女', '0', '0101404', '2014210103');
INSERT INTO `student` VALUES ('曾玉', '2014210104', '女', '0', '0191401', '2014210104');
INSERT INTO `student` VALUES ('央吉', '2014210105', '女', '0', '0101404', '2014210105');
INSERT INTO `student` VALUES ('陈容', '2014210106', '女', '0', '0101404', '2014210106');
INSERT INTO `student` VALUES ('唐万梅', '2014210107', '女', '0', '0101404', '2014210107');
INSERT INTO `student` VALUES ('刘金惠', '2014210108', '女', '0', '0101404', '2014210108');
INSERT INTO `student` VALUES ('杨钦钦', '2014210109', '女', '0', '0101404', '2014210109');
INSERT INTO `student` VALUES ('余鑫', '2014210110', '女', '0', '0101404', '2014210110');
INSERT INTO `student` VALUES ('丁景坤', '2014210111', '男', '0', '0101404', '2014210111');
INSERT INTO `student` VALUES ('张永强', '2014210112', '男', '0', '0191402', '2014210112');
INSERT INTO `student` VALUES ('潘越', '2014210113', '男', '0', '0191401', '2014210113');
INSERT INTO `student` VALUES ('陈道康', '2014210114', '男', '0', '0101404', '2014210114');
INSERT INTO `student` VALUES ('谷钊龙', '2014210115', '男', '0', '0101404', '2014210115');
INSERT INTO `student` VALUES ('刘田宇', '2014210116', '男', '0', '0101404', '2014210116');
INSERT INTO `student` VALUES ('邹同科', '2014210117', '男', '0', '0101404', '2014210117');
INSERT INTO `student` VALUES ('陈导航', '2014210118', '男', '0', '0191402', '2014210118');
INSERT INTO `student` VALUES ('成一鸣', '2014210119', '男', '0', '0191401', '2014210119');
INSERT INTO `student` VALUES ('刘守东', '2014210120', '男', '0', '0101404', '2014210120');
INSERT INTO `student` VALUES ('毛钦冬', '2014210121', '男', '0', '0101404', '2014210121');
INSERT INTO `student` VALUES ('周创', '2014210122', '男', '0', '0101404', '2014210122');
INSERT INTO `student` VALUES ('李滔', '2014210123', '男', '0', '0101404', '2014210123');
INSERT INTO `student` VALUES ('李剑', '2014210124', '男', '0', '0191402', '2014210124');
INSERT INTO `student` VALUES ('何康波', '2014210125', '男', '0', '0101404', '2014210125');
INSERT INTO `student` VALUES ('李孟松', '2014210126', '男', '0', '0101404', '2014210126');
INSERT INTO `student` VALUES ('罗皓', '2014210127', '男', '0', '0101404', '2014210127');
INSERT INTO `student` VALUES ('陈苑佳', '2014210128', '男', '0', '0101404', '2014210128');
INSERT INTO `student` VALUES ('秦杰', '2014210129', '男', '0', '0101404', '2014210129');
INSERT INTO `student` VALUES ('赵子介', '2014210130', '男', '0', '0101404', '2014210130');
INSERT INTO `student` VALUES ('马鹏飞', '2014210131', '男', '0', '0191401', '2014210131');
INSERT INTO `student` VALUES ('向勇', '2014210132', '男', '0', '0101404', '2014210132');
INSERT INTO `student` VALUES ('陈乔伊', '2014210133', '女', '0', '0101405', '2014210133');
INSERT INTO `student` VALUES ('王杭', '2014210135', '女', '0', '0191402', '2014210135');
INSERT INTO `student` VALUES ('冯嘉欣', '2014210138', '女', '0', '0101405', '2014210138');
INSERT INTO `student` VALUES ('姚晓芳', '2014210140', '女', '0', '0101405', '2014210140');
INSERT INTO `student` VALUES ('杨怡', '2014210141', '女', '0', '0101405', '2014210141');
INSERT INTO `student` VALUES ('杨婷', '2014210142', '女', '0', '0101405', '2014210142');
INSERT INTO `student` VALUES ('高雨薇', '2014210143', '女', '0', '0101405', '2014210143');
INSERT INTO `student` VALUES ('周诗文', '2014210144', '男', '0', '0191402', '2014210144');
INSERT INTO `student` VALUES ('张淼', '2014210145', '男', '0', '0101405', '2014210145');
INSERT INTO `student` VALUES ('王裕', '2014210146', '男', '0', '0101405', '2014210146');
INSERT INTO `student` VALUES ('邢增传', '2014210147', '男', '0', '0101405', '2014210147');
INSERT INTO `student` VALUES ('许倍铭', '2014210148', '男', '0', '0101405', '2014210148');
INSERT INTO `student` VALUES ('黄炜', '2014210149', '男', '0', '0101405', '2014210149');
INSERT INTO `student` VALUES ('陈卓宇', '2014210150', '男', '0', '0101405', '2014210150');
INSERT INTO `student` VALUES ('汪慧', '2014210151', '男', '0', '0101405', '2014210151');
INSERT INTO `student` VALUES ('张旭', '2014210152', '男', '0', '0101405', '2014210152');
INSERT INTO `student` VALUES ('王洁磊', '2014210153', '男', '0', '0101405', '2014210153');
INSERT INTO `student` VALUES ('沈周天', '2014210154', '男', '0', '0101405', '2014210154');
INSERT INTO `student` VALUES ('王谋', '2014210155', '男', '0', '0101405', '2014210155');
INSERT INTO `student` VALUES ('王星', '2014210156', '男', '0', '0101405', '2014210156');
INSERT INTO `student` VALUES ('张奇', '2014210157', '男', '0', '0101405', '2014210157');
INSERT INTO `student` VALUES ('张丽波', '2014210158', '男', '0', '0191402', '2014210158');
INSERT INTO `student` VALUES ('黄强', '2014210159', '男', '0', '0101405', '2014210159');
INSERT INTO `student` VALUES ('吴佳衡', '2014210160', '男', '0', '0101405', '2014210160');
INSERT INTO `student` VALUES ('杨昭', '2014210161', '男', '0', '0191401', '2014210161');
INSERT INTO `student` VALUES ('封雷', '2014210162', '男', '0', '0101405', '2014210162');
INSERT INTO `student` VALUES ('罗浩', '2014210163', '男', '0', '0101405', '2014210163');
INSERT INTO `student` VALUES ('韩双', '2014210165', '男', '0', '0101405', '2014210165');
INSERT INTO `student` VALUES ('孙嘉琳', '2014210166', '女', '0', '0101406', '2014210166');
INSERT INTO `student` VALUES ('郑秀凤', '2014210167', '女', '0', '0101406', '2014210167');
INSERT INTO `student` VALUES ('何李伟', '2014210168', '女', '0', '0191403', '2014210168');
INSERT INTO `student` VALUES ('陈琳', '2014210169', '女', '0', '0101406', '2014210169');
INSERT INTO `student` VALUES ('梁珂佳', '2014210170', '女', '0', '0101406', '2014210170');
INSERT INTO `student` VALUES ('刘婷', '2014210171', '女', '0', '0101406', '2014210171');
INSERT INTO `student` VALUES ('杨奇奇', '2014210172', '女', '0', '0101406', '2014210172');
INSERT INTO `student` VALUES ('向妮', '2014210173', '女', '0', '0101406', '2014210173');
INSERT INTO `student` VALUES ('李娅', '2014210174', '女', '0', '0101406', '2014210174');
INSERT INTO `student` VALUES ('汪运佳', '2014210175', '女', '0', '0101406', '2014210175');
INSERT INTO `student` VALUES ('谭路?', '2014210176', '女', '0', '0101406', '2014210176');
INSERT INTO `student` VALUES ('宋英健', '2014210177', '男', '0', '0101406', '2014210177');
INSERT INTO `student` VALUES ('王伟', '2014210178', '男', '0', '0101406', '2014210178');
INSERT INTO `student` VALUES ('李志鸿', '2014210179', '男', '0', '0101406', '2014210179');
INSERT INTO `student` VALUES ('王心一', '2014210180', '男', '0', '0101406', '2014210180');
INSERT INTO `student` VALUES ('于召峰', '2014210181', '男', '0', '0101406', '2014210181');
INSERT INTO `student` VALUES ('张显', '2014210182', '男', '0', '0101406', '2014210182');
INSERT INTO `student` VALUES ('许可非', '2014210183', '男', '0', '0101406', '2014210183');
INSERT INTO `student` VALUES ('王昊', '2014210184', '男', '0', '0101406', '2014210184');
INSERT INTO `student` VALUES ('辛超宇', '2014210185', '男', '0', '0101406', '2014210185');
INSERT INTO `student` VALUES ('范鑫涛', '2014210186', '男', '0', '0101406', '2014210186');
INSERT INTO `student` VALUES ('孙宁', '2014210187', '男', '0', '0101406', '2014210187');
INSERT INTO `student` VALUES ('赵庆', '2014210188', '男', '0', '0101406', '2014210188');
INSERT INTO `student` VALUES ('赵友渔', '2014210189', '男', '0', '0101406', '2014210189');
INSERT INTO `student` VALUES ('毕锐', '2014210190', '男', '0', '0101406', '2014210190');
INSERT INTO `student` VALUES ('董志浩', '2014210191', '男', '0', '0191403', '2014210191');
INSERT INTO `student` VALUES ('王俊钦', '2014210192', '男', '0', '0101406', '2014210192');
INSERT INTO `student` VALUES ('冉洁', '2014210193', '男', '0', '0101406', '2014210193');
INSERT INTO `student` VALUES ('王飞辉', '2014210194', '男', '0', '0101406', '2014210194');
INSERT INTO `student` VALUES ('邓良浪', '2014210195', '男', '0', '0101406', '2014210195');
INSERT INTO `student` VALUES ('王伟', '2014210196', '男', '0', '0101406', '2014210196');
INSERT INTO `student` VALUES ('刘欣', '2014210197', '男', '0', '0101406', '2014210197');
INSERT INTO `student` VALUES ('周江山', '2014210198', '男', '0', '0101406', '2014210198');
INSERT INTO `student` VALUES ('陈凯第', '2014210199', '女', '0', '0101407', '2014210199');
INSERT INTO `student` VALUES ('冀婷', '2014210200', '女', '0', '0191403', '2014210200');
INSERT INTO `student` VALUES ('宣琪伟', '2014210201', '女', '0', '0191401', '2014210201');
INSERT INTO `student` VALUES ('张文佳', '2014210202', '女', '0', '0191403', '2014210202');
INSERT INTO `student` VALUES ('杨盛莉', '2014210203', '女', '0', '0101407', '2014210203');
INSERT INTO `student` VALUES ('杨霞', '2014210205', '女', '0', '0101407', '2014210205');
INSERT INTO `student` VALUES ('江璐璐', '2014210207', '女', '0', '0101407', '2014210207');
INSERT INTO `student` VALUES ('王丹青', '2014210208', '女', '0', '0191401', '2014210208');
INSERT INTO `student` VALUES ('刘青', '2014210209', '女', '0', '0101407', '2014210209');
INSERT INTO `student` VALUES ('魏子延', '2014210210', '男', '0', '0191402', '2014210210');
INSERT INTO `student` VALUES ('韩弘祖', '2014210211', '男', '0', '0101407', '2014210211');
INSERT INTO `student` VALUES ('张天禄', '2014210212', '男', '0', '0191403', '2014210212');
INSERT INTO `student` VALUES ('王元生', '2014210213', '男', '0', '0101407', '2014210213');
INSERT INTO `student` VALUES ('褚轩', '2014210214', '男', '0', '0101407', '2014210214');
INSERT INTO `student` VALUES ('王宇凌', '2014210215', '男', '0', '0101407', '2014210215');
INSERT INTO `student` VALUES ('杨子毅', '2014210216', '男', '0', '0191401', '2014210216');
INSERT INTO `student` VALUES ('张春', '2014210218', '男', '0', '0101407', '2014210218');
INSERT INTO `student` VALUES ('王同普', '2014210219', '男', '0', '0191402', '2014210219');
INSERT INTO `student` VALUES ('赖加俊', '2014210220', '男', '0', '0101407', '2014210220');
INSERT INTO `student` VALUES ('陈旭', '2014210221', '男', '0', '0101407', '2014210221');
INSERT INTO `student` VALUES ('丁舒驰', '2014210222', '男', '0', '0191401', '2014210222');
INSERT INTO `student` VALUES ('朱文宾', '2014210223', '男', '0', '0101407', '2014210223');
INSERT INTO `student` VALUES ('傅健', '2014210224', '男', '0', '0191403', '2014210224');
INSERT INTO `student` VALUES ('倪志雄', '2014210225', '男', '0', '0101407', '2014210225');
INSERT INTO `student` VALUES ('卿琳', '2014210226', '男', '0', '0101407', '2014210226');
INSERT INTO `student` VALUES ('熊鑫', '2014210227', '男', '0', '0191401', '2014210227');
INSERT INTO `student` VALUES ('奉杰', '2014210228', '男', '0', '0101407', '2014210228');
INSERT INTO `student` VALUES ('张维翰', '2014210229', '男', '0', '0101407', '2014210229');
INSERT INTO `student` VALUES ('廖定杰', '2014210230', '男', '0', '0101407', '2014210230');
INSERT INTO `student` VALUES ('涂小海', '2014210231', '男', '0', '0101407', '2014210231');
INSERT INTO `student` VALUES ('王丽颖', '2014210232', '女', '0', '0101408', '2014210232');
INSERT INTO `student` VALUES ('孙嘉颍', '2014210233', '女', '0', '0101408', '2014210233');
INSERT INTO `student` VALUES ('蔡一铭', '2014210234', '女', '0', '0101408', '2014210234');
INSERT INTO `student` VALUES ('董楠楠', '2014210235', '女', '0', '0101408', '2014210235');
INSERT INTO `student` VALUES ('黄娜', '2014210236', '女', '0', '0101408', '2014210236');
INSERT INTO `student` VALUES ('许悦', '2014210237', '女', '0', '0101408', '2014210237');
INSERT INTO `student` VALUES ('肖雅妮', '2014210238', '女', '0', '0101408', '2014210238');
INSERT INTO `student` VALUES ('郝晶晶', '2014210239', '女', '0', '0101408', '2014210239');
INSERT INTO `student` VALUES ('余萍', '2014210240', '女', '0', '0101408', '2014210240');
INSERT INTO `student` VALUES ('刘芳岑', '2014210241', '女', '0', '0101408', '2014210241');
INSERT INTO `student` VALUES ('李小红', '2014210242', '女', '0', '0101408', '2014210242');
INSERT INTO `student` VALUES ('廖忠伟', '2014210243', '男', '0', '0101408', '2014210243');
INSERT INTO `student` VALUES ('伍信科', '2014210244', '男', '0', '0101408', '2014210244');
INSERT INTO `student` VALUES ('黄胜玉', '2014210245', '男', '0', '0101408', '2014210245');
INSERT INTO `student` VALUES ('李用骏', '2014210246', '男', '0', '0101408', '2014210246');
INSERT INTO `student` VALUES ('王径邦', '2014210247', '男', '0', '0101408', '2014210247');
INSERT INTO `student` VALUES ('付世通', '2014210249', '男', '0', '0101408', '2014210249');
INSERT INTO `student` VALUES ('戴志健', '2014210250', '男', '0', '0101408', '2014210250');
INSERT INTO `student` VALUES ('杨鑫源', '2014210251', '男', '0', '0101408', '2014210251');
INSERT INTO `student` VALUES ('汪成', '2014210252', '男', '0', '0191403', '2014210252');
INSERT INTO `student` VALUES ('邓二宇', '2014210253', '男', '0', '0101408', '2014210253');
INSERT INTO `student` VALUES ('王皓宇', '2014210254', '男', '0', '0101408', '2014210254');
INSERT INTO `student` VALUES ('胡炳昭', '2014210255', '男', '0', '0101408', '2014210255');
INSERT INTO `student` VALUES ('赵燕青', '2014210256', '男', '0', '0101408', '2014210256');
INSERT INTO `student` VALUES ('曾胤', '2014210257', '男', '0', '0191403', '2014210257');
INSERT INTO `student` VALUES ('桂阳', '2014210258', '男', '0', '0101408', '2014210258');
INSERT INTO `student` VALUES ('聂华川', '2014210259', '男', '0', '0101408', '2014210259');
INSERT INTO `student` VALUES ('吴嘉程', '2014210260', '男', '0', '0101408', '2014210260');
INSERT INTO `student` VALUES ('刘致远', '2014210261', '男', '0', '0101408', '2014210261');
INSERT INTO `student` VALUES ('秦浩', '2014210262', '男', '0', '0101408', '2014210262');
INSERT INTO `student` VALUES ('詹林翰', '2014210263', '男', '0', '0101408', '2014210263');
INSERT INTO `student` VALUES ('黄小力', '2014210264', '男', '0', '0101408', '2014210264');
INSERT INTO `student` VALUES ('刘晓雪', '2014210265', '女', '0', '0191402', '2014210265');
INSERT INTO `student` VALUES ('王晓燕', '2014210266', '女', '0', '0101409', '2014210266');
INSERT INTO `student` VALUES ('汪栗妃', '2014210267', '女', '0', '0101409', '2014210267');
INSERT INTO `student` VALUES ('周晨虹', '2014210268', '女', '0', '0101409', '2014210268');
INSERT INTO `student` VALUES ('谢馥如', '2014210269', '女', '0', '0101409', '2014210269');
INSERT INTO `student` VALUES ('彭黎薪', '2014210271', '女', '0', '0101409', '2014210271');
INSERT INTO `student` VALUES ('刘梦涵', '2014210274', '女', '0', '0101409', '2014210274');
INSERT INTO `student` VALUES ('杨修祥', '2014210275', '男', '0', '0101409', '2014210275');
INSERT INTO `student` VALUES ('张建城', '2014210276', '男', '0', '0101409', '2014210276');
INSERT INTO `student` VALUES ('王帅', '2014210277', '男', '0', '0101409', '2014210277');
INSERT INTO `student` VALUES ('张力文', '2014210278', '男', '0', '0101409', '2014210278');
INSERT INTO `student` VALUES ('翟森', '2014210279', '男', '0', '0191403', '2014210279');
INSERT INTO `student` VALUES ('高新东', '2014210280', '男', '0', '0101409', '2014210280');
INSERT INTO `student` VALUES ('于华兵', '2014210281', '男', '0', '0101409', '2014210281');
INSERT INTO `student` VALUES ('韩智博', '2014210282', '男', '0', '0101409', '2014210282');
INSERT INTO `student` VALUES ('郭炜', '2014210283', '男', '0', '0101409', '2014210283');
INSERT INTO `student` VALUES ('武通', '2014210284', '男', '0', '0101409', '2014210284');
INSERT INTO `student` VALUES ('梁泽乾', '2014210285', '男', '0', '0191403', '2014210285');
INSERT INTO `student` VALUES ('张波', '2014210286', '男', '0', '0101409', '2014210286');
INSERT INTO `student` VALUES ('李超', '2014210287', '男', '0', '0101409', '2014210287');
INSERT INTO `student` VALUES ('廖鑫', '2014210288', '男', '0', '0101409', '2014210288');
INSERT INTO `student` VALUES ('和华杰', '2014210289', '男', '0', '0101409', '2014210289');
INSERT INTO `student` VALUES ('唐清?', '2014210290', '男', '0', '0191403', '2014210290');
INSERT INTO `student` VALUES ('方世伟', '2014210291', '男', '0', '0101409', '2014210291');
INSERT INTO `student` VALUES ('冯渝强', '2014210292', '男', '0', '0101409', '2014210292');
INSERT INTO `student` VALUES ('何灵聪', '2014210293', '男', '0', '0101409', '2014210293');
INSERT INTO `student` VALUES ('余永坤', '2014210294', '男', '0', '0191401', '2014210294');
INSERT INTO `student` VALUES ('黎人齐', '2014210295', '男', '0', '0101409', '2014210295');
INSERT INTO `student` VALUES ('兰培珂', '2014210296', '男', '0', '0101409', '2014210296');
INSERT INTO `student` VALUES ('徐勤粟', '2014210297', '男', '0', '0101409', '2014210297');
INSERT INTO `student` VALUES ('赖悦欢', '2014210298', '女', '0', '0101410', '2014210298');
INSERT INTO `student` VALUES ('马利倩', '2014210299', '女', '0', '0101410', '2014210299');
INSERT INTO `student` VALUES ('易丽珍', '2014210300', '女', '0', '0101410', '2014210300');
INSERT INTO `student` VALUES ('武季婷', '2014210301', '女', '0', '0101410', '2014210301');
INSERT INTO `student` VALUES ('张丽萍', '2014210302', '女', '0', '0101410', '2014210302');
INSERT INTO `student` VALUES ('王云琦', '2014210303', '女', '0', '0101410', '2014210303');
INSERT INTO `student` VALUES ('陶春利', '2014210304', '女', '0', '0101410', '2014210304');
INSERT INTO `student` VALUES ('于萍', '2014210305', '女', '0', '0101410', '2014210305');
INSERT INTO `student` VALUES ('何本萍', '2014210306', '女', '0', '0101410', '2014210306');
INSERT INTO `student` VALUES ('夏志莉', '2014210307', '女', '0', '0101410', '2014210307');
INSERT INTO `student` VALUES ('刘玉超', '2014210308', '男', '0', '0101410', '2014210308');
INSERT INTO `student` VALUES ('颜佳林', '2014210309', '男', '0', '0101410', '2014210309');
INSERT INTO `student` VALUES ('黄观宇', '2014210310', '男', '0', '0101410', '2014210310');
INSERT INTO `student` VALUES ('胡凯', '2014210311', '男', '0', '0101410', '2014210311');
INSERT INTO `student` VALUES ('梁冰', '2014210312', '男', '0', '0101410', '2014210312');
INSERT INTO `student` VALUES ('沈军', '2014210313', '男', '0', '0101410', '2014210313');
INSERT INTO `student` VALUES ('张文良', '2014210314', '男', '0', '0101410', '2014210314');
INSERT INTO `student` VALUES ('朱硕星', '2014210315', '男', '0', '0101410', '2014210315');
INSERT INTO `student` VALUES ('万亚鹏', '2014210316', '男', '0', '0101410', '2014210316');
INSERT INTO `student` VALUES ('杨玉春', '2014210317', '男', '0', '0101410', '2014210317');
INSERT INTO `student` VALUES ('肖秩?', '2014210318', '男', '0', '0191403', '2014210318');
INSERT INTO `student` VALUES ('李远剑', '2014210319', '男', '0', '0101410', '2014210319');
INSERT INTO `student` VALUES ('程学理', '2014210320', '男', '0', '0101410', '2014210320');
INSERT INTO `student` VALUES ('王洪斌', '2014210321', '男', '0', '0101410', '2014210321');
INSERT INTO `student` VALUES ('浦若鹏', '2014210322', '男', '0', '0101410', '2014210322');
INSERT INTO `student` VALUES ('李铭翔', '2014210323', '男', '0', '0191401', '2014210323');
INSERT INTO `student` VALUES ('杨文帆', '2014210325', '男', '0', '0101410', '2014210325');
INSERT INTO `student` VALUES ('汤俊波', '2014210326', '男', '0', '0101410', '2014210326');
INSERT INTO `student` VALUES ('黄诗宇', '2014210327', '男', '0', '0101410', '2014210327');
INSERT INTO `student` VALUES ('张芸川', '2014210328', '男', '0', '0101410', '2014210328');
INSERT INTO `student` VALUES ('黄裕沣', '2014210329', '男', '0', '0101410', '2014210329');
INSERT INTO `student` VALUES ('王小刚', '2014210330', '男', '0', '0101410', '2014210330');
INSERT INTO `student` VALUES ('黄燕梅', '2014210331', '女', '0', '0191403', '2014210331');
INSERT INTO `student` VALUES ('徐鑫鑫', '2014210332', '女', '0', '0191403', '2014210332');
INSERT INTO `student` VALUES ('左颖敏', '2014210333', '女', '0', '0191402', '2014210333');
INSERT INTO `student` VALUES ('张洒', '2014210334', '女', '0', '0191403', '2014210334');
INSERT INTO `student` VALUES ('刘红', '2014210335', '女', '0', '0101411', '2014210335');
INSERT INTO `student` VALUES ('谭希琳', '2014210336', '女', '0', '0101411', '2014210336');
INSERT INTO `student` VALUES ('杨莉', '2014210337', '女', '0', '0191401', '2014210337');
INSERT INTO `student` VALUES ('杨露', '2014210338', '女', '0', '0101411', '2014210338');
INSERT INTO `student` VALUES ('曾于珊', '2014210339', '女', '0', '0191401', '2014210339');
INSERT INTO `student` VALUES ('袁欢欢', '2014210340', '女', '0', '0101411', '2014210340');
INSERT INTO `student` VALUES ('何迪原', '2014210341', '男', '0', '0101411', '2014210341');
INSERT INTO `student` VALUES ('林威', '2014210342', '男', '0', '0101411', '2014210342');
INSERT INTO `student` VALUES ('谢赛东', '2014210343', '男', '0', '0101411', '2014210343');
INSERT INTO `student` VALUES ('胡兴黔', '2014210344', '男', '0', '0101411', '2014210344');
INSERT INTO `student` VALUES ('郭朔呈', '2014210345', '男', '0', '0101411', '2014210345');
INSERT INTO `student` VALUES ('李智鹏', '2014210346', '男', '0', '0101411', '2014210346');
INSERT INTO `student` VALUES ('黄龙', '2014210347', '男', '0', '0101411', '2014210347');
INSERT INTO `student` VALUES ('卢旭', '2014210348', '男', '0', '0101411', '2014210348');
INSERT INTO `student` VALUES ('张立欢', '2014210349', '男', '0', '0101411', '2014210349');
INSERT INTO `student` VALUES ('韩昌军', '2014210350', '男', '0', '0101411', '2014210350');
INSERT INTO `student` VALUES ('姜汶志', '2014210351', '男', '0', '0191403', '2014210351');
INSERT INTO `student` VALUES ('王海洲', '2014210352', '男', '0', '0101411', '2014210352');
INSERT INTO `student` VALUES ('曹宇航', '2014210353', '男', '0', '0101411', '2014210353');
INSERT INTO `student` VALUES ('赵宏鹏', '2014210354', '男', '0', '0101411', '2014210354');
INSERT INTO `student` VALUES ('付剑川', '2014210355', '男', '0', '0101411', '2014210355');
INSERT INTO `student` VALUES ('唐浩', '2014210356', '男', '0', '0101411', '2014210356');
INSERT INTO `student` VALUES ('李荣', '2014210357', '男', '0', '0101411', '2014210357');
INSERT INTO `student` VALUES ('冉骏', '2014210358', '男', '0', '0101411', '2014210358');
INSERT INTO `student` VALUES ('谢东明', '2014210359', '男', '0', '0101411', '2014210359');
INSERT INTO `student` VALUES ('杨雨成', '2014210360', '男', '0', '0101411', '2014210360');
INSERT INTO `student` VALUES ('章宇', '2014210361', '男', '0', '0101411', '2014210361');
INSERT INTO `student` VALUES ('程昶', '2014210362', '男', '0', '0101411', '2014210362');
INSERT INTO `student` VALUES ('姚文杰', '2014210363', '男', '0', '0101411', '2014210363');
INSERT INTO `student` VALUES ('骆慧庭', '2014210364', '女', '0', '0101412', '2014210364');
INSERT INTO `student` VALUES ('蔡玉操', '2014210365', '女', '0', '0101412', '2014210365');
INSERT INTO `student` VALUES ('郭泰华', '2014210366', '女', '0', '0101412', '2014210366');
INSERT INTO `student` VALUES ('路荣荣', '2014210367', '女', '0', '0191403', '2014210367');
INSERT INTO `student` VALUES ('汪欣', '2014210368', '女', '0', '0191402', '2014210368');
INSERT INTO `student` VALUES ('王晓筱', '2014210369', '女', '0', '0101412', '2014210369');
INSERT INTO `student` VALUES ('郭又银', '2014210370', '女', '0', '0101412', '2014210370');
INSERT INTO `student` VALUES ('覃伟', '2014210371', '女', '0', '0101412', '2014210371');
INSERT INTO `student` VALUES ('曾紫薇', '2014210372', '女', '0', '0101412', '2014210372');
INSERT INTO `student` VALUES ('张敏', '2014210373', '女', '0', '0101412', '2014210373');
INSERT INTO `student` VALUES ('赵亚昕', '2014210374', '男', '0', '0101412', '2014210374');
INSERT INTO `student` VALUES ('郭达誉', '2014210376', '男', '0', '0191402', '2014210376');
INSERT INTO `student` VALUES ('李慕宇', '2014210378', '男', '0', '0191403', '2014210378');
INSERT INTO `student` VALUES ('王天润', '2014210379', '男', '0', '0101412', '2014210379');
INSERT INTO `student` VALUES ('黄季暄', '2014210380', '男', '0', '0101412', '2014210380');
INSERT INTO `student` VALUES ('周建宇', '2014210381', '男', '0', '0101412', '2014210381');
INSERT INTO `student` VALUES ('杨一夫', '2014210382', '男', '0', '0101412', '2014210382');
INSERT INTO `student` VALUES ('李兆祥', '2014210383', '男', '0', '0101412', '2014210383');
INSERT INTO `student` VALUES ('汤磊', '2014210384', '男', '0', '0191403', '2014210384');
INSERT INTO `student` VALUES ('万磊', '2014210385', '男', '0', '0101412', '2014210385');
INSERT INTO `student` VALUES ('吴?弘', '2014210386', '男', '0', '0101412', '2014210386');
INSERT INTO `student` VALUES ('董晓林', '2014210387', '男', '0', '0101412', '2014210387');
INSERT INTO `student` VALUES ('杨键', '2014210388', '男', '0', '0101412', '2014210388');
INSERT INTO `student` VALUES ('范航', '2014210390', '男', '0', '0101412', '2014210390');
INSERT INTO `student` VALUES ('蒲俊忠', '2014210391', '男', '0', '0101412', '2014210391');
INSERT INTO `student` VALUES ('叶培明', '2014210392', '男', '0', '0191401', '2014210392');
INSERT INTO `student` VALUES ('张于豪', '2014210393', '男', '0', '0101412', '2014210393');
INSERT INTO `student` VALUES ('马柯伽', '2014210394', '男', '0', '0191401', '2014210394');
INSERT INTO `student` VALUES ('彭??', '2014210395', '男', '0', '0101412', '2014210395');
INSERT INTO `student` VALUES ('林梦莹', '2014210396', '女', '0', '0101413', '2014210396');
INSERT INTO `student` VALUES ('赵新雨', '2014210397', '女', '0', '0191403', '2014210397');
INSERT INTO `student` VALUES ('姚佳敏', '2014210398', '女', '0', '0101413', '2014210398');
INSERT INTO `student` VALUES ('李雪妍', '2014210399', '女', '0', '0191403', '2014210399');
INSERT INTO `student` VALUES ('彭玉婷', '2014210400', '女', '0', '0101413', '2014210400');
INSERT INTO `student` VALUES ('陈静', '2014210401', '女', '0', '0191402', '2014210401');
INSERT INTO `student` VALUES ('周丽', '2014210402', '女', '0', '0101413', '2014210402');
INSERT INTO `student` VALUES ('关燕', '2014210403', '女', '0', '0101413', '2014210403');
INSERT INTO `student` VALUES ('吴文静', '2014210404', '女', '0', '0101413', '2014210404');
INSERT INTO `student` VALUES ('骆晓娟', '2014210405', '女', '0', '0101413', '2014210405');
INSERT INTO `student` VALUES ('程磊', '2014210406', '男', '0', '0101413', '2014210406');
INSERT INTO `student` VALUES ('林展翔', '2014210407', '男', '0', '0191402', '2014210407');
INSERT INTO `student` VALUES ('杨兆锋', '2014210408', '男', '0', '0101413', '2014210408');
INSERT INTO `student` VALUES ('晏飞扬', '2014210409', '男', '0', '0101413', '2014210409');
INSERT INTO `student` VALUES ('刘昊', '2014210410', '男', '0', '0101413', '2014210410');
INSERT INTO `student` VALUES ('黄家齐', '2014210411', '男', '0', '0191403', '2014210411');
INSERT INTO `student` VALUES ('刘俊杰', '2014210412', '男', '0', '0191402', '2014210412');
INSERT INTO `student` VALUES ('张珩', '2014210413', '男', '0', '0101413', '2014210413');
INSERT INTO `student` VALUES ('沈博潇', '2014210414', '男', '0', '0101413', '2014210414');
INSERT INTO `student` VALUES ('祝超群', '2014210415', '男', '0', '0191401', '2014210415');
INSERT INTO `student` VALUES ('徐鹏', '2014210416', '男', '0', '0101413', '2014210416');
INSERT INTO `student` VALUES ('段若天', '2014210417', '男', '0', '0101413', '2014210417');
INSERT INTO `student` VALUES ('袁中行', '2014210418', '男', '0', '0101413', '2014210418');
INSERT INTO `student` VALUES ('潘鑫', '2014210419', '男', '0', '0191402', '2014210419');
INSERT INTO `student` VALUES ('申屠敏健', '2014210420', '男', '0', '0101413', '2014210420');
INSERT INTO `student` VALUES ('雷援杰', '2014210421', '男', '0', '0101413', '2014210421');
INSERT INTO `student` VALUES ('陈定坤', '2014210422', '男', '0', '0101413', '2014210422');
INSERT INTO `student` VALUES ('孙涛', '2014210423', '男', '0', '0101413', '2014210423');
INSERT INTO `student` VALUES ('席浩', '2014210424', '男', '0', '0101413', '2014210424');
INSERT INTO `student` VALUES ('蒋艺豪', '2014210425', '男', '0', '0101413', '2014210425');
INSERT INTO `student` VALUES ('朱浩', '2014210426', '男', '0', '0101413', '2014210426');
INSERT INTO `student` VALUES ('余勇波', '2014210427', '男', '0', '0101413', '2014210427');
INSERT INTO `student` VALUES ('杨迁', '2014210428', '女', '0', '0101414', '2014210428');
INSERT INTO `student` VALUES ('王雪晴', '2014210429', '女', '0', '0101414', '2014210429');
INSERT INTO `student` VALUES ('孙芙蓉', '2014210430', '女', '0', '0101414', '2014210430');
INSERT INTO `student` VALUES ('贺雪梅', '2014210431', '女', '0', '0191403', '2014210431');
INSERT INTO `student` VALUES ('李晗琳', '2014210432', '女', '0', '0101414', '2014210432');
INSERT INTO `student` VALUES ('李娟', '2014210433', '女', '0', '0101414', '2014210433');
INSERT INTO `student` VALUES ('张兰秋月', '2014210434', '女', '0', '0191401', '2014210434');
INSERT INTO `student` VALUES ('马莉娜', '2014210435', '女', '0', '0101414', '2014210435');
INSERT INTO `student` VALUES ('陈凤', '2014210436', '女', '0', '0101414', '2014210436');
INSERT INTO `student` VALUES ('白鑫宇', '2014210437', '女', '0', '0101414', '2014210437');
INSERT INTO `student` VALUES ('唐德胜', '2014210438', '男', '0', '0191402', '2014210438');
INSERT INTO `student` VALUES ('李宗强', '2014210439', '男', '0', '0191402', '2014210439');
INSERT INTO `student` VALUES ('连焕佳', '2014210440', '男', '0', '0191402', '2014210440');
INSERT INTO `student` VALUES ('张豪', '2014210441', '男', '0', '0101414', '2014210441');
INSERT INTO `student` VALUES ('陈思捷', '2014210442', '男', '0', '0191402', '2014210442');
INSERT INTO `student` VALUES ('骆飞', '2014210443', '男', '0', '0191403', '2014210443');
INSERT INTO `student` VALUES ('温顺杰', '2014210444', '男', '0', '0191403', '2014210444');
INSERT INTO `student` VALUES ('陈子琰', '2014210445', '男', '0', '0101414', '2014210445');
INSERT INTO `student` VALUES ('廖鹏', '2014210446', '男', '0', '0101414', '2014210446');
INSERT INTO `student` VALUES ('谭新', '2014210447', '男', '0', '0101414', '2014210447');
INSERT INTO `student` VALUES ('张帅', '2014210448', '男', '0', '0191403', '2014210448');
INSERT INTO `student` VALUES ('谭皓', '2014210449', '男', '0', '0191401', '2014210449');
INSERT INTO `student` VALUES ('王贵龙', '2014210451', '男', '0', '0191401', '2014210451');
INSERT INTO `student` VALUES ('赵嘉楠', '2014210452', '男', '0', '0101414', '2014210452');
INSERT INTO `student` VALUES ('陈昱帆', '2014210453', '男', '0', '0101414', '2014210453');
INSERT INTO `student` VALUES ('陈俊伊', '2014210454', '男', '0', '0191401', '2014210454');
INSERT INTO `student` VALUES ('李健川', '2014210455', '男', '0', '0101414', '2014210455');
INSERT INTO `student` VALUES ('李文森', '2014210456', '男', '0', '0101414', '2014210456');
INSERT INTO `student` VALUES ('谭力山', '2014210457', '男', '0', '0101414', '2014210457');
INSERT INTO `student` VALUES ('何彦琦', '2014210458', '男', '0', '0101414', '2014210458');
INSERT INTO `student` VALUES ('张文成', '2014210459', '男', '0', '0101414', '2014210459');
INSERT INTO `student` VALUES ('李轶玮', '2014210460', '女', '0', '0101415', '2014210460');
INSERT INTO `student` VALUES ('胡蕾雅', '2014210461', '女', '0', '0101415', '2014210461');
INSERT INTO `student` VALUES ('张莉雯', '2014210462', '女', '0', '0101415', '2014210462');
INSERT INTO `student` VALUES ('朱丹青', '2014210463', '女', '0', '0101415', '2014210463');
INSERT INTO `student` VALUES ('朱姗', '2014210464', '女', '0', '0101415', '2014210464');
INSERT INTO `student` VALUES ('庄娴', '2014210465', '女', '0', '0101415', '2014210465');
INSERT INTO `student` VALUES ('刘嘉', '2014210466', '女', '0', '0101415', '2014210466');
INSERT INTO `student` VALUES ('黄华', '2014210467', '女', '0', '0101415', '2014210467');
INSERT INTO `student` VALUES ('唐栀馨', '2014210468', '女', '0', '0101415', '2014210468');
INSERT INTO `student` VALUES ('张月', '2014210469', '女', '0', '0101415', '2014210469');
INSERT INTO `student` VALUES ('谢煜', '2014210471', '男', '0', '0101415', '2014210471');
INSERT INTO `student` VALUES ('王家峰', '2014210473', '男', '0', '0191402', '2014210473');
INSERT INTO `student` VALUES ('刘子煜', '2014210474', '男', '0', '0101415', '2014210474');
INSERT INTO `student` VALUES ('李翌昕', '2014210475', '男', '0', '0191402', '2014210475');
INSERT INTO `student` VALUES ('王竞翔', '2014210476', '男', '0', '0101415', '2014210476');
INSERT INTO `student` VALUES ('樊阳', '2014210477', '男', '0', '0101415', '2014210477');
INSERT INTO `student` VALUES ('邱健', '2014210478', '男', '0', '0101415', '2014210478');
INSERT INTO `student` VALUES ('宋东兴', '2014210479', '男', '0', '0101415', '2014210479');
INSERT INTO `student` VALUES ('李佳鑫', '2014210480', '男', '0', '0101415', '2014210480');
INSERT INTO `student` VALUES ('张凡', '2014210481', '男', '0', '0101415', '2014210481');
INSERT INTO `student` VALUES ('林剑夷', '2014210482', '男', '0', '0101415', '2014210482');
INSERT INTO `student` VALUES ('栾志辉', '2014210483', '男', '0', '0101415', '2014210483');
INSERT INTO `student` VALUES ('何远舟', '2014210484', '男', '0', '0101415', '2014210484');
INSERT INTO `student` VALUES ('喻秋峰', '2014210485', '男', '0', '0101415', '2014210485');
INSERT INTO `student` VALUES ('唐帅', '2014210487', '男', '0', '0101415', '2014210487');
INSERT INTO `student` VALUES ('周镇逸', '2014210488', '男', '0', '0101415', '2014210488');
INSERT INTO `student` VALUES ('姚登科', '2014210489', '男', '0', '0101415', '2014210489');
INSERT INTO `student` VALUES ('杨海生', '2014210490', '男', '0', '0101415', '2014210490');
INSERT INTO `student` VALUES ('彭泽军', '2014210491', '男', '0', '0101415', '2014210491');
INSERT INTO `student` VALUES ('汤健梅', '2014210492', '女', '0', '0101416', '2014210492');
INSERT INTO `student` VALUES ('张越', '2014210493', '女', '0', '0101416', '2014210493');
INSERT INTO `student` VALUES ('蒲欣', '2014210494', '女', '0', '0101416', '2014210494');
INSERT INTO `student` VALUES ('段玲', '2014210495', '女', '0', '0101416', '2014210495');
INSERT INTO `student` VALUES ('魏靖宜', '2014210496', '女', '0', '0101416', '2014210496');
INSERT INTO `student` VALUES ('王萱', '2014210497', '女', '0', '0191403', '2014210497');
INSERT INTO `student` VALUES ('赵鑫', '2014210498', '女', '0', '0101416', '2014210498');
INSERT INTO `student` VALUES ('张碧', '2014210499', '女', '0', '0101416', '2014210499');
INSERT INTO `student` VALUES ('喻倩', '2014210500', '女', '0', '0101416', '2014210500');
INSERT INTO `student` VALUES ('王爽', '2014210501', '女', '0', '0101416', '2014210501');
INSERT INTO `student` VALUES ('郑其坤', '2014210502', '男', '0', '0101416', '2014210502');
INSERT INTO `student` VALUES ('盛学诚', '2014210503', '男', '0', '0101416', '2014210503');
INSERT INTO `student` VALUES ('张杰', '2014210504', '男', '0', '0191403', '2014210504');
INSERT INTO `student` VALUES ('吴锐', '2014210505', '男', '0', '0101416', '2014210505');
INSERT INTO `student` VALUES ('谢玉凯', '2014210506', '男', '0', '0101416', '2014210506');
INSERT INTO `student` VALUES ('高权奥', '2014210507', '男', '0', '0191402', '2014210507');
INSERT INTO `student` VALUES ('周宇明', '2014210508', '男', '0', '0191403', '2014210508');
INSERT INTO `student` VALUES ('王福海', '2014210509', '男', '0', '0101416', '2014210509');
INSERT INTO `student` VALUES ('姚远', '2014210510', '男', '0', '0101416', '2014210510');
INSERT INTO `student` VALUES ('郭方', '2014210511', '男', '0', '0191403', '2014210511');
INSERT INTO `student` VALUES ('陈京', '2014210512', '男', '0', '0101416', '2014210512');
INSERT INTO `student` VALUES ('胡峻玮', '2014210513', '男', '0', '0191403', '2014210513');
INSERT INTO `student` VALUES ('蔡庆', '2014210514', '男', '0', '0191401', '2014210514');
INSERT INTO `student` VALUES ('魏飞', '2014210515', '男', '0', '0101416', '2014210515');
INSERT INTO `student` VALUES ('孙福赞', '2014210516', '男', '0', '0101416', '2014210516');
INSERT INTO `student` VALUES ('张浩炜', '2014210517', '男', '0', '0191403', '2014210517');
INSERT INTO `student` VALUES ('李建明', '2014210518', '男', '0', '0101416', '2014210518');
INSERT INTO `student` VALUES ('张益明', '2014210519', '男', '0', '0101416', '2014210519');
INSERT INTO `student` VALUES ('王滔', '2014210520', '男', '0', '0101416', '2014210520');
INSERT INTO `student` VALUES ('潘银春', '2014210521', '男', '0', '0101416', '2014210521');
INSERT INTO `student` VALUES ('谢江航', '2014210522', '男', '0', '0101416', '2014210522');
INSERT INTO `student` VALUES ('向星昊', '2014210523', '男', '0', '0101416', '2014210523');
INSERT INTO `student` VALUES ('敖初妍', '2014210557', '女', '0', '0101413', '2014210557');
INSERT INTO `student` VALUES ('杜博文', '2014210709', '女', '0', '0101401', '2014210709');
INSERT INTO `student` VALUES ('陈园园', '2014210739', '女', '0', '0101401', '2014210739');
INSERT INTO `student` VALUES ('杨苑青', '2014211058', '女', '0', '0101401', '2014211058');
INSERT INTO `student` VALUES ('岳紫颖', '2014211088', '女', '0', '0101401', '2014211088');
INSERT INTO `student` VALUES ('文言', '2014211126', '女', '0', '0101405', '2014211126');
INSERT INTO `student` VALUES ('刘亚', '2014211238', '男', '0', '0101414', '2014211238');
INSERT INTO `student` VALUES ('周颖', '2014211250', '女', '0', '0101416', '2014211250');
INSERT INTO `student` VALUES ('陈鸿娟', '2014211287', '女', '0', '0101412', '2014211287');
INSERT INTO `student` VALUES ('李振卓', '2014211301', '男', '0', '0101401', '2014211301');
INSERT INTO `student` VALUES ('陈雅舒', '2014211739', '女', '0', '0101412', '2014211739');
INSERT INTO `student` VALUES ('马枢清', '2014211810', '女', '0', '0101416', '2014211810');
INSERT INTO `student` VALUES ('樊小畅', '2014211811', '女', '0', '0101413', '2014211811');
INSERT INTO `student` VALUES ('吴雨', '2014211812', '女', '0', '0101416', '2014211812');
INSERT INTO `student` VALUES ('杜代忠', '2014212031', '男', '0', '0101412', '2014212031');
INSERT INTO `student` VALUES ('张烨平', '2014212061', '男', '0', '0101413', '2014212061');
INSERT INTO `student` VALUES ('刘佳', '2014212091', '男', '0', '0101401', '2014212091');
INSERT INTO `student` VALUES ('刘炼', '2014212106', '男', '0', '0101414', '2014212106');
INSERT INTO `student` VALUES ('丁奥', '2014212130', '男', '0', '0101407', '2014212130');
INSERT INTO `student` VALUES ('檀天涵', '2014212154', '男', '0', '0101405', '2014212154');
INSERT INTO `student` VALUES ('夏磊', '2014212195', '男', '0', '0101412', '2014212195');
INSERT INTO `student` VALUES ('程晨', '2014212207', '女', '0', '0101405', '2014212207');
INSERT INTO `student` VALUES ('包训刚', '2014212371', '男', '0', '0101414', '2014212371');
INSERT INTO `student` VALUES ('朱鹏', '2014212430', '男', '0', '0101407', '2014212430');
INSERT INTO `student` VALUES ('杨瑾', '2014212436', '女', '0', '0101414', '2014212436');
INSERT INTO `student` VALUES ('张佳伟', '2014212481', '男', '0', '0101401', '2014212481');
INSERT INTO `student` VALUES ('朱跃方', '2014212504', '女', '0', '0101401', '2014212504');
INSERT INTO `student` VALUES ('洪卓呈', '2014212571', '女', '0', '0101414', '2014212571');
INSERT INTO `student` VALUES ('赵本田', '2014212752', '男', '0', '0101407', '2014212752');
INSERT INTO `student` VALUES ('张志', '2014212757', '男', '0', '0101414', '2014212757');
INSERT INTO `student` VALUES ('肖西梅', '2014212810', '女', '0', '0101413', '2014212810');
INSERT INTO `student` VALUES ('罗斌', '2014212853', '男', '0', '0101413', '2014212853');
INSERT INTO `student` VALUES ('庞人山', '2014212855', '男', '0', '0101416', '2014212855');
INSERT INTO `student` VALUES ('王恺', '2014213000', '女', '0', '0101407', '2014213000');
INSERT INTO `student` VALUES ('曾辉', '2014213019', '男', '0', '0101407', '2014213019');
INSERT INTO `student` VALUES ('郭群强', '2014213068', '男', '0', '0101407', '2014213068');
INSERT INTO `student` VALUES ('李志奇', '2014213098', '男', '0', '0101416', '2014213098');
INSERT INTO `student` VALUES ('任超', '2014213107', '男', '0', '0101414', '2014213107');
INSERT INTO `student` VALUES ('赵荣鑫', '2014213112', '男', '0', '0101405', '2014213112');
INSERT INTO `student` VALUES ('张强', '2014214335', '男', '0', '0101407', '2014214335');
INSERT INTO `student` VALUES ('陈怡西', '2014214374', '女', '0', '0101407', '2014214374');
INSERT INTO `student` VALUES ('杨维新', '2014214394', '男', '0', '0101412', '2014214394');
INSERT INTO `student` VALUES ('陈作', '2014214571', '男', '0', '0101404', '2014214571');
INSERT INTO `student` VALUES ('李海楠', '2015210003', '男', '0', '01141501', '2015210003');
INSERT INTO `student` VALUES ('黄思翔', '2015210004', '男', '0', '01141501', '2015210004');
INSERT INTO `student` VALUES ('胡定昊', '2015210006', '男', '0', '01141501', '2015210006');
INSERT INTO `student` VALUES ('李纯', '2015210007', '男', '0', '01141501', '2015210007');
INSERT INTO `student` VALUES ('杜剑峰', '2015210008', '男', '0', '01141501', '2015210008');
INSERT INTO `student` VALUES ('熊一谦', '2015210012', '男', '0', '01141501', '2015210012');
INSERT INTO `student` VALUES ('彭宇', '2015210013', '男', '0', '01141501', '2015210013');
INSERT INTO `student` VALUES ('周楚航', '2015210014', '男', '0', '01141501', '2015210014');
INSERT INTO `student` VALUES ('吉星熹', '2015210017', '男', '0', '01141501', '2015210017');
INSERT INTO `student` VALUES ('程曦', '2015210018', '男', '0', '01141501', '2015210018');
INSERT INTO `student` VALUES ('吴文陶', '2015210019', '男', '0', '01141501', '2015210019');
INSERT INTO `student` VALUES ('胡强', '2015210020', '男', '0', '01141501', '2015210020');
INSERT INTO `student` VALUES ('吴天伟', '2015210021', '男', '0', '01141501', '2015210021');
INSERT INTO `student` VALUES ('高亮', '2015210022', '男', '0', '01141501', '2015210022');
INSERT INTO `student` VALUES ('程锡培', '2015210023', '男', '0', '01141501', '2015210023');
INSERT INTO `student` VALUES ('杨鹏', '2015210024', '男', '0', '01141501', '2015210024');
INSERT INTO `student` VALUES ('犹鑫', '2015210025', '男', '0', '01141501', '2015210025');
INSERT INTO `student` VALUES ('范嘉辉', '2015210026', '男', '0', '01141501', '2015210026');
INSERT INTO `student` VALUES ('张哲嘉', '2015210027', '男', '0', '01141501', '2015210027');
INSERT INTO `student` VALUES ('王铮', '2015210028', '男', '0', '01141501', '2015210028');
INSERT INTO `student` VALUES ('程禄丰', '2015210029', '男', '0', '01141501', '2015210029');
INSERT INTO `student` VALUES ('杨航', '2015210030', '男', '0', '01141501', '2015210030');
INSERT INTO `student` VALUES ('吴欣欣', '2015210031', '女', '0', '01141501', '2015210031');
INSERT INTO `student` VALUES ('马玉丹', '2015210033', '女', '0', '01141501', '2015210033');
INSERT INTO `student` VALUES ('任可心', '2015210035', '女', '0', '01141501', '2015210035');
INSERT INTO `student` VALUES ('刘昕?', '2015210037', '女', '0', '01141501', '2015210037');
INSERT INTO `student` VALUES ('钟雨君', '2015210038', '女', '0', '01141501', '2015210038');
INSERT INTO `student` VALUES ('李丽', '2015210039', '女', '0', '01141501', '2015210039');
INSERT INTO `student` VALUES ('彭灿', '2015210040', '女', '0', '01141501', '2015210040');
INSERT INTO `student` VALUES ('范中源', '2015210041', '女', '0', '01141501', '2015210041');
INSERT INTO `student` VALUES ('吴思莹', '2015210042', '女', '0', '01141501', '2015210042');
INSERT INTO `student` VALUES ('郑修文', '2015210043', '男', '0', '01141502', '2015210043');
INSERT INTO `student` VALUES ('肖泽平', '2015210044', '男', '0', '01141502', '2015210044');
INSERT INTO `student` VALUES ('刘浩杰', '2015210045', '男', '0', '01141502', '2015210045');
INSERT INTO `student` VALUES ('吴越', '2015210049', '男', '0', '01141502', '2015210049');
INSERT INTO `student` VALUES ('陈明', '2015210050', '男', '0', '01141502', '2015210050');
INSERT INTO `student` VALUES ('柯昌浩', '2015210051', '男', '0', '01141502', '2015210051');
INSERT INTO `student` VALUES ('李云杰', '2015210053', '男', '0', '01141502', '2015210053');
INSERT INTO `student` VALUES ('袁瑞', '2015210054', '男', '0', '01141502', '2015210054');
INSERT INTO `student` VALUES ('刘言', '2015210055', '男', '0', '01141502', '2015210055');
INSERT INTO `student` VALUES ('单飞宇', '2015210056', '男', '0', '01141502', '2015210056');
INSERT INTO `student` VALUES ('卢思宏', '2015210059', '男', '0', '01141502', '2015210059');
INSERT INTO `student` VALUES ('刘灿', '2015210060', '男', '0', '01141502', '2015210060');
INSERT INTO `student` VALUES ('贺杨洪', '2015210061', '男', '0', '01141502', '2015210061');
INSERT INTO `student` VALUES ('傅安民', '2015210062', '男', '0', '01141502', '2015210062');
INSERT INTO `student` VALUES ('莫祥浩', '2015210063', '男', '0', '01141502', '2015210063');
INSERT INTO `student` VALUES ('李松', '2015210064', '男', '0', '01141502', '2015210064');
INSERT INTO `student` VALUES ('尚炳呈', '2015210065', '男', '0', '01141502', '2015210065');
INSERT INTO `student` VALUES ('王志', '2015210066', '男', '0', '01141502', '2015210066');
INSERT INTO `student` VALUES ('宋浩南', '2015210067', '男', '0', '01141502', '2015210067');
INSERT INTO `student` VALUES ('向晋钱', '2015210068', '男', '0', '01141502', '2015210068');
INSERT INTO `student` VALUES ('刘东坡', '2015210069', '男', '0', '01141502', '2015210069');
INSERT INTO `student` VALUES ('刘广敏', '2015210070', '男', '0', '01141502', '2015210070');
INSERT INTO `student` VALUES ('邓?铭', '2015210071', '男', '0', '01141502', '2015210071');
INSERT INTO `student` VALUES ('邹政', '2015210072', '男', '0', '01141502', '2015210072');
INSERT INTO `student` VALUES ('李羿莹', '2015210077', '女', '0', '01141502', '2015210077');
INSERT INTO `student` VALUES ('何梅', '2015210079', '女', '0', '01141502', '2015210079');
INSERT INTO `student` VALUES ('刘露花', '2015210080', '女', '0', '01141502', '2015210080');
INSERT INTO `student` VALUES ('解诗娟', '2015210081', '女', '0', '01141502', '2015210081');
INSERT INTO `student` VALUES ('舒凡一', '2015210082', '女', '0', '01141502', '2015210082');
INSERT INTO `student` VALUES ('谭阳', '2015210083', '女', '0', '01141502', '2015210083');
INSERT INTO `student` VALUES ('严沁春', '2015210084', '女', '0', '01141502', '2015210084');
INSERT INTO `student` VALUES ('陈东航', '2015210086', '男', '0', '01141503', '2015210086');
INSERT INTO `student` VALUES ('张威', '2015210087', '男', '0', '01141503', '2015210087');
INSERT INTO `student` VALUES ('易剑锋', '2015210088', '男', '0', '01141503', '2015210088');
INSERT INTO `student` VALUES ('苏海超', '2015210091', '男', '0', '01141503', '2015210091');
INSERT INTO `student` VALUES ('任帆', '2015210094', '男', '0', '01141503', '2015210094');
INSERT INTO `student` VALUES ('周极', '2015210096', '男', '0', '01141503', '2015210096');
INSERT INTO `student` VALUES ('杨杰', '2015210097', '男', '0', '01141503', '2015210097');
INSERT INTO `student` VALUES ('朱良伟', '2015210098', '男', '0', '01141503', '2015210098');
INSERT INTO `student` VALUES ('易祖政', '2015210099', '男', '0', '01141503', '2015210099');
INSERT INTO `student` VALUES ('杨贵钦', '2015210101', '男', '0', '01141503', '2015210101');
INSERT INTO `student` VALUES ('余扬', '2015210102', '男', '0', '01141503', '2015210102');
INSERT INTO `student` VALUES ('刘颖', '2015210103', '男', '0', '01141503', '2015210103');
INSERT INTO `student` VALUES ('安鑫', '2015210104', '男', '0', '01141503', '2015210104');
INSERT INTO `student` VALUES ('周渝阳', '2015210105', '男', '0', '01141503', '2015210105');
INSERT INTO `student` VALUES ('何理', '2015210106', '男', '0', '01141503', '2015210106');
INSERT INTO `student` VALUES ('袁圣东', '2015210107', '男', '0', '01141503', '2015210107');
INSERT INTO `student` VALUES ('张松', '2015210108', '男', '0', '01141503', '2015210108');
INSERT INTO `student` VALUES ('吴航', '2015210109', '男', '0', '01141503', '2015210109');
INSERT INTO `student` VALUES ('荣安珉', '2015210110', '男', '0', '01141503', '2015210110');
INSERT INTO `student` VALUES ('卜小鱼', '2015210111', '男', '0', '01141503', '2015210111');
INSERT INTO `student` VALUES ('何植', '2015210113', '男', '0', '01141503', '2015210113');
INSERT INTO `student` VALUES ('谭望', '2015210114', '男', '0', '01141503', '2015210114');
INSERT INTO `student` VALUES ('赵泽桐', '2015210115', '女', '0', '01141503', '2015210115');
INSERT INTO `student` VALUES ('黄美永', '2015210116', '女', '0', '01141503', '2015210116');
INSERT INTO `student` VALUES ('许祥娟', '2015210117', '女', '0', '01141503', '2015210117');
INSERT INTO `student` VALUES ('伍怡', '2015210118', '女', '0', '01141503', '2015210118');
INSERT INTO `student` VALUES ('冯雪', '2015210119', '女', '0', '01141503', '2015210119');
INSERT INTO `student` VALUES ('唐红', '2015210120', '女', '0', '01141503', '2015210120');
INSERT INTO `student` VALUES ('李兰', '2015210121', '女', '0', '01141503', '2015210121');
INSERT INTO `student` VALUES ('赵雪君', '2015210122', '女', '0', '01141503', '2015210122');
INSERT INTO `student` VALUES ('佘媛', '2015210123', '女', '0', '01141503', '2015210123');
INSERT INTO `student` VALUES ('姜雪', '2015210124', '女', '0', '01141503', '2015210124');
INSERT INTO `student` VALUES ('陈玄', '2015210125', '女', '0', '01141503', '2015210125');
INSERT INTO `student` VALUES ('刘玉莲', '2015210126', '女', '0', '01141503', '2015210126');
INSERT INTO `student` VALUES ('周天崇', '2015210127', '男', '0', '01141504', '2015210127');
INSERT INTO `student` VALUES ('赵彬旋', '2015210128', '男', '0', '01141504', '2015210128');
INSERT INTO `student` VALUES ('李远乐', '2015210129', '男', '0', '01141504', '2015210129');
INSERT INTO `student` VALUES ('杨忠宇', '2015210130', '男', '0', '01141504', '2015210130');
INSERT INTO `student` VALUES ('刘乃彬', '2015210131', '男', '0', '01141504', '2015210131');
INSERT INTO `student` VALUES ('彭翔宇', '2015210133', '男', '0', '01141504', '2015210133');
INSERT INTO `student` VALUES ('刘坤', '2015210134', '男', '0', '01141504', '2015210134');
INSERT INTO `student` VALUES ('陈慧鑫', '2015210135', '男', '0', '01141504', '2015210135');
INSERT INTO `student` VALUES ('杨鑫玄', '2015210136', '男', '0', '01141504', '2015210136');
INSERT INTO `student` VALUES ('刘汝桥', '2015210137', '男', '0', '01141504', '2015210137');
INSERT INTO `student` VALUES ('曾柏云', '2015210138', '男', '0', '01141504', '2015210138');
INSERT INTO `student` VALUES ('宁博', '2015210139', '男', '0', '01141504', '2015210139');
INSERT INTO `student` VALUES ('李懿新', '2015210140', '男', '0', '01141504', '2015210140');
INSERT INTO `student` VALUES ('陈佳豪', '2015210141', '男', '0', '01141504', '2015210141');
INSERT INTO `student` VALUES ('邓普普', '2015210143', '男', '0', '01141504', '2015210143');
INSERT INTO `student` VALUES ('胡雷', '2015210144', '男', '0', '01141504', '2015210144');
INSERT INTO `student` VALUES ('张帅', '2015210145', '男', '0', '01141504', '2015210145');
INSERT INTO `student` VALUES ('申毅', '2015210146', '男', '0', '01141504', '2015210146');
INSERT INTO `student` VALUES ('韦城成', '2015210147', '男', '0', '01141504', '2015210147');
INSERT INTO `student` VALUES ('汪林', '2015210148', '男', '0', '01141504', '2015210148');
INSERT INTO `student` VALUES ('刘晗', '2015210149', '男', '0', '01141504', '2015210149');
INSERT INTO `student` VALUES ('陈朗', '2015210150', '男', '0', '01141504', '2015210150');
INSERT INTO `student` VALUES ('张欢', '2015210151', '男', '0', '01141504', '2015210151');
INSERT INTO `student` VALUES ('周明剑', '2015210152', '男', '0', '01141504', '2015210152');
INSERT INTO `student` VALUES ('张曦镱', '2015210153', '男', '0', '01141504', '2015210153');
INSERT INTO `student` VALUES ('李为杰', '2015210154', '男', '0', '01141504', '2015210154');
INSERT INTO `student` VALUES ('彭军令', '2015210155', '男', '0', '01141504', '2015210155');
INSERT INTO `student` VALUES ('任秋林', '2015210156', '男', '0', '01141504', '2015210156');
INSERT INTO `student` VALUES ('饶晓雪', '2015210158', '女', '0', '01141504', '2015210158');
INSERT INTO `student` VALUES ('郝思媛', '2015210159', '女', '0', '01141504', '2015210159');
INSERT INTO `student` VALUES ('彭佳欣', '2015210161', '女', '0', '01141504', '2015210161');
INSERT INTO `student` VALUES ('张霞', '2015210162', '女', '0', '01141504', '2015210162');
INSERT INTO `student` VALUES ('张馨月', '2015210163', '女', '0', '01141504', '2015210163');
INSERT INTO `student` VALUES ('刘婷婷', '2015210164', '女', '0', '01141504', '2015210164');
INSERT INTO `student` VALUES ('许曦月', '2015210165', '女', '0', '01141504', '2015210165');
INSERT INTO `student` VALUES ('何静', '2015210166', '女', '0', '01141504', '2015210166');
INSERT INTO `student` VALUES ('于雯瑛', '2015210167', '女', '0', '01141504', '2015210167');
INSERT INTO `student` VALUES ('邢春玲', '2015210168', '女', '0', '01141504', '2015210168');
INSERT INTO `student` VALUES ('刘义珂', '2015210169', '男', '0', '01141505', '2015210169');
INSERT INTO `student` VALUES ('龚浩铭', '2015210170', '男', '0', '01141505', '2015210170');
INSERT INTO `student` VALUES ('黄宇鹏', '2015210171', '男', '0', '01141505', '2015210171');
INSERT INTO `student` VALUES ('雷进', '2015210172', '男', '0', '01141505', '2015210172');
INSERT INTO `student` VALUES ('陈尚君', '2015210175', '男', '0', '01141505', '2015210175');
INSERT INTO `student` VALUES ('朱奎正', '2015210176', '男', '0', '01141505', '2015210176');
INSERT INTO `student` VALUES ('夏宇', '2015210177', '男', '0', '01141505', '2015210177');
INSERT INTO `student` VALUES ('鲁森', '2015210178', '男', '0', '01141505', '2015210178');
INSERT INTO `student` VALUES ('蒲昊', '2015210179', '男', '0', '01141505', '2015210179');
INSERT INTO `student` VALUES ('钟葛飞', '2015210180', '男', '0', '01141505', '2015210180');
INSERT INTO `student` VALUES ('胡晓天', '2015210182', '男', '0', '01141505', '2015210182');
INSERT INTO `student` VALUES ('熊越', '2015210183', '男', '0', '01141505', '2015210183');
INSERT INTO `student` VALUES ('何鑫浩', '2015210185', '男', '0', '01141505', '2015210185');
INSERT INTO `student` VALUES ('陈杰', '2015210186', '男', '0', '01141505', '2015210186');
INSERT INTO `student` VALUES ('张胜楠', '2015210187', '男', '0', '01141505', '2015210187');
INSERT INTO `student` VALUES ('谭淇钟', '2015210188', '男', '0', '01141505', '2015210188');
INSERT INTO `student` VALUES ('何鑫宇', '2015210189', '男', '0', '01141505', '2015210189');
INSERT INTO `student` VALUES ('王源林', '2015210190', '男', '0', '01141505', '2015210190');
INSERT INTO `student` VALUES ('向子豪', '2015210191', '男', '0', '01141505', '2015210191');
INSERT INTO `student` VALUES ('曾芳林', '2015210192', '男', '0', '01141505', '2015210192');
INSERT INTO `student` VALUES ('张庆雨', '2015210193', '男', '0', '01141505', '2015210193');
INSERT INTO `student` VALUES ('何林桐', '2015210194', '男', '0', '01141505', '2015210194');
INSERT INTO `student` VALUES ('唐辉', '2015210195', '男', '0', '01141505', '2015210195');
INSERT INTO `student` VALUES ('杨兴宇', '2015210196', '男', '0', '01141505', '2015210196');
INSERT INTO `student` VALUES ('蒋磊', '2015210197', '男', '0', '01141505', '2015210197');
INSERT INTO `student` VALUES ('王焱珑', '2015210198', '男', '0', '01141505', '2015210198');
INSERT INTO `student` VALUES ('舒雨红', '2015210200', '女', '0', '01141505', '2015210200');
INSERT INTO `student` VALUES ('吴雨潼', '2015210202', '女', '0', '01141505', '2015210202');
INSERT INTO `student` VALUES ('李文文', '2015210204', '女', '0', '01141505', '2015210204');
INSERT INTO `student` VALUES ('黄亚', '2015210205', '女', '0', '01141505', '2015210205');
INSERT INTO `student` VALUES ('夏明露', '2015210206', '女', '0', '01141505', '2015210206');
INSERT INTO `student` VALUES ('唐远渝', '2015210207', '女', '0', '01141505', '2015210207');
INSERT INTO `student` VALUES ('陈念', '2015210208', '女', '0', '01141505', '2015210208');
INSERT INTO `student` VALUES ('王晓红', '2015210209', '女', '0', '01141505', '2015210209');
INSERT INTO `student` VALUES ('江宇玲', '2015210210', '女', '0', '01141505', '2015210210');
INSERT INTO `student` VALUES ('吴洋博', '2015210211', '男', '0', '01141506', '2015210211');
INSERT INTO `student` VALUES ('曹晓博', '2015210212', '男', '0', '01141506', '2015210212');
INSERT INTO `student` VALUES ('牛志远', '2015210213', '男', '0', '01141506', '2015210213');
INSERT INTO `student` VALUES ('周旭', '2015210214', '男', '0', '01141506', '2015210214');
INSERT INTO `student` VALUES ('邹家喜', '2015210218', '男', '0', '01141506', '2015210218');
INSERT INTO `student` VALUES ('钱琪东', '2015210219', '男', '0', '01141506', '2015210219');
INSERT INTO `student` VALUES ('赵?', '2015210220', '男', '0', '01141506', '2015210220');
INSERT INTO `student` VALUES ('吴利伟', '2015210221', '男', '0', '01141506', '2015210221');
INSERT INTO `student` VALUES ('罗淋益', '2015210222', '男', '0', '01141506', '2015210222');
INSERT INTO `student` VALUES ('张成', '2015210223', '男', '0', '01141506', '2015210223');
INSERT INTO `student` VALUES ('张冰彬', '2015210225', '男', '0', '01141506', '2015210225');
INSERT INTO `student` VALUES ('潘俊', '2015210226', '男', '0', '01141506', '2015210226');
INSERT INTO `student` VALUES ('张宇航', '2015210227', '男', '0', '01141506', '2015210227');
INSERT INTO `student` VALUES ('陈柄权', '2015210228', '男', '0', '01141506', '2015210228');
INSERT INTO `student` VALUES ('任青松', '2015210229', '男', '0', '01141506', '2015210229');
INSERT INTO `student` VALUES ('王映植', '2015210230', '男', '0', '01141506', '2015210230');
INSERT INTO `student` VALUES ('张子杰', '2015210231', '男', '0', '01141506', '2015210231');
INSERT INTO `student` VALUES ('高小明', '2015210232', '男', '0', '01141506', '2015210232');
INSERT INTO `student` VALUES ('孙豪', '2015210233', '男', '0', '01141506', '2015210233');
INSERT INTO `student` VALUES ('范新渝', '2015210234', '男', '0', '01141506', '2015210234');
INSERT INTO `student` VALUES ('文淳', '2015210235', '男', '0', '01141506', '2015210235');
INSERT INTO `student` VALUES ('刘帅', '2015210236', '男', '0', '01141506', '2015210236');
INSERT INTO `student` VALUES ('张飞龙', '2015210237', '男', '0', '01141506', '2015210237');
INSERT INTO `student` VALUES ('杜飞', '2015210238', '男', '0', '01141506', '2015210238');
INSERT INTO `student` VALUES ('刘长青', '2015210239', '男', '0', '01141506', '2015210239');
INSERT INTO `student` VALUES ('高小锋', '2015210240', '男', '0', '01141506', '2015210240');
INSERT INTO `student` VALUES ('毕雪', '2015210242', '女', '0', '01141506', '2015210242');
INSERT INTO `student` VALUES ('李良群', '2015210244', '女', '0', '01141506', '2015210244');
INSERT INTO `student` VALUES ('程南茜', '2015210245', '女', '0', '01141506', '2015210245');
INSERT INTO `student` VALUES ('余苹林', '2015210246', '女', '0', '01141506', '2015210246');
INSERT INTO `student` VALUES ('杨瑞', '2015210247', '女', '0', '01141506', '2015210247');
INSERT INTO `student` VALUES ('舒银', '2015210248', '女', '0', '01141506', '2015210248');
INSERT INTO `student` VALUES ('秦铃', '2015210249', '女', '0', '01141506', '2015210249');
INSERT INTO `student` VALUES ('周瑾', '2015210250', '女', '0', '01141506', '2015210250');
INSERT INTO `student` VALUES ('任杰', '2015210251', '女', '0', '01141506', '2015210251');
INSERT INTO `student` VALUES ('罗丹', '2015210252', '女', '0', '01141506', '2015210252');
INSERT INTO `student` VALUES ('翟祥', '2015210253', '男', '0', '01141507', '2015210253');
INSERT INTO `student` VALUES ('陈俊宁', '2015210255', '男', '0', '01141507', '2015210255');
INSERT INTO `student` VALUES ('任承?', '2015210256', '男', '0', '01141507', '2015210256');
INSERT INTO `student` VALUES ('邢展铭', '2015210259', '男', '0', '01141507', '2015210259');
INSERT INTO `student` VALUES ('汤火火', '2015210260', '男', '0', '01141507', '2015210260');
INSERT INTO `student` VALUES ('冯星宇', '2015210261', '男', '0', '01141507', '2015210261');
INSERT INTO `student` VALUES ('高翌轩', '2015210262', '男', '0', '01141507', '2015210262');
INSERT INTO `student` VALUES ('高书陶', '2015210263', '男', '0', '01141507', '2015210263');
INSERT INTO `student` VALUES ('熊得君', '2015210264', '男', '0', '01141507', '2015210264');
INSERT INTO `student` VALUES ('杨永波', '2015210265', '男', '0', '01141507', '2015210265');
INSERT INTO `student` VALUES ('冉家乐', '2015210267', '男', '0', '01141507', '2015210267');
INSERT INTO `student` VALUES ('周涛', '2015210269', '男', '0', '01141507', '2015210269');
INSERT INTO `student` VALUES ('张兴锐', '2015210270', '男', '0', '01141507', '2015210270');
INSERT INTO `student` VALUES ('吴仕帅', '2015210271', '男', '0', '01141507', '2015210271');
INSERT INTO `student` VALUES ('李成林', '2015210272', '男', '0', '01141507', '2015210272');
INSERT INTO `student` VALUES ('周家豪', '2015210273', '男', '0', '01141507', '2015210273');
INSERT INTO `student` VALUES ('张鑫', '2015210274', '男', '0', '01141507', '2015210274');
INSERT INTO `student` VALUES ('莫刚', '2015210275', '男', '0', '01141507', '2015210275');
INSERT INTO `student` VALUES ('张维春', '2015210276', '男', '0', '01141507', '2015210276');
INSERT INTO `student` VALUES ('罗冰', '2015210277', '男', '0', '01141507', '2015210277');
INSERT INTO `student` VALUES ('殷靖栩', '2015210278', '男', '0', '01141507', '2015210278');
INSERT INTO `student` VALUES ('朱凯军', '2015210279', '男', '0', '01141507', '2015210279');
INSERT INTO `student` VALUES ('白芮豪', '2015210280', '男', '0', '01141507', '2015210280');
INSERT INTO `student` VALUES ('陶?宇', '2015210281', '男', '0', '01141507', '2015210281');
INSERT INTO `student` VALUES ('宋姝?', '2015210283', '女', '0', '01141507', '2015210283');
INSERT INTO `student` VALUES ('杨雪洁', '2015210284', '女', '0', '01141507', '2015210284');
INSERT INTO `student` VALUES ('李莹', '2015210285', '女', '0', '01141507', '2015210285');
INSERT INTO `student` VALUES ('柏雪', '2015210286', '女', '0', '01141507', '2015210286');
INSERT INTO `student` VALUES ('唐巧', '2015210288', '女', '0', '01141507', '2015210288');
INSERT INTO `student` VALUES ('何娟', '2015210289', '女', '0', '01141507', '2015210289');
INSERT INTO `student` VALUES ('黄丽', '2015210290', '女', '0', '01141507', '2015210290');
INSERT INTO `student` VALUES ('李欣益', '2015210291', '女', '0', '01141507', '2015210291');
INSERT INTO `student` VALUES ('周雪梅', '2015210292', '女', '0', '01141507', '2015210292');
INSERT INTO `student` VALUES ('陈敏', '2015210293', '女', '0', '01141507', '2015210293');
INSERT INTO `student` VALUES ('郑琨', '2015210295', '男', '0', '01141508', '2015210295');
INSERT INTO `student` VALUES ('郑烘尧', '2015210296', '男', '0', '01141508', '2015210296');
INSERT INTO `student` VALUES ('吴劭', '2015210297', '男', '0', '01141508', '2015210297');
INSERT INTO `student` VALUES ('陈立豪', '2015210298', '男', '0', '01141508', '2015210298');
INSERT INTO `student` VALUES ('程志伟', '2015210301', '男', '0', '01141508', '2015210301');
INSERT INTO `student` VALUES ('庄增鑫', '2015210302', '男', '0', '01141508', '2015210302');
INSERT INTO `student` VALUES ('齐李洵', '2015210303', '男', '0', '01141508', '2015210303');
INSERT INTO `student` VALUES ('邓哲文', '2015210304', '男', '0', '01141508', '2015210304');
INSERT INTO `student` VALUES ('熊志强', '2015210305', '男', '0', '01141508', '2015210305');
INSERT INTO `student` VALUES ('吴宇杰', '2015210308', '男', '0', '01141508', '2015210308');
INSERT INTO `student` VALUES ('陈杰', '2015210309', '男', '0', '01141508', '2015210309');
INSERT INTO `student` VALUES ('廖吉子', '2015210310', '男', '0', '01141508', '2015210310');
INSERT INTO `student` VALUES ('涂世超', '2015210311', '男', '0', '01141508', '2015210311');
INSERT INTO `student` VALUES ('曹露', '2015210312', '男', '0', '01141508', '2015210312');
INSERT INTO `student` VALUES ('方欢', '2015210313', '男', '0', '01141508', '2015210313');
INSERT INTO `student` VALUES ('谭新', '2015210314', '男', '0', '01141508', '2015210314');
INSERT INTO `student` VALUES ('游鹏', '2015210315', '男', '0', '01141508', '2015210315');
INSERT INTO `student` VALUES ('冉粤平', '2015210316', '男', '0', '01141508', '2015210316');
INSERT INTO `student` VALUES ('张枭', '2015210317', '男', '0', '01141508', '2015210317');
INSERT INTO `student` VALUES ('邓博文', '2015210318', '男', '0', '01141508', '2015210318');
INSERT INTO `student` VALUES ('刘李玮玮', '2015210319', '男', '0', '01141508', '2015210319');
INSERT INTO `student` VALUES ('范永陈', '2015210320', '男', '0', '01141508', '2015210320');
INSERT INTO `student` VALUES ('唐伟诚', '2015210321', '男', '0', '01141508', '2015210321');
INSERT INTO `student` VALUES ('罗尧', '2015210322', '男', '0', '01141508', '2015210322');
INSERT INTO `student` VALUES ('黄亚芸', '2015210323', '女', '0', '01141508', '2015210323');
INSERT INTO `student` VALUES ('董璐', '2015210325', '女', '0', '01141508', '2015210325');
INSERT INTO `student` VALUES ('黄晨曦', '2015210326', '女', '0', '01141508', '2015210326');
INSERT INTO `student` VALUES ('肖寒', '2015210327', '女', '0', '01141508', '2015210327');
INSERT INTO `student` VALUES ('刘艺琳', '2015210328', '女', '0', '01141508', '2015210328');
INSERT INTO `student` VALUES ('唐梦琪', '2015210329', '女', '0', '01141508', '2015210329');
INSERT INTO `student` VALUES ('王雪松', '2015210330', '女', '0', '01141508', '2015210330');
INSERT INTO `student` VALUES ('陈瑶', '2015210331', '女', '0', '01141508', '2015210331');
INSERT INTO `student` VALUES ('谢霜', '2015210332', '女', '0', '01141508', '2015210332');
INSERT INTO `student` VALUES ('冯静', '2015210333', '女', '0', '01141508', '2015210333');
INSERT INTO `student` VALUES ('邓莉', '2015210334', '女', '0', '01141508', '2015210334');
INSERT INTO `student` VALUES ('钱赵荣', '2015210335', '男', '0', '01141509', '2015210335');
INSERT INTO `student` VALUES ('杨家鑫', '2015210336', '男', '0', '01141509', '2015210336');
INSERT INTO `student` VALUES ('蔡亦祥', '2015210338', '男', '0', '01141509', '2015210338');
INSERT INTO `student` VALUES ('穆成浩', '2015210339', '男', '0', '01141509', '2015210339');
INSERT INTO `student` VALUES ('吴涛', '2015210341', '男', '0', '01141509', '2015210341');
INSERT INTO `student` VALUES ('叶成林', '2015210342', '男', '0', '01141509', '2015210342');
INSERT INTO `student` VALUES ('张天峰', '2015210343', '男', '0', '01141509', '2015210343');
INSERT INTO `student` VALUES ('黄迪', '2015210344', '男', '0', '01141509', '2015210344');
INSERT INTO `student` VALUES ('张嘉伟', '2015210345', '男', '0', '01141509', '2015210345');
INSERT INTO `student` VALUES ('李明徽', '2015210346', '男', '0', '01141509', '2015210346');
INSERT INTO `student` VALUES ('王易培', '2015210348', '男', '0', '01141509', '2015210348');
INSERT INTO `student` VALUES ('鲁信君', '2015210350', '男', '0', '01141509', '2015210350');
INSERT INTO `student` VALUES ('刘青春', '2015210352', '男', '0', '01141509', '2015210352');
INSERT INTO `student` VALUES ('梅璨', '2015210353', '男', '0', '01141509', '2015210353');
INSERT INTO `student` VALUES ('贺权全', '2015210354', '男', '0', '01141509', '2015210354');
INSERT INTO `student` VALUES ('杨周', '2015210355', '男', '0', '01141509', '2015210355');
INSERT INTO `student` VALUES ('蒋平', '2015210356', '男', '0', '01141509', '2015210356');
INSERT INTO `student` VALUES ('赵柯云', '2015210357', '男', '0', '01141509', '2015210357');
INSERT INTO `student` VALUES ('秦万', '2015210358', '男', '0', '01141509', '2015210358');
INSERT INTO `student` VALUES ('文豪', '2015210359', '男', '0', '01141509', '2015210359');
INSERT INTO `student` VALUES ('龙巍', '2015210360', '男', '0', '01141509', '2015210360');
INSERT INTO `student` VALUES ('张荣坤', '2015210361', '男', '0', '01141509', '2015210361');
INSERT INTO `student` VALUES ('杨小珑', '2015210362', '男', '0', '01141509', '2015210362');
INSERT INTO `student` VALUES ('冉博文', '2015210363', '男', '0', '01141509', '2015210363');
INSERT INTO `student` VALUES ('范泽研', '2015210364', '女', '0', '01141509', '2015210364');
INSERT INTO `student` VALUES ('孙佳欣', '2015210366', '女', '0', '01141509', '2015210366');
INSERT INTO `student` VALUES ('高萌', '2015210367', '女', '0', '01141509', '2015210367');
INSERT INTO `student` VALUES ('刘杉', '2015210368', '女', '0', '01141509', '2015210368');
INSERT INTO `student` VALUES ('张罗', '2015210369', '女', '0', '01141509', '2015210369');
INSERT INTO `student` VALUES ('张曼婷', '2015210370', '女', '0', '01141509', '2015210370');
INSERT INTO `student` VALUES ('吴悦', '2015210371', '女', '0', '01141509', '2015210371');
INSERT INTO `student` VALUES ('陈逸云', '2015210372', '女', '0', '01141509', '2015210372');
INSERT INTO `student` VALUES ('胡渝', '2015210373', '女', '0', '01141509', '2015210373');
INSERT INTO `student` VALUES ('张欣悦', '2015210374', '女', '0', '01141509', '2015210374');
INSERT INTO `student` VALUES ('陈馨', '2015210375', '女', '0', '01141509', '2015210375');
INSERT INTO `student` VALUES ('许童', '2015210376', '男', '0', '01141510', '2015210376');
INSERT INTO `student` VALUES ('刘刚', '2015210377', '男', '0', '01141510', '2015210377');
INSERT INTO `student` VALUES ('周家彬', '2015210379', '男', '0', '01141510', '2015210379');
INSERT INTO `student` VALUES ('李耀华', '2015210380', '男', '0', '01141510', '2015210380');
INSERT INTO `student` VALUES ('秦一鸣', '2015210382', '男', '0', '01141510', '2015210382');
INSERT INTO `student` VALUES ('谭庭松', '2015210383', '男', '0', '01141510', '2015210383');
INSERT INTO `student` VALUES ('李壮', '2015210384', '男', '0', '01141510', '2015210384');
INSERT INTO `student` VALUES ('华汀', '2015210385', '男', '0', '01141510', '2015210385');
INSERT INTO `student` VALUES ('秦川', '2015210386', '男', '0', '01141510', '2015210386');
INSERT INTO `student` VALUES ('王益文', '2015210387', '男', '0', '01141510', '2015210387');
INSERT INTO `student` VALUES ('江金城', '2015210388', '男', '0', '01141510', '2015210388');
INSERT INTO `student` VALUES ('文凌云', '2015210389', '男', '0', '01141510', '2015210389');
INSERT INTO `student` VALUES ('李科', '2015210390', '男', '0', '01141510', '2015210390');
INSERT INTO `student` VALUES ('朱子越', '2015210391', '男', '0', '01141510', '2015210391');
INSERT INTO `student` VALUES ('王可', '2015210392', '男', '0', '01141510', '2015210392');
INSERT INTO `student` VALUES ('张顺', '2015210393', '男', '0', '01141510', '2015210393');
INSERT INTO `student` VALUES ('闵欢', '2015210394', '男', '0', '01141510', '2015210394');
INSERT INTO `student` VALUES ('万官飞', '2015210395', '男', '0', '01141510', '2015210395');
INSERT INTO `student` VALUES ('陈锐', '2015210396', '男', '0', '01141510', '2015210396');
INSERT INTO `student` VALUES ('陈浩', '2015210397', '男', '0', '01141510', '2015210397');
INSERT INTO `student` VALUES ('周成茂', '2015210398', '男', '0', '01141510', '2015210398');
INSERT INTO `student` VALUES ('郑沛越', '2015210399', '男', '0', '01141510', '2015210399');
INSERT INTO `student` VALUES ('冯越', '2015210400', '男', '0', '01141510', '2015210400');
INSERT INTO `student` VALUES ('路航', '2015210401', '男', '0', '01141510', '2015210401');
INSERT INTO `student` VALUES ('罗航', '2015210402', '男', '0', '01141510', '2015210402');
INSERT INTO `student` VALUES ('高荣杰', '2015210403', '男', '0', '01141510', '2015210403');
INSERT INTO `student` VALUES ('李鑫', '2015210404', '男', '0', '01141510', '2015210404');
INSERT INTO `student` VALUES ('吴倩岚', '2015210408', '女', '0', '01141510', '2015210408');
INSERT INTO `student` VALUES ('曾琪思', '2015210409', '女', '0', '01141510', '2015210409');
INSERT INTO `student` VALUES ('刘香渝', '2015210411', '女', '0', '01141510', '2015210411');
INSERT INTO `student` VALUES ('段美娟', '2015210412', '女', '0', '01141510', '2015210412');
INSERT INTO `student` VALUES ('谭芮', '2015210413', '女', '0', '01141510', '2015210413');
INSERT INTO `student` VALUES ('向静怡', '2015210415', '女', '0', '01141510', '2015210415');
INSERT INTO `student` VALUES ('黄莉雯', '2015210416', '女', '0', '01141510', '2015210416');
INSERT INTO `student` VALUES ('梅野', '2015210417', '男', '0', '01141511', '2015210417');
INSERT INTO `student` VALUES ('李增强', '2015210418', '男', '0', '01141511', '2015210418');
INSERT INTO `student` VALUES ('高梓健', '2015210420', '男', '0', '01141511', '2015210420');
INSERT INTO `student` VALUES ('李志斌', '2015210421', '男', '0', '01141511', '2015210421');
INSERT INTO `student` VALUES ('钱志华', '2015210423', '男', '0', '01141511', '2015210423');
INSERT INTO `student` VALUES ('赵天烽', '2015210424', '男', '0', '01141511', '2015210424');
INSERT INTO `student` VALUES ('荆磊', '2015210425', '男', '0', '01141511', '2015210425');
INSERT INTO `student` VALUES ('任彦', '2015210427', '男', '0', '01141511', '2015210427');
INSERT INTO `student` VALUES ('钟健', '2015210428', '男', '0', '01141511', '2015210428');
INSERT INTO `student` VALUES ('陈富贵', '2015210429', '男', '0', '01141511', '2015210429');
INSERT INTO `student` VALUES ('邓红磊', '2015210430', '男', '0', '01141511', '2015210430');
INSERT INTO `student` VALUES ('段瑞吉', '2015210431', '男', '0', '01141511', '2015210431');
INSERT INTO `student` VALUES ('王彬宇', '2015210432', '男', '0', '01141511', '2015210432');
INSERT INTO `student` VALUES ('陈德阳', '2015210433', '男', '0', '01141511', '2015210433');
INSERT INTO `student` VALUES ('罗伟', '2015210434', '男', '0', '01141511', '2015210434');
INSERT INTO `student` VALUES ('邹洋', '2015210435', '男', '0', '01141511', '2015210435');
INSERT INTO `student` VALUES ('王育杰', '2015210436', '男', '0', '01141511', '2015210436');
INSERT INTO `student` VALUES ('郑富元', '2015210437', '男', '0', '01141511', '2015210437');
INSERT INTO `student` VALUES ('何健', '2015210438', '男', '0', '01141511', '2015210438');
INSERT INTO `student` VALUES ('查安均', '2015210439', '男', '0', '01141511', '2015210439');
INSERT INTO `student` VALUES ('戴鑫家', '2015210440', '男', '0', '01141511', '2015210440');
INSERT INTO `student` VALUES ('张杭', '2015210441', '男', '0', '01141511', '2015210441');
INSERT INTO `student` VALUES ('蒋凯旋', '2015210443', '男', '0', '01141511', '2015210443');
INSERT INTO `student` VALUES ('杨桢', '2015210444', '男', '0', '01141511', '2015210444');
INSERT INTO `student` VALUES ('张开翔', '2015210445', '男', '0', '01141511', '2015210445');
INSERT INTO `student` VALUES ('罗慧', '2015210446', '女', '0', '01141511', '2015210446');
INSERT INTO `student` VALUES ('苗卓', '2015210448', '女', '0', '01141511', '2015210448');
INSERT INTO `student` VALUES ('洪玮璇', '2015210449', '女', '0', '01141511', '2015210449');
INSERT INTO `student` VALUES ('刘星彤', '2015210450', '女', '0', '01141511', '2015210450');
INSERT INTO `student` VALUES ('李佶虹', '2015210452', '女', '0', '01141511', '2015210452');
INSERT INTO `student` VALUES ('唐欣', '2015210453', '女', '0', '01141511', '2015210453');
INSERT INTO `student` VALUES ('彭青霞', '2015210454', '女', '0', '01141511', '2015210454');
INSERT INTO `student` VALUES ('王帆', '2015210455', '女', '0', '01141511', '2015210455');
INSERT INTO `student` VALUES ('陈彦如', '2015210456', '女', '0', '01141511', '2015210456');
INSERT INTO `student` VALUES ('曾娅', '2015210457', '女', '0', '01141511', '2015210457');
INSERT INTO `student` VALUES ('何泽生', '2015210459', '男', '0', '01141512', '2015210459');
INSERT INTO `student` VALUES ('覃勇清', '2015210460', '男', '0', '01141512', '2015210460');
INSERT INTO `student` VALUES ('林明发', '2015210461', '男', '0', '01141512', '2015210461');
INSERT INTO `student` VALUES ('林瀚雷', '2015210462', '男', '0', '01141512', '2015210462');
INSERT INTO `student` VALUES ('姚顺雨', '2015210464', '男', '0', '01141512', '2015210464');
INSERT INTO `student` VALUES ('李亦亭', '2015210465', '男', '0', '01141512', '2015210465');
INSERT INTO `student` VALUES ('吴壮', '2015210466', '男', '0', '01141512', '2015210466');
INSERT INTO `student` VALUES ('胡帅', '2015210468', '男', '0', '01141512', '2015210468');
INSERT INTO `student` VALUES ('张昶', '2015210469', '男', '0', '01141512', '2015210469');
INSERT INTO `student` VALUES ('陈治钢', '2015210470', '男', '0', '01141512', '2015210470');
INSERT INTO `student` VALUES ('王萧阳', '2015210472', '男', '0', '01141512', '2015210472');
INSERT INTO `student` VALUES ('蔡霖', '2015210473', '男', '0', '01141512', '2015210473');
INSERT INTO `student` VALUES ('刘安棋', '2015210474', '男', '0', '01141512', '2015210474');
INSERT INTO `student` VALUES ('张忠一', '2015210475', '男', '0', '01141512', '2015210475');
INSERT INTO `student` VALUES ('阳依林', '2015210476', '男', '0', '01141512', '2015210476');
INSERT INTO `student` VALUES ('牟勇', '2015210477', '男', '0', '01141512', '2015210477');
INSERT INTO `student` VALUES ('汪恒超', '2015210478', '男', '0', '01141512', '2015210478');
INSERT INTO `student` VALUES ('王传豪', '2015210479', '男', '0', '01141512', '2015210479');
INSERT INTO `student` VALUES ('梁柱', '2015210480', '男', '0', '01141512', '2015210480');
INSERT INTO `student` VALUES ('陈凌霄', '2015210481', '男', '0', '01141512', '2015210481');
INSERT INTO `student` VALUES ('郭津佐', '2015210482', '男', '0', '01141512', '2015210482');
INSERT INTO `student` VALUES ('骆欢', '2015210483', '男', '0', '01141512', '2015210483');
INSERT INTO `student` VALUES ('杨欣洲', '2015210484', '男', '0', '01141512', '2015210484');
INSERT INTO `student` VALUES ('任威', '2015210485', '男', '0', '01141512', '2015210485');
INSERT INTO `student` VALUES ('李浩', '2015210486', '男', '0', '01141512', '2015210486');
INSERT INTO `student` VALUES ('赵晨曦', '2015210489', '女', '0', '01141512', '2015210489');
INSERT INTO `student` VALUES ('李瑶', '2015210491', '女', '0', '01141512', '2015210491');
INSERT INTO `student` VALUES ('熊欣', '2015210493', '女', '0', '01141512', '2015210493');
INSERT INTO `student` VALUES ('王馨怡', '2015210494', '女', '0', '01141512', '2015210494');
INSERT INTO `student` VALUES ('林秋婷', '2015210495', '女', '0', '01141512', '2015210495');
INSERT INTO `student` VALUES ('何彬', '2015210496', '女', '0', '01141512', '2015210496');
INSERT INTO `student` VALUES ('熊思晖', '2015210497', '女', '0', '01141512', '2015210497');
INSERT INTO `student` VALUES ('胡京菁', '2015210498', '女', '0', '01141512', '2015210498');

-- ----------------------------
-- Table structure for `tclass`
-- ----------------------------
DROP TABLE IF EXISTS `tclass`;
CREATE TABLE `tclass` (
  `Tclass_no` varchar(10) NOT NULL COMMENT '教学班号',
  `Tclass_class_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '班级编号',
  `Tclass_specialty` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教学班专业',
  `tclass_assess_no` varchar(10) NOT NULL COMMENT '考核项编号',
  `tclass_course_no` varchar(10) NOT NULL COMMENT '课程编号',
  `tclass_teacher_ID` varchar(10) NOT NULL COMMENT '老师职工号',
  PRIMARY KEY (`Tclass_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tclass
-- ----------------------------
INSERT INTO `tclass` VALUES ('A011518756', '班级：01914 | 01,02', '通信工程专业卓越工程师班', '7', '010388', '019942');
INSERT INTO `tclass` VALUES ('SJ1511017', '班级：01014 | 10', '通信与信息类', '74', '010393', '019942');
INSERT INTO `tclass` VALUES ('SJ1511024', '班级：01913 | 03', '通信学院IT精英班', '75', '010394', '019942');
INSERT INTO `tclass` VALUES ('SJ1511090', '班级：01914 | 01', '通信工程专业卓越工程师班', '76', '010395', '019942');
INSERT INTO `tclass` VALUES ('SJ1511091', '班级：01914 | 02', '通信工程专业卓越工程师班', '77', '010395', '019942');
INSERT INTO `tclass` VALUES ('SJ1511092', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '78', '010398', '019942');
INSERT INTO `tclass` VALUES ('SJ151990', '班级：01413 | 01', '信息工程', '79', '010610', '019942');
INSERT INTO `tclass` VALUES ('SK01151714', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '80', '010243', '019942');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_ID` varchar(10) NOT NULL COMMENT '职工号',
  `teacher_name` varchar(10) NOT NULL COMMENT '老师姓名',
  `teacher_sex` varchar(2) NOT NULL COMMENT '性别',
  `teacher_school` varchar(255) DEFAULT NULL,
  `teacher_depart` char(50) NOT NULL COMMENT '系别',
  `teacher_position` varchar(10) NOT NULL COMMENT '职务',
  `teacher_password` varchar(16) NOT NULL COMMENT '密码',
  PRIMARY KEY (`teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('010001', '通信外聘', '男', '8', '18', '', '010001');
INSERT INTO `teacher` VALUES ('010002', '殷茜', '女', '8', '15', '副教授', '010002');
INSERT INTO `teacher` VALUES ('010112', '郑丹玲', '女', '8', '11', '讲师', '010112');
INSERT INTO `teacher` VALUES ('010113', '雷芳(通)', '女', '8', '14', '副教授', '010113');
INSERT INTO `teacher` VALUES ('010114', '杨晓非', '男', '8', '11', '副教授', '010114');
INSERT INTO `teacher` VALUES ('010125', '蔚承英', '女', '8', '11', '讲师', '010125');
INSERT INTO `teacher` VALUES ('010132', '唐伦', '男', '8', '12', '副教授', '010132');
INSERT INTO `teacher` VALUES ('010134', '刘占军', '男', '8', '10', '副教授', '010134');
INSERT INTO `teacher` VALUES ('010138', '郭晓金', '男', '8', '10', '副教授', '010138');
INSERT INTO `teacher` VALUES ('010150', '周翊', '男', '8', '11', '教授', '010150');
INSERT INTO `teacher` VALUES ('010201', '张德民', '男', '8', '18', '教授', '010201');
INSERT INTO `teacher` VALUES ('010202', '龚璞', '男', '8', '12', '讲师', '010202');
INSERT INTO `teacher` VALUES ('010204', '何永洪', '男', '8', '12', '副教授', '010204');
INSERT INTO `teacher` VALUES ('010205', '申滨', '男', '8', '11', '教授', '010205');
INSERT INTO `teacher` VALUES ('010206', '代少升', '男', '8', '14', '教授', '010206');
INSERT INTO `teacher` VALUES ('010207', '蒋青', '女', '8', '12', '教授', '010207');
INSERT INTO `teacher` VALUES ('010208', '陈善学', '男', '8', '12', '教授', '010208');
INSERT INTO `teacher` VALUES ('010209', '夏绪玖', '男', '8', '14', '讲师', '010209');
INSERT INTO `teacher` VALUES ('010210', '刘焕淋', '女', '8', '11', '教授', '010210');
INSERT INTO `teacher` VALUES ('010211', '朱联祥', '男', '8', '12', '教授', '010211');
INSERT INTO `teacher` VALUES ('010213', '张祖凡', '男', '8', '11', '教授', '010213');
INSERT INTO `teacher` VALUES ('010214', '宋伟峰', '男', '8', '12', '', '010214');
INSERT INTO `teacher` VALUES ('010215', '于秀兰', '女', '8', '12', '副教授', '010215');
INSERT INTO `teacher` VALUES ('010217', '陈前斌', '男', '8', '12', '教授', '010217');
INSERT INTO `teacher` VALUES ('010219', '李强', '男', '8', '11', '副教授', '010219');
INSERT INTO `teacher` VALUES ('010220', '鲍宁海', '男', '8', '10', '副教授', '010220');
INSERT INTO `teacher` VALUES ('010221', '严常青', '女', '8', '10', '副教授', '010221');
INSERT INTO `teacher` VALUES ('010224', '曹建玲', '女', '8', '11', '讲师', '010224');
INSERT INTO `teacher` VALUES ('010225', '庄陵', '男', '8', '11', '副教授', '010225');
INSERT INTO `teacher` VALUES ('010226', '杨茂斌', '男', '8', '11', '讲师', '010226');
INSERT INTO `teacher` VALUES ('010230', '杨丰瑞', '男', '8', '18', '教授', '010230');
INSERT INTO `teacher` VALUES ('010231', '郑建宏', '男', '8', '18', '教授', '010231');
INSERT INTO `teacher` VALUES ('010232', '申敏', '女', '8', '18', '教授', '010232');
INSERT INTO `teacher` VALUES ('010234', '张刚', '男', '8', '11', '副教授', '010234');
INSERT INTO `teacher` VALUES ('010237', '王永(通)', '男', '8', '12', '讲师', '010237');
INSERT INTO `teacher` VALUES ('010238', '张天骐', '男', '8', '10', '教授', '010238');
INSERT INTO `teacher` VALUES ('010239', '范馨月', '女', '8', '12', '讲师', '010239');
INSERT INTO `teacher` VALUES ('010240', '龙恳', '男', '8', '12', '讲师', '010240');
INSERT INTO `teacher` VALUES ('010241', '景小荣', '男', '8', '12', '副教授', '010241');
INSERT INTO `teacher` VALUES ('010242', '高陈强', '男', '8', '10', '副教授', '010242');
INSERT INTO `teacher` VALUES ('010243', '陈发堂', '男', '8', '11', '研究员', '010243');
INSERT INTO `teacher` VALUES ('010244', '邓炳光', '男', '8', '14', '讲师', '010244');
INSERT INTO `teacher` VALUES ('010246', '李国权', '男', '8', '11', '', '010246');
INSERT INTO `teacher` VALUES ('010247', '陈莉', '女', '8', '14', '', '010247');
INSERT INTO `teacher` VALUES ('010248', '王诗言', '女', '8', '12', '', '010248');
INSERT INTO `teacher` VALUES ('010250', '易琛', '男', '8', '11', '', '010250');
INSERT INTO `teacher` VALUES ('010303', '郑毅', '男', '8', '12', '副教授', '010303');
INSERT INTO `teacher` VALUES ('010304', '胡庆', '女', '8', '10', '教授', '010304');
INSERT INTO `teacher` VALUES ('010305', '张毅(通)', '男', '8', '14', '教授', '010305');
INSERT INTO `teacher` VALUES ('010307', '唐宏', '男', '8', '12', '教授', '010307');
INSERT INTO `teacher` VALUES ('010310', '杨晓波', '男', '8', '14', '讲师', '010310');
INSERT INTO `teacher` VALUES ('010311', '韦世红', '女', '8', '10', '副教授', '010311');
INSERT INTO `teacher` VALUES ('010312', '李云', '男', '8', '18', '教授', '010312');
INSERT INTO `teacher` VALUES ('010314', '李兆玉', '女', '8', '12', '副教授', '010314');
INSERT INTO `teacher` VALUES ('010319', '田增山', '男', '8', '12', '教授', '010319');
INSERT INTO `teacher` VALUES ('010321', '杨路', '女', '8', '14', '高级工程师', '010321');
INSERT INTO `teacher` VALUES ('010324', '任智', '男', '8', '10', '教授', '010324');
INSERT INTO `teacher` VALUES ('010333', '谭钦红', '男', '8', '14', '副教授', '010333');
INSERT INTO `teacher` VALUES ('010334', '何维', '男', '8', '14', '讲师', '010334');
INSERT INTO `teacher` VALUES ('010335', '吴大鹏', '男', '8', '10', '副教授', '010335');
INSERT INTO `teacher` VALUES ('010336', '朱江', '男', '8', '12', '副教授', '010336');
INSERT INTO `teacher` VALUES ('010337', '舒娜', '女', '8', '12', '讲师', '010337');
INSERT INTO `teacher` VALUES ('010338', '余翔2', '男', '8', '18', '正高级工程', '010338');
INSERT INTO `teacher` VALUES ('010339', '刘媛妮', '女', '8', '10', '讲师', '010339');
INSERT INTO `teacher` VALUES ('010340', '王毅', '男', '8', '12', '副教授', '010340');
INSERT INTO `teacher` VALUES ('010341', '赵辉', '女', '8', '11', '副教授', '010341');
INSERT INTO `teacher` VALUES ('010350', '黄俊(信息)', '男', '8', '10', '讲师', '010350');
INSERT INTO `teacher` VALUES ('010351', '罗文丰', '男', '8', '14', '助理研究员', '010351');
INSERT INTO `teacher` VALUES ('010352', '李小文', '男', '8', '10', '研究员', '010352');
INSERT INTO `teacher` VALUES ('010354', '刘宏清', '男', '8', '11', '教授', '010354');
INSERT INTO `teacher` VALUES ('010355', '史朝翔', '男', '8', '10', '教授', '010355');
INSERT INTO `teacher` VALUES ('010401', '陶洋', '男', '8', '10', '教授', '010401');
INSERT INTO `teacher` VALUES ('010402', '胡敏', '女', '8', '10', '副教授', '010402');
INSERT INTO `teacher` VALUES ('010403', '赵国锋', '男', '8', '11', '教授', '010403');
INSERT INTO `teacher` VALUES ('010405', '武俊', '女', '8', '14', '讲师', '010405');
INSERT INTO `teacher` VALUES ('010406', '刘科征', '男', '8', '14', '讲师', '010406');
INSERT INTO `teacher` VALUES ('010407', '梁燕', '女', '8', '14', '副教授', '010407');
INSERT INTO `teacher` VALUES ('010408', '鲜永菊', '女', '8', '10', '副教授', '010408');
INSERT INTO `teacher` VALUES ('010409', '谭歆', '男', '8', '10', '讲师', '010409');
INSERT INTO `teacher` VALUES ('010410', '姚玉坤', '女', '8', '10', '副教授', '010410');
INSERT INTO `teacher` VALUES ('010411', '黄宏程', '男', '8', '10', '讲师', '010411');
INSERT INTO `teacher` VALUES ('010412', '向劲松', '男', '8', '10', '副教授', '010412');
INSERT INTO `teacher` VALUES ('010413', '柴蓉', '女', '8', '12', '副教授', '010413');
INSERT INTO `teacher` VALUES ('010415', '张家波', '男', '8', '14', '讲师', '010415');
INSERT INTO `teacher` VALUES ('010417', '黄明华', '男', '8', '14', '', '010417');
INSERT INTO `teacher` VALUES ('010418', '李永刚', '男', '8', '12', '副教授', '010418');
INSERT INTO `teacher` VALUES ('010436', '张海波', '男', '8', '12', '', '010436');
INSERT INTO `teacher` VALUES ('010510', '黄晓舸', '女', '8', '12', '', '010510');
INSERT INTO `teacher` VALUES ('010512', '周牧', '男', '8', '12', '', '010512');
INSERT INTO `teacher` VALUES ('010513', '黎勇', '男', '8', '12', '', '010513');
INSERT INTO `teacher` VALUES ('010515', '曹傧', '男', '8', '12', '', '010515');
INSERT INTO `teacher` VALUES ('010710', '熊炫睿', '男', '8', '10', '', '010710');
INSERT INTO `teacher` VALUES ('011107', '裴二荣', '男', '8', '10', '讲师', '011107');
INSERT INTO `teacher` VALUES ('011112', '邵凯', '男', '8', '11', '副教授', '011112');
INSERT INTO `teacher` VALUES ('011118', '张学玲', '女', '8', '14', '', '011118');
INSERT INTO `teacher` VALUES ('011126', '刘乔寿', '男', '8', '14', '讲师', '011126');
INSERT INTO `teacher` VALUES ('011304', '吴坤君', '男', '8', '15', '高级工程师', '011304');
INSERT INTO `teacher` VALUES ('011305', '明艳', '女', '8', '14', '高级工程师', '011305');
INSERT INTO `teacher` VALUES ('011306', '雷宏江', '男', '8', '12', '讲师', '011306');
INSERT INTO `teacher` VALUES ('011308', '李玲霞', '女', '8', '14', '高级工程师', '011308');
INSERT INTO `teacher` VALUES ('011309', '刘鸿', '女', '8', '14', '讲师', '011309');
INSERT INTO `teacher` VALUES ('011312', '刘丁', '男', '8', '11', '助教', '011312');
INSERT INTO `teacher` VALUES ('011321', '张盛峰', '男', '8', '11', '讲师', '011321');
INSERT INTO `teacher` VALUES ('011406', '徐川', '男', '8', '10', '副教授', '011406');
INSERT INTO `teacher` VALUES ('011407', '李季碧', '女', '8', '14', '讲师', '011407');
INSERT INTO `teacher` VALUES ('011505', '黄胜', '男', '8', '11', '副教授', '011505');
INSERT INTO `teacher` VALUES ('011506', '周非', '男', '8', '10', '副教授', '011506');
INSERT INTO `teacher` VALUES ('011704', '雒江涛', '男', '8', '16', '教授', '011704');
INSERT INTO `teacher` VALUES ('011705', '邱绍峰', '男', '8', '12', '副教授', '011705');
INSERT INTO `teacher` VALUES ('011706', '黄俊', '男', '8', '14', '教授', '011706');
INSERT INTO `teacher` VALUES ('019901', '王丹', '女', '8', '10', '工程师', '019901');
INSERT INTO `teacher` VALUES ('019903', '陈英', '女', '8', '15', '', '019903');
INSERT INTO `teacher` VALUES ('019904', '郑翰英', '女', '8', '15', '工程师', '019904');
INSERT INTO `teacher` VALUES ('019905', '尧宗英', '女', '8', '15', '高级工程师', '019905');
INSERT INTO `teacher` VALUES ('019906', '陈培然', '男', '8', '15', '讲师', '019906');
INSERT INTO `teacher` VALUES ('019907', '黄悦', '女', '8', '13', '副教授', '019907');
INSERT INTO `teacher` VALUES ('019908', '张笃信', '男', '8', '15', '讲师', '019908');
INSERT INTO `teacher` VALUES ('019916', '蒋莹', '女', '8', '13', '讲师', '019916');
INSERT INTO `teacher` VALUES ('019917', '腾欢', '女', '8', '15', '讲师', '019917');
INSERT INTO `teacher` VALUES ('019924', '周晓霞', '女', '8', '13', '讲师', '019924');
INSERT INTO `teacher` VALUES ('019930', '赵春风', '男', '8', '18', '讲师', '019930');
INSERT INTO `teacher` VALUES ('019931', '周春霞', '女', '8', '13', '讲师', '019931');
INSERT INTO `teacher` VALUES ('019932', '王娟', '女', '8', '15', '讲师', '019932');
INSERT INTO `teacher` VALUES ('019935', '杨奇凡', '男', '8', '15', '讲师', '019935');
INSERT INTO `teacher` VALUES ('019936', '陈文星', '男', '8', '13', '讲师', '019936');
INSERT INTO `teacher` VALUES ('019937', '陈登新', '男', '8', '15', '高级工程师', '019937');
INSERT INTO `teacher` VALUES ('019938', '袁泉', '男', '8', '13', '助教', '019938');
INSERT INTO `teacher` VALUES ('019939', '张勤', '女', '8', '13', '讲师', '019939');
INSERT INTO `teacher` VALUES ('019940', '阎英', '女', '8', '15', '副教授', '019940');
INSERT INTO `teacher` VALUES ('019941', '席珍', '女', '8', '15', '', '019941');
INSERT INTO `teacher` VALUES ('019942', '王老师', '男', '8', '10', '高级工程师', '019942');
INSERT INTO `teacher` VALUES ('019943', '刘畅', '女', '8', '13', '助教', '019943');
INSERT INTO `teacher` VALUES ('019990', '赵卫峰', '男', '8', '16', '工程师', '019990');
INSERT INTO `teacher` VALUES ('029903', '李秋俊', '女', '8', '12', '教授', '029903');
INSERT INTO `teacher` VALUES ('039910', '张挺', '男', '8', '15', '讲师', '039910');
INSERT INTO `teacher` VALUES ('040207', '王英', '女', '8', '15', '副教授', '040207');
INSERT INTO `teacher` VALUES ('051105', '陈昌川', '男', '8', '15', '讲师', '051105');
INSERT INTO `teacher` VALUES ('310101', '戴翠琴', '女', '8', '12', '副教授', '310101');
INSERT INTO `teacher` VALUES ('310103', '蔡丽', '女', '8', '15', '助理研究员', '310103');
INSERT INTO `teacher` VALUES ('310123', '徐文云', '男', '8', '14', '副教授', '310123');
INSERT INTO `teacher` VALUES ('310129', '刘小莉', '女', '8', '14', '讲师', '310129');
INSERT INTO `teacher` VALUES ('310143', '廖述平', '男', '8', '13', '讲师', '310143');
INSERT INTO `teacher` VALUES ('310145', '杨英', '女', '8', '13', '讲师', '310145');
INSERT INTO `teacher` VALUES ('310146', '雷维嘉', '男', '8', '12', '教授', '310146');
INSERT INTO `teacher` VALUES ('310152', '王俊', '男', '8', '14', '高级工程师', '310152');
INSERT INTO `teacher` VALUES ('310156', '包杰', '男', '8', '11', '教授', '310156');
INSERT INTO `teacher` VALUES ('310157', '余翔', '男', '8', '10', '副教授', '310157');
INSERT INTO `teacher` VALUES ('310159', '刘楚川', '男', '8', '14', '助教', '310159');
INSERT INTO `teacher` VALUES ('310163', '漆晶', '男', '8', '14', '讲师', '310163');
INSERT INTO `teacher` VALUES ('310168', '刘裔', '女', '8', '13', '助教', '310168');
INSERT INTO `teacher` VALUES ('340802', '唐红', '女', '8', '10', '教授', '340802');

-- ----------------------------
-- Table structure for `tea_class`
-- ----------------------------
DROP TABLE IF EXISTS `tea_class`;
CREATE TABLE `tea_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `classnumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tea_number` int(11) DEFAULT NULL,
  `jiaoxueban` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tea_class
-- ----------------------------
INSERT INTO `tea_class` VALUES ('410', '010388通信软件基础', '限选', '班级：01914 | 01,02', '通信工程专业卓越工程师班', '19942', 'A011518756759');
INSERT INTO `tea_class` VALUES ('411', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('412', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('413', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('414', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('415', '010243可编程逻辑器件设计', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SK011517146609');
INSERT INTO `tea_class` VALUES ('416', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('417', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('418', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('419', '010393通信软件基础实训(1)', '实验实践', '班级：01014 | 10', '通信与信息类', '19942', 'SJ1511017');
INSERT INTO `tea_class` VALUES ('420', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('421', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('422', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('423', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('424', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('425', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('426', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('427', '010394通信软件基础实训(2)', '实验实践', '班级：01913 | 03', '通信学院IT精英班', '19942', 'SJ1511024');
INSERT INTO `tea_class` VALUES ('428', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('429', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('430', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('431', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('432', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('433', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('434', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('435', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('436', '010398IT类软件工程基础实训(3)', '实验实践', '班级：01913 | 01,02', '通信工程专业卓越工程师班', '19942', 'SJ1511092');
INSERT INTO `tea_class` VALUES ('437', '010388通信软件基础', '限选', '班级：01914 | 01,02', '通信工程专业卓越工程师班', '19942', 'A011518756759');
INSERT INTO `tea_class` VALUES ('438', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('439', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('440', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('441', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('442', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('443', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('444', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('445', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('446', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('447', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('448', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('449', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('450', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('451', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('452', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('453', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('454', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 01', '通信工程专业卓越工程师班', '19942', 'SJ1511090');
INSERT INTO `tea_class` VALUES ('455', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('456', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('457', '010395IT类软件工程基础实训(1)', '实验实践', '班级：01914 | 02', '通信工程专业卓越工程师班', '19942', 'SJ1511091');
INSERT INTO `tea_class` VALUES ('458', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('459', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');
INSERT INTO `tea_class` VALUES ('460', '010610通信软件开发应用实训1', '实验实践', '班级：01413 | 01', '信息工程', '19942', 'SJ151990');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_content` varchar(30) DEFAULT NULL COMMENT '题目内容',
  `topic_deadline` char(20) DEFAULT NULL COMMENT '截止时间',
  `topic_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '题目编号',
  `topic_releasetime` char(20) DEFAULT NULL COMMENT '发布时间',
  `topic_fullmark` int(3) DEFAULT NULL COMMENT '满分',
  `topic_proportion` int(3) DEFAULT NULL COMMENT '性质',
  `topic_submission_method` varchar(20) DEFAULT NULL COMMENT '提交方式',
  `topic_times` varchar(12) NOT NULL COMMENT '第几次作业',
  `topic_tclass_no` varchar(12) NOT NULL COMMENT '教学班号',
  `topic_conservation` tinyint(1) DEFAULT NULL,
  `topic_type` varchar(10) NOT NULL,
  PRIMARY KEY (`topic_no`,`topic_times`,`topic_type`,`topic_tclass_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('作业111111', '2013', '1125', '2011', '100', '50', '纸质', '第一次', 'A011518756', '0', '作业');
INSERT INTO `topic` VALUES ('期末考试了', '2013', '1127', '2015', '100', '50', '纸质', '第一次', 'A011518756', '0', '期末考试');
INSERT INTO `topic` VALUES ('作业1', '2016', '1129', '2015', '100', '50', '网上', '第二次', 'A011518756', '0', '作业');

-- ----------------------------
-- View structure for `v_assess`
-- ----------------------------
DROP VIEW IF EXISTS `v_assess`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_assess` AS select `tclass`.`Tclass_no` AS `Tclass_no`,`tclass`.`Tclass_class_no` AS `Tclass_class_no`,`tclass`.`Tclass_specialty` AS `Tclass_specialty`,`tclass`.`tclass_assess_no` AS `tclass_assess_no`,`dd`.`DD_Cexplain_name` AS `DD_Cexplain_name`,`cexplain`.`Cexplain_time` AS `Cexplain_time`,`cexplain`.`Cexplain_explain` AS `Cexplain_explain`,`cexplain`.`Cexplain_proportion` AS `Cexplain_proportion`,`assess`.`assess_explain` AS `assess_explain`,`dd`.`DD_no` AS `DD_no`,`cexplain`.`Cexplain_no` AS `Cexplain_no`,`sconstitue`.`Sconstitue_properties` AS `Sconstitue_properties`,`assess`.`assess_Course_no` AS `assess_Course_no` from ((((`assess` join `cexplain`) join `tclass`) join `dd`) join `sconstitue`) where ((`tclass`.`tclass_assess_no` = `assess`.`assess_no`) and (`assess`.`assess_no` = `cexplain`.`Cexplain_assess_no`) and (`cexplain`.`Cexplain_dd_no` = `dd`.`DD_no`) and (`cexplain`.`Cexplain_no` = `sconstitue`.`sconstitue_cexplain_no`)) ;

-- ----------------------------
-- View structure for `v_cgroup`
-- ----------------------------
DROP VIEW IF EXISTS `v_cgroup`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cgroup` AS select `cgroup`.`Cgroup_no` AS `Cgroup_no`,`cgroup`.`Cgroup_name` AS `Cgroup_name`,`teacher`.`teacher_ID` AS `teacher_ID`,`teacher`.`teacher_name` AS `teacher_name`,`cgroup`.`Cgroup_explain` AS `Cgroup_explain` from (`teacher` join `cgroup`) where (`teacher`.`teacher_ID` = `cgroup`.`cgroup_teacher_no`) ;

-- ----------------------------
-- View structure for `v_execute`
-- ----------------------------
DROP VIEW IF EXISTS `v_execute`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_execute` AS select `tclass`.`Tclass_no` AS `Tclass_no`,`cexplain`.`Cexplain_proportion` AS `Cexplain_proportion`,`cexplain`.`Cexplain_time` AS `Cexplain_time`,`dd`.`DD_Cexplain_name` AS `DD_Cexplain_name`,`sconstitue`.`Sconstitue_properties` AS `Sconstitue_properties`,`cexplain`.`Cexplain_no` AS `Cexplain_no` from ((((`tclass` join `assess`) join `cexplain`) join `dd`) join `sconstitue`) where ((`tclass`.`tclass_assess_no` = `assess`.`assess_no`) and (`assess`.`assess_no` = `cexplain`.`Cexplain_assess_no`) and (`cexplain`.`Cexplain_dd_no` = `dd`.`DD_no`) and (`cexplain`.`Cexplain_no` = `sconstitue`.`sconstitue_cexplain_no`)) ;

-- ----------------------------
-- View structure for `v_finalgrades`
-- ----------------------------
DROP VIEW IF EXISTS `v_finalgrades`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_finalgrades` AS select `student`.`student_name` AS `student_name`,`student`.`student_ID` AS `student_ID`,`finalgrades`.`Tclass_no` AS `Tclass_no`,`finalgrades`.`finalGrades` AS `finalGrades`,`tclass`.`Tclass_class_no` AS `Tclass_class_no`,`tclass`.`Tclass_specialty` AS `Tclass_specialty`,`assess`.`assess_explain` AS `assess_explain` from (((`student` join `finalgrades`) join `tclass`) join `assess`) where ((`student`.`student_ID` = `finalgrades`.`student_ID`) and (`finalgrades`.`Tclass_no` = `tclass`.`Tclass_no`) and (`tclass`.`tclass_assess_no` = `assess`.`assess_no`)) ;

-- ----------------------------
-- View structure for `v_homework`
-- ----------------------------
DROP VIEW IF EXISTS `v_homework`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_homework` AS select `topic`.`topic_deadline` AS `topic_deadline`,`topic`.`topic_releasetime` AS `topic_releasetime`,`topic`.`topic_fullmark` AS `topic_fullmark`,`topic`.`topic_proportion` AS `topic_proportion`,`topic`.`topic_submission_method` AS `topic_submission_method`,`tclass`.`Tclass_no` AS `Tclass_no`,`course`.`Cname` AS `Cname`,`topic`.`topic_times` AS `topic_times`,`topic`.`topic_no` AS `topic_no`,`topic`.`topic_content` AS `topic_content` from ((((((`topic` join `stopic`) join `sconstitue`) join `cexplain`) join `assess`) join `tclass`) join `course`) where ((`topic`.`topic_no` = `stopic`.`stopic_topic_no`) and (`stopic`.`Stopic_sconstitue_no` = `sconstitue`.`Sconstitue_no`) and (`sconstitue`.`sconstitue_cexplain_no` = `cexplain`.`Cexplain_no`) and (`cexplain`.`Cexplain_assess_no` = `assess`.`assess_no`) and (`assess`.`assess_no` = `tclass`.`tclass_assess_no`) and (`tclass`.`tclass_course_no` = convert(`course`.`Cno` using utf8))) ;

-- ----------------------------
-- View structure for `v_homework1`
-- ----------------------------
DROP VIEW IF EXISTS `v_homework1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_homework1` AS select `topic`.`topic_content` AS `topic_content`,`topic`.`topic_deadline` AS `topic_deadline`,`topic`.`topic_releasetime` AS `topic_releasetime`,`topic`.`topic_submission_method` AS `topic_submission_method`,`topic`.`topic_proportion` AS `topic_proportion`,`topic`.`topic_times` AS `topic_times`,`topic`.`topic_fullmark` AS `topic_fullmark`,`course`.`Cname` AS `Cname`,`topic`.`topic_no` AS `topic_no`,`tclass`.`Tclass_no` AS `Tclass_no`,`topic`.`topic_type` AS `topic_type` from ((`topic` join `tclass`) join `course`) where ((`topic`.`topic_tclass_no` = `tclass`.`Tclass_no`) and (`tclass`.`tclass_course_no` = convert(`course`.`Cno` using utf8))) ;

-- ----------------------------
-- View structure for `v_result`
-- ----------------------------
DROP VIEW IF EXISTS `v_result`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_result` AS select `judge`.`judge_grades` AS `judge_grades`,`student`.`student_name` AS `student_name`,`course`.`Cname` AS `Cname`,`topic`.`topic_no` AS `topic_no`,`student`.`student_ID` AS `student_ID`,`ref_tclass_student`.`ref_T_S_Tclass_no` AS `ref_T_S_Tclass_no`,`judge`.`judge_submit` AS `judge_submit`,`topic`.`topic_type` AS `topic_type`,`topic`.`topic_times` AS `topic_times` from (((((`judge` join `student`) join `course`) join `topic`) join `ref_tclass_student`) join `tclass`) where ((`judge`.`judge_ID` = convert(`ref_tclass_student`.`ref_T_S_student_ID` using utf8)) and (convert(`ref_tclass_student`.`ref_T_S_student_ID` using utf8) = `student`.`student_ID`) and (`ref_tclass_student`.`ref_T_S_Tclass_no` = `tclass`.`Tclass_no`) and (`tclass`.`tclass_course_no` = convert(`course`.`Cno` using utf8)) and (`judge`.`topic_topic_no` = `topic`.`topic_no`) and (`tclass`.`Tclass_no` = `topic`.`topic_tclass_no`)) ;

-- ----------------------------
-- View structure for `v_stugrades`
-- ----------------------------
DROP VIEW IF EXISTS `v_stugrades`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stugrades` AS select `judge`.`judge_ID` AS `judge_ID`,`judge`.`judge_grades` AS `judge_grades`,`student`.`student_name` AS `student_name`,`tclass`.`Tclass_no` AS `Tclass_no`,`course`.`Cname` AS `Cname`,`topic`.`topic_no` AS `topic_no` from (((((`judge` join `student`) join `tclass`) join `course`) join `topic`) join `stopic`) where ((`judge`.`judge_ID` = `student`.`student_ID`) and (convert(`student`.`student_class_no` using utf8) = `tclass`.`Tclass_class_no`) and (`tclass`.`Tclass_class_no` = convert(`course`.`Cno` using utf8)) and (`judge`.`judge_jgroup_no` = convert(`stopic`.`Stopic_jgroup_no` using utf8)) and (`topic`.`topic_no` = convert(`stopic`.`stopic_topic_no` using utf8))) ;

-- ----------------------------
-- View structure for `v_tclass`
-- ----------------------------
DROP VIEW IF EXISTS `v_tclass`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tclass` AS select `tclass`.`Tclass_no` AS `Tclass_no`,`ref_tclass_student`.`ref_T_S_student_ID` AS `ref_T_S_student_ID`,`student`.`student_name` AS `student_name`,`course`.`Cname` AS `Cname` from (((`ref_tclass_student` join `student`) join `tclass`) join `course`) where ((`tclass`.`Tclass_no` = `ref_tclass_student`.`ref_T_S_Tclass_no`) and (convert(`ref_tclass_student`.`ref_T_S_student_ID` using utf8) = `student`.`student_ID`) and (convert(`course`.`Cno` using utf8) = `tclass`.`tclass_course_no`)) ;

-- ----------------------------
-- View structure for `v_tclass_student`
-- ----------------------------
DROP VIEW IF EXISTS `v_tclass_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tclass_student` AS select `ref_tclass_student`.`ref_T_S_student_ID` AS `ref_T_S_student_ID`,`student`.`student_name` AS `student_name`,`course`.`Cname` AS `Cname`,`tclass`.`Tclass_no` AS `Tclass_no`,`teacher`.`teacher_name` AS `teacher_name`,`tclass`.`Tclass_class_no` AS `Tclass_class_no`,`tclass`.`tclass_assess_no` AS `tclass_assess_no` from ((((`tclass` join `teacher`) join `course`) join `ref_tclass_student`) join `student`) where ((`tclass`.`tclass_teacher_ID` = convert(`teacher`.`teacher_ID` using utf8)) and (`tclass`.`tclass_course_no` = convert(`course`.`Cno` using utf8)) and (convert(`ref_tclass_student`.`ref_T_S_student_ID` using utf8) = `student`.`student_ID`) and (`tclass`.`Tclass_no` = `ref_tclass_student`.`ref_T_S_Tclass_no`)) ;

-- ----------------------------
-- View structure for `v_tclass_teacher`
-- ----------------------------
DROP VIEW IF EXISTS `v_tclass_teacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tclass_teacher` AS select `tclass`.`Tclass_no` AS `Tclass_no`,`tclass`.`tclass_assess_no` AS `tclass_assess_no`,`teacher`.`teacher_ID` AS `teacher_ID`,`teacher`.`teacher_name` AS `teacher_name`,`course`.`Cname` AS `Cname`,`tclass`.`Tclass_specialty` AS `Tclass_specialty`,`tclass`.`Tclass_class_no` AS `Tclass_class_no`,`cgroup`.`Cgroup_name` AS `Cgroup_name`,`teacher`.`teacher_sex` AS `teacher_sex`,`teacher`.`teacher_position` AS `teacher_position`,`dd`.`DD_Cexplain_name` AS `DD_Cexplain_name`,`tclass`.`tclass_course_no` AS `tclass_course_no` from ((((`tclass` join `teacher`) join `course`) join `cgroup`) join `dd`) where ((`tclass`.`tclass_teacher_ID` = convert(`teacher`.`teacher_ID` using utf8)) and (`tclass`.`tclass_course_no` = convert(`course`.`Cno` using utf8)) and (`course`.`Course_Cgroup_no` = `cgroup`.`Cgroup_no`) and (`teacher`.`teacher_school` = `dd`.`DD_no`)) ;
