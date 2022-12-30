/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_open_system

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:29:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_open_auth_quantity
-- ----------------------------
DROP TABLE IF EXISTS `t_open_auth_quantity`;
CREATE TABLE `t_open_auth_quantity` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '主用户ID',
  `company_id` bigint(20) NOT NULL COMMENT '公司ID',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户ID',
  `auth_code` varchar(32) NOT NULL COMMENT '授权码,自动生成',
  `auth_quantity` int(11) DEFAULT '50' COMMENT '授权数量',
  `auth_date` timestamp NULL DEFAULT NULL COMMENT '授权日期',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1: 正常; 2:禁用;',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间,有值表示已删除',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Table structure for t_open_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_open_auth_rule`;
CREATE TABLE `t_open_auth_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `always_show` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `jump_path` varchar(100) NOT NULL DEFAULT '' COMMENT '跳转路由',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_frame` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_cache` int(20) DEFAULT '1' COMMENT '是否缓存(1 缓存, 2 不缓存)',
  `is_hide_child_menu` int(20) DEFAULT '1' COMMENT '是否隐藏子菜单(1 隐藏, 2 不隐藏)',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9159164745528279041 DEFAULT CHARSET=utf8mb4 COMMENT='菜单节点表';

-- ----------------------------
-- Table structure for t_open_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_open_casbin_rule`;
CREATE TABLE `t_open_casbin_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  `v6` varchar(25) DEFAULT NULL,
  `v7` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_sys_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`) USING BTREE,
  UNIQUE KEY `idx_t_open_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`,`v6`,`v7`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1650005957 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_open_company
-- ----------------------------
DROP TABLE IF EXISTS `t_open_company`;
CREATE TABLE `t_open_company` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `tenant_id` varchar(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户主键',
  `name` varchar(50) DEFAULT NULL COMMENT '企业名称',
  `nature` varchar(50) DEFAULT NULL COMMENT '企业性质',
  `license_no` varchar(20) DEFAULT NULL COMMENT '营业执照号码',
  `license` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `legal_person` varchar(20) DEFAULT NULL COMMENT '法人姓名',
  `apply_person` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `idcard_front_img` varchar(255) DEFAULT NULL COMMENT '身份证照片',
  `idcard_after_img` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `status` int(11) DEFAULT NULL COMMENT '状态（=1 未提交 ,=2 认证中,   =3 已认证, =4 禁用',
  `account_type` int(10) DEFAULT NULL COMMENT '账号类型 1 企业账号, 2 个人账号',
  `case_remak` varchar(1200) DEFAULT NULL COMMENT '审核备注(拒绝需要填写拒绝原因)',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `is_real_name` int(11) DEFAULT NULL COMMENT '是否实名(1 已实名, 2 未实名)',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `request_auth_at` timestamp NULL DEFAULT NULL COMMENT '申请认证时间',
  `region` varchar(255) DEFAULT NULL COMMENT '区域(中国/长沙)',
  `user_name` varchar(255) DEFAULT NULL COMMENT '登录用户名(冗余字段.)',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_open_company_auth_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_open_company_auth_logs`;
CREATE TABLE `t_open_company_auth_logs` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司id',
  `auth_result` varchar(255) DEFAULT NULL COMMENT '审核结果',
  `auth_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `auth_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `why` varchar(1200) DEFAULT NULL COMMENT '理由',
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_open_company_connect
-- ----------------------------
DROP TABLE IF EXISTS `t_open_company_connect`;
CREATE TABLE `t_open_company_connect` (
  `id` bigint(20) NOT NULL,
  `tenant_id` varchar(6) DEFAULT NULL COMMENT '企业主键id',
  `account_type` int(1) DEFAULT NULL COMMENT '账号类型（1 主账号 0 子账号）',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `user_id` bigint(20) DEFAULT NULL COMMENT '开发者用户编号',
  `account` varchar(255) DEFAULT NULL COMMENT '账号',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `job` varchar(255) DEFAULT NULL COMMENT '职位',
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_open_config
-- ----------------------------
DROP TABLE IF EXISTS `t_open_config`;
CREATE TABLE `t_open_config` (
  `config_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_open_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_open_login_log`;
CREATE TABLE `t_open_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Table structure for t_open_model_info
-- ----------------------------
DROP TABLE IF EXISTS `t_open_model_info`;
CREATE TABLE `t_open_model_info` (
  `model_id` bigint(20) NOT NULL COMMENT '模型ID',
  `model_category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '模板分类id',
  `model_name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `model_title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `model_pk` char(30) NOT NULL DEFAULT '' COMMENT '主键字段',
  `model_order` char(30) NOT NULL DEFAULT '' COMMENT '默认排序字段',
  `model_sort` varchar(255) DEFAULT NULL COMMENT '表单字段排序',
  `model_list` varchar(255) DEFAULT NULL COMMENT '列表显示字段，为空显示全部',
  `model_edit` varchar(255) DEFAULT '' COMMENT '可编辑字段，为空则除主键外均可以编辑',
  `model_indexes` varchar(255) DEFAULT NULL COMMENT '索引字段',
  `search_list` varchar(255) DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `model_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `model_engine` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `name_uni` (`model_name`) USING BTREE COMMENT '模型名唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文档模型表';

-- ----------------------------
-- Table structure for t_open_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `t_open_oper_log`;
CREATE TABLE `t_open_oper_log` (
  `oper_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` text COMMENT '请求参数',
  `json_result` text COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Table structure for t_open_role
-- ----------------------------
DROP TABLE IF EXISTS `t_open_role`;
CREATE TABLE `t_open_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(6) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1: 正常; 2:禁用;',
  `list_order` int(11) DEFAULT '0' COMMENT '排序',
  `is_default` int(11) DEFAULT NULL COMMENT '是否默认角色(1 默认, 2 非默认)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `is_admin` int(11) DEFAULT NULL COMMENT '是否管理员角色(每一个空间都默认一个管理员角色,并且有所有菜单权限)[1 是, 2 否]',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7889966926082965505 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Table structure for t_open_user
-- ----------------------------
DROP TABLE IF EXISTS `t_open_user`;
CREATE TABLE `t_open_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `address` varchar(255) DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `account_type` int(11) DEFAULT NULL COMMENT '账号类型（=1 企业 =2 个人）',
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8927966016260964353 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Table structure for t_open_user_company
-- ----------------------------
DROP TABLE IF EXISTS `t_open_user_company`;
CREATE TABLE `t_open_user_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户主键id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `company_id` bigint(20) DEFAULT NULL COMMENT '企业主键id',
  `tenant_id` varchar(6) DEFAULT NULL COMMENT '租户Id',
  `user_type` int(10) DEFAULT NULL COMMENT '账号类型(1 子账号,2 主账号)',
  `remark` varchar(500) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8927988475198603266 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_open_user_online
-- ----------------------------
DROP TABLE IF EXISTS `t_open_user_online`;
CREATE TABLE `t_open_user_online` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `ip` varchar(120) NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户在线状态表';
