/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.20-log : Database - jee_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jee_web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jee_web`;

/*Table structure for table `codegen_column` */

DROP TABLE IF EXISTS `codegen_column`;

CREATE TABLE `codegen_column` (
  `id` varchar(32) NOT NULL COMMENT '字段主键',
  `table_id` varchar(32) DEFAULT NULL COMMENT '关联表的ID',
  `column_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `type_name` varchar(200) DEFAULT NULL COMMENT '字段类型名称',
  `column_size` varchar(10) DEFAULT NULL COMMENT '字段长度',
  `decimal_digits` varchar(10) DEFAULT NULL COMMENT '小数部分的位数',
  `parmary_key` tinyint(2) DEFAULT NULL COMMENT '是否为主键',
  `imported_key` tinyint(2) DEFAULT NULL COMMENT '是否为外键',
  `column_def` varchar(200) DEFAULT NULL COMMENT '默认值',
  `is_nullable` tinyint(200) DEFAULT NULL COMMENT '是否允许为空',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `is_form` varchar(45) DEFAULT NULL COMMENT '是否表单显示',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `input_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_group` varchar(200) DEFAULT NULL COMMENT '字典分组',
  `sort` int(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `regex_valid` varchar(20) DEFAULT NULL COMMENT '验证规则',
  `valid_type` varchar(20) DEFAULT NULL COMMENT '校验类型',
  `max_size` int(5) DEFAULT NULL COMMENT '最大长度',
  `min_size` int(5) DEFAULT NULL COMMENT '最小长度',
  `max_value` varchar(30) DEFAULT NULL COMMENT '最大值',
  `min_value` varchar(30) DEFAULT NULL COMMENT '最小值',
  `nullmsg` varchar(255) DEFAULT NULL COMMENT '为空提示',
  `query_model` varchar(20) DEFAULT NULL COMMENT '查询模式',
  `form_type` varchar(20) DEFAULT NULL COMMENT '显示表单类型',
  `foreign_table` varchar(45) DEFAULT NULL COMMENT '外键表',
  PRIMARY KEY (`id`),
  KEY `codegen_table_column_del_flag` (`del_flag`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `codegen_column_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `codegen_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码字段表';

/*Data for the table `codegen_column` */

insert  into `codegen_column`(`id`,`table_id`,`column_name`,`type_name`,`column_size`,`decimal_digits`,`parmary_key`,`imported_key`,`column_def`,`is_nullable`,`java_type`,`java_field`,`is_list`,`is_query`,`is_form`,`query_type`,`input_type`,`dict_group`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`regex_valid`,`valid_type`,`max_size`,`min_size`,`max_value`,`min_value`,`nullmsg`,`query_model`,`form_type`,`foreign_table`) values 
('40281e815c580ea3015c58c75e94002e','40281e815c580ea3015c58c75e89002d','id','VARCHAR','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','字段主键','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75e99002f','40281e815c580ea3015c58c75e89002d','name','VARCHAR','255','',0,0,'',0,'String','name','1','0','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','名称','0','','*',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75e9d0030','40281e815c580ea3015c58c75e89002d','create_by','VARCHAR','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','创建者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75ea10031','40281e815c580ea3015c58c75e89002d','create_date','DATE','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','创建时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75ea60032','40281e815c580ea3015c58c75e89002d','update_by','VARCHAR','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','更新者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75eab0033','40281e815c580ea3015c58c75e89002d','update_date','DATE','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','更新时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75eaf0034','40281e815c580ea3015c58c75e89002d','del_flag','CHAR','1','0',0,0,'0',1,'String','delFlag','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815c580ea3015c58c75eb30035','40281e815c580ea3015c58c75e89002d','remarks','VARCHAR','255','0',0,0,'',1,'String','remarks','0','0','1','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','备注信息','0','','',NULL,NULL,'','','','input','editor','请选择主表'),
('40281e815c58ccb7015c58d9b3bd0016','40281e815c580ea3015c58c75e89002d','testdate','DATE','255','',0,0,'',0,'Date','testdate','0','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','时间','0','','',NULL,NULL,'','','','input','dateselect','请选择主表'),
('40281e815c8f3512015c8f3a078e0001','40281e815c8f3512015c8f3a07440000','id','','32','0',1,0,'',0,'String','id','1','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','id','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07ad0002','40281e815c8f3512015c8f3a07440000','senddata','','255','0',0,0,'',0,'String','senddata','1','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','发送数据','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07b10003','40281e815c8f3512015c8f3a07440000','response_date','','19','0',0,0,'',1,'Date','responseDate','1','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','响应时间','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07b50004','40281e815c8f3512015c8f3a07440000','email','','2147483647','0',0,0,'',0,'String','email','0','0','0','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','联系电话','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07b90005','40281e815c8f3512015c8f3a07440000','business_type','','4','0',0,0,'',0,'String','businessType','1','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','业务类型','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07bd0006','40281e815c8f3512015c8f3a07440000','del_flag','','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07c20007','40281e815c8f3512015c8f3a07440000','status','','4','0',0,0,'',0,'String','status','1','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','发送状态','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07c60008','40281e815c8f3512015c8f3a07440000','subject','','255','0',0,0,'',1,'String','subject','1','0','0','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','主题','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07ca0009','40281e815c8f3512015c8f3a07440000','msg','','40','0',0,0,'',1,'String','msg','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','返回消息','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07ce000a','40281e815c8f3512015c8f3a07440000','content','','255','0',0,0,'',1,'String','content','0','0','0','eq',NULL,'',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','模板类型','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3a07d2000b','40281e815c8f3512015c8f3a07440000','remarks','','255','0',0,0,'',1,'String','remarks','0','0','0','eq',NULL,'',11,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:21','备注信息','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddedd000d','40281e815c8f3512015c8f3ddecc000c','template_content','','255','0',0,0,'',0,'String','templateContent','1','0','1','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','模版内容','0','','',NULL,NULL,'','','','input','editor',NULL),
('40281e815c8f3512015c8f3ddee1000e','40281e815c8f3512015c8f3ddecc000c','id','','32','0',1,0,'',0,'String','id','1','0','1','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','id','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddee4000f','40281e815c8f3512015c8f3ddecc000c','remarks','','255','0',0,0,'',1,'String','remarks','1','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','备注信息','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddee70010','40281e815c8f3512015c8f3ddecc000c','business_type','','4','0',0,0,'',0,'String','businessType','1','0','1','eq',NULL,'businesstype',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','业务类型','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddeea0011','40281e815c8f3512015c8f3ddecc000c','update_by','','32','0',0,0,'',1,'String','updateBy','1','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','更新者','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddeed0012','40281e815c8f3512015c8f3ddecc000c','create_date','','19','0',0,0,'',1,'Date','createDate','1','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','创建时间','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddef10013','40281e815c8f3512015c8f3ddecc000c','del_flag','','1','0',0,0,'0',0,'String','delFlag','1','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddef50014','40281e815c8f3512015c8f3ddecc000c','template_subject','','20','0',0,0,'',0,'String','templateSubject','1','0','1','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','模版主题','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddef90015','40281e815c8f3512015c8f3ddecc000c','name','','255','0',0,0,'',0,'String','name','1','0','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','模版名称','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddefc0016','40281e815c8f3512015c8f3ddecc000c','create_by','','32','0',0,0,'',1,'User','createBy','1','0','0','eq',NULL,'',11,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','创建者','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddeff0017','40281e815c8f3512015c8f3ddecc000c','code','','255','0',0,0,'',0,'String','code','1','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','模版编码','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c8f3512015c8f3ddf030018','40281e815c8f3512015c8f3ddecc000c','update_date','','19','0',0,0,'',1,'Date','updateDate','1','0','0','eq',NULL,'',12,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:26','更新时间','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827960039','40281e815c912406015c914826de0038','id','','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','字段主键','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827bf003a','40281e815c912406015c914826de0038','create_by','','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','创建者','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827c3003b','40281e815c912406015c914826de0038','create_date','','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','创建时间','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827c6003c','40281e815c912406015c914826de0038','update_by','','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','更新者','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827ca003d','40281e815c912406015c914826de0038','update_date','','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','更新时间','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827ce003e','40281e815c912406015c914826de0038','del_flag','','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827d1003f','40281e815c912406015c914826de0038','remarks','','255','0',0,0,'',1,'String','remarks','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','备注信息','0','','',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827d50040','40281e815c912406015c914826de0038','title','','255','',0,0,'',0,'String','title','1','1','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','标题','0','','*',NULL,NULL,'','','','input','input',NULL),
('40281e815c912406015c914827d80041','40281e815c912406015c914826de0038','content','','255','',0,0,'',0,'Text','content','1','1','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','内容','0','','*',NULL,NULL,'','','','input','textarea',NULL),
('40281e815c912406015c914827db0042','40281e815c912406015c914826de0038','status','','4','',0,0,'',0,'String','status','1','1','1','eq',NULL,'sf',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:43','发布状态','0','','*',NULL,NULL,'','','','input','radiobox',NULL),
('40281e815cb51519015cb553591b0001','40281e815cb51519015cb55358d70000','orderno','VARCHAR','50','0',0,0,'',0,'String','orderno','1','0','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','订单号','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb55359220002','40281e815cb51519015cb55358d70000','update_by','VARCHAR','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','更新者','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb55359250003','40281e815cb51519015cb55358d70000','create_by','VARCHAR','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','创建者','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb553592a0004','40281e815cb51519015cb55358d70000','money','VARCHAR','22','0',0,0,'',0,'String','money','0','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','订单金额','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb553592e0005','40281e815cb51519015cb55358d70000','del_flag','VARCHAR','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb55359320006','40281e815cb51519015cb55358d70000','remarks','VARCHAR','255','0',0,0,'',1,'String','remarks','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','备注信息','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb55359360007','40281e815cb51519015cb55358d70000','update_date','DATE','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','更新时间','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb553593a0008','40281e815cb51519015cb55358d70000','create_date','DATE','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','创建时间','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb553593e0009','40281e815cb51519015cb55358d70000','id','VARCHAR','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','主键','0','','',NULL,NULL,'','','','input','input',''),
('40281e815cb51519015cb5535943000a','40281e815cb51519015cb55358d70000','orderdate','VARCHAR','19','0',0,0,'',0,'Date','orderdate','1','0','1','eq',NULL,'',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','订单日期','0','','',NULL,NULL,'','','','input','dateselect',''),
('40281e815cb55466015cb55718c70001','40281e815cb55466015cb55718970000','remarks','VARCHAR','255','0',0,0,'',1,'String','remarks','0','0','0','eq',NULL,'',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','备注信息','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718cd0002','40281e815cb55466015cb55718970000','update_date','DATE','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','更新时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718d10003','40281e815cb55466015cb55718970000','update_by','VARCHAR','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','更新者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718d60004','40281e815cb55466015cb55718970000','create_date','VARCHAR','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','创建时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718db0005','40281e815cb55466015cb55718970000','fltno','VARCHAR','50','0',0,0,'',0,'String','fltno','1','0','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','航班号','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718df0006','40281e815cb55466015cb55718970000','id','VARCHAR','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','id','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718e40007','40281e815cb55466015cb55718970000','del_flag','VARCHAR','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718e90008','40281e815cb55466015cb55718970000','create_by','VARCHAR','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','创建者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55718ee0009','40281e815cb55466015cb55718970000','order_id','VARCHAR','32','0',0,0,'',1,'String','order','0','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','order_id','0','','',NULL,NULL,'','','','input','input','test_order_main'),
('40281e815cb55466015cb55718f3000a','40281e815cb55466015cb55718970000','flytime','DATE','19','0',0,0,'',0,'Date','flytime','1','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','航班时间','0','','',NULL,NULL,'','','','input','dateselect','请选择主表'),
('40281e815cb55466015cb5573438000c','40281e815cb55466015cb5573425000b','update_by','VARCHAR','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','更新者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb557343d000d','40281e815cb55466015cb5573425000b','id','VARCHAR','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','id','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb5573442000e','40281e815cb55466015cb5573425000b','order_id','VARCHAR','32','0',0,0,'',1,'String','order','0','0','0','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','order_id','0','','',NULL,NULL,'','','','input','input','test_order_main'),
('40281e815cb55466015cb5573446000f','40281e815cb55466015cb5573425000b','name','VARCHAR','50','0',0,0,'',0,'String','name','1','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','客户姓名','0','','*',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb557344a0010','40281e815cb55466015cb5573425000b','create_date','DATE','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','创建时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb557344e0011','40281e815cb55466015cb5573425000b','sex','VARCHAR','4','0',0,0,'',0,'String','sex','1','0','1','eq',NULL,'sex',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','性别','0','','*',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55734520012','40281e815cb55466015cb5573425000b','phone','VARCHAR','11','0',0,0,'',0,'String','phone','1','0','1','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','电话','0','','*',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55734560013','40281e815cb55466015cb5573425000b','remarks','VARCHAR','255','0',0,0,'',1,'String','remarks','1','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','备注信息','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb557345a0014','40281e815cb55466015cb5573425000b','update_date','DATE','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','更新时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb557345e0015','40281e815cb55466015cb5573425000b','del_flag','VARCHAR','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',11,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cb55466015cb55734620016','40281e815cb55466015cb5573425000b','create_by','VARCHAR','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','创建者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253ee10003','40281e815cef1f76015cef253e6f0002','id','VARCHAR','32','0',1,0,'',0,'String','id','0','0','0','eq',NULL,'',1,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','字段主键','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253ef90004','40281e815cef1f76015cef253e6f0002','create_by','VARCHAR','32','0',0,0,'',1,'User','createBy','0','0','0','eq',NULL,'',4,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','创建者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253efd0005','40281e815cef1f76015cef253e6f0002','create_date','DATE','19','0',0,0,'',1,'Date','createDate','0','0','0','eq',NULL,'',5,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','创建时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f000006','40281e815cef1f76015cef253e6f0002','update_by','VARCHAR','32','0',0,0,'',1,'User','updateBy','0','0','0','eq',NULL,'',6,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','更新者','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f040007','40281e815cef1f76015cef253e6f0002','update_date','DATE','19','0',0,0,'',1,'Date','updateDate','0','0','0','eq',NULL,'',7,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','更新时间','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f070008','40281e815cef1f76015cef253e6f0002','del_flag','VARCHAR','1','0',0,0,'0',0,'String','delFlag','0','0','0','eq',NULL,'',8,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','删除标记（0：正常；1：删除）','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f0b0009','40281e815cef1f76015cef253e6f0002','remarks','VARCHAR','255','0',0,0,'',1,'String','remarks','0','0','1','eq',NULL,'',3,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','备注信息','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f0e000a','40281e815cef1f76015cef253e6f0002','name','VARCHAR','100','0',0,0,'',1,'String','name','1','0','1','eq',NULL,'',2,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','机构名称','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f11000b','40281e815cef1f76015cef253e6f0002','parent_id','VARCHAR','32','0',0,0,'',1,'String','parentId','1','0','1','eq',NULL,'',9,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','父节点','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40281e815cef1f76015cef253f15000c','40281e815cef1f76015cef253e6f0002','parent_ids','VARCHAR','1000','0',0,0,'',1,'String','parentIds','0','0','0','eq',NULL,'',10,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','父节点路径','0','','',NULL,NULL,'','','','input','input','请选择主表'),
('40288ab85ce39796015ce39a0ec20001','40288ab85ce39796015ce39a0e9a0000','phone','longtext','2147483647','0',0,0,NULL,0,'String','phone','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'联系电话','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ec90002','40288ab85ce39796015ce39a0e9a0000','msg','varchar','40','0',0,0,NULL,1,'String','msg','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'返回消息','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ecd0003','40288ab85ce39796015ce39a0e9a0000','remarks','varchar','255','0',0,0,NULL,1,'String','remarks','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'备注信息','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ed10004','40288ab85ce39796015ce39a0e9a0000','template_id','varchar','8','0',0,0,NULL,1,'String','templateId','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'模板ID','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ed50005','40288ab85ce39796015ce39a0e9a0000','smsid','varchar','50','0',0,0,NULL,1,'String','smsid','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'发送响应消息ID','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ed90006','40288ab85ce39796015ce39a0e9a0000','response_date','datetime','19','0',0,0,NULL,1,'Date','responseDate','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'响应时间','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0edd0007','40288ab85ce39796015ce39a0e9a0000','template_content','varchar','255','0',0,0,NULL,1,'String','templateContent','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'模板类型','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ee10008','40288ab85ce39796015ce39a0e9a0000','id','varchar','32','0',1,0,NULL,0,'String','id','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'id','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ee60009','40288ab85ce39796015ce39a0e9a0000','business_type','varchar','4','0',0,0,NULL,0,'String','businessType','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'业务类型','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0eea000a','40288ab85ce39796015ce39a0e9a0000','code','varchar','40','0',0,0,NULL,1,'String','code','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'返回码','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0eee000b','40288ab85ce39796015ce39a0e9a0000','del_flag','varchar','1','0',0,0,'0',0,'String','delFlag','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'删除标记（0：正常；1：删除）','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0ef3000c','40288ab85ce39796015ce39a0e9a0000','status','varchar','4','0',0,0,NULL,0,'String','status','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'发送状态','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL),
('40288ab85ce39796015ce39a0efa000d','40288ab85ce39796015ce39a0e9a0000','senddata','varchar','255','0',0,0,NULL,0,'String','senddata','1','0','1','eq',NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23',NULL,NULL,'发送数据','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'input',NULL);

/*Table structure for table `codegen_scheme` */

DROP TABLE IF EXISTS `codegen_scheme`;

CREATE TABLE `codegen_scheme` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `table_type` varchar(2000) DEFAULT NULL COMMENT '表类型',
  `path_name` varchar(2000) DEFAULT NULL COMMENT '代码生成目录',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `entity_name` varchar(30) DEFAULT NULL COMMENT '实体名',
  `table_name` varchar(30) DEFAULT NULL COMMENT '表名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_desc` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `codegen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

/*Data for the table `codegen_scheme` */

insert  into `codegen_scheme`(`id`,`table_type`,`path_name`,`package_name`,`module_name`,`entity_name`,`table_name`,`sub_module_name`,`function_name`,`function_desc`,`function_author`,`table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('40281e815c580ea3015c58c77abc0036','1','D:\\Workspaces\\mavengzfzkj\\jeeweb-mybatis','cn.jeeweb.modules','test','SingleTable','','','单表测试','单表测试','jeeweb','40281e815c580ea3015c58c75e89002d','4028ea815a3d2a8c015a3d2f8d2a0002','2017-05-30 17:54:47','4028ea815a3d2a8c015a3d2f8d2a0002','2017-05-30 17:54:49',NULL,'0'),
('40281e815c6bb87e015c6c1df2e3008b','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','OrderMain','','','订单主菜单','订单主菜单','jeeweb','40281e815c6bb87e015c6c118a19006a','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:01','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:16',NULL,'0'),
('40281e815c6bb87e015c6c1e4124008c','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','OrderTicket','','','订单机票信息','订单机票信息','jeeweb','40281e815c6bb87e015c6c170d450075','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:21','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:26',NULL,'0'),
('40281e815c6bb87e015c6c1e61be008d','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','OrderCustomer','','','订单客户信息','订单客户信息','jeeweb','40281e815c6bb87e015c6c1bb4d1007f','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:29','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-03 12:02:33',NULL,'0'),
('40281e815c8f3512015c8f3fda260019','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','email','EmailSendLog','','','邮件发送日志','邮件发送日志','jeeweb','40281e815c8f3512015c8f3a07440000','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:45:45','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:46:06',NULL,'0'),
('40281e815c8f3512015c8f403fc1001a','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','email','EmailTemplate','','','邮件发送模板','邮件发送模板','jeeweb','40281e815c8f3512015c8f3ddecc000c','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:46:11','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:46:14',NULL,'0'),
('40281e815c912406015c9148f0780043','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','oa','OaNotification','','','通知公告','通知公告','jeeweb','40281e815c912406015c914826de0038','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:55','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:15:17',NULL,'0'),
('40281e815cb55466015cb558f36a0017','2','D:\\Workspaces\\mavengzfzkj\\jeeweb-mybatis','cn.jeeweb.modules','test','TestOrderMain','','','订单主表','订单主表','jeeweb','40281e815cb51519015cb55358d70000','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:18:44','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:18:52',NULL,'0'),
('40281e815cb55aca015cb57180fa0000','3','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','testest','TestOrderTicket','','','机票信息','机票信息','jeeweb','40281e815cb55466015cb55718970000','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:45:33','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:45:41',NULL,'0'),
('40281e815cb5eb7c015cb5edc2ef0002','3','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','TestOrderCustomer','','','客户信息','客户信息','jeeweb','40281e815cb55466015cb5573425000b','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 20:01:17','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 20:01:21',NULL,'0'),
('40281e815cef1f76015cef25771f000d','4','D:\\Workspaces\\mavengzfzkj\\jeeweb-mybatis','cn.jeeweb.modules','test','TestTree','','','测试数','测试数','jeeweb','40281e815cef1f76015cef253e6f0002','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-28 22:40:28','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-28 22:40:35',NULL,'0'),
('40281e815d0df780015d0e218ac60000','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','TTest','','','测试','测试','jeeweb','40281e815cee3be2015cef05ab4c0009','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-04 23:04:25','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-04 23:04:30',NULL,'0'),
('40288ab85c8593cd015c859c6cd80014','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','sms','SmsTemplate','','','短信模版','短信模版','jeeweb','40288ab85c8593cd015c8599bb420001','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-08 10:50:40','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-08 10:50:52',NULL,'0'),
('40288ab85c85fa54015c860c65d10022','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','sms','SmsSendLog','','','短信发送日志','短信发送日志','jeeweb','40288ab85c85fa54015c85fea121000c','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-08 12:52:58','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-08 12:53:05',NULL,'0'),
('40288ab85ce39796015ce39a217c000e','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','SmsSendLog','','','发送日志','发送日志','jeeweb','40288ab85ce39796015ce39a0e9a0000','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:28','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:39',NULL,'0'),
('40288ab85ce39796015ce39c708f0018',NULL,'D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules',NULL,'TTestTest','t_test_test',NULL,'测试表','测试表','jeeweb','40288ab85ce39796015ce39c661c000f','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:54:59',NULL,NULL,NULL,'0'),
('40288ab85d0cb564015d0cb653af0000','1','D:\\Workspaces\\mavengzfzkj\\jeeweb','cn.jeeweb.modules','test','TestTestSingle','','','测试啦','测试啦','jeeweb','40288ab85d0b718b015d0b72a92e0000','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-04 16:27:41','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-04 16:27:46',NULL,'0');

/*Table structure for table `codegen_table` */

DROP TABLE IF EXISTS `codegen_table`;

CREATE TABLE `codegen_table` (
  `id` varchar(32) NOT NULL COMMENT '生成方案主键',
  `title` varchar(200) DEFAULT NULL COMMENT '实体名称',
  `table_name` varchar(200) DEFAULT NULL COMMENT '实体名称',
  `table_type` varchar(10) DEFAULT NULL COMMENT '表的类型',
  `table_pk_type` varchar(5) DEFAULT NULL COMMENT '数据主键类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `sync_database` tinyint(1) DEFAULT NULL COMMENT '是否同步数据库',
  `class_name` varchar(50) DEFAULT NULL COMMENT '实体名称',
  PRIMARY KEY (`id`),
  KEY `codegen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成信息';

/*Data for the table `codegen_table` */

insert  into `codegen_table`(`id`,`title`,`table_name`,`table_type`,`table_pk_type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`sync_database`,`class_name`) values 
('40281e815c580ea3015c58c75e89002d',NULL,'test_single_table','1',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-05-30 17:54:39','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:22','单表测试','0',1,'SingleTable'),
('40281e815c8f3512015c8f3a07440000','email_send_log','email_send_log','1',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:39:23','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:40:09','邮件发送日志','0',1,'EmailSendLog'),
('40281e815c8f3512015c8f3ddecc000c','email_template','email_template','1',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:35','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 07:43:48','邮件发送模板','0',1,NULL),
('40281e815c912406015c914826de0038',NULL,'oa_notification','1',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:14:03','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-10 17:15:24','通知公告','0',1,NULL),
('40281e815cb51519015cb55358d70000','test_order_main','test_order_main','2',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:12:37','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:26:40','订单主表','0',1,'TestOrderMain'),
('40281e815cb55466015cb55718970000','test_order_ticket','test_order_ticket','3',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:16:43','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 20:05:28','机票信息','0',1,'TestOrderTicket'),
('40281e815cb55466015cb5573425000b','test_order_customer','test_order_customer','3',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-17 17:16:50','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 18:37:21','客户信息','0',1,'TestOrderCustomer'),
('40281e815cef1f76015cef253e6f0002',NULL,'test_tree','4',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-28 22:40:14','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:05:47','测试数','0',1,'TestTree'),
('40288ab85ce39796015ce39a0e9a0000','sms_send_log','sms_send_log','1',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:23','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-26 16:52:39',NULL,'0',1,'SmsSendLog');

/*Table structure for table `email_send_log` */

DROP TABLE IF EXISTS `email_send_log`;

CREATE TABLE `email_send_log` (
  `id` varchar(32) NOT NULL,
  `email` longtext NOT NULL COMMENT '联系电话',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '模板类型',
  `senddata` varchar(255) NOT NULL COMMENT '发送数据',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `business_type` varchar(4) DEFAULT NULL COMMENT '业务类型',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `status` varchar(4) NOT NULL COMMENT '发送状态',
  `msg` varchar(40) DEFAULT NULL COMMENT '返回消息',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `email_send_log` */

insert  into `email_send_log`(`id`,`email`,`subject`,`content`,`senddata`,`response_date`,`business_type`,`del_flag`,`status`,`msg`,`remarks`) values 
('5bb873fe61c84cda9c465f08ee969a6a','502079461@qq.com','JEEWEB测试邮件','<p>JEEWEB测试邮件<br></p>','','2017-07-05 23:47:35',NULL,'0','1','发送成功',NULL),
('154ce4ade3604b6f87b077e3cb7d92f9','502079461@qq.com','测试发送主题','<p>测试发送主题测试发送主题测试发送主题测试发送主题测试发送主题<br></p>','','2017-07-22 20:19:57',NULL,'0','1','发送成功',NULL);

/*Table structure for table `email_template` */

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '模版名称',
  `code` varchar(255) NOT NULL COMMENT '模版编码',
  `business_type` varchar(4) NOT NULL COMMENT '业务类型',
  `template_subject` varchar(255) NOT NULL COMMENT '模版主题',
  `template_content` text NOT NULL COMMENT '模版内容',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `email_template` */

insert  into `email_template`(`id`,`name`,`code`,`business_type`,`template_subject`,`template_content`,`remarks`,`update_by`,`create_date`,`del_flag`,`create_by`,`update_date`) values 
('40281e815cef4f99015cef71f1850007','testcode','testcode','1','验证码','&amp;lt;p&amp;gt;testcode${test}&amp;lt;/p&amp;gt;',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-29 00:04:01','0','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-05 23:42:57');

/*Table structure for table `oa_notification` */

DROP TABLE IF EXISTS `oa_notification`;

CREATE TABLE `oa_notification` (
  `id` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `status` varchar(4) NOT NULL COMMENT '发布状态',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `oa_notification` */

insert  into `oa_notification`(`id`,`title`,`content`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`remarks`) values 
('b418a34dc72642b9a3ea3b3286422104','排课失败','非周日时段执行排课任务,联系研发!','1',NULL,'2018-05-21 15:07:00',NULL,NULL,'0',NULL),
('355edaa086a94fd4abcc84bf588cc585','排课失败','非周日时段执行排课任务,联系研发!','1',NULL,'2018-05-22 15:07:00',NULL,NULL,'0',NULL),
('01514fd053014a0daef23ce974f0ccd0','排课失败','课程[课程#2]未设置学生信息,请及时处理!','1','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 17:18:56',NULL,NULL,'0',NULL),
('d88109f18dae48a99fcdc6217b3cfc46','排课失败','课程[课程#4]未设置授课老师,请及时处理!','1','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 16:47:36',NULL,NULL,'0',NULL),
('48d684f82db34d2f88e4f904683d7b5a','排课失败','课程[课程#2]未设置学生信息,请及时处理!','1','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 16:44:18',NULL,NULL,'0',NULL);

/*Table structure for table `sms_send_log` */

DROP TABLE IF EXISTS `sms_send_log`;

CREATE TABLE `sms_send_log` (
  `id` varchar(32) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `business_type` varchar(4) NOT NULL COMMENT '业务类型',
  `phone` longtext NOT NULL COMMENT '联系电话',
  `template_id` varchar(8) DEFAULT NULL COMMENT '模板ID',
  `template_content` varchar(255) DEFAULT NULL COMMENT '模板类型',
  `senddata` varchar(255) NOT NULL COMMENT '发送数据',
  `status` varchar(4) NOT NULL COMMENT '发送状态',
  `smsid` varchar(50) DEFAULT NULL COMMENT '发送响应消息ID',
  `code` varchar(40) DEFAULT NULL COMMENT '返回码',
  `msg` varchar(40) DEFAULT NULL COMMENT '返回消息',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sms_send_log` */

insert  into `sms_send_log`(`id`,`remarks`,`business_type`,`phone`,`template_id`,`template_content`,`senddata`,`status`,`smsid`,`code`,`msg`,`del_flag`,`response_date`) values 
('d3867f77fb71413683c9953b29be9cef',NULL,'99','15085980308',NULL,'您的验证码是：125478。请不要把验证码泄露给其他人。','','1','14973347027340882673','2','提交成功','0','2017-06-13 14:18:19'),
('bd081ede5229454eb13e84650e94394b',NULL,'99','15085980305',NULL,'您的验证码是：14563。请不要把验证码泄露给其他人。','','1','14987124955099766989','2','提交成功','0','2017-06-29 13:01:33'),
('745c10cf09594f78b6e96c853148f639',NULL,'99','15085980308',NULL,'您的验证码是：14563。请不要把验证码泄露给其他人。','','1','14987125049996771912','2','提交成功','0','2017-06-29 13:01:42');

/*Table structure for table `sms_template` */

DROP TABLE IF EXISTS `sms_template`;

CREATE TABLE `sms_template` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '模版名称',
  `code` varchar(255) NOT NULL COMMENT '模版编码',
  `business_type` varchar(4) NOT NULL COMMENT '业务类型',
  `template_id` varchar(20) NOT NULL COMMENT '模版ID',
  `template_content` varchar(255) NOT NULL COMMENT '模版内容',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sms_template` */

insert  into `sms_template`(`id`,`name`,`code`,`business_type`,`template_id`,`template_content`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`remarks`) values 
('40288ab85c85a282015c85a83a550003','验证码','vercode','1','vercode','您的验证码是：{1}。请不要把验证码泄露给其他人。','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-08 11:03:33',NULL,NULL,'0',NULL);

/*Table structure for table `sys_attachment` */

DROP TABLE IF EXISTS `sys_attachment`;

CREATE TABLE `sys_attachment` (
  `id` varchar(32) NOT NULL,
  `filename` varchar(50) NOT NULL COMMENT '文件名称',
  `userid` varchar(32) NOT NULL COMMENT '用户ID',
  `uploadtime` datetime NOT NULL COMMENT '上传时间',
  `uploadip` varchar(15) NOT NULL COMMENT '上传的ID',
  `fileext` varchar(10) NOT NULL COMMENT '文件扩展名',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径',
  `filesize` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_attachment` */

insert  into `sys_attachment`(`id`,`filename`,`userid`,`uploadtime`,`uploadip`,`fileext`,`filepath`,`filesize`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('40281e815cf8f87a015cf9168a2a0000','logoquan14949235142','4028ea815a3d2a8c015a3d2f8d2a0002','2017-06-30 21:00:22','0:0:0:0:0:0:0:1','PNG','upload/2017/06/30/1498827622949.PNG',22181,'1',NULL,NULL,NULL,NULL,NULL,NULL),
('40281e815cfc4624015cfcf2a247006f','QQ截图20170605100721','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-01 14:59:38','0:0:0:0:0:0:0:1','png','upload/2017/07/01/1498892378689.png',40871,'1',NULL,NULL,NULL,NULL,NULL,NULL),
('40281e815d01531e015d02ad3bdb0001','QQ截图20170630205308','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-02 17:41:33','0:0:0:0:0:0:0:1','png','upload/2017/07/02/1498988493770.png',35704,'1',NULL,NULL,NULL,NULL,NULL,NULL),
('40288ab85d15e64a015d15f279eb0000','1499311108012','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-06 11:29:58','127.0.0.1','jpg','upload/2017/07/06/1499311798749.jpg',5042,'1',NULL,NULL,NULL,NULL,NULL,NULL),
('d6ec962d36e14df9a56c2bf0ea0082d3','users','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 14:29:36','127.0.0.1','gif','upload/2018/05/03/1525328975926.gif',4327,'1','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 14:29:36',NULL,NULL,NULL,'0');

/*Table structure for table `sys_data_source` */

DROP TABLE IF EXISTS `sys_data_source`;

CREATE TABLE `sys_data_source` (
  `id` varchar(36) NOT NULL,
  `db_key` varchar(50) NOT NULL COMMENT '索引关键字',
  `description` varchar(50) NOT NULL COMMENT '描述',
  `driver_class` varchar(50) NOT NULL COMMENT '驱动',
  `url` varchar(200) NOT NULL COMMENT 'URL',
  `db_user` varchar(50) NOT NULL COMMENT '帐号',
  `db_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `db_type` varchar(50) DEFAULT NULL COMMENT '数据库类型',
  `db_name` varchar(50) DEFAULT NULL COMMENT '数据库名称',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_data_source` */

insert  into `sys_data_source`(`id`,`db_key`,`description`,`driver_class`,`url`,`db_user`,`db_password`,`db_type`,`db_name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('402880e74e064fc5014e0652f72b0001','neiwangbaogong','微信运营数据库','com.mysql.jdbc.Driver','jdbc:mysql://localhost:3306/attendance?useUnicode=true&amp;amp;amp;amp;characterEncoding=UTF-8','root','gliwang123456','mysql','attendance',NULL,NULL,NULL,NULL,NULL,'0'),
('8a8aada9486347c001486401180a0003','PMS','sap db','oracle.jdbc.driver.OracleDriver','jdbc:oracle:thin:@localhost:1521:oral','PMS','tz','oracle','PMS',NULL,NULL,NULL,NULL,NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `gid` varchar(32) DEFAULT NULL COMMENT '分组ID',
  `label` varchar(100) DEFAULT NULL COMMENT '键值键',
  `value` varchar(100) DEFAULT NULL COMMENT '值',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `remarks` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_dict_groupid_key` (`gid`),
  CONSTRAINT `sys_dict_groupid_key` FOREIGN KEY (`gid`) REFERENCES `sys_dict_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`gid`,`label`,`value`,`sort`,`remarks`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`) values 
('06ca1432baaf4f7fb4e36106d3f17510','40288ab85c8593cd015c859b1fcf0011','星期二','2',2,'星期二','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:36:11',NULL,NULL,'0'),
('1445ea5f81a04e7697073d3ae4668591','40288ab85c8593cd015c859b1fcf0011','星期三','3',3,'星期三','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:36:23',NULL,NULL,'0'),
('300e78d5b49b44baa2fd2051831bb365','2cce406797be4131bde5a0d38c5797f1','浦西','px',3,'浦西','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 13:33:37',NULL,NULL,'0'),
('31f2c351251e48c1acc695f923fce2b5','2cce406797be4131bde5a0d38c5797f1','灵秀','lx',2,'灵秀','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 13:33:18',NULL,NULL,'0'),
('40281e815ced1f27015ced2f83bc000b','40281e815ced1f27015ced2be5330003','男','1',1,'1',NULL,NULL,NULL,NULL,'0'),
('40281e815cef4f99015cef6f7d070005','40281e815ced1f27015ced2be5330003','女','2',1,'女',NULL,NULL,NULL,NULL,'0'),
('40288ab85a20b609015a20c422e90003','40288ab85a20b609015a20c3f7bf0002','是','1',1,'1',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5eede8720000','40288ab85a20b609015a20c3f7bf0002','否','0',2,'否',NULL,NULL,NULL,NULL,'0'),
('40288ab85b6080e1015b608762aa0001','40288ab85b6080e1015b60870d410000','单表','1',1,'单表',NULL,NULL,NULL,NULL,'0'),
('40288ab85b6080e1015b608797ea0002','40288ab85b6080e1015b60870d410000','主表','2',2,'主表',NULL,NULL,NULL,NULL,'0'),
('40288ab85b6080e1015b6087d0140003','40288ab85b6080e1015b60870d410000','附表','3',3,'附表',NULL,NULL,NULL,NULL,'0'),
('40288ab85b6080e1015b60881c6e0004','40288ab85b6080e1015b60870d410000','树结构','4',4,'树结构',NULL,NULL,NULL,NULL,'0'),
('40288ab85befd65a015bf0a6aa69002a','40288ab85befd65a015bf0a043630026','Oracle','oracle',1,'Oracle',NULL,NULL,NULL,NULL,'0'),
('40288ab85befd65a015bf0a6e30e002b','40288ab85befd65a015bf0a043630026','MySql','mysql',2,'MySql',NULL,NULL,NULL,NULL,'0'),
('40288ab85befd65a015bf0a77d9b002c','40288ab85befd65a015bf0a043630026','sql server','sqlserver',3,'sql server',NULL,NULL,NULL,NULL,'0'),
('40288ab85bf1549e015bf175152a0001','40288ab85bf1549e015bf17370ff0000','在线','on_line',1,'在线',NULL,NULL,NULL,NULL,'0'),
('40288ab85bf1549e015bf17559ac0002','40288ab85bf1549e015bf17370ff0000','隐身','hidden',2,'隐身',NULL,NULL,NULL,NULL,'0'),
('40288ab85bf1549e015bf17590820003','40288ab85bf1549e015bf17370ff0000','强制退出','force_logout',3,'强制退出',NULL,NULL,NULL,NULL,'0'),
('40288ab85c8593cd015c859b70010011','40288ab85c8593cd015c859b1fcf0010','验证码','1',1,'验证码',NULL,NULL,NULL,NULL,'0'),
('40288ab85c8593cd015c859b8ff50012','40288ab85c8593cd015c859b1fcf0010','通知','2',2,'通知',NULL,NULL,NULL,NULL,'0'),
('40288ab85c86382b015c863993a30002','40288ab85c8593cd015c859b1fcf0010','其他','99',99,'其他',NULL,NULL,NULL,NULL,'0'),
('53390d626bba4930b23479c62eb5f1b5','2cce406797be4131bde5a0d38c5797f1','碧海','bh',1,'碧海校区','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 13:32:40',NULL,NULL,'0'),
('56fe161fd2b14a84bbbf81f51550cbf0','40288ab85c8593cd015c859b1fcf0011','星期六','6',6,'星期六','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:36:58',NULL,NULL,'0'),
('587488de67354819985164c1020a4dc7','2cce406797be4131bde5a0d38c5797f1','沈家门','sjm',4,'沈家门','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 13:33:50',NULL,NULL,'0'),
('7ee71f34d63e443cab64379117ee9803','40288ab85c8593cd015c859b1fcf0011','星期五','5',5,'星期五','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:36:42',NULL,NULL,'0'),
('823d3dc8d6e947139612689e245c0ef2','40288ab85c8593cd015c859b1fcf0011','星期天','7',7,'星期天','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:37:10',NULL,NULL,'0'),
('8bad583268c74ba09089e8a76b4c8a5b','40288ab85c8593cd015c859b1fcf0011','星期四','4',4,'星期四','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:36:33',NULL,NULL,'0'),
('969a719799ac4c42bf8faf276ff7f94c','40288ab85c8593cd015c859b1fcf0011','星期一','1',1,'星期一','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 15:35:51',NULL,NULL,'0'),
('a72a84e72f8a473ea1a89637fd2e6614','dc96de2dcd6b46478af619fe5b0a8df7','围棋','wq',1,'围棋','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 15:41:06',NULL,NULL,'0'),
('e348f538449c4689a1009cc1dd4afe19','dc96de2dcd6b46478af619fe5b0a8df7','象棋','xq',2,'象棋','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 15:41:18',NULL,NULL,'0');

/*Table structure for table `sys_dict_group` */

DROP TABLE IF EXISTS `sys_dict_group`;

CREATE TABLE `sys_dict_group` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '分组名称',
  `code` varchar(100) DEFAULT NULL COMMENT '分组编码',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典分组';

/*Data for the table `sys_dict_group` */

insert  into `sys_dict_group`(`id`,`name`,`code`,`remarks`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`) values 
('2cce406797be4131bde5a0d38c5797f1','校区','studyplace','校区信息','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 13:31:59',NULL,NULL,'0'),
('40281e815ced1f27015ced2be5330003','性别','sex','性别',NULL,NULL,NULL,NULL,'0'),
('40288ab85a20b609015a20c3f7bf0002','是否','sf','是否',NULL,NULL,NULL,NULL,'0'),
('40288ab85b6080e1015b60870d410000','表类型','tabletype','表类型',NULL,NULL,NULL,NULL,'0'),
('40288ab85befd65a015bf0a043630026','数据库类型','dbtype','数据库类型',NULL,NULL,NULL,NULL,'0'),
('40288ab85bf1549e015bf17370ff0000','用户登陆状态','onlinestatus','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c8593cd015c859b1fcf0010','短信业务类型','businesstype','短信业务类型',NULL,NULL,NULL,NULL,'0'),
('40288ab85c8593cd015c859b1fcf0011','星期','weekinfo','星期',NULL,NULL,NULL,NULL,'0'),
('dc96de2dcd6b46478af619fe5b0a8df7','培训科目','subject','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 15:40:42',NULL,NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `content` varchar(1000) DEFAULT '' COMMENT '日志内容',
  `logtype` varchar(4) DEFAULT '' COMMENT '操作方式',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`title`,`content`,`logtype`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values 
('0cc67ddc18cd4e3896cd6c6268cc19b2','1','校务管理-教师信息','','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:14:24','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36','/admin/sys/teacher','GET','',''),
('20b143ef7626420e92129c143fd34d64','1','校务管理-教师信息','','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:15:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36','/admin/sys/teacher','GET','',''),
('702faac8d8ea4623b7bde257d5da1a71','1','校务管理-学生信息','','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:15:38','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36','/admin/sys/student','GET','',''),
('86988687c39b47d4b2d8ca0e102d3f22','1','校务管理-课程模板','','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:20:22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36','/admin/sys/course','GET','','');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `url` varchar(200) DEFAULT NULL COMMENT '点击后前往的地址',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父编号',
  `parent_ids` varchar(1000) DEFAULT NULL COMMENT '父编号列表',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限字符串',
  `isshow` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(255) DEFAULT NULL COMMENT '摘要',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`type`,`url`,`parent_id`,`parent_ids`,`permission`,`isshow`,`sort`,`menu_icon`,`remarks`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`) values 
('40281e815beda90f015bedcf7102000f','计划任务',NULL,'task/schedulejob','40288ab85cf8276b015cf82debcb005b','40288ab85cf8276b015cf82debcb005b/','task:schedulejob:list',1,4,'','',NULL,NULL,NULL,NULL,'0'),
('40281e815c097acf015c097bcaea0000','用户最后在线情况',NULL,'sys/lastOnline','4028ea815a701416015a7075b4f9001f','4028ea815a701416015a7075b4f9001f/','sys:userlastonline',1,2,'','用户最后在线情况',NULL,NULL,NULL,NULL,'0'),
('40281e815c547c32015c54a21e260038','生成案列',NULL,'','4028ea815a78e9e6015a78f1dc9d0000','4028ea815a78e9e6015a78f1dc9d0000/','',1,3,'','生成案列',NULL,NULL,NULL,NULL,'0'),
('40281e815c54d147015c54daf16c0001','系统日志',NULL,'sys/log','4028ea815a701416015a7075b4f9001f','4028ea815a701416015a7075b4f9001f/','sys:log',1,6,'fa-book','系统日志',NULL,NULL,NULL,NULL,'0'),
('40281e815c580ea3015c58c8635d0037','测试单表',NULL,'test/singletable','40281e815c547c32015c54a21e260038','4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/','test:singletable',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('40281e815c880c25015c880d29870001','短信发送',NULL,'sms/send/sms','40288ab85c8593cd015c859f47960016','40288ab85c8593cd015c859f47960016/','sms:send',1,3,'','短信发送',NULL,NULL,NULL,NULL,'0'),
('40281e815c8f3512015c8f41cea7001b','发送日志',NULL,'email/emailsendlog','40288ab85bea9452015beaa7f25a0000','40288ab85bea9452015beaa7f25a0000/','email:emailsendlog',1,4,'','发送日志',NULL,NULL,NULL,NULL,'0'),
('40281e815c8f3512015c8f4233fc001c','邮件模版',NULL,'email/emailtemplate','40288ab85bea9452015beaa7f25a0000','40288ab85bea9452015beaa7f25a0000/','email:emailtemplate',1,3,'','模板配置',NULL,NULL,NULL,NULL,'0'),
('40281e815c8f3512015c8f5cc7220040','邮件发送',NULL,'email/send/email','40288ab85bea9452015beaa7f25a0000','40288ab85bea9452015beaa7f25a0000/','email:send',1,2,'','',NULL,NULL,NULL,NULL,'0'),
('40281e815c912406015c9149f7b80044','通知公告',NULL,'',NULL,NULL,'',1,3,'fa-television','',NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 15:59:36','0'),
('40281e815c912406015c914a1bc30045','通知公告',NULL,'oa/oanotification','40281e815c912406015c9149f7b80044','40281e815c912406015c9149f7b80044/','oa:oanotification',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('40281e815cef1f76015cef268ff0000e','测试树',NULL,'test/testtree','40281e815c547c32015c54a21e260038','4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/','test:testtree',1,1,'','测试树',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5ef22ad80001','系统设置',NULL,'',NULL,NULL,'',1,2,'fa-gear','',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5ef6ce870002','用户管理',NULL,'sys/user','40288ab85a5eecc6015a5ef22ad80001','40288ab85a5eecc6015a5ef22ad80001/','sys:user:list',1,1,'fa-tv','sdfdsfsdfsdfsdfsdfsf',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5ef8f2890003','部门管理',NULL,'sys/organization','40288ab85a5eecc6015a5ef22ad80001','40288ab85a5eecc6015a5ef22ad80001/','sys:organization:list',1,2,'fa-balance-scale','',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5ef95c700004','角色管理',NULL,'sys/role','40288ab85a5eecc6015a5ef22ad80001','40288ab85a5eecc6015a5ef22ad80001/','sys:role:list',1,3,'fa-amazon','',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5ef9f6160005','菜单管理',NULL,'sys/menu','40288ab85a5eecc6015a5ef22ad80001','40288ab85a5eecc6015a5ef22ad80001/','sys:menu:list',1,4,'fa-balance-scale','',NULL,NULL,NULL,NULL,'0'),
('40288ab85a5eecc6015a5efaa75d0006','数据字典',NULL,'sys/dict/group','40288ab85a5eecc6015a5ef22ad80001','40288ab85a5eecc6015a5ef22ad80001/','sys:dict:list',1,5,'fa-amazon','',NULL,NULL,NULL,NULL,'0'),
('40288ab85b604adf015b605023a70000','在线用户',NULL,'sys/online','4028ea815a701416015a7075b4f9001f','4028ea815a701416015a7075b4f9001f/','sys:online:list',1,1,'','在线用户',NULL,NULL,NULL,NULL,'0'),
('40288ab85bea9452015beaa846180001','参数设置',NULL,'sys/setting/email','40288ab85bea9452015beaa7f25a0000','40288ab85bea9452015beaa7f25a0000/','sys:setting:email',1,NULL,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85bea9452015beaa9e7a70002','参数配置',NULL,'sys/setting/sms','40288ab85c8593cd015c859f47960016','40288ab85c8593cd015c859f47960016/','sys:setting:sms',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85befd65a015bf088333a0015','多数据源管理',NULL,'sys/datasource','40288ab85cf8276b015cf82debcb005b','40288ab85cf8276b015cf82debcb005b/','sys:datasource:list',1,5,'','动态数据源',NULL,NULL,NULL,NULL,'0'),
('40288ab85c1ae76c015c1b1316680001','编辑器',NULL,'demo/form/editor','40288ab85c1ae76c015c1b12b68a0000','40288ab85c1ae76c015c1b12b68a0000/','',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c1e2442015c1e3246b70000','文件上传',NULL,'demo/form/upload','40288ab85c1ae76c015c1b12b68a0000','40288ab85c1ae76c015c1b12b68a0000/','',1,2,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c33548d015c33cdc5a600f3','附件信息',NULL,'sys/attachment','4028ea815a701416015a7075b4f9001f','4028ea815a701416015a7075b4f9001f/','sys:attachment:list',1,5,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c3df6b7015c3e3d1e770000','搜索自动补全',NULL,'demo/form/combox','40288ab85c1ae76c015c1b12b68a0000','40288ab85c1ae76c015c1b12b68a0000/','',1,3,'fa-500px','测试菜单',NULL,NULL,NULL,NULL,'0'),
('40288ab85c8593cd015c859fa3240017','短信模版',NULL,'sms/smstemplate','40288ab85c8593cd015c859f47960016','40288ab85c8593cd015c859f47960016/','sms:smstemplate',1,3,'','短信模版',NULL,NULL,NULL,NULL,'0'),
('40288ab85c85fa54015c860cee2e0023','发送日志',NULL,'sms/smssendlog','40288ab85c8593cd015c859f47960016','40288ab85c8593cd015c859f47960016/','sms:smssendlog',1,4,'','短信发送日志',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f4e1cd00001','折线图',NULL,'/charts/echarts/chart/line','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f5fa02e002a','柱状图',NULL,'/charts/echarts/chart/bar','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,2,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f626f58002d','漏斗图',NULL,'/charts/echarts/chart/funnel','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,5,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f62e726002e','仪表盘',NULL,'/charts/echarts/chart/gauge','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,6,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f6390fd002f','K线图',NULL,'/charts/echarts/chart/k','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,7,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f6572630030','饼状图',NULL,'/charts/echarts/chart/pie','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,7,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f65e3a50031','雷达图',NULL,'/charts/echarts/chart/radar','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,9,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f672f2e0032','散点图',NULL,'/charts/echarts/chart/scatter','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,9,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85c9eeb5c015c9f9694480064','关系图',NULL,'/charts/echarts/chart/circular','40288ab85c9eeb5c015c9f4d1f8e0000','40288ab85c9eeb5c015c9f4d1f8e0000/','',1,11,'','',NULL,NULL,NULL,NULL,'0'),
('40288ab85cf81b04015cf8213da10002','一对多',NULL,'test/testordermain','40281e815c547c32015c54a21e260038','4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/','test:testordermain',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('4028ea815a701416015a70766a7a0020','数据库监控',NULL,'monitor/druid','4028ea815a701416015a7075b4f9001f','4028ea815a701416015a7075b4f9001f/','monitor:druid:index',1,3,'','',NULL,NULL,NULL,NULL,'0'),
('4028ea815a78e9e6015a78f35cbe0001','表单配置',NULL,'codegen/table','4028ea815a78e9e6015a78f1dc9d0000','4028ea815a78e9e6015a78f1dc9d0000/','codegen:table:list',1,1,'','',NULL,NULL,NULL,NULL,'0'),
('4cf191766351413e8af8ab867d7f86af','校务管理',NULL,'',NULL,NULL,'',1,1,'fa-cubes','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 09:46:56','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 15:59:49','0'),
('82d5822710ff4d399aa293db793564d9','学校信息',NULL,'sys/school','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,0,'','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 14:09:18','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 14:10:08','0'),
('8bb00818c6ca440a91ddb625cab7aba9','校区信息',NULL,'sys/study/school','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,NULL,'','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 14:48:08',NULL,NULL,'0'),
('aff124d2d45647da8c3ff03a3601f7ea','授课记录',NULL,'sys/course/record','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,4,'fa-graduation-cap','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-15 14:50:42','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-15 14:52:17','0'),
('bb766d696ecf4431b6708ae9279735db','日志记录',NULL,'sys/log','31427921e2fa477d8afa6b2e5a7060a3','31427921e2fa477d8afa6b2e5a7060a3/','sys:user',1,NULL,'fa-object-group','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 16:35:46',NULL,NULL,'0'),
('daae8992aa8542e3b7649df4599f28d5','学生信息',NULL,'sys/student','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,1,'fa-street-view','学生信息管理','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-03 09:48:47','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-15 14:51:55','0'),
('daae8992aa8542e3b7649df4599f28d6','教师信息',NULL,'sys/teacher','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,2,'fa-users','',NULL,'2018-05-03 15:39:13','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-15 14:52:02','0'),
('daae8992aa8542e3b7649df4599f28d7','课程模板',NULL,'sys/course','4cf191766351413e8af8ab867d7f86af','4cf191766351413e8af8ab867d7f86af/','sys:user',1,3,'fa-users','',NULL,'2018-05-03 15:39:11','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-15 14:52:11','0');

/*Table structure for table `sys_organization` */

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父节点',
  `parent_ids` varchar(1000) DEFAULT NULL COMMENT '父节点路径',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`name`,`parent_id`,`parent_ids`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`remarks`) values 
('40288ab85b6080e1015b60996d690005','舟山围棋',NULL,NULL,NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 13:31:11','0',''),
('4028ea815a452f69015a45346f7b0001','普陀围棋协会','40288ab85b6080e1015b60996d690005','40288ab85b6080e1015b60996d690005/',NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 13:31:25','0','');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `code` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `usable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`is_sys`,`usable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('402880e45b5d7636015b5d8baca60000','普通用户','normal','1','1',NULL,'2017-04-11 23:04:46','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-06 08:20:00','','0'),
('40288ab85a362150015a3675ca950006','系统管理员','admin','1','1',NULL,'2017-02-13 15:52:53',NULL,'2017-02-15 14:31:15','系统管理员','0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `sys_role_menu_menuid` (`menu_id`),
  KEY `sys_role_menu_roleid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`menu_id`,`role_id`) values 
('033eff082c394cebb65de282280cac93','40288ab85a5eecc6015a5ef6ce870002','40288ab85a362150015a3675ca950006'),
('0796950a63ac4bed88b58d3fee76c9b7','daae8992aa8542e3b7649df4599f28d6','40288ab85a362150015a3675ca950006'),
('1313a4e72a0b4214913848905e0a0d14','40288ab85c9eeb5c015c9f65e3a50031','40288ab85a362150015a3675ca950006'),
('202bcdd94153497eb836f77b11d7516c','4cf191766351413e8af8ab867d7f86af','40288ab85a362150015a3675ca950006'),
('21452477e49e4e7cae740f1efcd9a331','40288ab85a5eecc6015a5ef22ad80001','40288ab85a362150015a3675ca950006'),
('2dbceb75318a465cb0a5b2720c26c20f','82d5822710ff4d399aa293db793564d9','40288ab85a362150015a3675ca950006'),
('40288ab85cf80b14015cf8138103002e','40281e815c912406015c9149f7b80044','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf8138105002f','40281e815c912406015c914a1bc30045','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381050030','40288ab85a5eecc6015a5ef22ad80001','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381050031','40288ab85a5eecc6015a5ef9f6160005','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381050032','40288ab85a5eecc6015a5efaa75d0006','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381060033','40288ab85c8593cd015c859f47960016','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381060034','40281e815c880c25015c880d29870001','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381060035','40288ab85bea9452015beaa9e7a70002','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381060036','40288ab85c8593cd015c859fa3240017','402880e45b5d7636015b5d8baca60000'),
('40288ab85cf80b14015cf81381060037','40288ab85c85fa54015c860cee2e0023','402880e45b5d7636015b5d8baca60000'),
('4028ea815a701416015a7080f45b0030','40288ab85a5eecc6015a5ef22ad80001','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45d0031','40288ab85a5eecc6015a5ef8f2890003','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45d0032','40288ab85a5eecc6015a5ef95c700004','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45d0033','40288ab85a5eecc6015a5ef9f6160005','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45d0034','40288ab85a5eecc6015a5efaa75d0006','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45d0035','4028ea815a701416015a7075b4f9001f','40288ab85a406a03015a40781a6e0000'),
('4028ea815a701416015a7080f45e0036','4028ea815a701416015a70766a7a0020','40288ab85a406a03015a40781a6e0000'),
('52263c6c1a014061bed499b491232377','40288ab85a5eecc6015a5ef9f6160005','40288ab85a362150015a3675ca950006'),
('6929ecc9eb5d4fdea9bbd9f2253bcea9','40288ab85a5eecc6015a5ef95c700004','40288ab85a362150015a3675ca950006'),
('9fd9c681175643a08e04c89f688fb427','778a17c96b3347349ac91b0ea6296610','40288ab85a362150015a3675ca950006'),
('ac18b47811224d37ad8cb6f8965ddc9a','8bb00818c6ca440a91ddb625cab7aba9','40288ab85a362150015a3675ca950006'),
('aee040d54dde4b3a8558e1acb3c6b7a9','40288ab85a5eecc6015a5efaa75d0006','40288ab85a362150015a3675ca950006'),
('bcf7be825b4a4be8aa57940cd1f8d4e0','aff124d2d45647da8c3ff03a3601f7ea','40288ab85a362150015a3675ca950006'),
('d7762f5663da44eebcf91a8453422945','40281e815c912406015c9149f7b80044','40288ab85a362150015a3675ca950006'),
('e5ae3e59321043f7a54150fb657ba433','40281e815c912406015c914a1bc30045','40288ab85a362150015a3675ca950006'),
('eead8cfe9dbe4ec88b15a7be495229b7','40288ab85a5eecc6015a5ef8f2890003','40288ab85a362150015a3675ca950006'),
('f2363e1c4f724d9987cb557b57780c23','daae8992aa8542e3b7649df4599f28d5','40288ab85a362150015a3675ca950006'),
('f32f3bdfdc2a4d43baba59ab9f7ce0fb','daae8992aa8542e3b7649df4599f28d7','40288ab85a362150015a3675ca950006');

/*Table structure for table `sys_sessions` */

DROP TABLE IF EXISTS `sys_sessions`;

CREATE TABLE `sys_sessions` (
  `id` varchar(200) NOT NULL DEFAULT '',
  `session` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_sessions` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `portrait` varchar(250) DEFAULT NULL COMMENT '头像',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `status` varchar(255) DEFAULT NULL COMMENT '系统用户的状态',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  UNIQUE KEY `idx_sys_user_email` (`email`),
  UNIQUE KEY `idx_sys_user_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`realname`,`username`,`portrait`,`password`,`salt`,`email`,`phone`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('4028ea815a3d2a8c015a3d2f8d2a0002','系统管理员','admin','upload/2018/05/03/1525328975926.gif','ae8b5fbb3b5496c87b52fab896db7830','78cb8d7012d98c91f98963e803fe68bd','test3@qq.com','14785571304','1',NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 11:28:58',NULL,'0');

/*Table structure for table `sys_user_last_online` */

DROP TABLE IF EXISTS `sys_user_last_online`;

CREATE TABLE `sys_user_last_online` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `system_host` varchar(100) DEFAULT NULL,
  `last_login_timestamp` datetime DEFAULT '0000-00-00 00:00:00',
  `last_stop_timestamp` datetime DEFAULT NULL,
  `login_count` bigint(20) DEFAULT NULL,
  `total_online_time` bigint(20) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sys_user_last_online_sys_user_id` (`user_id`),
  KEY `idx_sys_user_last_online_username` (`username`),
  KEY `idx_sys_user_last_online_host` (`host`),
  KEY `idx_sys_user_last_online_system_host` (`system_host`),
  KEY `idx_sys_user_last_online_last_login_timestamp` (`last_login_timestamp`),
  KEY `idx_sys_user_last_online_last_stop_timestamp` (`last_stop_timestamp`),
  KEY `idx_sys_user_last_online_user_agent` (`user_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_last_online` */

insert  into `sys_user_last_online`(`id`,`user_id`,`username`,`uid`,`host`,`user_agent`,`system_host`,`last_login_timestamp`,`last_stop_timestamp`,`login_count`,`total_online_time`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
(11,4028,'admin','eccfb5ba-1aca-4dea-ba9f-eccf308baa71','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','0:0:0:0:0:0:0:1:8383','2017-07-11 22:03:35','2017-07-11 22:03:40',15,795035,NULL,NULL,NULL,NULL,NULL,'0');

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `id` varchar(100) NOT NULL,
  `user_id` varchar(32) DEFAULT '',
  `username` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `system_host` varchar(100) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `start_timestsamp` datetime DEFAULT '0000-00-00 00:00:00',
  `last_access_time` datetime DEFAULT '0000-00-00 00:00:00',
  `online_timeout` bigint(20) DEFAULT NULL,
  `online_session` mediumtext,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_user_online_sys_user_id` (`user_id`),
  KEY `idx_sys_user_online_username` (`username`),
  KEY `idx_sys_user_online_host` (`host`),
  KEY `idx_sys_user_online_system_host` (`system_host`),
  KEY `idx_sys_user_online_start_timestsamp` (`start_timestsamp`),
  KEY `idx_sys_user_online_last_access_time` (`last_access_time`),
  KEY `idx_sys_user_online_user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_online` */

insert  into `sys_user_online`(`id`,`user_id`,`username`,`host`,`system_host`,`user_agent`,`status`,`start_timestsamp`,`last_access_time`,`online_timeout`,`online_session`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('048074b8-214d-4bb9-bda6-76a8e6fdad76','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 22:02:53','2017-07-22 22:02:53',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002430343830373462382d323134642d346262392d626461362d3736613865366664616437367372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a9bab66787371007e000677080000015d6a9bab6678771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:02:53',NULL,NULL,NULL,'0'),
('50f04007-898f-4fed-90a8-266ee5cfc55e','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 17:03:53','2017-07-22 17:03:53',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002435306630343030372d383938662d346665642d393061382d3236366565356366633535657372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6989ecb3787371007e000677080000015d6989ecce78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('5f8a88e7-ccf1-40fe-96a0-393491f2f520','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 20:17:59','2017-07-22 20:17:59',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002435663861383865372d636366312d343066652d393661302d3339333439316632663532307372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a3ba33e787371007e000677080000015d6a3ba34a78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('6333dcdc-ba8b-47b1-a4f0-f4278fd2c2e9','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 22:51:00','2017-07-22 23:24:32',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002436333333646364632d626138622d343762312d613466302d6634323738666432633265397372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6ac7b966787371007e000677080000015d6ae66ea578771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000017708000000020000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:51:00','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:24:32',NULL,'0'),
('719d4f12-fee0-4142-8d01-f0312a3936a2','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 17:06:08','2017-07-22 17:06:08',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002437313964346631322d666565302d343134322d386430312d6630333132613339333661327372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d698bfd1d787371007e000677080000015d698bfd2d78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('7412348f-e15f-4bf4-bb05-c04e3d5c4582','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 16:41:59','2017-07-22 16:41:59',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002437343132333438662d653135662d346266342d626230352d6330346533643563343538327372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6975e293787371007e000677080000015d6975e2a278771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('7592c75b-beb3-4601-a76c-904018d61d39','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 22:07:03','2017-07-22 22:16:07',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002437353932633735622d626562332d343630312d613736632d3930343031386436316433397372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a9f7eeb787371007e000677080000015d6aa7ca4978771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000017708000000020000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:07:04','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:16:07',NULL,'0'),
('759e6778-1ec5-4bc3-832a-3438828afeec','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 22:00:27','2017-07-22 22:00:27',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002437353965363737382d316563352d346263332d383332612d3334333838323861666565637372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a997209787371007e000677080000015d6a99721578771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:00:27',NULL,NULL,NULL,'0'),
('84518b4b-1105-428d-8d3a-e5f0a2b4cd5f','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 17:00:01','2017-07-22 17:00:01',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002438343531386234622d313130352d343238642d386433612d6535663061326234636435667372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d698665e1787371007e000677080000015d698665f378771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('8e17929e-0b15-461d-a689-968ed0f1e2ab','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8383','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','on_line','2017-07-11 22:05:26','2017-07-11 23:04:41',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002438653137393239652d306231352d343631642d613638392d3936386564306631653261627372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d31f80e8e787371007e000677080000015d322e4eb878771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000006740008726f6c654c697374737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000273720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e526f6c659aa4b6918ff4af640200054c0004636f646571007e00024c0002696471007e00024c0005697353797371007e00024c00046e616d6571007e00024c0006757361626c6571007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e44617461456e7469747900000000000000010200074c000863726561746542797400234c636e2f6a65657765622f6d6f64756c65732f7379732f656e746974792f557365723b4c000a637265617465446174657400104c6a6176612f7574696c2f446174653b4c000764656c466c61677400134c6a6176612f6c616e672f426f6f6c65616e3b4c0008697344656c65746571007e00124c000772656d61726b7371007e00024c0008757064617465427971007e00104c000a7570646174654461746571007e00117872002b636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e4162737472616374456e74697479a62e7e8b4d2cc0460200007872001e636e2e6a65657765622e636f72652e626173652e42617365456e746974790000000000000001020000787070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737871007e000677080000015b5d8baab07800000000737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700071007e0019740000737200346f72672e68696265726e6174652e70726f78792e706f6a6f2e6a61766173736973742e53657269616c697a61626c6550726f7879e09037b34a3c73880200084c000f636f6d706f6e656e744964547970657400224c6f72672f68696265726e6174652f747970652f436f6d706f73697465547970653b4c00186765744964656e7469666965724d6574686f64436c6173737400114c6a6176612f6c616e672f436c6173733b4c00176765744964656e7469666965724d6574686f644e616d6571007e00025b000a696e74657266616365737400125b4c6a6176612f6c616e672f436c6173733b4c000f70657273697374656e74436c61737371007e001d4c00187365744964656e7469666965724d6574686f64436c61737371007e001d4c00177365744964656e7469666965724d6574686f644e616d6571007e00025b00197365744964656e7469666965724d6574686f64506172616d7371007e001e7872002d6f72672e68696265726e6174652e70726f78792e416273747261637453657269616c697a61626c6550726f78793a8debd01102eb860200034c000a656e746974794e616d6571007e00024c000269647400164c6a6176612f696f2f53657269616c697a61626c653b4c0008726561644f6e6c7971007e00127870740021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e55736572740020343032386561383135613364326138633031356133643266386432613030303270707070757200125b4c6a6176612e6c616e672e436c6173733bab16d7aecbcd5a99020000787000000001767200226f72672e68696265726e6174652e70726f78792e48696265726e61746550726f7879517e3626971bbe22020000787076720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e55736572d927bd811f1220e70200094c0005656d61696c71007e00024c0002696471007e00024c000870617373776f726471007e00024c000570686f6e6571007e00024c0008706f72747261697471007e00024c00087265616c6e616d6571007e00024c000473616c7471007e00024c000673746174757371007e00024c0008757365726e616d6571007e00027871007e00137070707371007e001677080000015d15448b8078000000007400066e6f726d616c74002034303238383065343562356437363336303135623564386261636136303030307400013174000ce699aee9809ae794a8e688b7740001317371007e000e707371007e001677080000015a3675c808780000000071007e001971007e001974000fe7b3bbe7bb9fe7aea1e79086e59198707371007e001677080000015a4077c338780000000074000561646d696e74002034303238386162383561333632313530303135613336373563613935303030367400013174000fe7b3bbe7bb9fe7aea1e79086e5919874000131787400506f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f41555448454e544943415445445f53455353494f4e5f4b45597371007e00180174002a6a617661782e736572766c65742e6a73702e6a73746c2e666d742e726571756573742e636861727365747400055554462d3874005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e00087400086d656e754c6973747371007e000c0000002f77040000002f73720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e4d656e751bd41f21b760972c0200095a000b6861734368696c6472656e4c0006697373686f777400114c6a6176612f6c616e672f53686f72743b4c00086d656e7549636f6e71007e00024c0006706172656e747400234c636e2f6a65657765622f6d6f64756c65732f7379732f656e746974792f4d656e753b4c000a7065726d697373696f6e71007e00024c000772656d61726b7371007e00024c0004736f72747400134c6a6176612f6c616e672f496e74656765723b4c00047479706571007e00024c000375726c71007e00027872002a636e2e6a65657765622e6d6f64756c65732e636f6d6d6f6e2e656e746974792e54726565456e7469747900000000000000010200064c0008657870616e64656471007e00124c0002696471007e00024c00066c6f6164656471007e00124c00046e616d6571007e00024c0008706172656e74496471007e00024c0009706172656e7449647371007e00027871007e001371007e0019740020343032383861623835626561393435323031356265616138343631383030303171007e003a74000ce58f82e695b0e8aebee7bdae740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f007372000f6a6176612e6c616e672e53686f7274684d37133460da5202000153000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000017400007371007e004071007e0019740020343032383861623835626561393435323031356265616137663235613030303071007e003a74000ce982aee7aeb1e8aebee7bdae70700171007e004c74000b66612d656e76656c6f706570740000740000737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e004b00000005707400007400117379733a73657474696e673a656d61696c74000070707400117379732f73657474696e672f656d61696c7371007e004071007e0019740020343032383165383135633538306561333031356335386338363335643030333771007e003a74000ce6b58be8af95e58d95e8a1a8740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f0071007e004c7400007371007e004071007e0019740020343032383165383135633534376333323031356335346132316532363030333871007e003a74000ce7949fe68890e6a188e58897740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f0171007e004c7400007371007e004071007e0019740020343032386561383135613738653965363031356137386631646339643030303071007e003a74000fe4bba3e7a081e7949fe68890e599a870700171007e004c74000e66612d66696c652d636f64652d6f707400007400007371007e0054000000017074000074000074000ce7949fe68890e6a188e588977371007e00540000000370740000740010746573743a73696e676c657461626c6574000071007e006c70740010746573742f73696e676c657461626c657371007e004071007e0019740020343032383165383135633931323430363031356339313461316263333030343571007e003a74000ce9809ae79fa5e585ace5918a740020343032383165383135633931323430363031356339313439663762383030343474002134303238316538313563393132343036303135633931343966376238303034342f0071007e004c7400007371007e004071007e0019740020343032383165383135633931323430363031356339313439663762383030343471007e003a74000ce9809ae79fa5e585ace5918a70700171007e004c74000d66612d74656c65766973696f6e7074000074000071007e0055707400007400116f613a6f616e6f74696669636174696f6e74000071007e006c707400116f612f6f616e6f74696669636174696f6e7371007e004071007e0019740020343032383165383135636566316637363031356365663236386666303030306571007e003a740009e6b58be8af95e6a091740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f0071007e004c74000071007e006074000d746573743a7465737474726565740009e6b58be8af95e6a09171007e006c7074000d746573742f74657374747265657371007e004071007e0019740020343032383861623835613565656363363031356135656636636538373030303271007e003a74000ce794a8e688b7e7aea1e79086740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f0071007e004c74000566612d74767371007e004071007e0019740020343032383861623835613565656363363031356135656632326164383030303171007e003a74000ce7b3bbe7bb9fe8aebee7bdae70700171007e004c74000766612d67656172707400007400007371007e0054000000027074000074000d7379733a757365723a6c697374740014736466647366736466736466736466736466736671007e006c707400087379732f757365727371007e004071007e0019740020343032383861623835623630346164663031356236303530323361373030303071007e003a74000ce59ca8e7babfe794a8e688b7740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f0071007e004c7400007371007e004071007e0019740020343032386561383135613730313431363031356137303735623466393030316671007e003a74000ce7b3bbe7bb9fe79b91e68ea770700171007e004c74000f66612d766964656f2d63616d6572617074000074000071007e00707074000074000f7379733a6f6e6c696e653a6c69737474000ce59ca8e7babfe794a8e688b771007e006c7074000a7379732f6f6e6c696e657371007e004071007e0019740020343032383861623835626561393435323031356265616139653761373030303271007e003a74000ce58f82e695b0e9858de7bdae740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f0071007e004c7400007371007e004071007e0019740020343032383861623835633835393363643031356338353966343739363030313671007e003a74000ce79fade4bfa1e8aebee7bdae70700171007e004c74000b66612d636f6d6d656e7473707400007400007371007e0054000000067074000074000f7379733a73657474696e673a736d7374000071007e006c7074000f7379732f73657474696e672f736d737371007e004071007e0019740020343032383861623835633161653736633031356331623133313636383030303171007e003a740009e7bc96e8be91e599a8740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f0071007e004c7400007371007e004071007e0019740020343032383861623835633161653736633031356331623132623638613030303071007e003a74000ce4bba3e7a081e6a188e4be8b70700171007e004c74000766612d636f6465707400007400007371007e00540000000c7074000074000074000071007e006c7074001064656d6f2f666f726d2f656469746f727371007e004071007e0019740020343032383861623835633965656235633031356339663465316364303030303171007e003a740009e68a98e7babfe59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c7400007371007e004071007e0019740020343032383861623835633965656235633031356339663464316638653030303071007e003a74000ce7bb9fe8aea1e68aa5e8a1a870700171007e004c74000c66612d6261722d6368617274707400007400007371007e00540000000a7074000074000074000071007e006c7074001a2f6368617274732f656368617274732f63686172742f6c696e657371007e004071007e0019740020343032383861623835636638316230343031356366383231336461313030303271007e003a740009e4b880e5afb9e5a49a740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f0071007e004c74000071007e0060740012746573743a746573746f726465726d61696e74000071007e006c70740012746573742f746573746f726465726d61696e71007e00667371007e004071007e0019740020343032386561383135613738653965363031356137386633356362653030303171007e003a74000ce8a1a8e58d95e9858de7bdae740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f0071007e004c74000071007e0066740012636f646567656e3a7461626c653a6c69737474000071007e006c7074000d636f646567656e2f7461626c657371007e004071007e0019740020343032383165383135633039376163663031356330393762636165613030303071007e003a740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b5740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f0071007e004c74000071007e00a57400127379733a757365726c6173746f6e6c696e65740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b571007e009a7074000e7379732f6c6173744f6e6c696e657371007e004071007e0019740020343032383165383135633866333531323031356338663563633732323030343071007e003a74000ce982aee4bbb6e58f91e98081740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f0071007e004c74000071007e004e74000a656d61696c3a73656e6474000071007e009a70740010656d61696c2f73656e642f656d61696c71007e00947371007e004071007e0019740020343032383861623835613565656363363031356135656638663238393030303371007e003a74000ce983a8e997a8e7aea1e79086740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f0071007e004c74001066612d62616c616e63652d7363616c6571007e00947400157379733a6f7267616e697a6174696f6e3a6c69737474000071007e009a707400107379732f6f7267616e697a6174696f6e7371007e004071007e0019740020343032383861623835633165323434323031356331653332343662373030303071007e003a74000ce69687e4bbb6e4b88ae4bca0740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f0071007e004c74000071007e00c674000074000071007e009a7074001064656d6f2f666f726d2f75706c6f61647371007e004071007e0019740020343032383861623835633965656235633031356339663566613032653030326171007e003a740009e69fb1e78ab6e59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d774000074000071007e009a707400192f6368617274732f656368617274732f63686172742f62617271007e00607371007e004071007e0019740020343032383165383135633838306332353031356338383064323938373030303171007e003a74000ce79fade4bfa1e58f91e98081740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f0071007e004c74000071007e00b5740008736d733a73656e6474000ce79fade4bfa1e58f91e9808171007e00707074000c736d732f73656e642f736d737371007e004071007e0019740020343032383165383135633866333531323031356338663432333366633030316371007e003a74000ce982aee4bbb6e6a8a1e78988740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f0071007e004c74000071007e004e740013656d61696c3a656d61696c74656d706c61746574000ce6a8a1e69dbfe9858de7bdae71007e007070740013656d61696c2f656d61696c74656d706c6174657371007e004071007e0019740020343032383861623835613565656363363031356135656639356337303030303471007e003a74000ce8a792e889b2e7aea1e79086740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f0071007e004c74000966612d616d617a6f6e71007e009474000d7379733a726f6c653a6c69737474000071007e0070707400087379732f726f6c657371007e004071007e0019740020343032383861623835633364663662373031356333653364316537373030303071007e003a740012e6909ce7b4a2e887aae58aa8e8a1a5e585a8740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f0071007e004c74000866612d353030707871007e00c674000074000ce6b58be8af95e88f9ce58d9571007e00707074001064656d6f2f666f726d2f636f6d626f787371007e004071007e0019740020343032383861623835633835393363643031356338353966613332343030313771007e003a74000ce79fade4bfa1e6a8a1e78988740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f0071007e004c74000071007e00b574000f736d733a736d7374656d706c61746574000ce79fade4bfa1e6a8a1e7898871007e00707074000f736d732f736d7374656d706c61746571007e00a57371007e004071007e0019740020343032386561383135613730313431363031356137303736366137613030323071007e003a74000fe695b0e68daee5ba93e79b91e68ea7740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f0071007e004c74000071007e00a57400136d6f6e69746f723a64727569643a696e64657874000071007e00707074000d6d6f6e69746f722f64727569647371007e004071007e0019740020343032383165383135626564613930663031356265646366373130323030306671007e003a74000ce8aea1e58892e4bbbbe58aa1740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f0071007e004c7400007371007e004071007e0019740020343032383861623835636638323736623031356366383264656263623030356271007e003a74000ce5b8b8e8a781e5b7a5e585b770700171007e004c74000d66612d62696e6f63756c617273707400007400007371007e005400000004707400007400157461736b3a7363686564756c656a6f623a6c69737474000071007e0163707400107461736b2f7363686564756c656a6f627371007e004071007e0019740020343032383165383135633866333531323031356338663431636561373030316271007e003a74000ce58f91e98081e697a5e5bf97740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f0071007e004c74000071007e004e740012656d61696c3a656d61696c73656e646c6f6774000ce58f91e98081e697a5e5bf9771007e016370740012656d61696c2f656d61696c73656e646c6f677371007e004071007e0019740020343032383861623835613565656363363031356135656639663631363030303571007e003a74000ce88f9ce58d95e7aea1e79086740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f0071007e004c74001066612d62616c616e63652d7363616c6571007e009474000d7379733a6d656e753a6c69737474000071007e0163707400087379732f6d656e757371007e004071007e0019740020343032383861623835633835666135343031356338363063656532653030323371007e003a74000ce58f91e98081e697a5e5bf97740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f0071007e004c74000071007e00b574000e736d733a736d7373656e646c6f67740012e79fade4bfa1e58f91e98081e697a5e5bf9771007e01637074000e736d732f736d7373656e646c6f6771007e015d71007e007b7371007e004071007e0019740020343032383861623835613565656363363031356135656661613735643030303671007e003a74000ce695b0e68daee5ad97e585b8740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f0071007e004c74000966612d616d617a6f6e71007e009474000d7379733a646963743a6c69737474000071007e00557074000e7379732f646963742f67726f757071007e004e7371007e004071007e0019740020343032383861623835626566643635613031356266303838333333613030313571007e003a740012e5a49ae695b0e68daee6ba90e7aea1e79086740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f0071007e004c74000071007e015d7400137379733a64617461736f757263653a6c69737474000fe58aa8e68081e695b0e68daee6ba9071007e00557074000e7379732f64617461736f757263657371007e004071007e0019740020343032383861623835633333353438643031356333336364633561363030663371007e003a74000ce99984e4bbb6e4bfa1e681af740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f0071007e004c74000071007e00a57400137379733a6174746163686d656e743a6c69737474000071007e00557074000e7379732f6174746163686d656e747371007e004071007e0019740020343032383861623835633965656235633031356339663632366635383030326471007e003a740009e6bc8fe69697e59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d774000074000071007e00557074001c2f6368617274732f656368617274732f63686172742f66756e6e656c7371007e004071007e0019740020343032383165383135633534643134373031356335346461663136633030303171007e003a74000ce7b3bbe7bb9fe697a5e5bf97740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f0071007e004c74000766612d626f6f6b71007e00a57400077379733a6c6f6774000ce7b3bbe7bb9fe697a5e5bf9771007e00bb707400077379732f6c6f6771007e00b57371007e004071007e0019740020343032383861623835633965656235633031356339663632653732363030326571007e003a740009e4bbaae8a1a8e79b98740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d774000074000071007e00bb7074001b2f6368617274732f656368617274732f63686172742f67617567657371007e004071007e0019740020343032383861623835633965656235633031356339663633393066643030326671007e003a7400074be7babfe59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d77400007400007371007e005400000007707400172f6368617274732f656368617274732f63686172742f6b7371007e004071007e0019740020343032383861623835633965656235633031356339663635373236333030333071007e003a740009e9a5bce78ab6e59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d774000074000071007e01c1707400192f6368617274732f656368617274732f63686172742f7069657371007e004071007e0019740020343032383861623835633965656235633031356339663635653361353030333171007e003a740009e99bb7e8bebee59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d77400007400007371007e0054000000097074001b2f6368617274732f656368617274732f63686172742f72616461727371007e004071007e0019740020343032383861623835633965656235633031356339663637326632653030333271007e003a740009e695a3e782b9e59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d774000074000071007e01d47074001d2f6368617274732f656368617274732f63686172742f7363617474657271007e00d77371007e004071007e0019740020343032383861623835633965656235633031356339663936393434383030363471007e003a740009e585b3e7b3bbe59bbe740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f0071007e004c74000071007e00d77400007400007371007e00540000000b7074001e2f6368617274732f656368617274732f63686172742f63697263756c617271007e00c67874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000c77080000001000000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e01ee7878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a3833383374006d4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b20574f57363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e333670707702000671007e01fd71007e01fa78',NULL,NULL,NULL,NULL,NULL,'0'),
('986b7a03-4480-4ab5-8943-0be4cbe21218','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 22:05:10','2017-07-22 22:05:10',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002439383662376130332d343438302d346162352d383934332d3062653463626532313231387372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a9dc2bf787371007e000677080000015d6a9dc2d078771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 22:05:10',NULL,NULL,NULL,'0'),
('a5be8813-6055-4fc3-bd9a-e1d327a1f9bd','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','on_line','2017-07-22 16:12:38','2017-07-22 17:41:11',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002461356265383831332d363035352d346663332d626439612d6531643332376131663962647372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d695b03e4787371007e000677080000015d69ac130778771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000677080000000800000004740008726f6c654c697374737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000273720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e526f6c659aa4b6918ff4af640200054c0004636f646571007e00024c0002696471007e00024c0005697353797371007e00024c00046e616d6571007e00024c0006757361626c6571007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e44617461456e7469747900000000000000010200074c000863726561746542797400234c636e2f6a65657765622f6d6f64756c65732f7379732f656e746974792f557365723b4c000a637265617465446174657400104c6a6176612f7574696c2f446174653b4c000764656c466c61677400134c6a6176612f6c616e672f426f6f6c65616e3b4c0008697344656c65746571007e00124c000772656d61726b7371007e00024c0008757064617465427971007e00104c000a7570646174654461746571007e00117872002b636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e4162737472616374456e74697479a62e7e8b4d2cc0460200007872001e636e2e6a65657765622e636f72652e626173652e42617365456e7469747900000000000000010200007870707371007e000677080000015b5d8baab078737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700071007e0018740000707371007e000677080000015d15448b80787400066e6f726d616c74002034303238383065343562356437363336303135623564386261636136303030307400013174000ce699aee9809ae794a8e688b7740001317371007e000e707371007e000677080000015a3675c8087871007e001871007e001874000fe7b3bbe7bb9fe7aea1e79086e59198707371007e000677080000015a4077c3387874000561646d696e74002034303238386162383561333632313530303135613336373563613935303030367400013174000fe7b3bbe7bb9fe7aea1e79086e5919874000131787400086d656e754c6973747371007e000c0000002f77040000002f73720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e4d656e758f87a375bc8d68510200074c0006697373686f777400114c6a6176612f6c616e672f53686f72743b4c00086d656e7549636f6e71007e00024c000a7065726d697373696f6e71007e00024c000772656d61726b7371007e00024c0004736f72747400134c6a6176612f6c616e672f496e74656765723b4c00047479706571007e00024c000375726c71007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e54726565456e7469747900000000000000010200085a000b6861734368696c6472656e4c0008657870616e64656471007e00124c0002696471007e00024c00066c6f6164656471007e00124c00046e616d6571007e00024c0006706172656e747400124c6a6176612f6c616e672f4f626a6563743b4c0008706172656e74496471007e00024c0009706172656e7449647371007e00027871007e00130071007e001874002034303238386162383562656139343532303135626561613834363138303030317371007e00170174000ce58f82e695b0e8aebee7bdae7371007e002b0071007e0018740020343032383861623835626561393435323031356265616137663235613030303071007e003274000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f7372000f6a6176612e6c616e672e53686f7274684d37133460da5202000153000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000017400007400117379733a73657474696e673a656d61696c74000070707400117379732f73657474696e672f656d61696c7371007e002b0071007e0018740020343032383861623835633965656235633031356339663465316364303030303171007e0032740009e68a98e7babfe59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b740000740000740000737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e003a000000017074001a2f6368617274732f656368617274732f63686172742f6c696e657371007e002b0071007e0018740020343032383861623835636638316230343031356366383231336461313030303271007e0032740009e4b880e5afb9e5a49a7371007e002b0071007e0018740020343032383165383135633534376333323031356335346132316532363030333871007e003274000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e003b740000740012746573743a746573746f726465726d61696e74000071007e004c70740012746573742f746573746f726465726d61696e7371007e002b0071007e0018740020343032383861623835623630346164663031356236303530323361373030303071007e003274000ce59ca8e7babfe794a8e688b77371007e002b0071007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003b74000074000f7379733a6f6e6c696e653a6c69737474000ce59ca8e7babfe794a8e688b771007e004c7074000a7379732f6f6e6c696e657371007e002b0071007e0018740020343032383165383135633538306561333031356335386338363335643030333771007e003274000ce6b58be8af95e58d95e8a1a87371007e002b0071007e0018740020343032383165383135633534376333323031356335346132316532363030333871007e003274000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e003b740000740010746573743a73696e676c657461626c6574000071007e004c70740010746573742f73696e676c657461626c657371007e002b0071007e0018740020343032383165383135633931323430363031356339313461316263333030343571007e003274000ce9809ae79fa5e585ace5918a7371007e002b0071007e0018740020343032383165383135633931323430363031356339313439663762383030343471007e003274000ce9809ae79fa5e585ace5918a70707070707070707070740020343032383165383135633931323430363031356339313439663762383030343474002134303238316538313563393132343036303135633931343966376238303034342f71007e003b7400007400116f613a6f616e6f74696669636174696f6e74000071007e004c707400116f612f6f616e6f74696669636174696f6e7371007e002b0071007e0018740020343032383861623835633161653736633031356331623133313636383030303171007e0032740009e7bc96e8be91e599a87371007e002b0071007e0018740020343032383861623835633161653736633031356331623132623638613030303071007e003274000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003b74000074000074000071007e004c7074001064656d6f2f666f726d2f656469746f727371007e002b0171007e0018740020343032386561383135613738653965363031356137386631646339643030303071007e003274000fe4bba3e7a081e7949fe68890e599a870707071007e003b74000e66612d66696c652d636f64652d6f74000074000071007e004c707400007371007e002b0071007e0018740020343032386561383135613738653965363031356137386633356362653030303171007e003274000ce8a1a8e58d95e9858de7bdae7371007e002b0071007e0018740020343032386561383135613738653965363031356137386631646339643030303071007e003274000fe4bba3e7a081e7949fe68890e599a870707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f71007e003b740000740012636f646567656e3a7461626c653a6c69737474000071007e004c7074000d636f646567656e2f7461626c657371007e002b0071007e0018740020343032383165383135636566316637363031356365663236386666303030306571007e0032740009e6b58be8af95e6a0917371007e002b0071007e0018740020343032383165383135633534376333323031356335346132316532363030333871007e003274000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e003b74000074000d746573743a7465737474726565740009e6b58be8af95e6a09171007e004c7074000d746573742f74657374747265657371007e002b0071007e0018740020343032383861623835626561393435323031356265616139653761373030303271007e003274000ce58f82e695b0e9858de7bdae7371007e002b0071007e0018740020343032383861623835633835393363643031356338353966343739363030313671007e003274000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003b74000074000f7379733a73657474696e673a736d7374000071007e004c7074000f7379732f73657474696e672f736d737371007e002b0071007e0018740020343032383861623835613565656363363031356135656636636538373030303271007e003274000ce794a8e688b7e7aea1e790867371007e002b0071007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003b74000566612d747674000d7379733a757365723a6c697374740014736466647366736466736466736466736466736671007e004c707400087379732f757365727371007e002b0071007e0018740020343032383861623835613565656363363031356135656638663238393030303371007e003274000ce983a8e997a8e7aea1e790867371007e002b0071007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003b74001066612d62616c616e63652d7363616c657400157379733a6f7267616e697a6174696f6e3a6c6973747400007371007e004b00000002707400107379732f6f7267616e697a6174696f6e7371007e002b0071007e0018740020343032383165383135633866333531323031356338663563633732323030343071007e003274000ce982aee4bbb6e58f91e980817371007e002b0071007e0018740020343032383861623835626561393435323031356265616137663235613030303071007e003274000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e003b74000074000a656d61696c3a73656e6474000071007e00cc70740010656d61696c2f73656e642f656d61696c7371007e002b0071007e0018740020343032383165383135633039376163663031356330393762636165613030303071007e0032740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b57371007e002b0071007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003b7400007400127379733a757365726c6173746f6e6c696e65740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b571007e00cc7074000e7379732f6c6173744f6e6c696e657371007e002b0071007e0018740020343032383861623835633965656235633031356339663566613032653030326171007e0032740009e69fb1e78ab6e59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b74000074000074000071007e00cc707400192f6368617274732f656368617274732f63686172742f6261727371007e002b0171007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707071007e003b74000766612d6765617274000074000071007e00cc707400007371007e002b0071007e0018740020343032383861623835633165323434323031356331653332343662373030303071007e003274000ce69687e4bbb6e4b88ae4bca07371007e002b0071007e0018740020343032383861623835633161653736633031356331623132623638613030303071007e003274000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003b74000074000074000071007e00cc7074001064656d6f2f666f726d2f75706c6f61647371007e002b0071007e0018740020343032386561383135613730313431363031356137303736366137613030323071007e003274000fe695b0e68daee5ba93e79b91e68ea77371007e002b0071007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003b7400007400136d6f6e69746f723a64727569643a696e6465787400007371007e004b000000037074000d6d6f6e69746f722f64727569647371007e002b0071007e0018740020343032383861623835633835393363643031356338353966613332343030313771007e003274000ce79fade4bfa1e6a8a1e789887371007e002b0071007e0018740020343032383861623835633835393363643031356338353966343739363030313671007e003274000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003b74000074000f736d733a736d7374656d706c61746574000ce79fade4bfa1e6a8a1e7898871007e01107074000f736d732f736d7374656d706c6174657371007e002b0071007e0018740020343032383861623835633364663662373031356333653364316537373030303071007e0032740012e6909ce7b4a2e887aae58aa8e8a1a5e585a87371007e002b0071007e0018740020343032383861623835633161653736633031356331623132623638613030303071007e003274000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003b74000866612d353030707874000074000ce6b58be8af95e88f9ce58d9571007e01107074001064656d6f2f666f726d2f636f6d626f787371007e002b0071007e0018740020343032383165383135633838306332353031356338383064323938373030303171007e003274000ce79fade4bfa1e58f91e980817371007e002b0071007e0018740020343032383861623835633835393363643031356338353966343739363030313671007e003274000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003b740000740008736d733a73656e6474000ce79fade4bfa1e58f91e9808171007e01107074000c736d732f73656e642f736d737371007e002b0071007e0018740020343032383861623835613565656363363031356135656639356337303030303471007e003274000ce8a792e889b2e7aea1e790867371007e002b0071007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003b74000966612d616d617a6f6e74000d7379733a726f6c653a6c69737474000071007e0110707400087379732f726f6c657371007e002b0071007e0018740020343032383165383135633866333531323031356338663432333366633030316371007e003274000ce982aee4bbb6e6a8a1e789887371007e002b0071007e0018740020343032383861623835626561393435323031356265616137663235613030303071007e003274000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e003b740000740013656d61696c3a656d61696c74656d706c61746574000ce6a8a1e69dbfe9858de7bdae71007e011070740013656d61696c2f656d61696c74656d706c6174657371007e002b0171007e0018740020343032383165383135633534376333323031356335346132316532363030333871007e003274000ce7949fe68890e6a188e588977371007e002b0071007e0018740020343032386561383135613738653965363031356137386631646339643030303071007e003274000fe4bba3e7a081e7949fe68890e599a870707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f71007e003b74000074000074000ce7949fe68890e6a188e5889771007e0110707400007371007e002b0171007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707071007e003b74000f66612d766964656f2d63616d65726174000074000071007e0110707400007371007e002b0071007e0018740020343032383861623835613565656363363031356135656639663631363030303571007e003274000ce88f9ce58d95e7aea1e790867371007e002b0071007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003b74001066612d62616c616e63652d7363616c6574000d7379733a6d656e753a6c6973747400007371007e004b00000004707400087379732f6d656e757371007e002b0071007e0018740020343032383165383135626564613930663031356265646366373130323030306671007e003274000ce8aea1e58892e4bbbbe58aa17371007e002b0071007e0018740020343032383861623835636638323736623031356366383264656263623030356271007e003274000ce5b8b8e8a781e5b7a5e585b770707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f71007e003b7400007400157461736b3a7363686564756c656a6f623a6c69737474000071007e016c707400107461736b2f7363686564756c656a6f627371007e002b0071007e0018740020343032383165383135633866333531323031356338663431636561373030316271007e003274000ce58f91e98081e697a5e5bf977371007e002b0071007e0018740020343032383861623835626561393435323031356265616137663235613030303071007e003274000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e003b740000740012656d61696c3a656d61696c73656e646c6f6774000ce58f91e98081e697a5e5bf9771007e016c70740012656d61696c2f656d61696c73656e646c6f677371007e002b0071007e0018740020343032383861623835633835666135343031356338363063656532653030323371007e003274000ce58f91e98081e697a5e5bf977371007e002b0071007e0018740020343032383861623835633835393363643031356338353966343739363030313671007e003274000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003b74000074000e736d733a736d7373656e646c6f67740012e79fade4bfa1e58f91e98081e697a5e5bf9771007e016c7074000e736d732f736d7373656e646c6f677371007e002b0171007e0018740020343032383861623835636638323736623031356366383264656263623030356271007e003274000ce5b8b8e8a781e5b7a5e585b770707071007e003b74000d66612d62696e6f63756c61727374000074000071007e016c707400007371007e002b0071007e0018740020343032383861623835613565656363363031356135656661613735643030303671007e003274000ce695b0e68daee5ad97e585b87371007e002b0071007e0018740020343032383861623835613565656363363031356135656632326164383030303171007e003274000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003b74000966612d616d617a6f6e74000d7379733a646963743a6c6973747400007371007e004b000000057074000e7379732f646963742f67726f75707371007e002b0071007e0018740020343032383861623835626566643635613031356266303838333333613030313571007e0032740012e5a49ae695b0e68daee6ba90e7aea1e790867371007e002b0071007e0018740020343032383861623835636638323736623031356366383264656263623030356271007e003274000ce5b8b8e8a781e5b7a5e585b770707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f71007e003b7400007400137379733a64617461736f757263653a6c69737474000fe58aa8e68081e695b0e68daee6ba9071007e01a47074000e7379732f64617461736f757263657371007e002b0071007e0018740020343032383861623835633333353438643031356333336364633561363030663371007e003274000ce99984e4bbb6e4bfa1e681af7371007e002b0071007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003b7400007400137379733a6174746163686d656e743a6c69737474000071007e01a47074000e7379732f6174746163686d656e747371007e002b0071007e0018740020343032383861623835633965656235633031356339663632366635383030326471007e0032740009e6bc8fe69697e59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b74000074000074000071007e01a47074001c2f6368617274732f656368617274732f63686172742f66756e6e656c7371007e002b0171007e0018740020343032383165383135633931323430363031356339313439663762383030343471007e003274000ce9809ae79fa5e585ace5918a70707071007e003b74000d66612d74656c65766973696f6e74000074000071007e01a4707400007371007e002b0171007e0018740020343032383861623835626561393435323031356265616137663235613030303071007e003274000ce982aee7aeb1e8aebee7bdae70707071007e003b74000b66612d656e76656c6f706574000074000071007e01a4707400007371007e002b0071007e0018740020343032383861623835633965656235633031356339663632653732363030326571007e0032740009e4bbaae8a1a8e79b987371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b7400007400007400007371007e004b000000067074001b2f6368617274732f656368617274732f63686172742f67617567657371007e002b0071007e0018740020343032383165383135633534643134373031356335346461663136633030303171007e003274000ce7b3bbe7bb9fe697a5e5bf977371007e002b0071007e0018740020343032386561383135613730313431363031356137303735623466393030316671007e003274000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003b74000766612d626f6f6b7400077379733a6c6f6774000ce7b3bbe7bb9fe697a5e5bf9771007e01e3707400077379732f6c6f677371007e002b0171007e0018740020343032383861623835633835393363643031356338353966343739363030313671007e003274000ce79fade4bfa1e8aebee7bdae70707071007e003b74000b66612d636f6d6d656e747374000074000071007e01e3707400007371007e002b0071007e0018740020343032383861623835633965656235633031356339663635373236333030333071007e0032740009e9a5bce78ab6e59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b7400007400007400007371007e004b00000007707400192f6368617274732f656368617274732f63686172742f7069657371007e002b0071007e0018740020343032383861623835633965656235633031356339663633393066643030326671007e00327400074be7babfe59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b74000074000074000071007e0203707400172f6368617274732f656368617274732f63686172742f6b7371007e002b0071007e0018740020343032383861623835633965656235633031356339663635653361353030333171007e0032740009e99bb7e8bebee59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b7400007400007400007371007e004b000000097074001b2f6368617274732f656368617274732f63686172742f72616461727371007e002b0071007e0018740020343032383861623835633965656235633031356339663637326632653030333271007e0032740009e695a3e782b9e59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b74000074000074000071007e021c7074001d2f6368617274732f656368617274732f63686172742f736361747465727371007e002b0171007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707071007e003b74000c66612d6261722d63686172747400007400007371007e004b0000000a707400007371007e002b0071007e0018740020343032383861623835633965656235633031356339663936393434383030363471007e0032740009e585b3e7b3bbe59bbe7371007e002b0071007e0018740020343032383861623835633965656235633031356339663464316638653030303071007e003274000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003b7400007400007400007371007e004b0000000b7074001e2f6368617274732f656368617274732f63686172742f63697263756c61727371007e002b0171007e0018740020343032383861623835633161653736633031356331623132623638613030303071007e003274000ce4bba3e7a081e6a188e4be8b70707071007e003b74000766612d636f64657400007400007371007e004b0000000c707400007874005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e024d7878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a3836383674006d4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b20574f57363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e333670707702000671007e025c71007e025978',NULL,NULL,NULL,NULL,NULL,'0'),
('aaa3b83f-06c0-4dbe-b9cf-a0764b7d6b2a','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','on_line','2017-07-22 18:20:52','2017-07-22 20:22:16',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002461616133623833662d303663302d346462652d623963662d6130373634623764366232617372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d69d067e6787371007e000677080000015d6a3f8ce778771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000677080000000800000004740008726f6c654c697374737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000273720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e526f6c659aa4b6918ff4af640200054c0004636f646571007e00024c0002696471007e00024c0005697353797371007e00024c00046e616d6571007e00024c0006757361626c6571007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e44617461456e7469747900000000000000010200064c000863726561746542797400234c636e2f6a65657765622f6d6f64756c65732f7379732f656e746974792f557365723b4c000a637265617465446174657400104c6a6176612f7574696c2f446174653b4c000764656c466c616771007e00024c000772656d61726b7371007e00024c0008757064617465427971007e00104c000a7570646174654461746571007e00117872002b636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e4162737472616374456e74697479a62e7e8b4d2cc0460200007872001e636e2e6a65657765622e636f72652e626173652e42617365456e74697479000000000000000102000078707070707070707400066e6f726d616c74002034303238383065343562356437363336303135623564386261636136303030307400013174000ce699aee9809ae794a8e688b7740001317371007e000e70707070707074000561646d696e74002034303238386162383561333632313530303135613336373563613935303030367400013174000fe7b3bbe7bb9fe7aea1e79086e5919874000131787400086d656e754c6973747371007e000c0000002f77040000002f73720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e4d656e758f87a375bc8d68510200074c0006697373686f777400114c6a6176612f6c616e672f53686f72743b4c00086d656e7549636f6e71007e00024c000a7065726d697373696f6e71007e00024c000772656d61726b7371007e00024c0004736f72747400134c6a6176612f6c616e672f496e74656765723b4c00047479706571007e00024c000375726c71007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e54726565456e7469747900000000000000010200085a000b6861734368696c6472656e4c0008657870616e6465647400134c6a6176612f6c616e672f426f6f6c65616e3b4c0002696471007e00024c00066c6f6164656471007e00264c00046e616d6571007e00024c0006706172656e747400124c6a6176612f6c616e672f4f626a6563743b4c0008706172656e74496471007e00024c0009706172656e7449647371007e00027871007e001200737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700074002034303238386162383562656139343532303135626561613834363138303030317371007e00290174000ce58f82e695b0e8aebee7bdae7371007e00220071007e002a740020343032383861623835626561393435323031356265616137663235613030303071007e002c74000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f7372000f6a6176612e6c616e672e53686f7274684d37133460da5202000153000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000017400007400117379733a73657474696e673a656d61696c74000070707400117379732f73657474696e672f656d61696c7371007e00220071007e002a740020343032383861623835623630346164663031356236303530323361373030303071007e002c74000ce59ca8e7babfe794a8e688b77371007e00220071007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003574000074000f7379733a6f6e6c696e653a6c69737474000ce59ca8e7babfe794a8e688b7737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e0034000000017074000a7379732f6f6e6c696e657371007e00220071007e002a740020343032383165383135636566316637363031356365663236386666303030306571007e002c740009e6b58be8af95e6a0917371007e00220071007e002a740020343032383165383135633534376333323031356335346132316532363030333871007e002c74000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e003574000074000d746573743a7465737474726565740009e6b58be8af95e6a09171007e00467074000d746573742f74657374747265657371007e00220071007e002a740020343032383165383135633931323430363031356339313461316263333030343571007e002c74000ce9809ae79fa5e585ace5918a7371007e00220071007e002a740020343032383165383135633931323430363031356339313439663762383030343471007e002c74000ce9809ae79fa5e585ace5918a70707070707070707070740020343032383165383135633931323430363031356339313439663762383030343474002134303238316538313563393132343036303135633931343966376238303034342f71007e00357400007400116f613a6f616e6f74696669636174696f6e74000071007e0046707400116f612f6f616e6f74696669636174696f6e7371007e00220071007e002a740020343032383861623835633965656235633031356339663465316364303030303171007e002c740009e68a98e7babfe59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e00467074001a2f6368617274732f656368617274732f63686172742f6c696e657371007e00220071007e002a740020343032383861623835633161653736633031356331623133313636383030303171007e002c740009e7bc96e8be91e599a87371007e00220071007e002a740020343032383861623835633161653736633031356331623132623638613030303071007e002c74000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003574000074000074000071007e00467074001064656d6f2f666f726d2f656469746f727371007e00220071007e002a740020343032383861623835636638316230343031356366383231336461313030303271007e002c740009e4b880e5afb9e5a49a7371007e00220071007e002a740020343032383165383135633534376333323031356335346132316532363030333871007e002c74000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e0035740000740012746573743a746573746f726465726d61696e74000071007e004670740012746573742f746573746f726465726d61696e7371007e00220071007e002a740020343032383165383135633538306561333031356335386338363335643030333771007e002c74000ce6b58be8af95e58d95e8a1a87371007e00220071007e002a740020343032383165383135633534376333323031356335346132316532363030333871007e002c74000ce7949fe68890e6a188e5889770707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f71007e0035740000740010746573743a73696e676c657461626c6574000071007e004670740010746573742f73696e676c657461626c657371007e00220071007e002a740020343032383861623835626561393435323031356265616139653761373030303271007e002c74000ce58f82e695b0e9858de7bdae7371007e00220071007e002a740020343032383861623835633835393363643031356338353966343739363030313671007e002c74000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003574000074000f7379733a73657474696e673a736d7374000071007e00467074000f7379732f73657474696e672f736d737371007e00220071007e002a740020343032383861623835613565656363363031356135656636636538373030303271007e002c74000ce794a8e688b7e7aea1e790867371007e00220071007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003574000566612d747674000d7379733a757365723a6c697374740014736466647366736466736466736466736466736671007e0046707400087379732f757365727371007e00220171007e002a740020343032386561383135613738653965363031356137386631646339643030303071007e002c74000fe4bba3e7a081e7949fe68890e599a870707071007e003574000e66612d66696c652d636f64652d6f74000074000071007e0046707400007371007e00220071007e002a740020343032386561383135613738653965363031356137386633356362653030303171007e002c74000ce8a1a8e58d95e9858de7bdae7371007e00220071007e002a740020343032386561383135613738653965363031356137386631646339643030303071007e002c74000fe4bba3e7a081e7949fe68890e599a870707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f71007e0035740000740012636f646567656e3a7461626c653a6c69737474000071007e00467074000d636f646567656e2f7461626c657371007e00220071007e002a740020343032383861623835613565656363363031356135656638663238393030303371007e002c74000ce983a8e997a8e7aea1e790867371007e00220071007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003574001066612d62616c616e63652d7363616c657400157379733a6f7267616e697a6174696f6e3a6c6973747400007371007e004500000002707400107379732f6f7267616e697a6174696f6e7371007e00220071007e002a740020343032383165383135633866333531323031356338663563633732323030343071007e002c74000ce982aee4bbb6e58f91e980817371007e00220071007e002a740020343032383861623835626561393435323031356265616137663235613030303071007e002c74000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e003574000074000a656d61696c3a73656e6474000071007e00c670740010656d61696c2f73656e642f656d61696c7371007e00220071007e002a740020343032383861623835633165323434323031356331653332343662373030303071007e002c74000ce69687e4bbb6e4b88ae4bca07371007e00220071007e002a740020343032383861623835633161653736633031356331623132623638613030303071007e002c74000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003574000074000074000071007e00c67074001064656d6f2f666f726d2f75706c6f61647371007e00220071007e002a740020343032383165383135633039376163663031356330393762636165613030303071007e002c740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b57371007e00220071007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e00357400007400127379733a757365726c6173746f6e6c696e65740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b571007e00c67074000e7379732f6c6173744f6e6c696e657371007e00220171007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707071007e003574000766612d6765617274000074000071007e00c6707400007371007e00220071007e002a740020343032383861623835633965656235633031356339663566613032653030326171007e002c740009e69fb1e78ab6e59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e00c6707400192f6368617274732f656368617274732f63686172742f6261727371007e00220071007e002a740020343032383861623835633835393363643031356338353966613332343030313771007e002c74000ce79fade4bfa1e6a8a1e789887371007e00220071007e002a740020343032383861623835633835393363643031356338353966343739363030313671007e002c74000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003574000074000f736d733a736d7374656d706c61746574000ce79fade4bfa1e6a8a1e789887371007e0045000000037074000f736d732f736d7374656d706c6174657371007e00220171007e002a740020343032383165383135633534376333323031356335346132316532363030333871007e002c74000ce7949fe68890e6a188e588977371007e00220071007e002a740020343032386561383135613738653965363031356137386631646339643030303071007e002c74000fe4bba3e7a081e7949fe68890e599a870707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f71007e003574000074000074000ce7949fe68890e6a188e5889771007e010a707400007371007e00220071007e002a740020343032383165383135633838306332353031356338383064323938373030303171007e002c74000ce79fade4bfa1e58f91e980817371007e00220071007e002a740020343032383861623835633835393363643031356338353966343739363030313671007e002c74000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e0035740000740008736d733a73656e6474000ce79fade4bfa1e58f91e9808171007e010a7074000c736d732f73656e642f736d737371007e00220071007e002a740020343032386561383135613730313431363031356137303736366137613030323071007e002c74000fe695b0e68daee5ba93e79b91e68ea77371007e00220071007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e00357400007400136d6f6e69746f723a64727569643a696e64657874000071007e010a7074000d6d6f6e69746f722f64727569647371007e00220071007e002a740020343032383861623835613565656363363031356135656639356337303030303471007e002c74000ce8a792e889b2e7aea1e790867371007e00220071007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003574000966612d616d617a6f6e74000d7379733a726f6c653a6c69737474000071007e010a707400087379732f726f6c657371007e00220071007e002a740020343032383861623835633364663662373031356333653364316537373030303071007e002c740012e6909ce7b4a2e887aae58aa8e8a1a5e585a87371007e00220071007e002a740020343032383861623835633161653736633031356331623132623638613030303071007e002c74000ce4bba3e7a081e6a188e4be8b70707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f71007e003574000866612d353030707874000074000ce6b58be8af95e88f9ce58d9571007e010a7074001064656d6f2f666f726d2f636f6d626f787371007e00220071007e002a740020343032383165383135633866333531323031356338663432333366633030316371007e002c74000ce982aee4bbb6e6a8a1e789887371007e00220071007e002a740020343032383861623835626561393435323031356265616137663235613030303071007e002c74000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e0035740000740013656d61696c3a656d61696c74656d706c61746574000ce6a8a1e69dbfe9858de7bdae71007e010a70740013656d61696c2f656d61696c74656d706c6174657371007e00220171007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707071007e003574000f66612d766964656f2d63616d65726174000074000071007e010a707400007371007e00220071007e002a740020343032383165383135626564613930663031356265646366373130323030306671007e002c74000ce8aea1e58892e4bbbbe58aa17371007e00220071007e002a740020343032383861623835636638323736623031356366383264656263623030356271007e002c74000ce5b8b8e8a781e5b7a5e585b770707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f71007e00357400007400157461736b3a7363686564756c656a6f623a6c6973747400007371007e004500000004707400107461736b2f7363686564756c656a6f627371007e00220071007e002a740020343032383861623835613565656363363031356135656639663631363030303571007e002c74000ce88f9ce58d95e7aea1e790867371007e00220071007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003574001066612d62616c616e63652d7363616c6574000d7379733a6d656e753a6c69737474000071007e0166707400087379732f6d656e757371007e00220071007e002a740020343032383165383135633866333531323031356338663431636561373030316271007e002c74000ce58f91e98081e697a5e5bf977371007e00220071007e002a740020343032383861623835626561393435323031356265616137663235613030303071007e002c74000ce982aee7aeb1e8aebee7bdae70707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f71007e0035740000740012656d61696c3a656d61696c73656e646c6f6774000ce58f91e98081e697a5e5bf9771007e016670740012656d61696c2f656d61696c73656e646c6f677371007e00220071007e002a740020343032383861623835633835666135343031356338363063656532653030323371007e002c74000ce58f91e98081e697a5e5bf977371007e00220071007e002a740020343032383861623835633835393363643031356338353966343739363030313671007e002c74000ce79fade4bfa1e8aebee7bdae70707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f71007e003574000074000e736d733a736d7373656e646c6f67740012e79fade4bfa1e58f91e98081e697a5e5bf9771007e01667074000e736d732f736d7373656e646c6f677371007e00220171007e002a740020343032383861623835636638323736623031356366383264656263623030356271007e002c74000ce5b8b8e8a781e5b7a5e585b770707071007e003574000d66612d62696e6f63756c61727374000074000071007e0166707400007371007e00220171007e002a740020343032383165383135633931323430363031356339313439663762383030343471007e002c74000ce9809ae79fa5e585ace5918a70707071007e003574000d66612d74656c65766973696f6e7400007400007371007e004500000005707400007371007e00220171007e002a740020343032383861623835626561393435323031356265616137663235613030303071007e002c74000ce982aee7aeb1e8aebee7bdae70707071007e003574000b66612d656e76656c6f706574000074000071007e0199707400007371007e00220071007e002a740020343032383861623835633965656235633031356339663632366635383030326471007e002c740009e6bc8fe69697e59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e01997074001c2f6368617274732f656368617274732f63686172742f66756e6e656c7371007e00220071007e002a740020343032383861623835626566643635613031356266303838333333613030313571007e002c740012e5a49ae695b0e68daee6ba90e7aea1e790867371007e00220071007e002a740020343032383861623835636638323736623031356366383264656263623030356271007e002c74000ce5b8b8e8a781e5b7a5e585b770707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f71007e00357400007400137379733a64617461736f757263653a6c69737474000fe58aa8e68081e695b0e68daee6ba9071007e01997074000e7379732f64617461736f757263657371007e00220071007e002a740020343032383861623835633333353438643031356333336364633561363030663371007e002c74000ce99984e4bbb6e4bfa1e681af7371007e00220071007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e00357400007400137379733a6174746163686d656e743a6c69737474000071007e01997074000e7379732f6174746163686d656e747371007e00220071007e002a740020343032383861623835613565656363363031356135656661613735643030303671007e002c74000ce695b0e68daee5ad97e585b87371007e00220071007e002a740020343032383861623835613565656363363031356135656632326164383030303171007e002c74000ce7b3bbe7bb9fe8aebee7bdae70707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f71007e003574000966612d616d617a6f6e74000d7379733a646963743a6c69737474000071007e01997074000e7379732f646963742f67726f75707371007e00220171007e002a740020343032383861623835633835393363643031356338353966343739363030313671007e002c74000ce79fade4bfa1e8aebee7bdae70707071007e003574000b66612d636f6d6d656e74737400007400007371007e004500000006707400007371007e00220071007e002a740020343032383165383135633534643134373031356335346461663136633030303171007e002c74000ce7b3bbe7bb9fe697a5e5bf977371007e00220071007e002a740020343032386561383135613730313431363031356137303735623466393030316671007e002c74000ce7b3bbe7bb9fe79b91e68ea770707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f71007e003574000766612d626f6f6b7400077379733a6c6f6774000ce7b3bbe7bb9fe697a5e5bf9771007e01d8707400077379732f6c6f677371007e00220071007e002a740020343032383861623835633965656235633031356339663632653732363030326571007e002c740009e4bbaae8a1a8e79b987371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e01d87074001b2f6368617274732f656368617274732f63686172742f67617567657371007e00220071007e002a740020343032383861623835633965656235633031356339663633393066643030326671007e002c7400074be7babfe59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e00357400007400007400007371007e004500000007707400172f6368617274732f656368617274732f63686172742f6b7371007e00220071007e002a740020343032383861623835633965656235633031356339663635373236333030333071007e002c740009e9a5bce78ab6e59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e01fd707400192f6368617274732f656368617274732f63686172742f7069657371007e00220071007e002a740020343032383861623835633965656235633031356339663637326632653030333271007e002c740009e695a3e782b9e59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e00357400007400007400007371007e0045000000097074001d2f6368617274732f656368617274732f63686172742f736361747465727371007e00220071007e002a740020343032383861623835633965656235633031356339663635653361353030333171007e002c740009e99bb7e8bebee59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e003574000074000074000071007e02167074001b2f6368617274732f656368617274732f63686172742f72616461727371007e00220171007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707071007e003574000c66612d6261722d63686172747400007400007371007e00450000000a707400007371007e00220071007e002a740020343032383861623835633965656235633031356339663936393434383030363471007e002c740009e585b3e7b3bbe59bbe7371007e00220071007e002a740020343032383861623835633965656235633031356339663464316638653030303071007e002c74000ce7bb9fe8aea1e68aa5e8a1a870707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f71007e00357400007400007400007371007e00450000000b7074001e2f6368617274732f656368617274732f63686172742f63697263756c61727371007e00220171007e002a740020343032383861623835633161653736633031356331623132623638613030303071007e002c74000ce4bba3e7a081e6a188e4be8b70707071007e003574000766612d636f64657400007400007371007e00450000000c707400007874005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e02477878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a3836383674006d4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b20574f57363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e333670707702000671007e025671007e025378',NULL,NULL,NULL,NULL,NULL,'0'),
('b47f0b8c-9570-401e-91f5-089318dcb77d','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 16:55:53','2017-07-22 16:55:53',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002462343766306238632d393537302d343031652d393166352d3038393331386463623737647372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d69829b0f787371007e000677080000015d69829b2178771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('b9aeba45-649b-455a-a8aa-5b5a4af1cd28','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 18:49:14','2017-07-22 19:27:56',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002462396165626134352d363439622d343535612d613861612d3562356134616631636432387372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d69ea63aa787371007e000677080000015d6a0dcec878771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000017708000000020000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('d1f6851c-8a3b-495e-b76e-5fe8dc550eec','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 17:15:39','2017-07-22 17:22:16',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002464316636383531632d386133622d343935652d623736652d3566653864633535306565637372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6994b63a787371007e000677080000015d699ac19378771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000017708000000020000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('d375372b-84b7-4324-a7fb-935cb1deaf32','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-23 20:31:04','2017-07-23 20:31:04',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002464333735333732622d383462372d343332342d613766622d3933356362316465616633327372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6f6df7cb787371007e000677080000015d6f6df7dc78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-23 20:31:04',NULL,NULL,NULL,'0'),
('dbfda91d-ce98-4999-8520-3bc72f1d8ec0','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','on_line','2017-07-22 21:45:53','2017-07-22 23:25:15',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002464626664613931642d636539382d343939392d383532302d3362633732663164386563307372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6a8c1d7f787371007e000677080000015d6ae7157a78771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000677080000000800000004740008726f6c654c697374737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000273720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e526f6c659aa4b6918ff4af640200054c0004636f646571007e00024c0002696471007e00024c0005697353797371007e00024c00046e616d6571007e00024c0006757361626c6571007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e44617461456e7469747900000000000000010200064c000863726561746542797400234c636e2f6a65657765622f6d6f64756c65732f7379732f656e746974792f557365723b4c000a637265617465446174657400104c6a6176612f7574696c2f446174653b4c000764656c466c616771007e00024c000772656d61726b7371007e00024c0008757064617465427971007e00104c000a7570646174654461746571007e00117872002b636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e4162737472616374456e74697479a62e7e8b4d2cc0460200007872001e636e2e6a65657765622e636f72652e626173652e42617365456e7469747900000000000000010200007870707371007e000677080000015b5d8baab07874000130740000707371007e000677080000015d15448b80787400066e6f726d616c74002034303238383065343562356437363336303135623564386261636136303030307400013174000ce699aee9809ae794a8e688b7740001317371007e000e707371007e000677080000015a3675c808787400013074000fe7b3bbe7bb9fe7aea1e79086e59198707371007e000677080000015a4077c3387874000561646d696e74002034303238386162383561333632313530303135613336373563613935303030367400013174000fe7b3bbe7bb9fe7aea1e79086e5919874000131787400086d656e754c6973747371007e000c0000002f77040000002f73720021636e2e6a65657765622e6d6f64756c65732e7379732e656e746974792e4d656e753e77a326174a64ff02000c4c0008637265617465427971007e00104c000a6372656174654461746571007e00114c000764656c466c616771007e00024c0006697373686f777400114c6a6176612f6c616e672f53686f72743b4c00086d656e7549636f6e71007e00024c000a7065726d697373696f6e71007e00024c000772656d61726b7371007e00024c0004736f72747400134c6a6176612f6c616e672f496e74656765723b4c00047479706571007e00024c0008757064617465427971007e00104c000a7570646174654461746571007e00114c000375726c71007e000278720027636e2e6a65657765622e636f72652e636f6d6d6f6e2e656e746974792e54726565456e7469747900000000000000010200085a000b6861734368696c6472656e4c0008657870616e6465647400134c6a6176612f6c616e672f426f6f6c65616e3b4c0002696471007e00024c00066c6f6164656471007e002e4c00046e616d6571007e00024c0006706172656e747400124c6a6176612f6c616e672f4f626a6563743b4c0008706172656e74496471007e00024c0009706172656e7449647371007e00027871007e001200737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700074002034303238386162383562656139343532303135626561613834363138303030317371007e00310174000ce58f82e695b0e8aebee7bdae7371007e002a0071007e0032740020343032383861623835626561393435323031356265616137663235613030303071007e003474000ce982aee7aeb1e8aebee7bdae707070707074000130707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f707071007e00397372000f6a6176612e6c616e672e53686f7274684d37133460da5202000153000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000017400007400117379733a73657474696e673a656d61696c740000707070707400117379732f73657474696e672f656d61696c7371007e002a0071007e0032740020343032386561383135613738653965363031356137386633356362653030303171007e003474000ce8a1a8e58d95e9858de7bdae7371007e002a0071007e0032740020343032386561383135613738653965363031356137386631646339643030303071007e003474000fe4bba3e7a081e7949fe68890e599a8707070707071007e0039707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f707071007e003971007e003e740000740012636f646567656e3a7461626c653a6c697374740000737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e003d0000000170707074000d636f646567656e2f7461626c657371007e002a0071007e0032740020343032383861623835633161653736633031356331623133313636383030303171007e0034740009e7bc96e8be91e599a87371007e002a0071007e0032740020343032383861623835633161653736633031356331623132623638613030303071007e003474000ce4bba3e7a081e6a188e4be8b707070707071007e0039707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f707071007e003971007e003e74000074000074000071007e004f70707074001064656d6f2f666f726d2f656469746f727371007e002a0071007e0032740020343032383165383135636566316637363031356365663236386666303030306571007e0034740009e6b58be8af95e6a0917371007e002a0071007e0032740020343032383165383135633534376333323031356335346132316532363030333871007e003474000ce7949fe68890e6a188e58897707070707071007e0039707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f707071007e003971007e003e74000074000d746573743a7465737474726565740009e6b58be8af95e6a09171007e004f70707074000d746573742f74657374747265657371007e002a0071007e0032740020343032383861623835626561393435323031356265616139653761373030303271007e003474000ce58f82e695b0e9858de7bdae7371007e002a0071007e0032740020343032383861623835633835393363643031356338353966343739363030313671007e003474000ce79fade4bfa1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f707071007e003971007e003e74000074000f7379733a73657474696e673a736d7374000071007e004f70707074000f7379732f73657474696e672f736d737371007e002a0071007e0032740020343032383861623835613565656363363031356135656636636538373030303271007e003474000ce794a8e688b7e7aea1e790867371007e002a0071007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f707071007e003971007e003e74000566612d747674000d7379733a757365723a6c697374740014736466647366736466736466736466736466736671007e004f7070707400087379732f757365727371007e002a0071007e0032740020343032383861623835636638316230343031356366383231336461313030303271007e0034740009e4b880e5afb9e5a49a7371007e002a0071007e0032740020343032383165383135633534376333323031356335346132316532363030333871007e003474000ce7949fe68890e6a188e58897707070707071007e0039707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f707071007e003971007e003e740000740012746573743a746573746f726465726d61696e74000071007e004f707070740012746573742f746573746f726465726d61696e7371007e002a0071007e0032740020343032383861623835623630346164663031356236303530323361373030303071007e003474000ce59ca8e7babfe794a8e688b77371007e002a0071007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e0039707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f707071007e003971007e003e74000074000f7379733a6f6e6c696e653a6c69737474000ce59ca8e7babfe794a8e688b771007e004f70707074000a7379732f6f6e6c696e657371007e002a0071007e0032740020343032383861623835633965656235633031356339663465316364303030303171007e0034740009e68a98e7babfe59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e74000074000074000071007e004f70707074001a2f6368617274732f656368617274732f63686172742f6c696e657371007e002a0071007e0032740020343032383165383135633538306561333031356335386338363335643030333771007e003474000ce6b58be8af95e58d95e8a1a87371007e002a0071007e0032740020343032383165383135633534376333323031356335346132316532363030333871007e003474000ce7949fe68890e6a188e58897707070707071007e0039707070707070707070740020343032383165383135633534376333323031356335346132316532363030333874004234303238656138313561373865396536303135613738663164633964303030302f34303238316538313563353437633332303135633534613231653236303033382f707071007e003971007e003e740000740010746573743a73696e676c657461626c6574000071007e004f707070740010746573742f73696e676c657461626c657371007e002a0071007e0032740020343032383165383135633931323430363031356339313461316263333030343571007e003474000ce9809ae79fa5e585ace5918a7371007e002a0071007e0032740020343032383165383135633931323430363031356339313439663762383030343471007e003474000ce9809ae79fa5e585ace5918a707070707071007e0039707070707070707070740020343032383165383135633931323430363031356339313439663762383030343474002134303238316538313563393132343036303135633931343966376238303034342f707071007e003971007e003e7400007400116f613a6f616e6f74696669636174696f6e74000071007e004f7070707400116f612f6f616e6f74696669636174696f6e7371007e002a0171007e0032740020343032386561383135613738653965363031356137386631646339643030303071007e003474000fe4bba3e7a081e7949fe68890e599a8707070707071007e003971007e003e74000e66612d66696c652d636f64652d6f74000074000071007e004f7070707400007371007e002a0071007e0032740020343032383861623835633965656235633031356339663566613032653030326171007e0034740009e69fb1e78ab6e59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e7400007400007400007371007e004e000000027070707400192f6368617274732f656368617274732f63686172742f6261727371007e002a0171007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e003971007e003e74000766612d6765617274000074000071007e00cf7070707400007371007e002a0071007e0032740020343032383861623835633165323434323031356331653332343662373030303071007e003474000ce69687e4bbb6e4b88ae4bca07371007e002a0071007e0032740020343032383861623835633161653736633031356331623132623638613030303071007e003474000ce4bba3e7a081e6a188e4be8b707070707071007e0039707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f707071007e003971007e003e74000074000074000071007e00cf70707074001064656d6f2f666f726d2f75706c6f61647371007e002a0071007e0032740020343032383165383135633039376163663031356330393762636165613030303071007e0034740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b57371007e002a0071007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e0039707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f707071007e003971007e003e7400007400127379733a757365726c6173746f6e6c696e65740018e794a8e688b7e69c80e5908ee59ca8e7babfe68385e586b571007e00cf70707074000e7379732f6c6173744f6e6c696e657371007e002a0071007e0032740020343032383861623835613565656363363031356135656638663238393030303371007e003474000ce983a8e997a8e7aea1e790867371007e002a0071007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f707071007e003971007e003e74001066612d62616c616e63652d7363616c657400157379733a6f7267616e697a6174696f6e3a6c69737474000071007e00cf7070707400107379732f6f7267616e697a6174696f6e7371007e002a0071007e0032740020343032383165383135633866333531323031356338663563633732323030343071007e003474000ce982aee4bbb6e58f91e980817371007e002a0071007e0032740020343032383861623835626561393435323031356265616137663235613030303071007e003474000ce982aee7aeb1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f707071007e003971007e003e74000074000a656d61696c3a73656e6474000071007e00cf707070740010656d61696c2f73656e642f656d61696c7371007e002a0071007e0032740020343032383861623835613565656363363031356135656639356337303030303471007e003474000ce8a792e889b2e7aea1e790867371007e002a0071007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f707071007e003971007e003e74000966612d616d617a6f6e74000d7379733a726f6c653a6c6973747400007371007e004e000000037070707400087379732f726f6c657371007e002a0171007e0032740020343032383165383135633534376333323031356335346132316532363030333871007e003474000ce7949fe68890e6a188e588977371007e002a0071007e0032740020343032386561383135613738653965363031356137386631646339643030303071007e003474000fe4bba3e7a081e7949fe68890e599a8707070707071007e0039707070707070707070740020343032386561383135613738653965363031356137386631646339643030303074002134303238656138313561373865396536303135613738663164633964303030302f707071007e003971007e003e74000074000074000ce7949fe68890e6a188e5889771007e01137070707400007371007e002a0171007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e003971007e003e74000f66612d766964656f2d63616d65726174000074000071007e01137070707400007371007e002a0071007e0032740020343032383165383135633866333531323031356338663432333366633030316371007e003474000ce982aee4bbb6e6a8a1e789887371007e002a0071007e0032740020343032383861623835626561393435323031356265616137663235613030303071007e003474000ce982aee7aeb1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f707071007e003971007e003e740000740013656d61696c3a656d61696c74656d706c61746574000ce6a8a1e69dbfe9858de7bdae71007e0113707070740013656d61696c2f656d61696c74656d706c6174657371007e002a0071007e0032740020343032386561383135613730313431363031356137303736366137613030323071007e003474000fe695b0e68daee5ba93e79b91e68ea77371007e002a0071007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e0039707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f707071007e003971007e003e7400007400136d6f6e69746f723a64727569643a696e64657874000071007e011370707074000d6d6f6e69746f722f64727569647371007e002a0071007e0032740020343032383861623835633835393363643031356338353966613332343030313771007e003474000ce79fade4bfa1e6a8a1e789887371007e002a0071007e0032740020343032383861623835633835393363643031356338353966343739363030313671007e003474000ce79fade4bfa1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f707071007e003971007e003e74000074000f736d733a736d7374656d706c61746574000ce79fade4bfa1e6a8a1e7898871007e011370707074000f736d732f736d7374656d706c6174657371007e002a0071007e0032740020343032383165383135633838306332353031356338383064323938373030303171007e003474000ce79fade4bfa1e58f91e980817371007e002a0071007e0032740020343032383861623835633835393363643031356338353966343739363030313671007e003474000ce79fade4bfa1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f707071007e003971007e003e740000740008736d733a73656e6474000ce79fade4bfa1e58f91e9808171007e011370707074000c736d732f73656e642f736d737371007e002a0071007e0032740020343032383861623835633364663662373031356333653364316537373030303071007e0034740012e6909ce7b4a2e887aae58aa8e8a1a5e585a87371007e002a0071007e0032740020343032383861623835633161653736633031356331623132623638613030303071007e003474000ce4bba3e7a081e6a188e4be8b707070707071007e0039707070707070707070740020343032383861623835633161653736633031356331623132623638613030303074002134303238386162383563316165373663303135633162313262363861303030302f707071007e003971007e003e74000866612d353030707874000074000ce6b58be8af95e88f9ce58d9571007e011370707074001064656d6f2f666f726d2f636f6d626f787371007e002a0071007e0032740020343032383165383135633866333531323031356338663431636561373030316271007e003474000ce58f91e98081e697a5e5bf977371007e002a0071007e0032740020343032383861623835626561393435323031356265616137663235613030303071007e003474000ce982aee7aeb1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835626561393435323031356265616137663235613030303074002134303238386162383562656139343532303135626561613766323561303030302f707071007e003971007e003e740000740012656d61696c3a656d61696c73656e646c6f6774000ce58f91e98081e697a5e5bf977371007e004e00000004707070740012656d61696c2f656d61696c73656e646c6f677371007e002a0071007e0032740020343032383861623835633835666135343031356338363063656532653030323371007e003474000ce58f91e98081e697a5e5bf977371007e002a0071007e0032740020343032383861623835633835393363643031356338353966343739363030313671007e003474000ce79fade4bfa1e8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835633835393363643031356338353966343739363030313674002134303238386162383563383539336364303135633835396634373936303031362f707071007e003971007e003e74000074000e736d733a736d7373656e646c6f67740012e79fade4bfa1e58f91e98081e697a5e5bf9771007e016f70707074000e736d732f736d7373656e646c6f677371007e002a0171007e0032740020343032383861623835636638323736623031356366383264656263623030356271007e003474000ce5b8b8e8a781e5b7a5e585b7707070707071007e003971007e003e74000d66612d62696e6f63756c61727374000074000071007e016f7070707400007371007e002a0071007e0032740020343032383165383135626564613930663031356265646366373130323030306671007e003474000ce8aea1e58892e4bbbbe58aa17371007e002a0071007e0032740020343032383861623835636638323736623031356366383264656263623030356271007e003474000ce5b8b8e8a781e5b7a5e585b7707070707071007e0039707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f707071007e003971007e003e7400007400157461736b3a7363686564756c656a6f623a6c69737474000071007e016f7070707400107461736b2f7363686564756c656a6f627371007e002a0071007e0032740020343032383861623835613565656363363031356135656639663631363030303571007e003474000ce88f9ce58d95e7aea1e790867371007e002a0071007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f707071007e003971007e003e74001066612d62616c616e63652d7363616c6574000d7379733a6d656e753a6c69737474000071007e016f7070707400087379732f6d656e757371007e002a0071007e0032740020343032383861623835626566643635613031356266303838333333613030313571007e0034740012e5a49ae695b0e68daee6ba90e7aea1e790867371007e002a0071007e0032740020343032383861623835636638323736623031356366383264656263623030356271007e003474000ce5b8b8e8a781e5b7a5e585b7707070707071007e0039707070707070707070740020343032383861623835636638323736623031356366383264656263623030356274002134303238386162383563663832373662303135636638326465626362303035622f707071007e003971007e003e7400007400137379733a64617461736f757263653a6c69737474000fe58aa8e68081e695b0e68daee6ba907371007e004e0000000570707074000e7379732f64617461736f757263657371007e002a0071007e0032740020343032383861623835633333353438643031356333336364633561363030663371007e003474000ce99984e4bbb6e4bfa1e681af7371007e002a0071007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e0039707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f707071007e003971007e003e7400007400137379733a6174746163686d656e743a6c69737474000071007e01a770707074000e7379732f6174746163686d656e747371007e002a0071007e0032740020343032383861623835613565656363363031356135656661613735643030303671007e003474000ce695b0e68daee5ad97e585b87371007e002a0071007e0032740020343032383861623835613565656363363031356135656632326164383030303171007e003474000ce7b3bbe7bb9fe8aebee7bdae707070707071007e0039707070707070707070740020343032383861623835613565656363363031356135656632326164383030303174002134303238386162383561356565636336303135613565663232616438303030312f707071007e003971007e003e74000966612d616d617a6f6e74000d7379733a646963743a6c69737474000071007e01a770707074000e7379732f646963742f67726f75707371007e002a0171007e0032740020343032383165383135633931323430363031356339313439663762383030343471007e003474000ce9809ae79fa5e585ace5918a707070707071007e003971007e003e74000d66612d74656c65766973696f6e74000074000071007e01a77070707400007371007e002a0071007e0032740020343032383861623835633965656235633031356339663632366635383030326471007e0034740009e6bc8fe69697e59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e74000074000074000071007e01a770707074001c2f6368617274732f656368617274732f63686172742f66756e6e656c7371007e002a0171007e0032740020343032383861623835626561393435323031356265616137663235613030303071007e003474000ce982aee7aeb1e8aebee7bdae707070707071007e003971007e003e74000b66612d656e76656c6f706574000074000071007e01a77070707400007371007e002a0071007e0032740020343032383165383135633534643134373031356335346461663136633030303171007e003474000ce7b3bbe7bb9fe697a5e5bf977371007e002a0071007e0032740020343032386561383135613730313431363031356137303735623466393030316671007e003474000ce7b3bbe7bb9fe79b91e68ea7707070707071007e0039707070707070707070740020343032386561383135613730313431363031356137303735623466393030316674002134303238656138313561373031343136303135613730373562346639303031662f707071007e003971007e003e74000766612d626f6f6b7400077379733a6c6f6774000ce7b3bbe7bb9fe697a5e5bf977371007e004e000000067070707400077379732f6c6f677371007e002a0171007e0032740020343032383861623835633835393363643031356338353966343739363030313671007e003474000ce79fade4bfa1e8aebee7bdae707070707071007e003971007e003e74000b66612d636f6d6d656e747374000074000071007e01e67070707400007371007e002a0071007e0032740020343032383861623835633965656235633031356339663632653732363030326571007e0034740009e4bbaae8a1a8e79b987371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e74000074000074000071007e01e670707074001b2f6368617274732f656368617274732f63686172742f67617567657371007e002a0071007e0032740020343032383861623835633965656235633031356339663633393066643030326671007e00347400074be7babfe59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e7400007400007400007371007e004e000000077070707400172f6368617274732f656368617274732f63686172742f6b7371007e002a0071007e0032740020343032383861623835633965656235633031356339663635373236333030333071007e0034740009e9a5bce78ab6e59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e74000074000074000071007e02067070707400192f6368617274732f656368617274732f63686172742f7069657371007e002a0071007e0032740020343032383861623835633965656235633031356339663635653361353030333171007e0034740009e99bb7e8bebee59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e7400007400007400007371007e004e0000000970707074001b2f6368617274732f656368617274732f63686172742f72616461727371007e002a0071007e0032740020343032383861623835633965656235633031356339663637326632653030333271007e0034740009e695a3e782b9e59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e74000074000074000071007e021f70707074001d2f6368617274732f656368617274732f63686172742f736361747465727371007e002a0171007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e003971007e003e74000c66612d6261722d63686172747400007400007371007e004e0000000a7070707400007371007e002a0071007e0032740020343032383861623835633965656235633031356339663936393434383030363471007e0034740009e585b3e7b3bbe59bbe7371007e002a0071007e0032740020343032383861623835633965656235633031356339663464316638653030303071007e003474000ce7bb9fe8aea1e68aa5e8a1a8707070707071007e0039707070707070707070740020343032383861623835633965656235633031356339663464316638653030303074002134303238386162383563396565623563303135633966346431663865303030302f707071007e003971007e003e7400007400007400007371007e004e0000000b70707074001e2f6368617274732f656368617274732f63686172742f63697263756c61727371007e002a0171007e0032740020343032383861623835633161653736633031356331623132623638613030303071007e003474000ce4bba3e7a081e6a188e4be8b707070707071007e003971007e003e74000766612d636f64657400007400007371007e004e0000000c7070707400007874005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e02507878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a3836383674006d4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b20574f57363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e333670707702000671007e025f71007e025c78',NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-22 23:25:15',NULL,'0'),
('de08e496-933c-4ea7-b193-4226cecaf598','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; rv:11.0) like Gecko','on_line','2017-07-22 16:12:31','2017-07-22 16:12:31',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002464653038653439362d393333632d346561372d623139332d3432323663656361663539387372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d695ae6fa787371007e000677080000015d695ae70978771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a383638367400494d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b207836343b2054726964656e742f372e303b2072763a31312e3029206c696b65204765636b6f70707702000671007e002071007e001d78',NULL,NULL,NULL,NULL,NULL,'0'),
('f8ee262b-db5c-4ce9-897f-d5ea6f3e8355','4028ea815a3d2a8c015a3d2f8d2a0002','admin','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1:8686','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36','on_line','2017-07-23 20:31:12','2017-07-23 20:31:12',1800000,'aced00057372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e9d1ca1b8d58c626e0300054c000673746174757374004d4c636e2f6a65657765622f6d6f64756c65732f7379732f73656375726974792f736869726f2f73657373696f6e2f6d67742f4f6e6c696e6553657373696f6e244f6e6c696e655374617475733b4c000a73797374656d486f73747400124c6a6176612f6c616e672f537472696e673b4c0009757365724167656e7471007e00024c000675736572496471007e00024c0008757365726e616d6571007e00027872002a6f72672e6170616368652e736869726f2e73657373696f6e2e6d67742e53696d706c6553657373696f6e9d1ca1b8d58c626e0300007870770200db74002466386565323632622d646235632d346365392d383937662d6435656136663365383335357372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015d6f6e1944787371007e000677080000015d6f6e194578771900000000001b7740000f303a303a303a303a303a303a303a31737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274005b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e6569732e4f6e6c696e6553657373696f6e44414f4c4153545f53594e435f44425f54494d455354414d5071007e000874004d6f72672e6170616368652e736869726f2e7375626a6563742e737570706f72742e44656661756c745375626a656374436f6e746578745f5052494e434950414c535f53455353494f4e5f4b4559737200326f72672e6170616368652e736869726f2e7375626a6563742e53696d706c655072696e636970616c436f6c6c656374696f6ea87f5825c6a3084a0300014c000f7265616c6d5072696e636970616c7374000f4c6a6176612f7574696c2f4d61703b7870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00093f4000000000000077080000000100000001740036636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d5f30737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000017372003e636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e7265616c6d2e557365725265616c6d245072696e636970616c00000000000000010200045a000b6d6f62696c654c6f67696e4c0002696471007e00024c00087265616c6e616d6571007e00024c0008757365726e616d6571007e0002787000740020343032386561383135613364326138633031356133643266386432613030303274000fe7b3bbe7bb9fe7aea1e79086e5919874000561646d696e78780077010171007e00117878787e72004b636e2e6a65657765622e6d6f64756c65732e7379732e73656375726974792e736869726f2e73657373696f6e2e6d67742e4f6e6c696e6553657373696f6e244f6e6c696e6553746174757300000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400076f6e5f6c696e65740014303a303a303a303a303a303a303a313a3836383674006d4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b20574f57363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e333670707702000671007e002071007e001d78','4028ea815a3d2a8c015a3d2f8d2a0002','2017-07-23 20:31:12',NULL,NULL,NULL,'0');

/*Table structure for table `sys_user_organization` */

DROP TABLE IF EXISTS `sys_user_organization`;

CREATE TABLE `sys_user_organization` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户主键',
  `organization_id` varchar(32) NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`id`),
  KEY `sys_user_role_userid` (`user_id`),
  KEY `sys_user_role_roleid` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-部门';

/*Data for the table `sys_user_organization` */

insert  into `sys_user_organization`(`id`,`user_id`,`organization_id`) values 
('0cd526292b204fcb9852902bbe6878b4','4028ea815a3d2a8c015a3d2f8d2a0002','40288ab85b6080e1015b60996d690005'),
('40281e815cfc4624015cfcc8c640000e','40288ab85cf6aab4015cf6ecea890000','40288ab85c20329e015c2037a7800003'),
('40281e815cfc4624015cfcc8c641000f','40288ab85cf6aab4015cf6ecea890000','40288ab85c20329e015c2037d2090004'),
('40281e815cfc4624015cfce005b3006e','40281e815cfc4624015cfcce3d310029','4028ea815a452f69015a45346f7b0001');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `sys_user_role_userid` (`user_id`),
  KEY `sys_user_role_roleid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
('673d17ec2b474449bcf6d585843fb4f0','4028ea815a3d2a8c015a3d2f8d2a0002','40288ab85a362150015a3675ca950006'),
('aad1e42561844ef09bfdb7f088307c45','4028ea815a3d2a8c015a3d2f8d2a0002','402880e45b5d7636015b5d8baca60000');

/*Table structure for table `task_schedule_job` */

DROP TABLE IF EXISTS `task_schedule_job`;

CREATE TABLE `task_schedule_job` (
  `id` varchar(32) NOT NULL,
  `cron_expression` varchar(255) NOT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) NOT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `task_schedule_job` */

insert  into `task_schedule_job`(`id`,`cron_expression`,`method_name`,`is_concurrent`,`description`,`update_by`,`bean_class`,`create_date`,`job_status`,`job_group`,`update_date`,`create_by`,`spring_bean`,`job_name`) values 
('40288ab85c20329e015c2042a1dd0005','0/10 * * * * ?','run','1','sdfsdfsdf','4028ea815a3d2a8c015a3d2f8d2a0002','cn.jeeweb.modules.task.task.TaskTest','2017-05-19 18:30:56','0','test','2017-05-19 18:31:07',NULL,'','test'),
('40288ab85c20329e015c2042a1dd0004','0 7 15 * * ?','run','1','','4028ea815a3d2a8c015a3d2f8d2a0002','cn.jeeweb.modules.task.task.CourseTask','2018-05-07 11:14:48','1','teach_go',NULL,NULL,'','course_plan');

/*Table structure for table `test_order_customer` */

DROP TABLE IF EXISTS `test_order_customer`;

CREATE TABLE `test_order_customer` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `order_id` varchar(32) DEFAULT NULL COMMENT 'order_id',
  `name` varchar(50) NOT NULL COMMENT '客户姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `phone` varchar(11) NOT NULL COMMENT '电话',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';

/*Data for the table `test_order_customer` */

/*Table structure for table `test_order_main` */

DROP TABLE IF EXISTS `test_order_main`;

CREATE TABLE `test_order_main` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `orderno` varchar(50) NOT NULL COMMENT '订单号',
  `money` varchar(22) NOT NULL COMMENT '订单金额',
  `orderdate` varchar(19) NOT NULL COMMENT '订单日期',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';

/*Data for the table `test_order_main` */

insert  into `test_order_main`(`id`,`orderno`,`money`,`orderdate`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`remarks`) values 
('2fe7d6b5f28e4b8dbe2797ab0186a491','第三方','10','2017-07-22 00:00:00',NULL,NULL,NULL,NULL,'0',NULL);

/*Table structure for table `test_order_ticket` */

DROP TABLE IF EXISTS `test_order_ticket`;

CREATE TABLE `test_order_ticket` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `fltno` varchar(50) NOT NULL COMMENT '航班号',
  `flytime` date NOT NULL COMMENT '航班时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `order_id` varchar(32) DEFAULT NULL COMMENT 'order_id',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` varchar(19) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机票信息';

/*Data for the table `test_order_ticket` */

insert  into `test_order_ticket`(`id`,`fltno`,`flytime`,`remarks`,`order_id`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`) values 
('4816fa9183fe4df6b2a78eeacb6da748','11','2017-07-27',NULL,'2fe7d6b5f28e4b8dbe2797ab0186a491',NULL,NULL,NULL,NULL,'0');

/*Table structure for table `test_single_table` */

DROP TABLE IF EXISTS `test_single_table`;

CREATE TABLE `test_single_table` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `testdate` date NOT NULL COMMENT '时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单表测试';

/*Data for the table `test_single_table` */

insert  into `test_single_table`(`id`,`name`,`testdate`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`remarks`) values 
('7d009e51b10647f2b05a2b3e605ea72e','sdsfsdsf','2017-07-04',NULL,NULL,NULL,NULL,'0','&amp;lt;p&amp;gt;sfsd sdf&amp;lt;/p&amp;gt;');

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父节点',
  `parent_ids` varchar(1000) DEFAULT NULL COMMENT '父节点路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数';

/*Data for the table `test_tree` */

/*Table structure for table `tg_cfg_time` */

DROP TABLE IF EXISTS `tg_cfg_time`;

CREATE TABLE `tg_cfg_time` (
  `id` varchar(255) NOT NULL,
  `week_info` int(1) DEFAULT NULL,
  `start_time` varchar(16) DEFAULT NULL,
  `end_time` varchar(16) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_cfg_time` */

/*Table structure for table `tg_course` */

DROP TABLE IF EXISTS `tg_course`;

CREATE TABLE `tg_course` (
  `id` varchar(32) NOT NULL,
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `start_time` varchar(16) DEFAULT NULL,
  `end_time` varchar(16) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `week_info` smallint(16) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`index`),
  KEY `index` (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tg_course` */

insert  into `tg_course`(`id`,`index`,`description`,`start_time`,`end_time`,`duration`,`status`,`week_info`,`create_date`,`create_by`,`remarks`,`update_by`,`update_date`,`del_flag`) values 
('24bbfed5052f424cabcf29454c0c3d78',1,NULL,'10:00','10:30',30,'NORMAL',2,'2018-05-07 15:56:09','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,'2018-05-15 14:15:07','0'),
('2a3a5e8b1d59474e83db51cfd3d40f07',2,NULL,'8:00','9:00',60,'NORMAL',6,'2018-05-07 15:56:17','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,'2018-05-15 14:34:07','0'),
('56ee7340a81943d38149b205062e27ed',3,NULL,'8:00','8:20',20,'NORMAL',1,'2018-05-04 10:54:40','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,'2018-05-15 14:15:21','0'),
('5e2849df42314213b8e605b8d9737391',4,NULL,'9:00','9:30',30,'NORMAL',3,'2018-05-07 15:55:44','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,NULL,'0'),
('7114bbbb33974613bbe724bd2212a3ed',5,NULL,'8:00','9:10',70,'NORMAL',1,'2018-05-07 15:55:35','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,'2018-05-15 14:28:58','0'),
('84353134bcf749f8b6dcdc29a732cc55',6,NULL,'8:00','8:30',30,'NORMAL',6,'2018-05-07 15:56:27','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,NULL,'0'),
('9192affc51d94aed8ccba3264249aa44',8,NULL,'8:00','9:00',60,'NORMAL',7,'2018-05-15 16:06:17','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,NULL,'0'),
('92222ed9017b4068bd7eb57a704d1676',7,NULL,'8:00','8:30',30,'NORMAL',4,'2018-05-07 15:55:54','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,NULL,'2018-05-15 14:28:55','0');

/*Table structure for table `tg_course_record` */

DROP TABLE IF EXISTS `tg_course_record`;

CREATE TABLE `tg_course_record` (
  `id` varchar(32) NOT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `course_start_date` datetime DEFAULT NULL,
  `course_end_date` datetime DEFAULT NULL,
  `student_quantity_plan` int(11) DEFAULT NULL,
  `student_quantity_actual` int(11) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `have_adjust` varchar(16) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `del_flag` varchar(8) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`,`course_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_course_record` */

insert  into `tg_course_record`(`id`,`course_id`,`teacher_id`,`course_start_date`,`course_end_date`,`student_quantity_plan`,`student_quantity_actual`,`status`,`have_adjust`,`create_by`,`create_date`,`update_by`,`remarks`,`del_flag`,`update_date`) values 
('8dc11bd6b9a34ca999ad5a2a210dffd8','2a3a5e8b1d59474e83db51cfd3d40f07','f895dad333c54c789d365a5726c8789e','2018-05-19 08:00:00','2018-05-19 09:00:00',1,0,'FINISHED','NO','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 17:19:47','4028ea815a3d2a8c015a3d2f8d2a0002',NULL,'0','2018-05-21 11:37:44');

/*Table structure for table `tg_course_student_record` */

DROP TABLE IF EXISTS `tg_course_student_record`;

CREATE TABLE `tg_course_student_record` (
  `id` varchar(32) NOT NULL,
  `course_rec_id` varchar(32) DEFAULT NULL,
  `student_id` varchar(32) DEFAULT NULL,
  `student_real_name` varchar(32) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `have_adjust` varchar(16) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `del_flag` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_course_student_record` */

insert  into `tg_course_student_record`(`id`,`course_rec_id`,`student_id`,`student_real_name`,`status`,`have_adjust`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('e244a8be59044281af650a4bb1b61d76','8dc11bd6b9a34ca999ad5a2a210dffd8','40288ab85ce3c20a015ce3ca6df60000','赵小二','NORMAL',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 17:19:47',NULL,NULL,NULL,'0');

/*Table structure for table `tg_school` */

DROP TABLE IF EXISTS `tg_school`;

CREATE TABLE `tg_school` (
  `id` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_school` */

insert  into `tg_school`(`id`,`name`,`address`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('732298b5bd9a41a6a203150132dc6f1b','东港小学','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:23:25',NULL,NULL,NULL,'0'),
('9aada45514904a718c6062b1279ebd89','普陀小学','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 14:13:51','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 09:32:44',NULL,'0'),
('9c7eec325c0f4e37a3f5bb300efebff5','沈家门小学','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 14:12:47',NULL,NULL,NULL,'0'),
('9dadf4cb98e64588bf7cc8385d0a4b6b','沈家门第一小学','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 11:03:37',NULL,NULL,NULL,'0'),
('ed5a8ca93c77409aa111a4a14224679a','新城幼儿园','','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 14:14:15',NULL,NULL,NULL,'0');

/*Table structure for table `tg_student` */

DROP TABLE IF EXISTS `tg_student`;

CREATE TABLE `tg_student` (
  `id` varchar(255) NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` varchar(64) DEFAULT NULL,
  `school_id` varchar(255) DEFAULT NULL,
  `study_school_id` varchar(255) DEFAULT NULL,
  `study_class_id` varchar(255) DEFAULT NULL,
  `id_card` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `status` smallint(16) DEFAULT NULL,
  `total_course` int(11) DEFAULT NULL,
  `remain_course` int(11) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_student` */

insert  into `tg_student`(`id`,`real_name`,`sex`,`birthday`,`school_id`,`study_school_id`,`study_class_id`,`id_card`,`level`,`phone`,`status`,`total_course`,`remain_course`,`create_by`,`create_date`,`remarks`,`update_by`,`update_date`,`del_flag`) values 
('63a89e422a314a1da9f5c32cd9d135da','林睿泽','1','2013.11.03','732298b5bd9a41a6a203150132dc6f1b','37821881c70e43ff97370d26c018cf8e','e15e02b16994416fb7387837d0ad1060','',0,'13868248467',1,0,0,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:40:21',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 16:22:19','0'),
('8c621754d8a342dcbadf141f8f8ca5e7','马誉宸','1','2008.10.07','732298b5bd9a41a6a203150132dc6f1b','37821881c70e43ff97370d26c018cf8e','e15e02b16994416fb7387837d0ad1060','330903200810070010',15,'13735029991',1,0,0,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:05:34',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:09:42','0'),
('abff8a2774e3437d89de20adad32d6db','龚博琛','1','2005.10.30','732298b5bd9a41a6a203150132dc6f1b','37821881c70e43ff97370d26c018cf8e','e15e02b16994416fb7387837d0ad1060','',12,'13362820862',1,0,0,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:29:17',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 16:22:08','0'),
('bf74d643af2340b5b998cfaa0b2f6e74','张云皓','1','2007.03.21','732298b5bd9a41a6a203150132dc6f1b','37821881c70e43ff97370d26c018cf8e','e15e02b16994416fb7387837d0ad1060','330903200703210217',15,'13567650717',1,0,0,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 11:29:52',NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 16:22:14','0');

/*Table structure for table `tg_student_course_rel` */

DROP TABLE IF EXISTS `tg_student_course_rel`;

CREATE TABLE `tg_student_course_rel` (
  `id` varchar(32) NOT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `student_id` varchar(32) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `del_flag` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_student_course_rel` */

insert  into `tg_student_course_rel`(`id`,`course_id`,`student_id`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('14bbb5971d994e139717fadf16d87f49','24bbfed5052f424cabcf29454c0c3d78','40288ab85ce3c20a015ce3ca6df60000','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 10:01:50',NULL,NULL,NULL,'0'),
('27b0e1222dfa4ea8aa5e59719dc8e898','5e2849df42314213b8e605b8d9737391','40288ab85ce3c20a015ce3ca6df60000','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-07 16:56:28',NULL,NULL,NULL,'0'),
('40288ab85ce3c20a015ce3ca6df60001','56ee7340a81943d38149b205062e27ed','40288ab85ce3c20a015ce3ca6df60000','NORMAL',NULL,NULL,'4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 10:01:52',NULL,'0'),
('a8a9e0cf78f441cba63482fcc44a2b4a','9192affc51d94aed8ccba3264249aa44','701eccca44f34cdc838b227a85b9dcae','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 11:29:29',NULL,NULL,NULL,'0'),
('c2e2913287d24f8a8c7c36dd1dc6722d','2a3a5e8b1d59474e83db51cfd3d40f07','40288ab85ce3c20a015ce3ca6df60000','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-18 17:19:17',NULL,NULL,NULL,'0'),
('d8741a5f39034d4d9e34584c4b201899','84353134bcf749f8b6dcdc29a732cc55','701eccca44f34cdc838b227a85b9dcae','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-21 11:29:27',NULL,NULL,NULL,'0');

/*Table structure for table `tg_study_class` */

DROP TABLE IF EXISTS `tg_study_class`;

CREATE TABLE `tg_study_class` (
  `id` varchar(255) NOT NULL,
  `subject` varchar(4) DEFAULT NULL,
  `study_school_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_study_class` */

insert  into `tg_study_class`(`id`,`subject`,`study_school_id`,`name`,`teacher_id`,`level`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('e15e02b16994416fb7387837d0ad1060','wq','37821881c70e43ff97370d26c018cf8e','碧海_张老师_进阶班','74ed58b5737e46fa9893201d61093b38',0,'NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 16:01:06',NULL,NULL,'','0');

/*Table structure for table `tg_study_classroom` */

DROP TABLE IF EXISTS `tg_study_classroom`;

CREATE TABLE `tg_study_classroom` (
  `id` varchar(255) NOT NULL,
  `study_school_id` varchar(255) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_study_classroom` */

/*Table structure for table `tg_study_school` */

DROP TABLE IF EXISTS `tg_study_school`;

CREATE TABLE `tg_study_school` (
  `id` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `manager_phone` varchar(16) DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_study_school` */

insert  into `tg_study_school`(`id`,`name`,`address`,`manager`,`manager_phone`,`tel`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('37821881c70e43ff97370d26c018cf8e','碧海','碧海莲缘城市里6幢104室',NULL,NULL,NULL,'NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 15:15:17',NULL,NULL,'','0'),
('ab3ed44a20a64fc8bae61402728919da','灵秀','灵秀街',NULL,NULL,NULL,'NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 15:15:43',NULL,NULL,'','0');

/*Table structure for table `tg_teacher` */

DROP TABLE IF EXISTS `tg_teacher`;

CREATE TABLE `tg_teacher` (
  `id` varchar(32) NOT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(64) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_teacher` */

insert  into `tg_teacher`(`id`,`real_name`,`phone`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`salt`) values 
('09294f7b2b1f4f3098dca4e1bb8ca546','蒋老师','18861530001','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:29:41','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 17:15:45',NULL,'0',NULL),
('58f63cc6c9a444a7a39d1e46ead678ca','周老师','18861530002','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:29:52',NULL,NULL,NULL,'0',NULL),
('74ed58b5737e46fa9893201d61093b38','张老师','18861530003','NORMAL','4028ea815a3d2a8c015a3d2f8d2a0002','2018-05-22 10:30:12',NULL,NULL,NULL,'0',NULL);

/*Table structure for table `tg_teacher_course_rel` */

DROP TABLE IF EXISTS `tg_teacher_course_rel`;

CREATE TABLE `tg_teacher_course_rel` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tg_teacher_course_rel` */

insert  into `tg_teacher_course_rel`(`id`,`teacher_id`,`course_id`,`create_date`) values 
('1851446820904b2ba88ed4fe1e034627','f895dad333c54c789d365a5726c8789e','2a3a5e8b1d59474e83db51cfd3d40f07','2018-05-15 14:34:07'),
('22b114c0f04c4e6992d9fc444862e277','f895dad333c54c789d365a5726c8789e','56ee7340a81943d38149b205062e27ed','2018-05-15 14:15:21'),
('f54484e4d4874d71b2881b7c2e571d87','f895dad333c54c789d365a5726c8789e','24bbfed5052f424cabcf29454c0c3d78','2018-05-15 14:15:07');

/* Trigger structure for table `sys_user_online` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_sys_user_off_online` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trigger_sys_user_off_online` AFTER DELETE ON `sys_user_online` FOR EACH ROW begin
   if OLD.`user_id` is not null then
      if not exists(select `user_id` from `sys_user_last_online` where `user_id` = OLD.`user_id`) then
        insert into `sys_user_last_online`
                  (`user_id`, `username`, `uid`, `host`, `user_agent`, `system_host`,
                   `last_login_timestamp`, `last_stop_timestamp`, `login_count`, `total_online_time`)
                values
                   (OLD.`user_id`,OLD.`username`, OLD.`id`, OLD.`host`, OLD.`user_agent`, OLD.`system_host`,
                    OLD.`start_timestsamp`, OLD.`last_access_time`,
                    1, (OLD.`last_access_time` - OLD.`start_timestsamp`));
      else
        update `sys_user_last_online`
          set `username` = OLD.`username`, `uid` = OLD.`id`, `host` = OLD.`host`, `user_agent` = OLD.`user_agent`,
            `system_host` = OLD.`system_host`, `last_login_timestamp` = OLD.`start_timestsamp`,
             `last_stop_timestamp` = OLD.`last_access_time`, `login_count` = `login_count` + 1,
             `total_online_time` = `total_online_time` + (OLD.`last_access_time` - OLD.`start_timestsamp`)
        where `user_id` = OLD.`user_id`;
      end if ;
   end if;
end */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
