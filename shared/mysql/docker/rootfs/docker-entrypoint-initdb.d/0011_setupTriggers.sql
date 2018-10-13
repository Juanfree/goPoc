USE `tblox_setup`;

DELIMITER $$

CREATE DEFINER=`dbadmin`@`%` FUNCTION `TBLOX_REPLACE_NONWORD`(input_text TEXT) RETURNS text
    DETERMINISTIC
BEGIN DECLARE current_position INT DEFAULT 1; DECLARE current_replacement TEXT; DECLARE delimiter_text VARCHAR(10); DECLARE output_text TEXT; DECLARE replacement_chars_fixed VARCHAR(100); SET delimiter_text = '__'; SET output_text = input_text; SET replacement_chars_fixed = '!#$%&(),-./:;<=>?@[\]^`{|}~'; WHILE current_position > 0 AND current_position <= CHAR_LENGTH(replacement_chars_fixed) DO SET current_replacement = SUBSTRING(replacement_chars_fixed, current_position, 1); IF CHAR_LENGTH(current_replacement) > 0 THEN SET output_text = REPLACE(output_text, current_replacement, CONCAT(delimiter_text, HEX(current_replacement), delimiter_text)); END IF; SET current_position = current_position + 1; END WHILE; RETURN output_text; END$$

DELIMITER ;