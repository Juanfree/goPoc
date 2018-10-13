CREATE DATABASE IF NOT EXISTS `tblox_setup`;

USE `tblox_setup`;

CREATE TABLE IF NOT EXISTS `blox` (
  `bloxID` int(11) NOT NULL AUTO_INCREMENT,
  `bloxName` text   NOT NULL,
  `blox_type` enum('BLOX','SLA','APP','INTERNAL_APP')   NOT NULL DEFAULT 'BLOX',
  `install_version_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bloxID`),
  UNIQUE KEY `bloxID` (`bloxID`),
  KEY `bloxID_2` (`bloxID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `blox_versions_default` (
  `blox_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`blox_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `cockpit_notices` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_name` char(100)   NOT NULL,
  `notice_start` int(11) NOT NULL,
  `notice_end` int(11) NOT NULL,
  `notice_user_id` int(11) NOT NULL,
  `notice_created` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `start` (`notice_start`),
  KEY `end` (`notice_end`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `cockpit_notices_text` (
  `notice_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `notice_text` text   NOT NULL,
  PRIMARY KEY (`notice_text_id`),
  UNIQUE KEY `notice_id` (`notice_id`,`language_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `companies` (
  `companyID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyName` text   NOT NULL,
  `companyShortName` varchar(30)   NOT NULL DEFAULT 'default',
  `layout_id` int(11) DEFAULT NULL,
  `databaseName` text   NOT NULL,
  `address` text   NOT NULL,
  `zip` text   NOT NULL,
  `city` text   NOT NULL,
  `state` text   NOT NULL,
  `country` text   NOT NULL,
  `contactname` text   NOT NULL,
  `email` text   NOT NULL,
  `phone` text   NOT NULL,
  `fax` text   NOT NULL,
  `acceptLicense` text   NOT NULL,
  `acceptDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acceptIP` text   NOT NULL,
  `setupComplete` text   NOT NULL,
  `mailoutComplete` text   NOT NULL,
  `discountCode` text   NOT NULL,
  `credits` int(11) NOT NULL DEFAULT '0',
  `scheme_id` int(11) NOT NULL DEFAULT '1',
  `chamber_of_commerce_number` varchar(50)   DEFAULT NULL,
  `VATNR` varchar(30)   NOT NULL DEFAULT '0',
  `active` enum('TRUE','FALSE','ALWAYS')   NOT NULL DEFAULT 'TRUE',
  `password_period` enum('NEVER','MONTHLY','2_MONTHS','3_MONTHS','6_MONTHS','YEARLY')   NOT NULL DEFAULT 'NEVER',
  `rbac_ready` enum('TRUE','FALSE')   NOT NULL DEFAULT 'FALSE',
  `tblox_contact_name` text  ,
  `freshdesk_customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `company_blox` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL DEFAULT '0',
  `bloxID` int(11) NOT NULL DEFAULT '0',
  `blnActive` text   NOT NULL,
  `blnMaintenance` text   NOT NULL,
  `blnEnded` text   NOT NULL,
  `startDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endDateTrial` date NOT NULL DEFAULT '0000-00-00',
  `endDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `optionID` int(11) NOT NULL DEFAULT '0',
  `strOptionID` text  ,
  `wizard_complete` enum('TRUE','FALSE')   NOT NULL DEFAULT 'FALSE',
  `wizard_progress` tinyint(2) NOT NULL DEFAULT '0',
  `link` varchar(255)   NOT NULL DEFAULT '',
  `version_id` int(11) NOT NULL,
  `rbac_ready` enum('TRUE','FALSE')   NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`intID`),
  KEY `companyID` (`companyID`),
  KEY `bloxID` (`bloxID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `company_blox_versions` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_name` char(25)   NOT NULL,
  `version_addition` char(25)   NOT NULL,
  `version_url` char(255)   NOT NULL,
  `version_path` char(255)   DEFAULT NULL,
  `automatic_ordering_scheduler` enum('OLD','NEW')   DEFAULT NULL,
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `version_name` (`version_name`,`version_addition`),
  KEY `version` (`version_name`,`version_addition`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `company_year` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL DEFAULT '0',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `blnActive` text   NOT NULL,
  `blnViewable` text   NOT NULL,
  `blnWritable` text   NOT NULL,
  PRIMARY KEY (`intID`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `languages` (
  `languageID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` text   NOT NULL,
  `textfile` text   NOT NULL,
  PRIMARY KEY (`languageID`),
  UNIQUE KEY `languageID` (`languageID`),
  KEY `languageID_2` (`languageID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `layouts` (
  `layout_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `layout_name` varchar(50)   DEFAULT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `options` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `bloxID` int(11) NOT NULL DEFAULT '0',
  `optionID` int(11) NOT NULL DEFAULT '0',
  `strOption` text   NOT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB     AUTO_INCREMENT=45 ;

CREATE TABLE IF NOT EXISTS `password_recovery` (
  `recoverid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `recoverkey` char(32)   NOT NULL DEFAULT '',
  PRIMARY KEY (`recoverid`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blox_id` int(10) unsigned NOT NULL DEFAULT '0',
  `preference_name` varchar(125)   NOT NULL,
  `preference_process_id` int(10) unsigned NOT NULL DEFAULT '0',
  `preference_type_id` int(10) unsigned NOT NULL,
  `preference_layer` enum('company','user','all')   NOT NULL DEFAULT 'all',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  UNIQUE KEY `uniqueCombination` (`blox_id`,`preference_name`,`preference_process_id`),
  KEY `blox_id` (`blox_id`),
  KEY `preference_process_id` (`preference_process_id`),
  KEY `preference_type_id` (`preference_type_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_preference_entities` (
  `preference_entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_entity_name` varchar(50)   NOT NULL,
  `blox_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`preference_entity_id`),
  UNIQUE KEY `blox_entity` (`preference_entity_name`,`blox_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_preference_processes` (
  `preference_process_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blox_id` int(10) unsigned NOT NULL DEFAULT '0',
  `preference_process_name` varchar(100)   NOT NULL,
  `preference_entity_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_process_id`),
  UNIQUE KEY `blox_id` (`blox_id`,`preference_process_name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_preference_types` (
  `preference_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_type_name` char(25)   NOT NULL,
  PRIMARY KEY (`preference_type_id`),
  UNIQUE KEY `preference_type_name` (`preference_type_name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pref_preference_values` (
  `preference_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_id` int(10) unsigned NOT NULL,
  `sort_id` int(10) unsigned NOT NULL,
  `preference_value` varchar(100)   NOT NULL,
  `current` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`preference_value_id`),
  UNIQUE KEY `preference_sort` (`preference_id`,`sort_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `private_label_company_data` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `data_id` int(11) NOT NULL DEFAULT '0',
  `edit_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`,`data_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `private_label_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_description` varchar(100)   NOT NULL DEFAULT '',
  `data_type` enum('promotion','contact','news')   NOT NULL DEFAULT 'promotion',
  `data_text` text   NOT NULL,
  PRIMARY KEY (`data_id`),
  UNIQUE KEY `data_description` (`data_description`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `shared_keys` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `portal` varchar(50)   NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL,
  `shared_key` varchar(255)   NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL DEFAULT '0',
  `languageID` int(11) NOT NULL DEFAULT '0',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `userName` text   NOT NULL,
  `kplID` int(11) NOT NULL DEFAULT '0',
  `fteID` decimal(6,3) NOT NULL DEFAULT '0.000',
  `statusInOut` int(11) NOT NULL DEFAULT '0',
  `dateIn` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateOut` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `functionName` text   NOT NULL,
  `login` text   NOT NULL,
  `password` text   NOT NULL,
  `passwordText` text   NOT NULL,
  `mail` text   NOT NULL,
  `editLast` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(11) NOT NULL DEFAULT '0',
  `blnComplete` text   NOT NULL,
  `extID` text   NOT NULL,
  `sofinr` char(50)   NOT NULL DEFAULT '0',
  `roleID` int(11) unsigned NOT NULL DEFAULT '0',
  `password_lastchange` int(11) unsigned NOT NULL DEFAULT '0',
  `last_passwords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `wrong_passwords` int(11) NOT NULL DEFAULT '0',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `is_support_account` enum('TRUE','FALSE')   NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  KEY `userID_2` (`userID`),
  KEY `companyID` (`companyID`),
  KEY `login` (`login`(10))
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `user_auth` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `bloxID` int(11) NOT NULL DEFAULT '0',
  `authID` int(11) unsigned NOT NULL DEFAULT '0',
  `strAuth` text   NOT NULL,
  PRIMARY KEY (`intID`),
  KEY `userID` (`userID`),
  KEY `bloxID` (`bloxID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `visits` (
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipadres` text   NOT NULL,
  `aantal` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `visits_users` (
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipadres` char(100)   NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT '0',
  `bloxID` int(11) NOT NULL DEFAULT '0',
  `aantal` int(11) NOT NULL DEFAULT '0',
  KEY `time_user_ip` (`time`,`userID`,`ipadres`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `years` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `blnActive` text   NOT NULL,
  PRIMARY KEY (`yearID`)
) ENGINE=InnoDB;