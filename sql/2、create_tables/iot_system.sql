/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_system

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:30:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_demo_data_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_data_auth`;
CREATE TABLE `t_demo_data_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `created_by` int(10) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` int(10) unsigned DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_demo_gen
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_gen`;
CREATE TABLE `t_demo_gen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `demo_name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `classes` varchar(30) NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` timestamp NULL DEFAULT NULL COMMENT '出生年月',
  `t_demo_gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `demo_cate` varchar(30) NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成测试表';

-- ----------------------------
-- Table structure for t_demo_gen_class
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_gen_class`;
CREATE TABLE `t_demo_gen_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `class_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成关联测试表';

-- ----------------------------
-- Table structure for t_demo_gen_tree
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_gen_tree`;
CREATE TABLE `t_demo_gen_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `demo_name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `classes` varchar(30) NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` timestamp NULL DEFAULT NULL COMMENT '出生年月',
  `t_demo_gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `demo_cate` varchar(30) NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成树形结构测试表';

-- ----------------------------
-- Table structure for t_open_company
-- ----------------------------
DROP TABLE IF EXISTS `t_open_company`;
CREATE TABLE `t_open_company` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
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
  `status` int(11) DEFAULT NULL COMMENT '状态（=0 待审核 =1 正常 =2 审核失败）',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_open_user
-- ----------------------------
DROP TABLE IF EXISTS `t_open_user`;
CREATE TABLE `t_open_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `company_id` bigint(20) DEFAULT NULL COMMENT '企业编号',
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `phone_num` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_name`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Table structure for t_plugins_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_plugins_manage`;
CREATE TABLE `t_plugins_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) DEFAULT NULL COMMENT '插件在商城中的id',
  `p_name` varchar(50) DEFAULT NULL COMMENT '插件名称英文',
  `p_title` varchar(50) DEFAULT NULL COMMENT '插件名称',
  `p_description` varchar(255) DEFAULT NULL COMMENT '插件介绍',
  `p_auth` varchar(30) DEFAULT NULL COMMENT '作者',
  `is_install` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否安装',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `version` varchar(60) DEFAULT NULL COMMENT '当前版本',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `install_path` varchar(255) DEFAULT NULL COMMENT '安装路径（用于卸载）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `storeIdUni` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='插件管理';

-- ----------------------------
-- Table structure for t_sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_apis`;
CREATE TABLE `t_sys_apis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) DEFAULT 'POST',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_sys_app_doc_dir
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_app_doc_dir`;
CREATE TABLE `t_sys_app_doc_dir` (
  `id` bigint(20) NOT NULL COMMENT '目录id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级目录id(一级目录默认值0)',
  `dir_name` varchar(100) DEFAULT NULL COMMENT '目录名称',
  `dir_img` varchar(1000) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文档目录接口';

-- ----------------------------
-- Table structure for t_sys_app_entry
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_app_entry`;
CREATE TABLE `t_sys_app_entry` (
  `id` bigint(20) NOT NULL COMMENT '词条id',
  `lang` varchar(50) DEFAULT NULL COMMENT '语种编码',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `seting_id` bigint(20) DEFAULT NULL COMMENT '设置id',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文档词条';

-- ----------------------------
-- Table structure for t_sys_app_entry_seting
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_app_entry_seting`;
CREATE TABLE `t_sys_app_entry_seting` (
  `id` bigint(20) NOT NULL COMMENT '设置id',
  `dir_id` bigint(20) DEFAULT NULL COMMENT '目录id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_enable` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  `is_normal` tinyint(4) DEFAULT NULL COMMENT '是否设置为常见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='词条设置表';

-- ----------------------------
-- Table structure for t_sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_auth_rule`;
CREATE TABLE `t_sys_auth_rule` (
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
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9185071669813608449 DEFAULT CHARSET=utf8mb4 COMMENT='菜单节点表';

-- ----------------------------
-- Table structure for t_sys_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_casbin_rule`;
CREATE TABLE `t_sys_casbin_rule` (
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
  UNIQUE KEY `idx_t_sys_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1650004414 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config` (
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
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `order_num` int(10) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(50) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Table structure for t_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_data`;
CREATE TABLE `t_sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Table structure for t_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_type`;
CREATE TABLE `t_sys_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除日期',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Table structure for t_sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_login_log`;
CREATE TABLE `t_sys_login_log` (
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
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Table structure for t_sys_model_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_model_info`;
CREATE TABLE `t_sys_model_info` (
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
-- Table structure for t_sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_oper_log`;
CREATE TABLE `t_sys_oper_log` (
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
) ENGINE=MyISAM AUTO_INCREMENT=16692 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Table structure for t_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post`;
CREATE TABLE `t_sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9157520205839171585 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1613069298228625409 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Table structure for t_sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_dept`;
CREATE TABLE `t_sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `phone_num` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '联系电话',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `account_type` int(11) DEFAULT NULL COMMENT '账号类型（=1 平台用户 =2 开发者用户）',
  PRIMARY KEY (`id`),
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8806758658533654529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- ----------------------------
-- Table structure for t_sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_online`;
CREATE TABLE `t_sys_user_online` (
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
) ENGINE=MyISAM AUTO_INCREMENT=16914 DEFAULT CHARSET=utf8mb4 COMMENT='用户在线状态表';

-- ----------------------------
-- Table structure for t_sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_post`;
CREATE TABLE `t_sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Table structure for t_sys_web_set
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_web_set`;
CREATE TABLE `t_sys_web_set` (
  `web_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `web_content` text CHARACTER SET utf8 COMMENT '站点信息',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_tools_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `t_tools_gen_table`;
CREATE TABLE `t_tools_gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name_e` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Table structure for t_tools_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `t_tools_gen_table_column`;
CREATE TABLE `t_tools_gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) DEFAULT NULL COMMENT 'Go类型',
  `go_field` varchar(200) DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) DEFAULT NULL COMMENT 'html字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `link_table_name` varchar(50) DEFAULT NULL COMMENT '关联表名',
  `link_table_class` varchar(50) DEFAULT NULL COMMENT '关联表类名',
  `link_table_package` varchar(150) DEFAULT NULL COMMENT '关联表包名',
  `link_label_id` varchar(50) DEFAULT NULL COMMENT '关联表键名',
  `link_label_name` varchar(50) DEFAULT NULL COMMENT '关联表字段值',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
