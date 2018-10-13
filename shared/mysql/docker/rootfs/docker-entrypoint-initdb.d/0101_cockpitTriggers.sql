USE `tblox_client_000001`;

DELIMITER //
CREATE TRIGGER `afterInsertCompanyPreferences` AFTER INSERT ON `pref_company_preferences`
 FOR EACH ROW BEGIN INSERT INTO pref_company_preferences_log (company_preference_id, preference_id, preference_value, edit_by, edit_date) VALUES (NEW.company_preference_id, NEW.preference_id, NEW.preference_value, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateCompanyPreferences`;
DELIMITER //
CREATE TRIGGER `afterUpdateCompanyPreferences` AFTER UPDATE ON `pref_company_preferences`
 FOR EACH ROW BEGIN INSERT INTO pref_company_preferences_log (company_preference_id, preference_id, preference_value, edit_by, edit_date) VALUES (NEW.company_preference_id, NEW.preference_id, NEW.preference_value, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `afterInsertUserPreferences` AFTER INSERT ON `pref_user_preferences`
 FOR EACH ROW BEGIN INSERT INTO pref_user_preferences_log (user_preference_id, user_id, preference_id, preference_value, edit_by, edit_date) VALUES (NEW.user_preference_id, NEW.user_id, NEW.preference_id, NEW.preference_value, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateUserPreferences`;
DELIMITER //
CREATE TRIGGER `afterUpdateUserPreferences` AFTER UPDATE ON `pref_user_preferences`
 FOR EACH ROW BEGIN INSERT INTO pref_user_preferences_log (user_preference_id, user_id, preference_id, preference_value, edit_by, edit_date) VALUES (NEW.user_preference_id, NEW.user_id, NEW.preference_id, NEW.preference_value, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;