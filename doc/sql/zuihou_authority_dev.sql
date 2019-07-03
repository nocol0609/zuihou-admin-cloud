/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 127.0.0.1:3306
 Source Schema         : zuihou_authority_dev

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 03/07/2019 11:02:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_auth_application
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_application`;
CREATE TABLE `c_auth_application` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `index_url` varchar(100) DEFAULT '' COMMENT '首页访问地址',
  `full_root_path` varchar(80) DEFAULT '' COMMENT '应用程序的完整根路径',
  `name` varchar(20) DEFAULT '' COMMENT '应用名称',
  `logo_url` varchar(255) DEFAULT '' COMMENT '应用logo',
  `describe_` varchar(200) DEFAULT '' COMMENT '功能描述',
  `code` varchar(20) NOT NULL COMMENT '应用编码\r\n必须唯一',
  `sortvalue` int(11) DEFAULT '1' COMMENT '序号',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `icp_code` varchar(32) DEFAULT '' COMMENT 'ICP备案号',
  `title_icon` varchar(255) DEFAULT '' COMMENT '标题logo',
  `support_unit` varchar(32) DEFAULT '' COMMENT '技术支持单位',
  `common_record` varchar(32) DEFAULT '' COMMENT '公网备案号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_code_` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用';

-- ----------------------------
-- Table structure for c_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_menu`;
CREATE TABLE `c_auth_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(20) DEFAULT '' COMMENT '资源名称',
  `describe_` varchar(200) DEFAULT '' COMMENT '功能描述',
  `code` varchar(255) DEFAULT '' COMMENT '资源编码',
  `menu_type` varchar(10) DEFAULT 'MENU' COMMENT '菜单类型 \r\n#MenuType{MENU:菜单;DIR:目录;}',
  `is_public` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否公开菜单\r\n就是无需分配就可以访问的。所有人可见',
  `href` varchar(255) DEFAULT '' COMMENT '资源路径',
  `target` varchar(9) DEFAULT 'SELF' COMMENT '打开方式\r\n#TargetType{SELF:_self,相同框架;TOP:_top,当前页;BLANK:_blank,新建窗口;PAREN:_parent,父窗口}',
  `is_enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `sortvalue` int(11) DEFAULT '1' COMMENT '序号',
  `icon` varchar(255) DEFAULT '' COMMENT '菜单图标',
  `group_` varchar(20) DEFAULT '' COMMENT '菜单分组',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单id',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

-- ----------------------------
-- Table structure for c_auth_micro_service
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_micro_service`;
CREATE TABLE `c_auth_micro_service` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) DEFAULT '' COMMENT '服务名称',
  `describe_` varchar(100) DEFAULT '' COMMENT '服务描述',
  `eureka_code` varchar(100) DEFAULT '' COMMENT 'eureka编码\r\n就是服务注册到eureka后，他的application name',
  `swagger_url` varchar(255) DEFAULT '' COMMENT 'swagger地址',
  `sortvalue` int(11) DEFAULT '1' COMMENT '排序',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务表';

-- ----------------------------
-- Table structure for c_auth_resource
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_resource`;
CREATE TABLE `c_auth_resource` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `code` varchar(255) DEFAULT NULL COMMENT '资源编码',
  `resource_type` varchar(10) DEFAULT NULL COMMENT '资源类型 \n#ResourceType{BUTTON:按钮;URI:链接;}',
  `name` varchar(255) DEFAULT '' COMMENT '接口名称',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单id\n#c_auth_menu',
  `base_path` varchar(100) DEFAULT '' COMMENT '基础路径',
  `describe_` varchar(255) DEFAULT '' COMMENT '接口描述',
  `uri` varchar(150) DEFAULT '' COMMENT '地址',
  `http_method` varchar(7) DEFAULT 'GET' COMMENT '请求方式\r\n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}\n         ',
  `deprecated` bit(1) DEFAULT b'0' COMMENT '是否过时',
  `is_certification` bit(1) DEFAULT b'0' COMMENT '是否需要认证',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_base_path_uri_method` (`base_path`,`uri`,`http_method`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源';

-- ----------------------------
-- Table structure for c_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role`;
CREATE TABLE `c_auth_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT '' COMMENT '角色名称',
  `code` varchar(20) DEFAULT '' COMMENT '角色编码',
  `describe_` varchar(100) DEFAULT '' COMMENT '功能描述',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `is_readonly` bit(1) DEFAULT b'0' COMMENT '是否只读角色',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Table structure for c_auth_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role_authority`;
CREATE TABLE `c_auth_role_authority` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `authority_id` bigint(20) NOT NULL COMMENT '资源id\n#c_auth_resource\n#c_auth_menu',
  `authority_type` varchar(10) NOT NULL DEFAULT 'MENU' COMMENT '权限类型\n#AuthorizeType{MENU:菜单;RESOURCE:资源;}',
  `role_id` bigint(20) NOT NULL COMMENT '角色id\n#c_auth_role',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色的资源';

-- ----------------------------
-- Table structure for c_auth_role_org
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role_org`;
CREATE TABLE `c_auth_role_org` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID\n#c_auth_role',
  `org_id` bigint(20) DEFAULT NULL COMMENT '部门ID\n#c_core_org',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色部门关系';

-- ----------------------------
-- Table structure for c_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_user`;
CREATE TABLE `c_auth_user` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `account` varchar(30) NOT NULL COMMENT '账号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID\n#c_core_org',
  `station_id` bigint(20) DEFAULT NULL COMMENT '岗位ID\n#c_core_station',
  `account_type` varchar(20) DEFAULT 'CUSTOMER' COMMENT '账号类型  \n#AccountType{CUSTOMER:客户;BUILT_IN:内置}',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别\n#Sex{W:女;M:男}',
  `is_can_login` bit(1) NOT NULL COMMENT '是否可登陆',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '删除标记',
  `photo` varchar(255) DEFAULT '' COMMENT '照片',
  `work_describe` varchar(255) DEFAULT '' COMMENT '工作描述\r\n比如：  市长、管理员、局长等等   用于登陆展示',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数\n一直累计，记录了此账号总共登录次数',
  `continuation_error_day` date DEFAULT NULL COMMENT '输入密码错误的日期\r\n比如20190102  与error_count合力实现一天输入密码错误次数限制',
  `continuation_error_count` int(11) NOT NULL DEFAULT '0' COMMENT '一天连续输错密码次数',
  `password_expire_time` datetime DEFAULT NULL COMMENT '密码过期时间',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账号';

-- ----------------------------
-- Table structure for c_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_user_role`;
CREATE TABLE `c_auth_user_role` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id\n#c_auth_role',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id\n#c_core_account',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色分配\r\n账号角色绑定';

-- ----------------------------
-- Table structure for c_common_area
-- ----------------------------
DROP TABLE IF EXISTS `c_common_area`;
CREATE TABLE `c_common_area` (
  `id` bigint(11) NOT NULL COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '地区编码',
  `full_name` varchar(255) DEFAULT '' COMMENT '全名',
  `sortvalue` int(11) DEFAULT NULL COMMENT '排序',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '维度',
  `level` int(1) NOT NULL COMMENT '行政区级',
  `parent_code` varchar(64) NOT NULL COMMENT '上级行政区码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(11) DEFAULT '0' COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(11) DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区表';

-- ----------------------------
-- Table structure for c_common_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `c_common_dictionary`;
CREATE TABLE `c_common_dictionary` (
  `id` bigint(20) NOT NULL,
  `code` varchar(64) NOT NULL COMMENT '编码\r\n一颗树仅仅有一个统一的编码',
  `parent_id` bigint(20) NOT NULL COMMENT '父级id  \r\n顶级的字典父级id是自己',
  `name` varchar(64) NOT NULL COMMENT '字典名称',
  `describe_` varchar(200) DEFAULT '' COMMENT '字典描述',
  `is_enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典目录';

-- ----------------------------
-- Table structure for c_common_dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `c_common_dictionary_item`;
CREATE TABLE `c_common_dictionary_item` (
  `id` bigint(20) NOT NULL COMMENT '字典项id',
  `dictionary_id` bigint(20) NOT NULL COMMENT '字典id',
  `dictionary_code` varchar(64) NOT NULL COMMENT '字典编码',
  `dictionary_item_code` varchar(64) NOT NULL COMMENT '字典项编码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `is_enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `describe_` varchar(255) DEFAULT '' COMMENT '描述',
  `sortvalue` int(11) DEFAULT '1' COMMENT '排序',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dict_code_item_code_uniq` (`dictionary_code`,`dictionary_item_code`) USING BTREE COMMENT '字典编码与字典项目编码联合唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典项';

-- ----------------------------
-- Table structure for c_common_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `c_common_opt_log`;
CREATE TABLE `c_common_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_ip` varchar(50) DEFAULT NULL COMMENT '操作IP',
  `type` varchar(5) DEFAULT NULL COMMENT '日志类型\n#LogType{OPT:操作类型;EX:异常类型}',
  `user_name` varchar(50) DEFAULT NULL COMMENT '操作人',
  `description` varchar(50) DEFAULT NULL COMMENT '操作描述',
  `class_path` varchar(255) DEFAULT NULL COMMENT '类路径',
  `action_method` varchar(50) DEFAULT NULL COMMENT '请求方法\n\n',
  `request_uri` varchar(50) DEFAULT NULL COMMENT '请求uri',
  `http_method` varchar(10) DEFAULT NULL COMMENT '请求方法\n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
  `params` text COMMENT '请求参数',
  `result` text COMMENT '返回值',
  `ex_desc` text COMMENT '异常详情信息',
  `ex_detail` text COMMENT '异常描述',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `consuming_time` bigint(20) DEFAULT NULL COMMENT '消耗时间',
  `ua` varchar(500) DEFAULT NULL COMMENT '浏览器',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE COMMENT '日志类型'
) ENGINE=InnoDB AUTO_INCREMENT=595931190599352354 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Table structure for c_core_org
-- ----------------------------
DROP TABLE IF EXISTS `c_core_org`;
CREATE TABLE `c_core_org` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `abbreviation` varchar(255) DEFAULT '' COMMENT '简称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `sortvalue` int(11) DEFAULT '1' COMMENT '排序',
  `status` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for c_core_station
-- ----------------------------
DROP TABLE IF EXISTS `c_core_station`;
CREATE TABLE `c_core_station` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID\n#c_core_org',
  `sortvalue` int(11) DEFAULT '1' COMMENT '排序',
  `status` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
