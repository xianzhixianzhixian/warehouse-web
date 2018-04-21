CREATE DATABASE warehouse CHARACTER SET utf8;
USE warehouse;

#人员表
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `character` int(4) NOT NULL DEFAULT '3' COMMENT '权限，1是超级管理员，2是普通管理员，3是普通用户',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';


#物资信息表
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `num` varchar(255) NOT NULL DEFAULT '' COMMENT '物资编号',
  `name` varchar(100) NOT NULL COMMENT '物资名称',
  `extends_parts` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展配件',
  `price` double NOT NULL DEFAULT '0' COMMENT '商品的单价',
  `remark` varchar(255) NOT NULL COMMENT '物资备注',
  `operator` varchar(70) NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建日期',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新记录的日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物资信息表';

#仓储表
CREATE TABLE `warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `responser` varchar(50) NOT NULL DEFAULT '' COMMENT '仓库负责人',
  `responser_phone` varchar(70) NOT NULL DEFAULT '' COMMENT '仓库负责人联系方式',
  `company` varchar(150) NOT NULL DEFAULT '' COMMENT '仓库所属公司',
  `contract_date` datetime NOT NULL COMMENT '仓库签订合同的日期',
  `operator` varchar(70) NOT NULL DEFAULT '' COMMENT '操作人',
  `updateed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库表';

#供应商信息表
CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `num` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商编号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `receiver` varchar(50) NOT NULL COMMENT '对接人',
  `receiver_phone` varchar(70) NOT NULL DEFAULT '' COMMENT '对接人联系方式',
  `responser` varchar(50) NOT NULL COMMENT '负责人',
  `responser_phone` varchar(70) NOT NULL DEFAULT '' COMMENT '负责人联系方式',
  `operator` varchar(70) NOT NULL COMMENT '操作人',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商信息管理表';

#仓库和物资关联表
CREATE TABLE `warehouse_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_num` varchar(255) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名',
  `warehouse_num` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库编号',
  `warehouse_name` varchar(100) NOT NULL DEFAULT '' COMMENT '仓库名',
  `contain_number` bigint(20) NOT NULL DEFAULT '0' COMMENT '已存商品数量',
  `bottommost` bigint(20) NOT NULL DEFAULT '0' COMMENT '最低商品库存预警值',
  `topmost` bigint(20) NOT NULL DEFAULT '0' COMMENT '最高库存预警值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库商品关联表';

#日志表
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_name` varchar(100) NOT NULL DEFAULT '' COMMENT '操作者',
  `operator_num` varchar(255) NOT NULL DEFAULT '' COMMENT '操作者编号',
  `opreator_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operation_type` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型，增加、删除、修改',
  `operation_detail` varchar(255) NOT NULL COMMENT '操作商品细节',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';