/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_document

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:31:38
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_document;

-- ----------------------------
-- Table structure for t_cms_document
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_document`;
CREATE TABLE `t_cms_document` (
  `id` bigint(20) NOT NULL COMMENT '文档id',
  `platform_type` int(1) NOT NULL COMMENT '平台类型（1云平台、2开放平台、3app）',
  `type_id` bigint(20) NOT NULL COMMENT '文档类型id',
  `lang` varchar(20) DEFAULT 'zh' COMMENT '语言',
  `code` varchar(50) DEFAULT '' COMMENT '编码',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `abstract` varchar(255) DEFAULT '' COMMENT '摘要',
  `author` varchar(50) DEFAULT NULL,
  `content_type` int(1) DEFAULT '2' COMMENT '类型（=1 文件路径(file_path) =2 内容（content） =3 图片列表（t_cms_document_images））',
  `content` text COMMENT '内容',
  `nohelpcount` int(11) DEFAULT '0' COMMENT '踩的数量',
  `helpfulcount` int(11) DEFAULT '0' COMMENT '点赞数量',
  `istop` int(1) DEFAULT '0' COMMENT '是否置顶',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_document_files
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_document_files`;
CREATE TABLE `t_cms_document_files` (
  `id` bigint(20) NOT NULL COMMENT '文档id',
  `document_id` bigint(20) NOT NULL COMMENT '文档类型id',
  `file_title` varchar(200) DEFAULT NULL COMMENT '内容描述',
  `file_type` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_size` double DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_document_images
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_document_images`;
CREATE TABLE `t_cms_document_images` (
  `id` bigint(20) NOT NULL COMMENT '文档id',
  `document_id` bigint(20) NOT NULL COMMENT '文档类型id',
  `img_title` varchar(200) DEFAULT NULL COMMENT '内容描述',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_document_type
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_document_type`;
CREATE TABLE `t_cms_document_type` (
  `id` bigint(20) NOT NULL COMMENT '分类id',
  `platform_type` int(1) DEFAULT NULL COMMENT '平台类型（1云平台、2开放平台、3app）',
  `parent_id` varchar(255) DEFAULT 'zh' COMMENT '父级分类id',
  `title` varchar(255) DEFAULT '' COMMENT '分类标题',
  `sortno` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_introduce
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_introduce`;
CREATE TABLE `t_cms_introduce` (
  `id` bigint(20) NOT NULL,
  `platformType` smallint(1) DEFAULT NULL COMMENT '平台类型 =1 云管平台 =2 开放平台 =3 APP',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  `content_mode` smallint(1) DEFAULT NULL COMMENT '内容模式 =0 内容 =1 url',
  `content` longtext COMMENT '内容',
  `content_url` varchar(255) DEFAULT NULL COMMENT 'URL内容',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言',
  `status` smallint(1) DEFAULT NULL COMMENT '状态',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_question
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_question`;
CREATE TABLE `t_cms_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `origin_channel` int(1) DEFAULT NULL COMMENT '来源渠道',
  `type_id` bigint(20) NOT NULL COMMENT '分类id',
  `lang` varchar(255) DEFAULT 'zh' COMMENT '语言',
  `istop` int(1) DEFAULT '0' COMMENT '是否置顶',
  `product_key` varchar(50) DEFAULT NULL COMMENT '产品Key',
  `helpfulcount` int(11) DEFAULT '0' COMMENT '点赞数量',
  `nohelpcount` int(11) DEFAULT '0' COMMENT '踩的数量',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `abstract` varchar(255) DEFAULT '' COMMENT '摘要',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `content` text COMMENT '内容',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_cms_question_type
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_question_type`;
CREATE TABLE `t_cms_question_type` (
  `id` bigint(20) NOT NULL COMMENT '分类id',
  `parent_id` varchar(255) DEFAULT 'zh' COMMENT '父级分类id',
  `title` varchar(255) DEFAULT '' COMMENT '分类标题',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_product_help_conf
-- ----------------------------
DROP TABLE IF EXISTS `t_product_help_conf`;
CREATE TABLE `t_product_help_conf` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id',
  `product_name` varchar(128) NOT NULL COMMENT '产品品类名称',
  `product_key` varchar(16) NOT NULL COMMENT '产品唯一标识',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品分类ID',
  `langs` text COMMENT '文档对应的语种(json格式字符串)',
  `remain_lang` varchar(50) DEFAULT NULL COMMENT '兜底语种编码',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '状态（1:已启用, 2:禁用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_phc_tenantid` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_product_help_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_product_help_doc`;
CREATE TABLE `t_product_help_doc` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id',
  `product_key` varchar(16) NOT NULL COMMENT '产品唯一标识',
  `lang` varchar(50) DEFAULT NULL COMMENT '语种编码',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `relation_id` bigint(20) DEFAULT '0' COMMENT '关联id',
  `sort_id` bigint(20) DEFAULT '0' COMMENT '排序id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（1:已启用, 2:禁用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_tpl_document_template
-- ----------------------------
DROP TABLE IF EXISTS `t_tpl_document_template`;
CREATE TABLE `t_tpl_document_template` (
  `id` bigint(20) NOT NULL COMMENT '文档模板唯一主键',
  `tpl_code` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '模板编码',
  `tpl_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '模板名称',
  `tpl_content` text CHARACTER SET utf8 COMMENT '模板内容',
  `tpl_params` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '模板参数',
  `lang` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `tpl_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '模板类型（字典配置，取字典的code）',
  `status` int(1) NOT NULL COMMENT '状态（1启用 0禁用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_tpl_document_template_field
-- ----------------------------
DROP TABLE IF EXISTS `t_tpl_document_template_field`;
CREATE TABLE `t_tpl_document_template_field` (
  `id` bigint(20) NOT NULL COMMENT '模板字段',
  `tpl_type` int(11) DEFAULT NULL COMMENT '模板类型',
  `tpl_id` bigint(20) DEFAULT NULL COMMENT '对应模板对象的编号',
  `field_name` varchar(64) DEFAULT NULL COMMENT '字段名称',
  `field_code` varchar(64) DEFAULT NULL COMMENT '字段的占位符 默认：{{{xxxxx}}}',
  `field_desc` varchar(100) DEFAULT NULL COMMENT '字段的描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
