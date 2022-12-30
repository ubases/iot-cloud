/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_app

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:25:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_app_config
-- ----------------------------
DROP TABLE IF EXISTS `t_app_config`;
CREATE TABLE `t_app_config` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `app_code` varchar(10) DEFAULT NULL COMMENT 'app类型码[ios_app, android_app, all]',
  `function_code` varchar(20) DEFAULT NULL COMMENT '功能编号',
  `function_name` varchar(50) DEFAULT NULL COMMENT '功能名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `resource_url` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `link_type` int(11) DEFAULT NULL COMMENT '跳转类型',
  `link_params` varchar(255) DEFAULT NULL COMMENT '跳转参数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_app_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_app_login_log`;
CREATE TABLE `t_app_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `tenant_id` varchar(8) DEFAULT NULL COMMENT '租户id',
  `app_key` varchar(64) DEFAULT NULL COMMENT 'appKey',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_app_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `t_app_upgrade`;
CREATE TABLE `t_app_upgrade` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT 'APP名称',
  `type` int(11) NOT NULL COMMENT 'APP类型[1：安卓，2：iOS]',
  `version` varchar(20) NOT NULL COMMENT 'APP版本号',
  `upgrade_mode` int(11) NOT NULL COMMENT '升级方式[0：强制升级、1：弱提示升级、2：强提醒升级]',
  `upgrade_prompt` varchar(255) DEFAULT NULL COMMENT '升级提示语',
  `upload_time` date DEFAULT NULL COMMENT '上传时间',
  `publish_time` date DEFAULT NULL COMMENT '发布时间',
  `publish_type` int(11) DEFAULT NULL COMMENT '发布类型[0：appstore]',
  `url` varchar(255) DEFAULT NULL COMMENT 'APP路径',
  `appstore_url` varchar(255) DEFAULT NULL COMMENT 'appstore地址',
  `minimum_required` varchar(20) DEFAULT NULL COMMENT '最低兼容版本',
  `force_upgrade_version` varchar(20) DEFAULT NULL COMMENT '强制升级版本',
  `file_md5` varchar(36) DEFAULT NULL COMMENT '文件MD5值',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_uc_appleid_info
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_appleid_info`;
CREATE TABLE `t_uc_appleid_info` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `third_user_id` varchar(50) NOT NULL COMMENT '第三方用户ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '第三方用户昵称',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_uc_home
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_home`;
CREATE TABLE `t_uc_home` (
  `id` bigint(20) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '家庭名称',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `sid` bigint(20) DEFAULT NULL COMMENT '服务器唯一ID',
  `lat` decimal(10,6) DEFAULT '0.000000' COMMENT '经度',
  `lng` decimal(10,6) DEFAULT '0.000000' COMMENT '纬度',
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '家庭位置',
  `coord_type` int(11) DEFAULT NULL COMMENT '1-GPS   2-火星坐标系',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_uc_home_room
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_home_room`;
CREATE TABLE `t_uc_home_room` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `home_id` bigint(20) NOT NULL COMMENT '家庭ID(t_cloud_home.id)',
  `room_name` varchar(20) NOT NULL COMMENT '房间名称',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_uc_home_user
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_home_user`;
CREATE TABLE `t_uc_home_user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `home_id` bigint(20) NOT NULL COMMENT '家庭ID(t_cloud_home.id)',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID(t_cloud_user.id)',
  `role_type` int(11) NOT NULL COMMENT '角色类型[1-所有者, 2-管理者, 3-成员]',
  `bind_time` date NOT NULL COMMENT '用户与家庭绑定时间',
  `shared` int(11) DEFAULT '0' COMMENT '分享的标识 1-正常 2-分享',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_uc_user
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_user`;
CREATE TABLE `t_uc_user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `uid` varchar(16) NOT NULL COMMENT '用户唯一ID（16位UUID）',
  `nick_name` varchar(50) NOT NULL COMMENT '昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `device_secret_http` varchar(20) DEFAULT NULL COMMENT '用户密钥（http）',
  `device_secret_mqtt` varchar(20) DEFAULT NULL COMMENT '用户密钥（mqtt）',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `status` int(11) NOT NULL COMMENT '状态[1:正常，2:待注销，3:已注销]',
  `lang` varchar(6) DEFAULT NULL COMMENT '语言标识[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `lat` decimal(10,0) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(10,0) DEFAULT NULL COMMENT '经度',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `district` varchar(50) DEFAULT NULL COMMENT '地区',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `default_home_id` varchar(64) DEFAULT NULL COMMENT '默认家庭id',
  `gender` int(11) DEFAULT NULL COMMENT '性别 1-男，2-女，3-其他',
  `register_region` varchar(64) DEFAULT NULL COMMENT '注册地区',
  `app_origin` varchar(100) DEFAULT NULL COMMENT '应用来源 =1 aithings',
  `app_key` varchar(64) DEFAULT NULL COMMENT 'appKey',
  `tenant_id` varchar(8) DEFAULT NULL COMMENT '租户id',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `cancel_time` bigint(20) DEFAULT NULL COMMENT '注销时间',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_uc_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_user_feedback`;
CREATE TABLE `t_uc_user_feedback` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID(t_uc_user.id)',
  `question_type_id` bigint(20) DEFAULT NULL COMMENT '问题分类编号（question_type.id）',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID(t_pm_product.id)',
  `feedback_time` date DEFAULT NULL COMMENT '反馈时间',
  `feedback_content` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '反馈内容',
  `status` int(11) DEFAULT NULL COMMENT '状态[0:未处理,1:待处理,2:延期处理,3:已处理]',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `pictures` text COMMENT '附件信息（图片、视频）',
  `videos` text,
  `contact` varchar(20) DEFAULT NULL,
  `did` varchar(14) DEFAULT NULL,
  `productKey` varchar(20) DEFAULT NULL,
  `app_key` varchar(50) DEFAULT NULL COMMENT 'APPKEY',
  `tenant_id` varchar(10) DEFAULT NULL COMMENT '租户编号',
  `app_version` varchar(10) DEFAULT NULL COMMENT 'App版本',
  `mobile_lang` varchar(10) DEFAULT NULL COMMENT '手机语言',
  `mobile_model` varchar(100) DEFAULT NULL COMMENT '手机型号',
  `mobile_system` varchar(100) DEFAULT NULL COMMENT '手机系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_uc_user_feedback_result
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_user_feedback_result`;
CREATE TABLE `t_uc_user_feedback_result` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `feedback_id` bigint(20) NOT NULL COMMENT '反馈ID(t_cloud_uc_user_feedback.id)',
  `handle_status` int(11) NOT NULL COMMENT '处理状态[0:未处理,1:待处理,2:延期处理,3:已处理]',
  `handle_result` varchar(4) NOT NULL COMMENT '处理结',
  `notify_flag` int(11) NOT NULL COMMENT '通知标识[0:不通知,1:消息通知]',
  `notify_content` varchar(2500) DEFAULT NULL COMMENT '通知内容',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `pictures` text COMMENT '附件信息（图片、视频）',
  `videos` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_uc_user_operate
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_user_operate`;
CREATE TABLE `t_uc_user_operate` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(8) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id',
  `app_key` varchar(64) NOT NULL COMMENT 'appKey',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID(t_uc_user.id)',
  `account` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '登录账号',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '请求地址',
  `ip` varchar(18) DEFAULT NULL COMMENT 'ip',
  `opt_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_uc_user_third
-- ----------------------------
DROP TABLE IF EXISTS `t_uc_user_third`;
CREATE TABLE `t_uc_user_third` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID(t_cloud_uc_user.id)',
  `third_type` int(11) NOT NULL COMMENT '三方登录类型[1:微信,2:支付宝,5:AppleId]',
  `third_user_id` varchar(50) DEFAULT NULL COMMENT '第三方用户ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '第三方用户昵称',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
