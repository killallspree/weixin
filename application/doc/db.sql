drop database if exists canyin;
Create database canyin default charset utf8 collate utf8_general_ci;
use canyin;

CREATE TABLE shop(
  `shop_id` int(11) unsigned comment '商户ID' auto_increment,
  `name` varchar(50) not null DEFAULT '' comment '店铺名称',
  `business_status` tinyint(2) not null default 1 comment '营业状态:1正常营业2暂停营业',
  `takeout_time` varchar(100) not null default '' comment '配送时间',
  `announcement` varchar(200) not null default '' comment '公告',
  `is_delete` tinyint(1) not null default 2 comment '1已删2未删',
  `create_time` int(10) not null default 0 comment '创建时间',
  `update_time` int(10) not null default 0 comment '更新时间',
  PRIMARY KEY (`shop_id`)
)ENGINE = InnoDB comment '商家';

CREATE TABLE shop_user(
  `user_id` int(11) unsigned comment '用户ID' auto_increment,
  `shop_id` int(11) unsigned not null default 0 comment '商户ID',
  `user_name` varchar(20) not null default '' comment '用户名',
  `user_pwd` char(32) not null default '' comment '密码',
  `is_delete` tinyint(1) not null default 2 comment '1已删2未删',
  `create_time` int(10) not null default 0 comment '创建时间',
  `update_time` int(10) not null default 0 comment '更新时间',
  PRIMARY KEY (`user_id`),
  KEY (`shop_id`),
  KEY (`user_name`)
)ENGINE = InnoDB comment '商家管理账号';

CREATE TABLE shop_dish_category(
  `cate_id` int(11) unsigned comment '分类ID' auto_increment,
  `name` varchar(50) not null DEFAULT '' comment '分类名称',
  `shop_id` int(11) unsigned not null DEFAULT 0 comment '商户ID',
  `rank` SMALLINT(5) not null DEFAULT 0 comment '排序,降序',
  `is_delete` tinyint(1) not null default 2 comment '1已删2未删',
  `create_time` int(10) not null default 0 comment '创建时间',
  `update_time` int(10) not null default 0 comment '更新时间',
  PRIMARY KEY (`cate_id`),
  KEY `shop_id`(`shop_id`)
)ENGINE = InnoDB comment '商家菜品分类';

CREATE TABLE shop_dish(
  `dish_id` int(11) unsigned comment '菜品ID' auto_increment,
  `cate_id` int(11) unsigned not null DEFAULT 0 comment '分类ID',
  `shop_id` int(11) unsigned not null DEFAULT 0 comment '商户ID',
  `name` varchar(50) not null DEFAULT '' comment '菜品名称',
  `icon` varchar(255) not null default '' comment '缩略图',
  `icon_original` varchar(255) not null default '' comment '原图',
  `rank` SMALLINT(5) not null DEFAULT 0 comment '排序,降序',
  `sale_num` SMALLINT(5) not null DEFAULT 0 comment '销量',
  `sale_price` SMALLINT(5) not null DEFAULT 0 comment '售价',
  `original_price` SMALLINT(5) not null DEFAULT 0 comment '原价',
  `description` varchar(500) not null default '' comment '描述',
  `is_delete` tinyint(1) not null default 2 comment '1已删2未删',
  `create_time` int(10) not null default 0 comment '创建时间',
  `update_time` int(10) not null default 0 comment '更新时间',
  PRIMARY KEY (`dish_id`),
  KEY `cate_id`(`cate_id`),
  KEY `shop_id`(`shop_id`)
)ENGINE = InnoDB comment '商家菜品';

CREATE TABLE shop_discount(
  `discount_id` int(11) unsigned comment '折扣ID' auto_increment,
  `shop_id` int(11) unsigned not null DEFAULT 0 comment '商户ID',
  `type` VARCHAR(20) not null default '' comment '优惠类型jian满减zhe折扣vip会员',
  `rule` VARCHAR(100) not NULL DEFAULT '' comment '优惠规则',
  `status` tinyint(1) not null default 2 comment '1启用2停用',
  `is_mutex` tinyint(1) not null default 1 comment '与其它优惠互斥1是2否',
  `start_time` int(10) not null default 0 comment '开始时间',
  `end_time` int(10) not null default 0 comment '结束时间',
  `create_time` int(10) not null default 0 comment '创建时间',
  `update_time` int(10) not null default 0 comment '更新时间',
  PRIMARY KEY (`discount_id`),
  KEY `shop_id`(`shop_id`)
)ENGINE = InnoDB comment '会员折扣';

CREATE TABLE user(
  `user_id` int(11) unsigned comment '用户ID' auto_increment,
  `user_name` varchar(50) not null DEFAULT '' comment '用户名',
  `nick` varchar(50) not null DEFAULT '' comment '昵称',
  `create_time` int(10) not null default 0 comment '创建时间',
  `login_time` int(10) not null default 0 comment '最后登陆时间',
  PRIMARY KEY (`user_id`),
  KEY `user_name`(`user_name`)
)ENGINE = InnoDB comment '用户';

CREATE TABLE user_vip(
  `vip_id` int(11) unsigned comment '会员ID' auto_increment,
  `user_id` int(11) unsigned not null DEFAULT 0 comment '用户ID',
  `shop_id` int(11) unsigned not null DEFAULT 0 comment '商户ID',
  `amount` int(10) unsigned not null DEFAULT 0 comment '账户金额',
  `create_time` int(10) not null default 0 comment '创建时间',
  PRIMARY KEY (`vip_id`),
  KEY `user_id`(`user_id`),
  KEY `shop_id`(`shop_id`)
)ENGINE = InnoDB comment '会员';

CREATE TABLE user_vip_follow(
  `follow_id` int(11) unsigned comment '流水ID' auto_increment,
  `vip_id` int(11) unsigned not null DEFAULT 0 comment '会员ID',
  `type` tinyint(1) not null default 2 comment '类型1充值2支出',
  `relate_id` int(11) unsigned not null DEFAULT 0 comment 'charge_id或order_id',
  `money` int(10) unsigned not null DEFAULT 0 comment '操作额度',
  `amount` int(10) unsigned not null DEFAULT 0 comment '账户金额',
  `create_time` int(10) not null default 0 comment '创建时间',
  PRIMARY KEY (`follow_id`),
  KEY `vip_id`(`vip_id`)
)ENGINE = InnoDB comment '会员流水';

CREATE TABLE user_vip_charge(
  `charge_id` int(11) unsigned comment '充值ID' auto_increment,
  `vip_id` int(11) unsigned not null DEFAULT 0 comment '会员ID',
  `money` int(10) unsigned not null DEFAULT 0 comment '充值额度',
  `pay_status` tinyint(1) not null default 2 comment '1已付2未付',
  `create_time` int(10) not null default 0 comment '创建时间',
  PRIMARY KEY (`charge_id`),
  KEY `vip_id`(`vip_id`)
)ENGINE = InnoDB comment '会员充值';

CREATE TABLE order_list(
  `order_id` int(11) unsigned comment '订单ID' auto_increment,
  `user_id` int(11) unsigned not null DEFAULT 0 comment '用户ID',
  `shop_id` int(11) unsigned not null DEFAULT 0 comment '商户ID',
  `content` VARCHAR(500) not null default '' comment '商品内容,json',
  `discount` VARCHAR(200) not null default '' comment '优惠内容,json',
  `pay_type` tinyint(1) not null default 2 comment '支付类型1在线支付2货到付款',
  `pay_status` tinyint(1) not null default 2 comment '1已付2未付',
  `pay_amount` int(10) not null default 0 comment '支付金额,付款后产生',
  `create_time` int(10) not null default 0 comment '创建时间',
  `pay_time` int(10) not null default 0 comment '支付时间',
  `cancel_time` int(10) not null default 0 comment '取消时间',
  `complete_time` int(10) not null default 0 comment '完成时间',
  PRIMARY KEY (`order_id`),
  KEY `user_id`(`user_id`),
  KEY `shop_id`(`shop_id`)
)ENGINE = InnoDB comment '订单';