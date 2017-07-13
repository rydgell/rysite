/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50142
Source Host           : localhost:3306
Source Database       : rysite

Target Server Type    : MYSQL
Target Server Version : 50142
File Encoding         : 65001

Date: 2017-07-13 11:48:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('01606d80c5bc40719b6e331a820c2cdd', 'sadsadsadsad', 'dasdasd', 'sadsad', 'dsada', '333', '0', '1', '2017-03-30 17:11:59', '1', '2017-03-30 17:11:59', '', '1');
INSERT INTO `sys_dict` VALUES ('02af091df045447bbb2f72c22e88dac1', 'sad', 'dsad', 'dasd', 'dsad', '33', '0', '1', '2017-03-30 14:44:50', '1', '2017-03-30 14:44:50', '', '1');
INSERT INTO `sys_dict` VALUES ('04047b9cb3c14b36acdb88559392abe2', 'dasdsaddsffdsasd', 'asdasd', 'asdsd', 'sadsad', '2323', '0', '1', '2017-03-30 16:33:27', '1', '2017-03-30 16:33:27', '', '1');
INSERT INTO `sys_dict` VALUES ('0e52126abe6c4883a7044a99be2e0144', 'dsad', 'sadsa', 'dsad', 'asdasd', '33', '0', '1', '2017-03-30 11:38:26', '1', '2017-03-30 11:38:26', 'adas', '1');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型\0\0', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.xxx.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型\0\0', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.xxx.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型\0\0', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.xxx.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型\0\0', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('10375469269747acaf46e3f17f938adb', 'cccccc', 'cc', 'cc', 'ccccc', '23', '0', '1', '2017-03-30 14:45:56', '1', '2017-03-30 14:45:56', '', '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型\0\0', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('1254b23c82294951b811f7de828641d9', 'dasdasdfdsf', 'f', 'dsfsdf', 'dsfsd', '22', '0', '1', '2017-03-30 16:27:12', '1', '2017-03-30 16:27:12', '', '1');
INSERT INTO `sys_dict` VALUES ('12dfecaed74e4221b34246e8ab885bc9', 'dd', 'dsad', 'ddd', 'ddd', '32', '0', '1', '2017-03-30 15:41:57', '1', '2017-03-30 15:41:57', '', '1');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('1af7e3da7cba45bea0779fdb8144f916', 'cccccxxx', 'xxxx', 'xxxxxx', 'xxx', '43', '0', '1', '2017-03-31 15:50:53', '1', '2017-03-31 15:50:53', '', '1');
INSERT INTO `sys_dict` VALUES ('1be9d35777c84b74b44d86a4a09b343d', 'cxzczx', 'cxzc', 'zxczxc', 'czx', '233', '0', '1', '2017-03-31 15:17:26', '1', '2017-03-31 15:17:26', '', '1');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('217b50607ae14fe4a3886ab671252e8b', 'asdsad', 'fdsfdsf', '34324', '324', '213', '0', '1', '2017-03-30 17:05:09', '1', '2017-03-30 17:05:09', '', '1');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('2365fc0389a347729d93fb5cd0c788fa', 'sadsa', 'dsadsa', 'asdas', 'asdas', '998', '0', '1', '2017-03-30 15:09:57', '1', '2017-03-30 15:09:57', 'dsad', '1');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('2413dbc083df45849ed0b099927908e6', 'sadsad', 'asdsad', 'sadasd', 'asdaad', '3', '0', '1', '2017-03-30 16:11:44', '1', '2017-03-30 16:11:44', '', '1');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('26b2d8dadc0948719897a6fd34fb1bcb', 'vvvvvvvv', 'vvvv', 'vv', 'dsadas', '223', '0', '1', '2017-03-30 16:16:28', '1', '2017-03-30 16:16:28', '', '1');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('27abce437ed94977b3d143dc5b945f6b', 'xxxxxx', 'xx', 'xxxx', 'x', '33', '0', '1', '2017-03-30 11:37:03', '1', '2017-03-30 11:37:03', '32323', '1');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('2dd0b076fb914423bc84612610203c43', 'fff', 'fffffffffffffffff', 'ff', 'ff', '32', '0', '1', '2017-03-30 15:41:00', '1', '2017-03-30 15:41:00', '', '1');
INSERT INTO `sys_dict` VALUES ('2e2283f5c4d84f2db8638c8417410a91', 'xxxxxxxxxxx', 'xxxxxx', 'xxxxxx', 'xxxxxxx', '3', '0', '1', '2017-03-30 15:43:16', '1', '2017-03-30 15:43:16', '', '1');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('329024ebf6c64913b24fe174027c5541', 'sdas', 'asd', 'sad', 'sad', '23', '0', '1', '2017-03-31 15:50:10', '1', '2017-03-31 15:50:10', '', '1');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('381b81c637d346b7af21a351ffd47d11', 'gggg', 'gggg', 'ggg', 'gg', '22', '0', '1', '2017-04-07 14:31:15', '1', '2017-04-07 14:31:15', '', '1');
INSERT INTO `sys_dict` VALUES ('389b600c7ab74e9ca343bb6ce1ffdbcc', 'dasdsaddsffds', 'fdsfsd', 'sdfsdf', 'dsfsdf', '232', '0', '1', '2017-03-30 16:29:40', '1', '2017-03-30 16:29:40', '', '1');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('406d50f7015a4a06a8a5c577c2e1876e', 'sadsa1111111fdf', 'das', 'asdas', 'dasd', '333', '0', '1', '2017-03-30 16:19:09', '1', '2017-03-30 16:19:09', '', '1');
INSERT INTO `sys_dict` VALUES ('40c76e1c72cf43029114502ed62a7496', 'k', 'kkkkk', 'kk', 'kk', '3', '0', '1', '2017-03-30 16:26:18', '1', '2017-03-30 16:26:18', '', '1');
INSERT INTO `sys_dict` VALUES ('40fb98f198cd4b2796802ad2b9baf06d', 'sadas', 'asdasdas', 'asdas', 'asdasd', '211', '0', '1', '2017-06-20 15:44:09', '1', '2017-06-20 15:44:09', '', '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('422a224089c84b729d9ceae274c07422', 'xx', 'xx', 'xx', 'xx', '1', '0', '1', '2017-06-20 15:43:59', '1', '2017-06-20 15:43:59', '', '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('454a5e14a6f84367a0a857c419fec1cf', 'sadaddf', 'dsadsf', 'sdfdsfsd', 'dsad', '32', '0', '1', '2017-03-31 15:57:33', '1', '2017-03-31 15:57:33', '', '1');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('4755fc3ae1e448bb86cfcaadffd61db2', 'vvvvvv', 'vvvvvvvvvvvvv', 'v', 'vvvvvvvvvvv', '3', '0', '1', '2017-03-30 15:54:47', '1', '2017-03-30 15:54:47', '', '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('518478d1edc240e3b32d84e549fd7f1d', 'xxxxxxxxxxxx1', 'xxxxxxxxxxxx1', 'xxxxxxxxxxxx1', 'xxxxxxxxxxxx1', '11', '0', '1', '2017-04-07 16:14:50', '1', '2017-04-07 16:14:50', '', '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5997ba0ec406497e8125a8074b31f560', 'fsdf', 'fdsf', 'sdf', 'fdf', '321', '0', '1', '2017-03-30 16:05:13', '1', '2017-03-30 16:05:13', '', '1');
INSERT INTO `sys_dict` VALUES ('59f1bd606c2341ec813941b7d3a6c2f2', 'n', 'nn', 'nn', 'nn', '32', '0', '1', '2017-03-30 15:50:12', '1', '2017-03-30 15:50:12', '', '1');
INSERT INTO `sys_dict` VALUES ('5dc1aa29ebbd450bac975fbe314dc091', 'dsadasfdfc', 'asdasd', 'asd', 'sad', '2', '0', '1', '2017-03-30 16:26:48', '1', '2017-03-30 16:26:48', '', '1');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('61010fcb45ed4c74bdbb0ec4ee130361', 'fff', 'ffffffffffffffff', 'fffff', 'ffffffffffffff', '2', '0', '1', '2017-03-31 15:23:46', '1', '2017-03-31 15:23:46', '', '1');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('649006933c6441e68f7dfb78b42bfb41', 'tst', 'dasdsad', 'dsadsa', 'sadasd', '333', '0', '1', '2017-03-30 17:09:33', '1', '2017-03-30 17:09:33', '', '1');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('729e58eb452142acb7d9beca0acd96e9', 'asdasdcxx', 'asd', 'sdasdas', 'asd', '12', '0', '1', '2017-03-31 15:09:22', '1', '2017-03-31 15:09:22', '', '1');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('7412513642b24af8936355f4c600a873', 'dasdasdfdsf', 'asdas', 'ada', 'adasd', '211', '0', '1', '2017-06-20 15:44:36', '1', '2017-06-20 15:44:36', '', '0');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('755e207d51954804b78aa435f5897838', 'xcxcc', 'xzcxzc', 'cxzcxz', 'cxzczx', '43', '0', '1', '2017-03-30 17:16:10', '1', '2017-03-30 17:16:10', '', '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('764e9e52108c4a0bb4fbc09a56551611', 'bbbbb', 'bb', 'bbbb', 'b', '122', '0', '1', '2017-03-30 16:24:55', '1', '2017-03-30 16:24:55', '', '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('7893fe9af444419db76836af90d625a9', 'sadsadfdfd', 'dasd', 'sadasd', 'asdsad', '2', '0', '1', '2017-03-30 16:20:42', '1', '2017-03-30 16:20:42', '', '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('7f53cf9940d54a718b0868a840b02eef', '阿达', 'sd', '大叔sad', '', '23', '0', '1', '2017-03-31 11:37:35', '1', '2017-03-31 11:37:35', 'dsa', '1');
INSERT INTO `sys_dict` VALUES ('7f82eb50de434a878028af31deddcb4f', 'asd', 'asd', 'dasd', 'asd', '32', '0', '1', '2017-03-31 15:01:50', '1', '2017-03-31 15:01:50', '', '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('80a2f681ee9341e88316e8a5dc258e04', 'asdasdcxx', 'asda', 'x', 'x', '111', '0', '1', '2017-03-31 15:02:10', '1', '2017-03-31 15:02:10', '', '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('857ecbfeb8a6467e9d6b321dfa20d263', 'ccccc', 'ccccc', 'cccccc', 'dsadas', '23', '0', '1', '2017-03-30 16:25:16', '1', '2017-03-30 16:25:16', '', '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86d31f45eee646878a09208a26eb707e', 'cccvv', 'vvv', 'vv', 'vvv', '3', '0', '1', '2017-03-30 15:53:43', '1', '2017-03-30 15:53:43', '', '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8aa5aad529a74bd183eb4bc1e6ea1382', 'sadas', 'sadsa', 'asdas', 'asdasd', '23', '0', '1', '2017-03-30 16:09:00', '1', '2017-03-30 16:09:00', '', '1');
INSERT INTO `sys_dict` VALUES ('8f21142b2d1242d4a71d6969a893d2f1', 'hhh', 'hhhhhh', 'hhh', 'hh', '32', '0', '1', '2017-03-30 15:47:10', '1', '2017-03-30 15:47:10', '', '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '33', '0', '1', '2013-05-27 08:00:00', '1', '2017-03-31 16:14:13', 'xxxxxxxxx1111111', '1');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择\0', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('934e92a2856546ffa79896760b83ad13', 'asdasdasd', 'asdasd', 'fd', 'sada', '3', '0', '1', '2017-03-30 16:21:28', '1', '2017-03-30 16:21:28', '', '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型\0\0', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('a0f1d4fbe0ea4594a38845221a23ff35', 'ccccsadasd', 'dasd', 'sad', 'das', '10', '0', '1', '2017-03-30 16:08:39', '1', '2017-03-30 16:08:39', '', '1');
INSERT INTO `sys_dict` VALUES ('a1dbb669b9b44e8196de85a272adbbaa', 'sdsadfdsfdf', 'sadsad', 'asd', '3213', '2', '0', '1', '2017-03-30 16:23:33', '1', '2017-03-30 16:23:33', '', '1');
INSERT INTO `sys_dict` VALUES ('a93b0c24affc4bb6a8c6dfe955e1ea4a', 'asdas1111', 'sdfsdf', 'sdfsdf', 'dsfsdf', '232', '0', '1', '2017-03-30 16:30:32', '1', '2017-03-30 16:30:32', 'sad', '1');
INSERT INTO `sys_dict` VALUES ('acddba4b63b24354b3eba3be5ba60de1', 'dsadsad', 'asdas', 'dasdasd', 'asdaad', '43', '0', '1', '2017-03-30 16:21:07', '1', '2017-03-30 16:21:07', '', '1');
INSERT INTO `sys_dict` VALUES ('afc1caf2cdfb4fc891f2bc1bda52a860', 'asdad', 'asdasd', 'asdas', 'fdg', '3', '0', '1', '2017-06-20 15:44:17', '1', '2017-06-20 15:44:17', '', '0');
INSERT INTO `sys_dict` VALUES ('b285fcff1f9646b3a0fd25d1b0e6f671', 'asdasasdasd', 'dasdsad', 'sadsa', 'asdsad', '213', '0', '1', '2017-03-30 16:33:11', '1', '2017-03-30 16:33:11', '', '1');
INSERT INTO `sys_dict` VALUES ('bbdb1a495d1c4bca95a4914bacb73079', 'fdsfsdf', 'fgfdg', 'fgsa', 'd2321', '3', '0', '1', '2017-03-30 16:28:45', '1', '2017-03-30 16:28:45', '', '1');
INSERT INTO `sys_dict` VALUES ('be238169e99a4be6bebfa750bb8c502b', 'asdasdfgfg', 'sadfgfdg', 'fd', 'fdsf', '34', '0', '1', '2017-03-31 15:50:38', '1', '2017-03-31 15:50:38', '', '1');
INSERT INTO `sys_dict` VALUES ('c0e5248a6c434a699b978d38df3186f5', 'dsa', 'asd', 'asd', '34', '44', '0', '1', '2017-03-30 15:50:56', '1', '2017-03-30 15:50:56', '', '1');
INSERT INTO `sys_dict` VALUES ('c2e41f18dd704d30ad41f7dd847489e0', 'lkjlkj', 'dsadsa', 'dasdasd', '3232', '32', '0', '1', '2017-03-30 16:29:10', '1', '2017-03-30 16:29:10', '', '1');
INSERT INTO `sys_dict` VALUES ('c2f6f28a887e4f7b88c472b33068e061', 'xxxxxxxooo', 'xxoo', 'dsadsa', 'sadsad', '33', '0', '1', '2017-03-30 17:15:43', '1', '2017-03-30 17:15:43', '', '1');
INSERT INTO `sys_dict` VALUES ('c99fe398df864729a4d2f5610b55697d', 'xxx22', 'xxx22', 'xxx22', 'xxx22', '3', '0', '1', '2017-04-07 16:15:14', '1', '2017-04-07 16:15:14', '', '1');
INSERT INTO `sys_dict` VALUES ('da8d55b98ebb4b8f9e65e750efe1ca1f', 'sadasd', 'dsfdsf', 'fasdsa', '213', '23', '0', '1', '2017-03-30 16:31:12', '1', '2017-03-30 16:31:12', '', '1');
INSERT INTO `sys_dict` VALUES ('de06b2d6322b41168b4df6f0b5c37ba4', 'gfdgd', 'sfsadas', '32432', '34', '23', '0', '1', '2017-03-30 17:05:40', '1', '2017-03-30 17:05:40', '', '1');
INSERT INTO `sys_dict` VALUES ('dfaac906f5c64715a51c9224651d1d0e', 'test', 'test', 'test', 'test123213', '123', '0', '1', '2017-04-07 13:12:13', '1', '2017-04-07 13:12:13', '', '1');
INSERT INTO `sys_dict` VALUES ('ea720c19cfb84c4c97e0ac916b7c7dd6', 'dasdsad', 'sdfdsfdsf', 'sadasd', 'sadsad', '324', '0', '1', '2017-03-30 16:27:59', '1', '2017-03-30 16:27:59', '', '1');
INSERT INTO `sys_dict` VALUES ('eb70c935afbe440185f4227f985576ec', 'sadasdfsdfdgfd', 'sadsad', 'sadasd', 'fds', '33', '0', '1', '2017-03-30 16:27:30', '1', '2017-03-30 16:27:30', '', '1');
INSERT INTO `sys_dict` VALUES ('ed89b09c3a51453db6ad1cc450b01c98', 'asdas11112', 'asd', '12312', 'dasdasdaf', '33', '0', '1', '2017-06-20 15:44:26', '1', '2017-06-20 15:44:26', '', '0');
INSERT INTO `sys_dict` VALUES ('f34c8ed2d97f4ff3b35f330ec2c9aa1e', 'asdsaddsfdsf', 'fdsfs', '321', 'asdas', '3', '0', '1', '2017-03-30 16:22:05', '1', '2017-03-30 16:22:05', '', '1');
INSERT INTO `sys_dict` VALUES ('f77fd9562393454da56be0d36b408c03', 'gggaa', 'gggaa', 'gggaa', 'gggaa', '22', '0', '1', '2017-04-07 16:17:51', '1', '2017-04-07 16:17:51', '', '1');
INSERT INTO `sys_dict` VALUES ('fe9c115c393c4a6e94e49597a279aa0e', 'dddddd', 'xxxxxxxx', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxx', '33', '0', '1', '2017-03-30 15:49:39', '1', '2017-03-30 15:49:39', '', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0c2a684568b74eefa4f36c39df86a7de', '1', '0,1,', 'test', '99', '/sys/test', null, null, '1', 'xxoo', '1', '2017-04-27 11:21:01', '1', '2017-04-27 11:21:01', 'xx', '1');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '2', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('1962c2da20404d938fffe9911a523f7f', '803df6728fb84ed3a00bfcae4efbabae', '0,1,2,803df6728fb84ed3a00bfcae4efbabae,', '修改', '2', '', null, null, '0', 'sys:office:edit', '1', '2017-05-02 17:01:58', '1', '2017-05-02 17:01:58', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '2', '', null, null, '1', '', '1', '2013-05-27 08:00:00', '1', '2017-05-04 14:56:14', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '2', '0,1,2,13,', '用户管理', '30', '/sys/user/', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24d0341b107e4033b56b81fb3a8ca7da', '1', '0,1,', 'sss', '33', '', null, null, '1', 'xxxxx', '1', '2017-04-27 11:21:28', '1', '2017-05-04 11:10:55', '', '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '个人中心', '1', '', null, null, '1', 'xxx', '1', '2013-05-27 08:00:00', '1', '2017-05-04 15:55:38', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '27', '0,1,', '个人信息', '30', '/sys/user/userinfo', null, 'user', '1', '', '1', '2013-05-27 08:00:00', '1', '2017-05-04 15:03:44', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '27', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('320136efc5b4492c9d8490b4c539b5be', '1', '0,1,', 'ggg', '33', 'ggg', null, null, '1', '22', '1', '2017-04-27 11:21:52', '1', '2017-04-27 11:21:52', '2', '1');
INSERT INTO `sys_menu` VALUES ('4', '2', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '2', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '2', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7139c716d0f24bb28a24e8691af28473', '1', '0,1,', '个人中心', '1', '', null, null, '1', '', '1', '2017-05-04 11:17:40', '1', '2017-05-04 11:18:17', '', '1');
INSERT INTO `sys_menu` VALUES ('73353744e1c245f0b002e9277a566a11', '7139c716d0f24bb28a24e8691af28473', '0,1,7139c716d0f24bb28a24e8691af28473,', '个人信息', '2', '', null, null, '1', '', '1', '2017-05-04 11:18:38', '1', '2017-05-04 11:18:38', '', '1');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('803df6728fb84ed3a00bfcae4efbabae', '2', '0,1,2,', '部门管理', '99', '/sys/office/', null, null, '1', '', '1', '2017-05-02 16:46:04', '1', '2017-05-02 16:46:24', '', '0');
INSERT INTO `sys_menu` VALUES ('84', '2', '0,1,2,67,', '连接池监视', '40', '/sys/druid/druidIndex', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8801fa28e88a44f49aa4ce74b2e5aacd', '24d0341b107e4033b56b81fb3a8ca7da', '0,1,24d0341b107e4033b56b81fb3a8ca7da,', 'xxxxxxss', '22', '/sys/test1', null, null, '1', 'sss', '1', '2017-04-28 11:11:10', '1', '2017-05-04 11:11:00', '', '1');
INSERT INTO `sys_menu` VALUES ('a87c2669def34b26ae60617e770b0574', '29', '0,1,27,28,29,', 'testxx', '222', 'xxx', null, null, '1', 'xxxxx', '1', '2017-04-27 16:28:41', '1', '2017-04-27 16:28:52', '', '1');
INSERT INTO `sys_menu` VALUES ('e95f6a5b4840415295ff7a81ec3f6c2b', '1', '0,1,', 'test', '9999', '/sys/test', null, null, '1', 'xxxxxx', '1', '2017-04-27 11:18:52', '1', '2017-04-27 11:18:52', 'xx', '1');
INSERT INTO `sys_menu` VALUES ('ed5842f2d7ea4d9d8029eaacb039d4c7', '803df6728fb84ed3a00bfcae4efbabae', '0,1,2,803df6728fb84ed3a00bfcae4efbabae,', '查看', '1', '', null, null, '0', 'sys:office:view', '1', '2017-05-02 17:01:22', '1', '2017-05-02 17:01:34', '', '0');
INSERT INTO `sys_menu` VALUES ('fa206901623749e9999d5b80ce73c992', '27', '0,1,27,', 'xxxx', '22', '', null, null, '1', 'xxx', '1', '2017-05-04 15:55:57', '1', '2017-05-04 15:55:57', '', '1');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '山东省总公司', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', 'xxxxx', '10', '100001', '2', '1', '2013-05-27 08:00:00', '1', '2017-05-03 16:29:17', '', '1');
INSERT INTO `sys_office` VALUES ('3', '综合部', '20', '100002', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '市场部', '30', '100003', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '技术部', '40', '100004', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '研发部', '50', '100005', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_office_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_office_copy`;
CREATE TABLE `sys_office_copy` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office_copy
-- ----------------------------
INSERT INTO `sys_office_copy` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office_copy` VALUES ('2', '1', '0,1,', 'xxxxx', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2017-05-03 16:29:17', '', '1');
INSERT INTO `sys_office_copy` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office_copy` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office_copy` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office_copy` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', null, '系统管理员', 'dept', 'security-role', '1', '0', '1', '1', '2013-05-27 08:00:00', '1', '2017-05-04 11:09:17', '', '0');
INSERT INTO `sys_role` VALUES ('2', null, '公司管理员', 'hr', 'security-role', '2', '0', '1', '1', '2013-05-27 08:00:00', '1', '2017-04-13 17:25:36', '', '0');
INSERT INTO `sys_role` VALUES ('3', null, '本公司管理员', 'a', 'security-role', '3', '0', '1', '1', '2013-05-27 08:00:00', '1', '2017-04-13 17:25:30', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', '0', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_role` VALUES ('41cfc5ee0fb34e1cac0247a24a385dd8', null, 'vxcvxcv', 'dsaswe', 'user', '8', '0', '1', '1', '2017-04-13 16:14:16', '1', '2017-04-13 16:14:16', '', '1');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', '0', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_role` VALUES ('6', null, '琼琼', 'cc', 'user', '8', '0', '1', '1', '2013-05-27 08:00:00', '1', '2017-04-14 10:24:47', '', '0');
INSERT INTO `sys_role` VALUES ('67', null, 'kkk', 'kk', 'user', '8', '0', '1', '1', '2017-04-13 16:19:19', '1', '2017-04-13 16:19:19', '', '1');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', '0', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_role` VALUES ('70448f78ed9e40dc8c521d0320414844', null, '哈哈哈', 'hhh', 'user', '8', '0', '1', '1', '2017-04-13 15:55:08', '1', '2017-04-18 15:58:24', '', '0');
INSERT INTO `sys_role` VALUES ('7b2ec80717354677a8033ccc1fc501b8', null, '测试', 'ces', 'user', '8', '0', '1', '1', '2017-04-13 16:19:19', '1', '2017-05-03 17:04:27', 'xxxxxx', '0');
INSERT INTO `sys_role` VALUES ('837dbf05f4bf4e1591ef897e891eb7e3', null, '发生的', 'dsadas', 'user', '8', null, '1', '1', '2017-04-13 15:04:23', '1', '2017-04-13 15:04:23', 'xxxxxxxx', '0');
INSERT INTO `sys_role` VALUES ('90847b6a68794163ae070581b480bb8f', null, 'vvvvv', 'ccc', 'user', '8', '0', '1', '1', '2017-04-13 16:12:48', '1', '2017-04-13 16:12:48', '', '1');
INSERT INTO `sys_role` VALUES ('a067fa8e797342428c3a2f65e43b0cd4', null, 'tesxxx', 'xxx', 'user', '8', '0', '1', '1', '2017-04-20 10:20:56', '1', '2017-04-20 10:20:56', '', '0');
INSERT INTO `sys_role` VALUES ('a0e0097b84454605aeb65e6abbc18d89', null, 'cccccccc', 'cccc', 'user', '8', '1', '1', '1', '2017-04-13 15:07:57', '1', '2017-04-13 15:07:57', 'cccc', '1');
INSERT INTO `sys_role` VALUES ('c81c9120fe584ea69e019c373274befe', null, 'xxxxxxx', 'xcccccccc', 'user', '8', '1', '1', '1', '2017-04-13 15:05:41', '1', '2017-04-14 10:24:04', 'ggg', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '24d0341b107e4033b56b81fb3a8ca7da');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '803df6728fb84ed3a00bfcae4efbabae');
INSERT INTO `sys_role_menu` VALUES ('1', '8801fa28e88a44f49aa4ce74b2e5aacd');
INSERT INTO `sys_role_menu` VALUES ('1', 'ed5842f2d7ea4d9d8029eaacb039d4c7');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('41cfc5ee0fb34e1cac0247a24a385dd8', '27');
INSERT INTO `sys_role_menu` VALUES ('41cfc5ee0fb34e1cac0247a24a385dd8', '29');
INSERT INTO `sys_role_menu` VALUES ('41cfc5ee0fb34e1cac0247a24a385dd8', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '19');
INSERT INTO `sys_role_menu` VALUES ('6', '2');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('67', '2');
INSERT INTO `sys_role_menu` VALUES ('67', '27');
INSERT INTO `sys_role_menu` VALUES ('67', '29');
INSERT INTO `sys_role_menu` VALUES ('67', '30');
INSERT INTO `sys_role_menu` VALUES ('70448f78ed9e40dc8c521d0320414844', '27');
INSERT INTO `sys_role_menu` VALUES ('70448f78ed9e40dc8c521d0320414844', '29');
INSERT INTO `sys_role_menu` VALUES ('70448f78ed9e40dc8c521d0320414844', '30');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '10');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '11');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '12');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '19');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '2');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '20');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '21');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '22');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '27');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '29');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '4');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '5');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '6');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '68');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '7');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '8');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', '803df6728fb84ed3a00bfcae4efbabae');
INSERT INTO `sys_role_menu` VALUES ('7b2ec80717354677a8033ccc1fc501b8', 'ed5842f2d7ea4d9d8029eaacb039d4c7');
INSERT INTO `sys_role_menu` VALUES ('90847b6a68794163ae070581b480bb8f', '27');
INSERT INTO `sys_role_menu` VALUES ('90847b6a68794163ae070581b480bb8f', '29');
INSERT INTO `sys_role_menu` VALUES ('90847b6a68794163ae070581b480bb8f', '30');
INSERT INTO `sys_role_menu` VALUES ('a067fa8e797342428c3a2f65e43b0cd4', '27');
INSERT INTO `sys_role_menu` VALUES ('a067fa8e797342428c3a2f65e43b0cd4', '29');
INSERT INTO `sys_role_menu` VALUES ('a067fa8e797342428c3a2f65e43b0cd4', '30');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '2');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '27');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '29');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '30');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '4');
INSERT INTO `sys_role_menu` VALUES ('c81c9120fe584ea69e019c373274befe', '5');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '1c4a1aea2dd4c2ab41e9cbd3a14d582db7773299eeaf60c9cb9c4d3d', '0001', '系统管理员', 'xxx@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2017-07-13 11:39:26', '1', '1', '2013-05-27 08:00:00', '1', '2017-05-03 16:28:51', '', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:31:14', null, '1');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:31:14', null, '1');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:31:14', null, '1');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:31:14', null, '1');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', '2232558318@qq.com', '13123123231', '15920369178', '0', null, null, null, '0', '1', '2013-05-27 08:00:00', '1', '2017-04-24 15:13:54', '', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', '2232558318@qq.com', '13123123231', '15920369178', '0', null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-25 14:27:00', '', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 14:54:51', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 17:12:17', null, '0');
INSERT INTO `sys_user` VALUES ('6dd0cb635f3b4c23825f8c4261cc7f3d', null, '5', 'testr', 'cc9830a4e1b43d6fea64b0c4267deed4bd75577eef1882ab16341af8', 'testr', 'testr1', 'testr', '18088878068', '15920369178', '0', null, null, null, '1', '1', '2017-04-21 16:09:24', '1', '2017-04-21 16:09:24', 'xxx', '1');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:33:55', null, '1');
INSERT INTO `sys_user` VALUES ('74a4174770b74282bef11b9d42c132b5', null, '5', 'test', '1afe6d31f2ac772a9b6e7439c8299af1580721f3fe9d474221b0549b', 'test01', '测试', 'test@qq.com', '18088878068', '15920369178', '0', null, '0:0:0:0:0:0:0:1', '2017-05-04 11:01:53', '1', '1', '2017-05-03 17:03:16', '1', '2017-05-03 17:03:16', '', '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-04-19 15:31:15', null, '1');
INSERT INTO `sys_user` VALUES ('880d1ed26c934caaad8cc87b7ae3db20', null, '5', 'xxxxxxxx', 'c14e818b67491feddb9454d21f00b206a62fbe47f2e853306336daaa', 'xxxxx1', 'xxxxx', 'xxxx', '18088878068', '15920369178', '0', null, null, null, '1', '1', '2017-04-21 16:10:47', '1', '2017-04-21 16:10:47', '', '1');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2017-05-03 16:29:55', null, '1');
INSERT INTO `sys_user` VALUES ('bf4f649431584cd7a435c59873e7bdf9', null, '10', 'dddds', '08e986cf42e81aacd94a2e6c803076b26a0323c5f19754ab0f814f50', 'dddds', 'dddds', 'dddds', '18088878068', '15920369178', '0', null, null, null, '1', '1', '2017-04-21 15:39:48', '1', '2017-05-03 16:29:57', 'xxxx', '1');
INSERT INTO `sys_user` VALUES ('c3d7672523a44fa4960bbc65a1869ddb', null, '5', 'ccccc', 'c35afed61470811bbf0f962395454970854f24bd1fa05d35e167f791', 'sadsa', 'dasdasd', 'sssssssss', '13023423223', '15920369178', '2', null, null, null, '1', '1', '2017-04-24 10:39:49', '1', '2017-04-24 10:39:49', '', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('10', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('11', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('12', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('12', 'c81c9120fe584ea69e019c373274befe');
INSERT INTO `sys_user_role` VALUES ('13', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('13', '7b2ec80717354677a8033ccc1fc501b8');
INSERT INTO `sys_user_role` VALUES ('13', 'c81c9120fe584ea69e019c373274befe');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('3', '6');
INSERT INTO `sys_user_role` VALUES ('3', '837dbf05f4bf4e1591ef897e891eb7e3');
INSERT INTO `sys_user_role` VALUES ('3', 'a067fa8e797342428c3a2f65e43b0cd4');
INSERT INTO `sys_user_role` VALUES ('4', '1');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('4', 'c81c9120fe584ea69e019c373274befe');
INSERT INTO `sys_user_role` VALUES ('5', '1');
INSERT INTO `sys_user_role` VALUES ('5', '7b2ec80717354677a8033ccc1fc501b8');
INSERT INTO `sys_user_role` VALUES ('5', '837dbf05f4bf4e1591ef897e891eb7e3');
INSERT INTO `sys_user_role` VALUES ('6', 'c81c9120fe584ea69e019c373274befe');
INSERT INTO `sys_user_role` VALUES ('6dd0cb635f3b4c23825f8c4261cc7f3d', '2');
INSERT INTO `sys_user_role` VALUES ('6dd0cb635f3b4c23825f8c4261cc7f3d', '3');
INSERT INTO `sys_user_role` VALUES ('6dd0cb635f3b4c23825f8c4261cc7f3d', '6');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('74a4174770b74282bef11b9d42c132b5', '7b2ec80717354677a8033ccc1fc501b8');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('8', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('880d1ed26c934caaad8cc87b7ae3db20', '2');
INSERT INTO `sys_user_role` VALUES ('880d1ed26c934caaad8cc87b7ae3db20', '3');
INSERT INTO `sys_user_role` VALUES ('880d1ed26c934caaad8cc87b7ae3db20', '6');
INSERT INTO `sys_user_role` VALUES ('9', '70448f78ed9e40dc8c521d0320414844');
INSERT INTO `sys_user_role` VALUES ('bf4f649431584cd7a435c59873e7bdf9', '2');
INSERT INTO `sys_user_role` VALUES ('bf4f649431584cd7a435c59873e7bdf9', '3');
INSERT INTO `sys_user_role` VALUES ('bf4f649431584cd7a435c59873e7bdf9', '6');
INSERT INTO `sys_user_role` VALUES ('c3d7672523a44fa4960bbc65a1869ddb', '6');
INSERT INTO `sys_user_role` VALUES ('c3d7672523a44fa4960bbc65a1869ddb', '837dbf05f4bf4e1591ef897e891eb7e3');
INSERT INTO `sys_user_role` VALUES ('c3d7672523a44fa4960bbc65a1869ddb', 'a067fa8e797342428c3a2f65e43b0cd4');
INSERT INTO `sys_user_role` VALUES ('c3d7672523a44fa4960bbc65a1869ddb', 'c81c9120fe584ea69e019c373274befe');

-- ----------------------------
-- Table structure for ums_system_copy
-- ----------------------------
DROP TABLE IF EXISTS `ums_system_copy`;
CREATE TABLE `ums_system_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(50) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统';

-- ----------------------------
-- Records of ums_system_copy
-- ----------------------------
INSERT INTO `ums_system_copy` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/zheng-admin/images/zheng-upms.png', '#29A176', 'http://upms.zhangshuzheng.cn:1111', '1', 'zheng-upms-server', '权限管理系统', '用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）', '1', '1');
INSERT INTO `ums_system_copy` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/zheng-admin/images/zheng-cms.png', '#455EC5', 'http://cms.zhangshuzheng.cn:2222', '1', 'zheng-cms-admin', '内容管理系统', '内容管理系统（门户、博客、论坛、问答等）', '2', '2');
INSERT INTO `ums_system_copy` VALUES ('3', 'zmdi zmdi-paypal-alt', '/resources/zheng-admin/images/zheng-pay.png', '#F06292', 'http://pay.zhangshuzheng.cn:3331', '1', 'zheng-pay-admin', '支付管理系统', '支付管理系统', '3', '3');
INSERT INTO `ums_system_copy` VALUES ('4', 'zmdi zmdi-account', '/resources/zheng-admin/images/zheng-ucenter.png', '#6539B4', 'http://ucenter.zhangshuzheng.cn:4441', '1', 'zheng-ucenter-home', '用户管理系统', '用户管理系统', '4', '4');
INSERT INTO `ums_system_copy` VALUES ('5', 'zmdi zmdi-cloud', '/resources/zheng-admin/images/zheng-oss.png', '#0B8DE5', 'http://oss.zhangshuzheng.cn:7771', '1', 'zheng-oss-web', '存储管理系统', '存储管理系统', '5', '5');
