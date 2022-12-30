/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_device

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:31:20
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_device;

-- ----------------------------
-- Table structure for t_iot_device_countdown
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_countdown`;
CREATE TABLE `t_iot_device_countdown` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `hour` varchar(2) DEFAULT NULL COMMENT '小时',
  `minute` varchar(2) DEFAULT NULL COMMENT '分钟',
  `remark` varchar(200) DEFAULT NULL COMMENT '定时器描述',
  `func_key` varchar(50) DEFAULT NULL,
  `func_value` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `device_id` varchar(16) DEFAULT NULL COMMENT '设备编号',
  `enabled` smallint(6) DEFAULT NULL COMMENT '定时器状态（=1启动 =2 禁用）',
  `total_second` int(11) DEFAULT NULL COMMENT '总秒数',
  `execution_time` datetime DEFAULT NULL COMMENT '执行时间',
  `task_id` varchar(64) DEFAULT NULL COMMENT '任务编号',
  `cron` varchar(255) DEFAULT NULL COMMENT 'cron表达式，自动生成',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_fault
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_fault`;
CREATE TABLE `t_iot_device_fault` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `device_id` bigint(20) NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `device_key` varchar(20) DEFAULT NULL COMMENT '设备key',
  `device_name` varchar(40) DEFAULT NULL COMMENT '设备名称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `product_name` varchar(64) DEFAULT NULL COMMENT '冗余产品名称',
  `fault_code` varchar(50) DEFAULT NULL COMMENT '故障编号',
  `fault_name` varchar(100) DEFAULT NULL COMMENT '故障名称',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_group
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_group`;
CREATE TABLE `t_iot_device_group` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '群组名称',
  `room_id` bigint(20) DEFAULT NULL COMMENT '房间id',
  `room_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '房间名称',
  `home_id` bigint(20) DEFAULT NULL COMMENT '家庭id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `pic` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_iot_device_group_list
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_group_list`;
CREATE TABLE `t_iot_device_group_list` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '群组id',
  `dev_name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `dev_id` varchar(36) DEFAULT NULL COMMENT '设备唯一ID',
  `home_id` bigint(20) DEFAULT NULL COMMENT '家庭id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `product_key` varchar(14) DEFAULT NULL COMMENT '产品key',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_iot_device_home
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_home`;
CREATE TABLE `t_iot_device_home` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `home_id` bigint(20) NOT NULL,
  `device_id` longtext CHARACTER SET utf8 NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_key` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品Key',
  `custom_name` longtext,
  `bind_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom_pic` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `secrtkey` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备密钥',
  `add_method` int(11) DEFAULT NULL COMMENT '添加方式 1-用户自己添加',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_iot_device_info
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_info`;
CREATE TABLE `t_iot_device_info` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `did` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID(t_cloud_product.id)',
  `product_key` varchar(14) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品key',
  `online_status` int(1) DEFAULT NULL COMMENT '在线状态（0 在线 1 不在线）',
  `device_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备名称',
  `device_nature` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备性质',
  `sn` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备SN',
  `batch_id` bigint(20) DEFAULT NULL COMMENT '批次ID(t_cloud_device_batch.id)',
  `group_id` bigint(20) DEFAULT NULL COMMENT '设备组ID（t_cloud_device_group.id）',
  `device_model` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备型号',
  `user_name` varchar(14) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `passward` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备密码',
  `salt` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '盐值',
  `device_secret_http` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备密钥（http）',
  `device_secret_mqtt` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备密钥（mqtt）',
  `ip_address` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ip地址',
  `lat` decimal(20,6) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(20,6) DEFAULT NULL COMMENT '经度',
  `country` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '国家编码',
  `province` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '省份编码',
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市编码',
  `district` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地区编码',
  `last_activated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后激活时间',
  `activated_time` timestamp NULL DEFAULT NULL COMMENT '激活时间',
  `mac_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'mac地址',
  `device_version` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备版本',
  `active_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '激活状态[0:未激活,1:已激活]',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `active_user_id` bigint(20) DEFAULT NULL COMMENT '激活用户编号',
  `active_user_name` varchar(100) DEFAULT NULL COMMENT '激活用户名称',
  `tenant_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '租户编号',
  `app_key` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'APP Key',
  `active_channel` tinyint(1) DEFAULT NULL COMMENT '激活渠道',
  `module_version` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '模组版本',
  `sid` bigint(20) DEFAULT NULL COMMENT '绑定服务地址',
  `use_type` smallint(1) DEFAULT '0' COMMENT '使用类型（=1 虚拟测试设备）',
  PRIMARY KEY (`id`),
  KEY `index_iot_device_info_did` (`did`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_iot_device_log
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_log`;
CREATE TABLE `t_iot_device_log` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `did` varchar(16) NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `report_time` timestamp NULL DEFAULT NULL COMMENT '产品ID(t_cloud_product.id)',
  `event_type` int(1) DEFAULT NULL COMMENT '在线状态（0 在线 1 不在线）',
  `func_key` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `func_value` varchar(100) DEFAULT NULL COMMENT '设备性质',
  `func_desc` varchar(100) DEFAULT NULL COMMENT '设备SN',
  `origin_type` int(11) DEFAULT NULL COMMENT '批次ID(t_cloud_device_batch.id)',
  `origin_detail` varchar(255) DEFAULT NULL COMMENT '设备组ID（t_cloud_device_group.id）',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_shared
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_shared`;
CREATE TABLE `t_iot_device_shared` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `custom_name` longtext COMMENT '设备名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '共享用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '共享用户手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '共享用户邮箱',
  `device_id` varchar(36) DEFAULT NULL COMMENT '设备id',
  `home_id` bigint(20) DEFAULT NULL COMMENT '设备归属家庭',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `sid` bigint(20) DEFAULT NULL COMMENT '服务器唯一ID',
  `belong_user_id` bigint(20) DEFAULT NULL COMMENT '设备归属用户ID',
  `belong_user_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '设备归属用户昵称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `product_key` varchar(14) DEFAULT NULL COMMENT '产品key',
  `product_pic` varchar(256) DEFAULT NULL COMMENT '产品品类图片',
  `shared_time` timestamp NULL DEFAULT NULL COMMENT '共享时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_share_receive
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_share_receive`;
CREATE TABLE `t_iot_device_share_receive` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `custom_name` longtext COMMENT '设备名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '共享用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '共享用户手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '共享用户邮箱',
  `device_id` varchar(36) DEFAULT NULL COMMENT '设备id',
  `belong_user_id` bigint(20) DEFAULT NULL COMMENT '设备归属用户ID',
  `belong_user_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '设备归属用户昵称',
  `home_id` bigint(20) DEFAULT NULL COMMENT '设备归属家庭',
  `room_id` bigint(20) DEFAULT NULL COMMENT '设备归属房间',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `product_key` varchar(14) DEFAULT NULL COMMENT '产品key',
  `product_pic` varchar(256) DEFAULT NULL COMMENT '产品品类图片',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `is_agree` int(11) DEFAULT NULL COMMENT '1-未同意,2-已同意',
  `shared_time` timestamp NULL DEFAULT NULL COMMENT '共享时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_timer
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_timer`;
CREATE TABLE `t_iot_device_timer` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `hour` varchar(2) DEFAULT NULL COMMENT '小时',
  `minute` varchar(2) DEFAULT NULL COMMENT '分钟',
  `days_mode` smallint(1) DEFAULT NULL COMMENT '重复不重复模式',
  `weeks` varchar(20) DEFAULT NULL COMMENT '周，逗号分割  1,2,3,4,5,6,0',
  `remark` varchar(255) DEFAULT NULL COMMENT '定时器描述',
  `func_key` varchar(255) DEFAULT NULL,
  `func_value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `device_id` varchar(16) DEFAULT NULL COMMENT '设备编号',
  `enabled` smallint(6) DEFAULT NULL COMMENT '定时器状态（=1启动 =2 禁用）',
  `first_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '首次时间',
  `cron` varchar(255) DEFAULT NULL COMMENT 'cron表达式，自动生成',
  `task_id` varchar(64) DEFAULT NULL COMMENT '任务编号',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_device_triad
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_device_triad`;
CREATE TABLE `t_iot_device_triad` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(20) DEFAULT NULL COMMENT '租户编号',
  `serial_number` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '开发者用户',
  `did` varchar(36) NOT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key 产品的唯一标识',
  `user_name` varchar(14) DEFAULT NULL COMMENT '用户名',
  `passward` varchar(50) DEFAULT NULL COMMENT '设备密码',
  `status` int(1) DEFAULT NULL COMMENT '三元组使用状态（=1已使用=0未使用）',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐值',
  `device_secret` varchar(20) DEFAULT NULL COMMENT '设备密钥（http）设备配网激活上报的密钥',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `use_type` smallint(1) DEFAULT '0' COMMENT '使用类型（=1 真实测试设备 =2 虚拟测试设备）',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `device_nature_key` smallint(1) DEFAULT NULL COMMENT '设备性质（1:直连设备，2：网关，3：网关子设备）',
  `is_test` smallint(1) DEFAULT '0' COMMENT '是否测试设备',
  `app_name` varchar(100) DEFAULT NULL COMMENT '冗余APP名称',
  `user_account` varchar(100) DEFAULT NULL COMMENT '冗余账号名称',
  `batch_id` int(6) DEFAULT NULL COMMENT '批次号',
  `app_key` varchar(50) DEFAULT NULL COMMENT '冗余APPKey',
  PRIMARY KEY (`id`),
  KEY `index_iot_device_triad_did` (`did`) USING BTREE,
  KEY `index_iot_device_triad_usertype` (`tenant_id`,`product_id`,`use_type`,`is_test`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_job
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_job`;
CREATE TABLE `t_iot_job` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_key` varchar(14) DEFAULT NULL COMMENT '产品key',
  `device_id` varchar(36) DEFAULT NULL COMMENT '设备唯一ID（14位 1~9 A~Z随机）',
  `task_id` bigint(20) NOT NULL COMMENT '任务编号',
  `task_type` smallint(6) DEFAULT NULL COMMENT '任务类型（1 倒计时任务 2 定时任务）',
  `enabled` smallint(6) DEFAULT NULL COMMENT '定时器状态（=1启动 =2 禁用）',
  `cron` varchar(255) DEFAULT NULL COMMENT 'cron表达式，自动生成',
  `data` text COMMENT '任务数据',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_ota_pkg
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_pkg`;
CREATE TABLE `t_iot_ota_pkg` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `type` int(11) NOT NULL COMMENT '包类型[0:固件,1:MCU]',
  `name` varchar(50) NOT NULL COMMENT '包名称',
  `version` varchar(20) NOT NULL COMMENT '包版本号',
  `upgrade_mode` int(11) NOT NULL COMMENT '升级方式[0:静默,1:提醒,2:强制]',
  `url` varchar(255) DEFAULT NULL COMMENT '包路径',
  `key_version_flag` int(11) DEFAULT NULL COMMENT '关键版本标识[0:否,1:是]',
  `system_type` int(11) DEFAULT NULL COMMENT '系统类型[0:整包,1:差分]',
  `minimum_ecu_required` varchar(20) DEFAULT NULL COMMENT '可升级固件最低版本',
  `minimum_mcu_required` varchar(20) DEFAULT NULL COMMENT '可升级MCU最低版本',
  `status` int(11) DEFAULT NULL COMMENT '状态[0:未验证,1:已验证,2:已发布]',
  `upload_time` date DEFAULT NULL COMMENT '上传时间',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备OTA升级包表';

-- ----------------------------
-- Table structure for t_iot_ota_upgrade_record
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_upgrade_record`;
CREATE TABLE `t_iot_ota_upgrade_record` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `version` varchar(20) DEFAULT NULL COMMENT '升级版本号',
  `publish_id` bigint(20) DEFAULT NULL COMMENT '推送编号',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品key',
  `device_id` varchar(20) NOT NULL COMMENT '设备编号',
  `original_version` varchar(20) DEFAULT NULL COMMENT '设备原始版本',
  `status` int(11) NOT NULL COMMENT '升级状态[1:升级中,2:升级成功,3:升级暂停,4:升级失败]',
  `is_gray` int(11) NOT NULL COMMENT '是否灰度发布 0：否，1：是',
  `tenant_id` varchar(20) DEFAULT NULL COMMENT '租户编号',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `ota_state` varchar(50) DEFAULT NULL COMMENT 'Downloading,Installing',
  `ota_code` smallint(1) DEFAULT NULL COMMENT '0： 表示OTA成功；1：表示下载失败；2：表示安装失败；3：协议数据错误；4：OTA数据包错误',
  `ota_progress` int(3) DEFAULT NULL COMMENT 'OTA上报的进度',
  `area_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_iot_ota_version
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_version`;
CREATE TABLE `t_iot_ota_version` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `device_version` varchar(20) NOT NULL COMMENT '设备大版本号',
  `mcu_pkg_id` bigint(20) DEFAULT NULL COMMENT 'MCU包ID(t_cloud_ota_pkg.id)',
  `ecu_pkg_id` bigint(20) DEFAULT NULL COMMENT 'ECU包ID(t_cloud_ota_pkg.id)',
  `upgrade_mode` int(11) NOT NULL COMMENT '升级方式[0:非强制升级,1:强制升级]',
  `status` int(11) NOT NULL COMMENT '状态[0:未验证,1:已验证,2:已发布,3:待发布,4:已撤销]',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备OTA版本表';

-- ----------------------------
-- Table structure for t_iot_ota_version_publish
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_version_publish`;
CREATE TABLE `t_iot_ota_version_publish` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `version_id` bigint(20) NOT NULL COMMENT '大版本ID(t_cloud_ota_version.id)',
  `publish_mode` int(11) NOT NULL COMMENT '发布模式[0:立即发布,1:定时发布]',
  `schedule_time` date NOT NULL COMMENT '定时时间',
  `publish_time` date NOT NULL COMMENT '发布时间',
  `status` int(11) NOT NULL COMMENT '状态[0:已撤消,1:已发布,2:待发布]',
  `is_gray` int(11) NOT NULL COMMENT '是否灰度发布 0：否，1：是',
  `update_desc` varchar(255) DEFAULT NULL COMMENT '更新描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_iot_ota_version_verify
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_version_verify`;
CREATE TABLE `t_iot_ota_version_verify` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `version_id` bigint(20) NOT NULL COMMENT '大版本ID(t_cloud_ota_version.id)',
  `device_version` varchar(20) NOT NULL COMMENT '设备版本号',
  `did` varchar(14) NOT NULL COMMENT '设备唯一ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID(t_cloud_device.id)',
  `status` int(11) NOT NULL COMMENT '验证状态[0:未验证,1:验证中,2:验证成功,3:验证失败]',
  `device_log` varchar(255) DEFAULT NULL COMMENT '设备日志',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备OTA版本验证表';

-- ----------------------------
-- Table structure for t_iot_ota_white
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_white`;
CREATE TABLE `t_iot_ota_white` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `pkg_id` bigint(20) DEFAULT NULL COMMENT '包ID(t_cloud_ota_pkg.id)',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID(t_cloud_product.id)',
  `group_id` bigint(20) DEFAULT NULL COMMENT '组ID(t_cloud_ota_white_group.id)',
  `did` varchar(14) DEFAULT NULL COMMENT '设备ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID(t_iot_device.id)',
  `belong_type` varchar(10) DEFAULT NULL COMMENT '数据归属类型',
  `belong_id` bigint(20) DEFAULT NULL COMMENT '数据归属对象ID （开发平台UserId）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备OTA白名单表';

-- ----------------------------
-- Table structure for t_iot_ota_white_group
-- ----------------------------
DROP TABLE IF EXISTS `t_iot_ota_white_group`;
CREATE TABLE `t_iot_ota_white_group` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `group_name` varchar(20) NOT NULL COMMENT '测试白名单组名',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备OTA白名单分组表';

-- ----------------------------
-- Table structure for t_scene_intelligence
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence`;
CREATE TABLE `t_scene_intelligence` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `type` int(11) DEFAULT NULL COMMENT '=1 一键执行任务 =2 自动化场景任务',
  `title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标题',
  `sort_no` smallint(1) DEFAULT NULL COMMENT '序号',
  `enable_display` smallint(1) DEFAULT NULL COMMENT '启用首页显示',
  `status` smallint(1) DEFAULT NULL COMMENT '状态（=1 启用 =2 禁用）',
  `run_status` smallint(1) DEFAULT NULL COMMENT '运行状态 （ 1 待运行 2 运行中 2运行结束）',
  `run_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '运行时间',
  `user_id` bigint(20) DEFAULT NULL,
  `home_id` bigint(20) DEFAULT NULL COMMENT '家庭编号',
  `condition_mode` smallint(1) DEFAULT NULL COMMENT '条件模式 =1 所有条件满足 =2 任意条件满足',
  `style_icon` varchar(500) DEFAULT NULL,
  `style_color` varchar(20) DEFAULT NULL,
  `style_img` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `effect_time_switch` smallint(1) DEFAULT NULL COMMENT '有效时间段开关',
  `effect_time_desc` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '时间描述',
  `effect_time_weeks` varchar(50) DEFAULT NULL COMMENT '周设置',
  `effect_time_start` varchar(5) DEFAULT NULL COMMENT '有效开始时间（例如：01:12）',
  `effect_time_end` varchar(5) DEFAULT NULL COMMENT '有效结束时间（例如：01:12）',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `app_key` varchar(50) DEFAULT NULL COMMENT 'APP Key',
  `tenant_id` varchar(20) DEFAULT NULL COMMENT '开发者租户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_scene_intelligence_condition
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence_condition`;
CREATE TABLE `t_scene_intelligence_condition` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `intelligence_id` bigint(20) DEFAULT NULL COMMENT '场景ID',
  `condition_type` smallint(1) DEFAULT NULL COMMENT '条件类型',
  `desc` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '天气描述',
  `weather_country` varchar(10) DEFAULT NULL COMMENT '国家',
  `weather_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `weather_area` varchar(10) DEFAULT NULL COMMENT '区域',
  `weather_type` int(2) DEFAULT NULL COMMENT '天气类型',
  `weather_value` varchar(50) DEFAULT NULL COMMENT '天气值',
  `weather_compare` int(2) DEFAULT NULL COMMENT '条件比较（1为等于 2 大于 ....)',
  `timer_weeks` varchar(20) DEFAULT NULL COMMENT '定时周设置，逗号分隔(例如：0,1,2,3,4)',
  `timer_value` varchar(5) DEFAULT NULL COMMENT '定时的值设置（01:33)',
  `device_did` varchar(14) DEFAULT NULL COMMENT '设备ID',
  `device_prop_key` varchar(50) DEFAULT NULL COMMENT '设备功能的Key',
  `device_prop_compare` int(2) DEFAULT NULL COMMENT '条件比较（1为等于 2 大于 ....)',
  `device_prop_value` varchar(50) DEFAULT NULL COMMENT '设备属性条件值',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_scene_intelligence_log
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence_log`;
CREATE TABLE `t_scene_intelligence_log` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `object_id` bigint(20) DEFAULT NULL,
  `home_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL COMMENT '执行结果编号（t_scene_intelligence_result.id）',
  `is_success` int(11) DEFAULT NULL COMMENT '是否执行成功',
  `scene_type` int(11) DEFAULT NULL COMMENT '=1 一键执行 =2 自动场景',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `intelligence_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_scene_intelligence_result
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence_result`;
CREATE TABLE `t_scene_intelligence_result` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `run_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '运行时间',
  `intelligence_id` bigint(20) DEFAULT NULL COMMENT '智能场景编号',
  `run_status` int(1) DEFAULT NULL COMMENT '运行状态 =1 执行中 = 2 执行成功 =3 执行失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_scene_intelligence_result_task
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence_result_task`;
CREATE TABLE `t_scene_intelligence_result_task` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '运行时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `intelligence_id` bigint(20) DEFAULT NULL COMMENT '智能场景编号',
  `result_id` bigint(20) DEFAULT NULL COMMENT '执行结果id',
  `is_success` int(1) DEFAULT NULL COMMENT '是否成功',
  `result_msg` varchar(100) DEFAULT NULL COMMENT '结果描述',
  `task_id` bigint(20) DEFAULT NULL COMMENT '任务编号',
  `task_img` varchar(255) DEFAULT NULL COMMENT '任务图片(产品图片、智能图片、功能图标）',
  `task_desc` varchar(50) DEFAULT NULL COMMENT '任务描述',
  `task_type` int(2) DEFAULT NULL COMMENT '任务类型（=1 延时 =2 设备执行 =3 场景开关）',
  `object_id` varchar(50) DEFAULT NULL COMMENT '对象ID（设备Id、场景Id）',
  `object_desc` varchar(50) DEFAULT NULL COMMENT '对象的标题或者描述（设备名称、场景名称）',
  `func_key` varchar(50) DEFAULT NULL COMMENT '执行功能Key',
  `func_desc` varchar(50) DEFAULT NULL COMMENT '冗余：功能描述',
  `func_value` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_scene_intelligence_task
-- ----------------------------
DROP TABLE IF EXISTS `t_scene_intelligence_task`;
CREATE TABLE `t_scene_intelligence_task` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `intelligence_id` bigint(20) DEFAULT NULL COMMENT '智能场景Id',
  `task_img` varchar(255) DEFAULT NULL COMMENT '任务图片(产品图片、智能图片、功能图标）',
  `task_desc` varchar(50) DEFAULT NULL COMMENT '任务描述',
  `task_type` int(2) DEFAULT NULL COMMENT '任务类型（=1 延时 =2 设备执行 =3 场景开关）',
  `object_id` varchar(50) DEFAULT NULL COMMENT '对象ID（设备Id、场景Id）',
  `object_desc` varchar(50) DEFAULT NULL COMMENT '对象的标题或者描述（设备名称、场景名称）',
  `func_key` varchar(50) DEFAULT NULL COMMENT '执行功能Key',
  `func_desc` varchar(50) DEFAULT NULL COMMENT '冗余：功能描述',
  `func_value` varchar(50) DEFAULT NULL,
  `delayed` varchar(5) DEFAULT NULL COMMENT '延时时间，数据格式为 01:02  一分二秒',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品Key',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
