CREATE DATABASE IF NOT EXISTS `tblox_client_000001`;
USE tblox_client_000001;

CREATE TABLE IF NOT EXISTS `bankaccounts` (
  `bankaccount_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `bankaccount_type` varchar(20) NOT NULL,
  `bankaccount_name` char(100) DEFAULT NULL,
  `bankaccount_nr` char(60) DEFAULT NULL,
  `bankaccount_swift` char(20) DEFAULT NULL,
  `bankaccount_iban` char(60) DEFAULT NULL,
  `bankaccount_addressed_to` char(100) DEFAULT NULL,
  `bankaccount_city` char(100) DEFAULT NULL,
  `bankaccount_country` char(5) DEFAULT NULL,
  `bankaccount_comment` char(255) DEFAULT NULL,
  `bankaccount_default` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `bankaccount_cc_number` varchar(20) DEFAULT NULL,
  `bankaccount_cc_number_iv` varchar(32) DEFAULT NULL,
  `bankaccount_cc_type` varchar(20) DEFAULT NULL,
  `bankaccount_cc_exp_date` varchar(20) DEFAULT NULL,
  `bankaccount_cc_exp_date_iv` varchar(32) DEFAULT NULL,
  `bankaccount_cc_cardholder` varchar(255) DEFAULT NULL,
  `bankaccount_cc_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`bankaccount_id`),
  KEY `index_on_bankaccount_name` (`bankaccount_name`),
  KEY `index_on_bankaccount_nr` (`bankaccount_nr`),
  KEY `index_on_bankaccount_default` (`bankaccount_default`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `delegations` (
  `delegation_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `replacing_user_id` int(11) NOT NULL,
  `blox_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`delegation_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `files` (
  `fileid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `origfilename` varchar(255) NOT NULL DEFAULT '',
  `mimetype` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `userID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` char(50) NOT NULL DEFAULT '',
  `addBy` int(10) unsigned NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(10) unsigned NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `groupCode` char(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `kpl` (
  `kplID` int(10) unsigned NOT NULL DEFAULT '0',
  `kplName` char(50) NOT NULL DEFAULT '',
  `buID` int(10) unsigned NOT NULL DEFAULT '0',
  `checkID` enum('TRUE','FALSE','') NOT NULL DEFAULT 'TRUE',
  `kplCode` char(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`kplID`)
) ENGINE=InnoDB ;

CREATE TABLE IF NOT EXISTS `locks` (
  `lock_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `type_id` bigint(12) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `type` (`type`,`type_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_company_preferences` (
  `company_preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_id` int(10) unsigned NOT NULL,
  `preference_value` varchar(100) NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`company_preference_id`),
  KEY `unique_combination` (`preference_id`,`preference_value`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_company_preferences_log` (
  `company_preference_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_preference_id` int(10) unsigned NOT NULL,
  `preference_id` int(10) unsigned NOT NULL,
  `preference_value` varchar(100) NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`company_preference_log_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_user_preferences` (
  `user_preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `preference_id` int(10) unsigned NOT NULL,
  `preference_value` varchar(100) NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_preference_id`),
  KEY `unique_combination` (`user_id`,`preference_id`,`preference_value`),
  KEY `preference_id` (`preference_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_user_preferences_log` (
  `user_preference_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_preference_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `preference_id` int(10) unsigned NOT NULL,
  `preference_value` varchar(100) NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_preference_log_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `projects` (
  `projectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectName` char(50) NOT NULL,
  `addBy` int(10) unsigned NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(10) unsigned NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blnWbso` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `description` text NOT NULL,
  `beginDate` int(10) unsigned NOT NULL DEFAULT '0',
  `endDate` int(10) unsigned NOT NULL DEFAULT '0',
  `projectCode` char(25) NOT NULL DEFAULT '',
  `scope` text NOT NULL,
  `risks` text NOT NULL,
  `status` enum('active','cancelled','on hold') NOT NULL DEFAULT 'active',
  `archived` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectID`),
  KEY `projectCodeIndex` (`projectCode`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `project_list` (
  `listID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL DEFAULT '0',
  `subID` int(10) unsigned NOT NULL DEFAULT '0',
  `groupID` int(10) unsigned NOT NULL DEFAULT '0',
  `yearID` int(10) unsigned NOT NULL DEFAULT '0',
  `blnRemark` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnWritable` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  `blnIllness` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnHoliday` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `addBy` int(10) unsigned NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(10) unsigned NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blnPurchase` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  `blnOvertimeAdd` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnOvertimeComp` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnOvertimeUse` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnAdvAdd` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnAdvComp` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `blnAdvUse` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`listID`),
  KEY `project_year` (`projectID`,`yearID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_role_inheritance` (
  `inheritance_id` int(11) NOT NULL AUTO_INCREMENT,
  `child_role_id` int(10) unsigned NOT NULL,
  `parent_role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`inheritance_id`),
  UNIQUE KEY `child_parent` (`parent_role_id`,`child_role_id`),
  KEY `child_constraint` (`child_role_id`),
  KEY `parent_constraint` (`parent_role_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `blox_id` tinyint(3) unsigned DEFAULT NULL,
  `owner_blox_id` tinyint(3) unsigned NOT NULL,
  `transaction` varchar(50) NOT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `operation` varchar(16) NOT NULL,
  `permission` enum('GRANT','REVOKE') NOT NULL,
  PRIMARY KEY (`role_permission_id`),
  UNIQUE KEY `permission` (`role_id`,`blox_id`,`owner_blox_id`,`transaction`,`object_id`,`operation`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_transaction_cache` (
  `transaction_cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blox_id` tinyint(3) unsigned NOT NULL,
  `transaction` varchar(50) NOT NULL,
  `source` varchar(8) NOT NULL,
  `owner_blox_id` tinyint(3) unsigned DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`transaction_cache_id`),
  UNIQUE KEY `transaction` (`blox_id`,`transaction`,`source`,`owner_blox_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_transaction_cache_names` (
  `transaction_cache_name_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_cache_id` int(10) unsigned NOT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`transaction_cache_name_id`),
  UNIQUE KEY `cache_language` (`transaction_cache_id`,`language_id`),
  KEY `transaction_cache` (`transaction_cache_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_transaction_cache_operations` (
  `transaction_cache_operation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_cache_id` int(10) unsigned NOT NULL,
  `operation` varchar(16) NOT NULL,
  PRIMARY KEY (`transaction_cache_operation_id`),
  KEY `transaction` (`transaction_cache_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_transaction_cache_operation_names` (
  `transaction_cache_operation_names_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_cache_operation_id` int(10) unsigned NOT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`transaction_cache_operation_names_id`),
  KEY `operation` (`transaction_cache_operation_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blox_id` tinyint(3) unsigned DEFAULT NULL,
  `owner_blox_id` tinyint(3) unsigned NOT NULL,
  `transaction` varchar(50) NOT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `operation` varchar(16) NOT NULL,
  `permission` enum('GRANT','REVOKE') NOT NULL,
  PRIMARY KEY (`user_permission_id`),
  UNIQUE KEY `permission` (`user_id`,`blox_id`,`owner_blox_id`,`transaction`,`object_id`,`operation`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `rbac_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `blox_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `user_role` (`user_id`,`role_id`,`blox_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `restrictions_grouprestrictions` (
  `restrictiongroupid` int(10) unsigned NOT NULL DEFAULT '0',
  `dimension` enum('none','location','project','supplier','user','unpsc','costcenter','group','subgroup','template','container','category','field','document','projectlist','crmproduct','crmstatus','crmsector','crmcategory','product','internalproduct','subcategory') NOT NULL DEFAULT 'none',
  `memberid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`restrictiongroupid`,`dimension`,`memberid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `restrictions_restrictiongroups` (
  `restrictiongroupid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restrictiongroupname` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`restrictiongroupid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `restrictions_userrestrictiongroups` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `restrictiongroupid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`restrictiongroupid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `restrictions_userrestrictions` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `dimension` enum('none','location','project','supplier','user','unpsc','costcenter','group','subgroup','template','container','category','field','document','projectlist','crmproduct','crmstatus','crmsector','crmcategory','product','internalproduct','subcategory') NOT NULL DEFAULT 'none',
  `memberid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`dimension`,`memberid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `skill` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `skillName` varchar(100) NOT NULL DEFAULT '',
  `skillDescription` text,
  PRIMARY KEY (`skillID`),
  UNIQUE KEY `skillName` (`skillName`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `subs` (
  `subID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subName` char(50) NOT NULL DEFAULT '',
  `addBy` int(10) unsigned NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(10) unsigned NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subCode` char(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`subID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyID` int(10) unsigned NOT NULL DEFAULT '0',
  `languageID` int(10) unsigned NOT NULL DEFAULT '0',
  `yearID` int(10) unsigned NOT NULL DEFAULT '0',
  `userName` char(50) NOT NULL DEFAULT '',
  `kplID` int(10) unsigned NOT NULL DEFAULT '0',
  `fteID` decimal(6,3) NOT NULL DEFAULT '0.000',
  `statusInOut` int(10) unsigned NOT NULL DEFAULT '0',
  `dateIn` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateOut` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `functionName` char(50) NOT NULL,
  `login` char(100) NOT NULL,
  `password` char(50) NOT NULL,
  `passwordText` char(25) NOT NULL,
  `mail` char(100) NOT NULL,
  `editLast` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(10) unsigned NOT NULL DEFAULT '0',
  `blnComplete` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `extID` char(50) NOT NULL DEFAULT '',
  `sofinr` char(50) NOT NULL DEFAULT '',
  `roleID` int(10) unsigned NOT NULL DEFAULT '0',
  `password_lastchange` int(11) unsigned NOT NULL DEFAULT '0',
  `last_passwords` text,
  `wrong_passwords` int(11) NOT NULL DEFAULT '0',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `is_support_account` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `userskill` (
  `resourceID` int(11) NOT NULL DEFAULT '0',
  `skillID` int(11) NOT NULL DEFAULT '0',
  `skillLevel` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`resourceID`,`skillID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `vacation` (
  `vacationID` int(11) NOT NULL AUTO_INCREMENT,
  `vacationDay` bigint(20) NOT NULL DEFAULT '0',
  `vacationName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`vacationID`),
  UNIQUE KEY `vacationName` (`vacationName`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `valuta` (
  `intID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valutaID` char(3) NOT NULL DEFAULT '',
  `valutaSign` char(8) NOT NULL DEFAULT '',
  `valutaName` char(30) NOT NULL DEFAULT '',
  `exchangeRate` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `showvaluta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intID`),
  UNIQUE KEY `uniqueValutaID` (`valutaID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `years` (
  `yearID` int(10) unsigned NOT NULL DEFAULT '0',
  `blnActive` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`yearID`)
) ENGINE=InnoDB;