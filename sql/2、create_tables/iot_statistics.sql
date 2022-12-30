/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_statistics

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:30:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_app_user_active_30day
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user_active_30day`;
CREATE TABLE `t_app_user_active_30day` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `app_key` varchar(64) NOT NULL COMMENT 'app key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '活跃用户数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_app_user_active_day
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user_active_day`;
CREATE TABLE `t_app_user_active_day` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `app_key` varchar(64) NOT NULL COMMENT 'app key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '活跃用户数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app活跃用户日统计表';

-- ----------------------------
-- Table structure for t_app_user_month
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user_month`;
CREATE TABLE `t_app_user_month` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `app_key` varchar(64) NOT NULL COMMENT 'app key',
  `register_sum` bigint(20) DEFAULT NULL COMMENT '注册用户数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app用户统计表';

-- ----------------------------
-- Table structure for t_app_user_sum
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user_sum`;
CREATE TABLE `t_app_user_sum` (
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `app_key` varchar(64) NOT NULL COMMENT 'app key',
  `register_sum` bigint(20) DEFAULT NULL COMMENT '累计注册用户数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tenant_id`,`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_data_overview_hour
-- ----------------------------
DROP TABLE IF EXISTS `t_data_overview_hour`;
CREATE TABLE `t_data_overview_hour` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID，为空表示所有',
  `device_active_sum` bigint(20) DEFAULT NULL COMMENT '该月激活设备数',
  `device_fault_sum` bigint(20) DEFAULT NULL COMMENT '该月设备故障数',
  `developer_register_sum` bigint(20) DEFAULT NULL COMMENT '该月开发者注册数',
  `user_register_sum` bigint(20) DEFAULT NULL COMMENT '该月APP用户注册数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_data_overview_month
-- ----------------------------
DROP TABLE IF EXISTS `t_data_overview_month`;
CREATE TABLE `t_data_overview_month` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月份',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID，为空表示所有',
  `device_active_sum` bigint(20) DEFAULT NULL COMMENT '该月激活设备数',
  `device_fault_sum` bigint(20) DEFAULT NULL COMMENT '该月设备故障数',
  `developer_register_sum` bigint(20) DEFAULT NULL COMMENT '该月开发者注册数',
  `user_register_sum` bigint(20) DEFAULT NULL COMMENT '该月APP用户注册数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_developer_sum
-- ----------------------------
DROP TABLE IF EXISTS `t_developer_sum`;
CREATE TABLE `t_developer_sum` (
  `developer_sum` bigint(20) DEFAULT NULL COMMENT '开发者累计',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_device_active_day
-- ----------------------------
DROP TABLE IF EXISTS `t_device_active_day`;
CREATE TABLE `t_device_active_day` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `product_key` varchar(20) NOT NULL COMMENT '产品key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '激活设备数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备激活日统计表';

-- ----------------------------
-- Table structure for t_device_active_hour
-- ----------------------------
DROP TABLE IF EXISTS `t_device_active_hour`;
CREATE TABLE `t_device_active_hour` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `product_key` varchar(20) NOT NULL COMMENT '产品key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '激活设备数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备激活时统计表';

-- ----------------------------
-- Table structure for t_device_active_month
-- ----------------------------
DROP TABLE IF EXISTS `t_device_active_month`;
CREATE TABLE `t_device_active_month` (
  `data_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `product_key` varchar(20) NOT NULL COMMENT '产品key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '激活设备数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_time`,`tenant_id`,`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备激活月统计表';

-- ----------------------------
-- Table structure for t_device_data_sum
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_sum`;
CREATE TABLE `t_device_data_sum` (
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `product_key` varchar(64) NOT NULL COMMENT 'product key',
  `active_sum` bigint(20) DEFAULT NULL COMMENT '设备累计激活数',
  `fault_sum` bigint(20) DEFAULT NULL COMMENT '设备累计故障数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tenant_id`,`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pm_app_data
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_app_data`;
CREATE TABLE `t_pm_app_data` (
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `app_key` varchar(32) DEFAULT NULL COMMENT 'appKey',
  `app_name` varchar(64) DEFAULT NULL COMMENT 'appName',
  `last_version` varchar(16) DEFAULT NULL COMMENT 'app最新版本',
  `dev_account` varchar(32) DEFAULT NULL COMMENT '开发者账号',
  `register_user_sum` bigint(20) DEFAULT NULL COMMENT '累计注册用户数',
  `active_user_sum` bigint(20) DEFAULT NULL COMMENT '近7日活跃用户数',
  `version_sum` bigint(20) DEFAULT NULL COMMENT '累计版本数',
  `feedback_sum` bigint(20) DEFAULT NULL COMMENT '累计用户反馈数',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_pm_develop_data
-- ----------------------------
DROP TABLE IF EXISTS `t_pm_develop_data`;
CREATE TABLE `t_pm_develop_data` (
  `tenant_id` varchar(20) NOT NULL COMMENT '租户ID',
  `device_sum` bigint(20) DEFAULT NULL COMMENT '累计模组(设备)数量',
  `device_active_sum` bigint(20) DEFAULT NULL COMMENT '累计已激活设备量',
  `app_sum` bigint(20) DEFAULT NULL COMMENT '累计已开发APP',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_product_fault_month
-- ----------------------------
DROP TABLE IF EXISTS `t_product_fault_month`;
CREATE TABLE `t_product_fault_month` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_key` varchar(14) NOT NULL COMMENT '产品key',
  `month` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月份',
  `total` bigint(20) DEFAULT '0' COMMENT '月份故障总数',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_pk_month` (`product_key`,`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_product_fault_type
-- ----------------------------
DROP TABLE IF EXISTS `t_product_fault_type`;
CREATE TABLE `t_product_fault_type` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `product_key` varchar(14) NOT NULL COMMENT '产品key',
  `month` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '月份',
  `fault_type` varchar(100) NOT NULL COMMENT '故障类型',
  `total` bigint(20) DEFAULT '0' COMMENT '月份故障类型总数',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_pk_fault_type` (`product_key`,`fault_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
