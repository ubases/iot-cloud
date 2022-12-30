/*
Navicat MySQL Data Transfer

Source Server         : 47.113.126.37
Source Server Version : 50737
Source Host           : 47.113.126.37:3306
Source Database       : iot_message

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-11-21 08:32:07
*/

SET FOREIGN_KEY_CHECKS=0;

use iot_message;

-- ----------------------------
-- Table structure for t_mp_message
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message`;
CREATE TABLE `t_mp_message` (
  `id` bigint(20) NOT NULL,
  `push_type` int(11) NOT NULL COMMENT '推送类型[0:站内且站外，1：站内， 2：站外]',
  `message_type` int(11) NOT NULL COMMENT '消息类型[0：系统提醒，1：设备提醒，....自定义]',
  `push_to` varchar(10) NOT NULL COMMENT '接收对象[数据字典配置， 比如全用户：all、user、home、device]',
  `push_mode` int(11) NOT NULL COMMENT '发送模式[0:实时发送， 1：定时发送，2：轮询发送]',
  `push_status` int(11) NOT NULL COMMENT '发送状态[0:已发送， 1：待发送， 2：发送失败， 3：已删除]',
  `agent_type` int(11) NOT NULL COMMENT '终端类型[0:所有终端， 1：IOS端， 2:android端]',
  `push_time` date NOT NULL COMMENT '推送时间',
  `expire_hour` int(11) DEFAULT NULL COMMENT '有效时间(单位小时)',
  `action_type` int(11) NOT NULL COMMENT '行为类型[0:主动发送， 1:被动发送]',
  `tpl_code` varchar(50) DEFAULT NULL COMMENT '消息模板编号',
  `push_params` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '消息模板的参数',
  `target_ids` varchar(500) DEFAULT NULL COMMENT '推送的目标编号集合(push_to = user  为userid集合）,使用逗号分割',
  `did` varchar(32) DEFAULT NULL,
  `product_key` varchar(20) DEFAULT NULL COMMENT '推送目标产品',
  `content` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '消息内容',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mp_message_black
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message_black`;
CREATE TABLE `t_mp_message_black` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `type` int(11) NOT NULL COMMENT '类型[0：全部，1：站外拦截，2：站内拦截]',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID(t_cloud_uc_user.id)',
  `did` varchar(14) DEFAULT NULL COMMENT '设备DID',
  `expire_start_time` date DEFAULT NULL COMMENT '有效起始时间',
  `expire_end_time` date DEFAULT NULL COMMENT '有效截止时间',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息黑名单表';

-- ----------------------------
-- Table structure for t_mp_message_red_dot
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message_red_dot`;
CREATE TABLE `t_mp_message_red_dot` (
  `id` bigint(20) NOT NULL COMMENT '唯一主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `home_msg` smallint(1) DEFAULT '0' COMMENT '家庭消息读取情况',
  `system_msg` smallint(1) DEFAULT NULL COMMENT '系统消息读取情况',
  `system_msg_id` bigint(20) DEFAULT NULL,
  `device_msg` smallint(1) DEFAULT '0' COMMENT '设备消息读取情况',
  `public_msg` bigint(20) DEFAULT NULL COMMENT '公共消息读取情况（最新公共消息编号）',
  `feedback_msg` smallint(1) DEFAULT '0' COMMENT '反馈消息读取情况',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mp_message_template
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message_template`;
CREATE TABLE `t_mp_message_template` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tpl_code` varchar(50) NOT NULL COMMENT '模板编码',
  `tpl_name` varchar(50) NOT NULL COMMENT '模板名称',
  `tpl_content` varchar(500) NOT NULL COMMENT '模板内容',
  `tpl_params` varchar(64) DEFAULT NULL COMMENT '模板参数',
  `push_type` int(11) NOT NULL DEFAULT '0' COMMENT '消息平台[0:APP消息，1：云管平台消息2， 2：开放平台消息]',
  `message_type` int(11) NOT NULL COMMENT '消息类型[0：系统提醒，1：设备提醒，....自定义]',
  `agent_type` int(11) NOT NULL DEFAULT '0' COMMENT '接收终端类型[0:所有终端， 1：IOS端， 2:android端]',
  `lang` varchar(10) NOT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `expire_hour` int(11) DEFAULT NULL COMMENT '有效时间(单位小时)',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mp_message_user_in
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message_user_in`;
CREATE TABLE `t_mp_message_user_in` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `message_type` int(11) DEFAULT NULL COMMENT '消息类型[1：系统提醒，2：设备提醒，3：家庭消息....自定义]',
  `child_type` varchar(255) DEFAULT NULL COMMENT '消息扩展类型',
  `action_type` int(11) DEFAULT NULL COMMENT '行为类型[0：主动发送，1：被动发送]',
  `push_mode` int(11) DEFAULT NULL COMMENT '发送模式[0:实时发送， 1：定时发送，2：轮询发送]',
  `tpl_code` varchar(50) DEFAULT NULL COMMENT '模板编码',
  `message_id` bigint(20) DEFAULT NULL COMMENT '消息ID(mp_message.id)',
  `is_public` smallint(1) DEFAULT NULL COMMENT '是否公共消息',
  `did` varchar(20) DEFAULT NULL COMMENT '设备唯一DID',
  `product_key` varchar(20) DEFAULT NULL COMMENT '产品key',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID(t_cloud_uc_user.id)',
  `home_id` bigint(20) DEFAULT NULL COMMENT '家庭编号',
  `msg_tag` varchar(50) DEFAULT NULL COMMENT '标签类型 0：alias 、1：tag、 2：regid',
  `icon_url` varchar(100) DEFAULT NULL COMMENT '图标',
  `push_title` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标题',
  `push_content` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '发送内容',
  `read_flag` int(11) DEFAULT NULL COMMENT '读取标识[0:未读， 1：已读]',
  `un_set_expire` smallint(1) DEFAULT NULL COMMENT '不设置超时 1',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `source_table` varchar(64) DEFAULT NULL COMMENT '来源的表',
  `source_row_id` varchar(20) DEFAULT NULL COMMENT '来源的行id',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `app_key` varchar(50) DEFAULT NULL COMMENT 'APP Key',
  `tenant_id` varchar(20) DEFAULT NULL COMMENT '开发者租户编号',
  `params` varchar(255) DEFAULT NULL COMMENT '推送参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mp_message_user_out
-- ----------------------------
DROP TABLE IF EXISTS `t_mp_message_user_out`;
CREATE TABLE `t_mp_message_user_out` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `lang` varchar(10) DEFAULT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `message_type` int(11) NOT NULL COMMENT '消息类型[0：系统提醒，1：设备提醒，....自定义]',
  `action_type` int(11) NOT NULL COMMENT '行为类型[0：主动发送，1：被动发送]',
  `push_mode` int(11) NOT NULL COMMENT '发送模式[0:实时发送， 1：定时发送，2：轮询发送]',
  `tpl_code` varchar(50) DEFAULT NULL COMMENT '模板编码',
  `message_id` bigint(20) DEFAULT NULL COMMENT '消息ID(t_cloud_message.id)',
  `did` varchar(20) DEFAULT NULL COMMENT '设备唯一DID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID(t_cloud_uc_user.id)',
  `link_type` int(11) DEFAULT NULL COMMENT '跳转类型',
  `link_function_code` varchar(20) DEFAULT NULL COMMENT '跳转功能编号',
  `link_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `dynamic` varchar(255) DEFAULT NULL COMMENT '透传业务参数',
  `push_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `push_content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `external_id` varchar(50) DEFAULT NULL COMMENT '外部消息ID(极光ID)',
  `external_status` int(11) DEFAULT NULL COMMENT '外部发送状态',
  `external_error_message` varchar(50) DEFAULT NULL COMMENT '外部失败原因描述',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ms_notice_template
-- ----------------------------
DROP TABLE IF EXISTS `t_ms_notice_template`;
CREATE TABLE `t_ms_notice_template` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tpl_subject` varchar(64) DEFAULT NULL COMMENT '通知主题',
  `tpl_code` varchar(64) NOT NULL COMMENT '模板编码',
  `tpl_name` varchar(64) NOT NULL COMMENT '模板名称',
  `tpl_content` text COMMENT '模板内容',
  `tpl_params` varchar(255) DEFAULT NULL COMMENT '模板参数',
  `thirdpary_code` varchar(64) DEFAULT NULL COMMENT '第三方模板编码',
  `sms_supplier` int(2) DEFAULT NULL COMMENT '短信服务供应商（短信服务提供商, 默认0）',
  `method` int(11) NOT NULL COMMENT '通知方式[0:邮件，1：短信，2：MQ]',
  `lang` varchar(10) NOT NULL COMMENT '语言编码[zh_CN:简体中文,zh_TW:繁体中文,en_US:英语,es:西班牙语]',
  `tpl_type` int(11) NOT NULL DEFAULT '0' COMMENT '1:验证码;2:注册结果通知;',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_notice_template_lang_type_method` (`sms_supplier`,`method`,`lang`,`tpl_type`,`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
