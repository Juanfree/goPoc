CREATE DATABASE IF NOT EXISTS `tblox_invoice_processing`;
USE `tblox_invoice_processing`;

CREATE TABLE IF NOT EXISTS `uploaded_invoice_scan_batches` (
  `uploaded_invoice_scan_batch_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `company_id` int(1) unsigned NOT NULL,
  `environment` varchar(50) NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('INCREASE_PROCESS_COUNT','FINISH_UPLOADING','START_UPLOADING','UPDATE_STATUS') NOT NULL,
  `source` enum('E-MAIL','INVOICE_PROCESSING_DAEMON','INVOICE_SHARING','STEP_1','SYSTEM') NOT NULL,
  `status` enum('CORRESPONDING_BATCH_NOT_FOUND','FAILED','FILE_NOT_FOUND','PROCESSED','UPLOADED','UPLOADING') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `process_count` int(1) unsigned NOT NULL DEFAULT '0',
  `auto_generated_pdf` tinyint(1) unsigned NOT NULL,
  `auto_process_step_1` tinyint(1) unsigned NOT NULL,
  `electronic_invoice_scan_batch` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`uploaded_invoice_scan_batch_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `uploaded_invoice_scan_batches_log` (
  `uploaded_invoice_scan_batch_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_invoice_scan_batch_id` int(11) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `environment` varchar(50) NOT NULL,
  `date` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_action` enum('INCREASE_PROCESS_COUNT','FINISH_UPLOADING','START_UPLOADING','UPDATE_STATUS') NOT NULL,
  `source` enum('E-MAIL','INVOICE_PROCESSING_DAEMON','INVOICE_SHARING','STEP_1','SYSTEM') NOT NULL,
  `status` enum('CORRESPONDING_BATCH_NOT_FOUND','FAILED','FILE_NOT_FOUND','PROCESSED','UPLOADED','UPLOADING') NOT NULL,
  `revision_id` int(11) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `process_count` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_generated_pdf` tinyint(1) unsigned NOT NULL,
  `auto_process_step_1` tinyint(1) unsigned NOT NULL,
  `electronic_invoice_scan_batch` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`uploaded_invoice_scan_batch_log_id`)
) ENGINE=InnoDB;