USE tblox_client_000001;

CREATE TABLE `workflow_action_next` (
  `workflow_action_id` int(10) unsigned NOT NULL,
  `action_status` tinyint(1) unsigned NOT NULL,
  `next_action_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`workflow_action_id`,`action_status`)
);

CREATE TABLE `workflow_action_parameter` (
  `workflow_action_parameter_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_action_id` int(10) unsigned NOT NULL,
  `parameter` varchar(40) NOT NULL,
  `value` text NOT NULL,
  `type` enum('action','bool','costCenter','deliveryLocation','entity','float','group','int','pct','project','subgroup','string','survey','tree','user','supplier','time','unspsc','subcategory','expenseStatus','debtor','debtorNotification','dimensionValue') NOT NULL,
  PRIMARY KEY  (`workflow_action_parameter_id`)
);

CREATE TABLE `workflow_action_position` (
  `workflow_action_id` int(10) unsigned NOT NULL,
  `x` smallint(5) unsigned NOT NULL,
  `y` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`workflow_action_id`)
);

CREATE TABLE `workflow_action_result` (
  `workflow_action_result_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_action_id` int(10) unsigned NOT NULL,
  `workflow_instance_id` int(10) unsigned NOT NULL,
  `iteration` tinyint(1) NOT NULL,
  `action_result` int(10) unsigned default NULL,
  `user_id` int(10) default NULL,
  `remark` text,
  `process_date` datetime default NULL,
  `notify` enum('TRUE','FALSE') NOT NULL,
  `result_flags` int(10) unsigned NOT NULL default '0',
  `result_link` int(10) unsigned default NULL,
  PRIMARY KEY  (`workflow_action_result_id`),
  KEY `workflow_instance_id` (`workflow_instance_id`),
  KEY `workflow_action_id` (`workflow_action_id`),
  KEY `current_result` (`workflow_instance_id`,`user_id`,`workflow_action_id`,`iteration`,`action_result`,`result_flags`),
  KEY `user_result_and_flags` (`user_id`,`action_result`,`result_flags`)
);

CREATE TABLE `workflow_action` (
  `workflow_action_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_template_id` int(10) unsigned NOT NULL,
  `action_type` varchar(255) default NULL,
  `action_class` varchar(255) NOT NULL,
  PRIMARY KEY  (`workflow_action_id`),
  KEY `workflow_template_id` (`workflow_template_id`),
  KEY `action_class` (`action_class`),
  KEY `action_id_action_class` (`workflow_action_id`,`action_class`)
);

CREATE TABLE `workflow_instance_log` (
  `workflow_instance_log_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_instance_id` int(10) unsigned NOT NULL,
  `workflow_action_id` int(10) unsigned NOT NULL,
  `action_result` tinyint(1) NOT NULL,
  `next_action_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`workflow_instance_log_id`),
  KEY `workflow_instance_id` (`workflow_instance_id`)
);

CREATE TABLE `workflow_instance_probable_path` (
  `probable_path_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_instance_id` int(10) unsigned NOT NULL,
  `workflow_action_id` int(10) unsigned NOT NULL,
  `action_result` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`probable_path_id`),
  UNIQUE KEY `instance_action` (`workflow_instance_id`,`workflow_action_id`)
);

CREATE TABLE `workflow_instance` (
  `workflow_instance_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_template_id` int(10) unsigned NOT NULL,
  `current_action_id` int(10) unsigned default NULL,
  `iteration` tinyint(1) default NULL,
  `initiator_user_id` int(10) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified` datetime default NULL,
  `foreign_id` int(10) unsigned NOT NULL,
  `completed` enum('TRUE','FALSE') NOT NULL,
  `parent_instance_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`workflow_instance_id`),
  KEY `current_action_id` (`current_action_id`),
  KEY `template_foreign` (`workflow_template_id`,`foreign_id`),
  KEY `template_instance` (`workflow_template_id`,`workflow_instance_id`),
  KEY `instance_current_action_iteration` (`workflow_instance_id`,`current_action_id`,`iteration`),
  KEY creation_template_instance(creation_date, workflow_template_id, workflow_instance_id),
  KEY `current_action_iteration` (`current_action_id`,`iteration`),
  KEY `foreign_id` (`foreign_id`)
);

CREATE TABLE `workflow_preferences` (
  `preference_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `value` varchar(16) NOT NULL,
  `type` varchar(16) NOT NULL,
  PRIMARY KEY  (`preference_id`),
  UNIQUE KEY `name` (`name`)
);

CREATE TABLE `workflow_session` (
  `workflow_session_id` int(10) unsigned NOT NULL auto_increment,
  `workflow_instance_id` int(10) unsigned NOT NULL,
  `name` varchar(16) NOT NULL,
  `key_name` varchar(16) default NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`workflow_session_id`),
  UNIQUE KEY `workflow_instance_id` (`workflow_instance_id`,`name`,`key_name`)
);

CREATE TABLE `workflow_template` (
  `workflow_template_id` int(10) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) NOT NULL,
  `workflow_type` varchar(255) NOT NULL,
  `description` text,
  `start_action_id` int(10) unsigned default NULL,
  `expiration_time` int(10) default NULL,
  `active` enum('TRUE','FALSE') NOT NULL default 'FALSE',
  PRIMARY KEY  (`workflow_template_id`),
  UNIQUE KEY `template_name` (`template_name`),
  KEY `start_action_id` (`start_action_id`),
  KEY `template_id_workflow_type` (`workflow_template_id`,`workflow_type`),
  KEY `workflow_type` (`workflow_type`)
);
