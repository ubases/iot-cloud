/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_config

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:31:09
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_config;

-- ----------------------------
-- Table structure for t_config_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_config_dict_data`;
CREATE TABLE `t_config_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(1000) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` int(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `firstletter` varchar(64) DEFAULT NULL COMMENT '首字母',
  `listimg` varchar(255) DEFAULT NULL COMMENT '图片',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9218708230342017025 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Table structure for t_config_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_config_dict_type`;
CREATE TABLE `t_config_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` int(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `value_type` int(4) NOT NULL COMMENT '1-整形，2-浮点,  3-字符串',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `is_system` smallint(1) DEFAULT NULL COMMENT '是否为系统参数 =1 是系统参数 =2 非系统参数。',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8793833814057975914 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Table structure for t_config_license
-- ----------------------------
DROP TABLE IF EXISTS `t_config_license`;
CREATE TABLE `t_config_license` (
  `id` bigint(20) NOT NULL,
  `belong_type` int(11) NOT NULL COMMENT '归属对象类型 =1 管理平台 =2 开发平台',
  `belong_id` bigint(20) NOT NULL COMMENT '归属对象ID',
  `machine_id` varchar(50) NOT NULL COMMENT '服务Mac地址',
  `license` varchar(255) NOT NULL COMMENT '许可证密文',
  `license_type` int(11) NOT NULL COMMENT '许可证型 =1一次性数量授权许可 =2年递增量授权许可',
  `agent_number` int(11) DEFAULT NULL COMMENT '许可数量',
  `surplusagent_number` int(11) DEFAULT NULL COMMENT '剩余数量',
  `type` int(11) DEFAULT NULL COMMENT '是否检查过期',
  `timeout` date DEFAULT NULL COMMENT '过期时间',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`,`belong_type`,`machine_id`,`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_config_oss
-- ----------------------------
DROP TABLE IF EXISTS `t_config_oss`;
CREATE TABLE `t_config_oss` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `region_id` bigint(20) DEFAULT NULL COMMENT '区域ID（t_config_area.id)',
  `access_key_id` varchar(50) DEFAULT NULL COMMENT 'oss配置access_key_id',
  `access_key_secret` varchar(100) DEFAULT NULL COMMENT 'oss配置AccessKeySecret',
  `role_arn` varchar(50) DEFAULT NULL COMMENT '角色Arn',
  `role_session_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `bucket` varchar(20) DEFAULT NULL COMMENT 'Bucket名称',
  `endpoint` varchar(20) DEFAULT NULL COMMENT '地域节点',
  `oss_name` varchar(20) DEFAULT NULL COMMENT 'OSS名称',
  `remark` varchar(255) DEFAULT NULL COMMENT 'OSS描述',
  `status` int(11) DEFAULT NULL COMMENT '启用状态 =1启用=0禁用',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_config_platform
-- ----------------------------
DROP TABLE IF EXISTS `t_config_platform`;
CREATE TABLE `t_config_platform` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `code` varchar(50) DEFAULT NULL COMMENT '平台配置编码码',
  `value` varchar(100) DEFAULT NULL COMMENT '平台配置值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_config_translate
-- ----------------------------
DROP TABLE IF EXISTS `t_config_translate`;
CREATE TABLE `t_config_translate` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `code` varchar(255) DEFAULT NULL COMMENT '名称',
  `en` varchar(255) DEFAULT NULL COMMENT '英文',
  `zh` varchar(255) DEFAULT NULL COMMENT '中文',
  `jp` varchar(255) DEFAULT NULL COMMENT '日文',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_config_translate_language
-- ----------------------------
DROP TABLE IF EXISTS `t_config_translate_language`;
CREATE TABLE `t_config_translate_language` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_area`;
CREATE TABLE `t_sys_area` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `level` int(3) unsigned DEFAULT '0' COMMENT '层级',
  `path` varchar(16) DEFAULT '' COMMENT '路径',
  `code` varchar(8) DEFAULT '' COMMENT '代码',
  `area_number` varchar(8) DEFAULT '' COMMENT '国家区号',
  `area_phone_number` varchar(8) DEFAULT '' COMMENT '国家电话区号',
  `abbreviation` varchar(16) DEFAULT '' COMMENT '国家缩写',
  `iso` varchar(16) DEFAULT '' COMMENT '时区',
  `chinese_name` varchar(64) DEFAULT '' COMMENT '中文名称',
  `english_name` varchar(64) DEFAULT '' COMMENT '英文名称',
  `pinyin` varchar(64) DEFAULT '' COMMENT '中文拼音',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4170 DEFAULT CHARSET=utf8 COMMENT='全球地区库，采集自腾讯QQ国内+国际版.ADD.JENA.20141221';

-- ----------------------------
-- Table structure for t_sys_region
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_region`;
CREATE TABLE `t_sys_region` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `code` varchar(30) NOT NULL COMMENT '地区编码',
  `name` varchar(30) NOT NULL COMMENT '地区名称',
  `level` int(11) NOT NULL COMMENT '地区级别[COUNTRY-国家, PROVINCE-省份, CITY-市, DISTRICT-区县 STREET-街道]',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `lat` decimal(10,0) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(10,0) DEFAULT NULL COMMENT '经度',
  `sid` bigint(20) DEFAULT NULL COMMENT '服务ID（t_sys_region_server.id)',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_region_server
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_region_server`;
CREATE TABLE `t_sys_region_server` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `sid` varchar(20) NOT NULL COMMENT '服务器唯一ID',
  `limited_count` int(11) NOT NULL COMMENT '设备连接最大数量',
  `binded_count` int(11) NOT NULL COMMENT '设备已连接数量',
  `mqtt_server` varchar(50) DEFAULT NULL COMMENT 'MQTT地址',
  `http_server` varchar(50) DEFAULT NULL COMMENT 'HTTP地址',
  `describe` varchar(20) DEFAULT NULL COMMENT '描述',
  `en_describe` varchar(128) DEFAULT NULL COMMENT '英文描述',
  `enabled` int(11) NOT NULL COMMENT '是否启用[0:否,1:是]',
  `lat` decimal(10,0) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(10,0) DEFAULT NULL COMMENT '经度',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `district` varchar(20) DEFAULT NULL COMMENT '地区',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器表';
