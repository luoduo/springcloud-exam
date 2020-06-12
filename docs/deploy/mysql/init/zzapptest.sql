/*
 Navicat Premium Data Transfer

 Source Server         : zzapptest
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 39.97.23.22:6033
 Source Schema         : zzapptest

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 05/06/2020 09:32:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cgform_uploadfiles
-- ----------------------------
DROP TABLE IF EXISTS `cgform_uploadfiles`;
CREATE TABLE `cgform_uploadfiles`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `cgform_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单字段',
  `cgform_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `cgform_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_qwig8sn3okhvh4wye8nn8gdeg`(`id`) USING BTREE,
  INDEX `index_fieldid`(`cgform_field`) USING BTREE,
  INDEX `index_formid`(`cgform_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_activation_code_history
-- ----------------------------
DROP TABLE IF EXISTS `t_b_activation_code_history`;
CREATE TABLE `t_b_activation_code_history`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `ca_org_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '证书类型',
  `effective_date` datetime(0) NULL DEFAULT NULL COMMENT '激活码激活证书有效期',
  `activation_code_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '激活码表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '证书激活记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_activation_code_management
-- ----------------------------
DROP TABLE IF EXISTS `t_b_activation_code_management`;
CREATE TABLE `t_b_activation_code_management`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `dept_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构代码',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构名称',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台代码',
  `platform_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台名称',
  `card_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '卡号',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `validity_term_end_time` datetime(0) NULL DEFAULT NULL COMMENT '有效期截至时间',
  `use_status` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用状态：\'00\'未使用,\'01\'使用',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用人',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `ca_type` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '激活类型：00机构/01个人',
  `org_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用机构id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_card_no`(`card_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '激活码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `t_b_advertisement`;
CREATE TABLE `t_b_advertisement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `key_words` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关键词',
  `location_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位置编号',
  `location_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告位置名称',
  `details_page_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '详情页内容',
  `effect_time` datetime(0) NOT NULL COMMENT '生效时间',
  `shelf_time` datetime(0) NULL DEFAULT NULL COMMENT '下架时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序(只有轮播有）',
  `advertising_type` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告类型:00手机端轮播广告，01手机端弹窗广告',
  `operator_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作员id',
  `operation_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `operator_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作员姓名',
  `page_skipping` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面跳转//00:无跳转;01:H5跳转;02:APP跳转',
  `page_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面跳转链接/app原生页面编码',
  `real_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'html文件路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_effect_time`(`effect_time`) USING BTREE,
  INDEX `INDEX_shelf_time`(`shelf_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_advertisement_location
-- ----------------------------
DROP TABLE IF EXISTS `t_b_advertisement_location`;
CREATE TABLE `t_b_advertisement_location`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `location_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位置编号',
  `location_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告位置名称',
  `picture_length` decimal(11, 2) NULL DEFAULT NULL COMMENT '图片长度',
  `picture_width` decimal(11, 2) NULL DEFAULT NULL COMMENT '图片宽度',
  `max_display_number` int(2) NULL DEFAULT NULL COMMENT '最多显示个数',
  `operator_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作员id',
  `operator_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作员姓名',
  `operation_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_location_id`(`location_id`) USING BTREE COMMENT '广告位置id索引',
  UNIQUE INDEX `index_location_name`(`location_name`) USING BTREE COMMENT '广告位置名称索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `t_b_audit_record`;
CREATE TABLE `t_b_audit_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `biz_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务表主键',
  `audit_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核类型',
  `audit_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核人',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核状态',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_opinion` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_authorization_string_record
-- ----------------------------
DROP TABLE IF EXISTS `t_b_authorization_string_record`;
CREATE TABLE `t_b_authorization_string_record`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台代码',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用人',
  `org_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用机构id',
  `authorization_string` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '授权串',
  `authorized_org` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '授权单位',
  `start_date` date NULL DEFAULT NULL COMMENT '有效期开始',
  `end_date` date NULL DEFAULT NULL COMMENT '有效期截止',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '可用状态',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '印章授权串记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_authorizeid
-- ----------------------------
DROP TABLE IF EXISTS `t_b_authorizeid`;
CREATE TABLE `t_b_authorizeid`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_authorizeid_pack
-- ----------------------------
DROP TABLE IF EXISTS `t_b_authorizeid_pack`;
CREATE TABLE `t_b_authorizeid_pack`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `authorizeid_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trading_platform_access_token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_binding_record
-- ----------------------------
DROP TABLE IF EXISTS `t_b_binding_record`;
CREATE TABLE `t_b_binding_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键',
  `personal_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '个人交易码',
  `unified_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构交易码',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `platform_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台编码',
  `binding_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '绑定类型（02机构用户/01个人用户）',
  `certificate_result` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '认证状态',
  `fail_resason` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '认证结果编码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户认证结果记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_depart_ca_remain
-- ----------------------------
DROP TABLE IF EXISTS `t_b_depart_ca_remain`;
CREATE TABLE `t_b_depart_ca_remain`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'CA类型编码',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `remain_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '剩余个数',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_b_ht_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_b_ht_invoice`;
CREATE TABLE `t_b_ht_invoice`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票类型(00:普票,01:专票)',
  `taxpayer_identification_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税号',
  `nationaltaxno_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证扫描件',
  `is_general_taxpayer` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否一般纳税人(00:否,01:是)',
  `taxpayercertificate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一般纳税人凭证',
  `is_open_ticket` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要开具专票(00:否,01:是)',
  `ticket_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开专票授权委托书扫描件',
  `bankname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bankaccount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `taxpayertel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `taxpayeraddr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `audit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `audit_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `audit_opinion` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `is_invalid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否作废',
  `submit_date` datetime(0) NULL DEFAULT NULL COMMENT '提交日期',
  `bill_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开票信息扫描件',
  `consignee_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票收票件人姓名',
  `consignee_address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票收票件人地址',
  `consignee_mobileNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票收票件人联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_invoice_draw
-- ----------------------------
DROP TABLE IF EXISTS `t_b_invoice_draw`;
CREATE TABLE `t_b_invoice_draw`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `invoice_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票号码',
  `invoice_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票代码',
  `invoice_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '税号',
  `invoice_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `contact_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系方式',
  `bank_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银行信息',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `mark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联订单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票状态 00暂存/01已开具/02开具失败',
  `download_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件下载地址',
  `response_xml` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '发票返回信息',
  `send_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '发送内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_invoice_draw_back
-- ----------------------------
DROP TABLE IF EXISTS `t_b_invoice_draw_back`;
CREATE TABLE `t_b_invoice_draw_back`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `invoice_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票号码',
  `invoice_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票代码',
  `invoice_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '税号',
  `invoice_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `contact_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系方式',
  `bank_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银行信息',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `mark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联订单id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票状态 00暂存/01已开具/02开具失败',
  `download_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件下载地址',
  `response_xml` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '发票返回信息',
  `send_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '发送内容',
  `back_type` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票备份类型:00作废蓝票，01红票',
  `invoice_old_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '原发票id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '发票备份表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_invoice_title
-- ----------------------------
DROP TABLE IF EXISTS `t_b_invoice_title`;
CREATE TABLE `t_b_invoice_title`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `invoice_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '税号',
  `contact_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系方式',
  `bank_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银行信息',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `mark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `is_default` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否默认',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_pack_subscribe_info
-- ----------------------------
DROP TABLE IF EXISTS `t_b_pack_subscribe_info`;
CREATE TABLE `t_b_pack_subscribe_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subscribe_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅主表 id',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `industry_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品目类型',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅类目状态   01 有效  00 无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `t_b_pay_config`;
CREATE TABLE `t_b_pay_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `platform_code` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台代码',
  `recive_org_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款机构id',
  `recive_depart_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款单位',
  `pay_mode` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式：  01支付宝02中金 04支付微信 ',
  `pay_mode_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式描述',
  `action_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `extrafee_rate` decimal(6, 4) NULL DEFAULT NULL COMMENT '单笔手续费率',
  `extrafee_min` decimal(14, 2) NULL DEFAULT NULL COMMENT '单笔最低手续费',
  `aliweix_partner` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信合作身份者id',
  `aliweix_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信商户的私钥',
  `aliweix_seller_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信收款账号',
  `public_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公钥',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '私钥',
  `ca_org_type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ca编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_pay_service_result
-- ----------------------------
DROP TABLE IF EXISTS `t_b_pay_service_result`;
CREATE TABLE `t_b_pay_service_result`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id  ',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id  ',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `pay_service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付服务规则id',
  `pay_service_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型 00:ca购买 01:平台入场费 02:CA副本费 03:会员费用',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '缴费金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `trans_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台流水号',
  `third_pay_order_id` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方流水号',
  `pay_order_id` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单id',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `biz_id` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付最终结果记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_pay_service_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_b_pay_service_rule`;
CREATE TABLE `t_b_pay_service_rule`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `platform_code` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台代码',
  `pay_service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `pay_service_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务描述',
  `old_service_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `pay_service_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `pay_service_unit` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务单位',
  `pay_service_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型 00:ca购买',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `ca_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01个人证书/00单位证书',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_ca_platform`(`ca_org_type`, `platform_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '费用服务规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_register_varifycode
-- ----------------------------
DROP TABLE IF EXISTS `t_b_register_varifycode`;
CREATE TABLE `t_b_register_varifycode`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `varify_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `invilidate` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '校验日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_attachment`;
CREATE TABLE `t_b_report_attachment`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `attachment_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attachment_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `bulletin_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告id',
  `attachment_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件保存路径',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `filereal_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件真实名称',
  `attachment_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_bulletin_id`(`bulletin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_bulletin`;
CREATE TABLE `t_b_report_bulletin`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `bulletin_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `bulletin_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告类型：00资格预审，01招标公告，02中标候选人，03中标结果，04变更公告',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `platform_code` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标识码',
  `platform_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `platform_shortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台简称',
  `tender_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `project_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `industry_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业类型编码',
  `industry_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业类型',
  `project_area_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目所在区域',
  `project_area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `project_area_code_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市级编号',
  `purcategory_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品目Id',
  `project_industry_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品目类型',
  `tender_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `tender_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `tender_method` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招标方式:00(公开招标) 01(邀请招标) 02(竞争性谈判) 03(询价) 04(单一来源采购) 05(其他) 06(竞争性磋商)',
  `agent_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理机构代码',
  `agent_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理机构名称',
  `agent_linker_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理机构联系人所在地址',
  `buyers_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招标人code',
  `buyers_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招标人名称',
  `search_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '搜索内容',
  `source_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源 ： 01本系统 ，02公共，03抓取来的',
  `project_createtime` datetime(0) NULL DEFAULT NULL COMMENT '项目创建时间',
  `enroll_end_date` datetime(0) NULL DEFAULT NULL COMMENT '报名结束时间',
  `bidding_start_time` datetime(0) NULL DEFAULT NULL COMMENT '投标开始时间',
  `bidding_end_date` datetime(0) NULL DEFAULT NULL COMMENT '投标结束时间',
  `bulletin_create_time` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '系统同步时间',
  `receiving_time` datetime(0) NULL DEFAULT NULL COMMENT '公告入库时间',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行方法',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_bulletin_id`(`bulletin_id`) USING BTREE,
  INDEX `index_create_time`(`bulletin_create_time`) USING BTREE,
  INDEX `index_project_industry_code`(`project_industry_code`) USING BTREE,
  FULLTEXT INDEX `index_fulltext_article`(`id`, `title`, `content`, `bulletin_id`, `industry_name`, `project_area_code`, `purcategory_ids`, `project_area_code_value`, `search_content`)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_channel`;
CREATE TABLE `t_b_report_channel`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '频道编码',
  `platform_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '频道名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_report_id`(`platform_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告用户频道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_channel_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_channel_recommend`;
CREATE TABLE `t_b_report_channel_recommend`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '频道编码',
  `platform_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '频道名称',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_report_id`(`platform_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告推荐频道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_collection`;
CREATE TABLE `t_b_report_collection`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `report_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_report_id`(`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_config
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_config`;
CREATE TABLE `t_b_report_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `config_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置名',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置值',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_history
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_history`;
CREATE TABLE `t_b_report_history`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `report_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告表id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_report_id`(`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_order
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_order`;
CREATE TABLE `t_b_report_order`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `pay_mode` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式：01支付宝,04支付微信',
  `pay_service_result_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付结果id',
  `pay_callback_time` datetime(0) NULL DEFAULT NULL COMMENT '支付回调时间缴费时间',
  `pay_amount_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '总支付金额',
  `trans_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台流水号按规则生成,平台代号3-终端类型2-费用类型2-年月日时分秒-随机数',
  `invoice_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `call_back_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调状态',
  `third_pay_order_id` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方流水号',
  `invoice_status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开具发票状态:01已开票',
  `is_refund` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '退款01，未退款00',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态:00临时,01正式,02作废',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息订阅订单主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_order_pack
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_order_pack`;
CREATE TABLE `t_b_report_order_pack`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `pay_order_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `vip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VIP期限',
  `vip_time_value` int(10) NULL DEFAULT NULL COMMENT 'vip期限月份值（如：1个月，写1）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息订阅订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_pay`;
CREATE TABLE `t_b_report_pay`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT 'vip开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT 'vip过期时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告缴费记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_pay_config`;
CREATE TABLE `t_b_report_pay_config`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `partner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信合作身份者id',
  `secret_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信商户的密钥',
  `seller_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝或微信收款账号',
  `public_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公钥',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '私钥',
  `pay_mode` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式：  01支付宝 04支付微信 ',
  `pay_mode_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式描述',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '信息订阅支付配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_price
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_price`;
CREATE TABLE `t_b_report_price`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `price_now` decimal(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `price_old` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `vip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'vip期限',
  `vip_time_value` int(10) NULL DEFAULT NULL COMMENT 'vip期限月份值（如：1个月，写1）',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '信息订阅定价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_report_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `t_b_report_subscribe`;
CREATE TABLE `t_b_report_subscribe`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `group_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组编号',
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `platform_code` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '频道编码',
  `platform_name` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '频道名称',
  `area_no` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地区编码',
  `area_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地区名称',
  `industry_no` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '行业编码',
  `industry_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '行业编码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_keywords`(`keywords`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告订阅表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_scanning_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_b_scanning_operation_log`;
CREATE TABLE `t_b_scanning_operation_log`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `cert_sn` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
  `operation_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `platform_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_userId`(`user_id`) USING BTREE,
  INDEX `index_mobile`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户扫码日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_scanning_operation_log_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_b_scanning_operation_log_bak`;
CREATE TABLE `t_b_scanning_operation_log_bak`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构编码',
  `cert_sn` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '证书序列号',
  `operation_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作描述',
  `platform_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台编码',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '证书编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_userId`(`user_id`) USING BTREE,
  INDEX `index_mobile`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户扫码日志历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_service_config
-- ----------------------------
DROP TABLE IF EXISTS `t_b_service_config`;
CREATE TABLE `t_b_service_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `service_type` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务类型',
  `service_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务路径',
  `service_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务描述',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '外联服务配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_service_grant_record
-- ----------------------------
DROP TABLE IF EXISTS `t_b_service_grant_record`;
CREATE TABLE `t_b_service_grant_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `service_type` char(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务类型',
  `push_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '推送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '服务授权记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_subscribe_info
-- ----------------------------
DROP TABLE IF EXISTS `t_b_subscribe_info`;
CREATE TABLE `t_b_subscribe_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `regions` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '区域',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `server_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台类型',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `subscribe_end_time` datetime(0) NULL DEFAULT NULL COMMENT 'vip套餐结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_timetask
-- ----------------------------
DROP TABLE IF EXISTS `t_b_timetask`;
CREATE TABLE `t_b_timetask`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `cron_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cron时间表达式',
  `class_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行类（全路径）',
  `start_state` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行状态(00停止,01运行)',
  `run_server_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行服务器IP地址',
  `run_server` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行服务器地址',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_upgrade_server_type
-- ----------------------------
DROP TABLE IF EXISTS `t_b_upgrade_server_type`;
CREATE TABLE `t_b_upgrade_server_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `server_type_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器类型',
  `server_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `server_type_sim_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称简写',
  `server_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `server_type_code`(`server_type_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_b_user_ca_term
-- ----------------------------
DROP TABLE IF EXISTS `t_b_user_ca_term`;
CREATE TABLE `t_b_user_ca_term`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键id',
  `ca_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '证书类型：00机构/01个人',
  `ca_org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '证书编号',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户证书有效期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_area_code
-- ----------------------------
DROP TABLE IF EXISTS `t_s_area_code`;
CREATE TABLE `t_s_area_code`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district_short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_leaf` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dis_level` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `district_id`(`id`) USING BTREE,
  INDEX `district_code`(`district_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_s_attachment`;
CREATE TABLE `t_s_attachment`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachmentcontent` longblob NULL,
  `attachmenttitle` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businesskey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` datetime(0) NULL DEFAULT NULL,
  `extend` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `realpath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `subclassname` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `swfpath` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `busentityname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `infotypeid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_mnq23hlc835n4ufgjl7nkn3bd`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_audit_record`;
CREATE TABLE `t_s_audit_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `apply_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人id',
  `audit_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核id',
  `apply_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办业务类型 00，申领个人,01 申请单位ca，02 申领单位ca，03申请单位授权,04个人申请加入机构,05个人申请成为机构管理员',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核(邀请)状态:无审批: 空null临时作废，01正式; 有审批:空null临时,00审核中,02\r\n驳回,01通过 ;',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审核记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_base_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_base_user`;
CREATE TABLE `t_s_base_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `real_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `id_number` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `certification_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证状态 00临时,01已认证',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `network_id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络身份证编号',
  `term_of_validity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证有效期',
  `effect_date` datetime(0) NULL DEFAULT NULL COMMENT '颁发时间',
  `password_failure_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人交易码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `telephone_num`(`telephone_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_base_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_base_user_info`;
CREATE TABLE `t_s_base_user_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `certification_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证状态 00临时,01已认证',
  `my_apps` varchar(7000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的应用',
  `education` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '学历信息',
  `academic_degree` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '学位信息',
  `face_identification` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸认证：00未认证,01 已认证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户扩展记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_apply_get_org_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_apply_get_org_record`;
CREATE TABLE `t_s_ca_apply_get_org_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `apply_get_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申领状态 00申领中,01成功,02失败',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `application_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单位申领单位证书记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_apply_get_personal_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_apply_get_personal_record`;
CREATE TABLE `t_s_ca_apply_get_personal_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `apply_get_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申领状态 00申领中,01成功,02失败',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `application_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人申领个人证书记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_apply_org_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_apply_org_record`;
CREATE TABLE `t_s_ca_apply_org_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `application_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  `apply_get_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申领状态 00申领中,01成功,02失败',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人申请单位证书记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_ascription
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_ascription`;
CREATE TABLE `t_s_ca_ascription`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `ca_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01个人证书/00单位证书',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id 单位证书时',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id 个人证书时',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '证书有效期开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '证书过期时间',
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `ca_effective_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书有效期',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `cert_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
  `cert_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人证书：陈某某；单位证书：机构名称',
  `pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥证书',
  `cert_download_date` datetime(0) NULL DEFAULT NULL COMMENT '证书下载时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `ca_org_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ca联合名称（申领证书后存，登时后提供）',
  `ca_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ca归属表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_ascription_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_ascription_detail`;
CREATE TABLE `t_s_ca_ascription_detail`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `ca_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01个人证书/00单位证书',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id 单位证书时',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id 个人证书时',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '证书有效期开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '证书过期时间',
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `ca_effective_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书有效期',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `cert_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
  `cert_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人证书：陈某某；单位证书：机构名称',
  `pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥证书',
  `cert_download_date` datetime(0) NULL DEFAULT NULL COMMENT '证书下载时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `ca_org_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ca联合名称（申领证书后存，登时后提供）',
  `ascription_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ca归属表主键',
  `enc_cert_sn` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密证书序列号',
  `flow_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `cert_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书状态',
  `dn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '证书dn',
  `hash_alg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要算法',
  `signature_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名证书公钥',
  `encryption_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密证书公钥',
  `encryption_private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密证书密钥',
  `platform_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_org`(`user_id`, `org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ca归属明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_authorization
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_authorization`;
CREATE TABLE `t_s_ca_authorization`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批状态',
  `org_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `application_reason` varchar(2555) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请说明',
  `audit_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_authorization_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_authorization_detail`;
CREATE TABLE `t_s_ca_authorization_detail`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'CA机构的编号',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批状态',
  `org_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `application_reason` varchar(2555) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请说明',
  `audit_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人id',
  `authorization_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_copy_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_copy_pay`;
CREATE TABLE `t_s_ca_copy_pay`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'ca机构类型',
  `payment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `pay_count` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付数量',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '截止日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_s_ca_org
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_org`;
CREATE TABLE `t_s_ca_org`  (
  `id` double NULL DEFAULT NULL,
  `ca_org_type` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ca_org_full_name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ca_org_name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ca_effective` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ca证书(创建人-董雪松)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_pay`;
CREATE TABLE `t_s_ca_pay`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA机构编码',
  `platform_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `unified_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子交易共享码',
  `ca_payment_amount` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户在平台的CA缴费金额',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '证书有效期开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '证书过期时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ascription_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表id',
  `ca_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型 01个人证书/00企业证书',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user`(`user_id`) USING BTREE,
  INDEX `index_org`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ca购买授权记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ca_type
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ca_type`;
CREATE TABLE `t_s_ca_type`  (
  `id` double NULL DEFAULT NULL,
  `ca_org_type` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CA机构的编号',
  `ca_org_full_name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ca全称',
  `ca_org_name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ca简称',
  `ca_effective` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ca有效性',
  `sort_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺序号',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `copy_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单个副本金额'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ca类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_condition_type
-- ----------------------------
DROP TABLE IF EXISTS `t_s_condition_type`;
CREATE TABLE `t_s_condition_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `type_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型值',
  `field1` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段1',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `filter_condition_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '筛选条件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart`;
CREATE TABLE `t_s_depart`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `org_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `legal_real_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人名字',
  `legal_id_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证号',
  `legal_telephone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人手机号',
  `certification_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证状态 00临时,01已认证',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态:无审批: 空null临时作废，01正式; 有审批:空null临时,00审核中,02\r\n驳回（审核失败）,01通过(同时认证成功);',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构联系人身份证',
  `linker_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构联系人姓名',
  `link_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构联系人手机号',
  `link_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户账户',
  `registered_capital` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本',
  `taxpayer_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人类型',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `effective_date` datetime(0) NULL DEFAULT NULL COMMENT '生效日期',
  `is_perfection` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_legal_id_card` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册类型',
  `network_id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络身份证编号',
  `manual_audit` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `area_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '区域编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_depart_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart_info`;
CREATE TABLE `t_s_depart_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `org_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `tax_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税号',
  `tax_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人类型:00:一般纳税人 01小规模纳税人',
  `regcapital` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本',
  `bankname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bankaccount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本账户账号',
  `corporation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定代表人',
  `corporateid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证号码',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公司联系地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构扩展信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_depart_invitation_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart_invitation_record`;
CREATE TABLE `t_s_depart_invitation_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `initiator_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请发起人',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `invited_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请类型,00加入机构,01从机构移除',
  `invited_user_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被邀请人/或被移除',
  `invite_explain` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请说明/或移除某人的理由',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态 00待核中,01审核通过,02:审核不通过',
  `audit_explain` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `invited_way` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请方式 00管理员邀请,01成员邀请,02个人申请加入机构',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构邀请记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_filter_condition_type
-- ----------------------------
DROP TABLE IF EXISTS `t_s_filter_condition_type`;
CREATE TABLE `t_s_filter_condition_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `select_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件类型',
  `condition_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `condition_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点类型',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '筛选条件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_depart`;
CREATE TABLE `t_s_ht_depart`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `departname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `parentdepartid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父部门ID',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `org_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型(1-机构，2-部门)',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点ID',
  `cascade_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点层级ID',
  `sort_no` int(10) NULL DEFAULT NULL COMMENT '排序号',
  `is_del` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已删除',
  `is_auto_expand` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自动展开',
  `privilege_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特权状态  00:否  01:是',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_org_code`(`org_code`) USING BTREE,
  INDEX `index_org_type`(`org_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_depart_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_depart_info`;
CREATE TABLE `t_s_ht_depart_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `depart_role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主体类型',
  `org_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国别地区',
  `org_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `org_town` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区县',
  `corporation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定代表人',
  `corporateid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `ent_prpt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业性质',
  `unit_scape` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业人数',
  `belongindustry` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `belongindustry_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业代码',
  `ca_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA 证书编号',
  `qualevel_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资信等级',
  `descr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公司简介',
  `is_cert` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否三证合一',
  `businesslicence` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照号码',
  `nationaltaxno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记号',
  `orglicensecerno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证',
  `businesslicence_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照复印件',
  `nationaltaxno_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证复印件',
  `orglicensecerno_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证复印件',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人(机构管理员）',
  `use_Status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态',
  `isGeneralTaxpayer` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否一般纳税人',
  `taxpayercertificate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxpayer_identification_number` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `area_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `is_recommend` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否推荐供应商',
  `taxpayertel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话(用于开具专票)',
  `taxpayeraddr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址(用于开具专票)',
  `isShuihao` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '税号选择(00:税务登记号,01:统一社会信用代码)',
  `isOpenTicket` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '是否需要开具专票(00:否,01:是)',
  `ticketAttr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开专票授权委托书扫描件',
  `dtype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'TBOriginalDepartInfoEntity' COMMENT 'DTYPE',
  `is_original_verification` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原件是否已验证',
  `register_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '注册类型(00:机构,01:自然人)',
  `corporateAttr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证扫描件',
  `org_logo` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业Logo',
  `is_agree_share` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否同意共享',
  `founding_time` datetime(0) NULL DEFAULT NULL COMMENT '成立时间',
  `busy_scope` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '经营范围',
  `issuing_org` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核发机关机构',
  `ent_category` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业类别',
  `org_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市区',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域，00-境内||01-境外',
  `Overseas_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '境外活动证明号',
  `Overseas_attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '境外活动证件扫描件',
  `area_administration` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区域',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depart_info_id`(`id`) USING BTREE,
  INDEX `index_depart_info_departid`(`depart_id`) USING BTREE,
  INDEX `index_org_province`(`org_province`) USING BTREE,
  INDEX `index_org_country`(`org_country`) USING BTREE,
  INDEX `audit_status_index`(`audit_status`) USING BTREE,
  INDEX `usestatus_index`(`use_Status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_depart_linker
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_depart_linker`;
CREATE TABLE `t_s_ht_depart_linker`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `depart_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `linkname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `linktel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `linkerID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人身份证号码',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `link_post_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_function
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_function`;
CREATE TABLE `t_s_ht_function`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `functioniframe` smallint(6) NULL DEFAULT NULL COMMENT '菜单地址打开方式',
  `functionlevel` smallint(6) NULL DEFAULT NULL COMMENT '菜单等级',
  `functionname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名字',
  `functionorder` int(255) NULL DEFAULT NULL COMMENT '排序',
  `functionurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `parentfunctionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
  `iconid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标ID',
  `desk_iconid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '桌面图标ID',
  `functiontype` smallint(6) NULL DEFAULT NULL COMMENT '菜单类型',
  `function_icon_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ace图标样式',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_url`(`functionurl`(255)) USING BTREE,
  INDEX `index_functiontype`(`functiontype`) USING BTREE,
  INDEX `index_functionorder`(`functionorder`) USING BTREE,
  INDEX `index_group_url_type`(`functionurl`(255), `functiontype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_platform_config
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_platform_config`;
CREATE TABLE `t_s_ht_platform_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `use_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `platform` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台',
  `img_regist` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册图片',
  `img_backgroud` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `img_major` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主页面图片',
  `ico_favicon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站图标',
  `copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_role`;
CREATE TABLE `t_s_ht_role`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `role_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名字',
  `depart_ag_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门权限组ID',
  `role_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型1部门角色/0系统角色',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_role_function
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_role_function`;
CREATE TABLE `t_s_ht_role_function`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `functionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  `roleid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_role_user`;
CREATE TABLE `t_s_ht_role_user`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `roleid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_user`;
CREATE TABLE `t_s_ht_user`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实名字',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '有效状态（1-正常，0-锁定）',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `departid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `delete_flag` smallint(6) NULL DEFAULT NULL COMMENT '删除状态（0-正常，1-已删除）',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件地址',
  `mobile_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `img_url` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像url链接',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `oa_user_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'oa单点登录用户的id',
  `oa_depart_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'oa单点登录用户的机构id',
  `fixed_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机号码',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_login`(`password`, `user_name`) USING BTREE,
  INDEX `idx_deleteflg`(`delete_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_ht_user_org
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ht_user_org`;
CREATE TABLE `t_s_ht_user_org`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_org_id`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_s_operation_log`;
CREATE TABLE `t_s_operation_log`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `operation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作名称',
  `operation_type` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型（01：个人注册 02：机构注册 03：申请加入机构 04：机构审核通过 05：申请机构印章 06：授权机构印章）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `explains` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_s_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `t_s_pay_order`;
CREATE TABLE `t_s_pay_order`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id  ',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id  ',
  `pay_service_result_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付结果id',
  `pay_service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付服务规则id',
  `trans_number` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台流水号按规则生成 平台代号3-终端类型2-费用类型2-年月日时分秒-随机数',
  `pay_service_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型 00:ca购买,01平台入场费',
  `pay_mode` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式： 01支付宝 04支付微信',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `pay_callback_time` datetime(0) NULL DEFAULT NULL COMMENT '支付回调时间缴费时间',
  `is_refund` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '退款01，未退款00',
  `linker_tel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `invoice_msg` varchar(144) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `call_back_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调状态',
  `third_pay_order_id` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方流水号',
  `platform_code` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台代码',
  `invoice_status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开具发票状态  01已开票',
  `pay_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书类型 01个人证书/00企业证书',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_pay_order_pack
-- ----------------------------
DROP TABLE IF EXISTS `t_s_pay_order_pack`;
CREATE TABLE `t_s_pay_order_pack`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `platform_code` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台代码',
  `pay_service_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型 01个人证书/00企业证书',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `pay_count` bigint(20) NULL DEFAULT NULL COMMENT '数量',
  `pay_order_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `ca_org_type` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CA机构的编号',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_platform_ca
-- ----------------------------
DROP TABLE IF EXISTS `t_s_platform_ca`;
CREATE TABLE `t_s_platform_ca`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `platform_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台编码',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'CA机构编码',
  `key_alg` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密钥类型',
  `init_copy_num` tinyint(4) NULL DEFAULT NULL COMMENT '初始副本数量',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用状态',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_platform_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_platform_info`;
CREATE TABLE `t_s_platform_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自增id',
  `platform_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `platform_shortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台简称',
  `platform_code` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标识码',
  `platform_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台类型 0 交易平台 ，1 公共服务平台，2 监督平台',
  `platform_classify` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台分类 0 央企，1 第三方，2 交易中心 ',
  `platform_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台图标',
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `belong_letter` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属字母',
  `area_code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行政区域',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营机构id',
  `organization_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营机构名称',
  `operate_organ_code` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营机构统一社会信用代码',
  `leader_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接负责人姓名',
  `leader_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接负责人电话',
  `leader_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接负责人邮箱',
  `pub_service_plat_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对接的公共服务平台标识码',
  `platform_net` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统访问地址',
  `industry_code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `ca_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA证书编号',
  `states` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易平台状态 0：未提交审核1：待审核2：审核合格3：审核不合格4：审核超期',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `auditor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态0未删除1已删除',
  `star_platform` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星级平台',
  `charging_method` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '00：平台收费，01：ca收费',
  `platform_effective` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台有效性  00:平台未接入  01：平台接入',
  `check_certification` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测认证',
  `ca_certification` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CA互认认证',
  `public_chain_certification` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公信链认证',
  `docking_explain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '对接说明',
  `allow_user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许登录的用户类型 01仅个人/02仅机构/03个人和机构',
  `required_ca_cert` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用证书 00不需要/01需要',
  `login_cert_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录证书类型 01仅个人/02优先个人/03仅单位',
  `algorithm` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密算法',
  `support_seal` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '99' COMMENT '支持的证书类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_platformcode`(`platform_code`) USING BTREE,
  INDEX `AK_KRECORD_NUMBER`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台类型信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_platform_key_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_platform_key_info`;
CREATE TABLE `t_s_platform_key_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `platform_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台编码',
  `cert` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '私钥',
  `cert_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公钥',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform_code_index`(`platform_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_s_platfrom_extra_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_platfrom_extra_info`;
CREATE TABLE `t_s_platfrom_extra_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `platform_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台编码',
  `today_bulletin_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '今日更新公告条数',
  `tender_project_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '累计发布项目',
  `transaction_amount` decimal(14, 0) NULL DEFAULT NULL COMMENT '交易金额',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_policy_statute
-- ----------------------------
DROP TABLE IF EXISTS `t_s_policy_statute`;
CREATE TABLE `t_s_policy_statute`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `policy_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政策类型',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id 个人证书时',
  `rel_date` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政策法规主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_decrypt_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_decrypt_info`;
CREATE TABLE `t_s_scanning_decrypt_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `encrypt_str` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密信息  对称秘钥串密文集合（多个包可能）',
  `encrypt_time` datetime(0) NULL DEFAULT NULL COMMENT '加密时间',
  `unified_transaction_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `personal_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人交易码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `decrypt_str` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解密信息  对称秘钥串集合（多个包可能）解密开的 ',
  `decrypt_time` datetime(0) NULL DEFAULT NULL COMMENT '解密时间',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enkey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'cakey',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫码解密信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_decrypt_info_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_decrypt_info_bak`;
CREATE TABLE `t_s_scanning_decrypt_info_bak`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `encrypt_str` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密信息  对称秘钥串密文集合（多个包可能）',
  `encrypt_time` datetime(0) NULL DEFAULT NULL COMMENT '加密时间',
  `unified_transaction_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `personal_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人交易码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `decrypt_str` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解密信息  对称秘钥串集合（多个包可能）解密开的 ',
  `decrypt_time` datetime(0) NULL DEFAULT NULL COMMENT '解密时间',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enkey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'cakey',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫码解密信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_encrypt_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_encrypt_info`;
CREATE TABLE `t_s_scanning_encrypt_info`  (
  `id` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `unified_transaction_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `sign_ori_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名原值',
  `signature_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名值',
  `enc_pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密的公钥证书',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sign_cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名证书的序列号',
  `enc_cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_unique`(`t_id`) USING BTREE,
  UNIQUE INDEX `tid_encrypt`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫码加密信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_encrypt_info_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_encrypt_info_bak`;
CREATE TABLE `t_s_scanning_encrypt_info_bak`  (
  `id` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `unified_transaction_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `sign_ori_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名原值',
  `signature_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名值',
  `enc_pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密的公钥证书',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sign_cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名证书的序列号',
  `enc_cert_sn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_unique`(`t_id`) USING BTREE,
  UNIQUE INDEX `tid_encrypt`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫码加密信息历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_login_info_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_login_info_record`;
CREATE TABLE `t_s_scanning_login_info_record`  (
  `id` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `status_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码',
  `identification_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `identification_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `expiration_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `tid_login`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录状态记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_login_info_record_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_login_info_record_bak`;
CREATE TABLE `t_s_scanning_login_info_record_bak`  (
  `id` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `status_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码',
  `identification_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `identification_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `expiration_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `tid_login`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录状态记录历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_sign_value
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_sign_value`;
CREATE TABLE `t_s_scanning_sign_value`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `signature_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CA签名值',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `telephone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `sign_event_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务Id',
  `sign_ori_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名原值',
  `cert_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_transaction_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人交易码',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `algorithm` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_user_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bingding_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_org_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台用户机构编码',
  `login_user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录类型 01个人/02机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_sign`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签名记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_sign_value_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_sign_value_bak`;
CREATE TABLE `t_s_scanning_sign_value_bak`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `signature_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CA签名值',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `telephone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `platform_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `sign_event_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务Id',
  `sign_ori_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名原值',
  `cert_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_cert` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `algorithm` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_user_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bingding_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_org_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台用户机构编码',
  `login_user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录类型 01个人/02机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_sign`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签名记录历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_status_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_status_record`;
CREATE TABLE `t_s_scanning_status_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `sweep_code_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码状态  二位码扫描状 01已扫00 未扫',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `q_r_code_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码类型 01加密;02解密;0201开标大厅解密04签章 05绑定06扫码登录07解绑08 获取扫码人的信息',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码的手机号',
  `identification_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码证件号',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_status`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫描状态记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_scanning_status_record_bak
-- ----------------------------
DROP TABLE IF EXISTS `t_s_scanning_status_record_bak`;
CREATE TABLE `t_s_scanning_status_record_bak`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `sweep_code_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码状态  二位码扫描状 01已扫00 未扫',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `q_r_code_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码类型 01加密;02解密;0201开标大厅解密04签章 05绑定06扫码登录07解绑08 获取扫码人的信息',
  `telephone_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码的手机号',
  `identification_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码证件号',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tid_status`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫描状态记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_seal_authorize_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_s_seal_authorize_apply`;
CREATE TABLE `t_s_seal_authorize_apply`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书审核状态:无审批: 空null临时作废，01正式; 有审批:空null临时,00审核中,02\r\n驳回,01通过;',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `application_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `seal_to_org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorize_start_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权开始时间',
  `authorize_end_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权截止时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '印章申请记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_seal_history
-- ----------------------------
DROP TABLE IF EXISTS `t_s_seal_history`;
CREATE TABLE `t_s_seal_history`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户 id',
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组织id',
  `belong_role` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '签章归属角色(person/organization)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ids_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '签章历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_seal_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_seal_record`;
CREATE TABLE `t_s_seal_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `seal_belong` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '印章属于个人还是企业 01 个人， 02 企业',
  `seal_to_org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '印章id',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态00临时,01正式,02作废',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `authorize_start_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权开始时间',
  `authorize_end_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权截止时间',
  `sign_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01公章、02业务章、03合同章',
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '印章表使用记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_seal_to_org
-- ----------------------------
DROP TABLE IF EXISTS `t_s_seal_to_org`;
CREATE TABLE `t_s_seal_to_org`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id 单位证书时',
  `legal_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `sign_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01公章、02业务章、03合同章',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `authorize_start_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权开始时间',
  `authorize_end_time` datetime(0) NULL DEFAULT NULL COMMENT '签章授权截止时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `seal_image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签章图片',
  `authorization_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联授权串',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构印章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_service_level
-- ----------------------------
DROP TABLE IF EXISTS `t_s_service_level`;
CREATE TABLE `t_s_service_level`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `level` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `status` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 01生效 02失效',
  `type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_sign_to_personal
-- ----------------------------
DROP TABLE IF EXISTS `t_s_sign_to_personal`;
CREATE TABLE `t_s_sign_to_personal`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id 个人证书时',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `telephone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `times_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '签名使用次数',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态 00临时,01正式,02作废',
  `sign_image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签章图片',
  `seal_to_org` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorization_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联授权串',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人签名表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `t_s_sms_template`;
CREATE TABLE `t_s_sms_template`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `template_variable_keys` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '短信模板变量key  多个用英文‘,’分隔',
  `template_enum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板枚举',
  `template_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信模板CODE。',
  `template_type` int(2) NOT NULL COMMENT '短信类型。   0：验证码。1：短信通知。2：推广短信。3：国际/港澳台消息。',
  `template_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称，长度为1~30个字符。',
  `template_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板内容，长度为1~500个字符。模板内容需要符合文本短信模板规范或国际/港澳台短信模板规范。',
  `remark` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信模板申请说明。请在申请说明中描述您的业务使用场景，长度为1~100个字符。',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板可用状态，00:否  01:是',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_system_config
-- ----------------------------
DROP TABLE IF EXISTS `t_s_system_config`;
CREATE TABLE `t_s_system_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置类型',
  `config_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '参数的值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '参数类型',
  `use_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用状态',
  `mark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_task_attribute_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_s_task_attribute_detail`;
CREATE TABLE `t_s_task_attribute_detail`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `wait_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请业务id',
  `biz_attribute` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务属性',
  `biz_attribute_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '业务值',
  `biz_index` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务属性明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_tool_scanning_login_info_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_tool_scanning_login_info_record`;
CREATE TABLE `t_s_tool_scanning_login_info_record`  (
  `id` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `t_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件ID 扫码后的唯一标识',
  `status_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码',
  `identification_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `identification_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `supplierid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `expiration_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unified_transaction_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ca_org_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `tid_login`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录状态记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_user_info_change_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_info_change_record`;
CREATE TABLE `t_s_user_info_change_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `telephone_before` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更前手机号',
  `telephone_new` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更后手机号',
  `device_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ids_telephone_before`(`telephone_before`) USING BTREE,
  INDEX `ids_telephone_new`(`telephone_new`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息变更记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_login_record`;
CREATE TABLE `t_s_user_login_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `telephone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号码',
  `device_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备id',
  `device_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备名称',
  `device_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '版本号',
  `ip` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录ip',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_user_occupy_ca
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_occupy_ca`;
CREATE TABLE `t_s_user_occupy_ca`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ca_org_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'ca编码',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机构id',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `pay_order_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单表主键',
  `ca_remain_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配额表主键',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_s_user_org_info
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_org_info`;
CREATE TABLE `t_s_user_org_info`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构id',
  `is_manager` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '是否是管理员00否/01是',
  `is_legal` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '是否是法人00否/01是',
  `apply_org_manager_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请成为机构管理员的状态 00审核中、01已是管理员、02审核不通过、03未申请成为管理员',
  `unified_transaction_code` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `shared_status_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码状态(正常01、作废02、冻结03)',
  `join_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `invitation_time` datetime(0) NULL DEFAULT NULL COMMENT '邀请时间',
  `user_org_card` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_user_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_org_id`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构扩展记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_wait_ready_task
-- ----------------------------
DROP TABLE IF EXISTS `t_s_wait_ready_task`;
CREATE TABLE `t_s_wait_ready_task`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `task_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务标题',
  `apply_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人id',
  `audit_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核id',
  `apply_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办业务类型 00，申领个人,01 申请单位ca，02 申领单位ca，03申请单位授权,04个人申请加入机构,05个人申请成为机构管理员',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核(邀请)状态:无审批: 空null临时作废，01正式; 有审批:空null临时,00审核中,02\r\n驳回,01通过 ;',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `biz_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已办表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_wait_task
-- ----------------------------
DROP TABLE IF EXISTS `t_s_wait_task`;
CREATE TABLE `t_s_wait_task`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `task_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务标题',
  `apply_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人id',
  `audit_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核id',
  `apply_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办业务类型 00，申领个人,01 申请单位ca，02 申领单位ca，03申请单位授权,04个人申请加入机构,05个人申请成为机构管理员',
  `audit_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核(邀请)状态:无审批: 空null临时作废，01正式; 有审批:空null临时,00审核中,02\r\n驳回,01通过 ;',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `biz_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请业务id',
  `notice_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_read_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_content_read_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_content_read_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '待办表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
