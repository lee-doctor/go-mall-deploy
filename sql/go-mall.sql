/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS mall DEFAULT CHARACTER SET = utf8mb4;

Use mall;

# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
    `id`          bigint unsigned     NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)        NOT NULL DEFAULT '' COMMENT '用户姓名',
    `gender`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
    `mobile`      varchar(255)        NOT NULL DEFAULT '' COMMENT '用户电话',
    `password`    varchar(255)        NOT NULL DEFAULT '' COMMENT '用户密码',
    `create_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mobile_unique` (`mobile`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product`
(
    `id`          bigint unsigned     NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)        NOT NULL DEFAULT '' COMMENT '产品名称',
    `desc`        varchar(255)        NOT NULL DEFAULT '' COMMENT '产品描述',
    `stock`       int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '产品库存',
    `amount`      int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '产品金额',
    `status`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '产品状态',
    `create_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# Dump of table pay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay`
(
    `id`          bigint unsigned     NOT NULL AUTO_INCREMENT,
    `uid`         bigint unsigned     NOT NULL DEFAULT '0' COMMENT '用户ID',
    `oid`         bigint unsigned     NOT NULL DEFAULT '0' COMMENT '订单ID',
    `amount`      int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '产品金额',
    `source`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式',
    `status`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
    `create_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_uid` (`uid`),
    KEY `idx_oid` (`oid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order`
(
    `id`          bigint unsigned     NOT NULL AUTO_INCREMENT,
    `uid`         bigint unsigned     NOT NULL DEFAULT '0' COMMENT '用户ID',
    `pid`         bigint unsigned     NOT NULL DEFAULT '0' COMMENT '产品ID',
    `amount`      int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '订单金额',
    `status`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
    `create_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp           NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_uid` (`uid`),
    KEY `idx_pid` (`pid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;