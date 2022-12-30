/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_product

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:29:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_opm_control_panels
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_control_panels`;
CREATE TABLE `t_opm_control_panels` (
  `id` bigint(20) NOT NULL COMMENT '面板模板 - 唯一主键 ',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '面板名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '面板英文名称',
  `lang` varchar(36) DEFAULT NULL COMMENT '面板语言,预留',
  `desc` varchar(255) DEFAULT NULL COMMENT '面板描述',
  `url` varchar(255) DEFAULT NULL COMMENT '面板地址',
  `url_name` varchar(64) DEFAULT NULL COMMENT '面板文件名称',
  `panel_size` int(11) DEFAULT NULL COMMENT '面板大小',
  `preview_name` varchar(64) DEFAULT NULL COMMENT '预览图名称',
  `preview_url` varchar(255) DEFAULT NULL COMMENT '面板地址',
  `preview_size` int(11) DEFAULT NULL COMMENT '预览图大小',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品分类编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品品类编号',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_firmware
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_firmware`;
CREATE TABLE `t_opm_firmware` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `tenant_id` varchar(6) DEFAULT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `name` varchar(50) NOT NULL COMMENT '固件名称',
  `flag` varchar(50) DEFAULT NULL COMMENT '固件标识',
  `type` char(36) DEFAULT NULL COMMENT '固件类型',
  `flash_size` int(11) DEFAULT NULL COMMENT 'Flash大小',
  `upgrade_channel` int(4) DEFAULT NULL COMMENT '升级通道',
  `upgrade_overtime` int(4) DEFAULT NULL COMMENT '升级超时时间（秒）',
  `status` int(4) DEFAULT NULL COMMENT '状态（1=启用 2=禁用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_opm_firmware_pkg_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_firmware_pkg_relation`;
CREATE TABLE `t_opm_firmware_pkg_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `firmware_id` bigint(20) NOT NULL COMMENT '固件ID（t_opm_firmware.id）',
  `pkg_id` bigint(20) NOT NULL COMMENT '包ID（t_opm_ota_pkg.id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_firmware_version
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_firmware_version`;
CREATE TABLE `t_opm_firmware_version` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `firmware_id` bigint(50) NOT NULL COMMENT '固件SDK主键编号',
  `tenant_id` varchar(6) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL COMMENT '固件SDk版本号',
  `desc` varchar(500) DEFAULT NULL COMMENT '固件SDK版本描述',
  `status` int(11) DEFAULT NULL COMMENT '状态（1上架 2未上架）',
  `is_must` int(1) DEFAULT NULL COMMENT '是否必须',
  `upgrade_mode` int(1) DEFAULT NULL COMMENT '升级模式 =0  整包',
  `upgrade_file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `upgrade_file_path` varchar(255) DEFAULT NULL COMMENT '固件SDK版本文件',
  `upgrade_file_key` varchar(50) DEFAULT NULL COMMENT '固件SDK版本MD5值',
  `upgrade_file_size` int(10) DEFAULT NULL COMMENT '固件SDK版本包大小',
  `prod_file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `prod_file_path` varchar(255) DEFAULT NULL COMMENT '固件SDK版本文件',
  `prod_file_key` varchar(50) DEFAULT NULL COMMENT '固件SDK版本MD5值',
  `prod_file_size` int(10) DEFAULT NULL COMMENT '固件SDK版本包大小',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_opm_network_guide
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_network_guide`;
CREATE TABLE `t_opm_network_guide` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID（t_pm_product.id）',
  `product_type_id` bigint(20) NOT NULL COMMENT '品类ID（t_pm_product_type.id）',
  `type` tinyint(1) NOT NULL COMMENT '配网类型[0:AP配网,1:EZ配网,2:蓝牙配网]',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_network_guide_step
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_network_guide_step`;
CREATE TABLE `t_opm_network_guide_step` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `network_guide_id` bigint(20) NOT NULL COMMENT '配网引导ID（t_pm_device_network_guide.id）',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `instruction` varchar(200) NOT NULL COMMENT '中文文案',
  `instruction_en` varchar(200) NOT NULL COMMENT '英文文案',
  `image_url` varchar(200) NOT NULL COMMENT '图片地址',
  `video_url` varchar(200) DEFAULT NULL COMMENT '视频地址',
  `sort` int(11) NOT NULL COMMENT '排序',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_ota_pkg
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_ota_pkg`;
CREATE TABLE `t_opm_ota_pkg` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '开放平台产品ID（t_opm_product.id）',
  `product_key` varchar(16) NOT NULL COMMENT '开放平台产品唯一标识（t_opm_product.product_key）',
  `type` int(11) NOT NULL COMMENT '包类型[0:固件]',
  `firmware_id` bigint(20) DEFAULT NULL,
  `firmware_flag` varchar(50) DEFAULT NULL,
  `firmware_type` tinyint(1) DEFAULT NULL,
  `version_id` bigint(20) NOT NULL COMMENT '版本号编号',
  `version` varchar(20) DEFAULT NULL COMMENT '固件版本号',
  `upgrade_mode` int(11) NOT NULL COMMENT '升级方式[0:静默,1:提醒,2:强制]',
  `url` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '包路径',
  `status` int(11) NOT NULL COMMENT '状态[0:未验证,1:已验证,2:已发布,3:已暂停]',
  `is_auto` tinyint(1) NOT NULL COMMENT '是否自动升级[0:否 1:是]',
  `upgrade_desc` varchar(300) DEFAULT NULL COMMENT '升级文案（中文）',
  `upgrade_desc_en` varchar(300) DEFAULT NULL COMMENT '升级文案（英文）',
  `auto_start_at` varchar(20) DEFAULT NULL COMMENT '自动升级开始时间',
  `auto_end_at` varchar(20) DEFAULT NULL COMMENT '自动升级结束时间',
  `specified_version_mode` tinyint(1) DEFAULT NULL COMMENT '指定升级版本（模式选择 1全部版本 2指定版本）',
  `specified_version` varchar(20) DEFAULT NULL COMMENT '指定升级版本',
  `specified_area_mode` tinyint(1) DEFAULT NULL COMMENT '指定升级区域（模式选择 1全部区域 2指定区域）',
  `specified_area` varchar(20) DEFAULT NULL COMMENT '指定升级区域',
  `md5` varchar(100) DEFAULT NULL COMMENT '包MD5值',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `upgrade_time_mode` tinyint(1) DEFAULT '1' COMMENT '升级时间模式 =1 全天 =2 指定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_ota_publish
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_ota_publish`;
CREATE TABLE `t_opm_ota_publish` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `pkg_id` bigint(20) NOT NULL COMMENT '包id（t_opm_ota_pkg.id）',
  `publish_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `is_gray` tinyint(1) NOT NULL COMMENT '升级规模 =1  全量升级 =1 灰度升级 ',
  `status` tinyint(1) NOT NULL COMMENT '状态[0:待发布,1:已发布,2:已暂停]',
  `gray_type` tinyint(1) DEFAULT NULL COMMENT '灰度类型[0:按比例灰度, 1:按数量灰度]',
  `gray_scale` int(11) DEFAULT NULL COMMENT '灰度比例',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `is_auto` tinyint(1) NOT NULL COMMENT '是否自动升级[0:否 1:是]',
  `upgrade_desc` varchar(300) DEFAULT NULL COMMENT '升级文案（中文）',
  `upgrade_desc_en` varchar(300) DEFAULT NULL COMMENT '升级文案（英文）',
  `auto_start_at` varchar(20) DEFAULT NULL COMMENT '自动升级开始时间',
  `auto_end_at` varchar(20) DEFAULT NULL COMMENT '自动升级结束时间',
  `specified_version_mode` tinyint(1) DEFAULT NULL COMMENT '指定升级版本（模式选择 1全部版本 2指定版本）',
  `specified_version` varchar(20) DEFAULT NULL COMMENT '指定升级版本',
  `specified_area_mode` tinyint(1) DEFAULT NULL COMMENT '指定升级区域（模式选择 1全部区域 2指定区域）',
  `specified_area` varchar(20) DEFAULT NULL COMMENT '指定升级区域',
  `version_id` bigint(20) NOT NULL COMMENT '版本号编号',
  `version` varchar(20) DEFAULT NULL COMMENT '固件版本号',
  `upgrade_mode` int(11) NOT NULL COMMENT '升级方式[0:静默,1:提醒,2:强制]',
  `upgrade_time_mode` tinyint(1) DEFAULT '1' COMMENT '升级时间模式 =1 全天 =2 指定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_ota_publish_log
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_ota_publish_log`;
CREATE TABLE `t_opm_ota_publish_log` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `firmware_id` bigint(20) DEFAULT NULL COMMENT '固件编号',
  `pkg_id` bigint(20) NOT NULL COMMENT '包id（t_opm_ota_pkg.id）',
  `is_gray` tinyint(1) NOT NULL COMMENT '是否灰度发布 0：否，1：是',
  `gray_type` tinyint(1) DEFAULT NULL COMMENT '灰度类型[0:按比例灰度, 1:按数量灰度]',
  `gray_scale` int(11) DEFAULT NULL COMMENT '灰度比例',
  `type` int(11) NOT NULL COMMENT 'OTA类型[0:固件]',
  `version` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'OTA版本号',
  `did` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `status` tinyint(11) NOT NULL COMMENT '状态[0:升级成功, 1:升级失败]',
  `device_log` text COMMENT '设备日志',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_ota_record
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_ota_record`;
CREATE TABLE `t_opm_ota_record` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `pkg_id` bigint(20) NOT NULL COMMENT '包id（t_opm_ota_pkg.id）',
  `poduct_name` varchar(50) NOT NULL COMMENT '产品名称',
  `type` tinyint(4) NOT NULL COMMENT '类型[0:固件]',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `version` varchar(20) NOT NULL COMMENT '版本',
  `is_gray` tinyint(1) NOT NULL COMMENT '是否灰度发布 0:否, 1:是',
  `gray_type` tinyint(1) DEFAULT NULL COMMENT '灰度类型[0:按比例灰度, 1:按数量灰度]',
  `gray_scale` int(11) DEFAULT NULL COMMENT '灰度比例',
  `operate_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`pkg_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_ota_verify_log
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_ota_verify_log`;
CREATE TABLE `t_opm_ota_verify_log` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `type` int(11) NOT NULL COMMENT 'OTA类型[0:固件]',
  `version` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'OTA版本号',
  `did` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `status` tinyint(11) NOT NULL COMMENT '状态[0:升级成功, 1:升级失败]',
  `device_log` text COMMENT '设备日志',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_product
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_product`;
CREATE TABLE `t_opm_product` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品分类ID',
  `product_key` varchar(16) NOT NULL COMMENT '产品唯一标识',
  `name` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '产品品类名称',
  `name_en` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '产品品类名称（英文）',
  `identifier` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `model` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '产品品类型号',
  `image_url` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品品类图片',
  `wifi_flag` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'WIFI标识',
  `network_type` tinyint(1) NOT NULL COMMENT '通信协议（WIFI, BLE, WIFI+BLE）',
  `attribute_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '设备性质（0:直连设备，1：网关，2：网关子设备）',
  `power_consume_type` tinyint(1) NOT NULL COMMENT '功耗类型[0:标准功耗, 1:低功耗]',
  `status` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态（0:未开发, 1:已开发）',
  `is_virtual_test` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持虚拟测试（0：否，1：是）',
  `is_scheme` tinyint(1) NOT NULL COMMENT '是否开发方案[0:否 1:是]',
  `desc` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `product_type_name` varchar(100) DEFAULT NULL COMMENT '产品分类名称',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `base_product_id` bigint(20) NOT NULL COMMENT '产品品类ID',
  `control_panel_id` bigint(20) DEFAULT NULL COMMENT '面板编号',
  `module_id` bigint(20) DEFAULT NULL COMMENT '模组编号',
  `device_nature_key` int(10) DEFAULT NULL COMMENT '设备性质',
  `firmware_id` bigint(20) DEFAULT NULL COMMENT '固件编号',
  `firmware_version_id` bigint(20) DEFAULT NULL COMMENT '固件版本Id',
  `firmware_version` varchar(10) DEFAULT NULL COMMENT '固件版本号',
  `develop_mode` smallint(1) DEFAULT NULL COMMENT '开发模式 =1 MUC SDK =2 aithingsOS =3 零代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放平台-产品表';

-- ----------------------------
-- Table structure for t_opm_product_firmware_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_product_firmware_relation`;
CREATE TABLE `t_opm_product_firmware_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `firmware_id` bigint(20) NOT NULL COMMENT '固件ID(t_pm_firmware.id)',
  `is_custom` smallint(1) DEFAULT NULL COMMENT '是否自定义固件 =1 非自定义 =2 自定义固件',
  `firmware_version_id` bigint(20) DEFAULT NULL COMMENT '固件版本号',
  `firmware_version` varchar(20) DEFAULT NULL COMMENT '固件版本号',
  `firmware_key` varchar(50) DEFAULT NULL COMMENT '固件Key',
  `firmware_type` smallint(1) DEFAULT NULL COMMENT '固件类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_product_module_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_product_module_relation`;
CREATE TABLE `t_opm_product_module_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `module_id` bigint(20) NOT NULL COMMENT '模组ID(t_pm_module.id)',
  `firmware_id` bigint(20) NOT NULL COMMENT '固件ID(t_pm_firmware.id)',
  `is_custom` smallint(1) DEFAULT NULL COMMENT '是否自定义固件 =1 自定义 =2 非自定义固件',
  `firmware_version_id` bigint(20) DEFAULT NULL COMMENT '固件版本号',
  `firmware_version` varchar(20) DEFAULT NULL COMMENT '固件版本号',
  `firmware_key` varchar(50) DEFAULT NULL COMMENT '固件Key',
  `firmware_type` smallint(1) DEFAULT NULL COMMENT '固件类型',
  `product_key` varchar(20) NOT NULL COMMENT '产品Key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_product_panel_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_product_panel_relation`;
CREATE TABLE `t_opm_product_panel_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `control_panel_id` bigint(20) NOT NULL COMMENT '控制面板ID(t_pm_control_panel.id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_product_test_report
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_product_test_report`;
CREATE TABLE `t_opm_product_test_report` (
  `id` bigint(20) NOT NULL COMMENT '测试用例模板主键ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品品类编号',
  `test_type` int(1) DEFAULT NULL COMMENT '测试类型（1=基础测试）',
  `is_valid` int(1) NOT NULL COMMENT '是否有效',
  `file_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '测试用例模板文件',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `file_key` varchar(50) DEFAULT NULL COMMENT '文件MD5',
  `test_origin` int(1) DEFAULT NULL COMMENT '测试来源（=1自测）',
  `test_result` int(1) NOT NULL COMMENT '测试结果（1通过 2不通过）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_thing_model
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_thing_model`;
CREATE TABLE `t_opm_thing_model` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `product_id` bigint(50) DEFAULT NULL COMMENT '产品唯一标识',
  `standard` tinyint(1) NOT NULL COMMENT '是否标准品类 0-否 1-是',
  `version` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '物模型版本号',
  `description` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '物模型描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_thing_model_events
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_thing_model_events`;
CREATE TABLE `t_opm_thing_model_events` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品唯一标识',
  `create_ts` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '功能创建的时间戳，默认长度是13位。可手动传入也可由系统生成。功能定义会根据该时间由小到大进行排序。',
  `identifier` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `event_name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '事件名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `event_type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '事件类型。INFO_EVENT_TYPE：信息。ALERT_EVENT_TYPE：告警。ERROR_EVENT_TYPE：故障。',
  `outputdata` text CHARACTER SET utf8 COMMENT '服务的输出参数',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选服务。1：是, 0：否',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `std_id` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(4) DEFAULT NULL COMMENT '执行条件',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_thing_model_properties
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_thing_model_properties`;
CREATE TABLE `t_opm_thing_model_properties` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品唯一标识',
  `create_ts` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '功能创建的时间戳，默认长度是13位。可手动传入也可由系统生成。功能定义会根据该时间由小到大进行排序。',
  `identifier` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `data_type` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '属性值的数据类型。可选值：ARRAY、STRUCT、INT、FLOAT、DOUBLE、TEXT、DATE、JSON、ENUM、BOOL。不同数据类型，可传入的参数不同。',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '属性名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文字母或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `rw_flag` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '在云端可以对该属性进行的操作类型。READ_WRITE：读写。READ_ONLY：只读。WRITE_ONLY：只写。',
  `data_specs` text CHARACTER SET utf8 COMMENT '数据类型（dataType）为非列表型（INT、FLOAT、DOUBLE、TEXT、DATE、ARRAY）的数据规范存储在dataSpecs中',
  `data_specs_list` text CHARACTER SET utf8 COMMENT '数据类型（dataType）为列表型（ENUM、BOOL、STRUCT）的数据规范存储在dataSpecsList中',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选属性。1：是, 0：否',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `std_id` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(4) DEFAULT NULL COMMENT '执行条件',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_thing_model_services
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_thing_model_services`;
CREATE TABLE `t_opm_thing_model_services` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品唯一标识',
  `create_ts` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '功能创建的时间戳，默认长度是13位。可手动传入也可由系统生成。功能定义会根据该时间由小到大进行排序。',
  `identifier` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `service_name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '服务名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文字母或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `input_params` text CHARACTER SET utf8 COMMENT '服务的输入参数',
  `output_params` text CHARACTER SET utf8 COMMENT '服务的输出参数',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选服务。1：是, 0：否',
  `call_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务的调用方式。1：异步调用, 0：同步调用',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `tenant_id` varchar(6) NOT NULL COMMENT '租户id（t_open_company.tenant_id）',
  `std_id` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(4) DEFAULT NULL COMMENT '执行条件',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_opm_voice
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_voice`;
CREATE TABLE `t_opm_voice` (
  `id` bigint(20) NOT NULL COMMENT '语控id',
  `voice_no` varchar(100) DEFAULT NULL COMMENT '语控编码;xiaoai,tianmao,alex,google',
  `voice_name` varchar(50) DEFAULT NULL COMMENT '语控名称',
  `voice_category` text COMMENT '语控支持的品类;json字符串(暂留.后续使用)',
  `voice_doc` text COMMENT '参考文档;验证指导',
  `voice_logo` text COMMENT '语控图标',
  `voice_enable` int(11) DEFAULT '2' COMMENT '是否启用',
  `voice_desc` varchar(500) DEFAULT NULL COMMENT '语音平台描述',
  `voice_en_name` varchar(50) DEFAULT NULL COMMENT '语控英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_opm_voice_product
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_voice_product`;
CREATE TABLE `t_opm_voice_product` (
  `id` bigint(20) NOT NULL COMMENT '产品语控配置id;产品语控配置id',
  `product_key` varchar(100) DEFAULT NULL COMMENT '产品key',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `voice_no` varchar(50) DEFAULT NULL COMMENT '语控代码',
  `voice_name` varchar(50) DEFAULT NULL COMMENT '语控名称',
  `status` int(11) DEFAULT NULL COMMENT '状态;1 未配置,  2 开发中, 3 已发布',
  `voice_product_type` varchar(50) DEFAULT NULL COMMENT '语控对应的产品品类;必填.大家都有的',
  `voice_other` text COMMENT '语控其他对应关系;json字符串(比如:天猫的品牌名称,产品型号,技能id)',
  `tenant_id` varchar(50) DEFAULT NULL COMMENT '租户id',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_opm_voice_product_map
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_voice_product_map`;
CREATE TABLE `t_opm_voice_product_map` (
  `id` bigint(20) NOT NULL COMMENT '语控属性配置id;语控属性配置id',
  `voice_product_id` bigint(20) DEFAULT NULL COMMENT '产品语控配置id',
  `voice_no` varchar(50) DEFAULT NULL,
  `fun_name` varchar(100) DEFAULT NULL COMMENT '功能名称',
  `attr_code` varchar(100) DEFAULT NULL COMMENT '属性标识编码',
  `voice_code` varchar(100) DEFAULT NULL COMMENT '语控标识编码',
  `value_type` int(11) DEFAULT NULL COMMENT '值类型;1 数值范围  2 数值列表',
  `voice_demo` varchar(2000) DEFAULT NULL COMMENT '语控示例',
  `attr_unit` varchar(50) DEFAULT NULL COMMENT '属性单位',
  `voice_attr_unit` varchar(50) DEFAULT NULL COMMENT '语控属性单位',
  `attr_dpid` int(11) DEFAULT NULL COMMENT '功能的dpid',
  `value_map` text COMMENT '属性映射字符串',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `data_type` varchar(64) NOT NULL COMMENT '类型有INT、DOUBLE、TEXT、ENUM、BOOL等',
  `v_data_type` varchar(64) NOT NULL COMMENT '类型有INT、DOUBLE、TEXT、ENUM、BOOL等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_opm_voice_publish_record
-- ----------------------------
DROP TABLE IF EXISTS `t_opm_voice_publish_record`;
CREATE TABLE `t_opm_voice_publish_record` (
  `id` bigint(20) NOT NULL,
  `product_key` varchar(100) DEFAULT NULL COMMENT '产品key',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `voice_name` varchar(100) DEFAULT NULL COMMENT '语控名称',
  `attr_json` text COMMENT '发布的属性json',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `voice_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pm_control_panel
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_control_panel`;
CREATE TABLE `t_pm_control_panel` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `name` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '控制面板名称',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `tar_url` varchar(200) NOT NULL COMMENT '控制面板包地址',
  `image_url` varchar(200) NOT NULL COMMENT '预览图地址',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_control_panels
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_control_panels`;
CREATE TABLE `t_pm_control_panels` (
  `id` bigint(20) NOT NULL COMMENT '面板模板 - 唯一主键 ',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '面板名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '面板英文名称',
  `lang` varchar(36) DEFAULT NULL COMMENT '面板语言,预留',
  `desc` varchar(500) DEFAULT NULL COMMENT '面板描述',
  `url` varchar(255) DEFAULT NULL COMMENT '面板地址',
  `url_name` varchar(64) DEFAULT NULL COMMENT '面板文件名称',
  `panel_size` int(11) DEFAULT NULL COMMENT '面板大小',
  `panel_key` varchar(50) DEFAULT NULL,
  `preview_name` varchar(64) DEFAULT NULL COMMENT '预览图名称',
  `preview_url` varchar(255) DEFAULT NULL COMMENT '面板地址',
  `preview_size` int(11) DEFAULT NULL COMMENT '预览图大小',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品分类编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品品类编号',
  `status` int(11) DEFAULT NULL COMMENT '状态（1=启用 2=禁用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `has_lang_package` tinyint(1) DEFAULT NULL COMMENT '有语言包',
  `lang_file_name` varchar(200) DEFAULT NULL COMMENT '语言文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_firmware
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_firmware`;
CREATE TABLE `t_pm_firmware` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `name` varchar(50) NOT NULL COMMENT '固件名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `flag` varchar(50) DEFAULT NULL COMMENT '固件标识',
  `type` char(36) DEFAULT NULL COMMENT '固件类型',
  `flash_size` int(11) DEFAULT NULL COMMENT 'Flash大小',
  `upgrade_channel` int(4) DEFAULT NULL COMMENT '升级通道',
  `upgrade_overtime` int(4) DEFAULT NULL COMMENT '升级超时时间（秒）',
  `status` int(4) DEFAULT NULL COMMENT '状态（1=启用 2=禁用）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_firmware_sdk
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_firmware_sdk`;
CREATE TABLE `t_pm_firmware_sdk` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `name` varchar(50) NOT NULL COMMENT '固件名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `flag` varchar(50) DEFAULT NULL COMMENT '固件标识',
  `type` char(36) DEFAULT NULL COMMENT '固件类型',
  `flash_size` int(11) DEFAULT NULL COMMENT 'Flash大小',
  `upgrade_channel` int(4) DEFAULT NULL COMMENT '升级通道',
  `upgrade_overtime` int(4) DEFAULT NULL COMMENT '升级超时时间（秒）',
  `status` int(4) DEFAULT NULL COMMENT '状态（1=启用 2=禁用）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_firmware_sdk_version
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_firmware_sdk_version`;
CREATE TABLE `t_pm_firmware_sdk_version` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `firmware_sdk_id` bigint(50) NOT NULL COMMENT '固件SDK主键编号',
  `version` varchar(20) DEFAULT NULL COMMENT '固件SDk版本号',
  `desc` varchar(255) DEFAULT NULL COMMENT '固件SDK版本描述',
  `status` int(11) DEFAULT NULL COMMENT '状态（1上架 2未上架）',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '固件SDK版本文件',
  `file_key` varchar(50) DEFAULT NULL COMMENT '固件SDK版本MD5值',
  `file_size` int(10) DEFAULT NULL COMMENT '固件SDK版本包大小',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_firmware_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_firmware_setting`;
CREATE TABLE `t_pm_firmware_setting` (
  `id` bigint(36) NOT NULL COMMENT '唯一主键',
  `module_id` varchar(50) NOT NULL COMMENT '芯片模组ID',
  `product_model` varchar(50) NOT NULL COMMENT '产品Model',
  `desc` varchar(50) DEFAULT NULL COMMENT '参数标题',
  `value` varchar(100) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(512) DEFAULT NULL COMMENT '参数备注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_firmware_version
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_firmware_version`;
CREATE TABLE `t_pm_firmware_version` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `firmware_id` bigint(50) NOT NULL COMMENT '固件SDK主键编号',
  `version` varchar(20) DEFAULT NULL COMMENT '固件SDk版本号',
  `desc` varchar(255) DEFAULT NULL COMMENT '固件SDK版本描述',
  `status` int(11) DEFAULT NULL COMMENT '状态（1上架 2未上架）',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '固件SDK版本文件',
  `file_key` varchar(50) DEFAULT NULL COMMENT '固件SDK版本MD5值',
  `file_size` int(10) DEFAULT NULL COMMENT '固件SDK版本包大小',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_module
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_module`;
CREATE TABLE `t_pm_module` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `module_name` varchar(50) NOT NULL COMMENT '模组芯片名称',
  `module_name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `firmware_type` char(36) DEFAULT NULL COMMENT '固件类型',
  `firmware_flag` varchar(50) DEFAULT NULL COMMENT '固件标识',
  `firmware_id` bigint(20) DEFAULT NULL COMMENT '固件编号',
  `status` int(10) DEFAULT NULL COMMENT '状态（=1启用 =2 禁用）',
  `img_url` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `file_url` varchar(255) DEFAULT NULL COMMENT '操作说明',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  `file_name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `default_version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_module_firmware_version
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_module_firmware_version`;
CREATE TABLE `t_pm_module_firmware_version` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `module_id` bigint(20) DEFAULT NULL COMMENT '模组编号',
  `version_id` bigint(20) DEFAULT NULL COMMENT '固件编号',
  `version` varchar(20) DEFAULT NULL COMMENT '固件版本号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pm_network_guide
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_network_guide`;
CREATE TABLE `t_pm_network_guide` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID（t_pm_product.id）',
  `product_type_id` bigint(20) NOT NULL COMMENT '品类ID（t_pm_product_type.id）',
  `type` tinyint(1) NOT NULL COMMENT '配网类型[0:AP配网,1:EZ配网,2:蓝牙配网]',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_network_guide_step
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_network_guide_step`;
CREATE TABLE `t_pm_network_guide_step` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `network_guide_id` bigint(20) NOT NULL COMMENT '配网引导ID（t_pm_device_network_guide.id）',
  `instruction` varchar(200) NOT NULL COMMENT '中文文案',
  `instruction_en` varchar(200) NOT NULL COMMENT '英文文案',
  `image_url` varchar(200) NOT NULL COMMENT '图片地址',
  `video_url` varchar(200) DEFAULT NULL COMMENT '视频地址',
  `sort` int(11) NOT NULL COMMENT '排序',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除标识（0-正常 1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_product
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_product`;
CREATE TABLE `t_pm_product` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品品类ID',
  `product_key` varchar(16) NOT NULL COMMENT '产品品类唯一标识',
  `name` varchar(128) NOT NULL COMMENT '产品品类名称',
  `name_en` varchar(128) NOT NULL COMMENT '产品品类名称（英文）',
  `identifier` varchar(50) NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `model` varchar(50) NOT NULL COMMENT '产品品类型号',
  `image_url` varchar(256) DEFAULT NULL COMMENT '产品品类图片',
  `wifi_flag` varchar(4) NOT NULL COMMENT 'WIFI标识',
  `network_type` tinyint(1) NOT NULL COMMENT '通信协议（WIFI, BLE, WIFI+BLE）',
  `attribute_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '设备性质（0:普通设备，1：网关设备）',
  `power_consume_type` tinyint(1) NOT NULL COMMENT '功耗类型[0:标准功耗, 1:低功耗]',
  `status` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态（0：未发布，1：已发布，2：停用）',
  `is_virtual_test` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持虚拟测试（0：否，1：是）',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `product_type_name` varchar(100) DEFAULT NULL COMMENT '产品分类名称',
  `product_type_id_path` varchar(100) NOT NULL COMMENT '产品分类ID路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Table structure for t_pm_product_firmware_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_product_firmware_relation`;
CREATE TABLE `t_pm_product_firmware_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `firmware_id` bigint(20) NOT NULL COMMENT '固件SDK ID(t_pm_firmware_sdk.id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_product_module_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_product_module_relation`;
CREATE TABLE `t_pm_product_module_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `module_id` bigint(20) NOT NULL COMMENT '模组ID(t_pm_module.id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_product_panel_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_product_panel_relation`;
CREATE TABLE `t_pm_product_panel_relation` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_pm_product.id)',
  `control_panel_id` bigint(20) NOT NULL COMMENT '控制面板ID(t_pm_control_panel.id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_product_type
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_product_type`;
CREATE TABLE `t_pm_product_type` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `parent_id` bigint(20) NOT NULL COMMENT '父ID',
  `name` varchar(32) NOT NULL COMMENT '产品分类名称',
  `name_en` varchar(32) NOT NULL COMMENT '产品分类名称（英文）',
  `identifier` varchar(50) NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `sort` int(11) NOT NULL COMMENT '排序',
  `standard` tinyint(1) NOT NULL COMMENT '是否标准物模型[0:否 1:是]',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `img_size` bigint(20) DEFAULT NULL COMMENT '图片大小，单位B',
  `img_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `img_full_path` varchar(255) DEFAULT NULL COMMENT '图片完整路径',
  `img_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `img_key` varchar(40) DEFAULT NULL COMMENT '图片MD5',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品品类表';

-- ----------------------------
-- Table structure for t_pm_thing_model
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_thing_model`;
CREATE TABLE `t_pm_thing_model` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `product_key` varchar(50) DEFAULT NULL COMMENT '产品唯一标识',
  `product_type_id` bigint(20) NOT NULL COMMENT '产品品类ID（t_pm_product_type.id）',
  `standard` tinyint(1) NOT NULL COMMENT '是否标准物模型 0-否 1-是',
  `version` varchar(10) NOT NULL COMMENT '物模型版本号',
  `description` varchar(64) DEFAULT NULL COMMENT '物模型描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_thing_model_events
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_thing_model_events`;
CREATE TABLE `t_pm_thing_model_events` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_key` varchar(50) DEFAULT NULL COMMENT '产品唯一标识',
  `identifier` varchar(50) NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `event_name` varchar(64) NOT NULL COMMENT '事件名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `event_type` varchar(20) NOT NULL COMMENT '事件类型。INFO_EVENT_TYPE：信息。ALERT_EVENT_TYPE：告警。ERROR_EVENT_TYPE：故障。',
  `outputdata` text COMMENT '服务的输出参数',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选服务。1：是, 0：否',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  `desc` varchar(256) DEFAULT NULL COMMENT '功能描述',
  `trigger_cond` tinyint(1) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(1) DEFAULT NULL COMMENT '执行条件',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `std_id` bigint(20) DEFAULT NULL COMMENT '对应标准物模型ID',
  `valid` tinyint(1) DEFAULT '0' COMMENT '是否有效，0无效，1有效',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_thing_model_item
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_thing_model_item`;
CREATE TABLE `t_pm_thing_model_item` (
  `id` bigint(20) NOT NULL,
  `product_type_id` bigint(20) NOT NULL,
  `dpid` smallint(6) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `rw_flag` varchar(16) NOT NULL,
  `data_type` varchar(16) NOT NULL,
  `properties` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type_dpid` (`product_type_id`,`dpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_thing_model_properties
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_thing_model_properties`;
CREATE TABLE `t_pm_thing_model_properties` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_key` varchar(50) DEFAULT NULL COMMENT '产品唯一标识',
  `identifier` varchar(50) NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `data_type` varchar(64) NOT NULL COMMENT '属性值的数据类型。可选值：ARRAY、STRUCT、INT、FLOAT、DOUBLE、TEXT、DATE、JSON、ENUM、BOOL。不同数据类型，可传入的参数不同。',
  `name` varchar(30) NOT NULL COMMENT '属性名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文字母或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `rw_flag` varchar(10) NOT NULL COMMENT '在云端可以对该属性进行的操作类型。READ_WRITE：读写。READ_ONLY：只读。WRITE_ONLY：只写。',
  `data_specs` text COMMENT '数据类型（dataType）为非列表型（INT、FLOAT、DOUBLE、TEXT、DATE、ARRAY）的数据规范存储在dataSpecs中',
  `data_specs_list` text COMMENT '数据类型（dataType）为列表型（ENUM、BOOL、STRUCT）的数据规范存储在dataSpecsList中',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选属性。1：是, 0：否',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  `desc` varchar(256) DEFAULT NULL COMMENT '功能描述',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(4) DEFAULT NULL COMMENT '执行条件',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `std_id` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '0',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pm_thing_model_services
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_thing_model_services`;
CREATE TABLE `t_pm_thing_model_services` (
  `id` bigint(20) NOT NULL COMMENT '主键（雪花算法19位）',
  `model_id` bigint(20) NOT NULL COMMENT '物模型ID(t_pm_thing_model.id)',
  `product_key` varchar(50) DEFAULT NULL COMMENT '产品唯一标识',
  `identifier` varchar(50) NOT NULL COMMENT '属性的标识符。可包含大小写英文字母、数字、下划线（_），长度不超过50个字符。',
  `service_name` varchar(64) NOT NULL COMMENT '服务名称。可包含中文、大小写英文字母、数字、短划线（-）、下划线（_）和半角句号（.），且必须以中文、英文字母或数字开头，长度不超过30个字符，一个中文计为一个字符。',
  `input_params` text COMMENT '服务的输入参数',
  `output_params` text COMMENT '服务的输出参数',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是标准品类的必选服务。1：是, 0：否',
  `call_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务的调用方式。1：异步调用, 0：同步调用',
  `custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是自定义功能。1：是, 0：否',
  `extension` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  `desc` varchar(256) DEFAULT NULL COMMENT '功能描述',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `exec_cond` tinyint(4) DEFAULT NULL COMMENT '执行条件',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `std_id` bigint(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '0',
  `dpid` smallint(6) DEFAULT NULL COMMENT 'dpid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tpl_testcase_template
-- ----------------------------
DROP TABLE IF EXISTS `t_tpl_testcase_template`;
CREATE TABLE `t_tpl_testcase_template` (
  `id` bigint(20) NOT NULL COMMENT '测试用例模板主键ID',
  `product_type_id` bigint(20) DEFAULT NULL COMMENT '产品类型编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品品类编号',
  `lang` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `tpl_code` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '模板编码',
  `tpl_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '模板名称',
  `tpl_file` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '测试用例模板文件',
  `tpl_file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `tpl_file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `tpl_desc` varchar(255) DEFAULT NULL COMMENT '模板描述',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `status` int(1) NOT NULL COMMENT '状态（1启用 0禁用）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Function structure for getProductTypeFullName
-- ----------------------------
DROP FUNCTION IF EXISTS `getProductTypeFullName`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getProductTypeFullName`(`id` BIGINT(20)) RETURNS varchar(512) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    READS SQL DATA
BEGIN
	DECLARE fullName VARCHAR(1000);
	DECLARE parentId BIGINT(20);
	DECLARE parentName VARCHAR(1000);

	SET fullName = (SELECT a.name FROM t_pm_product_type a WHERE a.id = id);
	SET parentId = (SELECT a.parent_id FROM t_pm_product_type a WHERE a.id = id);

	WHILE parentId <> 0 DO
	SET parentName = (SELECT a.name FROM t_pm_product_type a WHERE a.id = parentId);
	SET fullName = CONCAT(parentName,"/",fullName);
	SET parentId = (SELECT a.parent_id FROM t_pm_product_type a WHERE a.id = parentId);
	END WHILE;
	RETURN fullName;
END
;;
DELIMITER ;
