/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_app_build

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:30:54
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_app_build;

-- ----------------------------
-- Table structure for t_oem_app
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app`;
CREATE TABLE `t_oem_app` (
  `id` bigint(20) NOT NULL,
  `app_key` varchar(64) DEFAULT NULL COMMENT 'appKey,后台生成',
  `app_secret` varchar(64) DEFAULT NULL COMMENT 'appSecret，后台生成',
  `name` varchar(32) DEFAULT NULL COMMENT 'app名称',
  `version` varchar(20) DEFAULT NULL COMMENT 'app当前版本',
  `ios_pkg_name` varchar(128) DEFAULT NULL COMMENT 'ios包名',
  `android_pkg_name` varchar(128) DEFAULT NULL COMMENT 'android包名',
  `channel` varchar(20) DEFAULT NULL COMMENT '渠道名',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，要定义数据字典\r\n1.配置中:        跳转到第一步\r\n\r2.构建中:       跳转到第四步(构建中页面)\r\n\r3.构建完成:    跳转到第四步(构建完成页面)\r\n\r4.上架中:       跳转到第五步(上架操作页面)\r\n\r5.已上架:       跳转到第五步(已经上架页面)',
  `amap_key` varchar(128) DEFAULT NULL COMMENT '高德地图key',
  `googlemap_key` varchar(128) DEFAULT NULL COMMENT 'google地图key',
  `region` tinyint(4) DEFAULT NULL COMMENT '区域，要定义数据字典',
  `current_step` int(11) DEFAULT NULL COMMENT 'app当前操作步骤',
  `tenant_id` varchar(8) DEFAULT NULL COMMENT '租户ID',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_listed` tinyint(4) DEFAULT '1' COMMENT '1 未上架过, 2 已上架过(用户删除逻辑判断)',
  `name_en` varchar(100) DEFAULT NULL COMMENT 'APP 英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app主表';

-- ----------------------------
-- Table structure for t_oem_app_android_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_android_cert`;
CREATE TABLE `t_oem_app_android_cert` (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `resign` tinyint(4) DEFAULT NULL COMMENT '重签名，1支持，2不支持',
  `cert_sha256` text COMMENT '用户输入的SHA256，多组逗号分隔',
  `keypass` varchar(64) DEFAULT NULL COMMENT '后台keytool生成',
  `storepass` varchar(64) DEFAULT NULL COMMENT '后台keytool生成',
  `alias_keytool` varchar(64) DEFAULT NULL COMMENT '后台keytool生成',
  `keystore` text COMMENT '后台keytool生成',
  `ks_md5` varchar(100) DEFAULT NULL COMMENT 'keytool工具获取的keystore文件的md5',
  `ks_sha1` varchar(100) DEFAULT NULL COMMENT 'keytool工具获取的keystore文件的sha1',
  `ks_sha256` varchar(128) DEFAULT NULL COMMENT 'keytool工具获取的keystore文件的sha256',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`app_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app android证书';

-- ----------------------------
-- Table structure for t_oem_app_build_record
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_build_record`;
CREATE TABLE `t_oem_app_build_record` (
  `id` bigint(20) NOT NULL,
  `build_id` varchar(20) DEFAULT NULL COMMENT '构建编号',
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `res_url` varchar(256) DEFAULT NULL COMMENT 'zip文件oss URL',
  `res_md5` varchar(40) DEFAULT NULL COMMENT 'zip文件的MD5',
  `os` tinyint(4) DEFAULT NULL COMMENT '平台，要在数据字典定义',
  `region` tinyint(4) DEFAULT NULL COMMENT '区域，要在数据字典定义',
  `status` tinyint(4) DEFAULT NULL COMMENT '打包状态，打包机上报',
  `commit_id` varchar(48) DEFAULT NULL COMMENT 'git仓库提交码，打包机上报',
  `build_progress` tinyint(4) DEFAULT NULL COMMENT '构建进度，打包机上报',
  `build_result` tinyint(4) DEFAULT NULL COMMENT '打包结果，打包机上报（要在数据字典定义）',
  `build_result_msg` text COMMENT '打包错误简要描述，打包机上报',
  `pkg_url` varchar(2000) DEFAULT NULL COMMENT '安装包oss地址',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '打包开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '打包结束时间，打包机上报',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app打包记录表';

-- ----------------------------
-- Table structure for t_oem_app_def_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_def_menu`;
CREATE TABLE `t_oem_app_def_menu` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '菜单名称',
  `menu_key` varchar(32) DEFAULT NULL COMMENT '菜单标识',
  `position` int(11) DEFAULT NULL COMMENT '菜单位置，左到右，1开始',
  `def_image` varchar(255) DEFAULT NULL COMMENT '默认图标',
  `sel_image` varchar(255) DEFAULT NULL COMMENT '选中图标',
  `required` tinyint(4) DEFAULT NULL COMMENT '是否必须 1 必须,  2 非必须',
  `status` tinyint(4) DEFAULT NULL COMMENT '1启用2禁用',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='云管平台-app底部菜单栏表';

-- ----------------------------
-- Table structure for t_oem_app_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_doc`;
CREATE TABLE `t_oem_app_doc` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '文档名称',
  `apps` varchar(2048) DEFAULT NULL COMMENT '文档关联的app,  json字符串字段不做查询, 用于查看. 查询还是使用关联表查询',
  `langs` varchar(200) DEFAULT NULL COMMENT '文档对应的语种(json格式字符串)',
  `remain_lang` varchar(50) DEFAULT NULL COMMENT '兜底语种编码',
  `is_succeed_pub_doc` tinyint(4) DEFAULT NULL COMMENT '是否继承公版文档',
  `succeed_pub_doc` varchar(200) DEFAULT NULL COMMENT '继承公版的语种(json格式字符串)',
  `tenant_id` varchar(50) DEFAULT NULL COMMENT '租户id',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP帮助文档';

-- ----------------------------
-- Table structure for t_oem_app_doc_dir
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_doc_dir`;
CREATE TABLE `t_oem_app_doc_dir` (
  `id` bigint(20) NOT NULL COMMENT '目录id',
  `doc_id` bigint(20) DEFAULT NULL COMMENT '文档id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级目录id(一级目录默认值0)',
  `dir_name` varchar(100) DEFAULT NULL COMMENT '目录名称',
  `dir_img` varchar(1000) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档目录接口';

-- ----------------------------
-- Table structure for t_oem_app_doc_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_doc_relation`;
CREATE TABLE `t_oem_app_doc_relation` (
  `id` bigint(20) NOT NULL COMMENT '关联id',
  `doc_id` bigint(20) DEFAULT NULL COMMENT '文档id',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'appid',
  `app_key` varchar(100) DEFAULT NULL COMMENT 'app的key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app文档关联表';

-- ----------------------------
-- Table structure for t_oem_app_entry
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_entry`;
CREATE TABLE `t_oem_app_entry` (
  `id` bigint(20) NOT NULL COMMENT '词条id',
  `lang` varchar(50) DEFAULT NULL COMMENT '语种编码',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `seting_id` bigint(20) DEFAULT NULL COMMENT '设置id',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档词条';

-- ----------------------------
-- Table structure for t_oem_app_entry_seting
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_entry_seting`;
CREATE TABLE `t_oem_app_entry_seting` (
  `id` bigint(20) NOT NULL COMMENT '设置id',
  `dir_id` bigint(20) DEFAULT NULL COMMENT '目录id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_enable` tinyint(4) DEFAULT NULL COMMENT '是否启用 1-启用  2-不启用',
  `is_normal` tinyint(4) DEFAULT NULL COMMENT '是否设置为常见 1-常见  2-不常见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='词条设置表';

-- ----------------------------
-- Table structure for t_oem_app_function_config
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_function_config`;
CREATE TABLE `t_oem_app_function_config` (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT 'app版本',
  `about_us` tinyint(4) DEFAULT NULL COMMENT '关于我们，1支持，2不支持',
  `eula` tinyint(4) DEFAULT NULL COMMENT '用户协议，1支持，2不支持',
  `privacy_policy` tinyint(4) DEFAULT NULL COMMENT '隐私协议，1支持，2不支持',
  `weather` tinyint(4) DEFAULT NULL COMMENT '天气插件 1 支持, 2 不支持',
  `voices` varchar(5000) DEFAULT NULL COMMENT '语音服务',
  `thirds` varchar(5000) DEFAULT NULL COMMENT '三方服务',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`app_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app功能配置';

-- ----------------------------
-- Table structure for t_oem_app_introduce
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_introduce`;
CREATE TABLE `t_oem_app_introduce` (
  `id` bigint(20) NOT NULL,
  `content` longtext COMMENT '内容',
  `content_url` varchar(255) DEFAULT NULL COMMENT 'URL内容(预留.暂时未用上)',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言',
  `status` smallint(1) DEFAULT NULL COMMENT '状态(1 已启用, 2 未启用,3 已失效)',
  `content_type` int(11) DEFAULT NULL COMMENT '文档类型(1 用户协议,2隐私政策,3关于我们,4 语音服务帮助文档)',
  `app_id` bigint(20) DEFAULT NULL,
  `app_key` varchar(50) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `voice_code` varchar(255) DEFAULT NULL COMMENT '语音帮助文档类型编码(alexa,天猫精灵,小爱等等)',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `abstract` varchar(500) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_oem_app_ios_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_ios_cert`;
CREATE TABLE `t_oem_app_ios_cert` (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `dist_provision` text COMMENT '发布证书描述',
  `dist_cert` text COMMENT '发布测试证书',
  `dist_cert_secret` varchar(64) DEFAULT NULL COMMENT '发布证书密钥',
  `dist_cert_official` text COMMENT '发布正式证书',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`app_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app ios证书';

-- ----------------------------
-- Table structure for t_oem_app_push_cert
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_push_cert`;
CREATE TABLE `t_oem_app_push_cert` (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `apns` text COMMENT 'apns证书，iOS专用',
  `jpush` text COMMENT '极光推送配置，存json',
  `fcm` text COMMENT '谷歌推送配置，存json',
  `huawei` text COMMENT '华为推送配置，存json',
  `xiaomi` text COMMENT '小米推送配置，存json',
  `vivo` text COMMENT 'vivo推送配置，存json',
  `oppo` text COMMENT 'oppo推送配置，存json',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`app_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app消息推送证书';

-- ----------------------------
-- Table structure for t_oem_app_template
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_template`;
CREATE TABLE `t_oem_app_template` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `name` varchar(50) NOT NULL COMMENT '中文名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `type` smallint(1) DEFAULT NULL COMMENT '模板类型（字典配置 app_template_type)',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `git_url` varchar(255) DEFAULT NULL COMMENT 'git仓库代码地址',
  `status` int(4) DEFAULT NULL COMMENT '状态（1=启用 2=禁用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `open_range_type` smallint(1) DEFAULT NULL COMMENT '开放范围类型（字典 open_range_type   1：公开，2：指定开发者）',
  `created_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_oem_app_ui_config
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_ui_config`;
CREATE TABLE `t_oem_app_ui_config` (
  `id` bigint(20) NOT NULL,
  `app_id` bigint(64) DEFAULT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标icon，1024*1024图oss URL',
  `ios_launch_screen` text COMMENT 'ios启动图，json串',
  `android_launch_screen` text COMMENT 'android启动图，json串',
  `theme_colors` text COMMENT '主题色，json串',
  `bottom_menu` text COMMENT '底部菜单栏，json串',
  `personalize` text COMMENT '个性化配置，json串',
  `room` text COMMENT '默认房间',
  `room_icons` text COMMENT '自定义房间图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`app_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放平台-oem app界面配置表';

-- ----------------------------
-- Table structure for t_oem_app_version_record
-- ----------------------------
DROP TABLE IF EXISTS `t_oem_app_version_record`;
CREATE TABLE `t_oem_app_version_record` (
  `app_id` bigint(64) NOT NULL COMMENT 't_opm_app主键id',
  `version` varchar(20) NOT NULL COMMENT '版本',
  `status` tinyint(4) DEFAULT NULL COMMENT '开发状态',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`app_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
