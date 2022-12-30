/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_lang

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:31:56
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_lang;

-- ----------------------------
-- Table structure for t_lang_app_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_app_resources`;
CREATE TABLE `t_lang_app_resources` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `source_table` varchar(2) DEFAULT NULL COMMENT '来源的表',
  `source_row_id` bigint(20) DEFAULT NULL COMMENT '来源的行id',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言分类',
  `field_name` varchar(20) DEFAULT NULL COMMENT '字段名',
  `field_type` int(11) DEFAULT NULL COMMENT '字段值的类型 string,properties',
  `field_value` varchar(50) DEFAULT NULL COMMENT '字段值',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_custom_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_custom_resources`;
CREATE TABLE `t_lang_custom_resources` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(6) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `app_id` bigint(20) DEFAULT NULL,
  `app_key` varchar(50) NOT NULL COMMENT 'APP应用编码',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言分类',
  `code` varchar(100) DEFAULT NULL COMMENT '字段名',
  `value` varchar(1000) DEFAULT NULL COMMENT '字段值',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `belong_type` int(11) DEFAULT NULL COMMENT '归属应用类型（=1平台 =2 开放平台 =3 APP）',
  `belong_id` bigint(20) DEFAULT NULL COMMENT '归属数据编号',
  `product_key` varchar(10) DEFAULT NULL COMMENT '产品Key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_custom_resource_record
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_custom_resource_record`;
CREATE TABLE `t_lang_custom_resource_record` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(6) DEFAULT NULL COMMENT '租户编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `app_key` varchar(50) DEFAULT NULL COMMENT 'APPkey',
  `oper_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `oper_type` int(11) DEFAULT NULL COMMENT '操作类型（=1导入 =2 导出）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_resources`;
CREATE TABLE `t_lang_resources` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `belong_type` int(11) DEFAULT NULL COMMENT '归属应用类型（=1平台 =2 开放平台 =3 APP）',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言分类',
  `code` varchar(100) DEFAULT NULL COMMENT '翻译编码',
  `value` varchar(1000) NOT NULL COMMENT '翻译内容',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `belong_id` bigint(20) DEFAULT NULL COMMENT '归属数据编号',
  `package_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_resource_package
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_resource_package`;
CREATE TABLE `t_lang_resource_package` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `belong_type` int(11) DEFAULT NULL COMMENT '归属应用类型（=1平台 =2 开放平台 =3 APP）',
  `package_name` varchar(50) DEFAULT NULL COMMENT '语言分类',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `belong_id` bigint(20) DEFAULT NULL COMMENT '归属数据编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_translate
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_translate`;
CREATE TABLE `t_lang_translate` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `source_table` varchar(64) DEFAULT NULL COMMENT '来源的表',
  `source_row_id` varchar(50) DEFAULT NULL COMMENT '来源的行id',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言分类',
  `field_name` varchar(20) DEFAULT NULL COMMENT '字段名',
  `field_type` int(11) DEFAULT NULL COMMENT '字段值的类型 string,properties',
  `field_value` varchar(500) DEFAULT NULL COMMENT '字段值',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `platform_type` tinyint(1) DEFAULT NULL COMMENT '平台类型 =1 云管平台 =2 开放平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_lang_translate_type
-- ----------------------------
DROP TABLE IF EXISTS `t_lang_translate_type`;
CREATE TABLE `t_lang_translate_type` (
  `id` bigint(20) NOT NULL COMMENT '唯一编号',
  `name` varchar(50) DEFAULT NULL COMMENT '中文描述',
  `code` varchar(20) DEFAULT NULL COMMENT '英文编码（作为编码使用）',
  `status` int(1) DEFAULT NULL COMMENT '1启用/0禁用',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
