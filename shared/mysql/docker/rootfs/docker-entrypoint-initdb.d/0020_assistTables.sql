CREATE DATABASE IF NOT EXISTS `tblox_assist`;
USE `tblox_assist`;

CREATE TABLE IF NOT EXISTS `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blox_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `actions_extra` (
  `user_action_id` int(11) NOT NULL DEFAULT '0',
  `extra_name` char(100) NOT NULL DEFAULT '',
  `extra_value` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_action_id`,`extra_name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `user_actions` (
  `user_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action_id` int(11) NOT NULL DEFAULT '0',
  `action_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_action_id`)
) ENGINE=InnoDB;