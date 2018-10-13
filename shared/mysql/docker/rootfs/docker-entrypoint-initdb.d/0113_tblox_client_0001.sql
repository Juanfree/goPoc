USE `tblox_client_000001`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`dbadmin`@`%` PROCEDURE `insertIproOcrLocationsAfterInsertTbllocation`( IN locationId INT, IN locationType VARCHAR(255), IN originalExternalLocationName VARCHAR(255), IN originalDepartment VARCHAR(255), IN originalAddress VARCHAR(255), IN originalZipCode VARCHAR(255), IN originalCity VARCHAR(255), IN originalVatNumber VARCHAR(255) )
BEGIN DECLARE ocrExternalLocationName, ocrDepartment, ocrAddress, ocrZipCode, ocrCity, ocrVatNumber VARCHAR(255); SET ocrExternalLocationName = originalExternalLocationName, ocrDepartment = originalDepartment, ocrAddress = originalAddress, ocrZipCode = originalZipCode, ocrCity = originalCity, ocrVatNumber = originalVatNumber; /* Strip removable characters from all location data */ CALL stripRemovableCharactersFromGivenString(ocrExternalLocationName); CALL stripRemovableCharactersFromGivenString(ocrDepartment); CALL stripRemovableCharactersFromGivenString(ocrAddress); CALL stripRemovableCharactersFromGivenString(ocrZipCode); CALL stripRemovableCharactersFromGivenString(ocrCity); CALL stripRemovableCharactersFromGivenString(ocrVatNumber); /* Replace often misinterpreted characters in all location data */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrExternalLocationName); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrDepartment); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrZipCode); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCity); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrVatNumber); /* Convert all location data to lowercase */ SET ocrExternalLocationName = LOWER(ocrExternalLocationName), ocrDepartment = LOWER(ocrDepartment), ocrAddress = LOWER(ocrAddress), ocrZipCode = LOWER(ocrZipCode), ocrCity = LOWER(ocrCity), ocrVatNumber = LOWER(ocrVatNumber); /* Replace '6' by '8' in location name, address and city */ SET ocrExternalLocationName = REPLACE(ocrExternalLocationName, '6', '8'), ocrAddress = REPLACE(ocrAddress, '6', '8'), ocrCity = REPLACE(ocrCity, '6', '8'); /* Insert values into table 'ipro_ocr_locations' */ INSERT INTO ipro_ocr_locations ( location_id, location_type, original_external_location_name, ocr_external_location_name, original_department, ocr_department, original_address, ocr_address, original_zip_code, ocr_zip_code, original_city, ocr_city, original_vat_number, ocr_vat_number ) VALUES ( locationId, locationType, originalExternalLocationName, ocrExternalLocationName, originalDepartment, ocrDepartment, originalAddress, ocrAddress, originalZipCode, ocrZipCode, originalCity, ocrCity, originalVatNumber, ocrVatNumber ); END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `insertIproOcrPurchaseOrdersAfterInsertTblinkoop`( IN purchaseOrderId INT, IN originalPurchaseOrderNumber VARCHAR(12), IN originalCustomPoNumber VARCHAR(100), IN originalSupplierOrderNumber VARCHAR(150) )
BEGIN DECLARE ocrPurchaseOrderNumber VARCHAR(12); DECLARE ocrCustomPoNumber VARCHAR(100); DECLARE ocrSupplierOrderNumber VARCHAR(150); SET ocrPurchaseOrderNumber = originalPurchaseOrderNumber, ocrCustomPoNumber = originalCustomPoNumber, ocrSupplierOrderNumber = originalSupplierOrderNumber; /* Strip removable characters from all purchase order data */ CALL stripRemovableCharactersFromGivenString(ocrPurchaseOrderNumber); CALL stripRemovableCharactersFromGivenString(ocrCustomPoNumber); CALL stripRemovableCharactersFromGivenString(ocrSupplierOrderNumber); /* Replace often misinterpreted characters in all purchase order data */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrPurchaseOrderNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCustomPoNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrSupplierOrderNumber); /* Convert all purchase order data to lowercase */ SET ocrPurchaseOrderNumber = LOWER(ocrPurchaseOrderNumber), ocrCustomPoNumber = LOWER(ocrCustomPoNumber), ocrSupplierOrderNumber = LOWER(ocrSupplierOrderNumber); /* Insert values into table 'ipro_ocr_purchase_orders' */ INSERT INTO ipro_ocr_purchase_orders ( purchase_order_id, original_purchase_order_number, ocr_purchase_order_number, original_custom_po_number, ocr_custom_po_number, original_supplier_order_number, ocr_supplier_order_number ) VALUES ( purchaseOrderId, originalPurchaseOrderNumber, ocrPurchaseOrderNumber, originalCustomPoNumber, ocrCustomPoNumber, originalSupplierOrderNumber, ocrSupplierOrderNumber ); END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `insertIproOcrSuppliersAfterInsertTblleverancier`( IN supplierId INT, IN originalSupplierName VARCHAR(255), IN originalAddress VARCHAR(255), IN originalZipCode VARCHAR(255), IN originalCity VARCHAR(255), IN orignalPhoneNumber VARCHAR(255), IN originalFaxNumber VARCHAR(255), IN originalMobileNumber VARCHAR(255), IN originalEmailAddress VARCHAR(255), IN originalCustomerNumber VARCHAR(255), IN originalAccountNumber VARCHAR(255), IN originalIbanNumber VARCHAR(255), IN originalBicNumber VARCHAR(255), IN originalChamberOfCommerceNumber VARCHAR(255), IN originalVatNumber VARCHAR(255), IN originalGAccountNumber VARCHAR(255), IN originalGIbanNumber VARCHAR(255), IN originalGBicNumber VARCHAR(255) )
BEGIN DECLARE ocrSupplierName, ocrAddress, ocrZipCode, ocrCity, ocrPhoneNumber, ocrFaxNumber, ocrMobileNumber, ocrEmailAddress, ocrCustomerNumber, ocrAccountNumber, ocrIbanNumber, strippedIbanNumber, ocrBicNumber, ocrChamberOfCommerceNumber, ocrVatNumber, ocrGAccountNumber, ocrGIbanNumber, ocrGBicNumber VARCHAR(255); SET ocrSupplierName = originalSupplierName, ocrAddress = originalAddress, ocrZipCode = originalZipCode, ocrCity = originalCity, ocrPhoneNumber = orignalPhoneNumber, ocrFaxNumber = originalFaxNumber, ocrMobileNumber = originalMobileNumber, ocrEmailAddress = originalEmailAddress, ocrCustomerNumber = originalCustomerNumber, ocrAccountNumber = originalAccountNumber, ocrIbanNumber = originalIbanNumber, strippedIbanNumber = originalIbanNumber, ocrBicNumber = originalBicNumber, ocrChamberOfCommerceNumber = originalChamberOfCommerceNumber, ocrVatNumber = originalVatNumber, ocrGAccountNumber = originalGAccountNumber, ocrGIbanNumber = originalGIbanNumber, ocrGBicNumber = originalGBicNumber; /* Strip removable characters from all supplier data, except for phone, fax and mobile number */ CALL stripRemovableCharactersFromGivenString(ocrSupplierName); CALL stripRemovableCharactersFromGivenString(ocrAddress); CALL stripRemovableCharactersFromGivenString(ocrZipCode); CALL stripRemovableCharactersFromGivenString(ocrCity); CALL stripRemovableCharactersFromGivenString(ocrEmailAddress); CALL stripRemovableCharactersFromGivenString(ocrCustomerNumber); CALL stripRemovableCharactersFromGivenString(ocrAccountNumber); CALL stripRemovableCharactersFromGivenString(ocrIbanNumber); CALL stripRemovableCharactersFromGivenString(ocrBicNumber); CALL stripRemovableCharactersFromGivenString(ocrChamberOfCommerceNumber); CALL stripRemovableCharactersFromGivenString(ocrVatNumber); CALL stripRemovableCharactersFromGivenString(ocrGAccountNumber); CALL stripRemovableCharactersFromGivenString(ocrGIbanNumber); CALL stripRemovableCharactersFromGivenString(ocrGBicNumber); /* Replace often misinterpreted characters in all supplier data, except for phone, fax and mobile number */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrSupplierName); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrZipCode); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCity); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrEmailAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCustomerNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAccountNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrIbanNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrBicNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrChamberOfCommerceNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrVatNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGAccountNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGIbanNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGBicNumber); /* Remove non-numeric characters from phone, fax and mobile number */ CALL removeNonNumericCharactersFromGivenString(ocrPhoneNumber); CALL removeNonNumericCharactersFromGivenString(ocrFaxNumber); CALL removeNonNumericCharactersFromGivenString(ocrMobileNumber); /* Strip leading characters from phone, fax and mobile number until only the last 9 characters remain */ CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrPhoneNumber, 9); CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrFaxNumber, 9); CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrMobileNumber, 9); /* Convert all supplier data to lowercase */ SET ocrSupplierName = LOWER(ocrSupplierName), ocrAddress = LOWER(ocrAddress), ocrZipCode = LOWER(ocrZipCode), ocrCity = LOWER(ocrCity), ocrPhoneNumber = LOWER(ocrPhoneNumber), ocrFaxNumber = LOWER(ocrFaxNumber), ocrMobileNumber = LOWER(ocrMobileNumber), ocrEmailAddress = LOWER(ocrEmailAddress), ocrCustomerNumber = LOWER(ocrCustomerNumber), ocrAccountNumber = LOWER(ocrAccountNumber), ocrIbanNumber = LOWER(ocrIbanNumber), ocrBicNumber = LOWER(ocrBicNumber), ocrChamberOfCommerceNumber = LOWER(ocrChamberOfCommerceNumber), ocrVatNumber = LOWER(ocrVatNumber), ocrGAccountNumber = LOWER(ocrGAccountNumber), ocrGIbanNumber = LOWER(ocrGIbanNumber), ocrGBicNumber = LOWER(ocrGBicNumber); /* Replace '6' by '8' in supplier name, address and city */ SET ocrSupplierName = REPLACE(ocrSupplierName, '6', '8'), ocrAddress = REPLACE(ocrAddress, '6', '8'), ocrCity = REPLACE(ocrCity, '6', '8'); /** * Remove all non-alpha numeric characters from 'stripped IBAN number'. * * TO BE DISSUED: * * Please note that unlike the other fields, the 'stripped' IBAN number * is NOT used for supplier recognition in the OCR data. However, this * table seemed to be the best place to store this information for now. */ CALL removeNonAlphaNumericCharactersFromGivenString(strippedIbanNumber); /* Insert values into table 'ipro_ocr_suppliers' */ INSERT INTO ipro_ocr_suppliers ( supplier_id, original_supplier_name, ocr_supplier_name, original_address, ocr_address, original_zip_code, ocr_zip_code, original_city, ocr_city, original_phone_number, ocr_phone_number, original_fax_number, ocr_fax_number, original_mobile_number, ocr_mobile_number, original_email_address, ocr_email_address, original_customer_number, ocr_customer_number, original_account_number, ocr_account_number, original_iban_number, ocr_iban_number, stripped_iban_number, original_bic_number, ocr_bic_number, original_chamber_of_commerce_number, ocr_chamber_of_commerce_number, original_vat_number, ocr_vat_number, original_g_account_number, ocr_g_account_number, original_g_iban_number, ocr_g_iban_number, original_g_bic_number, ocr_g_bic_number ) VALUES ( supplierId, originalSupplierName, ocrSupplierName, originalAddress, ocrAddress, originalZipCode, ocrZipCode, originalCity, ocrCity, orignalPhoneNumber, ocrPhoneNumber, originalFaxNumber, ocrFaxNumber, originalMobileNumber, ocrMobileNumber, originalEmailAddress, ocrEmailAddress, originalCustomerNumber, ocrCustomerNumber, originalAccountNumber, ocrAccountNumber, originalIbanNumber, ocrIbanNumber, strippedIbanNumber, originalBicNumber, ocrBicNumber, originalChamberOfCommerceNumber, ocrChamberOfCommerceNumber, originalVatNumber, ocrVatNumber, originalGAccountNumber, ocrGAccountNumber, originalGIbanNumber, ocrGIbanNumber, originalGBicNumber, ocrGBicNumber ); END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `removeNonAlphaNumericCharactersFromGivenString`(INOUT str VARCHAR(255))
BEGIN DECLARE i INT; SET i = 1; WHILE (i <= (LENGTH(str))) DO CASE WHEN (SUBSTRING(str, i, 1) REGEXP '[[:alnum:]]') THEN SET i = i + 1; ELSE SET str = (REPLACE(str, SUBSTRING(str, i, 1), '')); END CASE; END WHILE; END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `removeNonNumericCharactersFromGivenString`(INOUT str VARCHAR(255))
BEGIN DECLARE i INT; SET i = 1; WHILE (i <= (LENGTH(str))) DO CASE WHEN ((SUBSTRING(str, i, 1) > 0) OR (SUBSTRING(str, i, 1) = '0')) THEN SET i = i + 1; ELSE SET str = (REPLACE(str, SUBSTRING(str, i, 1), '')); END CASE; END WHILE; END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `replaceOftenMisinterpretedOcrCharactersInGivenString`(INOUT str VARCHAR(255))
BEGIN SET str = REPLACE(str, 'Ò', '0'); SET str = REPLACE(str, 'Ó', '0'); SET str = REPLACE(str, 'Ô', '0'); SET str = REPLACE(str, 'Õ', '0'); SET str = REPLACE(str, 'Ö', '0'); SET str = REPLACE(str, 'ò', '0'); SET str = REPLACE(str, 'ó', '0'); SET str = REPLACE(str, 'ô', '0'); SET str = REPLACE(str, 'õ', '0'); SET str = REPLACE(str, 'ö', '0'); SET str = REPLACE(str, 'O', '0'); SET str = REPLACE(str, 'o', '0'); SET str = REPLACE(str, 'Ì', '1'); SET str = REPLACE(str, 'Í', '1'); SET str = REPLACE(str, 'Î', '1'); SET str = REPLACE(str, 'Ï', '1'); SET str = REPLACE(str, 'ì', '1'); SET str = REPLACE(str, 'í', '1'); SET str = REPLACE(str, 'î', '1'); SET str = REPLACE(str, 'ï', '1'); SET str = REPLACE(str, 'I', '1'); SET str = REPLACE(str, 'i', '1'); SET str = REPLACE(str, 'L', '1'); SET str = REPLACE(str, 'l', '1'); SET str = REPLACE(str, 'T', '1'); SET str = REPLACE(str, 't', '1'); SET str = REPLACE(str, '\'', '1'); SET str = REPLACE(str, 'Z', '2'); SET str = REPLACE(str, 'z', '2'); SET str = REPLACE(str, 'S', '5'); SET str = REPLACE(str, 's', '5'); SET str = REPLACE(str, 'b', '6'); SET str = REPLACE(str, 'B', '8'); SET str = REPLACE(str, 'À', 'a'); SET str = REPLACE(str, 'Á', 'a'); SET str = REPLACE(str, 'Â', 'a'); SET str = REPLACE(str, 'Ã', 'a'); SET str = REPLACE(str, 'Ä', 'a'); SET str = REPLACE(str, 'Å', 'a'); SET str = REPLACE(str, 'à', 'a'); SET str = REPLACE(str, 'á', 'a'); SET str = REPLACE(str, 'â', 'a'); SET str = REPLACE(str, 'ä', 'a'); SET str = REPLACE(str, 'È', 'e'); SET str = REPLACE(str, 'É', 'e'); SET str = REPLACE(str, 'Ê', 'e'); SET str = REPLACE(str, 'Ë', 'e'); SET str = REPLACE(str, 'è', 'e'); SET str = REPLACE(str, 'é', 'e'); SET str = REPLACE(str, 'ê', 'e'); SET str = REPLACE(str, 'ë', 'e'); SET str = REPLACE(str, '/', 'J'); SET str = REPLACE(str, 'Ù', 'u'); SET str = REPLACE(str, 'Ú', 'u'); SET str = REPLACE(str, 'Û', 'u'); SET str = REPLACE(str, 'Ü', 'u'); SET str = REPLACE(str, 'ù', 'u'); SET str = REPLACE(str, 'ú', 'u'); SET str = REPLACE(str, 'û', 'u'); SET str = REPLACE(str, 'ü', 'u'); END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain`(INOUT str VARCHAR(255), IN numberOfRemainingCharacters INT)
BEGIN IF (LENGTH(str) >= numberOfRemainingCharacters) THEN SET str = SUBSTRING(str, (numberOfRemainingCharacters * -1)); END IF; END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `stripRemovableCharactersFromGivenString`(INOUT str VARCHAR(255))
BEGIN SET str = REPLACE(str, '	', ''); SET str = REPLACE(str, '.', ''); SET str = REPLACE(str, ',', ''); SET str = REPLACE(str, '"', ''); SET str = REPLACE(str, ';', ''); SET str = REPLACE(str, ':', ''); SET str = REPLACE(str, '_', ''); SET str = REPLACE(str, '-', ''); SET str = REPLACE(str, '+', ''); SET str = REPLACE(str, '~', ''); SET str = REPLACE(str, '`', ''); SET str = REPLACE(str, '=', ''); SET str = REPLACE(str, '{', ''); SET str = REPLACE(str, '}', ''); SET str = REPLACE(str, '[', ''); SET str = REPLACE(str, ']', ''); SET str = REPLACE(str, '(', ''); SET str = REPLACE(str, ')', ''); SET str = REPLACE(str, '^', ''); SET str = REPLACE(str, '•', ''); SET str = REPLACE(str, ' ', ''); END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `updateIproOcrLocationsAfterUpdateTbllocation`( IN locationId INT, IN locationType VARCHAR(255), IN originalExternalLocationName VARCHAR(255), IN originalDepartment VARCHAR(255), IN originalAddress VARCHAR(255), IN originalZipCode VARCHAR(255), IN originalCity VARCHAR(255), IN originalVatNumber VARCHAR(255) )
BEGIN DECLARE ocrExternalLocationName, ocrDepartment, ocrAddress, ocrZipCode, ocrCity, ocrVatNumber VARCHAR(255); SET ocrExternalLocationName = originalExternalLocationName, ocrDepartment = originalDepartment, ocrAddress = originalAddress, ocrZipCode = originalZipCode, ocrCity = originalCity, ocrVatNumber = originalVatNumber; /* Strip removable characters from all location data */ CALL stripRemovableCharactersFromGivenString(ocrExternalLocationName); CALL stripRemovableCharactersFromGivenString(ocrDepartment); CALL stripRemovableCharactersFromGivenString(ocrAddress); CALL stripRemovableCharactersFromGivenString(ocrZipCode); CALL stripRemovableCharactersFromGivenString(ocrCity); /* Replace often misinterpreted characters in all location data */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrExternalLocationName); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrDepartment); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrZipCode); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCity); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrVatNumber); /* Convert all location data to lowercase */ SET ocrExternalLocationName = LOWER(ocrExternalLocationName), ocrDepartment = LOWER(ocrDepartment), ocrAddress = LOWER(ocrAddress), ocrZipCode = LOWER(ocrZipCode), ocrCity = LOWER(ocrCity), ocrVatNumber = LOWER(ocrVatNumber); /* Replace '6' by '8' in location name, address and city */ SET ocrExternalLocationName = REPLACE(ocrExternalLocationName, '6', '8'), ocrAddress = REPLACE(ocrAddress, '6', '8'), ocrCity = REPLACE(ocrCity, '6', '8'); /* Update values in table 'ipro_ocr_locations' */ UPDATE ipro_ocr_locations SET location_id = locationId, location_type = locationType, original_external_location_name = originalExternalLocationName, ocr_external_location_name = ocrExternalLocationName, original_department = originalDepartment, ocr_department = ocrDepartment, original_address = originalAddress, ocr_address = ocrAddress, original_zip_code = originalZipCode, ocr_zip_code = ocrZipCode, original_city = originalCity, ocr_city = ocrCity, original_vat_number = originalVatNumber, ocr_vat_number = ocrVatNumber WHERE location_id = locationId; END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `updateIproOcrPurchaseOrdersAfterUpdateTblinkoop`( IN purchaseOrderId INT, IN originalPurchaseOrderNumber VARCHAR(12), IN originalCustomPoNumber VARCHAR(100), IN originalSupplierOrderNumber VARCHAR(150) )
BEGIN DECLARE ocrPurchaseOrderNumber VARCHAR(12); DECLARE ocrCustomPoNumber VARCHAR(100); DECLARE ocrSupplierOrderNumber VARCHAR(150); SET ocrPurchaseOrderNumber = originalPurchaseOrderNumber, ocrCustomPoNumber = originalCustomPoNumber, ocrSupplierOrderNumber = originalSupplierOrderNumber; /* Strip removable characters from all purchase order data */ CALL stripRemovableCharactersFromGivenString(ocrPurchaseOrderNumber); CALL stripRemovableCharactersFromGivenString(ocrCustomPoNumber); CALL stripRemovableCharactersFromGivenString(ocrSupplierOrderNumber); /* Replace often misinterpreted characters in all purchase order data */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrPurchaseOrderNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCustomPoNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrSupplierOrderNumber); /* Convert all purchase order data to lowercase */ SET ocrPurchaseOrderNumber = LOWER(ocrPurchaseOrderNumber), ocrCustomPoNumber = LOWER(ocrCustomPoNumber), ocrSupplierOrderNumber = LOWER(ocrSupplierOrderNumber); /* Update values in table 'ipro_ocr_purchase_orders' */ UPDATE ipro_ocr_purchase_orders SET purchase_order_id = purchaseOrderId, original_purchase_order_number = originalPurchaseOrderNumber, ocr_purchase_order_number = ocrPurchaseOrderNumber, original_custom_po_number = originalCustomPoNumber, ocr_custom_po_number = ocrCustomPoNumber, original_supplier_order_number = originalSupplierOrderNumber, ocr_supplier_order_number = ocrSupplierOrderNumber WHERE purchase_order_id = purchaseOrderId; END$$

CREATE DEFINER=`dbadmin`@`%` PROCEDURE `updateIproOcrSuppliersAfterUpdateTblleverancier`( IN supplierId INT, IN originalSupplierName VARCHAR(255), IN originalAddress VARCHAR(255), IN originalZipCode VARCHAR(255), IN originalCity VARCHAR(255), IN orignalPhoneNumber VARCHAR(255), IN originalFaxNumber VARCHAR(255), IN originalMobileNumber VARCHAR(255), IN originalEmailAddress VARCHAR(255), IN originalCustomerNumber VARCHAR(255), IN originalAccountNumber VARCHAR(255), IN originalIbanNumber VARCHAR(255), IN originalBicNumber VARCHAR(255), IN originalChamberOfCommerceNumber VARCHAR(255), IN originalVatNumber VARCHAR(255), IN originalGAccountNumber VARCHAR(255), IN originalGIbanNumber VARCHAR(255), IN originalGBicNumber VARCHAR(255) )
BEGIN DECLARE ocrSupplierName, ocrAddress, ocrZipCode, ocrCity, ocrPhoneNumber, ocrFaxNumber, ocrMobileNumber, ocrEmailAddress, ocrCustomerNumber, ocrAccountNumber, ocrIbanNumber, strippedIbanNumber, ocrBicNumber, ocrChamberOfCommerceNumber, ocrVatNumber, ocrGAccountNumber, ocrGIbanNumber, ocrGBicNumber VARCHAR(255); SET ocrSupplierName = originalSupplierName, ocrAddress = originalAddress, ocrZipCode = originalZipCode, ocrCity = originalCity, ocrPhoneNumber = orignalPhoneNumber, ocrFaxNumber = originalFaxNumber, ocrMobileNumber = originalMobileNumber, ocrEmailAddress = originalEmailAddress, ocrCustomerNumber = originalCustomerNumber, ocrAccountNumber = originalAccountNumber, ocrIbanNumber = originalIbanNumber, strippedIbanNumber = originalIbanNumber, ocrBicNumber = originalBicNumber, ocrChamberOfCommerceNumber = originalChamberOfCommerceNumber, ocrVatNumber = originalVatNumber, ocrGAccountNumber = originalGAccountNumber, ocrGIbanNumber = originalGIbanNumber, ocrGBicNumber = originalGBicNumber; /* Strip removable characters from all supplier data, except for phone, fax and mobile number */ CALL stripRemovableCharactersFromGivenString(ocrSupplierName); CALL stripRemovableCharactersFromGivenString(ocrAddress); CALL stripRemovableCharactersFromGivenString(ocrZipCode); CALL stripRemovableCharactersFromGivenString(ocrCity); CALL stripRemovableCharactersFromGivenString(ocrEmailAddress); CALL stripRemovableCharactersFromGivenString(ocrCustomerNumber); CALL stripRemovableCharactersFromGivenString(ocrAccountNumber); CALL stripRemovableCharactersFromGivenString(ocrIbanNumber); CALL stripRemovableCharactersFromGivenString(ocrBicNumber); CALL stripRemovableCharactersFromGivenString(ocrChamberOfCommerceNumber); CALL stripRemovableCharactersFromGivenString(ocrVatNumber); CALL stripRemovableCharactersFromGivenString(ocrGAccountNumber); CALL stripRemovableCharactersFromGivenString(ocrGIbanNumber); CALL stripRemovableCharactersFromGivenString(ocrGBicNumber); /* Replace often misinterpreted characters in all supplier data, except for phone, fax and mobile number */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrSupplierName); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrZipCode); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCity); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrEmailAddress); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrCustomerNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrAccountNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrIbanNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrBicNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrChamberOfCommerceNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrVatNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGAccountNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGIbanNumber); CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocrGBicNumber); /* Remove non-numeric characters from phone, fax and mobile number */ CALL removeNonNumericCharactersFromGivenString(ocrPhoneNumber); CALL removeNonNumericCharactersFromGivenString(ocrFaxNumber); CALL removeNonNumericCharactersFromGivenString(ocrMobileNumber); /* Strip leading characters from phone, fax and mobile number until only the last 9 characters remain */ CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrPhoneNumber, 9); CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrFaxNumber, 9); CALL stripLeadingCharsFromGivenStringUntilGivenNumberOfCharsRemain(ocrMobileNumber, 9); /* Convert all supplier data to lowercase */ SET ocrSupplierName = LOWER(ocrSupplierName), ocrAddress = LOWER(ocrAddress), ocrZipCode = LOWER(ocrZipCode), ocrCity = LOWER(ocrCity), ocrPhoneNumber = LOWER(ocrPhoneNumber), ocrFaxNumber = LOWER(ocrFaxNumber), ocrMobileNumber = LOWER(ocrMobileNumber), ocrEmailAddress = LOWER(ocrEmailAddress), ocrCustomerNumber = LOWER(ocrCustomerNumber), ocrAccountNumber = LOWER(ocrAccountNumber), ocrIbanNumber = LOWER(ocrIbanNumber), ocrBicNumber = LOWER(ocrBicNumber), ocrChamberOfCommerceNumber = LOWER(ocrChamberOfCommerceNumber), ocrVatNumber = LOWER(ocrVatNumber), ocrGAccountNumber = LOWER(ocrGAccountNumber), ocrGIbanNumber = LOWER(ocrGIbanNumber), ocrGBicNumber = LOWER(ocrGBicNumber); /* Replace '6' by '8' in supplier name, address and city */ SET ocrSupplierName = REPLACE(ocrSupplierName, '6', '8'), ocrAddress = REPLACE(ocrAddress, '6', '8'), ocrCity = REPLACE(ocrCity, '6', '8'); /** * Remove all non-alpha numeric characters from 'stripped IBAN number'. * * TO BE DISSUED: * * Please note that unlike the other fields, the 'stripped' IBAN number * is NOT used for supplier recognition in the OCR data. However, this * table seemed to be the best place to store this information for now. */ CALL removeNonAlphaNumericCharactersFromGivenString(strippedIbanNumber); /* Update values in table 'ipro_ocr_suppliers' */ UPDATE ipro_ocr_suppliers SET supplier_id = supplierId, original_supplier_name = originalSupplierName, ocr_supplier_name = ocrSupplierName, original_address = originalAddress, ocr_address = ocrAddress, original_zip_code = originalZipCode, ocr_zip_code = ocrZipCode, original_city = originalCity, ocr_city = ocrCity, original_phone_number = orignalPhoneNumber, ocr_phone_number = ocrPhoneNumber, original_fax_number = originalFaxNumber, ocr_fax_number = ocrFaxNumber, original_mobile_number = originalMobileNumber, ocr_mobile_number = ocrMobileNumber, original_email_address = originalEmailAddress, ocr_email_address = ocrEmailAddress, original_customer_number = originalCustomerNumber, ocr_customer_number = ocrCustomerNumber, original_account_number = originalAccountNumber, ocr_account_number = ocrAccountNumber, original_iban_number = originalIbanNumber, ocr_iban_number = ocrIbanNumber, stripped_iban_number = strippedIbanNumber, original_bic_number = originalBicNumber, ocr_bic_number = ocrBicNumber, original_chamber_of_commerce_number = originalChamberOfCommerceNumber, ocr_chamber_of_commerce_number = ocrChamberOfCommerceNumber, original_vat_number = originalVatNumber, ocr_vat_number = ocrVatNumber, original_g_account_number = originalGAccountNumber, ocr_g_account_number = ocrGAccountNumber, original_g_iban_number = originalGIbanNumber, ocr_g_iban_number = ocrGIbanNumber, original_g_bic_number = originalGBicNumber, ocr_g_bic_number = ocrGBicNumber WHERE supplier_id = supplierId; END$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS `credits_transactions` (
  `transactionid` int(11) NOT NULL AUTO_INCREMENT,
  `bloxid` int(11) NOT NULL DEFAULT '0',
  `credits` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `processed_id` int(11) NOT NULL DEFAULT '0',
  `processed_nr` char(15) NOT NULL DEFAULT '',
  `false_credits` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`transactionid`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `days` (
  `dateID` date NOT NULL DEFAULT '0000-00-00',
  `dayName` char(25) NOT NULL DEFAULT '',
  `monthName` char(25) NOT NULL DEFAULT '',
  `monthID` tinyint(4) NOT NULL DEFAULT '0',
  `quarterID` int(11) NOT NULL DEFAULT '0',
  `weekID` int(11) NOT NULL DEFAULT '0',
  `yearID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB ;

CREATE TABLE IF NOT EXISTS `email_client_customization` (
  `custom_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blox_id` int(10) unsigned NOT NULL,
  `type` enum('INVOICE') DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `value_nl` text,
  `value_en` text,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

DROP TRIGGER IF EXISTS `afterInsertEmailClientCustomization`;
DELIMITER //
CREATE TRIGGER `afterInsertEmailClientCustomization` AFTER INSERT ON `email_client_customization`
 FOR EACH ROW BEGIN INSERT INTO email_client_customization_log (custom_id, blox_id, type, name, value_nl, value_en, edit_by, edit_date) VALUES (NEW.custom_id, NEW.blox_id, NEW.type, NEW.name, NEW.value_nl, NEW.value_en, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateEmailClientCustomization`;
DELIMITER //
CREATE TRIGGER `afterUpdateEmailClientCustomization` AFTER UPDATE ON `email_client_customization`
 FOR EACH ROW BEGIN INSERT INTO email_client_customization_log (custom_id, blox_id, type, name, value_nl, value_en, edit_by, edit_date) VALUES (NEW.custom_id, NEW.blox_id, NEW.type, NEW.name, NEW.value_nl, NEW.value_en, NEW.edit_by, NEW.edit_date) ; END
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `email_client_customization_log` (
  `custom_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_id` int(10) unsigned NOT NULL,
  `blox_id` int(10) unsigned NOT NULL,
  `type` enum('INVOICE') DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `value_nl` text,
  `value_en` text,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`custom_log_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `file_objects` (
  `file_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_object_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `genl_accounts` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_number` varchar(100) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `description` text,
  `account_status` enum('USABLE','HIDDEN','CLOSED') DEFAULT NULL,
  `account_type` enum('BS','PL','P','L') NOT NULL DEFAULT 'BS',
  `costcenter_relation` enum('TRUE','OPTIONAL','FALSE') NOT NULL DEFAULT 'TRUE',
  `costowner_relation` enum('TRUE','OPTIONAL','FALSE') NOT NULL DEFAULT 'FALSE',
  `project_relation` enum('TRUE','OPTIONAL','FALSE') NOT NULL DEFAULT 'FALSE',
  `filterable` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `is_asset` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `group_id` int(10) unsigned DEFAULT NULL,
  `account_check_type` varchar(50) DEFAULT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `account_number` (`account_number`),
  KEY `account_check_type` (`account_check_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `genl_accounts`
--

INSERT INTO `genl_accounts` (`account_id`, `account_number`, `account_name`, `description`, `account_status`, `account_type`, `costcenter_relation`, `costowner_relation`, `project_relation`, `filterable`, `is_asset`, `group_id`, `account_check_type`, `added_by`, `added_date`) VALUES
(1, '0001', 'General account', '', 'USABLE', 'BS', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, NULL, 2, 1504534309);

-- --------------------------------------------------------

--
-- Table structure for table `genl_account_schemes`
--

CREATE TABLE IF NOT EXISTS `genl_account_schemes` (
  `scheme_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheme_name` varchar(50) NOT NULL,
  `scheme_description` text,
  `scheme_status` enum('USABLE','HIDDEN','ARCHIVED') NOT NULL,
  `added_by` int(10) unsigned DEFAULT NULL,
  `added_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`scheme_id`),
  UNIQUE KEY `scheme_name` (`scheme_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `genl_account_schemes`
--

INSERT INTO `genl_account_schemes` (`scheme_id`, `scheme_name`, `scheme_description`, `scheme_status`, `added_by`, `added_date`) VALUES
(1, 'Default scheme', '', 'USABLE', 2, 1504534252);

-- --------------------------------------------------------

--
-- Table structure for table `genl_account_scheme_dimensions`
--

CREATE TABLE IF NOT EXISTS `genl_account_scheme_dimensions` (
  `account_scheme_dimension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_id` int(10) unsigned NOT NULL,
  `account_scheme_id` int(10) unsigned NOT NULL,
  `edit_by` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_scheme_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocations`
--

CREATE TABLE IF NOT EXISTS `genl_allocations` (
  `allocation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_number` varchar(100) NOT NULL,
  `custom_number` varchar(100) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `description` text,
  `allocation_type_id` int(10) unsigned NOT NULL,
  `allocation_method_id` int(10) unsigned NOT NULL,
  `category` enum('cost_allocation','depreciation') NOT NULL DEFAULT 'cost_allocation',
  `status` enum('to_journalize','partly_to_journalize','partly_cancelled','journalized','cancelled') NOT NULL DEFAULT 'to_journalize',
  `residual_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `interest_rate` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `reservation_account_id` int(10) unsigned DEFAULT NULL,
  `costs_account_id` int(10) unsigned DEFAULT NULL,
  `contra_account_id` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dossier_id` int(10) unsigned DEFAULT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`allocation_id`),
  KEY `allocation_number` (`allocation_number`),
  KEY `custom_number` (`custom_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_methods`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_methods` (
  `allocation_method_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_method_name` varchar(100) NOT NULL,
  `allocation_method_status` enum('USABLE','HIDDEN') DEFAULT 'USABLE',
  `description` text,
  `period_type` enum('CUSTOM','MONTH','WEEK','YEAR') DEFAULT 'MONTH',
  `periods` tinyint(3) unsigned NOT NULL,
  `divider` enum('CUSTOM','LINEAR','ANNUITY') NOT NULL DEFAULT 'LINEAR',
  `category` enum('cost_allocation','depreciation') NOT NULL DEFAULT 'cost_allocation',
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`allocation_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_objects`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_objects` (
  `allocation_object_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_id` int(10) unsigned NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`allocation_object_id`),
  KEY `allocation_id` (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_rules`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_rules` (
  `allocation_rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_id` int(10) unsigned NOT NULL,
  `transaction_date` int(10) unsigned NOT NULL,
  `numerator` tinyint(3) unsigned NOT NULL,
  `denominator` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`allocation_rule_id`),
  KEY `allocation_id` (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_schedule`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_schedule` (
  `allocation_schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_id` int(10) unsigned NOT NULL,
  `transaction_date` int(10) unsigned NOT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `interest_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` enum('pending','processed','cancelled') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`allocation_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_schedule_result`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_schedule_result` (
  `allocation_schedule_result_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_schedule_id` int(10) unsigned NOT NULL,
  `allocation_id` int(10) unsigned NOT NULL,
  `transaction_date` int(10) unsigned NOT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `interest_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` enum('to_journalize','journalized') NOT NULL DEFAULT 'to_journalize',
  PRIMARY KEY (`allocation_schedule_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_allocation_types`
--

CREATE TABLE IF NOT EXISTS `genl_allocation_types` (
  `allocation_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_type_name` varchar(100) NOT NULL,
  `description` text,
  `prefix_code` varchar(10) DEFAULT NULL,
  `reservation_account_id` int(10) unsigned NOT NULL,
  `costs_account_id` int(10) unsigned NOT NULL,
  `contra_account_id` int(10) unsigned NOT NULL,
  `category` enum('cost_allocation','depreciation') NOT NULL DEFAULT 'cost_allocation',
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`allocation_type_id`),
  KEY `reservation_account_id` (`reservation_account_id`),
  KEY `costs_account_id` (`costs_account_id`),
  KEY `contra_account_id` (`contra_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_audit_files`
--

CREATE TABLE IF NOT EXISTS `genl_audit_files` (
  `audit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(100) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` int(10) unsigned NOT NULL,
  `status` enum('PENDING','READY_FOR_DOWNLOAD','DOWNLOADED') NOT NULL DEFAULT 'PENDING',
  `number_of_lines` int(10) unsigned NOT NULL DEFAULT '0',
  `booking_year` int(10) unsigned NOT NULL DEFAULT '0',
  `year_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`audit_id`),
  UNIQUE KEY `id_year_counter` (`booking_year`,`year_count`),
  KEY `created_by` (`created_by`),
  KEY `booking_year` (`booking_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_bank_statements`
--

CREATE TABLE IF NOT EXISTS `genl_bank_statements` (
  `bank_statement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_statement_number` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'CUSTOM',
  `transaction_reference_number` varchar(5) NOT NULL,
  `related_reference_number` varchar(5) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `follow_up` int(10) unsigned DEFAULT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `bank_account_id` int(10) unsigned DEFAULT NULL,
  `start_date` int(10) unsigned NOT NULL,
  `end_date` int(10) unsigned NOT NULL,
  `available_date` int(10) unsigned NOT NULL,
  `start_debit_credit` enum('D','C') NOT NULL DEFAULT 'C',
  `end_debit_credit` enum('D','C') NOT NULL DEFAULT 'C',
  `available_debit_credit` enum('D','C') NOT NULL DEFAULT 'C',
  `start_currency_id` varchar(3) NOT NULL DEFAULT 'EUR',
  `end_currency_id` varchar(3) NOT NULL DEFAULT 'EUR',
  `available_currency_id` varchar(3) NOT NULL DEFAULT 'EUR',
  `start_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `end_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `available_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_start_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_end_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_available_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `description` text,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `modified_by` int(10) unsigned NOT NULL,
  `modified_date` int(10) unsigned NOT NULL,
  `status` enum('pending','processed','deleted') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`bank_statement_id`),
  KEY `fk_bank_account_id` (`bank_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_bank_statement_lines`
--

CREATE TABLE IF NOT EXISTS `genl_bank_statement_lines` (
  `bank_statement_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_statement_id` int(10) unsigned NOT NULL,
  `bank_statement_line_number` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT '',
  `code` varchar(255) DEFAULT NULL,
  `debit_credit` enum('D','C') NOT NULL DEFAULT 'D',
  `currency_id` varchar(3) NOT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `date` int(10) unsigned NOT NULL,
  `payment_reference` varchar(16) NOT NULL,
  `description` text,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_number` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `modified_by` int(10) unsigned NOT NULL,
  `modified_date` int(10) unsigned NOT NULL,
  `status` enum('pending','processed','deleted') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`bank_statement_line_id`),
  KEY `fk_bank_statement_id` (`bank_statement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_cleared_data`
--

CREATE TABLE IF NOT EXISTS `genl_cleared_data` (
  `clear_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`clear_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_data`
--

CREATE TABLE IF NOT EXISTS `genl_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `from_transaction_id` int(10) unsigned DEFAULT NULL,
  `transaction_layout_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `administration_code` varchar(10) DEFAULT NULL,
  `book_code` varchar(10) DEFAULT NULL,
  `book_type` varchar(10) DEFAULT NULL,
  `book_year` int(4) DEFAULT NULL,
  `book_period` int(2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `costcenter_code` varchar(50) DEFAULT NULL,
  `costowner_code` varchar(50) DEFAULT NULL,
  `project_code` varchar(50) DEFAULT NULL,
  `debitor_number` varchar(20) DEFAULT NULL,
  `creditor_number` varchar(20) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'EUR',
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `debet_credit` enum('D','C') NOT NULL DEFAULT 'D',
  `quantity` int(11) NOT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `purchaseorder_number` varchar(50) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `supplier_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_description` varchar(100) NOT NULL,
  `payment_date` int(11) NOT NULL,
  `payment_reference` varchar(50) NOT NULL,
  `export_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `purchaseorder_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `clear_id` int(10) unsigned DEFAULT NULL,
  `transaction_date` int(11) NOT NULL,
  `added_date` int(11) NOT NULL,
  `order_group` char(20) DEFAULT NULL,
  `purchaseorder_group` char(20) DEFAULT NULL,
  `invoice_group` char(20) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `fk_clear_id` (`clear_id`),
  KEY `transaction_id` (`transaction_id`,`transaction_layout_id`,`source_id`),
  KEY `book_year` (`book_year`),
  KEY `account_number` (`account_number`(10),`amount`),
  KEY `account_number_2` (`account_number`(10)),
  KEY `invoice_number` (`invoice_number`),
  KEY `invoice_id` (`invoice_id`,`invoice_line_id`),
  KEY `purchaseorder_number` (`purchaseorder_number`),
  KEY `order_number` (`order_number`),
  KEY `purchaseorder_id` (`purchaseorder_id`),
  KEY `order_id` (`order_id`),
  KEY `source_id` (`source_id`,`transaction_id`,`transaction_layout_id`),
  KEY `order_purchaseorder_invoice_group` (`order_group`,`purchaseorder_group`,`invoice_group`),
  KEY `order_group` (`order_group`,`invoice_group`),
  KEY `purchaseorder_group` (`purchaseorder_group`,`invoice_group`),
  KEY `invoice_group` (`invoice_group`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_data_account_total`
--

CREATE TABLE IF NOT EXISTS `genl_data_account_total` (
  `account_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_number` varchar(50) DEFAULT NULL,
  `genl_amount` decimal(12,4) DEFAULT NULL,
  `report_amount` decimal(12,4) DEFAULT NULL,
  `added_date` int(11) DEFAULT NULL,
  `input_amount` decimal(12,4) DEFAULT NULL,
  `input_user` int(11) DEFAULT NULL,
  `input_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_total_id`),
  KEY `account_number` (`account_number`,`added_date`,`input_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_data_dimension_values`
--

CREATE TABLE IF NOT EXISTS `genl_data_dimension_values` (
  `data_dimension_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL,
  `value1` varchar(100) NOT NULL DEFAULT '',
  `value2` varchar(100) NOT NULL DEFAULT '',
  `value3` varchar(100) NOT NULL DEFAULT '',
  `value4` varchar(100) NOT NULL DEFAULT '',
  `value5` varchar(100) NOT NULL DEFAULT '',
  `value6` varchar(100) NOT NULL DEFAULT '',
  `value7` varchar(100) NOT NULL DEFAULT '',
  `value8` varchar(100) NOT NULL DEFAULT '',
  `value9` varchar(100) NOT NULL DEFAULT '',
  `value10` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`data_dimension_value_id`),
  UNIQUE KEY `data_id` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_data_values`
--

CREATE TABLE IF NOT EXISTS `genl_data_values` (
  `data_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_source` enum('INVOICE','STOCK') DEFAULT NULL,
  `data_value` varchar(100) NOT NULL,
  PRIMARY KEY (`data_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `genl_data_values`
--

INSERT INTO `genl_data_values` (`data_value_id`, `data_source`, `data_value`) VALUES
(1, 'INVOICE', 'tbloxLastSourceId'),
(2, 'INVOICE', 'tbloxTransactionDate'),
(3, 'INVOICE', 'tbloxLineType'),
(4, 'INVOICE', 'tbloxBookYear'),
(5, 'INVOICE', 'tbloxBookPeriod'),
(6, 'INVOICE', 'tbloxDebetCredit'),
(7, 'INVOICE', 'tbloxVatPercentage'),
(8, 'INVOICE', 'tbloxInvoiceDescription'),
(9, 'INVOICE', 'tbloxDescription'),
(10, 'INVOICE', 'tbloxInvoiceNumber'),
(11, 'INVOICE', 'tbloxSupplierInvoiceNumber'),
(12, 'INVOICE', 'tbloxProductCode'),
(13, 'INVOICE', 'tbloxProductName'),
(14, 'INVOICE', 'tbloxInvoiceLineAmount'),
(15, 'INVOICE', 'tbloxInvoiceLineAmountTax'),
(16, 'INVOICE', 'tbloxInvoiceLineAmountWithTax'),
(17, 'INVOICE', 'tbloxAccountNumber'),
(18, 'INVOICE', 'tbloxCreditorName'),
(19, 'INVOICE', 'tbloxCreditorNumber'),
(20, 'INVOICE', 'tbloxCostcenterCode'),
(21, 'INVOICE', 'tbloxProjectCode'),
(22, 'INVOICE', 'tbloxCurrency'),
(23, 'INVOICE', 'tbloxBookType'),
(24, 'INVOICE', 'tbloxBookCode'),
(25, 'INVOICE', 'tbloxAdministrationCode'),
(26, 'INVOICE', 'tbloxInvoiceRemark'),
(27, 'INVOICE', 'tbloxPaymentDate'),
(28, 'INVOICE', 'tbloxOrderAndPurchaseOrderNumberAndSupplierName'),
(29, 'INVOICE', 'tbloxInvoiceNumberAndDescription'),
(30, 'INVOICE', 'tbloxPurchaseOrderNumber'),
(31, 'STOCK', 'tbloxLastSourceId'),
(32, 'STOCK', 'tbloxLocationId'),
(33, 'STOCK', 'tbloxTransactionDate'),
(34, 'STOCK', 'tbloxBookYear'),
(35, 'STOCK', 'tbloxBookPeriod'),
(36, 'STOCK', 'tbloxDescription'),
(37, 'STOCK', 'tbloxAccountNumber'),
(38, 'STOCK', 'tbloxCreditorNumber'),
(39, 'STOCK', 'tbloxCurrency'),
(40, 'STOCK', 'tbloxCostcenterCode'),
(41, 'STOCK', 'tbloxProjectCode'),
(42, 'STOCK', 'tbloxBookCode'),
(43, 'STOCK', 'tbloxBookType'),
(44, 'STOCK', 'tbloxAdministrationCode'),
(45, 'STOCK', 'tbloxPurchaseOrderNumber'),
(46, 'STOCK', 'tbloxOrderNumber'),
(47, 'STOCK', 'tbloxOrderAndPurchaseOrderNumber'),
(48, 'STOCK', 'tbloxOrderAndPurchaseOrderNumberAndSupplierName'),
(49, 'INVOICE', 'tbloxLastSourceId'),
(50, 'INVOICE', 'tbloxTransactionDate'),
(51, 'INVOICE', 'tbloxLineType'),
(52, 'INVOICE', 'tbloxBookYear'),
(53, 'INVOICE', 'tbloxBookPeriod'),
(54, 'INVOICE', 'tbloxDebetCredit'),
(55, 'INVOICE', 'tbloxVatPercentage'),
(56, 'INVOICE', 'tbloxInvoiceDescription'),
(57, 'INVOICE', 'tbloxDescription'),
(58, 'INVOICE', 'tbloxInvoiceNumber'),
(59, 'INVOICE', 'tbloxSupplierInvoiceNumber'),
(60, 'INVOICE', 'tbloxProductCode'),
(61, 'INVOICE', 'tbloxProductName'),
(62, 'INVOICE', 'tbloxInvoiceLineAmount'),
(63, 'INVOICE', 'tbloxInvoiceLineAmountTax'),
(64, 'INVOICE', 'tbloxInvoiceLineAmountWithTax'),
(65, 'INVOICE', 'tbloxAccountNumber'),
(66, 'INVOICE', 'tbloxCreditorName'),
(67, 'INVOICE', 'tbloxCreditorNumber'),
(68, 'INVOICE', 'tbloxCostcenterCode'),
(69, 'INVOICE', 'tbloxProjectCode'),
(70, 'INVOICE', 'tbloxCurrency'),
(71, 'INVOICE', 'tbloxBookType'),
(72, 'INVOICE', 'tbloxBookCode'),
(73, 'INVOICE', 'tbloxAdministrationCode'),
(74, 'INVOICE', 'tbloxInvoiceRemark'),
(75, 'INVOICE', 'tbloxPaymentDate'),
(76, 'INVOICE', 'tbloxOrderAndPurchaseOrderNumberAndSupplierName'),
(77, 'INVOICE', 'tbloxInvoiceNumberAndDescription'),
(78, 'INVOICE', 'tbloxPurchaseOrderNumber'),
(79, 'STOCK', 'tbloxLastSourceId'),
(80, 'STOCK', 'tbloxLocationId'),
(81, 'STOCK', 'tbloxTransactionDate'),
(82, 'STOCK', 'tbloxBookYear'),
(83, 'STOCK', 'tbloxBookPeriod'),
(84, 'STOCK', 'tbloxDescription'),
(85, 'STOCK', 'tbloxAccountNumber'),
(86, 'STOCK', 'tbloxCreditorNumber'),
(87, 'STOCK', 'tbloxCurrency'),
(88, 'STOCK', 'tbloxCostcenterCode'),
(89, 'STOCK', 'tbloxProjectCode'),
(90, 'STOCK', 'tbloxBookCode'),
(91, 'STOCK', 'tbloxBookType'),
(92, 'STOCK', 'tbloxAdministrationCode'),
(93, 'STOCK', 'tbloxPurchaseOrderNumber'),
(94, 'STOCK', 'tbloxOrderNumber'),
(95, 'STOCK', 'tbloxOrderAndPurchaseOrderNumber'),
(96, 'STOCK', 'tbloxOrderAndPurchaseOrderNumberAndSupplierName');

-- --------------------------------------------------------

--
-- Table structure for table `genl_dimensions`
--

CREATE TABLE IF NOT EXISTS `genl_dimensions` (
  `dimension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `status` enum('USABLE','HIDDEN','DELETED') NOT NULL DEFAULT 'USABLE',
  `type` enum('LIST','FIELD') NOT NULL DEFAULT 'LIST',
  `level` enum('HEADER','HEADER_AND_LINE','LINE') NOT NULL DEFAULT 'LINE',
  `edit_by` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `genl_data_column` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_dimension_values`
--

CREATE TABLE IF NOT EXISTS `genl_dimension_values` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` varchar(152) DEFAULT NULL,
  `status` enum('USABLE','HIDDEN','DELETED') NOT NULL DEFAULT 'USABLE',
  `edit_by` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_dossiers`
--

CREATE TABLE IF NOT EXISTS `genl_dossiers` (
  `dossier_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `status` enum('usable','hidden') NOT NULL DEFAULT 'usable',
  `currency` varchar(3) NOT NULL,
  `project_code` varchar(255) DEFAULT NULL,
  `add_date` int(10) unsigned DEFAULT NULL,
  `added_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dossier_id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_enrich_bank_journal`
--

CREATE TABLE IF NOT EXISTS `genl_enrich_bank_journal` (
  `enrich_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_col` enum('description') NOT NULL DEFAULT 'description',
  `search_value` varchar(255) NOT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `costcenter_id` int(10) unsigned DEFAULT NULL,
  `costcenter_code` varchar(50) DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `project_code` varchar(50) DEFAULT NULL,
  `costowner_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrich_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_exports`
--

CREATE TABLE IF NOT EXISTS `genl_exports` (
  `export_id` int(11) NOT NULL AUTO_INCREMENT,
  `export_type` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `export_date` int(11) NOT NULL,
  PRIMARY KEY (`export_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_groups`
--

CREATE TABLE IF NOT EXISTS `genl_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `level` enum('0','1','2') DEFAULT NULL,
  `parent_group_id` int(10) unsigned DEFAULT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_holdings`
--

CREATE TABLE IF NOT EXISTS `genl_holdings` (
  `holding_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL,
  `description` text,
  `status` enum('HIDDEN','USABLE') NOT NULL DEFAULT 'USABLE',
  `add_by` int(10) unsigned DEFAULT NULL,
  `add_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`holding_id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_import_bank_statements`
--

CREATE TABLE IF NOT EXISTS `genl_import_bank_statements` (
  `bank_statement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_account_id` int(10) unsigned NOT NULL,
  `bank_statement_number` varchar(50) NOT NULL,
  `external_number` varchar(50) NOT NULL,
  `import_number` varchar(50) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `date` int(10) unsigned NOT NULL,
  `status` enum('pending','deleted','processed') DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `start_date` int(10) unsigned NOT NULL,
  `start_debit_credit` enum('D','C') NOT NULL,
  `start_amount` decimal(12,4) NOT NULL,
  `start_group_amount` decimal(12,4) NOT NULL,
  `end_date` int(10) unsigned NOT NULL,
  `end_debit_credit` enum('D','C') NOT NULL,
  `end_amount` decimal(12,4) NOT NULL,
  `end_group_amount` decimal(12,4) NOT NULL,
  `added_date` int(10) unsigned DEFAULT NULL,
  `added_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bank_statement_id`),
  KEY `idx_bank_account_id` (`bank_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_import_bank_statement_lines`
--

CREATE TABLE IF NOT EXISTS `genl_import_bank_statement_lines` (
  `bank_statement_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_statement_id` int(10) unsigned NOT NULL,
  `line_number` varchar(50) DEFAULT NULL,
  `debit_credit` enum('D','C') NOT NULL,
  `currency` char(3) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `group_amount` decimal(12,4) NOT NULL,
  `book_date` int(10) unsigned DEFAULT NULL,
  `value_date` int(10) unsigned NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(35) DEFAULT NULL,
  `party_type` enum('debtor','creditor') DEFAULT NULL,
  `party_id` int(10) unsigned DEFAULT NULL,
  `party_name` varchar(140) DEFAULT NULL,
  `party_address` varchar(70) DEFAULT NULL,
  `party_country` char(2) DEFAULT NULL,
  `party_account` varchar(34) DEFAULT NULL,
  `party_bank_code` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`bank_statement_line_id`),
  KEY `idx_bank_statement_id` (`bank_statement_id`),
  KEY `idx_party` (`party_type`,`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_journalized_allocation_objects`
--

CREATE TABLE IF NOT EXISTS `genl_journalized_allocation_objects` (
  `journalized_allocation_object_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allocation_object_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`journalized_allocation_object_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`,`allocation_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_manual_data`
--

CREATE TABLE IF NOT EXISTS `genl_manual_data` (
  `manual_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manual_journal_entry_id` int(10) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `from_transaction_id` int(10) unsigned DEFAULT NULL,
  `transaction_layout_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `administration_id` int(10) unsigned DEFAULT NULL,
  `administration_code` varchar(10) DEFAULT NULL,
  `book_id` int(10) unsigned DEFAULT NULL,
  `book_code` varchar(10) DEFAULT NULL,
  `book_type` varchar(10) DEFAULT NULL,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `book_year` int(4) DEFAULT NULL,
  `book_period` int(2) DEFAULT NULL,
  `book_date` int(10) unsigned DEFAULT NULL,
  `object_number` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `costcenter_id` int(10) unsigned DEFAULT NULL,
  `costcenter_code` varchar(50) DEFAULT NULL,
  `costowner_code` varchar(50) DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `project_code` varchar(50) DEFAULT NULL,
  `debitor_number` varchar(20) DEFAULT NULL,
  `creditor_number` varchar(20) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'EUR',
  `exchange_rate` decimal(12,4) DEFAULT '1.0000',
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `vat_perc` decimal(12,4) DEFAULT '0.0000',
  `vat_amount` decimal(12,4) DEFAULT '0.0000',
  `group_amount` decimal(12,4) DEFAULT '0.0000',
  `debet_credit` enum('D','C') NOT NULL DEFAULT 'D',
  `quantity` int(11) NOT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `invoice_line_id` int(10) unsigned DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `supplier_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_description` varchar(100) NOT NULL,
  `invoice_date` int(10) unsigned DEFAULT NULL,
  `payment_date` int(11) NOT NULL,
  `payment_reference` varchar(50) NOT NULL,
  `payment_condition` int(10) unsigned DEFAULT NULL,
  `export_id` int(11) NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `purchaseorder_id` int(10) unsigned DEFAULT NULL,
  `transaction_date` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `hours_week` int(11) DEFAULT NULL,
  `hours_reference` varchar(255) DEFAULT NULL,
  `added_date` int(11) NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `bank_statement_line_id` int(10) unsigned DEFAULT NULL,
  `purchaseorder_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`manual_data_id`),
  KEY `transaction_id` (`transaction_id`,`transaction_layout_id`,`source_id`),
  KEY `manual_journal_entry_id` (`manual_journal_entry_id`),
  KEY `manual_journal_entry_id_2` (`manual_journal_entry_id`,`manual_data_id`,`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_manual_dimension_values`
--

CREATE TABLE IF NOT EXISTS `genl_manual_dimension_values` (
  `manual_dimension_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manual_data_id` int(10) unsigned NOT NULL,
  `value1` varchar(100) NOT NULL DEFAULT '',
  `value2` varchar(100) NOT NULL DEFAULT '',
  `value3` varchar(100) NOT NULL DEFAULT '',
  `value4` varchar(100) NOT NULL DEFAULT '',
  `value5` varchar(100) NOT NULL DEFAULT '',
  `value6` varchar(100) NOT NULL DEFAULT '',
  `value7` varchar(100) NOT NULL DEFAULT '',
  `value8` varchar(100) NOT NULL DEFAULT '',
  `value9` varchar(100) NOT NULL DEFAULT '',
  `value10` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`manual_dimension_value_id`),
  UNIQUE KEY `manual_data_id` (`manual_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_manual_journal_entries`
--

CREATE TABLE IF NOT EXISTS `genl_manual_journal_entries` (
  `manual_journal_entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '',
  `object_type` enum('MEM','BANK') NOT NULL DEFAULT 'MEM',
  `object_id` int(10) unsigned NOT NULL,
  `status` enum('pending','deleted','processed','locked') NOT NULL DEFAULT 'pending',
  `description` text,
  `changed_by` int(10) unsigned NOT NULL,
  `changed_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`manual_journal_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_manual_journal_entries_log`
--

CREATE TABLE IF NOT EXISTS `genl_manual_journal_entries_log` (
  `manual_journal_entry_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manual_journal_entry_id` int(10) unsigned NOT NULL,
  `code` varchar(100) NOT NULL DEFAULT '',
  `status` enum('pending','deleted','processed','locked') NOT NULL DEFAULT 'pending',
  `changed_by` int(10) unsigned NOT NULL,
  `changed_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`manual_journal_entry_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_object_categories`
--

CREATE TABLE IF NOT EXISTS `genl_object_categories` (
  `object_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `procedure_id` int(10) unsigned NOT NULL,
  `category_type` varchar(30) NOT NULL,
  `mandatory` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`object_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_procedures`
--

CREATE TABLE IF NOT EXISTS `genl_procedures` (
  `procedure_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(100) NOT NULL,
  PRIMARY KEY (`procedure_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `genl_procedures`
--

INSERT INTO `genl_procedures` (`procedure_id`, `procedure_name`) VALUES
(1, 'procedureCheckVatByCostcenter'),
(2, 'procedureCheckCostsByLineType'),
(3, 'procedureCheckCostsByCostcenter'),
(4, 'procedureCheckCostAccountByLocation'),
(5, 'procedureCheckSuspenseAccountByLocation'),
(6, 'procedureCheckCostcenterByLocationOrAddProjectCode'),
(7, 'procedureCheckCostcenterByLineTypeOrAddProjectCode'),
(8, 'procedureCheckCostAccountByProjectCode'),
(9, 'procedureCheckAdministrationCodeByProjectCode'),
(10, 'procedureCheckSuspenseAccountByAdministrationCode'),
(11, 'procedureCheckAccountNumberReservationByCostcenter'),
(12, 'procedureCheckCostAccountReservationByCostcenter'),
(13, 'procedureCheckCostAccountAllocationByCostcenter'),
(14, 'procedureCheckContraAccountAllocationByCostcenter'),
(15, 'procedureCheckSuspenseAccountByAdministrationCodeProjectCode'),
(16, 'procedureCheckCostAccountByProjectIdInDimension'),
(17, 'procedureCheckCostAccountByProjectCodeWithDimensionCheck'),
(18, 'procedureCheckVatProRataByCostcenterAndAccountNumber'),
(19, 'procedureCheckVatByCostcenter'),
(20, 'procedureCheckCostsByLineType'),
(21, 'procedureCheckCostsByCostcenter'),
(22, 'procedureCheckCostAccountByLocation'),
(23, 'procedureCheckSuspenseAccountByLocation'),
(24, 'procedureCheckCostcenterByLocationOrAddProjectCode'),
(25, 'procedureCheckCostcenterByLineTypeOrAddProjectCode'),
(26, 'procedureCheckCostAccountByProjectCode'),
(27, 'procedureCheckAdministrationCodeByProjectCode'),
(28, 'procedureCheckSuspenseAccountByAdministrationCode'),
(29, 'procedureCheckAccountNumberReservationByCostcenter'),
(30, 'procedureCheckCostAccountReservationByCostcenter'),
(31, 'procedureCheckCostAccountAllocationByCostcenter'),
(32, 'procedureCheckContraAccountAllocationByCostcenter'),
(33, 'procedureCheckSuspenseAccountByAdministrationCodeProjectCode'),
(34, 'procedureCheckCostAccountByProjectIdInDimension'),
(35, 'procedureCheckCostAccountByProjectCodeWithDimensionCheck'),
(36, 'procedureCheckVatProRataByCostcenterAndAccountNumber');

-- --------------------------------------------------------

--
-- Table structure for table `genl_scheme_accounts`
--

CREATE TABLE IF NOT EXISTS `genl_scheme_accounts` (
  `scheme_account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheme_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`scheme_account_id`),
  UNIQUE KEY `scheme_account` (`scheme_id`,`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `genl_scheme_accounts`
--

INSERT INTO `genl_scheme_accounts` (`scheme_account_id`, `scheme_id`, `account_id`, `added_by`, `added_date`) VALUES
(1, 1, 1, 2, 1504534365);

-- --------------------------------------------------------

--
-- Table structure for table `genl_scheme_account_dimensions`
--

CREATE TABLE IF NOT EXISTS `genl_scheme_account_dimensions` (
  `scheme_account_dimension_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_id` int(11) unsigned NOT NULL,
  `scheme_account_id` int(11) unsigned NOT NULL,
  `dimension_relation` enum('TRUE','FALSE','OPTIONAL') NOT NULL DEFAULT 'FALSE',
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scheme_account_dimension_id`),
  UNIQUE KEY `dimension_id` (`dimension_id`,`scheme_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_settings`
--

CREATE TABLE IF NOT EXISTS `genl_settings` (
  `setting_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `setting_name` char(50) NOT NULL DEFAULT '',
  `num_value` int(10) unsigned NOT NULL DEFAULT '0',
  `text_value` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `genl_settings`
--

INSERT INTO `genl_settings` (`setting_id`, `setting_name`, `num_value`, `text_value`) VALUES
(1, 'nextAllocationId', 2018000001, 'ALLOC'),
(2, 'resultAccountId', 0, ''),
(3, 'resultGroupId', 0, ''),
(4, 'nextBankJournalId', 2018000001, 'ALLOC'),
(5, 'nextManualJournalEntryId', 2018000001, 'MJ'),
(6, 'nextBankStatementId', 2018000001, 'BS'),
(7, 'nextBankStatementLineId', 2018000001, 'BSL'),
(8, 'nextTurnoverTaxId', 2016000001, 'TAX'),
(9, 'turnoverTaxReportingPeriod', 0, 'QUARTER'),
(10, 'exportAudits', 0, 'false'),
(11, 'assetDossierProjectLabel', 0, 'project'),
(12, 'nextAllocationId', 2018000001, 'ALLOC'),
(13, 'resultAccountId', 0, ''),
(14, 'resultGroupId', 0, ''),
(15, 'nextBankJournalId', 2018000001, 'ALLOC'),
(16, 'nextManualJournalEntryId', 2018000001, 'MJ'),
(17, 'nextBankStatementId', 2018000001, 'BS'),
(18, 'nextBankStatementLineId', 2018000001, 'BSL'),
(19, 'nextTurnoverTaxId', 2016000001, 'TAX'),
(20, 'turnoverTaxReportingPeriod', 0, 'QUARTER'),
(21, 'exportAudits', 0, 'false'),
(22, 'assetDossierProjectLabel', 0, 'project');

-- --------------------------------------------------------

--
-- Table structure for table `genl_tmp_cleared_data`
--

CREATE TABLE IF NOT EXISTS `genl_tmp_cleared_data` (
  `data_id` int(10) unsigned NOT NULL,
  `clear_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genl_transactions`
--

CREATE TABLE IF NOT EXISTS `genl_transactions` (
  `transaction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `last_source_id` int(11) NOT NULL,
  `data_source` varchar(100) NOT NULL,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`),
  KEY `last_id` (`last_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_transactions_log`
--

CREATE TABLE IF NOT EXISTS `genl_transactions_log` (
  `transaction_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `last_source_id` int(11) NOT NULL,
  `data_source` varchar(100) NOT NULL,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_log_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_transaction_layout`
--

CREATE TABLE IF NOT EXISTS `genl_transaction_layout` (
  `transaction_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `debet_credit` enum('D','C') NOT NULL DEFAULT 'D',
  `account_number` varchar(100) NOT NULL,
  `data_value` varchar(100) NOT NULL,
  `administration_code` varchar(100) NOT NULL,
  `book_code` varchar(10) NOT NULL,
  `book_type` varchar(10) NOT NULL,
  `costcenter_code` varchar(50) NOT NULL,
  `costowner_code` varchar(50) NOT NULL,
  `project_code` varchar(50) NOT NULL,
  `book_year` int(4) DEFAULT NULL,
  `book_period` int(2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `debitor_number` varchar(20) DEFAULT NULL,
  `creditor_number` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `supplier_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_description` varchar(100) NOT NULL,
  `payment_reference` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT '',
  `include_in_budget_utilisation` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `invoice_date` varchar(50) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_layout_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_transaction_layout_log`
--

CREATE TABLE IF NOT EXISTS `genl_transaction_layout_log` (
  `transaction_layout_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_layout_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `debet_credit` enum('D','C') NOT NULL DEFAULT 'D',
  `account_number` varchar(100) NOT NULL,
  `data_value` varchar(100) NOT NULL,
  `administration_code` varchar(100) NOT NULL,
  `book_code` varchar(10) NOT NULL,
  `book_type` varchar(10) NOT NULL,
  `costcenter_code` varchar(50) NOT NULL,
  `costowner_code` varchar(50) NOT NULL,
  `project_code` varchar(50) NOT NULL,
  `book_year` int(4) DEFAULT NULL,
  `book_period` int(2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `debitor_number` varchar(20) DEFAULT NULL,
  `creditor_number` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `supplier_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_description` varchar(100) NOT NULL,
  `payment_reference` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT '',
  `include_in_budget_utilisation` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `invoice_date` varchar(50) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_layout_log_id`),
  KEY `transaction_layout_id` (`transaction_layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_transaction_settings`
--

CREATE TABLE IF NOT EXISTS `genl_transaction_settings` (
  `transaction_setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(100) NOT NULL,
  `object_value` varchar(100) NOT NULL,
  `category_type` varchar(100) NOT NULL,
  `category_value` varchar(100) NOT NULL,
  `variable` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`transaction_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_turnover_taxes`
--

CREATE TABLE IF NOT EXISTS `genl_turnover_taxes` (
  `turnover_tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turnover_tax_number` varchar(25) NOT NULL DEFAULT '',
  `vat_number` varchar(25) NOT NULL DEFAULT '',
  `reporting_period` enum('YEAR','QUARTER','MONTH') NOT NULL DEFAULT 'YEAR',
  `status` enum('CREATED','READY_TO_SEND','SENT','CANCELLED') NOT NULL DEFAULT 'CREATED',
  `year` int(10) unsigned NOT NULL DEFAULT '0',
  `from_accounting_period` int(10) unsigned NOT NULL DEFAULT '0',
  `until_accounting_period` int(10) unsigned NOT NULL DEFAULT '0',
  `field_1a_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_1a_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_1b_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_1b_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_1c_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_1c_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_1d_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_1d_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_1e_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_2a_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_2a_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_3a_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_3b_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_3c_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_4a_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_4a_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_4b_tax_base` decimal(12,4) DEFAULT '0.0000',
  `field_4b_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5a_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5b_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5c_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5d_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5e_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5f_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `field_5g_turnover_tax` decimal(12,4) DEFAULT '0.0000',
  `total_action` enum('AMOUNT_DUE','AMOUNT_REFUNDED') NOT NULL DEFAULT 'AMOUNT_DUE',
  `include_previous_reporting_period` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`turnover_tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_turnover_tax_lines`
--

CREATE TABLE IF NOT EXISTS `genl_turnover_tax_lines` (
  `turnover_tax_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turnover_tax_id` int(10) unsigned NOT NULL DEFAULT '0',
  `turnover_tax_field` varchar(25) NOT NULL DEFAULT '',
  `genl_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('ACTIVE','CANCELLED') NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`turnover_tax_line_id`),
  KEY `fk_genl_data_id` (`genl_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genl_turnover_tax_mappings`
--

CREATE TABLE IF NOT EXISTS `genl_turnover_tax_mappings` (
  `turnover_tax_mapping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turnover_tax_field` varchar(25) NOT NULL DEFAULT '',
  `transaction_id` int(10) unsigned NOT NULL DEFAULT '0',
  `account_number` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`turnover_tax_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_administrations`
--

CREATE TABLE IF NOT EXISTS `inv_administrations` (
  `administration_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `description` text,
  `status` enum('HIDDEN','USABLE') DEFAULT 'USABLE',
  `genl_scheme_id` int(10) unsigned DEFAULT NULL,
  `debt_administration_id` int(10) unsigned DEFAULT NULL,
  `holding_id` int(10) unsigned DEFAULT NULL,
  `debtor_id` int(10) unsigned DEFAULT NULL,
  `supplier_id` int(10) unsigned DEFAULT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  `add_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`administration_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inv_administrations`
--

INSERT INTO `inv_administrations` (`administration_id`, `cost_center_id`, `project_id`, `number`, `description`, `status`, `genl_scheme_id`, `debt_administration_id`, `holding_id`, `debtor_id`, `supplier_id`, `add_by`, `add_date`) VALUES
(1, NULL, NULL, '001', 'Default administration', 'USABLE', 1, NULL, NULL, NULL, NULL, 2, 1504534270);

-- --------------------------------------------------------

--
-- Table structure for table `inv_administration_locations`
--

CREATE TABLE IF NOT EXISTS `inv_administration_locations` (
  `administration_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_location_id` int(11) DEFAULT NULL,
  `administration_id` int(11) unsigned DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`administration_location_id`),
  UNIQUE KEY `invoice_location_id` (`invoice_location_id`,`administration_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inv_administration_locations`
--

INSERT INTO `inv_administration_locations` (`administration_location_id`, `invoice_location_id`, `administration_id`, `add_by`, `add_date`) VALUES
(1, 2, 1, 2, 1504534278);

-- --------------------------------------------------------

--
-- Table structure for table `inv_batches`
--

CREATE TABLE IF NOT EXISTS `inv_batches` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('CREATED','LOCKED','QUEUED','IN_PROGRESS','DECLINED','PROCESSED') DEFAULT NULL,
  `custom_batch_date` int(11) DEFAULT NULL,
  `custom_book_id` int(11) unsigned DEFAULT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `default_supplier_id` int(11) DEFAULT NULL,
  `no_auto_splitting_invoice` enum('TRUE','FALSE') DEFAULT NULL,
  `no_auto_process_step2` enum('TRUE','FALSE') DEFAULT NULL,
  `administration_id` int(11) DEFAULT NULL,
  `invoice_location_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `batch_id` (`batch_id`,`status`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inv_batches`
--

INSERT INTO `inv_batches` (`batch_id`, `status`, `custom_batch_date`, `custom_book_id`, `year`, `add_by`, `add_date`, `default_supplier_id`, `no_auto_splitting_invoice`, `no_auto_process_step2`, `administration_id`, `invoice_location_id`) VALUES
(1, 'IN_PROGRESS', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_booking_periods`
--

CREATE TABLE IF NOT EXISTS `inv_booking_periods` (
  `booking_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_year` year(4) NOT NULL,
  `book_period` tinyint(3) unsigned NOT NULL,
  `status` enum('locked','unlocked') NOT NULL DEFAULT 'unlocked',
  `add_by` int(10) unsigned DEFAULT NULL,
  `add_date` int(10) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `book_year` (`book_year`,`book_period`)
) ENGINE=InnoDB   AUTO_INCREMENT=25 ;

--
-- Dumping data for table `inv_booking_periods`
--

INSERT INTO `inv_booking_periods` (`booking_id`, `book_year`, `book_period`, `status`, `add_by`, `add_date`) VALUES
(1, 2017, 1, 'unlocked', NULL, NULL),
(2, 2017, 2, 'unlocked', NULL, NULL),
(3, 2017, 3, 'unlocked', NULL, NULL),
(4, 2017, 4, 'unlocked', NULL, NULL),
(5, 2017, 5, 'unlocked', NULL, NULL),
(6, 2017, 6, 'unlocked', NULL, NULL),
(7, 2017, 7, 'unlocked', NULL, NULL),
(8, 2017, 8, 'unlocked', NULL, NULL),
(9, 2017, 9, 'unlocked', NULL, NULL),
(10, 2017, 10, 'unlocked', NULL, NULL),
(11, 2017, 11, 'unlocked', NULL, NULL),
(12, 2017, 12, 'unlocked', NULL, NULL),
(13, 2018, 1, 'unlocked', 0, 1514808616),
(14, 2018, 2, 'unlocked', 0, 1514808616),
(15, 2018, 3, 'unlocked', 0, 1514808616),
(16, 2018, 4, 'unlocked', 0, 1514808616),
(17, 2018, 5, 'unlocked', 0, 1514808616),
(18, 2018, 6, 'unlocked', 0, 1514808616),
(19, 2018, 7, 'unlocked', 0, 1514808616),
(20, 2018, 8, 'unlocked', 0, 1514808616),
(21, 2018, 9, 'unlocked', 0, 1514808616),
(22, 2018, 10, 'unlocked', 0, 1514808616),
(23, 2018, 11, 'unlocked', 0, 1514808616),
(24, 2018, 12, 'unlocked', 0, 1514808616);

-- --------------------------------------------------------

--
-- Table structure for table `inv_books`
--

CREATE TABLE IF NOT EXISTS `inv_books` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_number` varchar(50) NOT NULL,
  `description` text,
  `book_type` enum('PURC_INV','SALES_INV','MEM','CASH','BANK','OB') NOT NULL DEFAULT 'PURC_INV',
  `client_book_type` varchar(10) DEFAULT NULL,
  `book_name` varchar(50) DEFAULT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL DEFAULT 'USABLE',
  `contra_account` int(10) unsigned NOT NULL,
  `administration_id` int(10) unsigned NOT NULL,
  `add_by` int(10) unsigned NOT NULL,
  `add_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inv_books`
--

INSERT INTO `inv_books` (`book_id`, `book_number`, `description`, `book_type`, `client_book_type`, `book_name`, `status`, `contra_account`, `administration_id`, `add_by`, `add_date`) VALUES
(1, '001', '', 'PURC_INV', 'EXP001', 'General journal', 'USABLE', 0, 1, 2, 1504534344);

-- --------------------------------------------------------

--
-- Table structure for table `inv_credit_debit`
--

CREATE TABLE IF NOT EXISTS `inv_credit_debit` (
  `credit_debit_id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_invoice_id` int(11) unsigned NOT NULL,
  `debit_invoice_id` int(11) unsigned NOT NULL,
  `add_by` int(11) unsigned NOT NULL,
  `add_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`credit_debit_id`),
  UNIQUE KEY `credit_debit_pair` (`credit_invoice_id`,`debit_invoice_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_electronic_invoices`
--

CREATE TABLE IF NOT EXISTS `inv_electronic_invoices` (
  `electronic_invoice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_number` varchar(50) NOT NULL DEFAULT '',
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_date` int(10) unsigned NOT NULL DEFAULT '0',
  `administration_code` varchar(10) DEFAULT NULL,
  `invoice_location_id` int(10) unsigned DEFAULT NULL,
  `delivery_location_id` int(10) unsigned DEFAULT NULL,
  `currency_id` char(3) NOT NULL DEFAULT '',
  `payment_method` enum('EXPORT','MANUAL','AUTO_INCASSO','DEFAULT') DEFAULT NULL,
  `packing_amount` decimal(12,4) NOT NULL,
  `packing_group_amount` decimal(12,4) NOT NULL,
  `transport_amount` decimal(12,4) NOT NULL,
  `transport_group_amount` decimal(12,4) NOT NULL,
  `gross_amount` decimal(12,4) NOT NULL,
  `gross_group_amount` decimal(12,4) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `discount_group_amount` decimal(12,4) NOT NULL,
  `net_amount` decimal(12,4) NOT NULL,
  `net_group_amount` decimal(12,4) NOT NULL,
  `before_tax_amount` decimal(12,4) NOT NULL,
  `before_tax_group_amount` decimal(12,4) NOT NULL,
  `vat_low_perc` decimal(12,4) NOT NULL,
  `vat_low_amount` decimal(12,4) NOT NULL,
  `vat_low_group_amount` decimal(12,4) NOT NULL,
  `vat_high_perc` decimal(12,4) NOT NULL,
  `vat_high_amount` decimal(12,4) NOT NULL,
  `vat_high_group_amount` decimal(12,4) NOT NULL,
  `filename` varchar(25) NOT NULL DEFAULT '',
  `customer_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`electronic_invoice_id`),
  KEY `invoiceId` (`invoice_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_electronic_invoice_lines`
--

CREATE TABLE IF NOT EXISTS `inv_electronic_invoice_lines` (
  `electronic_invoice_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_reference` varchar(255) DEFAULT NULL,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `line_type` enum('PRODUCT','DEPOSIT') DEFAULT 'PRODUCT',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_code` varchar(100) NOT NULL DEFAULT '',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `before_tax_amount` decimal(12,4) NOT NULL,
  `before_tax_group_amount` decimal(12,4) NOT NULL,
  `vat_perc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL,
  `discount_group_amount` decimal(12,4) NOT NULL,
  `gross_amount` decimal(12,4) NOT NULL,
  `gross_group_amount` decimal(12,4) NOT NULL,
  `net_amount` decimal(12,4) NOT NULL,
  `net_group_amount` decimal(12,4) NOT NULL,
  `genl_account_id` int(10) NOT NULL DEFAULT '0',
  `cost_center_id` int(10) unsigned DEFAULT NULL,
  `cost_center_code` varchar(100) DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `unit_of_measure` varchar(10) NOT NULL DEFAULT 'PCE',
  `custom_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`electronic_invoice_line_id`),
  KEY `invoiceIdPurchaseIdProductId` (`electronic_invoice_id`,`purchase_id`,`product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_electronic_invoice_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `inv_electronic_invoice_line_dimension_values` (
  `electronic_invoice_line_dimension_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_line_id` int(10) unsigned NOT NULL,
  `dimension_id` int(10) unsigned NOT NULL,
  `value_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`electronic_invoice_line_dimension_value_id`),
  KEY `electronicInvoiceLineId` (`electronic_invoice_line_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_electronic_invoice_pos`
--

CREATE TABLE IF NOT EXISTS `inv_electronic_invoice_pos` (
  `electronic_invoice_po_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `purchase_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`electronic_invoice_po_id`),
  KEY `electronic_invoice_id` (`electronic_invoice_id`),
  KEY `purchase_id` (`purchase_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice`
--

CREATE TABLE IF NOT EXISTS `inv_invoice` (
  `invoice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) NOT NULL DEFAULT '',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_invoice_number` varchar(50) NOT NULL DEFAULT '',
  `sales_invoice_id` int(11) DEFAULT NULL,
  `final_invoice` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `prepayment` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `invoice_date` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_location_id` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_location_id` int(11) DEFAULT NULL,
  `valuta_id` char(3) NOT NULL DEFAULT '',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration_date` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_method` enum('AUTO_INCASSO','MANUAL','EXPORT') NOT NULL DEFAULT 'EXPORT',
  `invoice_type` enum('PO','AO','CUSTOM') NOT NULL DEFAULT 'PO',
  `debet_credit` enum('DEBET','CREDIT') NOT NULL DEFAULT 'DEBET',
  `book_id` int(10) unsigned NOT NULL,
  `book_year` int(4) unsigned NOT NULL DEFAULT '0',
  `book_period` int(2) unsigned NOT NULL DEFAULT '0',
  `book` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `payment_status` enum('LOCKED','RELEASED') DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `sales_invoice_id` (`sales_invoice_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_invoice_id` (`supplier_invoice_id`),
  KEY `invoice_location_id` (`invoice_location_id`),
  KEY `delivery_location_id` (`delivery_location_id`),
  KEY `remark_id` (`remark_id`),
  KEY `book_id` (`book_id`),
  KEY `invoice_number` (`invoice_number`),
  KEY `supplier_id_2` (`supplier_id`,`supplier_invoice_number`(20))
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `inv_invoice`
--
DROP TRIGGER IF EXISTS `invoiceAfterUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceAfterUpdateTrigger` AFTER UPDATE ON `inv_invoice`
 FOR EACH ROW BEGIN INSERT INTO inv_invoice_log VALUES ( NULL, OLD.invoice_id, OLD.invoice_number, OLD.supplier_id, OLD.supplier_invoice_id, OLD.supplier_invoice_number, OLD.sales_invoice_id, OLD.final_invoice, OLD.prepayment, OLD.invoice_date, OLD.invoice_location_id, OLD.delivery_location_id, OLD.valuta_id, OLD.remark_id, OLD.payment_date, OLD.expiration_date, OLD.payment_method, OLD.invoice_type, OLD.debet_credit, OLD.book_id, OLD.book_year, OLD.book_period, OLD.book, OLD.description, OLD.payment_status); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoicescans`
--

CREATE TABLE IF NOT EXISTS `inv_invoicescans` (
  `invoicescan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned DEFAULT '0',
  `leverancier_id` int(10) unsigned DEFAULT NULL,
  `status` enum('PENDING','ASSEMBLED','ASSIGNED','COMPLETE','PROCESSED','IGNORED') NOT NULL DEFAULT 'PENDING',
  `assembled_by` int(10) unsigned DEFAULT NULL,
  `assembled_date` int(10) unsigned DEFAULT NULL,
  `assigned_by` int(10) unsigned DEFAULT NULL,
  `assigned_date` int(10) unsigned DEFAULT NULL,
  `completed_by` int(10) unsigned DEFAULT NULL,
  `completed_date` int(10) unsigned DEFAULT NULL,
  `processed_by` int(10) unsigned DEFAULT NULL,
  `processed_date` int(10) unsigned DEFAULT NULL,
  `ignored_by` int(10) unsigned DEFAULT NULL,
  `ignored_date` int(10) unsigned DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `invoice_date` int(11) DEFAULT NULL,
  `invoice_location_id` int(11) DEFAULT NULL,
  `delivery_location_id` int(11) DEFAULT NULL,
  `total_amount` decimal(12,4) DEFAULT NULL,
  `waiting_for_po` enum('TRUE','FALSE') DEFAULT 'FALSE',
  PRIMARY KEY (`invoicescan_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `leverancier_id` (`leverancier_id`),
  KEY `invoice_location_id` (`invoice_location_id`),
  KEY `delivery_location_id` (`delivery_location_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `inv_invoicescans`
--
DROP TRIGGER IF EXISTS `invoicescansLogAfterUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `invoicescansLogAfterUpdateTrigger` AFTER UPDATE ON `inv_invoicescans`
 FOR EACH ROW BEGIN INSERT INTO inv_invoicescans_log VALUES ( NULL, OLD.invoicescan_id, OLD.invoice_id, OLD.leverancier_id, OLD.status, OLD.assembled_by, OLD.assembled_date, OLD.assigned_by, OLD.assigned_date, OLD.completed_by, OLD.completed_date, OLD.processed_by, OLD.processed_date, OLD.ignored_by, OLD.ignored_date, OLD.invoice_number, OLD.invoice_date, OLD.invoice_location_id, OLD.delivery_location_id, OLD.total_amount); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoicescans_log`
--

CREATE TABLE IF NOT EXISTS `inv_invoicescans_log` (
  `invoicescan_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoicescan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_id` int(10) unsigned DEFAULT '0',
  `leverancier_id` int(10) unsigned DEFAULT NULL,
  `status` enum('PENDING','ASSEMBLED','ASSIGNED','COMPLETE','PROCESSED','IGNORED') NOT NULL DEFAULT 'PENDING',
  `assembled_by` int(10) unsigned DEFAULT NULL,
  `assembled_date` int(10) unsigned DEFAULT NULL,
  `assigned_by` int(10) unsigned DEFAULT NULL,
  `assigned_date` int(10) unsigned DEFAULT NULL,
  `completed_by` int(10) unsigned DEFAULT NULL,
  `completed_date` int(10) unsigned DEFAULT NULL,
  `processed_by` int(10) unsigned DEFAULT NULL,
  `processed_date` int(10) unsigned DEFAULT NULL,
  `ignored_by` int(10) unsigned DEFAULT NULL,
  `ignored_date` int(10) unsigned DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `invoice_date` int(11) DEFAULT NULL,
  `invoice_location_id` int(11) DEFAULT NULL,
  `delivery_location_id` int(11) DEFAULT NULL,
  `total_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`invoicescan_log_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `leverancier_id` (`leverancier_id`),
  KEY `invoice_location_id` (`invoice_location_id`),
  KEY `delivery_location_id` (`delivery_location_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoicescan_batches`
--

CREATE TABLE IF NOT EXISTS `inv_invoicescan_batches` (
  `invoicescan_batches_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `uploadedscan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoicescan_batches_id`),
  UNIQUE KEY `batch_scan` (`uploadedscan_id`,`batch_id`),
  KEY `uploadedscan_id` (`uploadedscan_id`),
  KEY `batch_id` (`batch_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoicescan_pages`
--

CREATE TABLE IF NOT EXISTS `inv_invoicescan_pages` (
  `invoicescanpage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uploadedscan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoicescan_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ocr` text NOT NULL,
  `barcode` varchar(50) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `assigned_by` int(10) unsigned DEFAULT NULL,
  `assigned_date` int(10) unsigned DEFAULT NULL,
  `ignored_by` int(10) unsigned DEFAULT NULL,
  `ignored_date` int(10) unsigned DEFAULT NULL,
  `ranking` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('PENDING','ASSEMBLED','ASSIGNED','IGNORED') NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`invoicescanpage_id`),
  UNIQUE KEY `invoice_id_ranking` (`invoicescan_id`,`ranking`),
  KEY `uploadedscan_id` (`uploadedscan_id`),
  KEY `invoicescan_id` (`invoicescan_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoicescan_pos`
--

CREATE TABLE IF NOT EXISTS `inv_invoicescan_pos` (
  `invoicescanpo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoicescan_id` int(11) unsigned NOT NULL,
  `purchase_id` int(11) unsigned NOT NULL,
  `remark_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `added_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`invoicescanpo_id`),
  UNIQUE KEY `unique_scan_po` (`invoicescan_id`,`purchase_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `remark_id` (`remark_id`),
  KEY `user_id` (`user_id`),
  KEY `invoicescan_id` (`invoicescan_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_action`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_action` (
  `invoice_action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` enum('INVOICE_STATUS','SCANNING_STATUS','ASSIGNED','INVOICE_APPROVAL','ON_HOLD','INVOICE_ADJUSTED','REJECTION_ID','INVOICE_REMARK','PAYMENT_STATUS','QUANTITATIVE_APPROVAL') NOT NULL DEFAULT 'INVOICE_STATUS',
  `action_value` varchar(100) NOT NULL DEFAULT '',
  `current` tinyint(1) DEFAULT NULL,
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoice_action_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `revision_id` (`revision_id`),
  KEY `action_type` (`action_type`),
  KEY `current` (`current`),
  KEY `value_current_type` (`action_value`(20),`current`,`action_type`),
  KEY `invoice_id_2` (`invoice_id`,`revision_id`),
  KEY `invoice_id_3` (`invoice_id`,`revision_id`,`action_type`,`action_value`(20),`current`),
  KEY `invoice_id_4` (`invoice_id`,`action_type`,`current`),
  KEY `remark_id` (`remark_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `inv_invoice_action`
--
DROP TRIGGER IF EXISTS `invoiceActionInsertTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceActionInsertTrigger` AFTER INSERT ON `inv_invoice_action`
 FOR EACH ROW BEGIN DECLARE new_invoice_action_id int(10) unsigned; DECLARE new_invoice_id int(10) unsigned; DECLARE new_revision_id int(10) unsigned; DECLARE new_action_type enum('INVOICE_STATUS','SCANNING_STATUS','ASSIGNED','INVOICE_APPROVAL','ON_HOLD','INVOICE_ADJUSTED','REJECTION_ID','INVOICE_REMARK','PAYMENT_STATUS','QUANTITATIVE_APPROVAL'); DECLARE new_action_value varchar(100); DECLARE new_current tinyint(1); DECLARE new_remark_id int(10) unsigned; DECLARE new_user_id int(10) unsigned; DECLARE new_added_date int(10) unsigned; SET new_invoice_action_id = NEW.invoice_action_id; SET new_invoice_id = NEW.invoice_id; SET new_revision_id = NEW.revision_id; SET new_action_type = NEW.action_type; SET new_action_value = NEW.action_value; SET new_current = NEW.current; SET new_remark_id = NEW.remark_id; SET new_user_id = NEW.user_id; SET new_added_date = NEW.added_date; INSERT INTO inv_invoice_action_log (invoice_action_id, invoice_id, revision_id, action_type, action_value, current, remark_id, user_id, added_date) VALUES (new_invoice_action_id, new_invoice_id, new_revision_id, new_action_type, new_action_value, new_current, new_remark_id, new_user_id, new_added_date); SELECT COUNT(*) INTO @x FROM inv_invoice_action WHERE invoice_id = new_invoice_id AND revision_id = new_revision_id AND action_type = 'INVOICE_STATUS'; IF @x > 1 THEN INSERT INTO inv_invoice_line_status ( invoice_id, purchase_id, order_id, product_id, status ) SELECT new_invoice_id, il.purchase_id, il.order_id, il.product_id, IF(new_action_value IN ('REVIEW', 'CREDIT_PENDING'), 'REGISTERED', new_action_value) FROM inv_invoice_line il LEFT JOIN inv_invoice_line_status ils ON ils.invoice_id = il.invoice_id AND ils.purchase_id = il.purchase_id AND ils.order_id = il.order_id AND ils.product_id = il.product_id AND (ils.status = 'APPROVED' OR ils.status = 'DECLINED') WHERE il.invoice_id = new_invoice_id AND il.revision_id = new_revision_id AND new_action_type = 'INVOICE_STATUS' AND (ils.invoice_line_status_id IS NULL) ON DUPLICATE KEY UPDATE status = VALUES(status); END IF; END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `invoiceActionUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceActionUpdateTrigger` AFTER UPDATE ON `inv_invoice_action`
 FOR EACH ROW BEGIN IF NEW.current != OLD.current THEN UPDATE inv_invoice_action_log SET current = NEW.current WHERE invoice_action_id = NEW.invoice_action_id; END IF; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_action_log`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_action_log` (
  `invoice_action_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_action_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` enum('INVOICE_STATUS','SCANNING_STATUS','ASSIGNED','INVOICE_APPROVAL','ON_HOLD','INVOICE_ADJUSTED','REJECTION_ID','INVOICE_REMARK','PAYMENT_STATUS','QUANTITATIVE_APPROVAL') NOT NULL DEFAULT 'INVOICE_STATUS',
  `action_value` varchar(100) NOT NULL DEFAULT '',
  `current` tinyint(1) DEFAULT NULL,
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoice_action_log_id`),
  KEY `invoice_id_4` (`invoice_id`,`action_type`,`current`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_line`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_line` (
  `invoice_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `purchase_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `delivery_location_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vat_perc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cost_type` enum('PRODUCT','TRANSPORT','ADMINISTRATION','DEPOSIT','PREPAYMENT') NOT NULL DEFAULT 'PRODUCT',
  `cost_center_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sub_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `genl_account_id` int(10) NOT NULL DEFAULT '0',
  `cost_account_number` char(50) NOT NULL DEFAULT '',
  `uom_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added_date` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_edited` int(11) NOT NULL DEFAULT '0',
  `linked_invoice_line_id` int(10) unsigned DEFAULT NULL,
  `is_allocated` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`invoice_line_id`),
  UNIQUE KEY `linked_prepayments` (`invoice_id`,`revision_id`,`linked_invoice_line_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `revision_id` (`revision_id`),
  KEY `delivery_location_id` (`delivery_location_id`),
  KEY `project_id` (`project_id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `sub_category_id` (`sub_category_id`),
  KEY `uom_id` (`uom_id`),
  KEY `remark_id` (`remark_id`),
  KEY `user_id` (`user_id`),
  KEY `invoice_revision_purchase_order_product_type` (`invoice_id`,`revision_id`,`purchase_id`,`order_id`,`product_id`,`cost_type`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `inv_invoice_line`
--
DROP TRIGGER IF EXISTS `invoiceLineInsertTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceLineInsertTrigger` AFTER INSERT ON `inv_invoice_line`
 FOR EACH ROW BEGIN INSERT INTO inv_invoice_line_status ( invoice_id, purchase_id, order_id, product_id, status ) SELECT NEW.invoice_id, NEW.purchase_id, NEW.order_id, NEW.product_id, IF(a.action_value IN ('REVIEW', 'CREDIT_PENDING'), 'REGISTERED', a.action_value) FROM inv_invoice_action a LEFT JOIN inv_invoice_line_status ils ON ils.invoice_id = a.invoice_id AND ils.purchase_id = NEW.purchase_id AND ils.order_id = NEW.order_id AND ils.product_id = NEW.product_id AND (ils.status = 'APPROVED' OR ils.status = 'DECLINED') LEFT JOIN inv_invoice_line il2 ON il2.invoice_id = NEW.invoice_id AND il2.purchase_id = NEW.purchase_id AND il2.order_id = NEW.order_id AND il2.product_id = NEW.product_id AND il2.revision_id = NEW.revision_id - 1 AND ( il2.quantity != NEW.quantity OR il2.price != NEW.price OR il2.group_amount != NEW.group_amount OR il2.project_id != NEW.project_id OR il2.cost_center_id != NEW.cost_center_id OR il2.sub_category_id != NEW.sub_category_id OR il2.vat_perc != NEW.vat_perc OR il2.vat_group_amount != NEW.vat_group_amount) WHERE a.invoice_id = NEW.invoice_id AND a.revision_id = NEW.revision_id AND a.action_type = 'INVOICE_STATUS' AND (ils.invoice_line_status_id IS NULL OR il2.invoice_line_id IS NOT NULL) ON DUPLICATE KEY UPDATE status = VALUES(status); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_line_archive`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_line_archive` (
  `invoice_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `purchase_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `delivery_location_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vat_perc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cost_type` enum('PRODUCT','TRANSPORT','ADMINISTRATION','DEPOSIT','PREPAYMENT') NOT NULL DEFAULT 'PRODUCT',
  `cost_center_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sub_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `genl_account_id` int(10) NOT NULL DEFAULT '0',
  `cost_account_number` char(50) NOT NULL DEFAULT '',
  `uom_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added_date` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_edited` int(11) NOT NULL DEFAULT '0',
  `linked_invoice_line_id` int(10) unsigned DEFAULT NULL,
  `is_allocated` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`invoice_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_line_dimension_values` (
  `invoice_line_dimension_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_line_id` int(10) unsigned NOT NULL,
  `dimension_id` int(10) unsigned NOT NULL,
  `value_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(100) NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`invoice_line_dimension_value_id`),
  UNIQUE KEY `invoice_line_id` (`invoice_line_id`,`dimension_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_line_status`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_line_status` (
  `invoice_line_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `purchase_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('REGISTERED','AWAITING_APPROVAL','APPROVED','DECLINED','DELETED') NOT NULL DEFAULT 'REGISTERED',
  PRIMARY KEY (`invoice_line_status_id`),
  UNIQUE KEY `invoice_purchase_product` (`invoice_id`,`purchase_id`,`order_id`,`product_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `inv_invoice_line_status`
--
DROP TRIGGER IF EXISTS `invoiceLineStatusInsertTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceLineStatusInsertTrigger` AFTER INSERT ON `inv_invoice_line_status`
 FOR EACH ROW BEGIN INSERT INTO inv_invoice_line_status_log ( invoice_line_status_id, invoice_id, purchase_id, product_id, status ) VALUES ( NEW.invoice_line_status_id, NEW.invoice_id, NEW.purchase_id, NEW.product_id, 'REGISTERED' ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `invoiceLineStatusUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `invoiceLineStatusUpdateTrigger` AFTER UPDATE ON `inv_invoice_line_status`
 FOR EACH ROW BEGIN IF NEW.status != OLD.status THEN INSERT INTO inv_invoice_line_status_log ( invoice_id, purchase_id, product_id, status ) VALUES ( NEW.invoice_id, NEW.purchase_id, NEW.product_id, NEW.status ); END IF; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_line_status_log`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_line_status_log` (
  `invoice_line_status_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_line_status_id` int(11) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `purchase_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('REGISTERED','AWAITING_APPROVAL','APPROVED','DECLINED','DELETED') NOT NULL DEFAULT 'REGISTERED',
  PRIMARY KEY (`invoice_line_status_log_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_log`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_log` (
  `invoice_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_number` varchar(50) NOT NULL DEFAULT '',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_invoice_number` varchar(50) NOT NULL DEFAULT '',
  `sales_invoice_id` int(11) DEFAULT NULL,
  `final_invoice` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `prepayment` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `invoice_date` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_location_id` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_location_id` int(11) DEFAULT NULL,
  `valuta_id` char(3) NOT NULL DEFAULT '',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration_date` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_method` enum('AUTO_INCASSO','MANUAL','EXPORT') NOT NULL DEFAULT 'EXPORT',
  `invoice_type` enum('PO','AO','CUSTOM') NOT NULL DEFAULT 'PO',
  `debet_credit` enum('DEBET','CREDIT') NOT NULL DEFAULT 'DEBET',
  `book_id` int(10) unsigned NOT NULL,
  `book_year` int(10) unsigned NOT NULL DEFAULT '0',
  `book_period` int(10) unsigned NOT NULL DEFAULT '0',
  `book` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `payment_status` enum('LOCKED','RELEASED') DEFAULT NULL,
  PRIMARY KEY (`invoice_log_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_invoice_id` (`supplier_invoice_id`),
  KEY `invoice_location_id` (`invoice_location_id`),
  KEY `delivery_location_id` (`delivery_location_id`),
  KEY `remark_id` (`remark_id`),
  KEY `book_id` (`book_id`),
  KEY `sales_invoice_id` (`sales_invoice_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_po`
--

CREATE TABLE IF NOT EXISTS `inv_invoice_po` (
  `invoicepo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT '0',
  `purchase_id` int(11) unsigned NOT NULL DEFAULT '0',
  `remark_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `added_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoicepo_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `remark_id` (`remark_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_sales_batches`
--

CREATE TABLE IF NOT EXISTS `inv_sales_batches` (
  `sales_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `added_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`sales_batch_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_sales_invoices`
--

CREATE TABLE IF NOT EXISTS `inv_sales_invoices` (
  `sales_invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_batch_id` int(11) DEFAULT NULL,
  `sales_invoice_number` varchar(255) DEFAULT NULL,
  `invoice_date` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`sales_invoice_id`),
  KEY `sales_batch_id` (`sales_batch_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inv_supplier_attributes`
--

CREATE TABLE IF NOT EXISTS `inv_supplier_attributes` (
  `supplier_id` int(11) unsigned NOT NULL,
  `auto_step2` enum('true','false') DEFAULT 'false',
  `auto_step3_non_po` enum('true','false') DEFAULT 'false',
  `auto_step3_po` enum('true','false') DEFAULT 'false',
  `auto_step4_non_po` enum('true','false') DEFAULT 'false',
  `auto_step4_po` enum('true','false') DEFAULT 'false',
  `def_project_id` int(11) unsigned DEFAULT NULL,
  `def_costcenter_id` int(11) unsigned DEFAULT NULL,
  `def_product_name` varchar(255) DEFAULT NULL,
  `def_supervisor_id` int(11) unsigned DEFAULT NULL,
  `def_vat_percentage` decimal(5,2) unsigned DEFAULT NULL,
  `def_sub_category_id` int(11) unsigned DEFAULT NULL,
  `payment_method` enum('AUTO_INCASSO','MANUAL','EXPORT') NOT NULL DEFAULT 'EXPORT',
  `ai_keyword` varchar(255) DEFAULT NULL,
  `diff_continuation_page` enum('true','false') DEFAULT 'false',
  `add_date` int(11) unsigned DEFAULT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `def_project_id` (`def_project_id`),
  KEY `def_costcenter_id` (`def_costcenter_id`),
  KEY `def_supervisor_id` (`def_supervisor_id`),
  KEY `def_sub_category_id` (`def_sub_category_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_results`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_results` (
  `accounting_robot_result_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL,
  `based_on_invoice_revision_id` int(1) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `add_date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `contains_warnings` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_dimension_values` (
  `accounting_robot_result_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_id` int(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`accounting_robot_result_dimension_value_id`),
  KEY `accounting_robot_result_id` (`accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_lines`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_lines` (
  `accounting_robot_result_line_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_id` int(1) unsigned NOT NULL,
  `order_request_line_id` int(1) unsigned DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` decimal(12,4) unsigned NOT NULL,
  `cost_type` enum('ADMINISTRATION','CALCULATION_DIFFERENCE','DEPOSIT','PRODUCT','TRANSPORT','VAT_DIFFERENCE') NOT NULL,
  `price` decimal(17,4) NOT NULL,
  `vat_code_id` int(1) unsigned NOT NULL,
  `cost_center_id` int(1) unsigned DEFAULT NULL,
  `project_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`accounting_robot_result_line_id`),
  KEY `accounting_robot_result_id` (`accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_line_dimension_values` (
  `accounting_robot_result_line_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_line_id` int(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`accounting_robot_result_line_dimension_value_id`),
  KEY `accounting_robot_result_line_id` (`accounting_robot_result_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_processing_instructions`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_processing_instructions` (
  `accounting_robot_result_processing_instruction_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_id` int(1) unsigned NOT NULL,
  `processing_instruction_id` int(1) unsigned NOT NULL,
  `value` varchar(300) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`accounting_robot_result_processing_instruction_id`),
  KEY `accounting_robot_result_id` (`accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_warnings`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_warnings` (
  `accounting_robot_result_warning_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_id` int(1) unsigned NOT NULL,
  `accounting_robot_result_line_id` int(1) unsigned DEFAULT NULL,
  `dimension_id` int(1) unsigned DEFAULT NULL,
  `number` int(1) unsigned NOT NULL,
  `field` enum('AMOUNT_INCL_VAT','DESCRIPTION','DIMENSION_VALUE','VAT_CODE') DEFAULT NULL,
  PRIMARY KEY (`accounting_robot_result_warning_id`),
  KEY `accounting_robot_result_id` (`accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_accounting_robot_result_warning_arguments`
--

CREATE TABLE IF NOT EXISTS `ipro_accounting_robot_result_warning_arguments` (
  `accounting_robot_result_warning_argument_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_robot_result_warning_id` int(1) unsigned NOT NULL,
  `position` int(1) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`accounting_robot_result_warning_argument_id`),
  KEY `accounting_robot_result_warning_id` (`accounting_robot_result_warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_creditor_administration_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_creditor_administration_settings` (
  `creditor_administration_setting_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `creditor_id` int(1) unsigned NOT NULL,
  `administration_id` int(1) unsigned NOT NULL,
  `field_type` enum('DEFAULT_COST_CENTER_ID','DEFAULT_GENERAL_LEDGER_ACCOUNT_ID','DEFAULT_PAYMENT_METHOD','DEFAULT_PAYMENT_TERM','DEFAULT_PROJECT_ID','DEFAULT_SUBCATEGORY_ID','DEFAULT_VAT_CODE_ID') NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADD','EDIT','DELETE') NOT NULL,
  `source` enum('CREDITOR_SETTINGS_DETAILS') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creditor_administration_setting_id`),
  KEY `creditor_id` (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_creditor_administration_settings`
--
DROP TRIGGER IF EXISTS `afterInsertIproCreditorAdministrationSettings`;
DELIMITER //
CREATE TRIGGER `afterInsertIproCreditorAdministrationSettings` AFTER INSERT ON `ipro_creditor_administration_settings`
 FOR EACH ROW BEGIN INSERT INTO ipro_creditor_administration_settings_log ( creditor_administration_setting_id, creditor_id, administration_id, field_type, value, date, user_id, user_action, source, revision_id, revision_hash, deleted ) VALUES ( NEW.creditor_administration_setting_id, NEW.creditor_id, NEW.administration_id, NEW.field_type, NEW.value, NEW.date, NEW.user_id, NEW.user_action, NEW.source, NEW.revision_id, NEW.revision_hash, NEW.deleted ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproCreditorAdministrationSettings`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproCreditorAdministrationSettings` AFTER UPDATE ON `ipro_creditor_administration_settings`
 FOR EACH ROW BEGIN INSERT INTO ipro_creditor_administration_settings_log ( creditor_administration_setting_id, creditor_id, administration_id, field_type, value, date, user_id, user_action, source, revision_id, revision_hash, deleted ) VALUES ( NEW.creditor_administration_setting_id, NEW.creditor_id, NEW.administration_id, NEW.field_type, NEW.value, NEW.date, NEW.user_id, NEW.user_action, NEW.source, NEW.revision_id, NEW.revision_hash, NEW.deleted ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_creditor_administration_settings_log`
--

CREATE TABLE IF NOT EXISTS `ipro_creditor_administration_settings_log` (
  `creditor_administration_setting_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `creditor_administration_setting_id` int(1) unsigned NOT NULL,
  `creditor_id` int(1) unsigned NOT NULL,
  `administration_id` int(1) unsigned NOT NULL,
  `field_type` enum('DEFAULT_COST_CENTER_ID','DEFAULT_GENERAL_LEDGER_ACCOUNT_ID','DEFAULT_PAYMENT_METHOD','DEFAULT_PAYMENT_TERM','DEFAULT_PROJECT_ID','DEFAULT_SUBCATEGORY_ID','DEFAULT_VAT_CODE_ID') NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADD','EDIT','DELETE') NOT NULL,
  `source` enum('CREDITOR_SETTINGS_DETAILS') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creditor_administration_setting_log_id`),
  KEY `creditor_administration_setting_id` (`creditor_administration_setting_id`),
  KEY `creditor_id` (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_creditor_invoice_number_series`
--

CREATE TABLE IF NOT EXISTS `ipro_creditor_invoice_number_series` (
  `creditor_invoice_number_serie_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `creditor_id` int(1) unsigned NOT NULL,
  `balance_type` enum('ALL','CREDIT','DEBIT') NOT NULL,
  `length` int(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned NOT NULL,
  `user_action` enum('ADD','DELETE','SAVE') NOT NULL,
  `source` enum('INVOICE_SETTINGS') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creditor_invoice_number_serie_id`),
  KEY `creditor_id` (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_creditor_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_creditor_settings` (
  `creditor_setting_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `creditor_id` int(1) unsigned NOT NULL,
  `step_2_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_2_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_2_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_po_invoices` tinyint(1) unsigned NOT NULL,
  `default_product_name` varchar(255) DEFAULT NULL,
  `default_project_id` int(1) unsigned DEFAULT NULL,
  `default_cost_center_id` int(1) unsigned DEFAULT NULL,
  `default_general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `default_subcategory_id` int(1) unsigned DEFAULT NULL,
  `default_vat_code_id` int(1) unsigned DEFAULT NULL,
  `default_payment_method` enum('DIRECT_DEBIT','MANUAL','NORMAL') NOT NULL,
  `default_payment_term` int(1) unsigned DEFAULT NULL,
  `default_approver_id` int(1) unsigned DEFAULT NULL,
  `advanced_creditor_invoice_number_modus` tinyint(1) unsigned NOT NULL,
  `different_continuation_page` tinyint(1) unsigned NOT NULL,
  `different_front_page` tinyint(1) unsigned NOT NULL,
  `ignore_by_ai` tinyint(1) unsigned NOT NULL,
  `separate_creditor_invoice_number_serie_for_credit_invoices` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `source` enum('CREDITOR_SETTINGS_DETAILS','EXTERNAL_LINK') NOT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`creditor_setting_id`),
  KEY `creditor_id` (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_creditor_settings`
--
DROP TRIGGER IF EXISTS `afterInsertIproCreditorSettings`;
DELIMITER //
CREATE TRIGGER `afterInsertIproCreditorSettings` AFTER INSERT ON `ipro_creditor_settings`
 FOR EACH ROW BEGIN INSERT INTO ipro_creditor_settings_log ( creditor_setting_id, creditor_id, step_2_auto_process_credit_invoices, step_2_auto_process_non_po_invoices, step_2_auto_process_po_invoices, step_3_auto_process_credit_invoices, step_3_auto_process_non_po_invoices, step_3_auto_process_po_invoices, step_4_auto_process_credit_invoices, step_4_auto_process_non_po_invoices, step_4_auto_process_po_invoices, step_4_auto_process_electronic_credit_invoices, step_4_auto_process_electronic_non_po_invoices, step_4_auto_process_electronic_po_invoices, default_product_name, default_project_id, default_cost_center_id, default_general_ledger_account_id, default_subcategory_id, default_vat_code_id, default_payment_method, default_payment_term, default_approver_id, advanced_creditor_invoice_number_modus, different_continuation_page, different_front_page, ignore_by_ai, separate_creditor_invoice_number_serie_for_credit_invoices, date, user_id, source, status, revision_id, revision_hash ) VALUES ( NEW.creditor_setting_id, NEW.creditor_id, NEW.step_2_auto_process_credit_invoices, NEW.step_2_auto_process_non_po_invoices, NEW.step_2_auto_process_po_invoices, NEW.step_3_auto_process_credit_invoices, NEW.step_3_auto_process_non_po_invoices, NEW.step_3_auto_process_po_invoices, NEW.step_4_auto_process_credit_invoices, NEW.step_4_auto_process_non_po_invoices, NEW.step_4_auto_process_po_invoices, NEW.step_4_auto_process_electronic_credit_invoices, NEW.step_4_auto_process_electronic_non_po_invoices, NEW.step_4_auto_process_electronic_po_invoices, NEW.default_product_name, NEW.default_project_id, NEW.default_cost_center_id, NEW.default_general_ledger_account_id, NEW.default_subcategory_id, NEW.default_vat_code_id, NEW.default_payment_method, NEW.default_payment_term, NEW.default_approver_id, NEW.advanced_creditor_invoice_number_modus, NEW.different_continuation_page, NEW.different_front_page, NEW.ignore_by_ai, NEW.separate_creditor_invoice_number_serie_for_credit_invoices, NEW.date, NEW.user_id, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproCreditorSettings`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproCreditorSettings` AFTER UPDATE ON `ipro_creditor_settings`
 FOR EACH ROW BEGIN INSERT INTO ipro_creditor_settings_log ( creditor_setting_id, creditor_id, step_2_auto_process_credit_invoices, step_2_auto_process_non_po_invoices, step_2_auto_process_po_invoices, step_3_auto_process_credit_invoices, step_3_auto_process_non_po_invoices, step_3_auto_process_po_invoices, step_4_auto_process_credit_invoices, step_4_auto_process_non_po_invoices, step_4_auto_process_po_invoices, step_4_auto_process_electronic_credit_invoices, step_4_auto_process_electronic_non_po_invoices, step_4_auto_process_electronic_po_invoices, default_product_name, default_project_id, default_cost_center_id, default_general_ledger_account_id, default_subcategory_id, default_vat_code_id, default_payment_method, default_payment_term, default_approver_id, advanced_creditor_invoice_number_modus, different_continuation_page, different_front_page, ignore_by_ai, separate_creditor_invoice_number_serie_for_credit_invoices, date, user_id, source, status, revision_id, revision_hash ) VALUES ( NEW.creditor_setting_id, NEW.creditor_id, NEW.step_2_auto_process_credit_invoices, NEW.step_2_auto_process_non_po_invoices, NEW.step_2_auto_process_po_invoices, NEW.step_3_auto_process_credit_invoices, NEW.step_3_auto_process_non_po_invoices, NEW.step_3_auto_process_po_invoices, NEW.step_4_auto_process_credit_invoices, NEW.step_4_auto_process_non_po_invoices, NEW.step_4_auto_process_po_invoices, NEW.step_4_auto_process_electronic_credit_invoices, NEW.step_4_auto_process_electronic_non_po_invoices, NEW.step_4_auto_process_electronic_po_invoices, NEW.default_product_name, NEW.default_project_id, NEW.default_cost_center_id, NEW.default_general_ledger_account_id, NEW.default_subcategory_id, NEW.default_vat_code_id, NEW.default_payment_method, NEW.default_payment_term, NEW.default_approver_id, NEW.advanced_creditor_invoice_number_modus, NEW.different_continuation_page, NEW.different_front_page, NEW.ignore_by_ai, NEW.separate_creditor_invoice_number_serie_for_credit_invoices, NEW.date, NEW.user_id, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_creditor_settings_log`
--

CREATE TABLE IF NOT EXISTS `ipro_creditor_settings_log` (
  `creditor_setting_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `creditor_setting_id` int(1) unsigned NOT NULL,
  `creditor_id` int(1) unsigned NOT NULL,
  `step_2_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_2_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_2_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_3_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_credit_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_non_po_invoices` tinyint(1) unsigned NOT NULL,
  `step_4_auto_process_electronic_po_invoices` tinyint(1) unsigned NOT NULL,
  `default_product_name` varchar(255) DEFAULT NULL,
  `default_project_id` int(1) unsigned DEFAULT NULL,
  `default_cost_center_id` int(1) unsigned DEFAULT NULL,
  `default_general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `default_subcategory_id` int(1) unsigned DEFAULT NULL,
  `default_vat_code_id` int(1) unsigned DEFAULT NULL,
  `default_payment_method` enum('DIRECT_DEBIT','MANUAL','NORMAL') NOT NULL,
  `default_payment_term` int(1) unsigned DEFAULT NULL,
  `default_approver_id` int(1) unsigned DEFAULT NULL,
  `advanced_creditor_invoice_number_modus` tinyint(1) unsigned NOT NULL,
  `different_continuation_page` tinyint(1) unsigned NOT NULL,
  `different_front_page` tinyint(1) unsigned NOT NULL,
  `ignore_by_ai` tinyint(1) unsigned NOT NULL,
  `separate_creditor_invoice_number_serie_for_credit_invoices` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `source` enum('CREDITOR_SETTINGS_DETAILS','EXTERNAL_LINK') NOT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`creditor_setting_log_id`),
  KEY `creditor_setting_id` (`creditor_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_credit_invoice_debit_invoices`
--

CREATE TABLE IF NOT EXISTS `ipro_credit_invoice_debit_invoices` (
  `credit_invoice_debit_invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `credit_invoice_id` int(1) unsigned NOT NULL,
  `debit_invoice_id` int(1) unsigned NOT NULL,
  `since_credit_invoice_revision_id` int(1) unsigned NOT NULL,
  `since_debit_invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`credit_invoice_debit_invoice_id`),
  UNIQUE KEY `unqiue_credit_invoice_id_debit_invoice_id` (`credit_invoice_id`,`debit_invoice_id`),
  KEY `credit_invoice_id` (`credit_invoice_id`),
  KEY `debit_invoice_id` (`debit_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_credit_invoice_debit_invoices`
--
DROP TRIGGER IF EXISTS `afterInsertIproCreditInvoiceDebitInvoices`;
DELIMITER //
CREATE TRIGGER `afterInsertIproCreditInvoiceDebitInvoices` AFTER INSERT ON `ipro_credit_invoice_debit_invoices`
 FOR EACH ROW BEGIN INSERT INTO ipro_credit_invoice_debit_invoices_log ( credit_invoice_debit_invoice_id, credit_invoice_id, debit_invoice_id, since_credit_invoice_revision_id, since_debit_invoice_revision_id, deleted ) VALUES ( NEW.credit_invoice_debit_invoice_id, NEW.credit_invoice_id, NEW.debit_invoice_id, NEW.since_credit_invoice_revision_id, NEW.since_debit_invoice_revision_id, NEW.deleted ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproCreditInvoiceDebitInvoices`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproCreditInvoiceDebitInvoices` AFTER UPDATE ON `ipro_credit_invoice_debit_invoices`
 FOR EACH ROW BEGIN INSERT INTO ipro_credit_invoice_debit_invoices_log ( credit_invoice_debit_invoice_id, credit_invoice_id, debit_invoice_id, since_credit_invoice_revision_id, since_debit_invoice_revision_id, deleted ) VALUES ( NEW.credit_invoice_debit_invoice_id, NEW.credit_invoice_id, NEW.debit_invoice_id, NEW.since_credit_invoice_revision_id, NEW.since_debit_invoice_revision_id, NEW.deleted ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_credit_invoice_debit_invoices_log`
--

CREATE TABLE IF NOT EXISTS `ipro_credit_invoice_debit_invoices_log` (
  `credit_invoice_debit_invoice_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `credit_invoice_debit_invoice_id` int(1) unsigned NOT NULL,
  `credit_invoice_id` int(1) unsigned NOT NULL,
  `debit_invoice_id` int(1) unsigned NOT NULL,
  `since_credit_invoice_revision_id` int(1) unsigned NOT NULL,
  `since_debit_invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`credit_invoice_debit_invoice_log_id`),
  KEY `credit_invoice_id` (`credit_invoice_id`),
  KEY `debit_invoice_id` (`debit_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_custom_field_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_custom_field_settings` (
  `custom_field_setting_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `field_type` enum('DIMENSION_VALUE','INVOICE_REMARK','INVOICE_SCAN_REMARK','PRODUCT_NAME') NOT NULL,
  `type_id` int(1) unsigned DEFAULT NULL,
  `max_length` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`custom_field_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_default_vat_codes`
--

CREATE TABLE IF NOT EXISTS `ipro_default_vat_codes` (
  `default_vat_code_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `vat_code_id` int(1) unsigned NOT NULL,
  `cost_type` enum('ADMINISTRATION','CALCULATION_DIFFERENCE','DEPOSIT','PRODUCT','TRANSPORT','VAT_DIFFERENCE') NOT NULL,
  `effective_vat_percentage` decimal(5,2) NOT NULL,
  `entity` enum('INVOICE_LOCATION') DEFAULT NULL,
  `entity_id` int(1) unsigned DEFAULT NULL,
  `default_for_cost_type` tinyint(1) unsigned NOT NULL,
  `default_for_effective_vat_percentage` tinyint(1) unsigned NOT NULL,
  `default_for_entity` tinyint(1) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`default_vat_code_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ipro_default_vat_codes`
--

INSERT INTO `ipro_default_vat_codes` (`default_vat_code_id`, `vat_code_id`, `cost_type`, `effective_vat_percentage`, `entity`, `entity_id`, `default_for_cost_type`, `default_for_effective_vat_percentage`, `default_for_entity`, `active`) VALUES
(1, 2, 'PRODUCT', 0.00, NULL, NULL, 0, 1, 0, 1),
(2, 3, 'PRODUCT', 6.00, NULL, NULL, 0, 1, 0, 1),
(3, 4, 'PRODUCT', 21.00, NULL, NULL, 1, 1, 0, 1),
(4, 4, 'ADMINISTRATION', 21.00, NULL, NULL, 1, 0, 0, 1),
(5, 4, 'TRANSPORT', 21.00, NULL, NULL, 1, 0, 0, 1),
(6, 1, 'CALCULATION_DIFFERENCE', 0.00, NULL, NULL, 1, 0, 0, 1),
(7, 1, 'DEPOSIT', 0.00, NULL, NULL, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_detailed_analysis_results`
--

CREATE TABLE IF NOT EXISTS `ipro_detailed_analysis_results` (
  `detailed_analysis_result_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_page_id` int(1) unsigned NOT NULL,
  `result` mediumtext,
  `date` int(1) unsigned NOT NULL,
  PRIMARY KEY (`detailed_analysis_result_id`),
  KEY `invoice_scan_page_id` (`invoice_scan_page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ipro_detailed_analysis_results`
--

INSERT INTO `ipro_detailed_analysis_results` (`detailed_analysis_result_id`, `invoice_scan_page_id`, `result`, `date`) VALUES
(1, 11, 'eNqdVNtO40AM/Ze8U43tuaZPsOxKSAgh0R8I7YiNVJIqCazYFf++9kyBKU15oC89to/tY09mmhpV/W+sHdbVthmn1Z/YTS+3/TjFzY8hbtqpH666575dx5unx/s4jL/64S5Ob7GLZtt067h62cXzbnMdu4fpd7Vsai76OtZg6mrXj2N7v43nj/1TN40S1BxtawrLTQ1KqaCWbQ2eLQSrkqEkhGCS4RLP54hlI2QWGsGU/cjYZ4yCXch+LRizXwo5lbF0sPtuUkfn+iQcbbgc+0FwFiFatUoQxU0hayPBezkijUwuKXzayxEJBLl8mtKyi7HkIhorWDhAqS2KHyBthWzCOdekPYDkCjTBiFeGNUkMiTCjHEOZTi+MCuXPeevJgQvoINgQtEby1orl0BqLqZ6I5X9pjAsv51P8DGFQThnwvFJngIJWRJrY4tomkJMamHIThAQtHlQBZY0HDYqsVrxfdN4ra71YZB34lKpTKn1PQdrzIk0kJyp7pfRRfU8Lhpz7SUxwvEaLFqxjtnPGGIcuGG9dgBBwn+1TMrmD0/CBNHjjg2XVXvMR8JkTgViW0AOL5ytE6uMKzV/I4rq5Y24RxuI2XsZt+xyHl+t+3Uxt35W0ouO+02UzxcRAubi8qyU3YxoqsGcAZ2CrdGv1J79iv1TURxVn+pbq7552u217MBxCXQ1x3T907d+4Kd6dipvyZJc/L65WgkX/B/F9Z5tqecNRgtloudFMRF8SP+/rrdyhqmJd1cyKmO5m6Ec1DwZ4W8V7FMvoqp+abfG0gjzmRtoulKren9TXPM8k7Lt1P8Tx9vR3QnaW+cUnQ2Y24/RZnxBzdOyv/wEG6Omc', 1504023656),
(2, 12, 'eNqdVMFOIzEM/Ze5U8V24iTTEyy7EhJCSPQHhjZiRyoz1czAqrvqv2+cFEhpy4G59Nl+dp7tJk2Nqv431hbrat2M0+JP6KbtfT9OYfVjCKt26oeb7rVvl+Hu5fkxDOOvfngI01vsqlk33TIstptw2a1uQ/c0/a7mTR2L7sYaTF1t+nFsH9fh8rl/6aZRgjpG25r8fFWDUsqreVuDixYCq2QoCSGYZNjEcznC0fCZhUYwZT9G7DJGwdZnvxaM2S+FrMpYTuD9aVJH5/okHG1iuegHwVmEaNUqQRQ3+ayNBO/liDQyuaTwaS9HJBDk8qlLjq6IJRfRsGDhAKVjUfwAaSrECedck+YAkivQeCNeadYkMSTCjLIRSnd6ZpQvP+vYkQXr0YJn77VGcsxiWWTDmOqJ2PgrB+PMyX6KzxB6ZZUBF0dqDZDXikhTtGJt48lKDUy5CUKCjAdVQLFxoEERaxXni9Y5xezEIrbgUqpOqfQ9BWnOs9SRbFTmSulP9T0t6HPuJzHexjEyMrCNbGuNMRatN46tB+9xn+1SMtmDbThPGpxxnqNqp+MK4s6JQCwmdBDFxytE6uMKnb6QxXWzx9wijMVtvA7r9jUM29t+2Uxt35W04sT9SdfNFEqGPmKcqFOqeXjZbNbtgViEuhrCsn/q2r9hVbwj1Xyso9Lrn1c3C8Gi54P4PoNVNb+LUYKT0XJCmYiuJH7u/63coaqifVECUQkq4AuAC+CkzZ6gH9U8aOBtFO9RLKOLfmrWxVMJ8jgbOXamVPX+RO5yP5OwH5b9EMb783snPsn84i9A5mTG+V2fEXO09t1/i2vfUA==', 1504023656),
(3, 14, 'eNp9UtGOgjAQ/Je+c2mLUC1Pet4lJsaYyA9U2HhNsCW0evGM/35FTy1S7o3MDDvbmRWcYn42nFGOKmFs/g3KntbaWCjfGyil1c1CHbUsYHXYb6Exn7rZgL1zM1EJVUB+qmGqyiWonf1CmeBu6MVwknBUa2PktoLpXh+UNS1J+FlynJWcjsYYZ04Y46cwbOsNZX2tR1PPcw6VPEJzWupCWKmVL/Mc/5zmwsJVkbb7JWySOTMno5iwCNMIM5Q5fIyDeErSJ55EhEQkueHsBcc3fDR5xeMrnuAA3m486m0ceJefzuZQ15XshEcJRw0UeqfkD5Ree8iZuuTmH7NF3n63+TyFj05KlK0cG5Mg6zd2E9KxL3zt4z6uu5VXBwpE7eQsIO/N7DzgHsWDpT6bayuq7oEa7uLGbxgj/07b59hWvCl0A2Y9fIZxGlT+c5FxEvxjuOqBZXqtX34BNxVKxA==', 1504013596),
(4, 15, 'eNp9kmFvgjAQhv9Lv7uUosMcn3RsiYkxJvAHKlxcE2xJW1yY8b8PtqnHgH1r8j69e++9kyA4XBxEAlgpnc8+UPtmb5zH4sViobyxG302KsddfTqgdW/Gpuhv2lqWUueYNRWudLFFffTvLJbQFr06CBbAKuOcOpS4Oplae9eJAVwU8LgAMV9yHrdgyB/geFtSNBqyRBakZ4KlOqNttiaXXhlNMdLxt1MiPVJiPiBG6lA3aV1VpeqZFQEwi7k5avWJBUmLxQ5ap8nrepN1787PA7xnULB416phMKrShH5AsaTg3/lv5fquyPidk6B1IngQzbiY8ejbWzSCD2r2BrhFcVcFVTPjZdk/CAdt3PyJc0bvohvHd3CaG4tuP7328HmU/OcCwsXoj+lVT5gZbP36BYLoK6o=', 1504013596),
(5, 16, 'eNp9kmFvgjAQhv9Lv7uUosMcn3RsiYkxJvAHKlxcE2xJW1yY8b8PtqnHgH1r8j69e++9kyA4XBxEAlgpnc8+UPtmb5zH4sViobyxG302KsddfTqgdW/Gpuhv2lqWUueYNRWudLFFffTvLJbQFr06CBbAKuOcOpS4Oplae9eJAVwU8LgAMV9yHrdgyB/geFtSNBqyRBakZ4KlOqNttiaXXhlNMdLxt1MiPVJiPiBG6lA3aV1VpeqZFQEwi7k5avWJBUmLxQ5ap8nrepN1787PA7xnULB416phMKrShH5AsaTg3/lv5fquyPidk6B1IngQzbiY8ejbWzSCD2r2BrhFcVcFVTPjZdk/CAdt3PyJc0bvohvHd3CaG4tuP7328HmU/OcCwsXoj+lVT5gZbP36BYLoK6o=', 1504013596),
(6, 17, 'eNrVVktz2zYQ/isYntqDOXgSAHWpZTepO64nrT3JUQOTsM2GBDQk5cTJ6L9nAUkJbakU3Z5KXkgs9vXttwuYnOL8a5dLmie16fqbT9b1T+9819vyrLVl1fv2wj36qrBXq+bWtt0b317bfiebm9q4wt48Le2pKy+tu+8fkpnJwei6y4nIk6Xvuuq2tqeNX7m+C0KRf61yPivzTKRc4MFDFadEYs0Z5vBiyRlXnGuJJWaEilmV46BH0/BJ4VPwFOuhCcYJzrAgjGSgqrDSlCjCdPhjMqgxUCMkZUIPH86IyIQisJXAq8ACuMRYKKE3egT0aKqfBYyJlBkTmWIawqUC84xnUiqIIVOaixg0IMHwDyQO4zpATe7vjWIScCPwoULJCJRs+eCdXbhoIeygUZDlSWsLf++qL7ZcPJp6ZZNZl1NQAHwI+gn/TDVHJ0gqJAmiLEiD161WX3m36ArfghqgLEMCBBK4M5//sy8+xRfLE9uYql6Ysmxt1x13BxqVu/O/FKbt26q8t598W5dp4ZtRf5xHfzxPTFEEfk7NL4AP7CUilcAkkk3JikCMt8a9BsKrSyXRxdXbOcKZIEhIwtARZyKmRMFo8WCCo4W/WwAOjW2LyVRRecIYzaQ6xg2+48ajmY6diolhxCnSFEHPoDkm43WiO150q+WyriArZxp73BUMoLMdJdCHwInxfNRsvQ7wDQbXua2rR9s+XfrChN3PW5EH95DQl2oJKJfHQwLXYbCg07PRSLJYRaCA/dzb1pl6UW/9T8ucguE/V8b1qwa98aZB175exfDRPH2fTugKkE5tv7D+m7VtY1z30ZQWKmtGPZA4FKHtiqp/Ompe58lfvgcYSjPeznpbvcGw3Q7Zc9PbmAePZ4/ksw1tKQzwE8xPAs/DunixjuN6pvWLdaLCusT45X5YDxHwvQj26UM3R+Gr6cPhlEJv58fp89q+5KEvMeZSY62zORETevL/RNHfU/ThwdratrUxDqlxirLXUBRK+IcHglZ/fxy1up0vwyP+ejvRBjcASoZeBnesYBtG0/mv84ubCCEebvx+sShjAiBn5KB8ePFIZlfBkBpufDnyfhh8HtmguZIDDbUp8d7251bpXho7QAZe6VB+43tTD66TJBQGUKEkxTj5V9fK9QaBPli+DrXq3o1cwMKJHtnBsoM6YycGDI1IXSYOqo4MC9DecPIfIt3j0fobqdHF8Q==', 1504532960),
(7, 18, 'eNrVV9ty2zYQ/RWOntoHc4DF4ka/NHKaNB3Xk9ae5lHDSEisRiI9JOXEyfjn+mU9ACWFvowkO0+1Z2AawB4szp5dAGVBovjWFpaK0aJsu4vPoepu3tZtF2YnTZjNu7p5U13X82k4Wy3fh6Z9VTfnoduMjctFWU3Dxc1VeFHNTkP1sbscHZeFLL7NC3EM4GLE2gor1Oj4ti2kLkZXddvO3y/Ci2W9qro2TtdxOh/PCqNz1mLwQ45JWuFZCcavsKzYMfsEKUkfx2VgR3n8JHxqzoUfQiiWwggtlTQwdcJ5kk4qH/9TNpopmEmZK+2HP6ykNtpJTJX4dUDAkkJop31vJ2FHub/jsJDWGqWNUx7ukhZs2Fjr4INxnnVyGkwo8Z2Jx5mOxMTogBnvHAkfvdQ5PqwX61ZKtNIoeCvgmiUSkj2IIiJprDcuOcqY5b2J7vrceS0Fb1pjTfSKDBC1Ul57Q1ZqiSHScDtRLPEHo7BXIpdGkheKSDth2BqHeUC3TiNW2D8rJ1k449EamCcRiN6FUYQwuXOgVa5br6IP1iGihC5vtBly1Zv39tGcRa61Zxbr1iDCxkkvLLbkNbFB3MA88931j0CNTQAyh+uW5boFgIsy82QRbg+hkQBtmn1UzAACDI6l/hGInsZxgtB5pE9v2YQJRcFbjvL10BBDoBoCFJpTHHsIdxT3kiBAJDjC4KZVHLmDjg16LDtrpTH4KwYAZ6eJzOcD9PYiAbhcIHak1q3DFqLkvWKyVjnNVhHyJv2Xkq1HODmSxD2Cz41GivpNqzQhuaXF7rWw3qHXbIScjH0fh+cZ93kwfp5xL6F/o7EWz4seo+P1+I8EgYIDeoRWyDSSGoTDwFtLyuEDXEplSRPywkgrtxDlVbNRsla5Zqcc0g8lhqWH/hySEfXRWEcU0aFOyPJuBHsVNgkCBXeIgNAzkdNRA5YhbzjFirxDaXDfI3jU51NCsNgHGW03rfFxUyZGHpYahdMLh/0o1Ce3zehexkkDGirC0ignfYuVLKouWFWGoT+FzLaMcqL1GiGeJPZh/Wy3R4/Eh48Hm8TBdnVZV2FSpaqaimoaMMWoCdP6YzX/GmaT63KxCiO4RhSrjZLZT+Jn8pwdZdZlVmak4mhcdW3Vzetq0k7rBmY4eWxyCkX9Q/nlh9fiQ9ZSxSgsy/liUs5mTWjb/cvBYl59qH+Zlk3XzGcfw+e6Wczyab3cuR7z5uiertquXobm0A2iG+KFfHbiS0r4DG1Pp/FOcCh8DC5uDDgULZJJmkNYk+DgfVk9JURnp85mb85ejzNhtMy0lSrbs5hOlBFAp5dlXGhSf5iAZ3A3PViKrhghCWIm79Eeb7R3XR7OnUsbExlT5ilD0c7GMaF36YA2umtXV1eLedRBuQz7l4JyTjaSy95Fze3ejzu+vY30DS6LL8Nifh2am9N6WsbZd1Od4/LY0Nf5FVie7XcJS8fLXPbiZKcnJkUREghfutBU5WKyWK9/2M4JwH+uyqpbLbNXdbnMzuvFKrmfjfO/8wOyLhb8A9M79v8WQrMsq/ZTOQuIbLk771IhRdpN593NXnhfjP6qO9AwK3eXC7+O3uCCu77Yviy7kPbB6VabDpMo23iepeNApY1bc69fpH4rxL1+6fp+eX++S48N4gcePJQP9c+PJ8snnuTZ6/F++Tw1L3l7RdteOPfm5P9Jor/n2bvLEBahWZRllbndElVPkShC+EcNgc7/+bQTdV1fhleI83VFS3vAoyuSKoerDF66ERul6eWv4zcXiUIxnLh9zM3SBjCu5KPjw8deYnP9ygOgGxrcL33fge96OEiy0SOJ1Yf6wfS7qPRgOxtiBqvScPyi7srF4CkvY4DADslcpNvd05/0tz0DXUQ+jzFr3+646MXzon9Rm0dtdp0cKB5Jwko/arqjaMQ3sdrh6QM93f4HskkADw==', 1526989054),
(8, 19, 'eNrdVl1zmzoQ/SsM72G0K4EEforr5PZ72iZz++hRQE24BeQBOW3a8X+/K2w3JPZgO4/1C7JWe85qdbRanSHLfneZxCysdOeuf5jGPXyynTPFq9YUpbPtm+belrn5uKxvTNtd2vbKuK1tqivd5Ob6YWHOm+K9aW7dXTjRGYGuugziLFzYritvKnNe22XjOm9U2e8yk5MiQ4ER4+ngh0xAisDjVKhESZmCQsEFU8g4YDwpM+z9gEbCjxgjBDb4AfCEXLmUCAkkDFPJUy5TpVCtERLy88RsSKwYMKEY56mSICEVMo0TpmJkMZMbR+4dWZQmTxxVwoFDgigVVzyVDBOWIMUhQUnvFvs4fcBAA/9l9GUTyg9nj/nZn+1BLuXu2t4MPpvoB/1Jqiz8VS7muS2Mt6KfgyQLW5Pb26b8ZYr5va6WZOwymp6egeLg/3iCzSJX2mbe5balVT5+T08CWdzZxsybPrKD2N6B4ZlEFiUQpXKUAmXPQen4pn++gIFUAMkxDCTIfNk5W5v2WBrpWVBJxFECED2ByEKd517qR2+DYhI8kjKKWcRJlxCNEvFeOgBZWN7o5lgWuubh9CKQSSDoagQx4xgwSONRKqG2x3JT5kfvh5a/+3IxC4huOh3F/wN/r09KFyFTnRABFypIEzaersSTkFUXRWu67nCmaP5tFFzUpamCD7autWldV2ndBMjG94PouUgCeekejrl9s9LcmnoUk8JfESgOSunMVOW9aR/e21z7xY9lAGgQn1oFiJlTdQ3OXx0KhMKgO2d+OtM2uppXG/55o+vDNEjAn5e6ccs6uLS6Dq5stezDD6bRv+OaF2KrlMIsdOtqeqUOEqZZ+FW35s4uOzN+ddWJEvHzr41pa91033VhAoF6nCE+RRgU+BfrKMmFHtdGutHG4BnZPB8z7cx2H5Q+EuY6ffQuyTOmzhD6tCJ/Ns9o3iOKHcRdseELxSZiBcE/079LbEBJuCwb3wwFQ7exyiReIDuqTF/vjKlM21ckNS47forsaAcfLImu/O/7oaq9etaQXC0Xi6p80q8gDFkGfaLHpmI2u5i+ud6+TI8L/7RBRV9Qyc5hr33YJoWTjx5IDRc+L5JrQJg8j2xwYcI9l2QtpZ3lT1FxZxvbhAzsOLRfW6erQUsM/mAoKwjUy4Qvao1X6ww4j3zlz6r7NNIu+seqVwdP9vqMvTFUePqHjsd7XUcKBnmzsUh3dLT6H0LNDhU=', 1504537010),
(9, 20, 'eNrdWNtu20YQ/RWCzzW7O3unn6LYadMmQRobzaNBS9uYjUQKJOXGCfzvPUNKNn0BbatvlQGKXu7czpyZWarISeQ/2txRni6Ltjv9J1bd1ce67eLidRMXZVc3b6vLupzHD5vVeWzaN3VzErvds1mxLKp5PL1ax1fV4l2svnQX6WGRy/xHmYtDKM5TKbUV5NLD6zaXJk/XdduW58v4alVvqq7l7Z63u8NFTpoyocLoQ0LLQFKZoL31zgXpSSstPAklyRyWOfVyEnea74SABjH6SKksRJVzJK2EK8GpoFzwnvygwUKODYuxYS+k0F4oFbyTTgbtgrHCGxJGuK2gYkGRBXtH0FsllbREziuvghNkhSX44aR3LGbYT3ZY4oa/Bb4F46PELT6P489wcc4grLyVimOWKpNSeu9vrhZuBtLwGStGe6WU1QDQBq0ApYIbfW4EkXdEKTukMufgtLq52mC8NEBBYiUACUVOIhgLRHfQSSG0toyDEhng5X1ExgurnfVkHDB13niNvEitvETmbMDVDuKOQuhj2EucBvMsTtkgZnZaBHlvgDiAR4wiCId0GOHBjV36SAeFYAZxbx2Htb1aC5i8hn6swJoXDqLQvGNNDx/sH8ABhk+pTAWwy++uCo7Bc0+WOWsdcuWQEnkvA0aSFvLn/6ICGugnsfOCY7XOYZdC4oVGNMY5JfC/sAjXOkOWgNOWjgMPOIlO9Cp0BrBu/8Bm77QxSjofUMfSaK2N1R4K71BpyOVWRbBGKL27sj/CQMhiBVhKx/wU2gBgaYZc9g6QZ3GTjSKAdZBaI5XEVeiRYNSzt4bVButHKADHAQWbjXOJK9MflnwIWIHPaCnAGFDdRWEgxFbFuJ481p0FFQX76D3CQE1bH7RRN2zgXgMMenGX3brP+QgObRDMcdxNwM9AaEYaPqDDjRwwwqihHF+uAe2IkNfgBunbSuKSMNYgahQQaskYiAkA6IJAs93WkhuMs7DPxoVESJBC4wMJLMofroA/ZKHZ7upwYM+esvBDerGHLM8T97BftjcDiPimn28+T7+X67N5vYh9A+U1afO0ifP6S1V+j4uzy2K5wcM2x/LsQKLY+R82sN3UlXV11s7rBru4h7N5jM31RV3Fs6rvzk/qZgFBB45EZmUW3KQJcr0NjIS/im97WBDcUp9jAUN5vmm7ehWb55oZz44JA1L3BnSeFvM5j/tnhwGfNE+kzIgM3VnIbNKQ6senlHlanhfVc61gkKaz48TZRGPgJWhWlKBRmklT2u/Scl7Onx0Ptv/+6fgogbnZbFL/jfrL4kVwQTNGtU6U9kmwYhouy0bwtFgsmti2TyOF9d+y5HhVxmXyvl6tith07bIoqoTEdDxEbAsUmJfd1XOq76iMX+JqUifcv4ZSGh0nj+KyvIzN1bt6XvDm2zYgcWNe2gVgWeGEmbx6/ZQjcAM1F791samK5dlya/+sKlZPmyEo/mNTVN1mlbypi1VyUi83vfvJLPtzmvNa75iyiOui6VY4uz9pMOTp56KJF/WmjdOl619IEV7/NcZmVVTt12IRE03FtAXzEmLA8U91B5AXxTQ3wpYbo6P09gh9VHRxFwfgI7UtTBwR3YHwB9zyeV3fWxeyf3kh/UDjQ7LRnmTTOGsnv8z+X2STAOFNWfErYjIWm+pMeg/aoTN9vohxGZu+I/lp2qmX0A4RvK9BuvLvr0917et7B5KTzXq9LLfvbDiGcPLk2Mro7Zl1o5kdHc/enu4m0+3Gm1fBRd9Q8VzJR5+PXxWHWId3RCj0Y4H7zXJQLA/vezgqnPSRYhko9WD7Xa30IJwdMKPnNH5+WnfFcvTzgOQEIWEGR5p0r18JrgcAOlZ8wilrP06cGnlm9SRR9lGZqVGD/tPPO2UeFZ3oG/wyPeXpAzpd/wvnDSLW', 1511433021),
(10, 21, 'eNrdWNtu20YQ/RWCzzW7O3unn6LYadMmQRobzaNBS9uYjUQKJOXGCfzvPUNKNn0BbatvlQGKXu7czpyZWarISeQ/2txRni6Ltjv9J1bd1ce67eLidRMXZVc3b6vLupzHD5vVeWzaN3VzErvds1mxLKp5PL1ax1fV4l2svnQX6WGRy/xHmYtDKM5TKbUV5NLD6zaXJk/XdduW58v4alVvqq7l7Z63u8NFTpoyocLoQ0LLQFKZoL31zgXpSSstPAklyRyWOfVyEnea74SABjH6SKksRJVzJK2EK8GpoFzwnvygwUKODYuxYS+k0F4oFbyTTgbtgrHCGxJGuK2gYkGRBXtH0FsllbREziuvghNkhSX44aR3LGbYT3ZY4oa/Bb4F46PELT6P489wcc4grLyVimOWKpNSeu9vrhZuBtLwGStGe6WU1QDQBq0ApYIbfW4EkXdEKTukMufgtLq52mC8NEBBYiUACUVOIhgLRHfQSSG0toyDEhng5X1ExgurnfVkHDB13niNvEitvETmbMDVDuKOQuhj2EucBvMsTtkgZnZaBHlvgDiAR4wiCId0GOHBjV36SAeFYAZxbx2Htb1aC5i8hn6swJoXDqLQvGNNDx/sH8ABhk+pTAWwy++uCo7Bc0+WOWsdcuWQEnkvA0aSFvLn/6ICGugnsfOCY7XOYZdC4oVGNMY5JfC/sAjXOkOWgNOWjgMPOIlO9Cp0BrBu/8Bm77QxSjofUMfSaK2N1R4K71BpyOVWRbBGKL27sj/CQMhiBVhKx/wU2gBgaYZc9g6QZ3GTjSKAdZBaI5XEVeiRYNSzt4bVButHKADHAQWbjXOJK9MflnwIWIHPaCnAGFDdRWEgxFbFuJ481p0FFQX76D3CQE1bH7RRN2zgXgMMenGX3brP+QgObRDMcdxNwM9AaEYaPqDDjRwwwqihHF+uAe2IkNfgBunbSuKSMNYgahQQaskYiAkA6IJAs93WkhuMs7DPxoVESJBC4wMJLMofroA/ZKHZ7upwYM+esvBDerGHLM8T97BftjcDiPimn28+T7+X67N5vYh9A+U1afO0ifP6S1V+j4uzy2K5wcM2x/LsQKLY+R82sN3UlXV11s7rBru4h7N5jM31RV3Fs6rvzk/qZgFBB45EZmUW3KQJcr0NjIS/im97WBDcUp9jAUN5vmm7ehWb55oZz44JA1L3BnSeFvM5j/tnhwGfNE+kzIgM3VnIbNKQ6senlHlanhfVc61gkKaz48TZRGPgJWhWlKBRmklT2u/Scl7Onx0Ptv/+6fgogbnZbFL/jfrL4kVwQTNGtU6U9kmwYhouy0bwtFgsmti2TyOF9d+y5HhVxmXyvl6tith07bIoqoTEdDxEbAsUmJfd1XOq76iMX+JqUifcv4ZSGh0nj+KyvIzN1bt6XvDm2zYgcWNe2gVgWeGEmbx6/ZQjcAM1F791samK5dlya/+sKlZPmyEo/mNTVN1mlbypi1VyUi83vfvJLPtzmvNa75iyiOui6VY4uz9pMOTp56KJF/WmjdOl619IEV7/NcZmVVTt12IRE03FtAXzEmLA8U91B5AXxTQ3wpYbo6P09gh9VHRxFwfgI7UtTBwR3YHwB9zyeV3fWxeyf3kh/UDjQ7LRnmTTOGsnv8z+X2STAOFNWfErYjIWm+pMeg/aoTN9vohxGZu+I/lp2qmX0A4RvK9BuvLvr0917et7B5KTzXq9LLfvbDiGcPLk2Mro7Zl1o5kdHc/enu4m0+3Gm1fBRd9Q8VzJR5+PXxWHWId3RCj0Y4H7zXJQLA/vezgqnPSRYhko9WD7Xa30IJwdMKPnNH5+WnfFcvTzgOQEGX7dwpkm3etngusBgY41n3DO2o8Tx0YeWj1LlH1UZmrWoAH1A0+ZR0UnGge/TU95+oBP1/8C5C0jBQ==', 1515054012),
(11, 22, 'eNrVV8tu20YU/RVCq3YhYt4PelPLadIUjpHWRrMUJtIkZiKRBkk5cQL/XL+s5w4lmY4NSXZWlYARNcN77uvcOzOhEKz43hZWFKNFaLuLL7Hqbt7WbRfnJ02cl13dvK6u63IWz1bL97FpX9bNeew2a5OwCNUsXtxcxeNqfhqrj93l6CgUvPheFuwIwMVIacssk6Oj27bguhhd1W1bvl/E42W9qrqWXtf0ujqaF0bnSrPBRzgluGVeSabwZVZJ5ZTyCZILfURqICdyehR41CpnfgghFWeGaS65gahjzgvuuPT0T1oSkxDjPJfaDz9Kcm2043iV4+uAAJWMaad9L8chJ3J/z2DGrTVSGyc9zBWaKaOMtQ42GOeVTkYjEpLdReLxSFNgKDuIjHdOCNLGde7Z8OuEk8oqbiSevbXMcA0bHRz2ehsiZfGuN2Suz53HG2ozGmvIKmEE81pKr70RFhhYEhpmJ3mOH6xCXrKcGy48k0Jox4yyxuE9oFunkSv4r6TjChZ4jAbiiQSsN2FEECZ3DmHl69FLssE6ZFRgyhtthrHqxXt5Elcs19orxdajQYaN455ZuOS1UAZ5Q+SVuq9/LJCaBMBzmI6YrUcAOKKZFxbp9iCaYM5qrTwxZgCBCE64/hmIPoyTBKFzCp/eRhMigghvFdHXg0MKBNUgINPKAG0N4cbkS4JAIBEjLG5GqSh24LHBjFXOWm4MftkA4Ow0BfP5AL08SwAuZ8idkOvRwQWivJdKWCudVlYK1E36l4qtRzgZc6F6BJ8bjRL1m1FqgeLmFt5rZr3DLCzwd+p9n4fnCfd1MHmecE+hf0lYs+dlT2Hi1eRNgkDDQXiYlqg0wTUCDgGUsJAOD4gll1Zogbow3PItxKdQwQyXIGSulZMO5YcWo7gH/xyKEf3RWHQMQgc7Qcv7GexZ2CQINNwhAlKvhHCaOGAV6A2jlBTeoTW4uwyO+3pKCBZ+CKPtZjSenDKUeUhqNE60Jvgj0b3dtqJ7GicOaLAIqtFO+hGaLLouoioNOpuRqGyr0E60XiPQTmIf9s92u/VwPHja2Dg2tqvLuorTKnXV1FTTgilGTZzVH6vyW5xPr8NiFUcwTQjqNpJnv7BfhVfZOLMuszwTklZJ61qqK+tq2s7qBmLYeWwyCk39Q/j607rUIbpkMYrLUC6mYT5vYtvuVweJsvpQ/zYLTdeU84/xS90s5vmsXu7Up9Rm656t2q5exuZQBzEN8oI+O/G5SPiqGIXZjM4Eh8JTcnFiwKZoUUzcHBI1jhi8D9VTUnR26mz2+uzVJGNG80xbLrM9ynQKmQDo7DKQomn9YYo4I3azg6noihGKgCp5D/fUhnvX4fDYueQYy5TIvMjQtLMJFfQuHogN79rV1dWiJB6EZdyvCsw52VAue0ec2+2PO7q9pfANDosv4qK8js3NaT0L9Pb9UlekHg59K68Q5fl+k6CaDnPZ8clOS0zKIigQv3axqcJiuljrP8xzAeC/VqHqVsvsZR2W2Xm9WCXzs0n+T35A1WH10PKm+T9ibJahaj+HeURmw+66S40UZTcru5u98L4Y/V13CMM87G4Xfp29wQF3fbB9EbqY/FDpVJs2E6It7WdjxsdMJ8eteXTeMnY3b2n7oF2Q5vkP88yly4ZQDyx4SB/RXz+eTB/aybNXk/30eWpdqu0RbXvg3FuT/yeK/pln7y5jXMRmEUKVud0UlU+hKFL4pgZBy0+fd6Ku+8vwCHG+7mjJB1y6KKh8qGVw0yVstKYXv09eX6QQsuGL28vcPDmAdckfXR9e9lI017c8ALqhwI+t7w74voWDIhs9UkB9qh+8fh9VPHBnE5iBVjFcv6i7sBhc5TklCAljOUuHu6ff6G/7AHQEfE4pa9/uOOfRdtFfqM2jMrs2DvSOxGCpHxXd0TPoSix3WPqATrf/AUv9/8k=', 1518082087),
(12, 23, 'eNrVV9tu20YQ/RVCT+2DiL1fqJdaTpOmcIy0NppHYSNtYiYSaZCUEyfwz/XLemYp2XRsSLLzVBtY01zO2ZkzZ2Z3QyFY8b0trChGy9B2519i1V2/rdsuLo6buCi7unldXdXlPJ6uV+9j076sm7PYbeemYRmqeTy/voxH1eIkVh+7i9EkFLz4XhZsAuBipLRllsnR5KYtuC5Gl3Xblu+X8WhVr6uupc81fa4mi8LoXGk2+BFOCW6ZV5Ip/DKrpHJK+QTJhZ7QMrATOT0KPGqVMz+EkIozwzSX3MDUMecFd1x6+k9aMpMw4zyX2g9/lOTaaMfxKcevAwKWZEw77Xs7DjuR+3sOM26tkdo46eGu0EwZZax18ME4r3RyGkxIdsfE40wTMZQdMOOdEyKtpnLJmPG+HwXc1NJbw8k5pj3IYkYo45UTeHbJTWU9896Quc+d15yp7WisIZ+EEQxA0mtvhAUYpoSG04lgjj+Yhb1kOTdceCaF0I4ZZY3Dd0C3TiNTiF5JxxVzxmM0ybx3PpmL3Hghmd2OEhQ5iWw65uE1h9OKW87VdvEkINYHMCIEkzuHlPDN6CVFAHMLpTjEo82Q5968tydzxXINkhTbjAbqMI57ZkGI13ABOUfW4EXvfQ8A8qZcJwCeI3Cr+GYEgCOJemEhFWQFHIB0rTypbQChxgLK+BmIPgnTBKFzIl/f5gImgorFKpK+h/4UxK0hXqaVIRUkiNOTxEWCAJHgCJPbUSriDjVg8MYqZy03Bn/ZAIC7MUXyfIDeAZYAXH4nBIwOIVC5QBTCWum0slJA1um/VKgJoddyT4PPjUZ5++0otUBj4BbRa2a9w1t44AfLH4+5UOx5xv3C/HnGff7/JWPNnpc9hRevpm8SBJoV6GFaok4F1yAcBt5aIR0ewCWXVmiBujCop1uIT6GCGy5ByFwrJx2KF+1JcTQT1LBl6K3GomAJHeqELO9nsFdhkyDQrIcIkvqPcJo0YFHCDk4pKbxDY3F3GRz3xZAQLOIQRtvtiJaAoAxlHpYaTdczh3jQ3PqGQHuIfdg529tNh+PB05bGsaVdXtRVnFWpn6Z2miZMMWrivP5Yld/iYnYVlus4gmtCUK+QPPuF/Sq8ysaZdZnlmZA0S6turLqyrmbtvG5ghj3HJqfQzj+Erz+9ljpkLVmM4iqUy1lYLJrYtvuXg0VZfah/m4ema8rFx/ilbpaLfF6vdq6n1HbTnq/brl7F5tAA8RrSQ/J34nOR8FUxCvM5nQYOhafk4qzAdW5RCtwcwhoHB+9D9ZQUnZ44m70+fTXNmNE805bLbM9iOlEmADq/CLTQrP4wA8/gbn6wFF0xktiUUYd7tKe22rsKh3PnUmAsUyLzIkPLzaZUjrt0ILa6a9eXl8uSdBBWcf9SUM7xVnLZO9Lc7njc5OaG6BscE1/EZXkVm+uTeh7o6/ulrmh5BPStvATLi/0uYWk6xmVHxzs9MSmLkED82sWmCsvZcrP+YZELAP+1DlW3XmUv67DKzurlOrmfTfN/8gOqDrOHlje9/yPGZhWq9nNYRGQ27K671EhRdvOyu94L74vR33UHGhZhd7vwm+wNjrabI+2L0MUUh0rnWWsmvWxpNxozPmY6BW7to++xs969t7R/0B5G78UP75lL1wyhHnjwUD6iv3g8WT60D2evpvvl89S6VLcntNsT596a/D9J9M88e3cR4zI2yxCqzO2WqHyKRJHCNzUEWn76vBN101+GR4izTUdLMeC6RaTy4SqDOy5hozW9+H36+jxRyIYf3l7jFikAzEv+6PzwmpfY3NzvAOiGBj+2vjvg+x4Oimz0SAH1qX7w+X1U8SCcLTGDVcVw/rzuwnJwieeUILAjeM7SEfvpl/mbnoGOkM8oZ+3bHQc92i/6u7R51GbXzoHmkSQs9aOmO5oG3YflDk8f6OnmP565/u0=', 1515742802),
(13, 24, 'eNrdWN9T20YQ/lc0fi7q3d5v8YQDadMmnTQwzSMj7GtQY0uMJNOQDP97v5VkLAIjwHmrmZHF6fbbve++3T05z0hk35rMUTZb5U179m8s25v3VdPG5as6Lou2qt+U11WxiH9s1hexbl5X9Wlst8/m+SovF/Hs5ioelcu3sfzUXs4O80xm34pMHAI4m0mprSA3O7xtMmmy2VXVNMXFKh6tq03ZNjzd83R3uMxIUypUGH1IaBlIKhO0t965ID1ppYUnoSSZwyKjzk7iTvOdEEAQo4+UysJUOUfSSoQSnArKBe/J9wgWduxYjB17IYX2QqngnXQyaBeMFd6QMMINhooNRRrsPUNvlVTSEjmvvApOkBWWEIeT3rGZ4Tg5YIkb/hb4FsyPEjt+Huef6eI9gzHzqhhCpN5pRLS72qCMVAEutVSgRCsviCxoJKMCojH93mDQO6IZB6RS5xC0urvaYLw0YEFiJIAJRU5iMRaMbqmTjkJQTLwSKejleYQYhNXOejIOnDpvvEYQElFI7JwNuNreHKFpq/Y1p96ezSntzcwWRZD3BoyDeKxRBOGwHUZ4aGO7faSDwmJ6c28dL2u4WgvFeQ18jMCbFw6mQN6qpqdPpoD3TJ9SKfiGQLZXhcAQuSfLmrUO5LsAnQatAK3cAGEkaSF//hEIsHAAGn4EAkHQT2ILwXRZB+lARUgBDUKMc0rgf2HBmHWGLIHqQdE9F7yRTnQQOgXfuz8kBERpjJLOB5QCabTWxmoPwHEUolfTABGsEUpvrxyPMDCyGMF2SMQAaG2wR9L0cugCIM/mJh2tAN6l9xpqIE5kD42gJHhrGDZYP2IBW9GzYNOxHHBVyuKp8SFgBDGjKoFjUHWfhV5TA4T3Xko5XDHuLNQsOEbvsQyUBeuDNmonKCOM6vNRuXQXPu9HcMh4iM9xQYLEA6GeacSAIjkKQHQs7oeAikbY1+B6610yclYZa7Bq5CDS0RiYCRDoghBDQUEF78NnY5+Oc5GwQQq1EyKwqCAIBfohC2S7TWVASS/EHrbcVtzDstnc9SHim67N+Wz2tbg6X1TL2NVRHpM2m9VxUX0qi69xeX6drzZ42GQYnh9I5Dz/ww6GSW1RlefNoqoxi0s5u0f3vLqsynhedkX6SWw2EHTgSKRWpsFNuiDX+UBn+Dv/socHwZX1OR7Qmxebpq3WsX6um3ELmXAgdedAZ7N8seCu/+xlICbNjSk1IkWRRsGddKS6LiplNisu8vK5XtBPZ/OTxNlEo+8lKDiUoNiZSVfab7flolg8ez2Y/vuHk+ME7ubzSfw7+Ov8RXQBGR1bJ0r7JFgxTZdlJ3iaL5d1bJqnmcL4b2lysi7iKnlXrdd5rNtmledlQmJ6PUTsCxJYFO3Nc7LvuIif4noSE+HfApRGp8rjuCquY33ztlrkPHlXBiRuzEurADwrHLKSo1dPBYIwkHPxSxvrMl+drwb/52W+ftoNAfjPTV62m3XyusrXyWm12nThJ/P0r2nNa71VyjJe5XW7xhH+SYchm33M63hZbZo4nbr+hRLh8V9jrNd52XzOlzHRlE97MC8RBgL/ULUgeZlPayMM2hidqIeT9HHexu06QB+pITH5KHcg5IFQHa2kHxlnRP0A8aHYaE+xaRy5k1/m/y+xSZDwuij5TTEZm01VJr2H7FCZPl7GuIp1V5H8tOzUS2SHFbyrILrin89PVe3b7w4kp5urq1UxvLrhGMKbJ8deRi/RjI1idnwyf3O27Uy7iXdvhMuuoOK5ko8+H78xdmsdXhUB6McG3xfLHribdw94lDizR5Kil9SD6fdR6cFytsSMntP4+VnV5qvRrwSSN8jw+w7ONLO9fi247RloGfmU96x5P3Fs5KbVqUTZR22meg0KUNfwlHnUdKJw8FvxVKQP9HT7H924JDg=', 1519587772),
(14, 25, 'eNrdWE1z2zYQ/SscnWsWWHzTpyh22rRJJ409zdFDS2jMRiI1JOXGyfi/9y1JWUzsoW3lVnmGokHs28XD211QeUYi+9pkjrLZKm/a839j2d68q5o2Ll/WcVm0Vf26vK6KRfxju76MdfOqqs9iu3s2z1d5uYjnN5v4oly+ieXH9mp2nGcy+1pk4hjA2UxKbQW52fFtk0mTzTZV0xSXq/hiXW3LtuHpnqe742VGmlKhwuhDQstAUpmgvfXOBelJKy08CSXJHBcZdXYSd5rvhACCGH2kVBamyjmSViKU4FRQLnhPvkewsGPHYuzYCym0F0oF76STQbtgrPCGhBFuMFRsKNJgvzH0VkklLZHzyqvgBFlhCXE46R2bGY6TA5a44W+Bb8H8KLHn52H+mS7eMxgzr4pXL1LvNCLaX21QRqoAl1oqUKKVF0QWNJJRAdGYfm8w6B3RjANSqXMIWt1dbTBeGrAgMRLAhCInsRgLRnfUSUchKCZeiRT08jxCDMJqZz0ZB06dN14jCIkoJHbOBlxtb47QtFWHmlNvz+aU9mZmhyLIewPGQTzWKIJw2A4jPLSx2z7SQWExvbm3jpc1XK2F4rwGPkbgzQsHUyDvVNPTJ1PAe6ZPqRR8QyC7q0JgiNyTZc1aB/JdgE6DVoBWboAwkrSQP/8IBFg4Ag0/AoEg6Cexg2C6rIN0oCKkgAYhxjkl8L+wYMw6Q5ZA9aDongveSCc6CJ2C7/0fEgKiNEZJ5wNKgTRaa2O1B+A4CtGraYAI1gild1eORxgYWYxgOyRiALQ22CNpejl0AZBnc5OOVgDv0nsNNRAnsodGUBK8NQwbrB+xgK3oWbDpWA64KmXx1PgQMIKYUZXAMaj6loVeUwOE915KOVwx7izULDhG77EMlAXrgzZqLygjjOrzUbl0Hz7vR3DIeIjPcUGCxAOhnmnEgCI5CkB0LB6GgIpG2Nfgeut9MnJWGWuwauQg0tEYmAkQ6IIQQ0FBBe/DZ2OfjnORsEEKtRMisKggCAX6IQtku0tlQEkvxAG23Fbc/bLZ3PUh4puuzfls9qXYXCyqZezqKI9Jm83quKg+lsWXuLy4zldbPGwyDM+PJHKe/2EHw6S2qMqLZlHVmMWlnN2je26uqjJelF2RfhSbDQQdORKplWlwky7IdT7QGf7OPx/gQXBlfYoH9ObFtmmrdayf6mbcQiYcSN050NksXyy46z95GYhJc2NKjUhRpFFwJx2protKmc2Ky7x8qhf009n8NHE20eh7CQoOJSh2ZtKV9rttuSwWT14Ppv/+/vQkgbv5fBL/Dv46fxZdQEbH1onSPglWTNNl2Qme5stlHZvmcaYw/luanK6LuEreVut1Huu2WeV5mZCYXg8R+4IEFkV785TsOynix7iexET4twCl0anyJK6K61jfvKkWOU/elwGJG/PcKgDPCgfN5MXLxwJBGMi5+LmNdZmvLlaD/4syXz/uhgD85zYv2+06eVXl6+SsWm278JN5+te05rXeKWUZN3ndrnGEf9RhyGYf8jpeVdsmTqeuf6ZEePzXGOt1Xjaf8mVMNOXTHsxzhIHA31ctSF7m09oIgzZGJ+rhJH2St3G3DtBHakhMPsodCXnE5yAe1w+MM6K+h3hfbHSg2DSO3Mkv8/+X2CRIeFWU/KaYjM2mKpM+QHaoTB+uYlzFuqtIflp26jmywwreVhBd8c+nx6r27XcHkrPtZrMqhlc3HEN48+TYy+glmrFRzE5O56/Pd51pP/HujXDZFVQ8V/LB5+M3xm6tw6siAP3Y4Pti2QPL4+8jHCXO7IGk6CV1b/q3qHRvOTtiRs9p/Py8avPV6FcCyRtk+H0HZ5rZQb8W3PYMtIx8xnvWvJs4NnLT6lSi7IM2U70GBahreMo8aDpROPiteCrSe3q6/Q/6YCQ9', 1515742442),
(15, 26, 'eNrdWE1z2zYQ/SscnWsWWHzTpyh22rRJJ409zdFDS2jMRiI1JOXGyfi/9y1JWUzsoW3lVnmGokHs7sPD211QeUYi+9pkjrLZKm/a839j2d68q5o2Ll/WcVm0Vf26vK6KRfxju76MdfOqqs9iu3s2z1d5uYjnN5v4oly+ieXH9mp2nGcy+1pk4hiOs5mU2gpys+PbJpMmm22qpikuV/HFutqWbcPTPU93x8uMNKVChdGHhJaBpDJBe+udC9KTVlp4EkqSOS4y6uwk7jTfCQEPYvSRUlmYKudIWgkowamgXPCefO/Bwo4Di3FgL6TQXigVvJNOBu2CscIbEka4wVCxoUiD/cbQWyWVtETOK6+CE2SFJeBw0js2M4yTAUvc8LfAt2B+lNjz8zD/TBfvGYyZV8UQROqdBqL91QZlpAoIqaUCJVp5QWRBIxkVgMb0e4NB74hmDEilzgG0urvaYLw0YEFiJCCUIiexGAtGd9RJRyEoJl6JFPTyPAIGYbWznowDp84brwFCAoXEztmAq+3NAU1bdag59fZsTmlvZnZeBHlvwDiIxxpFEA7bYYSHNnbbRzooLKY399bxsoartVCc1/CPEUTzwsEUnneq6emTKdx7pk+pFHxDILurAjAg92RZs9aBfBeg06AVXCs3uDCStJA//4gLsHAEGn7EBUDQT2LngumyDtKBipACGoQY55TA/8KCMesMWQLVg6J7Lngjnehc6BR87/+QEBClMUo6H1AKpNFaG6s9HI5RiF5Ng4tgjVB6d2U8wsDIYgTbIYEBrrXBHknTy6EDQJ7NTTpaAaJL7zXUQJzIHhpBSfDWsNtg/YgFbEXPgk3HcsBVKYunxoeAEWBGVQLHoOpbFnpNDS6891LK4YpxZ6FmwRi9xzJQFqwP2qi9oIwwqs9H5dI9fN6P4JDxEJ/jggSJB0I908CAIjkCIDoWD/OAikbY1+B6630yclYZa7Bq5CDS0RiYCRDoghBDQUEF7+GzsU/HuUjYIIXaCRFYVBBAgX7IwrPdpTJcSS/EAbbcVtz9stnc9SHim67N+Wz2pdhcLKpl7Oooj0mbzeq4qD6WxZe4vLjOV1s8bDIMz48kcp7/4QDDpLaoyotmUdWYxaWcw6N7bq6qMl6UXZF+1DcbCDpyJFIr0+AmQ5DrYqAz/J1/PiCC4Mr6lAjozYtt01brWD81zLiFTASQugugs1m+WHDXf/IygElzY0qNSFGkUXAnA6mui0qZzYrLvHxqFPTT2fw0cTbR6HsJCg4lKHZmMpT2u225LBZPXg+m//7+9CRBuPl80v+d++v8WXTBMzq2TpT2SbBimi7LQfA0Xy7r2DSPM4Xx39LkdF3EVfK2Wq/zWLfNKs/LhMT0eog4FiSwKNqbp2TfSRE/xvWkT8C/hVManSpP4qq4jvXNm2qR8+R9GZC4Mc+tAoiscNBMXrx8DAhgIOfi5zbWZb66WA3xL8p8/XgYguM/t3nZbtfJqypfJ2fVatvBT+bpX9Oa13qnlGXc5HW7xhH+0YAhm33I63hVbZs4nbr+mRLh8V9jrNd52XzKlzHRlE9HMM8RBoC/r1qQvMyntREGbYxO1MNJ+iRv424doI/UkJh8lDsS8ojPQTyuHxhnj/qex/tiowPFpnHkTn6Z/7/EJkHCq6LkN8VkbDZVmfQBskNl+nAV4yrWXUXy07JTz5EdVvC2guiKfz49VrVvvzuQnG03m1UxvLrhGMKbJ8dRRi/R7BvF7OR0/vp815n2E+/eCJddQcVzJR98Pn5j7NY6vCrCoR8bfF8se8fy+HuEo8SZPZAUvaTuTf/WK91bzo6Y0XMaPz+v2nw1+pVA8gYZft/BmWZ20K8Ftz0DLXs+4z1r3k0cG7lpdSpR9kGbqV6DAtQ1PGUeNJ0oHPxWPIX0np5u/wMMTCQ/', 1515742442),
(16, 27, 'eNrdWEtz2zYQ/isc3s0AWDzpkxU7jzbppLGnaU8eWkJjNhKpISk3Tsb/vR9ASmZsD21Ht+oArfD49r0LqMgFy7+3uRF5uiza7uxfX3XXH+q284uXjV+UXd28ra7qcu5/26wufNO+qptT323XZsWyqOb+7Hrtj6rFO1997i7TwyLn+fcyZ4cAzlPOpWbCpIc3bc5Vnq7rti0vlv5oVW+qrg3bgxBlzt3hIieuRKYO8cvil9BMZaTd7mMds5ppUsYaIa0GuGLcKeIiHjI4pKTJuHCjj5JKKKGl45wUKWs5kzjNpLYmHqPAqydFJCmQPJI8kCwK40C6SBlQvYDhkI6UAKV6oUHJQKmwL4KrsBqxZZiL0DJCxyOMZYzY6ANJtdWWjBFccxjQGXJknLXCDroGDpJlTo9VtVYTJ66FMJYsOcMgjhbAM3xQNkobWAelwncwGgvuIXbrnofdP/JWcCsFG7DMGgmZbkftSHGCtUETdJNkmRAaxheKHMRRfWhgEm4UaRCIMmMgNe1G7ZTlCp7imHGMiOALaAOf09YGQjrS0U8kMqtNWBlGjSBxVnKGgDFgaZlhFmGys2AvAc9gGxskIMogssamYSSJ+ECwwNuOAwTyGwenOUmAJjNAKC4k4y/2gegRZITQ2VgLjEQaq8o6hxmc4U4A3ZqdSwdTRlMMEBYhzvkwYt5oZ4IBBKacVogIbZ3ss2ZI0r8wy+JxmzGnDVwHL8qgilTgBJobFTLJKAEXkITzFFd6BGHF/hD7SwFN95bC7Q3h9rXFi+jSACF5dhtSGI0z2K21lEbYkBbKOOkswoKNAPqYcgPAOD1RERiSQAonjEZgEaohs0Eah8ohb/PzT0aCpN0HgvV6RAhkh4LUtB2Jc1jEcBQ4pWEWoCDRhUDFM07vQvs1fwNbRmNKl4VSICAE07CjZlxK2A2a4zdsqsg62FVyxcaFxrIXQZABQmNRuu2IooQqGQ6hlaDAYlb/wJ9RFsrEsw+HfmfuF9R21yBFIGL/DX1xvmm7euWb8yqW2lhp45rO08bP689V+c0vzq+K5cand+pnz2nY1ZV1dd7O6wbbYpuAIDZPv5Xr83m98I8CY3p2wFErJ3F7/XBvWF/WlX+q0OEAEwdGsEzzzJlJFsJEHmhKfxdff4IDmirXT+Eg87SYz8N15Mlc4DAZWlamWIbegwCZZESxv3Kep+VFUT2VCzptOjtJjE4kOmKCmBNJuO1MspJ2a7WLcv5kfbD9148nxwnYzWaT+Dv4q+JZ5gIyerlMUFASp9m0uXRggtVisWh82z5uKcz/kiUnq9Ivk/f1alX4pmuXRVElgk3rI0TghRCYl931U5LjuPSf/WoSE+LfAFSMrrvHflle+eb6XT0vwubbMsBBqMDzOUkKzsSIJ0cvHxMEYiAl/NfON1WxPF8O/M+rYvU4GwHg3zdF1W1Wyau6WCWn9XITxU9m2R/TMS/lNlIWfl003Qpvi0cZujz9VDT+st60frqu2WeGSJh/432zKqr2S7HwiRTFNAf1nMCA4B/rDkZeFNOx4YbYGN21hzv2cdH5rR4wn6AhMcMN9YDxA0bRrEI+MB8Q5T3E+8EmfjLYJC7jyevZ/yvYOIzwqqzCEzYZH5uqTPInwg6V6dOl90vfxIpkp8OOnhN20OB9jaAr//nyWNW+uXMhOd2s18tyeNThGhKcx8dcRq/7gI1idnwye3u27Uy3G3dvxUUsqFgn/uD6+C0ZdR0ekQC04wN3i2UPzA/vSjhKnPSBpOhD6t72H1HFPXW2hhmti/H6Wd0Vy9HfFzw4CNYRuKf3d/7+T4ybXq0ubD8Njmg/TNwFQyeKrif94JmpBoKqErsYqQePTlSD8N/GlKT3guTmP3XzQEY=', 1515747635),
(17, 28, 'eNrdWNty2zYQ/RUOn2N2cQfopyh22rRJJ409zaOHltCYjURqSMqNk/G/9wAkLSb20Lb6VnmGhgjs2dvZBaAi55R/a3PD83RdtN35P77qbt7XbedXrxq/Kru6eVNd1+XS/77bXPqmfV03Z74b5xbFuqiW/vxm619Wq7e++tRdpcdFzvJvZU7HAM5TxqQmbtLj2zZnKk+3dduWl2v/clPvqq4Ny4MRZc7c8SoXTPFMHeObxTeuSWVCu7uPdWQ1aaGMNVxaDXBFzCnBeBQyEFLSZIy7yUdJxRXX0jEmlFDWMpKQJqmtiWIi6OqHPA5FGLI4ZGFI0RiHoYsjg1FvYBDSccQxUr3RGMkwUmFdBFdhNmLL8C5CywgdRYgyEjT5wFJttRXGcKYZAuiMcMI4a7kdfA0aJGVOT121VgsmmObcWGGFMwRzNAeeYYOz0dqgOjgV/oegUUiPoH16Hk7/mK2Y2ZCrF4rS6HOmjJAIx/gUiJzTFprxBhZrJpnWXDmjlR6ShSSJ4IWgDE5yR4JzZUlLA0FlyDljlZWIDpPCMoncOzwHcSIptThUnPfyQZxnvZgaUYhbqxAvGM8tcMggmIosMmRi9KP7gZwvhEl7CO24IDM+hSQslzCAHJcaUFIiA0zCrgkCoyMYERFEJhzybMengHGw3oJrjlltNEP2QRknhVBgwgChGJfEfvovEDGMJqZRyAze7v9AJmukQnkZVB4yqqSUSkvL3PcQfS4HCKcVwffhqY2RpCCk8YZbLFUc0FJJRmygQjSAh4ISCuKQgAIlwWBkwUrkIrBJWmQIZWG1CrAuVm/fY2IQ+kDqzDDB4e74FEJjVlnn8AY2M8cRIOR1rIneBUUK/IkQJtvrJ5jjYuYsQ/mZwBDHUZToJqg8PkGgGIbDENAmOJeojl56z+VASqUVzAaFwWalIEaIgHFEwg1s7ksp9BdhsymVUXhgJNiMtDF0EW3QqLgGsh4rwfSuHySreqsPkg3eMkuHyfaMOczmqPYQvWEHM/dbZHu35fEwiO0x7HTLXdvVG99cVLF5xt4Z53SeNn5Zf6rKr351cV2sdz4dOMTRcAILe03Dqq6sq4t2WTdYFhs/DLF5+rXcXizrlX8UGK8XR8wKNovb+4eTwPaqrvxTjQ4CxI8Mp0yzzJlZFdxEHdhm/iq+HKCBQqd/igaZp8VyGQ4YT9aChEmRGZMpytDPiWWzikTcMRnL0/KyqJ6qBXtnujhNjE4ktvYEHZIn4fwyq0raMWqX5fLJ/mD5bx9OTxKoWyxm8e/gr4tnhQvIJJlMhLSJ0zQfLh2UYLZYrRrfto9HCu9/zZLTTenXybt6syl807XroqgSTvP+cB50gQLLsrt5SnGclP6T38xiwvxbgPLJAfbEr8tr39y8rZdFWLxvAwwDFXQ+p0jDgYoES16+eswQmIGS8F8631TF+mI96L+ois3jajiA/9gVVbfbJK/rYpOc1etdND9ZZH/Oc17KkSkrvy2aboPbwqMKXZ5+LBp/Ve9aP9/X7DMpEt7/4n2zKar2c7HyieTFvAb1HGLA8A91hyCvinluuIEbk9PzcGo+KTof/cCeEFbIeyvuk4cfSB6pLEt+Xvy/yMMQhNdlFS6ZyVRsrtPIA2iETvPxyvu1b2KHsfM0Es+hETx4V4NE5d+fH+vCtz8cMM522+26HK5dA4XYVMvk/h2w0ZxOThdvzsedZr/w7ja3ig0S84I9OD+97UVfw+1d2ABopwI/Nr8emB3/aOGkEMZdCbcqe0TsiMRIqXvLv0fl99wZAzOZ59P587or1pMfGFhIkAoXLhwh0v3PDLe9W11YfhYS0b6fOduFnSWmXugHZeY2BHSJuCsJ9aDoTDcIN905S++R5PZfUmsscQ==', 1515747635);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_dimension_administration_relations`
--

CREATE TABLE IF NOT EXISTS `ipro_dimension_administration_relations` (
  `dimension_administration_relation_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_id` int(1) unsigned NOT NULL,
  `administration_id` int(1) unsigned NOT NULL,
  `relation` enum('MANDATORY','NOT_ALLOWED','OPTIONAL') NOT NULL,
  PRIMARY KEY (`dimension_administration_relation_id`),
  KEY `administration_id` (`administration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_dimension_value_dimension_relations`
--

CREATE TABLE IF NOT EXISTS `ipro_dimension_value_dimension_relations` (
  `dimension_value_dimension_relation_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_value_id` int(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `relation` enum('MANDATORY','NOT_ALLOWED','OPTIONAL') NOT NULL,
  PRIMARY KEY (`dimension_value_dimension_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_dimension_value_relationships`
--

CREATE TABLE IF NOT EXISTS `ipro_dimension_value_relationships` (
  `dimension_value_relationship_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `lead_dimension_1_type` enum('INVOICE_LOCATION','INVOICE_TYPE') NOT NULL,
  `lead_dimension_1_id` int(1) unsigned DEFAULT NULL,
  `lead_dimension_1_value` enum('CUSTOM','PO') DEFAULT NULL,
  `lead_dimension_2_type` enum('CURRENCY') DEFAULT NULL,
  `lead_dimension_2_id` int(1) unsigned DEFAULT NULL,
  `dimension_value_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`dimension_value_relationship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_dummy_table`
--

CREATE TABLE IF NOT EXISTS `ipro_dummy_table` (
  `dummy_id` bigint(1) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ipro_dummy_table`
--

INSERT INTO `ipro_dummy_table` (`dummy_id`) VALUES
(23);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_electronic_invoices`
--

CREATE TABLE IF NOT EXISTS `ipro_electronic_invoices` (
  `electronic_invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_electronic_invoice_id` int(1) unsigned NOT NULL,
  `creditor_invoice_number` varchar(50) DEFAULT NULL,
  `supplier_id` int(1) unsigned DEFAULT NULL,
  `creditor_id` int(1) unsigned DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `administration_id` int(1) unsigned DEFAULT NULL,
  `invoice_location_id` int(1) unsigned DEFAULT NULL,
  `delivery_location_id` int(1) unsigned DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `balance_type` enum('CREDIT','DEBIT') NOT NULL,
  `payment_method` enum('DEFAULT','DIRECT_DEBIT','MANUAL','NORMAL') NOT NULL,
  `add_date` int(1) unsigned DEFAULT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `contains_warnings` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`electronic_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_electronic_invoice_lines`
--

CREATE TABLE IF NOT EXISTS `ipro_electronic_invoice_lines` (
  `electronic_invoice_line_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_id` int(1) unsigned NOT NULL,
  `purchase_order_id` int(1) unsigned DEFAULT NULL,
  `line_type` enum('CALCULATION_DIFFERENCE','DEPOSIT','PRODUCT') NOT NULL,
  `product_id` int(1) unsigned DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` decimal(12,4) unsigned NOT NULL,
  `price` decimal(17,4) NOT NULL,
  `vat_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `vat_amount` decimal(17,4) DEFAULT NULL,
  `cost_center_id` int(1) unsigned DEFAULT NULL,
  `project_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`electronic_invoice_line_id`),
  KEY `electronic_invoice_id` (`electronic_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_electronic_invoice_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_electronic_invoice_line_dimension_values` (
  `electronic_invoice_line_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_line_id` int(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`electronic_invoice_line_dimension_value_id`),
  KEY `electronic_invoice_line_id` (`electronic_invoice_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_electronic_invoice_warnings`
--

CREATE TABLE IF NOT EXISTS `ipro_electronic_invoice_warnings` (
  `electronic_invoice_warning_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_id` int(1) unsigned NOT NULL,
  `electronic_invoice_line_id` int(1) unsigned DEFAULT NULL,
  `number` int(1) unsigned NOT NULL,
  `field` enum('ACCOUNTING_PERIOD','ADMINISTRATION','AMOUNT_EXCL_VAT','AMOUNT_INCL_VAT','BALANCE_TYPE','COST_CENTER','CREDITOR','CREDITOR_INVOICE_NUMBER','DELIVERY_LOCATION','DESCRIPTION','DIMENSION_VALUE','GENERAL_LEDGER_ACCOUNT','INVOICE_DATE','INVOICE_LOCATION','JOURNAL','PAYMENT_CONDITION','PAYMENT_METHOD','PAYMENT_TERM','PRICE','PRODUCT_CODE','PRODUCT_NAME','PROJECT','QUANTITY','SUPPLIER','VAT_CODE','VAT_PERCENTAGE') DEFAULT NULL,
  PRIMARY KEY (`electronic_invoice_warning_id`),
  KEY `electronic_invoice_id` (`electronic_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_electronic_invoice_warning_arguments`
--

CREATE TABLE IF NOT EXISTS `ipro_electronic_invoice_warning_arguments` (
  `electronic_invoice_warning_argument_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_invoice_warning_id` int(1) unsigned NOT NULL,
  `position` int(1) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`electronic_invoice_warning_argument_id`),
  KEY `electronic_invoice_warning_id` (`electronic_invoice_warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoices`
--

CREATE TABLE IF NOT EXISTS `ipro_invoices` (
  `invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) NOT NULL,
  `supplier_id` int(1) unsigned DEFAULT NULL,
  `creditor_id` int(1) unsigned DEFAULT NULL,
  `creditor_bank_account_id` int(1) unsigned DEFAULT NULL,
  `creditor_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_location_id` int(1) unsigned DEFAULT NULL,
  `delivery_location_id` int(1) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `currency_id` int(1) unsigned DEFAULT NULL,
  `default_currency` char(3) DEFAULT NULL,
  `supplier_currency` char(3) DEFAULT NULL,
  `exchange_rate_supplier_currency` decimal(10,6) unsigned DEFAULT NULL,
  `creditor_currency` char(3) DEFAULT NULL,
  `exchange_rate_creditor_currency` decimal(10,6) unsigned DEFAULT NULL,
  `exchange_rates_date` int(1) unsigned DEFAULT NULL,
  `amount_excl_vat` decimal(15,2) DEFAULT NULL,
  `amount_incl_vat` decimal(15,2) DEFAULT NULL,
  `payment_condition` enum('AFTER_RECEIPT','DOWN_PAYMENT','PREPAYMENT') NOT NULL,
  `payment_term` int(1) unsigned DEFAULT NULL,
  `payment_method` enum('DIRECT_DEBIT','MANUAL','NORMAL') NOT NULL,
  `invoice_type` enum('AO','CUSTOM','PO') NOT NULL,
  `balance_type` enum('CREDIT','DEBIT') NOT NULL,
  `year` year(4) NOT NULL,
  `administration_id` int(1) unsigned DEFAULT NULL,
  `journal_id` int(1) unsigned DEFAULT NULL,
  `accounting_period_id` int(1) unsigned DEFAULT NULL,
  `rejection_reason_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_id` int(1) unsigned DEFAULT NULL,
  `electronic_invoice_id` int(1) unsigned DEFAULT NULL,
  `original_accounting_robot_result_id` int(1) unsigned DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADVISE_APPROVAL','ADVISE_REJECTION','ANALYSE','APPROVE','ASSIGN_APPROVER','ASK_FOR_ADVICE','CANCEL','CREATE','DELEGATE','DISCARD_RESULTS_ACCOUNTING_ROBOT','ENRICH_WITH_ACCOUNTING_ROBOT','LINK_CREDIT_INVOICE','LINK_DEBIT_INVOICE','MARK_AS_AWAITING_CREDIT_INVOICE','MARK_AS_CONFIDENTIAL','MARK_AS_ON_HOLD','POST','PROCESS','PROCESS_RESULTS_ACCOUNTING_ROBOT','RECEIVE_RESULTS_ACCOUNTING_ROBOT','REJECT','SAVE','SEND_ADVICES','SEND_DECISIONS','SET_BACK_TO_CONCEPT','SET_BACK_TO_STEP_2','SET_BACK_TO_STEP_3','UNLINK_CREDIT_INVOICE','UNLINK_DEBIT_INVOICE','UNMARK_AS_AWAITING_CREDIT_INVOICE','UNMARK_AS_CONFIDENTIAL','UNMARK_AS_ON_HOLD','WF_SET_INVOICE_STATUS_TO_APPROVED','WF_SET_INVOICE_STATUS_TO_CANCELLED','WF_SET_INVOICE_STATUS_TO_REVIEW','WF_UNMARK_AS_IN_PROCESS_IN_WORKFLOW','ADD_TO_PAYMENT_PROCESS','RELEASE_FROM_PAYMENT_PROCESS') NOT NULL,
  `source` enum('INVOICE_APPROVAL','INVOICE_MANAGER','INVOICE_SCAN_BATCH_DETAILS','INVOICE_SCAN_MANAGER','INVOICE_SHARING','ORIGINAL_ACCOUNTING_ROBOT_RESULT_PROCESSING_CRON','STEP_3','STEP_4','STEP_5','STEP_MANAGER','WORKFLOW','PAYMENT','INVOICES_INCORRECTLY_MARKED_AS_IN_PAYMENT_PROCESS_CORRECTION_CRON') NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `approver_id` int(1) unsigned DEFAULT NULL,
  `advisor_id` int(1) unsigned DEFAULT NULL,
  `status` enum('APPROVED','AWAITING_ACCOUNTING_ROBOT','AWAITING_APPROVAL','CANCELLED','CONCEPT','CREATED','POSTED','PROCESSED_RESULTS_ACCOUNTING_ROBOT','RECEIVED_RESULTS_ACCOUNTING_ROBOT','REVIEW') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `awaiting_credit_invoice` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `enriched_by_accounting_robot` tinyint(1) unsigned NOT NULL,
  `in_payment_process` tinyint(1) unsigned NOT NULL,
  `in_process_in_workflow` tinyint(1) unsigned NOT NULL,
  `on_hold` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `creditor_id` (`creditor_id`),
  KEY `invoice_location_id` (`invoice_location_id`),
  KEY `status` (`status`),
  KEY `invoice_scan_id` (`invoice_scan_id`),
  KEY `accounting_period_id` (`accounting_period_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ipro_invoices`
--

INSERT INTO `ipro_invoices` (`invoice_id`, `invoice_number`, `supplier_id`, `creditor_id`, `creditor_bank_account_id`, `creditor_invoice_number`, `invoice_date`, `invoice_location_id`, `delivery_location_id`, `description`, `currency_id`, `default_currency`, `supplier_currency`, `exchange_rate_supplier_currency`, `creditor_currency`, `exchange_rate_creditor_currency`, `exchange_rates_date`, `amount_excl_vat`, `amount_incl_vat`, `payment_condition`, `payment_term`, `payment_method`, `invoice_type`, `balance_type`, `year`, `administration_id`, `journal_id`, `accounting_period_id`, `rejection_reason_id`, `invoice_scan_id`, `electronic_invoice_id`, `original_accounting_robot_result_id`, `date`, `user_id`, `user_action`, `source`, `remark`, `approver_id`, `advisor_id`, `status`, `revision_id`, `revision_hash`, `awaiting_credit_invoice`, `confidential`, `enriched_by_accounting_robot`, `in_payment_process`, `in_process_in_workflow`, `on_hold`) VALUES
(7, 'INV2017000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1528371498, 2, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 3, '1556132125', 0, 0, 0, 0, 0, 0),
(8, 'INV2017000002', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, 1.06, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 11, NULL, 11, NULL, NULL, 1510672967, 2, 'SAVE', 'STEP_4', '', NULL, NULL, 'CONCEPT', 2, '1138875283', 0, 0, 0, 0, 0, 0),
(9, 'INV2017000003', NULL, NULL, NULL, NULL, '2017-02-07', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24800.00, 24800.00, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 12, NULL, NULL, NULL, NULL, 1523525346, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1436212813', 0, 0, 0, 0, 0, 0),
(10, 'INV2017000004', 1, 1, 1, '4570703', '2017-04-23', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 19, NULL, NULL, 1504534445, 2, 'POST', 'STEP_4', NULL, NULL, NULL, 'POSTED', 5, '1130567538', 0, 0, 0, 0, 0, 0),
(11, 'INV2017000005', 1, 1, NULL, '4988209', '2017-04-23', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 12, NULL, NULL, NULL, NULL, 1523525365, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 4, '1572956008', 0, 0, 0, 0, 0, 0),
(12, 'INV2017000006', 2, 2, 2, '1146027', '2017-08-21', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 90, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 23, NULL, NULL, 1504537074, 2, 'POST', 'STEP_4', NULL, NULL, NULL, 'POSTED', 6, '1623471331', 0, 0, 0, 0, 0, 0),
(13, 'INV2018000001', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518082666, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '853911522', 0, 0, 0, 0, 0, 0),
(14, 'INV2018000002', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518082650, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '256101747', 0, 0, 0, 0, 0, 0),
(15, 'INV2018000003', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518086878, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '141561524', 0, 0, 0, 0, 0, 0),
(16, 'INV2018000004', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518097839, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '301246599', 0, 0, 0, 0, 0, 0),
(17, 'INV2018000005', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1519587833, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '2097302428', 0, 0, 0, 0, 0, 0),
(18, 'INV2018000006', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1519588864, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1029965803', 0, 0, 0, 0, 0, 0),
(19, 'INV2018000007', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525316, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1798828182', 0, 0, 0, 0, 0, 0),
(20, 'INV2018000008', 2, 2, NULL, '1146032', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525400, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1688353554', 0, 0, 0, 0, 0, 0),
(21, 'INV2018000009', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525389, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1147937885', 0, 0, 0, 0, 0, 0),
(22, 'INV2018000010', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 15, NULL, NULL, NULL, NULL, 1523525435, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '2144231726', 0, 0, 0, 0, 0, 0),
(23, 'INV2018000011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 31, NULL, NULL, 1523525617, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1988807600', 0, 0, 0, 0, 0, 0),
(24, 'INV2018000012', 1, 1, NULL, '4988209', '2017-04-23', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1525843767, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '1574504729', 0, 0, 0, 0, 0, 0),
(25, 'INV2018000013', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523526360, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1861113408', 0, 0, 0, 0, 0, 0),
(26, 'INV2018000014', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523894832, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '830379208', 0, 0, 0, 0, 0, 0),
(27, 'INV2018000015', 2, 2, NULL, '1146032', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1525667978, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '435009180', 0, 0, 0, 0, 0, 0),
(28, 'INV2018000016', 2, 2, NULL, '1146033', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 17, NULL, NULL, NULL, NULL, 1525257162, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '221885366', 0, 0, 0, 0, 0, 0),
(29, 'INV2018000017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 28, NULL, NULL, 1525676360, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '396981006', 0, 0, 0, 0, 0, 0),
(30, 'INV2018000018', 2, 2, NULL, '1146038', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2605.37, 3152.50, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 17, NULL, NULL, NULL, NULL, 1526656441, 2, 'SET_BACK_TO_STEP_3', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '1949580925', 0, 0, 0, 0, 0, 0);

--
-- Triggers `ipro_invoices`
--
DROP TRIGGER IF EXISTS `afterUpdateIproInvoices`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoices` AFTER UPDATE ON `ipro_invoices`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoices_log ( invoice_id, invoice_number, supplier_id, creditor_id, creditor_bank_account_id, creditor_invoice_number, invoice_date, invoice_location_id, delivery_location_id, description, currency_id, default_currency, supplier_currency, exchange_rate_supplier_currency, creditor_currency, exchange_rate_creditor_currency, exchange_rates_date, amount_excl_vat, amount_incl_vat, payment_condition, payment_term, payment_method, invoice_type, balance_type, year, administration_id, journal_id, accounting_period_id, rejection_reason_id, invoice_scan_id, electronic_invoice_id, original_accounting_robot_result_id, date, user_id, user_action, source, remark, approver_id, advisor_id, status, revision_id, revision_hash, awaiting_credit_invoice, confidential, enriched_by_accounting_robot, in_payment_process, in_process_in_workflow, on_hold ) VALUES ( NEW.invoice_id, NEW.invoice_number, NEW.supplier_id, NEW.creditor_id, NEW.creditor_bank_account_id, NEW.creditor_invoice_number, NEW.invoice_date, NEW.invoice_location_id, NEW.delivery_location_id, NEW.description, NEW.currency_id, NEW.default_currency, NEW.supplier_currency, NEW.exchange_rate_supplier_currency, NEW.creditor_currency, NEW.exchange_rate_creditor_currency, NEW.exchange_rates_date, NEW.amount_excl_vat, NEW.amount_incl_vat, NEW.payment_condition, NEW.payment_term, NEW.payment_method, NEW.invoice_type, NEW.balance_type, NEW.year, NEW.administration_id, NEW.journal_id, NEW.accounting_period_id, NEW.rejection_reason_id, NEW.invoice_scan_id, NEW.electronic_invoice_id, NEW.original_accounting_robot_result_id, NEW.date, NEW.user_id, NEW.user_action, NEW.source, NEW.remark, NEW.approver_id, NEW.advisor_id, NEW.status, NEW.revision_id, NEW.revision_hash, NEW.awaiting_credit_invoice, NEW.confidential, NEW.enriched_by_accounting_robot, NEW.in_payment_process, NEW.in_process_in_workflow, NEW.on_hold ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `beforeUpdateIproInvoices`;
DELIMITER //
CREATE TRIGGER `beforeUpdateIproInvoices` BEFORE UPDATE ON `ipro_invoices`
 FOR EACH ROW BEGIN DECLARE count INT; IF ( NEW.status != 'CANCELLED' AND ( ( NEW.creditor_id IS NOT NULL AND NEW.creditor_id > 0 AND ( LCASE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NEW.creditor_invoice_number, ' ', ''), '	', ''), ' ', ''), '
', ''), '
', '')) != LCASE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(OLD.creditor_invoice_number, ' ', ''), '	', ''), ' ', ''), '
', ''), '
', '')) OR ( NEW.creditor_invoice_number IS NOT NULL AND OLD.creditor_invoice_number IS NULL ) ) ) OR ( NEW.creditor_invoice_number IS NOT NULL AND NEW.creditor_invoice_number != '' AND ( NEW.creditor_id != OLD.creditor_id OR ( NEW.creditor_id IS NOT NULL AND OLD.creditor_id IS NULL ) ) ) ) ) THEN SELECT COUNT(*) INTO count FROM tblox_client_000001.ipro_invoices WHERE status != 'CANCELLED' AND creditor_id = NEW.creditor_id AND LCASE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( creditor_invoice_number, ' ', ''), '	', ''), ' ', ''), '
', ''), '
', '')) = LCASE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NEW.creditor_invoice_number, ' ', ''), '	', ''), ' ', ''), '
', ''), '
', '')); IF (count > 0) THEN UPDATE `error creditor invoice number already used` SET x = 1; END IF; END IF; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoices_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoices_log` (
  `invoice_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(1) unsigned NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `supplier_id` int(1) unsigned DEFAULT NULL,
  `creditor_id` int(1) unsigned DEFAULT NULL,
  `creditor_bank_account_id` int(1) unsigned DEFAULT NULL,
  `creditor_invoice_number` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_location_id` int(1) unsigned DEFAULT NULL,
  `delivery_location_id` int(1) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `currency_id` int(1) unsigned DEFAULT NULL,
  `default_currency` char(3) DEFAULT NULL,
  `supplier_currency` char(3) DEFAULT NULL,
  `exchange_rate_supplier_currency` decimal(10,6) unsigned DEFAULT NULL,
  `creditor_currency` char(3) DEFAULT NULL,
  `exchange_rate_creditor_currency` decimal(10,6) unsigned DEFAULT NULL,
  `exchange_rates_date` int(1) unsigned DEFAULT NULL,
  `amount_excl_vat` decimal(15,2) DEFAULT NULL,
  `amount_incl_vat` decimal(15,2) DEFAULT NULL,
  `payment_condition` enum('AFTER_RECEIPT','DOWN_PAYMENT','PREPAYMENT') NOT NULL,
  `payment_term` int(1) unsigned DEFAULT NULL,
  `payment_method` enum('DIRECT_DEBIT','MANUAL','NORMAL') NOT NULL,
  `invoice_type` enum('AO','CUSTOM','PO') NOT NULL,
  `balance_type` enum('CREDIT','DEBIT') NOT NULL,
  `year` year(4) NOT NULL,
  `administration_id` int(1) unsigned DEFAULT NULL,
  `journal_id` int(1) unsigned DEFAULT NULL,
  `accounting_period_id` int(1) unsigned DEFAULT NULL,
  `rejection_reason_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_id` int(1) unsigned DEFAULT NULL,
  `electronic_invoice_id` int(1) unsigned DEFAULT NULL,
  `original_accounting_robot_result_id` int(1) unsigned DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADVISE_APPROVAL','ADVISE_REJECTION','ANALYSE','APPROVE','ASSIGN_APPROVER','ASK_FOR_ADVICE','CANCEL','CREATE','DELEGATE','DISCARD_RESULTS_ACCOUNTING_ROBOT','ENRICH_WITH_ACCOUNTING_ROBOT','LINK_CREDIT_INVOICE','LINK_DEBIT_INVOICE','MARK_AS_AWAITING_CREDIT_INVOICE','MARK_AS_CONFIDENTIAL','MARK_AS_ON_HOLD','POST','PROCESS','PROCESS_RESULTS_ACCOUNTING_ROBOT','RECEIVE_RESULTS_ACCOUNTING_ROBOT','REJECT','SAVE','SEND_ADVICES','SEND_DECISIONS','SET_BACK_TO_CONCEPT','SET_BACK_TO_STEP_2','SET_BACK_TO_STEP_3','UNLINK_CREDIT_INVOICE','UNLINK_DEBIT_INVOICE','UNMARK_AS_AWAITING_CREDIT_INVOICE','UNMARK_AS_CONFIDENTIAL','UNMARK_AS_ON_HOLD','WF_SET_INVOICE_STATUS_TO_APPROVED','WF_SET_INVOICE_STATUS_TO_CANCELLED','WF_SET_INVOICE_STATUS_TO_REVIEW','WF_UNMARK_AS_IN_PROCESS_IN_WORKFLOW','ADD_TO_PAYMENT_PROCESS','RELEASE_FROM_PAYMENT_PROCESS') NOT NULL,
  `source` enum('INVOICE_APPROVAL','INVOICE_MANAGER','INVOICE_SCAN_BATCH_DETAILS','INVOICE_SCAN_MANAGER','INVOICE_SHARING','ORIGINAL_ACCOUNTING_ROBOT_RESULT_PROCESSING_CRON','STEP_3','STEP_4','STEP_5','STEP_MANAGER','WORKFLOW','PAYMENT','INVOICES_INCORRECTLY_MARKED_AS_IN_PAYMENT_PROCESS_CORRECTION_CRON') NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `approver_id` int(1) unsigned DEFAULT NULL,
  `advisor_id` int(1) unsigned DEFAULT NULL,
  `status` enum('APPROVED','AWAITING_ACCOUNTING_ROBOT','AWAITING_APPROVAL','CANCELLED','CONCEPT','CREATED','POSTED','PROCESSED_RESULTS_ACCOUNTING_ROBOT','RECEIVED_RESULTS_ACCOUNTING_ROBOT','REVIEW') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) DEFAULT NULL,
  `awaiting_credit_invoice` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `enriched_by_accounting_robot` tinyint(1) unsigned NOT NULL,
  `in_payment_process` tinyint(1) unsigned NOT NULL,
  `in_process_in_workflow` tinyint(1) unsigned NOT NULL,
  `on_hold` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_log_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `ipro_invoices_log`
--

INSERT INTO `ipro_invoices_log` (`invoice_log_id`, `invoice_id`, `invoice_number`, `supplier_id`, `creditor_id`, `creditor_bank_account_id`, `creditor_invoice_number`, `invoice_date`, `invoice_location_id`, `delivery_location_id`, `description`, `currency_id`, `default_currency`, `supplier_currency`, `exchange_rate_supplier_currency`, `creditor_currency`, `exchange_rate_creditor_currency`, `exchange_rates_date`, `amount_excl_vat`, `amount_incl_vat`, `payment_condition`, `payment_term`, `payment_method`, `invoice_type`, `balance_type`, `year`, `administration_id`, `journal_id`, `accounting_period_id`, `rejection_reason_id`, `invoice_scan_id`, `electronic_invoice_id`, `original_accounting_robot_result_id`, `date`, `user_id`, `user_action`, `source`, `remark`, `approver_id`, `advisor_id`, `status`, `revision_id`, `revision_hash`, `awaiting_credit_invoice`, `confidential`, `enriched_by_accounting_robot`, `in_payment_process`, `in_process_in_workflow`, `on_hold`) VALUES
(7, 7, 'INV2017000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1503676796, 6, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '808690749', 0, 0, 0, 0, 0, 0),
(8, 7, 'INV2017000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1503677843, 6, 'SAVE', 'STEP_4', '', NULL, NULL, 'CONCEPT', 2, '553924407', 0, 0, 0, 0, 0, 0),
(9, 8, 'INV2017000002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 11, NULL, NULL, 1504001664, 6, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '555738105', 0, 0, 0, 0, 0, 0),
(10, 9, 'INV2017000003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 18, NULL, NULL, 1504023801, 6, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '316318869', 0, 0, 0, 0, 0, 0),
(11, 10, 'INV2017000004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 19, NULL, NULL, 1504533333, 15, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '1369447538', 0, 0, 0, 0, 0, 0),
(12, 10, 'INV2017000004', 1, 1, 1, '4570703', '2017-04-23', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 19, NULL, NULL, 1504534432, 2, 'PROCESS', 'STEP_4', '', NULL, NULL, 'AWAITING_APPROVAL', 2, '1784676134', 0, 0, 0, 0, 0, 0),
(13, 10, 'INV2017000004', 1, 1, 1, '4570703', '2017-04-23', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 19, NULL, NULL, 1504534437, 2, 'ASSIGN_APPROVER', 'STEP_4', '', 2, NULL, 'AWAITING_APPROVAL', 3, '1756665149', 0, 0, 0, 0, 0, 0),
(14, 10, 'INV2017000004', 1, 1, 1, '4570703', '2017-04-23', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 19, NULL, NULL, 1504534445, 2, 'APPROVE', 'INVOICE_APPROVAL', '', NULL, NULL, 'APPROVED', 4, '1556882842', 0, 0, 0, 0, 0, 0),
(15, 10, 'INV2017000004', 1, 1, 1, '4570703', '2017-04-23', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 19, NULL, NULL, 1504534445, 2, 'POST', 'STEP_4', NULL, NULL, NULL, 'POSTED', 5, '1130567538', 0, 0, 0, 0, 0, 0),
(16, 11, 'INV2017000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 20, NULL, NULL, 1504535299, 15, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '1886206400', 0, 0, 0, 0, 0, 0),
(17, 11, 'INV2017000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 20, NULL, NULL, 1504535313, 15, 'ANALYSE', 'STEP_4', '', NULL, NULL, 'CREATED', 2, '262081131', 0, 0, 0, 0, 0, 0),
(18, 12, 'INV2017000006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 23, NULL, NULL, 1504536992, 2, 'CREATE', 'STEP_3', '', NULL, NULL, 'CREATED', 1, '1906641437', 0, 0, 0, 0, 0, 0),
(19, 11, 'INV2017000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 20, NULL, NULL, 1504537001, 2, 'ANALYSE', 'STEP_4', '', NULL, NULL, 'CREATED', 3, '1901591706', 0, 0, 0, 0, 0, 0),
(20, 12, 'INV2017000006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 23, NULL, NULL, 1504537010, 2, 'ANALYSE', 'STEP_4', '', NULL, NULL, 'CREATED', 2, '472088851', 0, 0, 0, 0, 0, 0),
(21, 12, 'INV2017000006', 2, 2, 2, '1146027', '2017-08-21', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 90, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 23, NULL, NULL, 1504537058, 2, 'PROCESS', 'STEP_4', '', NULL, NULL, 'AWAITING_APPROVAL', 3, '1291939295', 0, 0, 0, 0, 0, 0),
(22, 12, 'INV2017000006', 2, 2, 2, '1146027', '2017-08-21', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 90, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 23, NULL, NULL, 1504537066, 2, 'ASSIGN_APPROVER', 'STEP_4', '', 2, NULL, 'AWAITING_APPROVAL', 4, '1460994470', 0, 0, 0, 0, 0, 0),
(23, 12, 'INV2017000006', 2, 2, 2, '1146027', '2017-08-21', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 90, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 23, NULL, NULL, 1504537074, 2, 'APPROVE', 'INVOICE_APPROVAL', '', NULL, NULL, 'APPROVED', 5, '2069714451', 0, 0, 0, 0, 0, 0),
(24, 12, 'INV2017000006', 2, 2, 2, '1146027', '2017-08-21', 2, 1, NULL, NULL, 'EUR', NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 90, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 9, NULL, 23, NULL, NULL, 1504537074, 2, 'POST', 'STEP_4', NULL, NULL, NULL, 'POSTED', 6, '1623471331', 0, 0, 0, 0, 0, 0),
(25, 8, 'INV2017000002', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, 1.06, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 11, NULL, 11, NULL, NULL, 1510672967, 2, 'SAVE', 'STEP_4', '', NULL, NULL, 'CONCEPT', 2, '1138875283', 0, 0, 0, 0, 0, 0),
(26, 13, 'INV2018000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 27, NULL, NULL, 1518081439, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1332824667', 0, 0, 0, 0, 0, 0),
(27, 14, 'INV2018000002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 31, NULL, NULL, 1518082117, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '873789547', 0, 0, 0, 0, 0, 0),
(30, 14, 'INV2018000002', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518082650, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '256101747', 0, 0, 0, 0, 0, 0),
(31, 13, 'INV2018000001', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518082666, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '853911522', 0, 0, 0, 0, 0, 0),
(32, 15, 'INV2018000003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 31, NULL, NULL, 1518084589, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '2029380366', 0, 0, 0, 0, 0, 0),
(33, 15, 'INV2018000003', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518086878, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '141561524', 0, 0, 0, 0, 0, 0),
(34, 16, 'INV2018000004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 25, NULL, NULL, 1518087261, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '745983189', 0, 0, 0, 0, 0, 0),
(35, 16, 'INV2018000004', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1518097839, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '301246599', 0, 0, 0, 0, 0, 0),
(36, 17, 'INV2018000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 27, NULL, NULL, 1519587762, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1108480868', 0, 0, 0, 0, 0, 0),
(37, 17, 'INV2018000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 27, NULL, NULL, 1519587772, 15, 'ANALYSE', 'STEP_4', NULL, NULL, NULL, 'CREATED', 2, '1118122615', 0, 0, 0, 0, 0, 0),
(38, 17, 'INV2018000005', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1519587833, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '2097302428', 0, 0, 0, 0, 0, 0),
(39, 18, 'INV2018000006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 25, NULL, NULL, 1519588691, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '70576023', 0, 0, 0, 0, 0, 0),
(40, 18, 'INV2018000006', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 14, NULL, NULL, NULL, NULL, 1519588864, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1029965803', 0, 0, 0, 0, 0, 0),
(41, 19, 'INV2018000007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 27, NULL, NULL, 1519589504, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1549098969', 0, 0, 0, 0, 0, 0),
(42, 20, 'INV2018000008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 28, NULL, NULL, 1519590529, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1826312665', 0, 0, 0, 0, 0, 0),
(43, 21, 'INV2018000009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 25, NULL, NULL, 1521109312, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '956464732', 0, 0, 0, 0, 0, 0),
(44, 22, 'INV2018000010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 31, NULL, NULL, 1522083281, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '827084462', 0, 0, 0, 0, 0, 0),
(45, 22, 'INV2018000010', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 15, NULL, 31, NULL, NULL, 1522083353, 15, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 2, '167073783', 0, 0, 0, 0, 0, 0),
(46, 19, 'INV2018000007', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525316, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1798828182', 0, 0, 0, 0, 0, 0),
(47, 9, 'INV2017000003', NULL, NULL, NULL, NULL, '2017-02-07', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24800.00, 24800.00, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 12, NULL, NULL, NULL, NULL, 1523525346, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1436212813', 0, 0, 0, 0, 0, 0),
(48, 11, 'INV2017000005', 1, 1, NULL, '4988209', '2017-04-23', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, 1, 1, 12, NULL, NULL, NULL, NULL, 1523525365, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 4, '1572956008', 0, 0, 0, 0, 0, 0),
(49, 21, 'INV2018000009', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525389, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1147937885', 0, 0, 0, 0, 0, 0),
(50, 20, 'INV2018000008', 2, 2, NULL, '1146032', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523525400, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1688353554', 0, 0, 0, 0, 0, 0),
(51, 22, 'INV2018000010', 1, 1, NULL, '4988221', '2018-01-05', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.45, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 15, NULL, NULL, NULL, NULL, 1523525435, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '2144231726', 0, 0, 0, 0, 0, 0),
(52, 23, 'INV2018000011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 31, NULL, NULL, 1523525617, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1988807600', 0, 0, 0, 0, 0, 0),
(53, 24, 'INV2018000012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 20, NULL, NULL, 1523526272, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '970137869', 0, 0, 0, 0, 0, 0),
(54, 24, 'INV2018000012', 1, 1, NULL, '4988209', '2017-04-23', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, 20, NULL, NULL, 1523526279, 15, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 2, '1368716496', 0, 0, 0, 0, 0, 0),
(55, 25, 'INV2018000013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 25, NULL, NULL, 1523526340, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '2071197512', 0, 0, 0, 0, 0, 0),
(56, 25, 'INV2018000013', 2, 2, NULL, '1386134', '2017-08-31', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523526360, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '1861113408', 0, 0, 0, 0, 0, 0),
(57, 26, 'INV2018000014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 27, NULL, NULL, 1523892383, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1806732373', 0, 0, 0, 0, 0, 0),
(58, 26, 'INV2018000014', 2, 2, NULL, '1146031', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1523894832, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '830379208', 0, 0, 0, 0, 0, 0),
(59, 27, 'INV2018000015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 28, NULL, NULL, 1523895219, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '113558190', 0, 0, 0, 0, 0, 0),
(60, 27, 'INV2018000015', 2, 2, NULL, '1146032', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, 28, NULL, NULL, 1523895250, 15, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 2, '819705674', 0, 0, 0, 0, 0, 0),
(61, 28, 'INV2018000016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 29, NULL, NULL, 1525257151, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '1458965570', 0, 0, 0, 0, 0, 0),
(62, 28, 'INV2018000016', 2, 2, NULL, '1146033', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 17, NULL, NULL, NULL, NULL, 1525257162, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 2, '221885366', 0, 0, 0, 0, 0, 0),
(63, 27, 'INV2018000015', 2, 2, NULL, '1146032', '2018-01-04', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.03, 242.04, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1525667978, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '435009180', 0, 0, 0, 0, 0, 0),
(64, 29, 'INV2018000017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 28, NULL, NULL, 1525676360, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '396981006', 0, 0, 0, 0, 0, 0),
(65, 24, 'INV2018000012', 1, 1, NULL, '4988209', '2017-04-23', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54.09, 65.45, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 16, NULL, NULL, NULL, NULL, 1525843767, 15, 'SET_BACK_TO_STEP_2', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '1574504729', 0, 0, 0, 0, 0, 0),
(66, 30, 'INV2018000018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, NULL, NULL, NULL, NULL, 32, NULL, NULL, 1525848632, 15, 'CREATE', 'STEP_3', NULL, NULL, NULL, 'CREATED', 1, '917588105', 0, 0, 0, 0, 0, 0),
(67, 30, 'INV2018000018', 2, 2, NULL, '1146038', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2605.37, 3152.50, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 17, NULL, 32, NULL, NULL, 1525848643, 15, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 2, '187422886', 0, 0, 0, 0, 0, 0),
(68, 30, 'INV2018000018', 2, 2, NULL, '1146038', '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2605.37, 3152.50, 'AFTER_RECEIPT', 30, 'NORMAL', 'CUSTOM', 'DEBIT', 2018, 1, 1, 17, NULL, NULL, NULL, NULL, 1526656441, 2, 'SET_BACK_TO_STEP_3', 'STEP_4', NULL, NULL, NULL, 'CANCELLED', 3, '1949580925', 0, 0, 0, 0, 0, 0),
(69, 7, 'INV2017000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 'AFTER_RECEIPT', NULL, 'NORMAL', 'CUSTOM', 'DEBIT', 2017, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1528371498, 2, 'SAVE', 'STEP_4', NULL, NULL, NULL, 'CONCEPT', 3, '1556132125', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_dimension_values` (
  `invoice_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_dimension_value_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_invoice_dimension_values`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceDimensionValues`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceDimensionValues` AFTER INSERT ON `ipro_invoice_dimension_values`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_dimension_values_log ( invoice_dimension_value_id, invoice_id, since_invoice_revision_id, deleted, dimension_id, value, value_id ) VALUES ( NEW.invoice_dimension_value_id, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.deleted, NEW.dimension_id, NEW.value, NEW.value_id ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceDimensionValues`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceDimensionValues` AFTER UPDATE ON `ipro_invoice_dimension_values`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_dimension_values_log ( invoice_dimension_value_id, invoice_id, since_invoice_revision_id, deleted, dimension_id, value, value_id ) VALUES ( NEW.invoice_dimension_value_id, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.deleted, NEW.dimension_id, NEW.value, NEW.value_id ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_dimension_values_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_dimension_values_log` (
  `invoice_dimension_value_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_dimension_value_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_dimension_value_log_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_lines`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_lines` (
  `invoice_line_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(1) unsigned NOT NULL,
  `order_request_line_id` int(1) unsigned DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(1) unsigned NOT NULL,
  `cost_type` enum('ADMINISTRATION','CALCULATION_DIFFERENCE','DEPOSIT','DOWN_PAYMENT','PRODUCT','TRANSPORT','VAT_DIFFERENCE') NOT NULL,
  `price` decimal(17,4) NOT NULL,
  `vat_code_id` int(1) unsigned DEFAULT NULL,
  `project_id` int(1) unsigned DEFAULT NULL,
  `cost_center_id` int(1) unsigned DEFAULT NULL,
  `subcategory_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_number` varchar(255) DEFAULT NULL,
  `status` enum('APPROVED','AWAITING_APPROVAL','DELETED','CONCEPT','REJECTED') NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_line_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ipro_invoice_lines`
--

INSERT INTO `ipro_invoice_lines` (`invoice_line_id`, `invoice_id`, `order_request_line_id`, `product_code`, `product_name`, `quantity`, `cost_type`, `price`, `vat_code_id`, `project_id`, `cost_center_id`, `subcategory_id`, `general_ledger_account_id`, `general_ledger_account_number`, `status`, `since_revision_id`) VALUES
(1, 7, NULL, '-', '-', 1, 'PRODUCT', 0.0000, 1, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(2, 10, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, 1, 1, NULL, 1, NULL, 'CONCEPT', 2),
(3, 12, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, 1, 1, NULL, 1, NULL, 'CONCEPT', 3),
(4, 8, NULL, '-', '-', 1, 'PRODUCT', 1.0000, 5, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(7, 14, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(8, 13, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(9, 15, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(10, 16, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(11, 17, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 3),
(12, 18, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(13, 22, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(14, 19, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(15, 9, NULL, '-', '-', 1, 'PRODUCT', 24800.0000, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(16, 11, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 4),
(17, 21, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(18, 20, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(19, 24, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(20, 25, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(21, 26, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(22, 27, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(23, 28, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(24, 30, NULL, '-', '-', 1, 'PRODUCT', 2605.3700, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2);

--
-- Triggers `ipro_invoice_lines`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceLines`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceLines` AFTER INSERT ON `ipro_invoice_lines`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_lines_log ( invoice_line_id, invoice_id, order_request_line_id, product_code, product_name, quantity, cost_type, price, vat_code_id, project_id, cost_center_id, subcategory_id, general_ledger_account_id, general_ledger_account_number, status, since_revision_id ) VALUES ( NEW.invoice_line_id, NEW.invoice_id, NEW.order_request_line_id, NEW.product_code, NEW.product_name, NEW.quantity, NEW.cost_type, NEW.price, NEW.vat_code_id, NEW.project_id, NEW.cost_center_id, NEW.subcategory_id, NEW.general_ledger_account_id, NEW.general_ledger_account_number, NEW.status, NEW.since_revision_id ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceLines`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceLines` AFTER UPDATE ON `ipro_invoice_lines`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_lines_log ( invoice_line_id, invoice_id, order_request_line_id, product_code, product_name, quantity, cost_type, price, vat_code_id, project_id, cost_center_id, subcategory_id, general_ledger_account_id, general_ledger_account_number, status, since_revision_id ) VALUES ( NEW.invoice_line_id, NEW.invoice_id, NEW.order_request_line_id, NEW.product_code, NEW.product_name, NEW.quantity, NEW.cost_type, NEW.price, NEW.vat_code_id, NEW.project_id, NEW.cost_center_id, NEW.subcategory_id, NEW.general_ledger_account_id, NEW.general_ledger_account_number, NEW.status, NEW.since_revision_id ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_lines_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_lines_log` (
  `invoice_line_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_line_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned NOT NULL,
  `order_request_line_id` int(1) unsigned DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(1) unsigned NOT NULL,
  `cost_type` enum('ADMINISTRATION','CALCULATION_DIFFERENCE','DEPOSIT','DOWN_PAYMENT','PRODUCT','TRANSPORT','VAT_DIFFERENCE') NOT NULL,
  `price` decimal(17,4) NOT NULL,
  `vat_code_id` int(1) unsigned DEFAULT NULL,
  `project_id` int(1) unsigned DEFAULT NULL,
  `cost_center_id` int(1) unsigned DEFAULT NULL,
  `subcategory_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `general_ledger_account_number` int(255) unsigned DEFAULT NULL,
  `status` enum('APPROVED','AWAITING_APPROVAL','DELETED','CONCEPT','REJECTED') NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_line_log_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ipro_invoice_lines_log`
--

INSERT INTO `ipro_invoice_lines_log` (`invoice_line_log_id`, `invoice_line_id`, `invoice_id`, `order_request_line_id`, `product_code`, `product_name`, `quantity`, `cost_type`, `price`, `vat_code_id`, `project_id`, `cost_center_id`, `subcategory_id`, `general_ledger_account_id`, `general_ledger_account_number`, `status`, `since_revision_id`) VALUES
(1, 1, 7, NULL, '-', '-', 1, 'PRODUCT', 0.0000, 1, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(2, 2, 10, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, 1, 1, NULL, 1, NULL, 'CONCEPT', 2),
(3, 3, 12, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, 1, 1, NULL, 1, NULL, 'CONCEPT', 3),
(4, 4, 8, NULL, '-', '-', 1, 'PRODUCT', 1.0000, 5, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(7, 7, 14, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(8, 8, 13, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(9, 9, 15, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(10, 10, 16, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(11, 11, 17, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 3),
(12, 12, 18, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(13, 13, 22, NULL, '-', '-', 1, 'PRODUCT', 65.4500, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(14, 14, 19, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(15, 15, 9, NULL, '-', '-', 1, 'PRODUCT', 24800.0000, 2, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(16, 16, 11, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 4),
(17, 17, 21, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(18, 18, 20, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(19, 19, 24, NULL, '-', '-', 1, 'PRODUCT', 54.0900, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(20, 20, 25, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(21, 21, 26, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(22, 22, 27, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(23, 23, 28, NULL, '-', '-', 1, 'PRODUCT', 200.0300, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2),
(24, 24, 30, NULL, '-', '-', 1, 'PRODUCT', 2605.3700, 4, NULL, NULL, NULL, NULL, NULL, 'CONCEPT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_line_dimension_values` (
  `invoice_line_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_line_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_line_dimension_value_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_invoice_line_dimension_values`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceLineDimensionValues`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceLineDimensionValues` AFTER INSERT ON `ipro_invoice_line_dimension_values`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_line_dimension_values_log ( invoice_line_dimension_value_id, invoice_line_id, invoice_id, since_invoice_revision_id, deleted, dimension_id, value, value_id ) VALUES ( NEW.invoice_line_dimension_value_id, NEW.invoice_line_id, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.deleted, NEW.dimension_id, NEW.value, NEW.value_id ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceLineDimensionValues`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceLineDimensionValues` AFTER UPDATE ON `ipro_invoice_line_dimension_values`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_line_dimension_values_log ( invoice_line_dimension_value_id, invoice_line_id, invoice_id, since_invoice_revision_id, deleted, dimension_id, value, value_id ) VALUES ( NEW.invoice_line_dimension_value_id, NEW.invoice_line_id, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.deleted, NEW.dimension_id, NEW.value, NEW.value_id ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_line_dimension_values_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_line_dimension_values_log` (
  `invoice_line_dimension_value_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_line_dimension_value_id` int(1) unsigned NOT NULL,
  `invoice_line_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_line_dimension_value_log_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_location_dimension_relations`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_location_dimension_relations` (
  `invoice_location_dimension_relation_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_location_id` int(1) unsigned NOT NULL,
  `dimension_id` int(1) unsigned NOT NULL,
  `relation` enum('MANDATORY','NOT_ALLOWED','OPTIONAL') NOT NULL,
  PRIMARY KEY (`invoice_location_dimension_relation_id`),
  KEY `invoice_location_id` (`invoice_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_purchase_orders`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_purchase_orders` (
  `invoice_purchase_order_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(1) unsigned NOT NULL,
  `purchase_order_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_purchase_order_id`),
  UNIQUE KEY `invoice_id_purchase_order_id` (`invoice_id`,`purchase_order_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_order_id` (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_invoice_purchase_orders`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoicePurchaseOrders`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoicePurchaseOrders` AFTER INSERT ON `ipro_invoice_purchase_orders`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_purchase_orders_log ( invoice_purchase_order_id, invoice_id, purchase_order_id, since_invoice_revision_id, deleted ) VALUES ( NEW.invoice_purchase_order_id, NEW.invoice_id, NEW.purchase_order_id, NEW.since_invoice_revision_id, NEW.deleted ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoicePurchaseOrders`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoicePurchaseOrders` AFTER UPDATE ON `ipro_invoice_purchase_orders`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_purchase_orders_log ( invoice_purchase_order_id, invoice_id, purchase_order_id, since_invoice_revision_id, deleted ) VALUES ( NEW.invoice_purchase_order_id, NEW.invoice_id, NEW.purchase_order_id, NEW.since_invoice_revision_id, NEW.deleted ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_purchase_orders_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_purchase_orders_log` (
  `invoice_purchase_order_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_purchase_order_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned NOT NULL,
  `purchase_order_id` int(1) unsigned NOT NULL,
  `since_invoice_revision_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_purchase_order_log_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_recognition_strings`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_recognition_strings` (
  `invoice_recognition_string_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_invoice_recognition_string` varchar(255) NOT NULL,
  `ocr_invoice_recognition_string` varchar(255) DEFAULT NULL,
  `action` enum('IGNORE','INCLUDE') NOT NULL,
  `recognition_entity` enum('CREDIT_INVOICE','LOCATION','SUPPLIER') NOT NULL,
  `recognized_entity` enum('LOCATION','SUPPLIER') DEFAULT NULL,
  `recognized_entity_id` int(1) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `removable` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned DEFAULT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADD','DELETE','SAVE') NOT NULL,
  `source` enum('INVOICE_SETTINGS') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_recognition_string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_invoice_recognition_strings`
--
DROP TRIGGER IF EXISTS `beforeInsertIproInvoiceRecognitionStrings`;
DELIMITER //
CREATE TRIGGER `beforeInsertIproInvoiceRecognitionStrings` BEFORE INSERT ON `ipro_invoice_recognition_strings`
 FOR EACH ROW BEGIN DECLARE ocr_invoice_recognition_string VARCHAR(255); SET ocr_invoice_recognition_string = NEW.original_invoice_recognition_string; /* Strip removable characters from invoice recognition string */ CALL stripRemovableCharactersFromGivenString(ocr_invoice_recognition_string); /* Replace often misinterpreted characters in invoice recognition string */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocr_invoice_recognition_string); /* Convert invoice recognition string to lowercase */ SET NEW.ocr_invoice_recognition_string = LOWER(ocr_invoice_recognition_string); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `beforeUpdateIproInvoiceRecognitionStrings`;
DELIMITER //
CREATE TRIGGER `beforeUpdateIproInvoiceRecognitionStrings` BEFORE UPDATE ON `ipro_invoice_recognition_strings`
 FOR EACH ROW BEGIN DECLARE ocr_invoice_recognition_string VARCHAR(255); SET ocr_invoice_recognition_string = NEW.original_invoice_recognition_string; /* Strip removable characters from invoice recognition string */ CALL stripRemovableCharactersFromGivenString(ocr_invoice_recognition_string); /* Replace often misinterpreted characters in invoice recognition string */ CALL replaceOftenMisinterpretedOcrCharactersInGivenString(ocr_invoice_recognition_string); /* Convert invoice recognition string to lowercase */ SET NEW.ocr_invoice_recognition_string = LOWER(ocr_invoice_recognition_string); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scans`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scans` (
  `invoice_scan_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `analysis_outdated` tinyint(1) unsigned NOT NULL,
  `awaiting_po` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `on_hold` tinyint(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned DEFAULT NULL,
  `since_invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `rejection_reason_id` int(1) unsigned DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADD_INVOICE_SCAN','ADD_INVOICE_SCAN_PAGE','ANALYSE','APPROVE','CREATE','CREATE-ADD_INVOICE_SCAN_PAGE-REJECT','MARK_AS_AWAITING_PO','MARK_AS_CONFIDENTIAL','MARK_AS_ON_HOLD','MERGE_INTO_INVOICE_SCAN','MOVE_INVOICE_SCAN_PAGE_INTERNALLY','MOVE_TO_INVOICE_SCAN_BATCH','PROCESS_ELECTRONIC_INVOICE','REJECT','REMOVE_INVOICE_SCAN_PAGE','SET_BACK_TO_STEP_2','SET_BACK_TO_STEP_3','SPLIT_AFTER_INVOICE_SCAN_PAGE','SPLIT_OFF_FROM_INVOICE_SCAN','UNMARK_AS_AWAITING_PO','UNMARK_AS_CONFIDENTIAL','UNMARK_AS_ON_HOLD','UPDATE_ON_LINK_TO_INVOICE') NOT NULL,
  `user_action_id` int(1) unsigned DEFAULT NULL,
  `source` enum('INVOICE_MANAGER','STEP_1','STEP_2','STEP_3','STEP_4','STEP_MANAGER') NOT NULL,
  `status` enum('APPROVED','DELETED','LINKED','PENDING','REJECTED') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `recognized_supplier_id` int(1) unsigned DEFAULT NULL,
  `recognized_creditor_id` int(1) unsigned DEFAULT NULL,
  `recognized_creditor_invoice_number` varchar(50) DEFAULT NULL,
  `recognized_invoice_date` date DEFAULT NULL,
  `recognized_date_format_standard` enum('EU','ISO','US') DEFAULT NULL,
  `recognized_balance_type` enum('CREDIT','DEBIT') DEFAULT NULL,
  `recognized_invoice_location_id` int(1) unsigned DEFAULT NULL,
  `recognized_delivery_location_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_scan_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `ipro_invoice_scans`
--

INSERT INTO `ipro_invoice_scans` (`invoice_scan_id`, `analysis_outdated`, `awaiting_po`, `confidential`, `on_hold`, `invoice_id`, `since_invoice_revision_id`, `rejection_reason_id`, `date`, `user_id`, `user_action`, `user_action_id`, `source`, `status`, `revision_id`, `revision_hash`, `recognized_supplier_id`, `recognized_creditor_id`, `recognized_creditor_invoice_number`, `recognized_invoice_date`, `recognized_date_format_standard`, `recognized_balance_type`, `recognized_invoice_location_id`, `recognized_delivery_location_id`) VALUES
(5, 0, 0, 0, 0, 7, 1, NULL, 1503676796, 6, 'UPDATE_ON_LINK_TO_INVOICE', 7, 'INVOICE_MANAGER', 'LINKED', 3, '1205480639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 0, 0, 0, 8, 1, NULL, 1504001664, 6, 'UPDATE_ON_LINK_TO_INVOICE', 8, 'INVOICE_MANAGER', 'LINKED', 3, '1729062217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 0, 0, 0, NULL, NULL, NULL, 1523526262, 15, 'REJECT', NULL, 'STEP_3', 'REJECTED', 11, '1386219102', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(19, 0, 0, 0, 0, 10, 1, NULL, 1504533333, 15, 'UPDATE_ON_LINK_TO_INVOICE', 10, 'INVOICE_MANAGER', 'LINKED', 8, '2123222599', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(20, 0, 0, 0, 0, NULL, NULL, NULL, 1531397387, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 11, '717312038', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(21, 1, 0, 0, 0, NULL, NULL, NULL, 1504535052, 15, 'CREATE-ADD_INVOICE_SCAN_PAGE-REJECT', 11, 'STEP_2', 'REJECTED', 1, '1522581321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 0, 0, 0, NULL, NULL, NULL, 1504535054, 15, 'CREATE-ADD_INVOICE_SCAN_PAGE-REJECT', 12, 'STEP_2', 'REJECTED', 1, '739901244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 0, 0, 0, 12, 1, NULL, 1504537010, 2, 'ANALYSE', NULL, 'INVOICE_MANAGER', 'LINKED', 4, '545714586', 2, 2, NULL, '2017-08-21', NULL, 'DEBIT', 2, 1),
(24, 0, 0, 0, 0, NULL, NULL, NULL, 1511433029, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 13, '120603173', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(25, 0, 0, 0, 0, NULL, NULL, NULL, 1523526403, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 21, '1799867509', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(27, 0, 0, 0, 0, NULL, NULL, NULL, 1523895183, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 21, '519086153', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(28, 0, 0, 0, 0, 29, 1, NULL, 1525676360, 15, 'UPDATE_ON_LINK_TO_INVOICE', 29, 'INVOICE_MANAGER', 'LINKED', 11, '296541089', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(29, 0, 0, 0, 0, NULL, NULL, NULL, 1525257162, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 6, '813494607', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(30, 1, 0, 0, 0, NULL, NULL, NULL, 1515746631, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 5, '1927417528', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(31, 0, 0, 0, 0, 23, 1, NULL, 1523525617, 15, 'UPDATE_ON_LINK_TO_INVOICE', 23, 'INVOICE_MANAGER', 'LINKED', 16, '2069619335', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(32, 0, 0, 0, 0, NULL, NULL, NULL, 1526656441, 2, 'SET_BACK_TO_STEP_3', NULL, 'INVOICE_MANAGER', 'APPROVED', 8, '374168797', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1);

--
-- Triggers `ipro_invoice_scans`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceScans`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceScans` AFTER INSERT ON `ipro_invoice_scans`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scans_log ( invoice_scan_id, analysis_outdated, awaiting_po, confidential, on_hold, invoice_id, since_invoice_revision_id, rejection_reason_id, date, user_id, user_action, user_action_id, source, status, revision_id, revision_hash, recognized_supplier_id, recognized_creditor_id, recognized_creditor_invoice_number, recognized_invoice_date, recognized_date_format_standard, recognized_balance_type, recognized_invoice_location_id, recognized_delivery_location_id ) VALUES ( NEW.invoice_scan_id, NEW.analysis_outdated, NEW.awaiting_po, NEW.confidential, NEW.on_hold, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.rejection_reason_id, NEW.date, NEW.user_id, NEW.user_action, NEW.user_action_id, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash, NEW.recognized_supplier_id, NEW.recognized_creditor_id, NEW.recognized_creditor_invoice_number, NEW.recognized_invoice_date, NEW.recognized_date_format_standard, NEW.recognized_balance_type, NEW.recognized_invoice_location_id, NEW.recognized_delivery_location_id ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceScans`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceScans` AFTER UPDATE ON `ipro_invoice_scans`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scans_log ( invoice_scan_id, analysis_outdated, awaiting_po, confidential, on_hold, invoice_id, since_invoice_revision_id, rejection_reason_id, date, user_id, user_action, user_action_id, source, status, revision_id, revision_hash, recognized_supplier_id, recognized_creditor_id, recognized_creditor_invoice_number, recognized_invoice_date, recognized_date_format_standard, recognized_balance_type, recognized_invoice_location_id, recognized_delivery_location_id ) VALUES ( NEW.invoice_scan_id, NEW.analysis_outdated, NEW.awaiting_po, NEW.confidential, NEW.on_hold, NEW.invoice_id, NEW.since_invoice_revision_id, NEW.rejection_reason_id, NEW.date, NEW.user_id, NEW.user_action, NEW.user_action_id, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash, NEW.recognized_supplier_id, NEW.recognized_creditor_id, NEW.recognized_creditor_invoice_number, NEW.recognized_invoice_date, NEW.recognized_date_format_standard, NEW.recognized_balance_type, NEW.recognized_invoice_location_id, NEW.recognized_delivery_location_id ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scans_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scans_log` (
  `invoice_scan_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_id` int(1) unsigned NOT NULL,
  `analysis_outdated` tinyint(1) unsigned NOT NULL,
  `awaiting_po` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `on_hold` tinyint(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned DEFAULT NULL,
  `since_invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `rejection_reason_id` int(1) unsigned DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ADD_INVOICE_SCAN','ADD_INVOICE_SCAN_PAGE','ANALYSE','APPROVE','CREATE','CREATE-ADD_INVOICE_SCAN_PAGE-REJECT','MARK_AS_AWAITING_PO','MARK_AS_CONFIDENTIAL','MARK_AS_ON_HOLD','MERGE_INTO_INVOICE_SCAN','MOVE_INVOICE_SCAN_PAGE_INTERNALLY','MOVE_TO_INVOICE_SCAN_BATCH','PROCESS_ELECTRONIC_INVOICE','REJECT','REMOVE_INVOICE_SCAN_PAGE','SET_BACK_TO_STEP_2','SET_BACK_TO_STEP_3','SPLIT_AFTER_INVOICE_SCAN_PAGE','SPLIT_OFF_FROM_INVOICE_SCAN','UNMARK_AS_AWAITING_PO','UNMARK_AS_CONFIDENTIAL','UNMARK_AS_ON_HOLD','UPDATE_ON_LINK_TO_INVOICE') NOT NULL,
  `user_action_id` int(1) unsigned DEFAULT NULL,
  `source` enum('INVOICE_MANAGER','STEP_1','STEP_2','STEP_3','STEP_4','STEP_MANAGER') NOT NULL,
  `status` enum('APPROVED','DELETED','LINKED','PENDING','REJECTED') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `recognized_supplier_id` int(1) unsigned DEFAULT NULL,
  `recognized_creditor_id` int(1) unsigned DEFAULT NULL,
  `recognized_creditor_invoice_number` varchar(50) DEFAULT NULL,
  `recognized_invoice_date` date DEFAULT NULL,
  `recognized_date_format_standard` enum('EU','ISO','US') DEFAULT NULL,
  `recognized_balance_type` enum('CREDIT','DEBIT') DEFAULT NULL,
  `recognized_invoice_location_id` int(1) unsigned DEFAULT NULL,
  `recognized_delivery_location_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_scan_log_id`),
  KEY `invoice_scan_id` (`invoice_scan_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=321 ;

--
-- Dumping data for table `ipro_invoice_scans_log`
--

INSERT INTO `ipro_invoice_scans_log` (`invoice_scan_log_id`, `invoice_scan_id`, `analysis_outdated`, `awaiting_po`, `confidential`, `on_hold`, `invoice_id`, `since_invoice_revision_id`, `rejection_reason_id`, `date`, `user_id`, `user_action`, `user_action_id`, `source`, `status`, `revision_id`, `revision_hash`, `recognized_supplier_id`, `recognized_creditor_id`, `recognized_creditor_invoice_number`, `recognized_invoice_date`, `recognized_date_format_standard`, `recognized_balance_type`, `recognized_invoice_location_id`, `recognized_delivery_location_id`) VALUES
(9, 5, 0, 0, 0, 0, NULL, NULL, NULL, 1503676795, 6, 'CREATE', NULL, 'INVOICE_MANAGER', 'PENDING', 1, '2127842023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 5, 0, 0, 0, 0, NULL, NULL, NULL, 1503676795, 6, 'APPROVE', NULL, 'INVOICE_MANAGER', 'APPROVED', 2, '2075798602', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 5, 0, 0, 0, 0, 7, 1, NULL, 1503676796, 6, 'UPDATE_ON_LINK_TO_INVOICE', 7, 'INVOICE_MANAGER', 'LINKED', 3, '1205480639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 6, 0, 0, 0, 0, NULL, NULL, NULL, 1503915302, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '992400846', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(13, 7, 0, 0, 0, 0, NULL, NULL, NULL, 1503915302, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '467395322', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(14, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915437, 6, 'ADD_INVOICE_SCAN', 7, 'STEP_2', 'PENDING', 2, '1380108414', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(15, 7, 1, 0, 0, 0, NULL, NULL, NULL, 1503915437, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1452609598', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915445, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 3, '2076130919', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(17, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1503915446, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '984759088', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(18, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915454, 6, 'ADD_INVOICE_SCAN', 8, 'STEP_2', 'PENDING', 4, '1316140822', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(19, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1503915454, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1381343285', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915506, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 5, '516891609', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(21, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1503915506, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1525658326', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(22, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915752, 6, 'ADD_INVOICE_SCAN', 9, 'STEP_2', 'PENDING', 6, '1197818212', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(23, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1503915752, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '296352511', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915755, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 7, '500291449', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(25, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1503915755, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '911548256', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(26, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915868, 6, 'ADD_INVOICE_SCAN', 10, 'STEP_2', 'PENDING', 8, '1256279117', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(27, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1503915868, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1915692706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503915885, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 9, '1471481301', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(29, 11, 1, 0, 0, 0, NULL, NULL, NULL, 1503915885, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '617668160', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(30, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503916072, 6, 'ADD_INVOICE_SCAN_PAGE', 12, 'STEP_2', 'PENDING', 10, '967675056', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(31, 11, 1, 0, 0, 0, NULL, NULL, NULL, 1503916072, 6, 'REMOVE_INVOICE_SCAN_PAGE', 12, 'STEP_2', 'DELETED', 2, '1065165396', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(32, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503916097, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 11, '513068213', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(33, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1503916097, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '94695542', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(34, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503916613, 6, 'ADD_INVOICE_SCAN', 12, 'STEP_2', 'PENDING', 12, '2103008387', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(35, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1503916613, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1758037049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917163, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 13, '1678034929', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(37, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1503917163, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '679413278', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(38, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917231, 6, 'ADD_INVOICE_SCAN', 13, 'STEP_2', 'PENDING', 14, '294846006', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(39, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1503917231, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1718541596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 6, 0, 0, 0, 0, NULL, NULL, NULL, 1503917369, 6, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 15, '609797440', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(41, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917412, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 16, '1536099484', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(42, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1503917412, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '995224769', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(43, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917418, 6, 'ADD_INVOICE_SCAN', 14, 'STEP_2', 'PENDING', 17, '42862713', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(44, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1503917418, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '2003604176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 6, 0, 0, 0, 0, NULL, NULL, NULL, 1503917441, 6, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 18, '1073992158', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(46, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917509, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 19, '28081444', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(47, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1503917509, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1902844934', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(48, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917549, 6, 'ADD_INVOICE_SCAN', 15, 'STEP_2', 'PENDING', 20, '980949255', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(49, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1503917549, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '2054263893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917583, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 21, '1499167136', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(51, 16, 1, 0, 0, 0, NULL, NULL, NULL, 1503917583, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '994989170', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(52, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917784, 6, 'ADD_INVOICE_SCAN', 16, 'STEP_2', 'PENDING', 22, '1686460758', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(53, 16, 1, 0, 0, 0, NULL, NULL, NULL, 1503917784, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1714681112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917922, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 23, '892693029', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(55, 17, 1, 0, 0, 0, NULL, NULL, NULL, 1503917922, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '820772708', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(56, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503917988, 6, 'ADD_INVOICE_SCAN', 17, 'STEP_2', 'PENDING', 24, '1177707002', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(57, 17, 1, 0, 0, 0, NULL, NULL, NULL, 1503917988, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '2014050521', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503918444, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 25, '270298601', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(59, 18, 1, 0, 0, 0, NULL, NULL, NULL, 1503918444, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '277860616', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(60, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503918593, 6, 'ADD_INVOICE_SCAN', 18, 'STEP_2', 'PENDING', 26, '47519203', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(61, 18, 1, 0, 0, 0, NULL, NULL, NULL, 1503918593, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '107843269', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503918613, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 27, '693589450', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(63, 19, 1, 0, 0, 0, NULL, NULL, NULL, 1503918613, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1034503530', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(64, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503918720, 6, 'ADD_INVOICE_SCAN', 19, 'STEP_2', 'PENDING', 28, '1119828052', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(65, 19, 1, 0, 0, 0, NULL, NULL, NULL, 1503918720, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '986665280', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920150, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 29, '1921396199', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(67, 20, 1, 0, 0, 0, NULL, NULL, NULL, 1503920150, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1197826403', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(68, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920180, 6, 'ADD_INVOICE_SCAN', 20, 'STEP_2', 'PENDING', 30, '1994194399', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(69, 20, 1, 0, 0, 0, NULL, NULL, NULL, 1503920180, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '734862397', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920213, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 31, '1311575120', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(71, 21, 1, 0, 0, 0, NULL, NULL, NULL, 1503920213, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1485090394', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(72, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920255, 6, 'ADD_INVOICE_SCAN', 21, 'STEP_2', 'PENDING', 32, '801323463', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(73, 21, 1, 0, 0, 0, NULL, NULL, NULL, 1503920255, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1077732340', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920371, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 33, '1000013161', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(75, 22, 1, 0, 0, 0, NULL, NULL, NULL, 1503920371, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '436748939', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(76, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920399, 6, 'ADD_INVOICE_SCAN', 22, 'STEP_2', 'PENDING', 34, '366143864', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(77, 22, 1, 0, 0, 0, NULL, NULL, NULL, 1503920399, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1933426797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920416, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 35, '646339433', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(79, 23, 1, 0, 0, 0, NULL, NULL, NULL, 1503920416, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1233793100', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(80, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920425, 6, 'ADD_INVOICE_SCAN', 23, 'STEP_2', 'PENDING', 36, '1789304471', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(81, 23, 1, 0, 0, 0, NULL, NULL, NULL, 1503920425, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '315549828', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920467, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 37, '693554772', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(83, 24, 1, 0, 0, 0, NULL, NULL, NULL, 1503920467, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1180601870', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(84, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503920514, 6, 'ADD_INVOICE_SCAN', 24, 'STEP_2', 'PENDING', 38, '1739201857', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(85, 24, 1, 0, 0, 0, NULL, NULL, NULL, 1503920514, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1795591665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503925069, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 39, '519996799', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(87, 7, 1, 0, 0, 0, NULL, NULL, NULL, 1503925069, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '2045500152', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(88, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503925081, 6, 'ADD_INVOICE_SCAN', 7, 'STEP_2', 'PENDING', 40, '382517261', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(89, 7, 1, 0, 0, 0, NULL, NULL, NULL, 1503925081, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1116764301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503926820, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 41, '1462661744', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(91, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1503926820, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1799541257', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(92, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503926834, 6, 'ADD_INVOICE_SCAN', 8, 'STEP_2', 'PENDING', 42, '4181825', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(93, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1503926834, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1780728412', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503926843, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 43, '1671194996', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(95, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1503926843, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '271218404', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(96, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503926850, 6, 'ADD_INVOICE_SCAN', 9, 'STEP_2', 'PENDING', 44, '469103380', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(97, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1503926850, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1802947648', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503926858, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 45, '68008173', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(99, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1503926858, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '481570988', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(100, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503928003, 6, 'ADD_INVOICE_SCAN', 10, 'STEP_2', 'PENDING', 46, '1175171113', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(101, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1503928003, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '201054728', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503928111, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 47, '1416142000', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(103, 11, 1, 0, 0, 0, NULL, NULL, NULL, 1503928111, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1738717508', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(104, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503928139, 6, 'ADD_INVOICE_SCAN', 11, 'STEP_2', 'PENDING', 48, '234503529', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(105, 11, 1, 0, 0, 0, NULL, NULL, NULL, 1503928139, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1511253296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503933740, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 49, '1353669268', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(107, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1503933740, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '2065959069', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(108, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503933762, 6, 'ADD_INVOICE_SCAN', 12, 'STEP_2', 'PENDING', 50, '1098973074', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(109, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1503933762, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1890284269', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503933846, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 51, '235017989', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(111, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1503933846, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '999534171', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(112, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503933853, 6, 'ADD_INVOICE_SCAN', 13, 'STEP_2', 'PENDING', 52, '188836203', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(113, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1503933853, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1517422043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503934283, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 53, '1840512809', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(115, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1503934283, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '861668647', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(116, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503934420, 6, 'ADD_INVOICE_SCAN', 14, 'STEP_2', 'PENDING', 54, '1626745', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(117, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1503934420, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '588038389', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503934492, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 55, '1587355784', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(119, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1503934492, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1526213879', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(120, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1503934501, 6, 'ADD_INVOICE_SCAN', 15, 'STEP_2', 'PENDING', 56, '303494512', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(121, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1503934501, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '253838603', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001474, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 57, '982362560', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(123, 7, 1, 0, 0, 0, NULL, NULL, NULL, 1504001474, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '906725112', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(124, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001479, 6, 'ADD_INVOICE_SCAN', 7, 'STEP_2', 'PENDING', 58, '1344347442', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(125, 7, 1, 0, 0, 0, NULL, NULL, NULL, 1504001479, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1715967877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001484, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 59, '415486418', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(127, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1504001484, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '2116159462', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(128, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001496, 6, 'ADD_INVOICE_SCAN', 8, 'STEP_2', 'PENDING', 60, '1018259883', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(129, 8, 1, 0, 0, 0, NULL, NULL, NULL, 1504001496, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '207283586', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001520, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 61, '107290067', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(131, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1504001520, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1612221732', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(132, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001563, 6, 'ADD_INVOICE_SCAN', 9, 'STEP_2', 'PENDING', 62, '901360983', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(133, 9, 1, 0, 0, 0, NULL, NULL, NULL, 1504001563, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1798700112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001601, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 63, '1571542755', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(135, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1504001601, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1319101031', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(136, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504001635, 6, 'ADD_INVOICE_SCAN', 10, 'STEP_2', 'PENDING', 64, '407231450', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(137, 10, 1, 0, 0, 0, NULL, NULL, NULL, 1504001635, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1540113432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 11, 0, 0, 0, 0, NULL, NULL, NULL, 1504001664, 6, 'CREATE', NULL, 'INVOICE_MANAGER', 'PENDING', 1, '1396368273', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 11, 0, 0, 0, 0, NULL, NULL, NULL, 1504001664, 6, 'APPROVE', NULL, 'INVOICE_MANAGER', 'APPROVED', 2, '549456085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 11, 0, 0, 0, 0, 8, 1, NULL, 1504001664, 6, 'UPDATE_ON_LINK_TO_INVOICE', 8, 'INVOICE_MANAGER', 'LINKED', 3, '1729062217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002191, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 65, '1348681039', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(142, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1504002191, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '654974315', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(143, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002317, 6, 'ADD_INVOICE_SCAN', 12, 'STEP_2', 'PENDING', 66, '1600548103', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(144, 12, 1, 0, 0, 0, NULL, NULL, NULL, 1504002317, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '279330411', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002659, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 67, '2075246998', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(146, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1504002659, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '546527773', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(147, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002670, 6, 'ADD_INVOICE_SCAN', 13, 'STEP_2', 'PENDING', 68, '1068505796', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(148, 13, 1, 0, 0, 0, NULL, NULL, NULL, 1504002670, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '269252641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002672, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 69, '1503378025', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(150, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1504002672, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '319805448', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(151, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002673, 6, 'ADD_INVOICE_SCAN', 14, 'STEP_2', 'PENDING', 70, '1144735547', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(152, 14, 1, 0, 0, 0, NULL, NULL, NULL, 1504002673, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1224350437', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002677, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 71, '98315179', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(154, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1504002677, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1717098532', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(155, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002678, 6, 'ADD_INVOICE_SCAN', 15, 'STEP_2', 'PENDING', 72, '1447374629', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(156, 15, 1, 0, 0, 0, NULL, NULL, NULL, 1504002678, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1781258279', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002679, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 73, '1553624130', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(158, 16, 1, 0, 0, 0, NULL, NULL, NULL, 1504002679, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '1771852081', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(159, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504002681, 6, 'ADD_INVOICE_SCAN', 16, 'STEP_2', 'PENDING', 74, '342325804', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(160, 16, 1, 0, 0, 0, NULL, NULL, NULL, 1504002681, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '245546199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504003769, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 75, '564331575', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(162, 17, 1, 0, 0, 0, NULL, NULL, NULL, 1504003769, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '113394388', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(163, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504003772, 6, 'ADD_INVOICE_SCAN', 17, 'STEP_2', 'PENDING', 76, '1484822964', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(164, 17, 1, 0, 0, 0, NULL, NULL, NULL, 1504003772, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1599317313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504013521, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '1850315868', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(166, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504013521, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '322598885', NULL, NULL, NULL, '2015-11-15', NULL, 'DEBIT', NULL, NULL),
(167, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1504013521, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '355948235', NULL, NULL, NULL, '2015-11-03', NULL, 'DEBIT', NULL, NULL),
(168, 19, 1, 0, 0, 0, NULL, NULL, NULL, 1504013589, 6, 'ADD_INVOICE_SCAN', 20, 'STEP_2', 'PENDING', 2, '1673668515', NULL, NULL, NULL, '2015-11-15', NULL, 'DEBIT', NULL, NULL),
(169, 20, 1, 0, 0, 0, NULL, NULL, NULL, 1504013589, 6, 'MERGE_INTO_INVOICE_SCAN', 19, 'STEP_2', 'DELETED', 2, '468507145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 18, 1, 0, 0, 0, NULL, NULL, NULL, 1504013593, 6, 'ADD_INVOICE_SCAN', 19, 'STEP_2', 'PENDING', 2, '425714693', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(171, 19, 1, 0, 0, 0, NULL, NULL, NULL, 1504013594, 6, 'MERGE_INTO_INVOICE_SCAN', 18, 'STEP_2', 'DELETED', 3, '755140953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504013596, 6, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 3, '67771886', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(173, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504014259, 6, 'MOVE_INVOICE_SCAN_PAGE_INTERNALLY', 16, 'STEP_2', 'PENDING', 4, '1902248062', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(174, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504014261, 6, 'MOVE_INVOICE_SCAN_PAGE_INTERNALLY', 15, 'STEP_2', 'PENDING', 5, '1097060639', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(175, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504014264, 6, 'MOVE_INVOICE_SCAN_PAGE_INTERNALLY', 16, 'STEP_2', 'PENDING', 6, '1624633258', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(176, 6, 0, 0, 0, 0, NULL, NULL, NULL, 1504016225, 6, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 77, '627460803', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(177, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504023651, 6, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 78, '1628206081', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(178, 21, 1, 0, 0, 0, NULL, NULL, NULL, 1504023651, 6, 'SPLIT_OFF_FROM_INVOICE_SCAN', 6, 'STEP_2', 'PENDING', 1, '358697461', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(179, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504023653, 6, 'ADD_INVOICE_SCAN', 21, 'STEP_2', 'PENDING', 79, '1150320369', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(180, 21, 1, 0, 0, 0, NULL, NULL, NULL, 1504023653, 6, 'MERGE_INTO_INVOICE_SCAN', 6, 'STEP_2', 'DELETED', 2, '1160149610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 6, 0, 0, 0, 0, NULL, NULL, NULL, 1504023656, 6, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 80, '1408925372', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(182, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1504023789, 6, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 7, '742926320', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(183, 18, 0, 0, 0, 0, 9, 1, NULL, 1504023801, 6, 'UPDATE_ON_LINK_TO_INVOICE', 9, 'INVOICE_MANAGER', 'LINKED', 8, '1107964455', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(184, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532582, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '136868604', NULL, NULL, NULL, '2017-04-23', NULL, 'DEBIT', NULL, NULL),
(185, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532770, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 2, '333026801', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 0),
(186, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532825, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 3, '1041716906', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(187, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532872, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 4, '1411606534', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(188, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532894, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 5, '1862201017', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(189, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504532960, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 6, '1392560684', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(190, 19, 0, 0, 0, 0, NULL, NULL, NULL, 1504533309, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 7, '1416343956', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(191, 19, 0, 0, 0, 0, 10, 1, NULL, 1504533333, 15, 'UPDATE_ON_LINK_TO_INVOICE', 10, 'INVOICE_MANAGER', 'LINKED', 8, '2123222599', 1, 1, NULL, '2017-04-23', NULL, 'DEBIT', 2, 1),
(192, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1504534562, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '1794767989', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(193, 21, 1, 0, 0, 0, NULL, NULL, NULL, 1504535052, 15, 'CREATE-ADD_INVOICE_SCAN_PAGE-REJECT', 11, 'STEP_2', 'REJECTED', 1, '1522581321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504535052, 15, 'REMOVE_INVOICE_SCAN_PAGE', 11, 'STEP_2', 'PENDING', 81, '1171337311', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(195, 22, 1, 0, 0, 0, NULL, NULL, NULL, 1504535054, 15, 'CREATE-ADD_INVOICE_SCAN_PAGE-REJECT', 12, 'STEP_2', 'REJECTED', 1, '739901244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 6, 1, 0, 0, 0, NULL, NULL, NULL, 1504535054, 15, 'REMOVE_INVOICE_SCAN_PAGE', 12, 'STEP_2', 'DELETED', 82, '1569887184', NULL, NULL, NULL, '2016-11-16', NULL, 'DEBIT', NULL, NULL),
(197, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1504535291, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '1916031025', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(198, 20, 0, 0, 0, 0, 11, 1, NULL, 1504535299, 15, 'UPDATE_ON_LINK_TO_INVOICE', 11, 'INVOICE_MANAGER', 'LINKED', 3, '1915498902', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(199, 20, 0, 0, 0, 0, 11, 1, NULL, 1504535313, 15, 'ANALYSE', NULL, 'INVOICE_MANAGER', 'LINKED', 4, '610634255', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(200, 23, 0, 0, 0, 0, NULL, NULL, NULL, 1504536961, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '267229116', 2, 2, NULL, '2017-08-21', NULL, 'DEBIT', 2, 1),
(201, 23, 0, 0, 0, 0, NULL, NULL, NULL, 1504536984, 2, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '1059860296', 2, 2, NULL, '2017-08-21', NULL, 'DEBIT', 2, 1),
(202, 23, 0, 0, 0, 0, 12, 1, NULL, 1504536992, 2, 'UPDATE_ON_LINK_TO_INVOICE', 12, 'INVOICE_MANAGER', 'LINKED', 3, '8269265', 2, 2, NULL, '2017-08-21', NULL, 'DEBIT', 2, 1),
(203, 20, 0, 0, 0, 0, 11, 2, NULL, 1504537001, 2, 'ANALYSE', NULL, 'INVOICE_MANAGER', 'LINKED', 5, '930797928', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(204, 23, 0, 0, 0, 0, 12, 1, NULL, 1504537010, 2, 'ANALYSE', NULL, 'INVOICE_MANAGER', 'LINKED', 4, '545714586', 2, 2, NULL, '2017-08-21', NULL, 'DEBIT', 2, 1),
(205, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1504537142, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '2144347410', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(206, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432252, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '1308083472', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(207, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432307, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 3, '1507073541', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(208, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432343, 15, 'MOVE_INVOICE_SCAN_PAGE_INTERNALLY', 20, 'STEP_2', 'PENDING', 4, '787526930', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(209, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432351, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 5, '1969584267', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(210, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432367, 15, 'MOVE_TO_INVOICE_SCAN_BATCH', 5, 'STEP_2', 'PENDING', 6, '1992412579', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(211, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432425, 15, 'MOVE_INVOICE_SCAN_PAGE_INTERNALLY', 20, 'STEP_2', 'PENDING', 7, '1285857207', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(212, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432429, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 8, '1287867934', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(213, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432490, 15, 'ANALYSE', NULL, 'STEP_3', 'APPROVED', 9, '646584615', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(214, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432602, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 10, '663658114', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(215, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511432948, 15, 'MOVE_TO_INVOICE_SCAN_BATCH', 4, 'STEP_2', 'PENDING', 11, '827929261', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(216, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511433021, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 12, '2113494084', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(217, 24, 0, 0, 0, 0, NULL, NULL, NULL, 1511433029, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 13, '120603173', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(218, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1511435821, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '1003681545', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(219, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1511436122, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 2, '942222927', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(220, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1513807519, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 3, '408093003', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(221, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1515054012, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 4, '1677166195', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(222, 26, 0, 0, 0, 0, NULL, NULL, NULL, 1515742442, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '388951463', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(223, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1515742442, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '687355926', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(224, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1515742442, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '1513236376', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(225, 29, 0, 0, 0, 0, NULL, NULL, NULL, 1515742442, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '199716506', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(226, 26, 1, 0, 0, 0, NULL, NULL, NULL, 1515742788, 15, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 22, 'STEP_2', 'PENDING', 2, '1056096672', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(227, 30, 1, 0, 0, 0, NULL, NULL, NULL, 1515742788, 15, 'SPLIT_OFF_FROM_INVOICE_SCAN', 26, 'STEP_2', 'PENDING', 1, '968751576', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(228, 26, 0, 0, 0, 0, NULL, NULL, NULL, 1515742791, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 3, '721184012', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(229, 30, 0, 0, 0, 0, NULL, NULL, NULL, 1515742802, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 2, '1526700991', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(230, 30, 1, 0, 0, 0, NULL, NULL, NULL, 1515746098, 15, 'ADD_INVOICE_SCAN_PAGE', 22, 'STEP_2', 'PENDING', 3, '1947303866', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(231, 26, 1, 0, 0, 0, NULL, NULL, NULL, 1515746098, 15, 'REMOVE_INVOICE_SCAN_PAGE', 22, 'STEP_2', 'DELETED', 4, '1363203009', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(232, 30, 1, 0, 0, 0, NULL, NULL, NULL, 1515746251, 15, 'SPLIT_AFTER_INVOICE_SCAN_PAGE', 23, 'STEP_2', 'PENDING', 4, '715677373', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(233, 31, 1, 0, 0, 0, NULL, NULL, NULL, 1515746251, 15, 'SPLIT_OFF_FROM_INVOICE_SCAN', 30, 'STEP_2', 'PENDING', 1, '328495604', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(234, 31, 1, 0, 0, 0, NULL, NULL, NULL, 1515746548, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '1499332445', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(235, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1515746549, NULL, 'ANALYSE', NULL, 'STEP_MANAGER', 'APPROVED', 3, '53461431', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(236, 30, 1, 0, 0, 0, NULL, NULL, NULL, 1515746631, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 5, '1927417528', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(237, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1515747601, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '1548694821', NULL, NULL, NULL, '2018-01-03', NULL, 'DEBIT', 2, 1),
(238, 33, 0, 0, 0, 0, NULL, NULL, NULL, 1515747601, NULL, 'CREATE', NULL, 'STEP_MANAGER', 'PENDING', 1, '338471907', 2, 2, NULL, NULL, NULL, 'DEBIT', NULL, NULL),
(239, 32, 1, 0, 0, 0, NULL, NULL, NULL, 1515747632, 15, 'ADD_INVOICE_SCAN_PAGE', 28, 'STEP_2', 'PENDING', 2, '169711445', NULL, NULL, NULL, '2018-01-03', NULL, 'DEBIT', 2, 1),
(240, 33, 1, 0, 0, 0, NULL, NULL, NULL, 1515747632, 15, 'REMOVE_INVOICE_SCAN_PAGE', 28, 'STEP_2', 'DELETED', 2, '1274729693', 2, 2, NULL, NULL, NULL, 'DEBIT', NULL, NULL),
(241, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1515747635, 15, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 3, '1181233963', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(242, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1518081334, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '867446554', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(243, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518081426, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 4, '422153331', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(244, 27, 0, 0, 0, 0, 13, 1, NULL, 1518081439, 15, 'UPDATE_ON_LINK_TO_INVOICE', 13, 'INVOICE_MANAGER', 'LINKED', 3, '1849503294', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(245, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518082060, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 5, '1703112722', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(246, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518082087, 15, 'ANALYSE', NULL, 'STEP_3', 'APPROVED', 6, '1031498827', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(247, 31, 0, 0, 0, 0, 14, 1, NULL, 1518082117, 15, 'UPDATE_ON_LINK_TO_INVOICE', 14, 'INVOICE_MANAGER', 'LINKED', 7, '1617538318', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(248, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518082650, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 8, '1363888557', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(249, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1518082666, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 4, '287757690', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(250, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518084565, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 9, '1398933291', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(251, 31, 0, 0, 0, 0, 15, 1, NULL, 1518084589, 15, 'UPDATE_ON_LINK_TO_INVOICE', 15, 'INVOICE_MANAGER', 'LINKED', 10, '1812120960', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(252, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1518086878, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 11, '386766052', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(253, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1518087241, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 5, '190808527', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(254, 25, 0, 0, 0, 0, 16, 1, NULL, 1518087261, 15, 'UPDATE_ON_LINK_TO_INVOICE', 16, 'INVOICE_MANAGER', 'LINKED', 6, '376562766', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(255, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1518097839, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 7, '1342174977', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(256, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519584189, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 8, '662164877', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(257, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519584584, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 5, '269866987', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(258, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519584667, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 9, '1415710395', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(259, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1519587727, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '714895783', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(260, 27, 0, 0, 0, 0, 17, 1, NULL, 1519587762, 15, 'UPDATE_ON_LINK_TO_INVOICE', 17, 'INVOICE_MANAGER', 'LINKED', 6, '1120338854', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(261, 27, 0, 0, 0, 0, 17, 1, NULL, 1519587772, 15, 'ANALYSE', NULL, 'INVOICE_MANAGER', 'LINKED', 7, '1785256633', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(262, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519587833, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 8, '108722887', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(263, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519587939, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 9, '167062626', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(264, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519588098, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 10, '1408946830', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(265, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1519588101, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 3, '145539494', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(266, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519588124, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 10, '1055365405', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(267, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519588672, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 11, '1692793908', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(268, 25, 0, 0, 0, 0, 18, 1, NULL, 1519588691, 15, 'UPDATE_ON_LINK_TO_INVOICE', 18, 'INVOICE_MANAGER', 'LINKED', 11, '459009865', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(269, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519588864, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 12, '445125386', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(270, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519588901, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 12, '429736744', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(271, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519588926, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 13, '601435206', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(272, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1519588943, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 14, '2020545915', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(273, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1519589475, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 13, '342715151', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(274, 27, 0, 0, 0, 0, 19, 1, NULL, 1519589504, 15, 'UPDATE_ON_LINK_TO_INVOICE', 19, 'INVOICE_MANAGER', 'LINKED', 14, '1071576409', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(275, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1519590500, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 4, '1698068301', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(276, 28, 0, 0, 0, 0, 20, 1, NULL, 1519590529, 15, 'UPDATE_ON_LINK_TO_INVOICE', 20, 'INVOICE_MANAGER', 'LINKED', 5, '895681255', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(277, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1521109249, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 15, '1334632247', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(278, 25, 0, 0, 0, 0, 21, 1, NULL, 1521109312, 15, 'UPDATE_ON_LINK_TO_INVOICE', 21, 'INVOICE_MANAGER', 'LINKED', 16, '1682144326', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(279, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1521109566, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 12, '1829049145', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(280, 29, 0, 0, 0, 0, NULL, NULL, NULL, 1521109636, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 2, '1134826674', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(281, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1522081621, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 4, '1827304653', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(282, 31, 0, 0, 0, 0, 22, 1, NULL, 1522083281, 15, 'UPDATE_ON_LINK_TO_INVOICE', 22, 'INVOICE_MANAGER', 'LINKED', 13, '674672887', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(283, 29, 0, 0, 0, 0, NULL, NULL, NULL, 1523274456, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 3, '574392152', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(284, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1523274458, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 5, '112243543', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(285, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523525316, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 15, '696303878', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(286, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1523525346, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 9, '431462508', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(287, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1523525365, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 6, '286594316', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(288, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1523525389, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 17, '1800494883', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(289, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1523525400, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 6, '95418312', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(290, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1523525435, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 14, '1706764055', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(291, 31, 0, 0, 0, 0, NULL, NULL, NULL, 1523525581, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 15, '789099079', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(292, 31, 0, 0, 0, 0, 23, 1, NULL, 1523525617, 15, 'UPDATE_ON_LINK_TO_INVOICE', 23, 'INVOICE_MANAGER', 'LINKED', 16, '2069619335', 1, 1, '4988221', '2018-01-05', NULL, 'DEBIT', 2, 1),
(293, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1523526187, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 10, '695025582', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(294, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1523526205, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 7, '1482601484', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(295, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1523526212, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 18, '1755943389', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(296, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523526244, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 16, '1058853301', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(297, 18, 0, 0, 0, 0, NULL, NULL, NULL, 1523526262, 15, 'REJECT', NULL, 'STEP_3', 'REJECTED', 11, '1386219102', NULL, NULL, NULL, '2017-02-07', NULL, 'DEBIT', NULL, NULL),
(298, 20, 0, 0, 0, 0, 24, 1, NULL, 1523526273, 15, 'UPDATE_ON_LINK_TO_INVOICE', 24, 'INVOICE_MANAGER', 'LINKED', 8, '1659901455', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(299, 25, 0, 0, 0, 0, 25, 1, NULL, 1523526340, 15, 'UPDATE_ON_LINK_TO_INVOICE', 25, 'INVOICE_MANAGER', 'LINKED', 19, '590442801', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(300, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1523526360, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 20, '1704515086', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(301, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523526386, 15, 'SET_BACK_TO_STEP_2', NULL, 'STEP_3', 'PENDING', 17, '2095548321', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(302, 25, 0, 0, 0, 0, NULL, NULL, NULL, 1523526403, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 21, '1799867509', 2, 2, '1386134', '2017-08-31', NULL, 'DEBIT', 2, 1),
(303, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523892261, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 18, '1321727542', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(304, 27, 0, 0, 0, 0, 26, 1, NULL, 1523892383, 15, 'UPDATE_ON_LINK_TO_INVOICE', 26, 'INVOICE_MANAGER', 'LINKED', 19, '1087598094', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(305, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523894832, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 20, '738671703', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(306, 27, 0, 0, 0, 0, NULL, NULL, NULL, 1523895183, 15, 'REJECT', NULL, 'STEP_2', 'REJECTED', 21, '519086153', 2, 2, '1146031', '2018-01-03', NULL, 'DEBIT', 2, 1),
(307, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1523895186, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 7, '1018665993', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(308, 28, 0, 0, 0, 0, 27, 1, NULL, 1523895219, 15, 'UPDATE_ON_LINK_TO_INVOICE', 27, 'INVOICE_MANAGER', 'LINKED', 8, '1133313749', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(309, 29, 0, 0, 0, 0, NULL, NULL, NULL, 1525257105, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 4, '271210905', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(310, 29, 0, 0, 0, 0, 28, 1, NULL, 1525257151, 15, 'UPDATE_ON_LINK_TO_INVOICE', 28, 'INVOICE_MANAGER', 'LINKED', 5, '2000437558', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(311, 29, 0, 0, 0, 0, NULL, NULL, NULL, 1525257162, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 6, '813494607', 2, 2, '1146033', '2018-01-04', NULL, 'DEBIT', 2, 1),
(312, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1525667978, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 9, '278315525', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(313, 28, 0, 0, 0, 0, NULL, NULL, NULL, 1525676285, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 10, '1687387005', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(314, 28, 0, 0, 0, 0, 29, 1, NULL, 1525676360, 15, 'UPDATE_ON_LINK_TO_INVOICE', 29, 'INVOICE_MANAGER', 'LINKED', 11, '296541089', 2, 2, '1146032', '2018-01-04', NULL, 'DEBIT', 2, 1),
(315, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1525843767, 15, 'SET_BACK_TO_STEP_2', NULL, 'INVOICE_MANAGER', 'PENDING', 9, '151798333', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(316, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1525846274, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 6, '2061975076', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(317, 32, 0, 0, 0, 0, 30, 1, NULL, 1525848632, 15, 'UPDATE_ON_LINK_TO_INVOICE', 30, 'INVOICE_MANAGER', 'LINKED', 7, '645843699', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(318, 32, 0, 0, 0, 0, NULL, NULL, NULL, 1526656441, 2, 'SET_BACK_TO_STEP_3', NULL, 'INVOICE_MANAGER', 'APPROVED', 8, '374168797', 2, 2, '1146038', '2018-01-03', NULL, 'DEBIT', 2, 1),
(319, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1526989054, 2, 'ANALYSE', NULL, 'STEP_2', 'PENDING', 10, '720642679', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1),
(320, 20, 0, 0, 0, 0, NULL, NULL, NULL, 1531397387, 15, 'APPROVE', NULL, 'STEP_2', 'APPROVED', 11, '717312038', 1, 1, '4988209', '2017-04-23', NULL, 'DEBIT', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scan_batches`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scan_batches` (
  `invoice_scan_batch_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `file_id` int(1) unsigned NOT NULL,
  `original_electronic_invoice_id` int(1) unsigned DEFAULT NULL,
  `custom_reference_number` varchar(50) DEFAULT NULL,
  `invoice_location_group` varchar(100) DEFAULT NULL,
  `date_received` int(1) unsigned DEFAULT NULL,
  `default_supplier_id` int(1) unsigned DEFAULT NULL,
  `default_creditor_id` int(1) unsigned DEFAULT NULL,
  `default_delivery_location_id` int(1) unsigned DEFAULT NULL,
  `default_invoice_location_id` int(1) unsigned DEFAULT NULL,
  `default_year` year(4) DEFAULT NULL,
  `default_invoice_date` date DEFAULT NULL,
  `no_auto_splitting_invoice_scan_pages` tinyint(1) unsigned NOT NULL,
  `no_auto_processing_beyond_step_2` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ANALYSE','CANCEL','EXTRACT_PAGES','MARK_AS_CONFIDENTIAL','PROCESS','PROCESS_DATA_ELECTRONIC_INVOICE','PROCESS_RESULTS_ANALYSIS','UNMARK_AS_CONFIDENTIAL','UPDATE_ATTRIBUTES','UPDATE_STATUS','UPLOAD') NOT NULL,
  `source` enum('E-MAIL','INVOICE_MANAGER','INVOICE_PROCESSING_DAEMON','INVOICE_SCAN_BATCH_DETAILS','INVOICE_SCAN_BATCH_MANAGER','INVOICE_SCAN_BATCH_PROCESSING_CRON','INVOICE_SCAN_MANAGER','INVOICE_SHARING','STEP_1','NOT_SPECIFIED') NOT NULL,
  `status` enum('AUTOMATIC_PROCESSING','CANCELLED','EMPTY','EXTRACTING_PAGES','FAILED','IN_ANALYSIS','MANUAL_PROCESSING','NOT_FOUND','PROCESSED','QUEUED','READY_FOR_PROCESSING','UPLOADED') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `auto_generated_pdf` tinyint(1) unsigned NOT NULL,
  `auto_process_step_1` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `electronic_invoice_scan_batch` tinyint(1) unsigned NOT NULL,
  `erroneous` tinyint(1) unsigned NOT NULL,
  `splittable` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_scan_batch_id`),
  KEY `status` (`status`),
  KEY `uploaded_invoice_scan_batch_id` (`uploaded_invoice_scan_batch_id`),
  KEY `invoice_location_group` (`invoice_location_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ipro_invoice_scan_batches`
--

INSERT INTO `ipro_invoice_scan_batches` (`invoice_scan_batch_id`, `uploaded_invoice_scan_batch_id`, `file_id`, `original_electronic_invoice_id`, `custom_reference_number`, `invoice_location_group`, `date_received`, `default_supplier_id`, `default_creditor_id`, `default_delivery_location_id`, `default_invoice_location_id`, `default_year`, `default_invoice_date`, `no_auto_splitting_invoice_scan_pages`, `no_auto_processing_beyond_step_2`, `date`, `user_id`, `user_action`, `source`, `status`, `revision_id`, `revision_hash`, `auto_generated_pdf`, `auto_process_step_1`, `confidential`, `electronic_invoice_scan_batch`, `erroneous`, `splittable`) VALUES
(1, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503676257, NULL, 'UPDATE_STATUS', 'NOT_SPECIFIED', 'MANUAL_PROCESSING', 2, '1193210014', 1, 1, 0, 0, 0, 1),
(2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504535054, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '159532603', 0, 1, 0, 0, 0, 1),
(3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1523526262, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '903875743', 0, 1, 0, 0, 0, 1),
(4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511433029, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'PROCESSED', 9, '163760774', 0, 1, 0, 0, 0, 1),
(5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534562, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '1979420405', 0, 1, 0, 0, 0, 1),
(6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537074, NULL, 'UPDATE_STATUS', 'INVOICE_MANAGER', 'PROCESSED', 7, '1435686974', 0, 1, 0, 0, 0, 1),
(7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511432367, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'EMPTY', 7, '1640740462', 0, 1, 0, 0, 0, 1),
(8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1523526403, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '772672469', 0, 1, 0, 0, 0, 1),
(9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742442, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '621599700', 0, 1, 0, 0, 0, 1),
(10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747601, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '534905120', 0, 1, 0, 0, 0, 1);

--
-- Triggers `ipro_invoice_scan_batches`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceScanBatches`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceScanBatches` AFTER INSERT ON `ipro_invoice_scan_batches`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scan_batches_log ( invoice_scan_batch_id, uploaded_invoice_scan_batch_id, file_id, original_electronic_invoice_id, custom_reference_number, invoice_location_group, date_received, default_supplier_id, default_creditor_id, default_delivery_location_id, default_invoice_location_id, default_year, default_invoice_date, no_auto_splitting_invoice_scan_pages, no_auto_processing_beyond_step_2, date, user_id, user_action, source, status, revision_id, revision_hash, auto_generated_pdf, auto_process_step_1, confidential, electronic_invoice_scan_batch, erroneous, splittable ) VALUES ( NEW.invoice_scan_batch_id, NEW.uploaded_invoice_scan_batch_id, NEW.file_id, NEW.original_electronic_invoice_id, NEW.custom_reference_number, NEW.invoice_location_group, NEW.date_received, NEW.default_supplier_id, NEW.default_creditor_id, NEW.default_delivery_location_id, NEW.default_invoice_location_id, NEW.default_year, NEW.default_invoice_date, NEW.no_auto_splitting_invoice_scan_pages, NEW.no_auto_processing_beyond_step_2, NEW.date, NEW.user_id, NEW.user_action, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash, NEW.auto_generated_pdf, NEW.auto_process_step_1, NEW.confidential, NEW.electronic_invoice_scan_batch, NEW.erroneous, NEW.splittable ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceScanBatches`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceScanBatches` AFTER UPDATE ON `ipro_invoice_scan_batches`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scan_batches_log ( invoice_scan_batch_id, uploaded_invoice_scan_batch_id, file_id, original_electronic_invoice_id, custom_reference_number, invoice_location_group, date_received, default_supplier_id, default_creditor_id, default_delivery_location_id, default_invoice_location_id, default_year, default_invoice_date, no_auto_splitting_invoice_scan_pages, no_auto_processing_beyond_step_2, date, user_id, user_action, source, status, revision_id, revision_hash, auto_generated_pdf, auto_process_step_1, confidential, electronic_invoice_scan_batch, erroneous, splittable ) VALUES ( NEW.invoice_scan_batch_id, NEW.uploaded_invoice_scan_batch_id, NEW.file_id, NEW.original_electronic_invoice_id, NEW.custom_reference_number, NEW.invoice_location_group, NEW.date_received, NEW.default_supplier_id, NEW.default_creditor_id, NEW.default_delivery_location_id, NEW.default_invoice_location_id, NEW.default_year, NEW.default_invoice_date, NEW.no_auto_splitting_invoice_scan_pages, NEW.no_auto_processing_beyond_step_2, NEW.date, NEW.user_id, NEW.user_action, NEW.source, NEW.status, NEW.revision_id, NEW.revision_hash, NEW.auto_generated_pdf, NEW.auto_process_step_1, NEW.confidential, NEW.electronic_invoice_scan_batch, NEW.erroneous, NEW.splittable ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scan_batches_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scan_batches_log` (
  `invoice_scan_batch_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_batch_id` int(1) unsigned NOT NULL,
  `uploaded_invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `file_id` int(1) unsigned NOT NULL,
  `original_electronic_invoice_id` int(1) unsigned DEFAULT NULL,
  `custom_reference_number` varchar(50) DEFAULT NULL,
  `invoice_location_group` varchar(100) DEFAULT NULL,
  `date_received` int(1) unsigned DEFAULT NULL,
  `default_supplier_id` int(1) unsigned DEFAULT NULL,
  `default_creditor_id` int(1) unsigned DEFAULT NULL,
  `default_delivery_location_id` int(1) unsigned DEFAULT NULL,
  `default_invoice_location_id` int(1) unsigned DEFAULT NULL,
  `default_year` year(4) DEFAULT NULL,
  `default_invoice_date` date DEFAULT NULL,
  `no_auto_splitting_invoice_scan_pages` tinyint(1) unsigned NOT NULL,
  `no_auto_processing_beyond_step_2` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `user_action` enum('ANALYSE','CANCEL','EXTRACT_PAGES','MARK_AS_CONFIDENTIAL','PROCESS','PROCESS_DATA_ELECTRONIC_INVOICE','PROCESS_RESULTS_ANALYSIS','UNMARK_AS_CONFIDENTIAL','UPDATE_ATTRIBUTES','UPDATE_STATUS','UPLOAD') NOT NULL,
  `source` enum('E-MAIL','INVOICE_MANAGER','INVOICE_PROCESSING_DAEMON','INVOICE_SCAN_BATCH_DETAILS','INVOICE_SCAN_BATCH_MANAGER','INVOICE_SCAN_BATCH_PROCESSING_CRON','INVOICE_SCAN_MANAGER','INVOICE_SHARING','STEP_1','NOT_SPECIFIED') NOT NULL,
  `status` enum('AUTOMATIC_PROCESSING','CANCELLED','EMPTY','EXTRACTING_PAGES','FAILED','IN_ANALYSIS','MANUAL_PROCESSING','NOT_FOUND','PROCESSED','QUEUED','READY_FOR_PROCESSING','UPLOADED') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  `auto_generated_pdf` tinyint(1) unsigned NOT NULL,
  `auto_process_step_1` tinyint(1) unsigned NOT NULL,
  `confidential` tinyint(1) unsigned NOT NULL,
  `electronic_invoice_scan_batch` tinyint(1) unsigned NOT NULL,
  `erroneous` tinyint(1) unsigned NOT NULL,
  `splittable` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_scan_batch_log_id`),
  KEY `status` (`status`),
  KEY `invoice_scan_batch_id` (`invoice_scan_batch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `ipro_invoice_scan_batches_log`
--

INSERT INTO `ipro_invoice_scan_batches_log` (`invoice_scan_batch_log_id`, `invoice_scan_batch_id`, `uploaded_invoice_scan_batch_id`, `file_id`, `original_electronic_invoice_id`, `custom_reference_number`, `invoice_location_group`, `date_received`, `default_supplier_id`, `default_creditor_id`, `default_delivery_location_id`, `default_invoice_location_id`, `default_year`, `default_invoice_date`, `no_auto_splitting_invoice_scan_pages`, `no_auto_processing_beyond_step_2`, `date`, `user_id`, `user_action`, `source`, `status`, `revision_id`, `revision_hash`, `auto_generated_pdf`, `auto_process_step_1`, `confidential`, `electronic_invoice_scan_batch`, `erroneous`, `splittable`) VALUES
(1, 1, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503676257, NULL, 'UPLOAD', 'NOT_SPECIFIED', 'UPLOADED', 1, '1044786504', 1, 1, 0, 0, 0, 1),
(2, 1, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503676257, NULL, 'UPDATE_STATUS', 'NOT_SPECIFIED', 'MANUAL_PROCESSING', 2, '1193210014', 1, 1, 0, 0, 0, 1),
(3, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503914949, 6, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '379108162', 0, 1, 0, 0, 0, 1),
(4, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503914963, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '587546', 0, 1, 0, 0, 0, 1),
(5, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503914970, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '190066', 0, 1, 0, 0, 0, 1),
(6, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503915301, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '709451733', 0, 1, 0, 0, 0, 1),
(7, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503915302, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '129028598', 0, 1, 0, 0, 0, 1),
(8, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1503915302, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '2022276119', 0, 1, 0, 0, 0, 1),
(9, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504006675, 6, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '1050227911', 0, 1, 0, 0, 0, 1),
(10, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504013465, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '277079', 0, 1, 0, 0, 0, 1),
(11, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504013473, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '412299', 0, 1, 0, 0, 0, 1),
(12, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504013521, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '796806987', 0, 1, 0, 0, 0, 1),
(13, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504013521, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '555235433', 0, 1, 0, 0, 0, 1),
(14, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504013521, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '982579256', 0, 1, 0, 0, 0, 1),
(15, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532563, 2, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '194129349', 0, 1, 0, 0, 0, 1),
(16, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532569, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '663206', 0, 1, 0, 0, 0, 1),
(17, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532571, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '107010', 0, 1, 0, 0, 0, 1),
(18, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532581, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '1775244482', 0, 1, 0, 0, 0, 1),
(19, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532582, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '746696870', 0, 1, 0, 0, 0, 1),
(20, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504532582, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '144088874', 0, 1, 0, 0, 0, 1),
(21, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534445, NULL, 'UPDATE_STATUS', 'INVOICE_MANAGER', 'PROCESSED', 7, '1237315234', 0, 1, 0, 0, 0, 1),
(22, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534490, 2, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '741367270', 0, 1, 0, 0, 0, 1),
(23, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534505, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '561716', 0, 1, 0, 0, 0, 1),
(24, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534506, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '489835', 0, 1, 0, 0, 0, 1),
(25, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534562, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '1484838556', 0, 1, 0, 0, 0, 1),
(26, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534562, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '791079316', 0, 1, 0, 0, 0, 1),
(27, 5, 15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504534562, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '1979420405', 0, 1, 0, 0, 0, 1),
(28, 2, 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504535054, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '159532603', 0, 1, 0, 0, 0, 1),
(29, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536932, 2, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '1696279753', 0, 1, 0, 0, 0, 1),
(30, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536935, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '239796', 0, 1, 0, 0, 0, 1),
(31, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536936, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '279833', 0, 1, 0, 0, 0, 1),
(32, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536961, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '610936698', 0, 1, 0, 0, 0, 1),
(33, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536961, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '1153826337', 0, 1, 0, 0, 0, 1),
(34, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504536961, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '433416125', 0, 1, 0, 0, 0, 1),
(35, 6, 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537074, NULL, 'UPDATE_STATUS', 'INVOICE_MANAGER', 'PROCESSED', 7, '1435686974', 0, 1, 0, 0, 0, 1),
(36, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537082, 2, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '838383614', 0, 1, 0, 0, 0, 1),
(37, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537085, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '776632', 0, 1, 0, 0, 0, 1),
(38, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537086, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '553608', 0, 1, 0, 0, 0, 1),
(39, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537142, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '2023285907', 0, 1, 0, 0, 0, 1),
(40, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537142, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '804272962', 0, 1, 0, 0, 0, 1),
(41, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1504537142, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '1969300045', 0, 1, 0, 0, 0, 1),
(42, 7, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511432367, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'EMPTY', 7, '1640740462', 0, 1, 0, 0, 0, 1),
(43, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511432948, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'MANUAL_PROCESSING', 8, '461832888', 0, 1, 0, 0, 0, 1),
(44, 4, 14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511433029, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'PROCESSED', 9, '163760774', 0, 1, 0, 0, 0, 1),
(45, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435771, 2, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '549064714', 0, 1, 0, 0, 0, 1),
(46, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435774, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '170597', 0, 1, 0, 0, 0, 1),
(47, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435776, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '120887', 0, 1, 0, 0, 0, 1),
(48, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435821, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '1524744038', 0, 1, 0, 0, 0, 1),
(49, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435821, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '1434821555', 0, 1, 0, 0, 0, 1),
(50, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1511435821, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '866753440', 0, 1, 0, 0, 0, 1),
(51, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742243, 15, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '1615598653', 0, 1, 0, 0, 0, 1),
(52, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742253, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '693077', 0, 1, 0, 0, 0, 1),
(53, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742262, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '669309', 0, 1, 0, 0, 0, 1),
(54, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742441, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '2136931868', 0, 1, 0, 0, 0, 1),
(55, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742442, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '1909522416', 0, 1, 0, 0, 0, 1),
(56, 9, 3295, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515742442, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '621599700', 0, 1, 0, 0, 0, 1),
(57, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747558, 15, 'UPLOAD', 'STEP_1', 'UPLOADED', 1, '1887115546', 0, 1, 0, 0, 0, 1),
(58, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747565, NULL, 'EXTRACT_PAGES', 'INVOICE_PROCESSING_DAEMON', 'EXTRACTING_PAGES', 2, '599820', 0, 1, 0, 0, 0, 1),
(59, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747569, NULL, 'UPDATE_STATUS', 'INVOICE_PROCESSING_DAEMON', 'QUEUED', 3, '122319', 0, 1, 0, 0, 0, 1),
(60, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747601, 2, 'ANALYSE', 'INVOICE_SCAN_BATCH_PROCESSING_CRON', 'IN_ANALYSIS', 4, '1220441135', 0, 1, 0, 0, 0, 1),
(61, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747601, 2, 'PROCESS_RESULTS_ANALYSIS', 'INVOICE_SCAN_BATCH_MANAGER', 'AUTOMATIC_PROCESSING', 5, '1143657856', 0, 1, 0, 0, 0, 1),
(62, 10, 3301, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1515747601, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_BATCH_MANAGER', 'MANUAL_PROCESSING', 6, '534905120', 0, 1, 0, 0, 0, 1),
(63, 3, 3, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1523526262, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '903875743', 0, 1, 0, 0, 0, 1),
(64, 8, 3126, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1523526403, NULL, 'UPDATE_STATUS', 'INVOICE_SCAN_MANAGER', 'CANCELLED', 7, '772672469', 0, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scan_pages`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scan_pages` (
  `invoice_scan_page_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_id` int(1) unsigned DEFAULT NULL,
  `since_revision_id` int(1) unsigned DEFAULT NULL,
  `ranking` int(1) unsigned DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `add_date` int(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_scan_page_id`),
  KEY `invoice_scan_batch_id` (`invoice_scan_batch_id`),
  KEY `invoice_scan_id` (`invoice_scan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `ipro_invoice_scan_pages`
--

INSERT INTO `ipro_invoice_scan_pages` (`invoice_scan_page_id`, `uploaded_invoice_scan_batch_id`, `invoice_scan_batch_id`, `invoice_scan_id`, `since_revision_id`, `ranking`, `filename`, `add_date`) VALUES
(10, NULL, 1, 5, 1, 1, '', 1503676795),
(11, 2, 2, 21, 1, 1, '1503914948.9818_4801_1.jpg', 1503914970),
(12, 2, 2, 22, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(13, NULL, 1, 11, 1, 1, '', 1504001662),
(14, 3, 3, 18, 1, 1, '1504006675.7221_7459_1.jpg', 1504013473),
(15, 3, 3, 18, 6, 2, '1504006675.7221_7459_2.jpg', 1504013473),
(16, 3, 3, 18, 6, 3, '1504006675.7221_7459_3.jpg', 1504013473),
(17, 14, 4, 19, 1, 1, '1504532563.2204_8790_1.jpg', 1504532571),
(18, 15, 5, 20, 1, 1, '1504534490.5812_8032_1.jpg', 1504534506),
(19, 16, 6, 23, 1, 1, '1504536932.1985_8320_1.jpg', 1504536936),
(20, 17, 4, 24, 11, 1, '1504537082.5661_4547_1.jpg', 1504537086),
(21, 3126, 8, 25, 1, 1, '1511435771.4657_2532_1.jpg', 1511435776),
(22, 3295, 9, 31, 1, 1, '1515742243.0355_2889_1.jpg', 1515742262),
(23, 3295, 9, 30, 1, 1, '1515742243.0355_2889_2.jpg', 1515742262),
(24, 3295, 9, 27, 1, 1, '1515742243.0355_2889_3.jpg', 1515742262),
(25, 3295, 9, 28, 1, 1, '1515742243.0355_2889_4.jpg', 1515742262),
(26, 3295, 9, 29, 1, 1, '1515742243.0355_2889_5.jpg', 1515742262),
(27, 3301, 10, 32, 1, 1, '1515747558.283_2733_1.jpg', 1515747569),
(28, 3301, 10, 32, 2, 2, '1515747558.283_2733_2.jpg', 1515747569);

--
-- Triggers `ipro_invoice_scan_pages`
--
DROP TRIGGER IF EXISTS `afterInsertIproInvoiceScanPages`;
DELIMITER //
CREATE TRIGGER `afterInsertIproInvoiceScanPages` AFTER INSERT ON `ipro_invoice_scan_pages`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scan_pages_log ( invoice_scan_page_id, uploaded_invoice_scan_batch_id, invoice_scan_batch_id, invoice_scan_id, since_revision_id, ranking, filename, add_date ) VALUES ( NEW.invoice_scan_page_id, NEW.uploaded_invoice_scan_batch_id, NEW.invoice_scan_batch_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.ranking, NEW.filename, NEW.add_date ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproInvoiceScanPages`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproInvoiceScanPages` AFTER UPDATE ON `ipro_invoice_scan_pages`
 FOR EACH ROW BEGIN INSERT INTO ipro_invoice_scan_pages_log ( invoice_scan_page_id, uploaded_invoice_scan_batch_id, invoice_scan_batch_id, invoice_scan_id, since_revision_id, ranking, filename, add_date ) VALUES ( NEW.invoice_scan_page_id, NEW.uploaded_invoice_scan_batch_id, NEW.invoice_scan_batch_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.ranking, NEW.filename, NEW.add_date ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_invoice_scan_pages_log`
--

CREATE TABLE IF NOT EXISTS `ipro_invoice_scan_pages_log` (
  `invoice_scan_page_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_page_id` int(1) unsigned NOT NULL,
  `uploaded_invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_batch_id` int(1) unsigned DEFAULT NULL,
  `invoice_scan_id` int(1) unsigned DEFAULT NULL,
  `since_revision_id` int(1) unsigned DEFAULT NULL,
  `ranking` int(1) unsigned DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `add_date` int(1) unsigned NOT NULL,
  PRIMARY KEY (`invoice_scan_page_log_id`),
  KEY `invoice_scan_id` (`invoice_scan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=148 ;

--
-- Dumping data for table `ipro_invoice_scan_pages_log`
--

INSERT INTO `ipro_invoice_scan_pages_log` (`invoice_scan_page_log_id`, `invoice_scan_page_id`, `uploaded_invoice_scan_batch_id`, `invoice_scan_batch_id`, `invoice_scan_id`, `since_revision_id`, `ranking`, `filename`, `add_date`) VALUES
(19, 10, NULL, 1, NULL, NULL, NULL, '', 1503676795),
(20, 10, NULL, 1, 5, 1, 1, '', 1503676795),
(21, 11, 2, 2, NULL, NULL, NULL, '1503914948.9818_4801_1.jpg', 1503914970),
(22, 12, 2, 2, NULL, NULL, NULL, '1503914948.9818_4801_2.jpg', 1503914970),
(23, 11, 2, 2, 6, 1, 1, '1503914948.9818_4801_1.jpg', 1503914970),
(24, 12, 2, 2, 7, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(25, 12, 2, 2, 6, 2, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(26, 12, 2, 2, 8, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(27, 12, 2, 2, 6, 4, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(28, 12, 2, 2, 9, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(29, 12, 2, 2, 6, 6, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(30, 12, 2, 2, 10, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(31, 12, 2, 2, 6, 8, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(32, 12, 2, 2, 11, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(33, 12, 2, 2, 6, 10, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(34, 12, 2, 2, 12, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(35, 12, 2, 2, 6, 12, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(36, 12, 2, 2, 13, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(37, 12, 2, 2, 6, 14, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(38, 12, 2, 2, 14, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(39, 12, 2, 2, 6, 17, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(40, 12, 2, 2, 15, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(41, 12, 2, 2, 6, 20, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(42, 12, 2, 2, 16, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(43, 12, 2, 2, 6, 22, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(44, 12, 2, 2, 17, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(45, 12, 2, 2, 6, 24, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(46, 12, 2, 2, 18, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(47, 12, 2, 2, 6, 26, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(48, 12, 2, 2, 19, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(49, 12, 2, 2, 6, 28, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(50, 12, 2, 2, 20, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(51, 12, 2, 2, 6, 30, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(52, 12, 2, 2, 21, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(53, 12, 2, 2, 6, 32, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(54, 12, 2, 2, 22, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(55, 12, 2, 2, 6, 34, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(56, 12, 2, 2, 23, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(57, 12, 2, 2, 6, 36, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(58, 12, 2, 2, 24, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(59, 12, 2, 2, 6, 38, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(60, 12, 2, 2, 7, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(61, 12, 2, 2, 6, 40, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(62, 12, 2, 2, 8, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(63, 12, 2, 2, 6, 42, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(64, 12, 2, 2, 9, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(65, 12, 2, 2, 6, 44, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(66, 12, 2, 2, 10, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(67, 12, 2, 2, 6, 46, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(68, 12, 2, 2, 11, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(69, 12, 2, 2, 6, 48, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(70, 12, 2, 2, 12, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(71, 12, 2, 2, 6, 50, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(72, 12, 2, 2, 13, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(73, 12, 2, 2, 6, 52, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(74, 12, 2, 2, 14, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(75, 12, 2, 2, 6, 54, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(76, 12, 2, 2, 15, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(77, 12, 2, 2, 6, 56, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(78, 12, 2, 2, 7, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(79, 12, 2, 2, 6, 58, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(80, 12, 2, 2, 8, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(81, 12, 2, 2, 6, 60, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(82, 12, 2, 2, 9, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(83, 12, 2, 2, 6, 62, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(84, 12, 2, 2, 10, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(85, 12, 2, 2, 6, 64, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(86, 13, NULL, 1, NULL, NULL, NULL, '', 1504001662),
(87, 13, NULL, 1, 11, 1, 1, '', 1504001662),
(88, 12, 2, 2, 12, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(89, 12, 2, 2, 6, 66, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(90, 12, 2, 2, 13, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(91, 12, 2, 2, 6, 68, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(92, 12, 2, 2, 14, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(93, 12, 2, 2, 6, 70, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(94, 12, 2, 2, 15, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(95, 12, 2, 2, 6, 72, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(96, 12, 2, 2, 16, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(97, 12, 2, 2, 6, 74, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(98, 12, 2, 2, 17, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(99, 12, 2, 2, 6, 76, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(100, 14, 3, 3, NULL, NULL, NULL, '1504006675.7221_7459_1.jpg', 1504013473),
(101, 15, 3, 3, NULL, NULL, NULL, '1504006675.7221_7459_2.jpg', 1504013473),
(102, 16, 3, 3, NULL, NULL, NULL, '1504006675.7221_7459_3.jpg', 1504013473),
(103, 14, 3, 3, 18, 1, 1, '1504006675.7221_7459_1.jpg', 1504013473),
(104, 15, 3, 3, 19, 1, 1, '1504006675.7221_7459_2.jpg', 1504013473),
(105, 16, 3, 3, 20, 1, 1, '1504006675.7221_7459_3.jpg', 1504013473),
(106, 16, 3, 3, 19, 2, 2, '1504006675.7221_7459_3.jpg', 1504013473),
(107, 15, 3, 3, 18, 2, 2, '1504006675.7221_7459_2.jpg', 1504013473),
(108, 16, 3, 3, 18, 2, 3, '1504006675.7221_7459_3.jpg', 1504013473),
(109, 15, 3, 3, 18, 5, 3, '1504006675.7221_7459_2.jpg', 1504013473),
(110, 16, 3, 3, 18, 5, 2, '1504006675.7221_7459_3.jpg', 1504013473),
(111, 16, 3, 3, 18, 6, 3, '1504006675.7221_7459_3.jpg', 1504013473),
(112, 15, 3, 3, 18, 6, 2, '1504006675.7221_7459_2.jpg', 1504013473),
(113, 12, 2, 2, 21, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(114, 12, 2, 2, 6, 79, 2, '1503914948.9818_4801_2.jpg', 1503914970),
(115, 17, 14, 4, NULL, NULL, NULL, '1504532563.2204_8790_1.jpg', 1504532571),
(116, 17, 14, 4, 19, 1, 1, '1504532563.2204_8790_1.jpg', 1504532571),
(117, 18, 15, 5, NULL, NULL, NULL, '1504534490.5812_8032_1.jpg', 1504534506),
(118, 18, 15, 5, 20, 1, 1, '1504534490.5812_8032_1.jpg', 1504534506),
(119, 11, 2, 2, 21, 1, 1, '1503914948.9818_4801_1.jpg', 1503914970),
(120, 12, 2, 2, 6, 81, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(121, 12, 2, 2, 22, 1, 1, '1503914948.9818_4801_2.jpg', 1503914970),
(122, 19, 16, 6, NULL, NULL, NULL, '1504536932.1985_8320_1.jpg', 1504536936),
(123, 19, 16, 6, 23, 1, 1, '1504536932.1985_8320_1.jpg', 1504536936),
(124, 20, 17, 7, NULL, NULL, NULL, '1504537082.5661_4547_1.jpg', 1504537086),
(125, 20, 17, 7, 24, 1, 1, '1504537082.5661_4547_1.jpg', 1504537086),
(126, 20, 17, 5, 24, 6, 1, '1504537082.5661_4547_1.jpg', 1504537086),
(127, 20, 17, 4, 24, 11, 1, '1504537082.5661_4547_1.jpg', 1504537086),
(128, 21, 3126, 8, NULL, NULL, NULL, '1511435771.4657_2532_1.jpg', 1511435776),
(129, 21, 3126, 8, 25, 1, 1, '1511435771.4657_2532_1.jpg', 1511435776),
(130, 22, 3295, 9, NULL, NULL, NULL, '1515742243.0355_2889_1.jpg', 1515742262),
(131, 23, 3295, 9, NULL, NULL, NULL, '1515742243.0355_2889_2.jpg', 1515742262),
(132, 24, 3295, 9, NULL, NULL, NULL, '1515742243.0355_2889_3.jpg', 1515742262),
(133, 25, 3295, 9, NULL, NULL, NULL, '1515742243.0355_2889_4.jpg', 1515742262),
(134, 26, 3295, 9, NULL, NULL, NULL, '1515742243.0355_2889_5.jpg', 1515742262),
(135, 22, 3295, 9, 26, 1, 1, '1515742243.0355_2889_1.jpg', 1515742262),
(136, 23, 3295, 9, 26, 1, 2, '1515742243.0355_2889_2.jpg', 1515742262),
(137, 24, 3295, 9, 27, 1, 1, '1515742243.0355_2889_3.jpg', 1515742262),
(138, 25, 3295, 9, 28, 1, 1, '1515742243.0355_2889_4.jpg', 1515742262),
(139, 26, 3295, 9, 29, 1, 1, '1515742243.0355_2889_5.jpg', 1515742262),
(140, 23, 3295, 9, 30, 1, 1, '1515742243.0355_2889_2.jpg', 1515742262),
(141, 22, 3295, 9, 30, 3, 2, '1515742243.0355_2889_1.jpg', 1515742262),
(142, 22, 3295, 9, 31, 1, 1, '1515742243.0355_2889_1.jpg', 1515742262),
(143, 27, 3301, 10, NULL, NULL, NULL, '1515747558.283_2733_1.jpg', 1515747569),
(144, 28, 3301, 10, NULL, NULL, NULL, '1515747558.283_2733_2.jpg', 1515747569),
(145, 27, 3301, 10, 32, 1, 1, '1515747558.283_2733_1.jpg', 1515747569),
(146, 28, 3301, 10, 33, 1, 1, '1515747558.283_2733_2.jpg', 1515747569),
(147, 28, 3301, 10, 32, 2, 2, '1515747558.283_2733_2.jpg', 1515747569);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_location_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_location_settings` (
  `location_id` int(1) unsigned NOT NULL,
  `ignore_by_ai` tinyint(1) unsigned NOT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned NOT NULL,
  `source` enum('INVOICE_SETTINGS') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  `revision_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_object_numbers`
--

CREATE TABLE IF NOT EXISTS `ipro_object_numbers` (
  `object_number_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` enum('INVOICE') NOT NULL,
  `year` int(4) unsigned NOT NULL,
  `prefix` varchar(10) NOT NULL,
  `number` bigint(1) unsigned NOT NULL,
  PRIMARY KEY (`object_number_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `ipro_object_numbers`
--

INSERT INTO `ipro_object_numbers` (`object_number_id`, `object_type`, `year`, `prefix`, `number`) VALUES
(1, 'INVOICE', 2005, 'INV', 2005000001),
(2, 'INVOICE', 2006, 'INV', 2006000001),
(3, 'INVOICE', 2007, 'INV', 2007000001),
(4, 'INVOICE', 2008, 'INV', 2008000001),
(5, 'INVOICE', 2009, 'INV', 2009000001),
(6, 'INVOICE', 2010, 'INV', 2010000001),
(7, 'INVOICE', 2011, 'INV', 2011000001),
(8, 'INVOICE', 2012, 'INV', 2012000001),
(9, 'INVOICE', 2013, 'INV', 2013000001),
(10, 'INVOICE', 2014, 'INV', 2014000001),
(11, 'INVOICE', 2015, 'INV', 2015000001),
(12, 'INVOICE', 2016, 'INV', 2016000001),
(13, 'INVOICE', 2017, 'INV', 2017000007),
(14, 'INVOICE', 2018, 'INV', 2018000019),
(15, 'INVOICE', 2019, 'INV', 2019000001),
(16, 'INVOICE', 2020, 'INV', 2020000001),
(17, 'INVOICE', 2021, 'INV', 2021000001),
(18, 'INVOICE', 2022, 'INV', 2022000001),
(19, 'INVOICE', 2023, 'INV', 2023000001),
(20, 'INVOICE', 2024, 'INV', 2024000001),
(21, 'INVOICE', 2025, 'INV', 2025000001),
(22, 'INVOICE', 2026, 'INV', 2026000001),
(23, 'INVOICE', 2027, 'INV', 2027000001),
(24, 'INVOICE', 2028, 'INV', 2028000001),
(25, 'INVOICE', 2029, 'INV', 2029000001),
(26, 'INVOICE', 2030, 'INV', 2030000001),
(27, 'INVOICE', 2031, 'INV', 2031000001),
(28, 'INVOICE', 2032, 'INV', 2032000001),
(29, 'INVOICE', 2033, 'INV', 2033000001),
(30, 'INVOICE', 2034, 'INV', 2034000001),
(31, 'INVOICE', 2035, 'INV', 2035000001),
(32, 'INVOICE', 2036, 'INV', 2036000001),
(33, 'INVOICE', 2037, 'INV', 2037000001),
(34, 'INVOICE', 2038, 'INV', 2038000001),
(35, 'INVOICE', 2039, 'INV', 2039000001),
(36, 'INVOICE', 2040, 'INV', 2040000001),
(37, 'INVOICE', 2041, 'INV', 2041000001),
(38, 'INVOICE', 2042, 'INV', 2042000001),
(39, 'INVOICE', 2043, 'INV', 2043000001),
(40, 'INVOICE', 2044, 'INV', 2044000001),
(41, 'INVOICE', 2045, 'INV', 2045000001),
(42, 'INVOICE', 2046, 'INV', 2046000001),
(43, 'INVOICE', 2047, 'INV', 2047000001),
(44, 'INVOICE', 2048, 'INV', 2048000001),
(45, 'INVOICE', 2049, 'INV', 2049000001),
(46, 'INVOICE', 2050, 'INV', 2050000001);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_ocr_locations`
--

CREATE TABLE IF NOT EXISTS `ipro_ocr_locations` (
  `location_id` int(1) unsigned NOT NULL,
  `location_type` enum('DELIVERY','INTERNAL','INVOICE') NOT NULL,
  `original_external_location_name` varchar(255) DEFAULT NULL,
  `ocr_external_location_name` varchar(255) DEFAULT NULL,
  `original_department` varchar(255) DEFAULT NULL,
  `ocr_department` varchar(255) DEFAULT NULL,
  `original_address` varchar(255) DEFAULT NULL,
  `ocr_address` varchar(255) DEFAULT NULL,
  `original_zip_code` varchar(255) DEFAULT NULL,
  `ocr_zip_code` varchar(255) DEFAULT NULL,
  `original_city` varchar(255) DEFAULT NULL,
  `ocr_city` varchar(255) DEFAULT NULL,
  `original_vat_number` varchar(255) DEFAULT NULL,
  `ocr_vat_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ipro_ocr_locations`
--

INSERT INTO `ipro_ocr_locations` (`location_id`, `location_type`, `original_external_location_name`, `ocr_external_location_name`, `original_department`, `ocr_department`, `original_address`, `ocr_address`, `original_zip_code`, `ocr_zip_code`, `original_city`, `ocr_city`, `original_vat_number`, `ocr_vat_number`) VALUES
(1, 'DELIVERY', 'Quantum Foam Solutions B.V.', 'quan1umf0am501u110n58v', 'Warehouse', 'wareh0u5e', 'Heermanskade 42a', 'heerman5kade42a', '3031 AC', '3031ac', 'Rotterdam', 'r011erdam', 'NL 00 47 90 996 B15', 'n1004790996815'),
(2, 'INVOICE', 'Quantum Foam Solutions B.V.', 'quan1umf0am501u110n58v', 'Finance department', 'f1nancedepar1men1', 'J. Wheelerlaan 8', 'jwhee1er1aan8', '4581 GB', '4581g8', 'Moerdijk', 'm0erd1jk', 'NL004790996B15', 'n1004790996815');

-- --------------------------------------------------------

--
-- Table structure for table `ipro_ocr_purchase_orders`
--

CREATE TABLE IF NOT EXISTS `ipro_ocr_purchase_orders` (
  `purchase_order_id` int(1) unsigned NOT NULL,
  `original_purchase_order_number` varchar(12) DEFAULT NULL,
  `ocr_purchase_order_number` varchar(12) DEFAULT NULL,
  `original_custom_po_number` varchar(100) DEFAULT NULL,
  `ocr_custom_po_number` varchar(100) DEFAULT NULL,
  `original_supplier_order_number` varchar(150) DEFAULT NULL,
  `ocr_supplier_order_number` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_ocr_suppliers`
--

CREATE TABLE IF NOT EXISTS `ipro_ocr_suppliers` (
  `supplier_id` int(1) unsigned NOT NULL,
  `original_supplier_name` varchar(255) DEFAULT NULL,
  `ocr_supplier_name` varchar(255) DEFAULT NULL,
  `original_address` varchar(255) DEFAULT NULL,
  `ocr_address` varchar(255) DEFAULT NULL,
  `original_zip_code` varchar(255) DEFAULT NULL,
  `ocr_zip_code` varchar(255) DEFAULT NULL,
  `original_city` varchar(255) DEFAULT NULL,
  `ocr_city` varchar(255) DEFAULT NULL,
  `original_phone_number` varchar(255) DEFAULT NULL,
  `ocr_phone_number` varchar(255) DEFAULT NULL,
  `original_fax_number` varchar(255) DEFAULT NULL,
  `ocr_fax_number` varchar(255) DEFAULT NULL,
  `original_mobile_number` varchar(255) DEFAULT NULL,
  `ocr_mobile_number` varchar(255) DEFAULT NULL,
  `original_email_address` varchar(255) DEFAULT NULL,
  `ocr_email_address` varchar(255) DEFAULT NULL,
  `original_customer_number` varchar(255) DEFAULT NULL,
  `ocr_customer_number` varchar(255) DEFAULT NULL,
  `original_account_number` varchar(255) DEFAULT NULL,
  `ocr_account_number` varchar(255) DEFAULT NULL,
  `original_iban_number` varchar(255) DEFAULT NULL,
  `ocr_iban_number` varchar(255) DEFAULT NULL,
  `stripped_iban_number` varchar(255) DEFAULT NULL,
  `original_bic_number` varchar(255) DEFAULT NULL,
  `ocr_bic_number` varchar(255) DEFAULT NULL,
  `original_chamber_of_commerce_number` varchar(255) DEFAULT NULL,
  `ocr_chamber_of_commerce_number` varchar(255) DEFAULT NULL,
  `original_vat_number` varchar(255) DEFAULT NULL,
  `ocr_vat_number` varchar(255) DEFAULT NULL,
  `original_g_account_number` varchar(255) DEFAULT NULL,
  `ocr_g_account_number` varchar(255) DEFAULT NULL,
  `original_g_iban_number` varchar(255) DEFAULT NULL,
  `ocr_g_iban_number` varchar(255) DEFAULT NULL,
  `original_g_bic_number` varchar(255) DEFAULT NULL,
  `ocr_g_bic_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ipro_ocr_suppliers`
--

INSERT INTO `ipro_ocr_suppliers` (`supplier_id`, `original_supplier_name`, `ocr_supplier_name`, `original_address`, `ocr_address`, `original_zip_code`, `ocr_zip_code`, `original_city`, `ocr_city`, `original_phone_number`, `ocr_phone_number`, `original_fax_number`, `ocr_fax_number`, `original_mobile_number`, `ocr_mobile_number`, `original_email_address`, `ocr_email_address`, `original_customer_number`, `ocr_customer_number`, `original_account_number`, `ocr_account_number`, `original_iban_number`, `ocr_iban_number`, `stripped_iban_number`, `original_bic_number`, `ocr_bic_number`, `original_chamber_of_commerce_number`, `ocr_chamber_of_commerce_number`, `original_vat_number`, `ocr_vat_number`, `original_g_account_number`, `ocr_g_account_number`, `original_g_iban_number`, `ocr_g_iban_number`, `original_g_bic_number`, `ocr_g_bic_number`) VALUES
(1, 'Cartridge World', 'car1r1dgew0r1d', 'Claude Debussylaan 46', 'c1audede8u55y1aan48', '1082MD', '1082md', 'Amsterdam', 'am51erdam', '0031 (0)294 - 78 71 23', '294787123', '0031 (0)294 - 78 71 24', '294787124', '', '', 'info@cartridgeworld.com', '1nf0@car1r1dgew0r1dc0m', '761329', '761329', '65.15.71.316', '651571316', 'NL87 INGB 0651 5713 16', 'n1871ng80651571316', 'NL87INGB0651571316', '', '', '33267823', '33267823', 'NL80 42 92 504 B01', 'n1804292504801', '', '', '', '', '', ''),
(2, 'NV KAISER + KRAFT SA	', 'nvka15erkraf15a	', 'J. Emiel Mommaertslaan 20B', 'jem1e1m0mmaer151aan208', 'B-1831', '81831', 'Diegem', 'd1egem', '02-720.61.97', '027206197', '02-720.00.16', '027200016', '', '', 'info@kaiserkraft.com', '1nf0@ka15erkraf1c0m', '0228722', '0228722', '43.77.50.32.01.', '4377503201', 'BE 76 4377 5032 0195', '8e76437750320195', 'BE76437750320195', 'KRED BE BB', 'kred8e88', '', '', 'BE 0414 348 960', '8e0414348960', '', '', '', '', '', ''),
(3, 'TBlox test 3', '1810x1e513', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '177870478', '177870478', 'NL62 ABNA 0177 8704 78', 'n162a8na0177870478', 'NL62ABNA0177870478', 'ABNANL2A', 'a8nan12a', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ipro_ocr_texts`
--

CREATE TABLE IF NOT EXISTS `ipro_ocr_texts` (
  `ocr_text_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_page_id` int(1) unsigned NOT NULL,
  `ocr_text` text,
  PRIMARY KEY (`ocr_text_id`),
  KEY `invoice_scan_page_id` (`invoice_scan_page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ipro_ocr_texts`
--

INSERT INTO `ipro_ocr_texts` (`ocr_text_id`, `invoice_scan_page_id`, `ocr_text`) VALUES
(1, 11, 'riffirIVATIORIAL OILVVELL VARCO \nORIGINAL \nInvoice: 3792268 \nORDER BY \nFASUSI \nSALES ORDER NUMBER \n2938423 	SO \nDATE \n16/11/16 \nBRANCH PLANT \n6589941 \nPAGE \n1 of 2 \nCUSTOMER NUMBER CUSTOMER REF FREIGHT TERMS \n212194 ONG402915Z FCA \nTERMS SALESPERSON FINAL DESTINATION \nNet 30 Days BRUCE, Laura NIGERIA \nNOV VAT NUMBER NOV END USE NUMBER: \nGB582895876 GB582895876 \nNOV EOM NUMBER \nGB582895876030 \nThese commodities, technology, or software are subject lo the laws of their country of export and may also be subject to the taws of their \ncountry of origin. Re-export or diversion contrary to applicable law may be prohlbded. especially with respect to COMM °dillies, technology, or \nsoftware exported from the U.S. \nNOV DOWNHOLE EURASIA LIMITED \nLEDGER NO. 658 \nGATEWAY DRIVE \nGATEWAY BUSINESS PARK \nABERDEEN, AB12 3GW, \nUNITED KINGDOM \nPhone: (+44) (0) 1224 877688 \nFax: (+44) (0) 1224 336505 \nInvoice \nBILL TO: PETROLEUM EQUIPMENT & SUPPLIES FZE \nC/O SGS \nPLOT WWA115 (ROUNDABOUT 10) \nPO BOX 262644 \nJEBEL ALI FREE ZONE \nDUBAI \nUNITED ARAB EMIRATES (UAE) \nVAT # \nEU #  \nSHIP TO: PETROLEUM EQUIPMENT & SUPPLIES FZE \nCONTACT DHL FOR SHIPPING INSTRUCTIONS \nOLIPHANTWEG 10 \nBOTLEK \n3197L ROTTERDAM \nTHE NETHERLANDS \nVAT # \nEU # \nSHIPPING INSTRUCTIONS SHIP TO NUMBER: 212196 \nITEM  NO. ITEM NUMBER/ DESCRIPTION UOM REQUESTED DATE QUANTITY LIST PRICE DISC. UNIT PRICE \nEXTENDED \nPRICE \nVAT \nCode \n1.000 ATN3680413VA 	 16/11/16 3 4,050.00 4,050.00 12,150.00 0 \n3.688" TOP NO GO NIPPLE \nW/4,5'' 13.5LB/FT \nVAM ACE CONNECTION \n2.000 E1218-008 	 16/11/16 2 4,150.00 4,150.00 8,300.00 0 \nAL RUNNING TOOL 3 1/2" ENGAGES 2.62 INT F/N \n3.000 SSAV2810492VA 	 16/11/16 2 3,600.00 3,600.00 7,200.00 0 \n5.000 28104AAL1 -01 	 16/11116 2 4,800.00 4,800.00 9,600.00 0 \nLOCK 281AAL*-01 \nPCE BTM NO-GO / SELECTIVE \n6.000 28104SSV1-01 	 16/11/16 2 10,800.00 10,800.00 21,600.00 0 \n2.812 SELECTIVE STANDING VALVE \n7.000 ATN2750410VA 	 16/11/16 2 3,300.00 3,300.00 6,600.00 0 \nTOP NO - GO NIPPLE \n2.75" SEAL BORE \n8.000 B218-005 	 16/11116 2 3,950.00 3,950.00 7,900.00 0 \nAL RUNNING TOOL 3.00" ENGAGES 2.31 F/N \n9.000 00-33671 	 16/11/16 2 595.00 595.00 1,190.00 0 \nRUN PROBE F/3" ''AL'' R/TOOL \n2.75 - 2.81 PCE LOCK \n10.000 ATN231064VA 	 16/11/16 3 3,100.00 3,100.00 9,300.00 0 \n11.000 B218-002 	 16111/16 2 3,500.00 3,500.00 7,000.00 0 \nAL RUNNING TOOL 2.00" ENGAGES 1.38 RN \nCONTINUED NEXT PAGE \n'),
(2, 12, '2 0% - Exempt USD I \n3 Outside of Scope \nStandard Rated 020%1 USD \n0%1 USD \nAcct Nbr: 56527788 (EUR) \n1BAN:GB58 BARC 20007756 \n527788 (EUR) \nWire instructions (Wires Onlvl \nAct! Nbr: 87983800 (USD) \nlBAN: GB11 BARC 20007787 \n983600 (USD) \nAct! Nbr: 33432853 (GBP) \nIBAN: 0832 BARC 20007733 \n432653 (GBP) \nBank Deposit I Lockhox Payment \nBarclays Bank Plc \nCorporate Oil & Gas Team \nUnion Plaza \n1 Union Wynd \nAberdeen \nAB10 1SL \nAcct Name: NOV Downhole Eurasia \nLtd \nSORT: 200977 \nSM rr BARCG822 \nREMITTANCE INSTRUCTIONS \nVNATIONAL  OILWELL VARCO Invoice: 3792268 \nORIGINAL \nPage 2 of 2 \nITEM \nNO. UOM \nREQUESTED \nDATE QUANTITY \nEXTENDED \nPRICE ITEM NUMBER / DESCRIPTION LIST PRICE DISC. UNIT PRICE \nVAT \nCode \n12.000 \n13.000 \n14.000 \n15.000 \n0043333 \nRUN PROBE ''AL'' RUN TOOL \n2.25" ''M'' PCE LOCK \n00-36213 \nEQUALISING PRONG VVIRELINE \n2.25 PLUGS \n8066-004 \nGS PULLING TOOL 3.500" \nSHEAR DOWN, REACH 1.61" \nB086.001 \nGS PULLING TOOL 2.000" \nSHEAR DOWN. REACH 1.62" \n16111/16 	2 	507.00 \n16/11/16 	2 	550.00 \n16111/16 	2 	2,256.00 \n16/11/16 	2 	1,312.00 \n507.00 1,014.00 0 \n550.00 1,100.00 0 \n2,256.00 4,512,00 0 \n1,312.00 2,624.00 0 \nDISCLAIMER: All ECCN and FITS classification information received from National 01!well Varco (NOV) \nis for informational purposes only and shall not be construed as NOV''s representation, certification or \nwarranty regarding the proper classification. Use of such classification information is at the Buyer''s \nsole risk and without recourse to NOV. The Buyer is responsible for determining the correct classifications \nof all items prior to export and Buyer shall make its own export licensing determinations. \nThis document is subject to the current Terms and Conditions. If you would like a copy for your records, please \ncontact your sales representative. \nVAT Summary \ncs_de VAT Rate VAT °A Currency \nCurrency Goods \namount \nCurrency VAT \namount \n      \nZero Rated 	0%1 USD \n	\n100,090.0 	r \nUSD 100,090.00 Exch rate GBP VAT Subtotal \nto GBP amount \n1.21911 Tax USD \nTotal USD 100,090.00 1.219111 \n1.21911 \n1.21911 \nTotals \n	\n100,090.00 \nRegistered in England Na. 4514250 \nRegistered office: Stonedale Road, Oldends Lane Industrial Estate, Stonehouse, Gloucestershire GLIO 3R0, UK \n'),
(3, 14, '1 \nSupply & Installation of Heavy duty steel racks: \nSupply and Installation of heavy duty steel racks size: 29 \nmtr long x 1.2 mtr width x 3 mtr Height, with 3 shelf. Shelf \ntop to be GI Plate as per the drawing. \nEA 24,800.00 24,800.00 \n• 4., .6. .V.C.; \nQty \n.1* \n00. \nunit \n1 \n            \nEngin \n \nring \n            \n            \n         \nu \n \nu \n            \n            \n            \nInvoice to:  \nSchlumberger Middle East SA \nAbu Dhabi, PO BOX 21 \nUnited Arab Emirates \nAccount Details \nAccount Name: Whales Engineering Equipment Trading LLC \nAccount Number: 0039-351481-061 \nIBAN: AE720400000039351481061 \nBank Name: National Bank of Ras Al Khaimah (PSC) Rak Bank \nBank Address: National Bank of Ras AL Khaimah (PSC) Rak Bank \nSWIFT ID: NRAKAEAK \nInvoice No: 8108 Date: 07/02/2017 \nPacking list No: 41427, Dated: 15/11/2015 \nPO No: TADX18715A, Dated: 03 Nov 2015 \nGrand Total \nAED \n	24,800.00 \nReceived by For Whales Emineeri \n  \n  \n \nPO Box 100003, Abu Dhabi, United Arab Emirates \nTel: +071 2 555 2901 Fax: +071 2 555 3404 Email: whalesPeim.ae \n \n'),
(4, 15, 'Supply & Installation of Heavy duty steel racks: \nSupply and Installation of heavy duty steel racks size: 29 \nmtr long x 1.2 mtr width x 3 mtr Height, with 3 shelf. Shelf \ntop to be GI Plate as per the drawing. \n1 1 EA \nReceived by For Whales Engineering \n* \n\\\\*3, 7090n, ‹,,s-''• \n   \nBUM \n   \nring \n      \n      \n   \nI I) \n \nII ii \n      \n      \nPACKIINCLOSI \nSold To:  \nSchlumberger Middle East SA \nPO BOX# 21 3 ROUNDABOUT, \nNEXT ADMA STORE, CORNICHE RD \nMUSSAFAH IND''L AREA \nAbu Dhabi, United Arab Emirates \nPacking List No: 41427 \nDate: 15/11/2015 \nPO No: TADX18715A \nPO DATE: 03 Nov 2015 \nReceived the above goods in good order & condition. \nPO Box 109083, Abu Dhabi, United Arab Emirates \nTel: +071 2 555 2091 fax: +9712 555 3404 Email: whales*eim.ao \n'),
(5, 16, 'Item 	Vendor part Final destination \nnumber \nDescription \nQuantity 	UOM 	Unit price 	Net price 	Supplier 	Ship mode \npromise date \nAED 	AED (Country ISO \nCode)  \nSchlumberger \nPurchase Order Purchase order number: \nPurchase order date: \nInternal Reference: \nTADX18715A \n03 Nov 2015 \nTADXE18715/SHAND \nY / EMG TS / PALLET \nRACK SHELF \nSold to: \nSchlumberger Middle East SA \nPO BOX# 21 3 ROUNDABOUT, \nNEXT ADMA STORE, CORNICHE RD \nMUSSAFAH IND''L AREA \nAbu Dhabi, United Arab Emirates \nSupplier \nWhales Engineering \nP.O Box 109983 \nAbu Dhabi, United Arab Emirates \nOrder contact: \nPhone: \nFax: \nEmail: \nNur Hazirah ishak - PSC \nC/O Shandy Rezal Sani \n+60377185563 \nNIshak6@exchange.s1b.com  \nContact: \nPhone: \nFax: \nEmail: \nShebeaun Mohamed Sherief \n009712 5552997 \n009712 5553404 \nwhales@eim.ae  \nShip to: \nSchlumberger Middle East SA \nMussafah Industrial Area \nICADI I \nP.O.Box 4020 \nAbu Dhabi, United Arab Emirates \nShipping contact: Aneesh George \nPhone: 971 2 5553200 \nFax: \nEmail: \nShipping account: \n971 2 5544954 \nlogisticsuae@slb.corn \nSend Invoice to: \nSchlumberger Middle East SA \nAbu Dhabi, PO BOX 21 \nPlease submit your invoice on the \nVendor Portal at the below URL \nhttps://s1b,mysupplierportal.corn \nUnited Arab Emirates \nPayment contact: 	Payment contact: Accounts \nPayable \nPhone: \n	\n+1 312 237 2810 \nFax: \nEmail: \n	\nSLB.finance@accenture.com  \nInvoicing account: \nPO Attachments: Specification for Pallet Rack Shelf.xlsx, Qtn-25449.pdf, QTN \n7073.pdf \nCountry(s) of Origin must be engraved. Invoices must include HTC & Country(s) of Origin. Violation of the above :rtUng In fines to \nSchlumberger wilt be recharged + 20% admit) fee. Schlumberger may vAthhold taxes, govt charges applied by the local taw \nNA \n	\nAE \n	\neach \n	\n24,800 \n	\nI. 24,800 \n	\n11 Nov 2015 Standard \nSupply & Installation of Heavy duty steel racks: \nSupply and Installation of heavy duty steel racks size 29 \nmtr long x 1.2 mtr width x 3 tntr Height, with 3 shelf. Shelf \ntop to be Cl Plate as per the drawing. \nShipping Instructions: \n	\nPlease refer to the below person for further detailkielively: \nShandy Roza! Saul \nSSani©slb.com  \n+971 56 370 3394 \nTotal value (AED) 	 4 24,800 \nUnless otherwise specified in the Item descriptions above, or mutually agreed on in vatting, the values contained herein incJude handling \nfees, transportation costs, and other similar applicable charges. \nElectronically approved by: Khaled Farouk Sadek on: 03 Nov 2015 \nPurchase order number must be referenced on all documents (shipping documents, Invoices, credit notes, etc) \nPURCHASE ORDER SUBJECT TO SCHLUMBERGER TERMS AND CONDFIONS FOR PURCHASE OF PRODUCTS AND/OR \nSERVICES UNLESS A SEPARATE VALID CONTRACT IS IN PLACE BETWEEN SCHLUMBERGER AND SUPPLIER. \nPurchase order number: 	TADX18715A 	Page: 1 	 Print Date: 	03 Nov 2015 \nSchlumberger Private \n'),
(6, 17, 'Cartridge World              Tel:   +31 (0)294-787123       IBAN: NL87 INGB 0651 5713 16 \nNieuw Walden 56-64          Fax:   +31 (0)294-787124       VAT: NL80.42.92.504.B01 \n1394 PC Nederhorst den Berg   Email:  info@cartridgeworld.com   C.C:  33.26.78.23 \nThe Netherlands              Web:  www.cartridgeworld.com \nINVOICE \n                                                                                                                       Page 1 of 1 \n \nInvoice address                                           Delivery address \nQuantum Foam Solutions B.V.                             Quantum Foam Solutions B.V. \nHeermanskade 42a                                      J. Wheelerlaan 8 \n3031 AC Rotterdam                                      4581 GB Moerdijk \nThe Netherlands                                         The Netherlands \n \n \nCustomer number                   Invoice number                    Invoice date                   VAT number \n761329                            4570703                         23 apr 2017                   NL004790996B15 \n \n \nQuantity Product code Description  Price Total \n1 125953 Brother special offer: 2 x set LC-1240 \nserie (black + 3 colors) \n€ 62,50 € 62,50 \n1 VZA Shipping- and administration costs € 2,95 € 2,95 \n   Sub total VAT 21% Total \nShipping date: 18-04-2017 € 54,09 € 11,36 € 65,45 \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nProducts can be returned within 14 days after receipt. See, www.cartridgeworld.com/returns for return conditions and for requesting a return number. \nPlease note that returns without a return number and/or insufficiently franked returns will not be accepted. On all sales our delivery and payment \nconditions are applicable. These can be sent upon request and free of charge. \n'),
(7, 18, 'Cartridge World              Tel:   +31 (0)294-787123       IBAN: NL87 INGB 0651 5713 16 \nNieuw Walden 56-64          Fax:   +31 (0)294-787124       VAT: NL80.42.92.504.B01 \n1394 PC Nederhorst den Berg   Email:  info@cartridgeworld.com   C.C:  33.26.78.23 \nThe Netherlands              Web:  www.cartridgeworld.com \nINVOICE \n                                                                                                                       Page 1 of 1 \n \nInvoice address                                           Delivery address \nQuantum Foam Solutions B.V.                             Quantum Foam Solutions B.V. \nHeermanskade 42a                                      J. Wheelerlaan 8 \n3031 AC Rotterdam                                      4581 GB Moerdijk \nThe Netherlands                                         The Netherlands \n \n \nCustomer number                   Invoice number                    Invoice date                   VAT number \n761329                            4988209                         23 apr 2017                   NL004790996B15 \n \n \nQuantity Product code Description  Price Total \n1 125953 Brother special offer: 2 x set LC-1240 \nserie (black + 3 colors) \n€ 62,50 € 62,50 \n1 VZA Shipping- and administration costs € 2,95 € 2,95 \n   Sub total VAT 21% Total \nShipping date: 18-04-2017 € 54,09 € 11,36 € 65,45 \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nProducts can be returned within 14 days after receipt. See, www.cartridgeworld.com/returns for return conditions and for requesting a return number. \nPlease note that returns without a return number and/or insufficiently franked returns will not be accepted. On all sales our delivery and payment \nconditions are applicable. These can be sent upon request and free of charge. \n'),
(8, 19, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                     Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1146027 \nDate \n21.08.2017 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                   437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel      210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(9, 20, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                     Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1386134 \nDate \n31.08.2017 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                   437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel      210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(10, 21, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                     Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1386134 \nDate \n31.08.2017 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                   437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel      210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(11, 22, 'Cartridge World              Tel:   +31 (0)294-787123       IBAN: NL87 INGB 0651 5713 16 \nNieuw Walden 56-64          Fax:   +31 (0)294-787124       VAT: NL80.42.92.504.B01 \n1394 PC Nederhorst den Berg   Email:  info@cartridgeworld.com   C.C:  33.26.78.23 \nThe Netherlands             Web:  www.cartridgeworld.com \nINVOICE \n                                                                                                                       Page 1 of 1 \n \nInvoice address                                           Delivery address \nQuantum Foam Solutions B.V.                             Quantum Foam Solutions B.V. \nHeermanskade 42a                                      J. Wheelerlaan 8 \n3031 AC Rotterdam                                      4581 GB Moerdijk \nThe Netherlands                                         The Netherlands \n \n \nCustomer number                   Invoice number                    Invoice date                   VAT number \n761329                            4988221                         05 jan 2018                   NL004790996B15 \n \n \nQuantity Product code Description  Price Total \n1 125953 Brother special offer: 2 x set LC-1240 \nserie (black + 3 colors) \n€ 62,50 € 62,50 \n1 VZA Shipping- and administration costs € 2,95 € 2,95 \n   Sub total VAT 21% Total \nShipping date: 18-04-2017 € 54,09 € 11,36 € 65,45 \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nProducts can be returned within 14 days after receipt. See, www.cartridgeworld.com/returns for return conditions and for requesting a return number. \nPlease note that returns without a return number and/or insufficiently franked returns will not be accepted. On all sales our delivery and payment \nconditions are applicable. These can be sent upon request and free of charge. \n'),
(12, 23, 'Cartridge World              Tel:   +31 (0)294-787123       IBAN: NL87 INGB 0651 5713 16 \nNieuw Walden 56-64          Fax:   +31 (0)294-787124       VAT: NL80.42.92.504.B01 \n1394 PC Nederhorst den Berg   Email:  info@cartridgeworld.com   C.C:  33.26.78.23 \nThe Netherlands             Web:  www.cartridgeworld.com \nINVOICE \n                                                                                                                       Page 1 of 1 \n \nInvoice address                                           Delivery address \nQuantum Foam Solutions B.V.                             Quantum Foam Solutions B.V. \nHeermanskade 42a                                      J. Wheelerlaan 8 \n3031 AC Rotterdam                                      4581 GB Moerdijk \nThe Netherlands                                         The Netherlands \n \n \nCustomer number                   Invoice number                    Invoice date                   VAT number \n761329                            49882213                         05 jan 2018                   NL004790996B15 \n \n \nQuantity Product code Description  Price Total \n1 125953 Brother special offer: 2 x set LC-1240 \nserie (black + 3 colors) \n€ 62,50 € 62,50 \n1 VZA Shipping- and administration costs € 2,95 € 2,95 \n   Sub total VAT 21% Total \nShipping date: 18-04-2017 € 54,09 € 11,36 € 65,45 \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nProducts can be returned within 14 days after receipt. See, www.cartridgeworld.com/returns for return conditions and for requesting a return number. \nPlease note that returns without a return number and/or insufficiently franked returns will not be accepted. On all sales our delivery and payment \nconditions are applicable. These can be sent upon request and free of charge. \n'),
(13, 24, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                    Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1146031 \nDate \n03.01.2018 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                  437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel     210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(14, 25, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                    Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1146032 \nDate \n04.01.2018 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                  437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel     210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(15, 26, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                    Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1146033 \nDate \n04.01.2018 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 200,03 200,03 21,00 42,01 242,04 \n0,00 0,00 200,03 200,03  42,01 242,04 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                  437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel     210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n'),
(16, 27, ' \nBLZ/Page \n1 \n \nDelivery address \nQUANTUM FOAM SOLUTIONS BV                        QUANTUM FOAM SOLUTIONS BV \nWAREHOUSE                                                 FINANCE DEPARTMENT \nJ. WHEELERLAAN 8                                      HEERMANSKADE 42a \n4581 GB MOERDIJK                                      3031 AC ROTTERDAM \nTHE NETHERLANDS                                        THE NETHERLANDS \n \nOrder no./Cde no.                    Shipping by \n80/01/02493611           UPS \n \nYour ref.                           Your VAT id no. \nPX032348                     NL.00.47.90.96.B15 \nMR. DUYNHOFF \n \nOur ref. \nJACK RUMPIER \n \nGENERAL SALES CONDITIONS ON BACK PAGE                    Please specify on payment \nINVOICE Customer no. \n0228722 \nInvoice no. \n1146038 \nDate \n03.01.2018 \n \nQuantity Description Order no. Price / Piece Total \n \n1,00 \n \nCrane chain \nLENGTH 1500 mm \nLIFTING CAPACITY 5600 kg \n  \n512401/49 \n \n241,00 \n \n241,00 \n \n1,00 \n \nCrane chain \nLENGTH 1600 mm \nLIFTING CAPACITY 7800 kg \n  \n512401/49 \n \n247,00 \n \n247,00 \n \n1,00 \n \nCrane chain \nLENGTH 1700 mm \nLIFTING CAPACITY 8200 kg \n  \n512401/49 \n \n252,00 \n \n252,00 \n \n1,00 \n \nCrane chain \nLENGTH 1800 mm \nLIFTING CAPACITY 8600 kg \n  \n512401/49 \n \n257,00 \n \n257,00 \n \n1,00 \n \nCrane chain \nLENGTH 1900 mm \nLIFTING CAPACITY 8900 kg \n  \n512401/49 \n \n260,00 \n \n260,00 \n \n1,00 \n \nCrane chain \nLENGTH 2000 mm \nLIFTING CAPACITY 9200 kg \n  \n512401/49 \n \n262,00 \n \n262,00 \n'),
(17, 28, '  \n \n  \n \n1,00 \n \nCrane chain \nLENGTH 2100 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n265,00 \n \n265,00 \n \n1,00 \n \nCrane chain \nLENGTH 2200 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n267,00 \n \n267,00 \n \n1,00 \n \nCrane chain \nLENGTH 2300 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n269,00 \n \n269,00 \n \n1,00 \n \nCrane chain \nLENGTH 2500 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n271,00 \n \n271,00 \n \n1,00 \n \nCrane chain \nLENGTH 2600 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n273,00 \n \n273,00 \n \n1,00 \n \nCrane chain \nLENGTH 2700 mm \nLIFTING CAPACITY 9500 kg \n  \n512401/49 \n \n275,00 \n \n275,00 \n     \n GENERAL DISCOUNT 17,00%  40,97- \n     \n SUBTOTAL   200,03 \n \nShipping costs Deposit Nett amount Subject to VAT %VAT VAT Total amount EUR \n0,00 0,00 2605,37 2605,37 21,00 547,13 3152,50 \n0,00 0,00 2605,37 2605,37  547,13 3152,50 \n   PAYMENT WITHIN 90 DAYS                          Interest  \n \n              \nALL OUR DELIVERIES ARE MADE ON BASIS OF OUR GENERAL SALES CONDITIONS \n \n             NV KAISER + KRAFT SA                  437-7503201-95                000-0172993-42 \n             J. Emiel Mommaertslaan 20B bus 2           IBAN: BE 76 4377 5032 0195       IBAN: BE 77 0000 1729 9342 \nB-1831 Diegem                           BIC: KRED BE BB               BIC: BPOT BE B1 \nTel 02 720 61 97, Fax 02 720  00 16 \n             BTW BE 0414.348.960 TVA - RPR Brussel     210-0446370-28                53-224597-18 \n                                                  IBAN: BE 37 2100 4463 7028       IBAN: LU 44 7050 5322 4597 1800 \n                                                  BIC: GEBA BE BB               BIC: KBLX LU LL \n \n');

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_results`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_results` (
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(1) unsigned DEFAULT NULL,
  `invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `invoice_revision_hash` varchar(255) DEFAULT NULL,
  `unique_reference_number` varchar(50) DEFAULT NULL,
  `description` varchar(260) DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_action` enum('CREATE','UPDATE_LINKED_INVOICE') NOT NULL,
  `source` enum('INVOICE_SHARING','ORIGINAL_ACCOUNTING_ROBOT_RESULT_PROCESSING_CRON') NOT NULL,
  `status` enum('FAILED','LINKED_INVOICE_UPDATED','PENDING') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`original_accounting_robot_result_id`),
  UNIQUE KEY `unique_invoice_id-invoice_revision_id-invoice_revision_hash` (`invoice_id`,`invoice_revision_id`,`invoice_revision_hash`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_original_accounting_robot_results`
--
DROP TRIGGER IF EXISTS `afterInsertIproOriginalAccountingRobotResults`;
DELIMITER //
CREATE TRIGGER `afterInsertIproOriginalAccountingRobotResults` AFTER INSERT ON `ipro_original_accounting_robot_results`
 FOR EACH ROW BEGIN INSERT INTO ipro_original_accounting_robot_results_log ( original_accounting_robot_result_id, invoice_id, invoice_revision_id, invoice_revision_hash, unique_reference_number, description, date, user_action, source, status, revision_id ) VALUES ( NEW.original_accounting_robot_result_id, NEW.invoice_id, NEW.invoice_revision_id, NEW.invoice_revision_hash, NEW.unique_reference_number, NEW.description, NEW.date, NEW.user_action, NEW.source, NEW.status, NEW.revision_id ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproOriginalAccountingRobotResults`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproOriginalAccountingRobotResults` AFTER UPDATE ON `ipro_original_accounting_robot_results`
 FOR EACH ROW BEGIN INSERT INTO ipro_original_accounting_robot_results_log ( original_accounting_robot_result_id, invoice_id, invoice_revision_id, invoice_revision_hash, unique_reference_number, description, date, user_action, source, status, revision_id ) VALUES ( NEW.original_accounting_robot_result_id, NEW.invoice_id, NEW.invoice_revision_id, NEW.invoice_revision_hash, NEW.unique_reference_number, NEW.description, NEW.date, NEW.user_action, NEW.source, NEW.status, NEW.revision_id ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_results_log`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_results_log` (
  `original_accounting_robot_result_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL,
  `invoice_id` int(1) unsigned DEFAULT NULL,
  `invoice_revision_id` int(1) unsigned DEFAULT NULL,
  `invoice_revision_hash` varchar(255) DEFAULT NULL,
  `unique_reference_number` varchar(50) DEFAULT NULL,
  `description` varchar(260) DEFAULT NULL,
  `date` int(1) unsigned NOT NULL,
  `user_action` enum('CREATE','UPDATE_LINKED_INVOICE') NOT NULL,
  `source` enum('INVOICE_SHARING','ORIGINAL_ACCOUNTING_ROBOT_RESULT_PROCESSING_CRON') NOT NULL,
  `status` enum('FAILED','LINKED_INVOICE_UPDATED','PENDING') NOT NULL,
  `revision_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`original_accounting_robot_result_log_id`),
  KEY `original_accounting_robot_result_id` (`original_accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_result_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_result_dimension_values` (
  `original_accounting_robot_result_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL,
  `dimension_number` varchar(100) DEFAULT NULL,
  `value` varchar(260) DEFAULT NULL,
  PRIMARY KEY (`original_accounting_robot_result_dimension_value_id`),
  KEY `original_accounting_robot_result_line_id` (`original_accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_result_lines`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_result_lines` (
  `original_accounting_robot_result_line_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL,
  `order_request_line_id` int(1) unsigned DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `account_type` varchar(30) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `cost_center_code` varchar(30) DEFAULT NULL,
  `project_code` varchar(30) DEFAULT NULL,
  `quantity` decimal(12,4) DEFAULT NULL,
  `cost_type` varchar(25) DEFAULT NULL,
  `price` decimal(17,4) DEFAULT NULL,
  `vat_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`original_accounting_robot_result_line_id`),
  KEY `original_accounting_robot_result_id` (`original_accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_result_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_result_line_dimension_values` (
  `original_accounting_robot_result_line_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_line_id` int(1) unsigned NOT NULL,
  `dimension_number` varchar(100) DEFAULT NULL,
  `value` varchar(260) DEFAULT NULL,
  PRIMARY KEY (`original_accounting_robot_result_line_dimension_value_id`),
  KEY `original_accounting_robot_result_line_id` (`original_accounting_robot_result_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_accounting_robot_result_processing_instructions`
--

CREATE TABLE IF NOT EXISTS `ipro_original_accounting_robot_result_processing_instructions` (
  `original_accounting_robot_result_processing_instruction_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_accounting_robot_result_id` int(1) unsigned NOT NULL,
  `processing_instruction_code` varchar(25) DEFAULT NULL,
  `value` varchar(305) DEFAULT NULL,
  PRIMARY KEY (`original_accounting_robot_result_processing_instruction_id`),
  KEY `original_accounting_robot_result_id` (`original_accounting_robot_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_electronic_invoices`
--

CREATE TABLE IF NOT EXISTS `ipro_original_electronic_invoices` (
  `original_electronic_invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) DEFAULT NULL,
  `order_reference` varchar(50) DEFAULT NULL,
  `customer_reference` varchar(50) DEFAULT NULL,
  `customer_number` varchar(50) DEFAULT NULL,
  `delivery_date` varchar(10) DEFAULT NULL,
  `invoice_date` varchar(10) DEFAULT NULL,
  `credit` tinyint(1) unsigned DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `supplier_bank_account_number` varchar(30) DEFAULT NULL,
  `supplier_chamber_of_commerce_number` varchar(30) DEFAULT NULL,
  `supplier_debtor_number` varchar(50) DEFAULT NULL,
  `supplier_ean_code` varchar(50) DEFAULT NULL,
  `supplier_iban` varchar(50) DEFAULT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_vat_number` varchar(30) DEFAULT NULL,
  `delivery_location_code` varchar(50) DEFAULT NULL,
  `delivery_location_name` varchar(50) DEFAULT NULL,
  `delivery_location_vat_number` varchar(30) DEFAULT NULL,
  `invoice_location_code` varchar(50) DEFAULT NULL,
  `invoice_location_name` varchar(50) DEFAULT NULL,
  `invoice_location_vat_number` varchar(30) DEFAULT NULL,
  `subtotal_amount` decimal(17,4) DEFAULT NULL,
  `gross_amount` decimal(17,4) DEFAULT NULL,
  `discount_amount` decimal(17,4) DEFAULT NULL,
  `net_amount` decimal(17,4) DEFAULT NULL,
  `vat_low_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `vat_low_amount` decimal(17,4) DEFAULT NULL,
  `vat_high_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `vat_high_amount` decimal(17,4) DEFAULT NULL,
  `packing_amount` decimal(17,4) DEFAULT NULL,
  `transport_amount` decimal(17,4) DEFAULT NULL,
  `add_date` int(1) unsigned NOT NULL,
  PRIMARY KEY (`original_electronic_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_electronic_invoice_lines`
--

CREATE TABLE IF NOT EXISTS `ipro_original_electronic_invoice_lines` (
  `original_electronic_invoice_line_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_electronic_invoice_id` int(1) unsigned NOT NULL,
  `order_reference` varchar(50) DEFAULT NULL,
  `customer_reference` varchar(50) DEFAULT NULL,
  `packing_slip_number` varchar(50) DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `custom_number` varchar(50) DEFAULT NULL,
  `unit_of_measure` varchar(30) DEFAULT NULL,
  `administration_code` varchar(50) DEFAULT NULL,
  `account_type` varchar(30) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `cost_center_code` varchar(30) DEFAULT NULL,
  `quantity` decimal(12,4) DEFAULT NULL,
  `price` decimal(17,4) DEFAULT NULL,
  `subtotal_amount` decimal(17,4) DEFAULT NULL,
  `gross_amount` decimal(17,4) DEFAULT NULL,
  `discount_amount` decimal(17,4) DEFAULT NULL,
  `net_amount` decimal(17,4) DEFAULT NULL,
  `vat_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `vat_amount` decimal(17,4) DEFAULT NULL,
  `special_handling_amount` decimal(17,4) DEFAULT NULL,
  `shipping_amount` decimal(17,4) DEFAULT NULL,
  `additional_costs_type` varchar(20) DEFAULT NULL,
  `additional_costs_amount` decimal(17,4) DEFAULT NULL,
  `additional_costs_tax_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `additional_costs_tax_amount` decimal(17,4) DEFAULT NULL,
  PRIMARY KEY (`original_electronic_invoice_line_id`),
  KEY `original_electronic_invoice_id` (`original_electronic_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_original_electronic_invoice_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `ipro_original_electronic_invoice_line_dimension_values` (
  `original_electronic_invoice_line_dimension_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `original_electronic_invoice_line_id` int(1) unsigned NOT NULL,
  `dimension_number` varchar(100) DEFAULT NULL,
  `value` varchar(260) DEFAULT NULL,
  PRIMARY KEY (`original_electronic_invoice_line_dimension_value_id`),
  KEY `original_electronic_invoice_line_id` (`original_electronic_invoice_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_processing_instructions`
--

CREATE TABLE IF NOT EXISTS `ipro_processing_instructions` (
  `processing_instruction_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('FIELD','LIST') NOT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  PRIMARY KEY (`processing_instruction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_processing_instruction_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_processing_instruction_settings` (
  `processing_instruction_setting_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `processing_instruction_id` int(1) unsigned NOT NULL,
  `type_1` enum('CREDITOR','CREDITOR_COUNTRY','INVOICE_LOCATION','INVOICE_LOCATION_COUNTRY') DEFAULT NULL,
  `type_1_id` varchar(20) DEFAULT NULL,
  `type_2` enum('INVOICE_LOCATION','INVOICE_LOCATION_COUNTRY') DEFAULT NULL,
  `type_2_id` varchar(20) DEFAULT NULL,
  `value_id` int(1) unsigned DEFAULT NULL,
  `value` varchar(300) DEFAULT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  PRIMARY KEY (`processing_instruction_setting_id`),
  KEY `processing_instruction_id` (`processing_instruction_id`),
  KEY `type_1_id` (`type_1_id`),
  KEY `type_2_id` (`type_2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_processing_instruction_setting_rankings`
--

CREATE TABLE IF NOT EXISTS `ipro_processing_instruction_setting_rankings` (
  `processing_instruction_setting_ranking_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `processing_instruction_id` int(1) unsigned NOT NULL,
  `type_1` enum('CREDITOR','CREDITOR_COUNTRY','INVOICE_LOCATION','INVOICE_LOCATION_COUNTRY') DEFAULT NULL,
  `type_2` enum('INVOICE_LOCATION','INVOICE_LOCATION_COUNTRY') DEFAULT NULL,
  `ranking` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`processing_instruction_setting_ranking_id`),
  KEY `processing_instruction_id` (`processing_instruction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_processing_instruction_values`
--

CREATE TABLE IF NOT EXISTS `ipro_processing_instruction_values` (
  `processing_instruction_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `processing_instruction_id` int(1) unsigned NOT NULL,
  `code` varchar(25) NOT NULL,
  `value` varchar(300) NOT NULL,
  PRIMARY KEY (`processing_instruction_value_id`),
  KEY `processing_instruction_id` (`processing_instruction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_recognized_purchase_orders`
--

CREATE TABLE IF NOT EXISTS `ipro_recognized_purchase_orders` (
  `recognized_purchase_order_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_id` int(1) unsigned NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  `purchase_order_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recognized_purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `ipro_recognized_purchase_orders`
--
DROP TRIGGER IF EXISTS `afterInsertIproRecognizedPurchaseOrders`;
DELIMITER //
CREATE TRIGGER `afterInsertIproRecognizedPurchaseOrders` AFTER INSERT ON `ipro_recognized_purchase_orders`
 FOR EACH ROW BEGIN INSERT INTO ipro_recognized_purchase_orders_log ( recognized_purchase_order_id, invoice_scan_id, since_revision_id, purchase_order_id, deleted ) VALUES ( NEW.recognized_purchase_order_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.purchase_order_id, NEW.deleted ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproRecognizedPurchaseOrders`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproRecognizedPurchaseOrders` AFTER UPDATE ON `ipro_recognized_purchase_orders`
 FOR EACH ROW BEGIN INSERT INTO ipro_recognized_purchase_orders_log ( recognized_purchase_order_id, invoice_scan_id, since_revision_id, purchase_order_id, deleted ) VALUES ( NEW.recognized_purchase_order_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.purchase_order_id, NEW.deleted ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_recognized_purchase_orders_log`
--

CREATE TABLE IF NOT EXISTS `ipro_recognized_purchase_orders_log` (
  `recognized_purchase_order_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `recognized_purchase_order_id` int(1) unsigned NOT NULL,
  `invoice_scan_id` int(1) unsigned NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  `purchase_order_id` int(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recognized_purchase_order_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_recognized_total_amounts`
--

CREATE TABLE IF NOT EXISTS `ipro_recognized_total_amounts` (
  `recognized_total_amount_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_scan_id` int(1) unsigned NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  `total_amount_excl_vat` decimal(15,2) unsigned NOT NULL,
  `total_amount_incl_vat` decimal(15,2) unsigned NOT NULL,
  `vat_percentage` decimal(5,2) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recognized_total_amount_id`),
  KEY `invoice_scan_id` (`invoice_scan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `ipro_recognized_total_amounts`
--

INSERT INTO `ipro_recognized_total_amounts` (`recognized_total_amount_id`, `invoice_scan_id`, `since_revision_id`, `total_amount_excl_vat`, `total_amount_incl_vat`, `vat_percentage`, `deleted`) VALUES
(1, 6, 1, 18000.00, 21600.00, 20.00, 0),
(2, 7, 1, 100090.00, 100090.00, 0.00, 0),
(3, 8, 1, 18000.00, 21600.00, 20.00, 0),
(4, 9, 1, 18000.00, 21600.00, 20.00, 0),
(5, 10, 1, 18000.00, 21600.00, 20.00, 0),
(6, 11, 1, 18000.00, 21600.00, 20.00, 0),
(7, 12, 1, 18000.00, 21600.00, 20.00, 0),
(8, 13, 1, 18000.00, 21600.00, 20.00, 0),
(9, 14, 1, 18000.00, 21600.00, 20.00, 0),
(10, 15, 1, 18000.00, 21600.00, 20.00, 0),
(11, 16, 1, 18000.00, 21600.00, 20.00, 0),
(12, 17, 1, 18000.00, 21600.00, 20.00, 0),
(16, 21, 1, 18000.00, 21600.00, 20.00, 0),
(17, 22, 1, 18000.00, 21600.00, 20.00, 0),
(20, 7, 1, 18000.00, 21600.00, 20.00, 0),
(21, 8, 1, 18000.00, 21600.00, 20.00, 0),
(22, 9, 1, 18000.00, 21600.00, 20.00, 0),
(23, 10, 1, 18000.00, 21600.00, 20.00, 0),
(24, 11, 1, 18000.00, 21600.00, 20.00, 0),
(25, 12, 1, 18000.00, 21600.00, 20.00, 0),
(26, 13, 1, 18000.00, 21600.00, 20.00, 0),
(27, 14, 1, 18000.00, 21600.00, 20.00, 0),
(28, 15, 1, 18000.00, 21600.00, 20.00, 0),
(29, 7, 1, 18000.00, 21600.00, 20.00, 0),
(30, 8, 1, 18000.00, 21600.00, 20.00, 0),
(31, 9, 1, 18000.00, 21600.00, 20.00, 0),
(32, 10, 1, 18000.00, 21600.00, 20.00, 0),
(33, 12, 1, 18000.00, 21600.00, 20.00, 0),
(34, 13, 1, 18000.00, 21600.00, 20.00, 0),
(35, 14, 1, 18000.00, 21600.00, 20.00, 0),
(36, 15, 1, 18000.00, 21600.00, 20.00, 0),
(37, 16, 1, 18000.00, 21600.00, 20.00, 0),
(38, 17, 1, 18000.00, 21600.00, 20.00, 0),
(39, 18, 1, 24800.00, 24800.00, 0.00, 0),
(40, 21, 1, 18000.00, 21600.00, 20.00, 0),
(41, 19, 1, 54.09, 65.45, 21.00, 0),
(42, 20, 1, 54.09, 65.45, 21.00, 0),
(43, 23, 1, 200.03, 242.04, 21.00, 0),
(45, 24, 5, 230.51, 242.04, 5.00, 0),
(47, 25, 2, 200.03, 242.04, 21.00, 0),
(48, 26, 1, 54.09, 65.45, 21.00, 0),
(49, 27, 1, 200.03, 242.04, 21.00, 0),
(50, 28, 1, 200.03, 242.04, 21.00, 0),
(51, 29, 1, 200.03, 242.04, 21.00, 0),
(52, 30, 1, 54.09, 65.45, 21.00, 0),
(55, 33, 1, 2605.37, 3152.50, 21.00, 0),
(56, 32, 3, 2605.37, 3152.50, 21.00, 0),
(57, 31, 6, 65.45, 65.45, 0.00, 0);

--
-- Triggers `ipro_recognized_total_amounts`
--
DROP TRIGGER IF EXISTS `afterInsertIproRecognizedTotalAmounts`;
DELIMITER //
CREATE TRIGGER `afterInsertIproRecognizedTotalAmounts` AFTER INSERT ON `ipro_recognized_total_amounts`
 FOR EACH ROW BEGIN INSERT INTO ipro_recognized_total_amounts_log ( recognized_total_amount_id, invoice_scan_id, since_revision_id, total_amount_excl_vat, total_amount_incl_vat, vat_percentage, deleted ) VALUES ( NEW.recognized_total_amount_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.total_amount_excl_vat, NEW.total_amount_incl_vat, NEW.vat_percentage, NEW.deleted ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateIproRecognizedTotalAmounts`;
DELIMITER //
CREATE TRIGGER `afterUpdateIproRecognizedTotalAmounts` AFTER UPDATE ON `ipro_recognized_total_amounts`
 FOR EACH ROW BEGIN INSERT INTO ipro_recognized_total_amounts_log ( recognized_total_amount_id, invoice_scan_id, since_revision_id, total_amount_excl_vat, total_amount_incl_vat, vat_percentage, deleted ) VALUES ( NEW.recognized_total_amount_id, NEW.invoice_scan_id, NEW.since_revision_id, NEW.total_amount_excl_vat, NEW.total_amount_incl_vat, NEW.vat_percentage, NEW.deleted ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_recognized_total_amounts_log`
--

CREATE TABLE IF NOT EXISTS `ipro_recognized_total_amounts_log` (
  `recognized_total_amount_log_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `recognized_total_amount_id` int(1) unsigned NOT NULL,
  `invoice_scan_id` int(1) unsigned NOT NULL,
  `since_revision_id` int(1) unsigned NOT NULL,
  `total_amount_excl_vat` decimal(15,2) unsigned NOT NULL,
  `total_amount_incl_vat` decimal(15,2) unsigned NOT NULL,
  `vat_percentage` decimal(5,2) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recognized_total_amount_log_id`),
  KEY `invoice_scan_id` (`invoice_scan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `ipro_recognized_total_amounts_log`
--

INSERT INTO `ipro_recognized_total_amounts_log` (`recognized_total_amount_log_id`, `recognized_total_amount_id`, `invoice_scan_id`, `since_revision_id`, `total_amount_excl_vat`, `total_amount_incl_vat`, `vat_percentage`, `deleted`) VALUES
(1, 1, 6, 1, 18000.00, 21600.00, 20.00, 0),
(2, 2, 7, 1, 100090.00, 100090.00, 0.00, 0),
(3, 3, 8, 1, 18000.00, 21600.00, 20.00, 0),
(4, 4, 9, 1, 18000.00, 21600.00, 20.00, 0),
(5, 5, 10, 1, 18000.00, 21600.00, 20.00, 0),
(6, 6, 11, 1, 18000.00, 21600.00, 20.00, 0),
(7, 7, 12, 1, 18000.00, 21600.00, 20.00, 0),
(8, 8, 13, 1, 18000.00, 21600.00, 20.00, 0),
(9, 9, 14, 1, 18000.00, 21600.00, 20.00, 0),
(10, 10, 15, 1, 18000.00, 21600.00, 20.00, 0),
(11, 11, 16, 1, 18000.00, 21600.00, 20.00, 0),
(12, 12, 17, 1, 18000.00, 21600.00, 20.00, 0),
(13, 13, 18, 1, 18000.00, 21600.00, 20.00, 0),
(14, 14, 19, 1, 18000.00, 21600.00, 20.00, 0),
(15, 15, 20, 1, 18000.00, 21600.00, 20.00, 0),
(16, 16, 21, 1, 18000.00, 21600.00, 20.00, 0),
(17, 17, 22, 1, 18000.00, 21600.00, 20.00, 0),
(18, 18, 23, 1, 18000.00, 21600.00, 20.00, 0),
(19, 19, 24, 1, 18000.00, 21600.00, 20.00, 0),
(20, 20, 7, 1, 18000.00, 21600.00, 20.00, 0),
(21, 21, 8, 1, 18000.00, 21600.00, 20.00, 0),
(22, 22, 9, 1, 18000.00, 21600.00, 20.00, 0),
(23, 23, 10, 1, 18000.00, 21600.00, 20.00, 0),
(24, 24, 11, 1, 18000.00, 21600.00, 20.00, 0),
(25, 25, 12, 1, 18000.00, 21600.00, 20.00, 0),
(26, 26, 13, 1, 18000.00, 21600.00, 20.00, 0),
(27, 27, 14, 1, 18000.00, 21600.00, 20.00, 0),
(28, 28, 15, 1, 18000.00, 21600.00, 20.00, 0),
(29, 29, 7, 1, 18000.00, 21600.00, 20.00, 0),
(30, 30, 8, 1, 18000.00, 21600.00, 20.00, 0),
(31, 31, 9, 1, 18000.00, 21600.00, 20.00, 0),
(32, 32, 10, 1, 18000.00, 21600.00, 20.00, 0),
(33, 33, 12, 1, 18000.00, 21600.00, 20.00, 0),
(34, 34, 13, 1, 18000.00, 21600.00, 20.00, 0),
(35, 35, 14, 1, 18000.00, 21600.00, 20.00, 0),
(36, 36, 15, 1, 18000.00, 21600.00, 20.00, 0),
(37, 37, 16, 1, 18000.00, 21600.00, 20.00, 0),
(38, 38, 17, 1, 18000.00, 21600.00, 20.00, 0),
(39, 39, 18, 1, 24800.00, 24800.00, 0.00, 0),
(40, 13, 18, 3, 18000.00, 21600.00, 20.00, 1),
(41, 40, 21, 1, 18000.00, 21600.00, 20.00, 0),
(42, 41, 19, 1, 54.09, 65.45, 21.00, 0),
(43, 14, 19, 2, 18000.00, 21600.00, 20.00, 1),
(44, 42, 20, 1, 54.09, 65.45, 21.00, 0),
(45, 15, 20, 4, 18000.00, 21600.00, 20.00, 1),
(46, 43, 23, 1, 200.03, 242.04, 21.00, 0),
(47, 18, 23, 4, 18000.00, 21600.00, 20.00, 1),
(48, 44, 24, 1, 200.03, 242.04, 21.00, 0),
(49, 19, 24, 5, 18000.00, 21600.00, 20.00, 1),
(50, 44, 24, 5, 200.03, 242.04, 21.00, 1),
(51, 45, 24, 5, 230.51, 242.04, 5.00, 0),
(52, 46, 25, 1, 230.51, 242.04, 5.00, 0),
(53, 46, 25, 2, 230.51, 242.04, 5.00, 1),
(54, 47, 25, 2, 200.03, 242.04, 21.00, 0),
(55, 48, 26, 1, 54.09, 65.45, 21.00, 0),
(56, 49, 27, 1, 200.03, 242.04, 21.00, 0),
(57, 50, 28, 1, 200.03, 242.04, 21.00, 0),
(58, 51, 29, 1, 200.03, 242.04, 21.00, 0),
(59, 52, 30, 1, 54.09, 65.45, 21.00, 0),
(60, 53, 31, 1, 54.09, 65.45, 21.00, 0),
(61, 54, 32, 1, 262.00, 262.00, 0.00, 0),
(62, 55, 33, 1, 2605.37, 3152.50, 21.00, 0),
(63, 54, 32, 3, 262.00, 262.00, 0.00, 1),
(64, 56, 32, 3, 2605.37, 3152.50, 21.00, 0),
(65, 53, 31, 6, 54.09, 65.45, 21.00, 1),
(66, 57, 31, 6, 65.45, 65.45, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_rejection_reasons`
--

CREATE TABLE IF NOT EXISTS `ipro_rejection_reasons` (
  `rejection_reason_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL,
  `description` varchar(100) NOT NULL,
  `selectable_at_step_3` tinyint(1) unsigned NOT NULL,
  `selectable_at_step_4` tinyint(1) unsigned NOT NULL,
  `selectable_at_approve_invoice` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`rejection_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_remarks`
--

CREATE TABLE IF NOT EXISTS `ipro_remarks` (
  `remark_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('INVOICE_SCAN') NOT NULL,
  `type_id` int(1) unsigned NOT NULL,
  `type_revision_id` int(1) unsigned NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ipro_settings`
--

CREATE TABLE IF NOT EXISTS `ipro_settings` (
  `setting_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` enum('BOOL','INT','STRING') NOT NULL,
  `description` text,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `ipro_settings`
--

INSERT INTO `ipro_settings` (`setting_id`, `name`, `value`, `type`, `description`) VALUES
(1, 'autoHideInvoiceDimensionValuesOnNonEnrichedInvoices', 'true', 'BOOL', ''),
(2, 'defaultCurrency', 'EUR', 'STRING', ''),
(4, 'displayAttributeEnrichedByAccountingRobot', 'true', 'BOOL', ''),
(5, 'displayInvoiceScanBatchCustomReferenceNumberAsUrn', 'false', 'BOOL', ''),
(6, 'displayProcessingInstructions', 'true', 'BOOL', ''),
(7, 'displayProjectLayer', 'true', 'BOOL', ''),
(8, 'emptyInvoiceScanBatchId', '1', 'INT', ''),
(9, 'hidePoInvoiceLinesOnPoInvoices', 'false', 'BOOL', ''),
(10, 'intervalBetweenAutomaticUpdatesForViewedItems', '60', 'INT', 'Number of seconds between each automatic call to the server in order to signal that an item is still being viewed. Default: ''60'''),
(11, 'invoiceNumberAdjustable', 'false', 'BOOL', 'Not yet fully implemented. Should ALWAYS be set to ''false''!'),
(12, 'matchAccountingRobotResultsOnUniqueReferenceNumber', 'false', 'BOOL', ''),
(13, 'maxNumberOfInvoiceScansMarkedAsViewedPerUser', '10', 'INT', 'Set to ''0'' to disable. When enabled, ''10'' is a reasonable value.'),
(14, 'maxNumberOfInvoicesMarkedAsViewedPerUser', '10', 'INT', 'Set to ''0'' to disable. When enabled, ''10'' is a reasonable value.'),
(15, 'maxTimeInvoiceCanBeMarkedAsViewed', '600', 'INT', 'Number of seconds an invoice can be marked as ''viewed'' without refreshing the page. Default: ''600'''),
(16, 'maxTimeInvoiceScanCanBeMarkedAsViewed', '600', 'INT', 'Number of seconds an invoice scan can be marked as ''viewed'' without refreshing the page. Default: ''600'''),
(17, 'orderingDimensionRelations', 'true', 'BOOL', ''),
(18, 'orderingProjectName', 'project', 'STRING', 'Should be either ''project'' (default) or ''costcenter''.'),
(19, 'projectEditableForStockOrdersInStep4', 'false', 'BOOL', ''),
(20, 'sendInvoiceScanToInvoiceSharingWhenRejectingInStep3', 'false', 'BOOL', ''),
(21, 'sendInvoiceToInvoiceSharingWhenCancelling', 'false', 'BOOL', ''),
(22, 'sendInvoiceToInvoiceSharingWhenPosting', 'false', 'BOOL', ''),
(23, 'useAccountingRobot', 'true', 'BOOL', ''),
(24, 'useMultipleBankAccountsPerCreditor', 'false', 'BOOL', ''),
(25, 'useWorkflow', 'false', 'BOOL', 'Not yet fully implemented. Should ALWAYS be set to ''false''!'),
(26, 'whenCancellingInvoiceAdministrationMandatory', 'false', 'BOOL', ''),
(27, 'whenCancellingInvoiceCreditorBankAccountMandatory', 'false', 'BOOL', ''),
(28, 'whenCancellingInvoiceCreditorInvoiceNumberMandatory', 'false', 'BOOL', ''),
(29, 'whenCancellingInvoiceCreditorMandatory', 'false', 'BOOL', ''),
(30, 'whenCancellingInvoiceInvoiceDateMandatory', 'false', 'BOOL', ''),
(31, 'whenCancellingInvoiceInvoiceLinesMandatory', 'false', 'BOOL', ''),
(32, 'whenCancellingInvoiceInvoiceLocationMandatory', 'false', 'BOOL', ''),
(33, 'whenCancellingInvoiceSupplierMandatory', 'false', 'BOOL', ''),
(34, 'displayInvoiceScanBatchInvoiceLocationGroupAsCountryCode', 'false', 'BOOL', ''),
(35, 'hidePoInvoicesFilter', 'false', 'BOOL', 'Applies to browsers at ''All invoices'' and ''Invoice navigation settings'' in step 4.'),
(36, 'hideUserFilterInNavigationSettingsInStep3', 'false', 'BOOL', ''),
(37, 'customNameAdministration', '', 'STRING', 'Only applies to label. Name ''administration'' will still be shown. Set empty string to disable.'),
(38, 'customNameCostCenter', '', 'STRING', 'Only applies to label (takes switching of ''cost center'' and ''project'' by means of ''orderingProjectName'' into account). Orignal name will still be shown. Set empty string to disable.'),
(39, 'customNameProductName', '', 'STRING', 'Only applies to label. Name ''product name'' will still be shown. Set empty string to disable.'),
(40, 'customNameProject', '', 'STRING', 'Only applies to label (takes switching of ''cost center'' and ''project'' by means of ''orderingProjectName'' into account). Orignal name will still be shown. Set empty string to disable.'),
(41, 'hideAmountsInDefaultCurrencyOnInvoice', 'false', 'BOOL', ''),
(42, 'positionInvoiceLogInStep4AtBottomOfScreen', 'false', 'BOOL', ''),
(43, 'customInvoiceScanBatchReferenceNumberMustBeUnique', 'false', 'BOOL', ''),
(44, 'useAccountingPeriod', 'true', 'BOOL', ''),
(45, 'useDeliveryLocation', 'true', 'BOOL', ''),
(46, 'useJournal', 'true', 'BOOL', ''),
(47, 'usePaymentCondition', 'true', 'BOOL', ''),
(48, 'usePaymentMethod', 'true', 'BOOL', ''),
(49, 'usePaymentTerm', 'true', 'BOOL', ''),
(50, 'useSeparateInputFieldForCurrency', 'false', 'BOOL', ''),
(51, 'whenCancellingInvoiceCurrencyMandatory', 'false', 'BOOL', ''),
(52, 'customNameCreditorBankAccount', '', 'STRING', 'Only applies to label. Name ''bank account'' will still be shown. Set empty string to disable.'),
(53, 'customNameInvoiceNumber', '', 'STRING', 'Applies to label for ''Invoice number'' or ''Invoice'' in step 4 and in various browsers. Set empty string to disable.'),
(54, 'showIbanWhenSearchingForSupplierInStep4', 'false', 'BOOL', ''),
(55, 'useExternalIdAsSupplierNumberIfAvailable', 'false', 'BOOL', ''),
(56, 'displayInvoiceScanBatchDateReceived', 'false', 'BOOL', ''),
(57, 'hideDateColumnInNavigationSettingsInStep3', 'false', 'BOOL', 'If setting ''displayInvoiceScanBatchDateReceived'' is enabled, you may want to hide the ''date'' column in order to create some space.'),
(58, 'universalDummyPurchaseOrderId', '0', 'INT', 'Set to ''0'' to disable. Refers to a dummy PO that can be linked to an invoice of any creditor. Can be used to force an invoice to be processed as ''PO invoice'' even when no PO is available.'),
(59, 'autoSelectSupplierAsCreditor', 'false', 'BOOL', 'If enabled, the supplier will by default always also be set as creditor, even if the supplier is linked to a different supplier as creditor (a.k.a. ''Invoice supplier'' or ''Factuur B.V.'').'),
(60, 'whenCancellingInvoiceFullyValidateInvoiceLocation', 'false', 'BOOL', 'If enabled, certain properties of the filled in invoice location will also be validated when an invoice is being cancelled (this only applies to user action ''Cancel'', not to user actions ''Set back to step 2/3''). For example, the system will validate whether the invoice location is indeed linked to the selected administration.'),
(61, 'maxPagesToBeAnalysedForNonSplittableInvoiceScanBatchInStep1', '1000', 'INT', 'The maximum number of pages in a single non-splittable invoice scan batch (a batch of which we are sure that it always contains just a single invoice) that will be analysed by the AI in step 1 in case the number of pages in the batch exceeds the set threshold. For example, if this setting is set to 10 and the threshold is set to 50, then an invoice scan batch of 40 pages will be analysed completely, whereas for a batch of 50 pages or more, only the first 10 pages will be analysed.'),
(62, 'maxPagesToBeAnalysedForNonSplittableInvoiceScanBatchInStep1Threshold', '1000', 'INT', ''),
(63, 'maxPagesToBeAnalysedForInvoiceScanInStep2', '1000', 'INT', 'The maximum number of pages in an invoice scan that will be analysed by the AI in step 2 in case the number of pages in the batch exceeds the set threshold. For example, if this setting is set to 10 and the threshold is set to 50, then an invoice scan of 40 pages will be analysed completely, whereas for a batch of 50 pages or more, only the first 10 pages will be analysed.'),
(64, 'maxPagesToBeAnalysedForInvoiceScanInStep2Threshold', '1000', 'INT', ''),
(65, 'maxPagesToBeAnalysedForInvoiceScanInStep3', '1000', 'INT', 'The maximum number of pages in an invoice scan that will be analysed by the AI in step 3 in case the number of pages in the batch exceeds the set threshold. For example, if this setting is set to 10 and the threshold is set to 50, then an invoice scan of 40 pages will be analysed completely, whereas for a batch of 50 pages or more, only the first 10 pages will be analysed.'),
(66, 'maxPagesToBeAnalysedForInvoiceScanInStep3Threshold', '1000', 'INT', ''),
(67, 'maxPagesToBeAnalysedForInvoiceScanInStep4', '1000', 'INT', 'The maximum number of pages in an invoice scan that will be analysed by the AI in step 4 in case the number of pages in the batch exceeds the set threshold. For example, if this setting is set to 10 and the threshold is set to 50, then an invoice scan of 40 pages will be analysed completely, whereas for a batch of 50 pages or more, only the first 10 pages will be analysed.'),
(68, 'maxPagesToBeAnalysedForInvoiceScanInStep4Threshold', '1000', 'INT', '');

-- --------------------------------------------------------

--
-- Table structure for table `ipro_vat_codes`
--

CREATE TABLE IF NOT EXISTS `ipro_vat_codes` (
  `vat_code_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `type` enum('EXEMPT','NORMAL','NO_VAT','SHIFTED') NOT NULL,
  `pro_rata_percentage` decimal(4,2) unsigned DEFAULT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  `credit_general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `debit_general_ledger_account_id` int(1) unsigned DEFAULT NULL,
  `added_by` int(1) unsigned DEFAULT NULL,
  `add_date` int(1) unsigned DEFAULT NULL,
  `edited_by` int(1) unsigned DEFAULT NULL,
  `edit_date` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`vat_code_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ipro_vat_codes`
--

INSERT INTO `ipro_vat_codes` (`vat_code_id`, `code`, `description`, `percentage`, `type`, `pro_rata_percentage`, `status`, `credit_general_ledger_account_id`, `debit_general_ledger_account_id`, `added_by`, `add_date`, `edited_by`, `edit_date`) VALUES
(1, '01', 'No VAT', 0.00, 'NO_VAT', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '02', 'Zero rate', 0.00, 'NORMAL', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '03', 'Reduced', 6.00, 'NORMAL', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '06', 'Standard', 21.00, 'NORMAL', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '04', 'Reduced exempt', 6.00, 'EXEMPT', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '05', 'Reduced shifted', 6.00, 'SHIFTED', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '07', 'Standard exempt', 21.00, 'EXEMPT', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '08', 'Standard shifted', 21.00, 'SHIFTED', NULL, 'USABLE', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ipro_viewed_items`
--

CREATE TABLE IF NOT EXISTS `ipro_viewed_items` (
  `viewed_item_id` bigint(1) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('INVOICE','INVOICE_SCAN') NOT NULL,
  `type_id` int(1) unsigned NOT NULL,
  `user_id` int(1) unsigned NOT NULL,
  `start_date` int(1) unsigned NOT NULL,
  `update_date` int(1) unsigned NOT NULL,
  `expired` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`viewed_item_id`),
  UNIQUE KEY `unique_type_type_id_user_id` (`type`,`type_id`,`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=262 ;

--
-- Dumping data for table `ipro_viewed_items`
--

INSERT INTO `ipro_viewed_items` (`viewed_item_id`, `type`, `type_id`, `user_id`, `start_date`, `update_date`, `expired`) VALUES
(259, 'INVOICE_SCAN', 32, 15, 1531397364, 1531397364, 0),
(261, 'INVOICE_SCAN', 20, 15, 1531397402, 1531397402, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobroles`
--

CREATE TABLE IF NOT EXISTS `jobroles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `managerole` int(11) NOT NULL DEFAULT '1',
  `replacerole` int(11) NOT NULL DEFAULT '0',
  `approverole` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `responsibilities` text NOT NULL,
  `activities` text NOT NULL,
  `requirements` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pref_company_preferences`
--

INSERT INTO `pref_company_preferences` (`company_preference_id`, `preference_id`, `preference_value`, `edit_by`, `edit_date`) VALUES
(1, 74, 'mainPage', 0, 0),
(2, 74, 'manageProducts', 0, 0),
(3, 74, 'manageInternalProducts', 0, 0),
(4, 74, 'manageSuppliers', 0, 0),
(5, 74, 'manageLocations', 0, 0),
(6, 74, 'editLocation', 0, 0),
(7, 74, 'makePurchaseOrder', 0, 0),
(8, 74, 'purchaseOrderHistory', 0, 0),
(9, 74, 'internalOrderInbox', 0, 0),
(10, 74, 'stockSettings', 0, 0),
(11, 103, 'yes', 0, 0),
(12, 4, 'yes', 0, 0),
(13, 16, 'no', 0, 0),
(14, 17, 'no', 0, 0),
(15, 3, 'yes', 0, 0),
(16, 18, 'no', 0, 0),
(17, 12, 'no', 0, 0),
(18, 139, 'no', 0, 0),
(19, 140, 'no', 0, 0),
(20, 169, 'generalLedgerAccount', 0, 0),
(21, 171, 'generalLedger', 0, 0),
(22, 22, 'yes', 0, 0),
(23, 203, 'manager', 0, 0),
(24, 204, 'mail', 0, 0),
(25, 161, 'no', 2, 1504530866),
(26, 202, 'no', 2, 1504530866),
(27, 29, 'no', 2, 1504530866),
(28, 28, 'no', 2, 1504530866),
(29, 196, 'no', 2, 1504530866),
(30, 197, 'no', 2, 1504530866),
(31, 106, 'yes', 2, 1504530866),
(32, 91, 'creditorNumber', 2, 1504530866),
(33, 91, 'currency', 2, 1504530866),
(34, 92, 'creditorNumber', 2, 1504530866),
(35, 92, 'currency', 2, 1504530866),
(36, 93, 'code', 2, 1504530866),
(37, 93, 'price', 2, 1504530866),
(38, 93, 'vat', 2, 1504530866),
(39, 93, 'discountPercentage', 2, 1504530866),
(40, 93, 'packageDescription', 2, 1504530866),
(41, 93, 'productUnit', 2, 1504530866),
(42, 93, 'subcategory', 2, 1504530866),
(43, 93, 'productInfo', 2, 1504530866),
(44, 94, '', 2, 1504530866),
(45, 95, '', 2, 1504530866),
(46, 96, '', 2, 1504530866),
(47, 46, 'no', 2, 1504530866),
(48, 59, 'yes', 2, 1504530866),
(49, 47, 'no', 2, 1504530866),
(50, 48, 'no', 2, 1504530866),
(51, 21, 'no', 2, 1504530866),
(52, 83, 'order', 2, 1504530866),
(53, 104, 'no', 2, 1504530866),
(54, 105, 'no', 2, 1504530866),
(55, 132, 'no', 2, 1504530866),
(56, 150, 'no', 2, 1504530866),
(57, 107, '', 2, 1504530866),
(58, 130, 'deliveryDate', 2, 1504530866),
(59, 131, '', 2, 1504530866),
(60, 41, 'no', 2, 1504530866),
(61, 19, 'no', 2, 1504530866),
(62, 20, 'no', 2, 1504530866),
(63, 44, 'no', 2, 1504530866),
(64, 121, 'no', 2, 1504530866),
(65, 184, 'yes', 2, 1504530866),
(66, 43, 'no', 2, 1504530866),
(67, 45, 'no', 2, 1504530866),
(68, 186, 'yes', 2, 1504530866),
(69, 163, 'no', 2, 1504530866),
(70, 187, 'yes', 2, 1504530866),
(71, 183, 'default', 2, 1504530866),
(72, 14, 'no', 2, 1504530866),
(73, 175, 'no', 2, 1504530866),
(74, 176, 'no', 2, 1504530866),
(75, 157, 'no', 2, 1504530866),
(76, 126, 'code', 2, 1504530866),
(77, 126, 'price', 2, 1504530866),
(78, 126, 'vat', 2, 1504530866),
(79, 126, 'discountPercentage', 2, 1504530866),
(80, 126, 'packageDescription', 2, 1504530866),
(81, 126, 'productUnit', 2, 1504530866),
(82, 126, 'subcategory', 2, 1504530866),
(83, 126, 'productInfo', 2, 1504530866),
(84, 127, '', 2, 1504530866),
(85, 181, 'no', 2, 1504530866),
(86, 188, 'no', 2, 1504530866),
(87, 185, 'yes', 2, 1504530866),
(88, 102, 'no', 2, 1504530866),
(89, 112, 'yes', 2, 1504530866),
(90, 155, 'restrictIncomingStock', 2, 1504530866),
(91, 155, 'restrictStockDelivery', 2, 1504530866),
(92, 155, 'restrictInternalOrderBox', 2, 1504530866),
(93, 155, 'restrictCycleCounts', 2, 1504530866),
(94, 155, 'restrictDeliveryHistory', 2, 1504530866),
(95, 155, 'restrictStockSettings', 2, 1504530866),
(96, 8, '1', 2, 1504530866),
(97, 7, '2', 2, 1504530866),
(98, 6, '3', 2, 1504530867),
(99, 5, 'yes', 2, 1504530867),
(100, 13, 'no', 2, 1504530867),
(101, 165, '', 2, 1504530867),
(102, 114, 'no', 2, 1504530867),
(103, 66, 'no', 2, 1504530867),
(104, 67, 'normalVat', 2, 1504530867),
(105, 72, 'no', 2, 1504530867),
(106, 128, 'yes', 2, 1504530867),
(107, 109, 'yes', 2, 1504530867),
(108, 108, 'yes', 2, 1504530867),
(109, 115, 'no', 2, 1504530867),
(110, 101, 'no', 2, 1504530867),
(111, 110, 'yes', 2, 1504530867),
(112, 215, 'yes', 2, 1504530867),
(113, 218, 'yes', 2, 1504530867),
(114, 100, 'no', 2, 1504530867),
(115, 82, 'no', 2, 1504530867),
(116, 113, 'no', 2, 1504530867),
(117, 111, 'yes', 2, 1504530867),
(118, 191, 'both', 2, 1504530867),
(119, 164, 'no', 2, 1504530867),
(120, 84, 'administrative', 2, 1504530867),
(121, 84, 'transport', 2, 1504530867),
(122, 84, 'deposit', 2, 1504530867),
(123, 15, 'no', 2, 1504530867),
(124, 38, 'a', 2, 1504530867),
(125, 120, 'no', 2, 1504530867),
(126, 192, 'both', 2, 1504530867),
(127, 195, 'both', 2, 1504530867),
(128, 35, 'no', 2, 1504530867),
(129, 24, 'no', 2, 1504530867),
(130, 149, 'no', 2, 1504530867),
(131, 116, 'no', 2, 1504530867),
(132, 118, 'no', 2, 1504530867),
(133, 117, 'no', 2, 1504530867),
(134, 214, 'yes', 2, 1504530867),
(135, 189, 'both', 2, 1504530867),
(136, 134, 'no', 2, 1504530867),
(137, 166, 'no', 2, 1504530867),
(138, 36, 'yes', 2, 1504530867),
(139, 76, 'no', 2, 1504530867),
(140, 167, 'no', 2, 1504530867),
(141, 141, 'yes', 2, 1504530867),
(142, 142, 'yes', 2, 1504530867),
(143, 168, '', 2, 1504530867),
(144, 90, 'no', 2, 1504530867),
(145, 77, 'yes', 2, 1504530867),
(146, 69, 'yes', 2, 1504530867),
(147, 193, 'both', 2, 1504530867),
(148, 170, 'no', 2, 1504530867),
(149, 138, 'yes', 2, 1504530867),
(150, 81, 'no', 2, 1504530867),
(151, 9, 'no', 2, 1504530867),
(152, 98, 'no', 2, 1504530867),
(153, 61, 'withinPriceMargin', 2, 1504530867),
(154, 62, '50.00', 2, 1504530867),
(155, 63, '2.5', 2, 1504530867),
(156, 49, 'no', 2, 1504530867),
(157, 190, 'both', 2, 1504530867),
(158, 194, 'both', 2, 1504530867),
(159, 75, 'manageProducts', 2, 1504530867),
(160, 75, 'manageInternalProducts', 2, 1504530867),
(161, 75, 'manageSuppliers', 2, 1504530867),
(162, 75, 'manageLocations', 2, 1504530867),
(163, 75, 'editLocation', 2, 1504530867),
(164, 75, 'makePurchaseOrder', 2, 1504530867),
(165, 75, 'purchaseOrderHistory', 2, 1504530867),
(166, 75, 'internalOrderInbox', 2, 1504530867),
(167, 75, 'stockSettings', 2, 1504530867),
(168, 156, 'yes', 2, 1504530867),
(169, 60, 'no', 2, 1504530867),
(170, 73, 'no', 2, 1504530867),
(171, 135, 'automatically', 2, 1504530867),
(172, 78, '0.00', 2, 1504530867),
(173, 79, 'no', 2, 1504530867),
(174, 198, 'yes', 2, 1504530867);

--
-- Table structure for table `project_members`
--

CREATE TABLE IF NOT EXISTS `project_members` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `projectID` int(11) NOT NULL DEFAULT '0',
  `projectmemberBitmask` int(10) NOT NULL DEFAULT '0',
  `last_access` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`,`projectID`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_current_stock`
--

CREATE TABLE IF NOT EXISTS `purc_current_stock` (
  `voorraadID` int(11) unsigned DEFAULT '0',
  `locationID` int(11) unsigned NOT NULL DEFAULT '0',
  `stockID` int(11) unsigned NOT NULL DEFAULT '0',
  `inkoopID` int(11) unsigned NOT NULL DEFAULT '0',
  `inkoopinhoudID` int(11) unsigned DEFAULT '0',
  `orderID` int(11) unsigned NOT NULL DEFAULT '0',
  `orderinhoudID` int(11) unsigned NOT NULL DEFAULT '0',
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `lotnr_sup` char(30) NOT NULL DEFAULT '',
  `expiry_date` date NOT NULL DEFAULT '0000-00-00',
  `intAantal` bigint(11) DEFAULT '0',
  `uom_id` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`locationID`,`stockID`,`inkoopID`,`orderID`,`orderinhoudID`,`productID`,`lotnr_sup`,`expiry_date`,`uom_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_cyclecount_list`
--

CREATE TABLE IF NOT EXISTS `purc_cyclecount_list` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_code` varchar(45) DEFAULT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `generation_date` int(11) unsigned DEFAULT NULL,
  `generation_user` int(11) DEFAULT NULL,
  `edited_date` int(11) unsigned DEFAULT NULL,
  `edited_user` int(11) DEFAULT NULL,
  `no_of_products` int(11) DEFAULT NULL,
  `list_status` enum('temp','processed') DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `FK_CYCLELIST_CYCLE_1` (`cycle_id`,`list_id`),
  KEY `FK_CYCLELIST_USER_1` (`generation_user`,`list_id`),
  KEY `FK_CYCLELIST_USER_2` (`edited_user`,`list_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_cyclecount_listdetails`
--

CREATE TABLE IF NOT EXISTS `purc_cyclecount_listdetails` (
  `list_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stock_count` int(11) DEFAULT NULL,
  `actual_count` int(11) DEFAULT NULL,
  `adjustment_type` enum('add','subtract') DEFAULT NULL,
  PRIMARY KEY (`list_details_id`),
  KEY `FK_LISTDETAILS_LIST_1` (`list_id`,`list_details_id`),
  KEY `FK_LISTDETAILS_PRODUCT_1` (`product_id`,`list_details_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_cyclecount_settings`
--

CREATE TABLE IF NOT EXISTS `purc_cyclecount_settings` (
  `cycle_id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_code` varchar(45) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` int(10) unsigned DEFAULT NULL,
  `end_date` int(10) unsigned DEFAULT NULL,
  `closed_date` int(10) unsigned NOT NULL DEFAULT '0',
  `no_of_products` int(11) DEFAULT NULL,
  `no_of_employees` int(11) DEFAULT NULL,
  `is_closed` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cycle_id`),
  KEY `FK_CYCLE_LOCATION_1` (`location_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_cyclecount_weight`
--

CREATE TABLE IF NOT EXISTS `purc_cyclecount_weight` (
  `weight_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`weight_id`),
  KEY `FK_WEIGHT_PRODUCT_1` (`product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_dossiers`
--

CREATE TABLE IF NOT EXISTS `purc_dossiers` (
  `dossier_id` int(11) NOT NULL AUTO_INCREMENT,
  `dossier_name` varchar(255) DEFAULT NULL,
  `dossier_status` enum('hidden','visible') DEFAULT 'visible',
  `dossier_type` enum('open','closed') DEFAULT 'open',
  `dossier_description` text,
  `added_by` int(11) DEFAULT NULL,
  `added_date` int(11) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `closed_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`dossier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_dossier_objects`
--

CREATE TABLE IF NOT EXISTS `purc_dossier_objects` (
  `dossier_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `dossier_id` int(11) DEFAULT NULL,
  `object` varchar(50) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `link` enum('hard','soft') DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`dossier_object_id`),
  UNIQUE KEY `unique_object` (`dossier_id`,`object`,`object_id`),
  KEY `user_id` (`added_by`),
  KEY `fk_purc_dossier_objects_purc_dossiers` (`dossier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_electronic_packing_slips`
--

CREATE TABLE IF NOT EXISTS `purc_electronic_packing_slips` (
  `electronic_packing_slip_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packing_slip_number` varchar(255) NOT NULL,
  `delivery_date` int(10) unsigned NOT NULL,
  `filename` varchar(25) NOT NULL,
  `status` enum('PENDING','PROCESSED','FAILED','PARTIALLY_PROCESSED') NOT NULL DEFAULT 'PENDING',
  `added_date` int(10) unsigned NOT NULL,
  `processed_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`electronic_packing_slip_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_electronic_packing_slip_lines`
--

CREATE TABLE IF NOT EXISTS `purc_electronic_packing_slip_lines` (
  `electronic_packing_slip_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `electronic_packing_slip_id` int(10) unsigned NOT NULL,
  `purchase_order_line_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `product_uom_id` int(10) unsigned NOT NULL,
  `status` enum('PENDING','PROCESSED','FAILED') NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`electronic_packing_slip_line_id`),
  KEY `electronic_packing_slip_id` (`electronic_packing_slip_id`),
  KEY `purchase_order_line_id` (`purchase_order_line_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_future_prices`
--

CREATE TABLE IF NOT EXISTS `purc_future_prices` (
  `future_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` enum('SUPPLIER','PRODUCT') NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `price` decimal(12,4) unsigned NOT NULL,
  `percentage` decimal(12,4) NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `remark` text,
  `status` enum('PENDING','FINALIZED','FAILED') NOT NULL DEFAULT 'PENDING',
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`future_price_id`),
  KEY `typeIdType` (`type_id`,`type`),
  KEY `addBy` (`added_by`),
  KEY `editBy` (`edit_by`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_future_prices_errors`
--

CREATE TABLE IF NOT EXISTS `purc_future_prices_errors` (
  `future_price_error_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_id` int(10) unsigned NOT NULL,
  `line_value` text NOT NULL,
  `error_code` varchar(25) NOT NULL DEFAULT 'UNKNOWN',
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`future_price_error_id`),
  KEY `upload_id` (`upload_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_ordering_format_options`
--

CREATE TABLE IF NOT EXISTS `purc_ordering_format_options` (
  `ordering_format_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordering_format` tinyint(3) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`ordering_format_option_id`),
  UNIQUE KEY `ordering_format_supplier_name` (`ordering_format`,`supplier_id`,`name`),
  KEY `ordering_format_supplier` (`ordering_format`,`supplier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_order_content_contacts`
--

CREATE TABLE IF NOT EXISTS `purc_order_content_contacts` (
  `order_content_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderinhoud_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_content_contact_id`),
  UNIQUE KEY `orderinhoud_id` (`orderinhoud_id`,`contact_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_order_request_line_dimension_values`
--

CREATE TABLE IF NOT EXISTS `purc_order_request_line_dimension_values` (
  `order_request_line_dimension_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_request_line_id` int(10) unsigned NOT NULL,
  `dimension_id` int(10) unsigned NOT NULL,
  `value_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `add_date` int(10) unsigned NOT NULL,
  `editted_by` int(10) unsigned DEFAULT NULL,
  `edit_date` int(10) unsigned DEFAULT NULL,
  `status` enum('ACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`order_request_line_dimension_value_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_order_request_purchasers`
--

CREATE TABLE IF NOT EXISTS `purc_order_request_purchasers` (
  `order_request_purchaser_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_request_id` int(10) unsigned NOT NULL,
  `purchaser_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_request_purchaser_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_po_additions`
--

CREATE TABLE IF NOT EXISTS `purc_po_additions` (
  `addition_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addition_name` varchar(50) NOT NULL,
  `addition_value` text,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`addition_id`),
  UNIQUE KEY `addition_name` (`addition_name`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_po_addition_languages`
--

CREATE TABLE IF NOT EXISTS `purc_po_addition_languages` (
  `addition_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addition_name` varchar(50) NOT NULL,
  `addition_language` varchar(7) NOT NULL,
  `addition_value` text,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  `edit_by` int(10) unsigned NOT NULL,
  `edit_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`addition_id`),
  UNIQUE KEY `addition_name` (`addition_name`,`addition_language`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_product_additional_fields`
--

CREATE TABLE IF NOT EXISTS `purc_product_additional_fields` (
  `product_additional_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `tariff_type` enum('FIXED_FEE','PER_SERVICE_UNIT') DEFAULT NULL,
  `start_date` int(10) unsigned DEFAULT NULL,
  `end_date` int(10) unsigned DEFAULT NULL,
  `candidate_name` varchar(255) DEFAULT NULL,
  `candidate_type` enum('A','B','C') DEFAULT 'A',
  `function_name` varchar(255) DEFAULT NULL,
  `function_level` enum('JUNIOR','MEDIOR','SENIOR') DEFAULT NULL,
  `contact_information` varchar(255) DEFAULT NULL,
  `var_available` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `var_expiration_date` int(10) unsigned DEFAULT NULL,
  `g_account_available` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `confidentiality_declaration` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `available_identifier` enum('PASPORT','ID_CARD') DEFAULT NULL,
  PRIMARY KEY (`product_additional_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_pro_forma_orders`
--

CREATE TABLE IF NOT EXISTS `purc_pro_forma_orders` (
  `pro_forma_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ordering_transport` int(11) NOT NULL,
  `sent_date` int(11) NOT NULL,
  `status` enum('SUCCESS','FAILED') NOT NULL,
  PRIMARY KEY (`pro_forma_order_id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_purchase_order_contacts`
--

CREATE TABLE IF NOT EXISTS `purc_purchase_order_contacts` (
  `po_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `send_to_supplier` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`po_contact_id`),
  UNIQUE KEY `po_contact` (`purchase_order_id`,`contact_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_rejections`
--

CREATE TABLE IF NOT EXISTS `purc_rejections` (
  `rejection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rejection_code` varchar(30) NOT NULL DEFAULT '',
  `rejection_text` varchar(100) NOT NULL DEFAULT '',
  `added_by` int(11) unsigned NOT NULL,
  `added_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`rejection_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_rejection_objects`
--

CREATE TABLE IF NOT EXISTS `purc_rejection_objects` (
  `rejection_object_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_name` varchar(100) NOT NULL,
  `rejection_id` int(11) unsigned NOT NULL,
  `added_by` int(11) unsigned NOT NULL,
  `added_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`rejection_object_id`),
  UNIQUE KEY `object_name` (`object_name`,`rejection_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_shoppingcarts`
--

CREATE TABLE IF NOT EXISTS `purc_shoppingcarts` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_number` varchar(100) DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `delivery_location_id` int(10) unsigned DEFAULT NULL,
  `invoice_location_id` int(10) unsigned DEFAULT NULL,
  `internal_location_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `costcenter_id` int(10) unsigned DEFAULT NULL,
  `delivery_date` date DEFAULT '0000-00-00',
  `internal_remark` text,
  `supplier_remark` text,
  `is_investment` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `is_urgent` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `added_by` int(10) unsigned DEFAULT NULL,
  `added_date` int(10) unsigned DEFAULT NULL,
  `edit_by` int(10) unsigned DEFAULT NULL,
  `edit_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_shoppingcart_products`
--

CREATE TABLE IF NOT EXISTS `purc_shoppingcart_products` (
  `cart_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) unsigned NOT NULL,
  `order_type` enum('normal','stock','internal','freetext') DEFAULT 'normal',
  `product_id` int(10) unsigned DEFAULT NULL,
  `internal_product_id` int(10) unsigned DEFAULT NULL,
  `uom_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `delivery_location_id` int(10) unsigned DEFAULT NULL,
  `invoice_location_id` int(10) unsigned DEFAULT NULL,
  `internal_location_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `costcenter_id` int(10) unsigned DEFAULT NULL,
  `delivery_date` date DEFAULT '0000-00-00',
  `subcategory_id` int(10) unsigned DEFAULT NULL,
  `vat_percentage` decimal(12,4) unsigned DEFAULT NULL,
  `internal_remark` text,
  `supplier_remark` text,
  `is_service` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `is_investment` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `is_urgent` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `added_by` int(10) unsigned DEFAULT NULL,
  `added_date` int(10) unsigned DEFAULT NULL,
  `edit_by` int(10) unsigned DEFAULT NULL,
  `edit_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cart_product_id`),
  KEY `product_and_cart_id` (`product_id`,`cart_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_stock_to_receive`
--

CREATE TABLE IF NOT EXISTS `purc_stock_to_receive` (
  `inkoopinhoudID` int(11) unsigned NOT NULL DEFAULT '0',
  `ordered` int(11) unsigned DEFAULT '0',
  `received` int(11) unsigned DEFAULT '0',
  `max_date` datetime DEFAULT '0000-00-00 00:00:00',
  `comment` varchar(255) DEFAULT '',
  UNIQUE KEY `inkoopinhoudID` (`inkoopinhoudID`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_subcategory_scheme_account`
--

CREATE TABLE IF NOT EXISTS `purc_subcategory_scheme_account` (
  `subcategory_scheme_account` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(10) unsigned NOT NULL,
  `scheme_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `add_by` int(10) unsigned NOT NULL,
  `add_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subcategory_scheme_account`),
  UNIQUE KEY `subcategory_id` (`subcategory_id`,`scheme_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_summary_current_stock`
--

CREATE TABLE IF NOT EXISTS `purc_summary_current_stock` (
  `quantity` int(11) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  `expiry_date` date NOT NULL,
  `lotnr` char(30) NOT NULL,
  `location_id` int(11) unsigned NOT NULL,
  `stock_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`product_id`,`uom_id`,`expiry_date`,`lotnr`,`location_id`,`stock_order`),
  KEY `quantityUomProduct` (`quantity`,`uom_id`,`product_id`),
  KEY `productQuantity` (`product_id`,`quantity`),
  KEY `product_id` (`product_id`),
  KEY `stock_order` (`stock_order`),
  KEY `stockOrderProduct` (`stock_order`,`product_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_additional_attributes`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_additional_attributes` (
  `supplier_additional_attribute_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `attribute_id` int(11) unsigned NOT NULL,
  `attribute_value` text,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_additional_attribute_id`),
  UNIQUE KEY `supplier_id` (`supplier_id`,`attribute_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=19 ;

--
-- Dumping data for table `purc_supplier_additional_attributes`
--

INSERT INTO `purc_supplier_additional_attributes` (`supplier_additional_attribute_id`, `supplier_id`, `attribute_id`, `attribute_value`, `edit_by`, `edit_date`) VALUES
(1, 2, 1, '', 2, 1510149993),
(2, 2, 2, '', 2, 1510149993),
(3, 2, 3, '', 2, 1510149993),
(4, 2, 4, '', 2, 1510149993),
(5, 2, 5, '', 1, 1504531945),
(6, 2, 6, '', 1, 1504531945),
(7, 3, 1, '', 2, 1504881658),
(8, 3, 2, '', 2, 1504881658),
(9, 3, 3, '', 2, 1504881658),
(10, 3, 4, '', 2, 1504881658),
(11, 3, 5, '', 2, 1504532303),
(12, 3, 6, '', 2, 1504532303),
(13, 1, 1, '', 2, 1510153985),
(14, 1, 2, '', 2, 1510153985),
(15, 1, 3, '', 2, 1510153985),
(16, 1, 4, '', 2, 1510153985),
(17, 1, 5, '', 2, 1504532304),
(18, 1, 6, '', 2, 1504532304);

--
-- Triggers `purc_supplier_additional_attributes`
--
DROP TRIGGER IF EXISTS `purc_supplier_additional_attributes_insert_trigger`;
DELIMITER //
CREATE TRIGGER `purc_supplier_additional_attributes_insert_trigger` AFTER INSERT ON `purc_supplier_additional_attributes`
 FOR EACH ROW BEGIN INSERT INTO purc_supplier_additional_attributes_log (supplier_additional_attribute_id, supplier_id, attribute_id, attribute_value, edit_by, edit_date) VALUES (NEW.supplier_additional_attribute_id, NEW.supplier_id, NEW.attribute_id, NEW.attribute_value, NEW.edit_by, NEW.edit_date); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `purc_supplier_additional_attributes_update_trigger`;
DELIMITER //
CREATE TRIGGER `purc_supplier_additional_attributes_update_trigger` AFTER UPDATE ON `purc_supplier_additional_attributes`
 FOR EACH ROW BEGIN IF NEW.attribute_value != OLD.attribute_value THEN INSERT INTO purc_supplier_additional_attributes_log (supplier_additional_attribute_id, supplier_id, attribute_id, attribute_value, edit_by, edit_date) VALUES (NEW.supplier_additional_attribute_id, NEW.supplier_id, NEW.attribute_id, NEW.attribute_value, NEW.edit_by, NEW.edit_date); END IF; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_additional_attributes_log`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_additional_attributes_log` (
  `purc_supplier_additional_attributes_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_additional_attribute_id` int(11) unsigned NOT NULL,
  `supplier_id` int(11) unsigned NOT NULL,
  `attribute_id` int(11) unsigned NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`purc_supplier_additional_attributes_log_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=19 ;

--
-- Dumping data for table `purc_supplier_additional_attributes_log`
--

INSERT INTO `purc_supplier_additional_attributes_log` (`purc_supplier_additional_attributes_log_id`, `supplier_additional_attribute_id`, `supplier_id`, `attribute_id`, `attribute_value`, `edit_by`, `edit_date`) VALUES
(1, 1, 2, 1, '', 1, 1504531945),
(2, 2, 2, 2, '', 1, 1504531945),
(3, 3, 2, 3, '', 1, 1504531945),
(4, 4, 2, 4, '', 1, 1504531945),
(5, 5, 2, 5, '', 1, 1504531945),
(6, 6, 2, 6, '', 1, 1504531945),
(7, 7, 3, 1, '', 2, 1504532303),
(8, 8, 3, 2, '', 2, 1504532303),
(9, 9, 3, 3, '', 2, 1504532303),
(10, 10, 3, 4, '', 2, 1504532303),
(11, 11, 3, 5, '', 2, 1504532303),
(12, 12, 3, 6, '', 2, 1504532303),
(13, 13, 1, 1, '', 2, 1504532304),
(14, 14, 1, 2, '', 2, 1504532304),
(15, 15, 1, 3, '', 2, 1504532304),
(16, 16, 1, 4, '', 2, 1504532304),
(17, 17, 1, 5, '', 2, 1504532304),
(18, 18, 1, 6, '', 2, 1504532304);

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_attributes`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_attributes` (
  `attribute_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(50) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=7 ;

--
-- Dumping data for table `purc_supplier_attributes`
--

INSERT INTO `purc_supplier_attributes` (`attribute_id`, `attribute_name`) VALUES
(1, 'administrationFee'),
(2, 'administrationMinOrder'),
(3, 'transportFee'),
(4, 'transportMinOrder'),
(5, 'auto_receive_goods_after_hours'),
(6, 'urlForOCIPriceValidation');

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_bank_accounts`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_bank_accounts` (
  `supplier_bank_account_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(1) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `account_number` varchar(25) DEFAULT NULL,
  `iban_number` varchar(50) NOT NULL,
  `bic_code` varchar(15) DEFAULT NULL,
  `country_code` char(2) NOT NULL,
  `currency` char(3) NOT NULL,
  `default_for_supplier` tinyint(1) unsigned NOT NULL,
  `default_for_currency` tinyint(1) unsigned NOT NULL,
  `status` enum('HIDDEN','USABLE') NOT NULL,
  PRIMARY KEY (`supplier_bank_account_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `purc_supplier_bank_accounts`
--

INSERT INTO `purc_supplier_bank_accounts` (`supplier_bank_account_id`, `supplier_id`, `name`, `account_number`, `iban_number`, `bic_code`, `country_code`, `currency`, `default_for_supplier`, `default_for_currency`, `status`) VALUES
(1, 1, 'Default bank account', '65.15.71.316', 'NL87 INGB 0651 5713 16', 'NULL', 'NL', 'EUR', 1, 1, 'USABLE'),
(2, 2, 'Default bank account', 'NULL', 'NL44 RABO 0123 4567 89', 'RABONL2U', 'NL', 'EUR', 1, 1, 'USABLE'),
(3, 3, 'Default bank account', '177870478', 'NL62 ABNA 0177 8704 78', 'ABNANL2A', 'NL', 'EUR', 1, 1, 'USABLE');

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_contacts`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_contacts` (
  `contact_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `contact_type` enum('GENERAL','PURCHASE','LOGISTICS','FINANCIAL','ORDERING') NOT NULL DEFAULT 'GENERAL',
  `contact_name` varchar(50) NOT NULL,
  `contact_address` varchar(50) NOT NULL,
  `contact_zip` varchar(20) NOT NULL,
  `contact_city` varchar(50) NOT NULL,
  `contact_country` varchar(50) NOT NULL,
  `contact_email` varchar(50) DEFAULT NULL,
  `contact_phone` varchar(25) DEFAULT NULL,
  `contact_mobile` varchar(25) DEFAULT NULL,
  `contact_fax` varchar(25) DEFAULT NULL,
  `contact_function` varchar(50) DEFAULT NULL,
  `contact_status` enum('USABLE','HIDDEN') NOT NULL DEFAULT 'USABLE',
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_delivery_days`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_delivery_days` (
  `supplier_delivery_day_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `day` enum('1','2','3','4','5','6','7') NOT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  `add_date` int(11) unsigned DEFAULT NULL,
  `edit_by` int(11) unsigned DEFAULT NULL,
  `edit_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`supplier_delivery_day_id`),
  UNIQUE KEY `supplier_days` (`supplier_id`,`day`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `purc_supplier_delivery_days`
--
DROP TRIGGER IF EXISTS `purcSupplierDeliveryDaysDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `purcSupplierDeliveryDaysDeleteTrigger` AFTER DELETE ON `purc_supplier_delivery_days`
 FOR EACH ROW BEGIN INSERT INTO purc_supplier_delivery_days_log (supplier_delivery_day_id, supplier_id, day, add_by, add_date, edit_by, edit_date, action) VALUES (OLD.supplier_delivery_day_id, OLD.supplier_id, OLD.day, OLD.add_by, OLD.add_date, OLD.edit_by, OLD.edit_date, 'DELETE'); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `purcSupplierDeliveryDaysInsertTrigger`;
DELIMITER //
CREATE TRIGGER `purcSupplierDeliveryDaysInsertTrigger` AFTER INSERT ON `purc_supplier_delivery_days`
 FOR EACH ROW BEGIN INSERT INTO purc_supplier_delivery_days_log (supplier_delivery_day_id, supplier_id, day, add_by, add_date, edit_by, edit_date, action) VALUES (NEW.supplier_delivery_day_id, NEW.supplier_id, NEW.day, NEW.add_by, NEW.add_date, NEW.edit_by, NEW.edit_date, 'INSERT'); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_delivery_days_log`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_delivery_days_log` (
  `supplier_delivery_day_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_delivery_day_id` int(11) NOT NULL,
  `supplier_id` int(11) unsigned NOT NULL,
  `day` enum('1','2','3','4','5','6','7') NOT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  `add_date` int(11) unsigned DEFAULT NULL,
  `edit_by` int(11) unsigned DEFAULT NULL,
  `edit_date` int(11) unsigned DEFAULT NULL,
  `action` enum('INSERT','DELETE') NOT NULL DEFAULT 'INSERT',
  PRIMARY KEY (`supplier_delivery_day_log_id`),
  UNIQUE KEY `supplier_days` (`supplier_id`,`day`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_fields`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_fields` (
  `supplier_id` int(10) unsigned NOT NULL,
  `field_1` varchar(255) DEFAULT NULL,
  `field_2` varchar(255) DEFAULT NULL,
  `field_3` varchar(255) DEFAULT NULL,
  `field_4` varchar(255) DEFAULT NULL,
  `field_5` varchar(255) DEFAULT NULL,
  `field_6` varchar(255) DEFAULT NULL,
  `field_7` varchar(255) DEFAULT NULL,
  `field_8` varchar(255) DEFAULT NULL,
  `field_9` varchar(255) DEFAULT NULL,
  `field_10` varchar(255) DEFAULT NULL,
  `field_11` varchar(255) DEFAULT NULL,
  `field_12` varchar(255) DEFAULT NULL,
  `field_13` varchar(255) DEFAULT NULL,
  `field_14` varchar(255) DEFAULT NULL,
  `field_15` varchar(255) DEFAULT NULL,
  `field_16` varchar(255) DEFAULT NULL,
  `field_17` varchar(255) DEFAULT NULL,
  `field_18` varchar(255) DEFAULT NULL,
  `field_19` varchar(255) DEFAULT NULL,
  `field_20` varchar(255) DEFAULT NULL,
  `field_21` varchar(255) DEFAULT NULL,
  `field_22` varchar(255) DEFAULT NULL,
  `field_23` varchar(255) DEFAULT NULL,
  `field_24` varchar(255) DEFAULT NULL,
  `field_25` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purc_supplier_fields`
--

INSERT INTO `purc_supplier_fields` (`supplier_id`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_11`, `field_12`, `field_13`, `field_14`, `field_15`, `field_16`, `field_17`, `field_18`, `field_19`, `field_20`, `field_21`, `field_22`, `field_23`, `field_24`, `field_25`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_field_headers`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_field_headers` (
  `header_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_nr` tinyint(3) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `field_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_schedule`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_schedule` (
  `supplier_schedule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `time_of_day` int(11) DEFAULT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  `add_date` int(11) unsigned DEFAULT NULL,
  `edit_by` int(11) unsigned DEFAULT NULL,
  `edit_date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`supplier_schedule_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `purc_supplier_schedule`
--
DROP TRIGGER IF EXISTS `purcSupplierScheduleDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `purcSupplierScheduleDeleteTrigger` AFTER DELETE ON `purc_supplier_schedule`
 FOR EACH ROW BEGIN INSERT INTO purc_supplier_schedule_log (supplier_schedule_id, supplier_id, day_of_week, time_of_day, add_by, add_date, edit_by, edit_date, action) VALUES (OLD.supplier_schedule_id, OLD.supplier_id, OLD.day_of_week, OLD.time_of_day, OLD.add_by, OLD.add_date, OLD.edit_by, OLD.edit_date, 'DELETE'); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `purcSupplierScheduleInsertTrigger`;
DELIMITER //
CREATE TRIGGER `purcSupplierScheduleInsertTrigger` AFTER INSERT ON `purc_supplier_schedule`
 FOR EACH ROW BEGIN INSERT INTO purc_supplier_schedule_log (supplier_schedule_id, supplier_id, day_of_week, time_of_day, add_by, add_date, edit_by, edit_date, action) VALUES (NEW.supplier_schedule_id, NEW.supplier_id, NEW.day_of_week, NEW.time_of_day, NEW.add_by, NEW.add_date, NEW.edit_by, NEW.edit_date, 'INSERT'); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_schedule_log`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_schedule_log` (
  `supplier_schedule_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_schedule_id` int(11) unsigned NOT NULL,
  `supplier_id` int(11) unsigned NOT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `time_of_day` int(11) DEFAULT NULL,
  `add_by` int(11) unsigned DEFAULT NULL,
  `add_date` int(11) unsigned DEFAULT NULL,
  `edit_by` int(11) unsigned DEFAULT NULL,
  `edit_date` int(11) unsigned DEFAULT NULL,
  `action` enum('INSERT','DELETE') NOT NULL DEFAULT 'INSERT',
  PRIMARY KEY (`supplier_schedule_log_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_supplier_subcategories`
--

CREATE TABLE IF NOT EXISTS `purc_supplier_subcategories` (
  `supplier_subcategory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `added_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`supplier_subcategory_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `added_by` (`added_by`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_track_and_trace`
--

CREATE TABLE IF NOT EXISTS `purc_track_and_trace` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL,
  `move_to_object_id` int(11) DEFAULT NULL,
  `move_to_object_type` varchar(255) NOT NULL DEFAULT 'object',
  `object_type` varchar(255) NOT NULL DEFAULT 'object',
  `object_id` int(11) NOT NULL,
  `tt_date` int(11) NOT NULL,
  `scan_action_timestamp` int(11) NOT NULL DEFAULT '0',
  `scan_batch_id` int(11) DEFAULT NULL,
  `received_product_id` int(11) DEFAULT NULL,
  `extra_object_type` varchar(255) NOT NULL DEFAULT 'object',
  `extra_object_id` int(10) unsigned NOT NULL,
  `is_scan_action` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`tt_id`),
  KEY `fk_action_id` (`action_id`),
  KEY `fk_object` (`object_type`(191),`object_id`),
  KEY `fk_move_to` (`move_to_object_type`(191),`move_to_object_id`),
  KEY `fk_scan_batch_id` (`scan_batch_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_tt_objects`
--

CREATE TABLE IF NOT EXISTS `purc_tt_objects` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type_id` int(11) NOT NULL,
  `deposit` decimal(12,4) DEFAULT '0.0000',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `fk_object_type_id` (`object_type_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_tt_object_containers`
--

CREATE TABLE IF NOT EXISTS `purc_tt_object_containers` (
  `object_container_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type_id` int(11) DEFAULT NULL,
  `may_contain_object_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`object_container_id`),
  KEY `fk_object_type_id` (`object_type_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_tt_object_types`
--

CREATE TABLE IF NOT EXISTS `purc_tt_object_types` (
  `object_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `standard_deposit` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `disposable` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`object_type_id`),
  KEY `fk_action_id` (`action_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_tt_received_products`
--

CREATE TABLE IF NOT EXISTS `purc_tt_received_products` (
  `received_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `voorraad_id` int(11) DEFAULT NULL,
  `lot_nr` varchar(255) DEFAULT NULL,
  `expiration_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`received_product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `purc_tt_received_products`
--
DROP TRIGGER IF EXISTS `addTrackAndTrace`;
DELIMITER //
CREATE TRIGGER `addTrackAndTrace` AFTER INSERT ON `purc_tt_received_products`
 FOR EACH ROW BEGIN IF @voorraadId != NEW.voorraad_id OR @voorraadId IS NULL THEN SET @locationId = NULL; SELECT locationID INTO @locationId FROM tblvoorraad WHERE voorraadID = NEW.voorraad_id; END IF; SET @voorraadId = NEW.voorraad_id; SET @ttDate = UNIX_TIMESTAMP(NOW()); INSERT INTO purc_track_and_trace( action_id, move_to_object_type, move_to_object_id, object_type, object_id, tt_date, scan_action_timestamp, scan_batch_id, received_product_id, is_scan_action) VALUES( 1, 'tbllocation', @locationId, 'purc_tt_received_products', NEW.received_product_id, @ttDate, @ttDate, @ttDate, NEW.received_product_id, 'TRUE'); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_tt_scan_actions`
--

CREATE TABLE IF NOT EXISTS `purc_tt_scan_actions` (
  `scan_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `upload_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`scan_batch_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_vat_options`
--

CREATE TABLE IF NOT EXISTS `purc_vat_options` (
  `vat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vat_value` decimal(5,2) NOT NULL,
  PRIMARY KEY (`vat_id`),
  UNIQUE KEY `vat_value` (`vat_value`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_volume_prices`
--

CREATE TABLE IF NOT EXISTS `purc_volume_prices` (
  `volume_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `from_quantity` int(11) NOT NULL,
  `till_quantity` int(11) NOT NULL,
  `discount_type` enum('PRICE','PERCENTAGE') NOT NULL DEFAULT 'PRICE',
  `discount` decimal(12,4) NOT NULL,
  `volume_type_id` int(11) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` int(11) NOT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`volume_price_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_volume_types`
--

CREATE TABLE IF NOT EXISTS `purc_volume_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` int(11) NOT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name_UNIQUE` (`type_name`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purc_volume_type_content`
--

CREATE TABLE IF NOT EXISTS `purc_volume_type_content` (
  `volume_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `from_quantity` int(11) NOT NULL,
  `till_quantity` int(11) NOT NULL,
  `discount_type` enum('PRICE','PERCENTAGE') NOT NULL DEFAULT 'PRICE',
  `discount` decimal(12,4) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` int(11) NOT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`volume_content_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `remarks`
--

CREATE TABLE IF NOT EXISTS `remarks` (
  `remark_id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `added_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`remark_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_baseprice_products`
--

CREATE TABLE IF NOT EXISTS `sales_baseprice_products` (
  `baseprice_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `baseprice_profile_revision_id` int(10) unsigned NOT NULL,
  `price` decimal(21,9) unsigned NOT NULL,
  PRIMARY KEY (`baseprice_product_id`),
  UNIQUE KEY `sales_baseprice_product_ids` (`product_id`,`baseprice_profile_revision_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_baseprice_profiles`
--

CREATE TABLE IF NOT EXISTS `sales_baseprice_profiles` (
  `baseprice_profile_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL,
  PRIMARY KEY (`baseprice_profile_id`),
  KEY `sales_baseprice_profiles_name` (`name`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_baseprice_profiles`
--

INSERT INTO `sales_baseprice_profiles` (`baseprice_profile_id`, `name`) VALUES
(1, 'Default baseprice profile');

-- --------------------------------------------------------

--
-- Table structure for table `sales_baseprice_profile_revisions`
--

CREATE TABLE IF NOT EXISTS `sales_baseprice_profile_revisions` (
  `baseprice_profile_revision_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baseprice_profile_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `start_date` int(10) unsigned NOT NULL,
  `end_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`baseprice_profile_revision_id`),
  KEY `sales_baseprice_profile_revisions_dates_id` (`baseprice_profile_id`,`start_date`,`end_date`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_baseprice_profile_revisions`
--

INSERT INTO `sales_baseprice_profile_revisions` (`baseprice_profile_revision_id`, `baseprice_profile_id`, `revision`, `start_date`, `end_date`) VALUES
(1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_baseprice_profile_revision_customers`
--

CREATE TABLE IF NOT EXISTS `sales_baseprice_profile_revision_customers` (
  `baseprice_profile_revision_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baseprice_profile_revision_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `future_approved_revision` tinyint(4) NOT NULL,
  `init_date` int(10) unsigned NOT NULL,
  `approved_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`baseprice_profile_revision_customer_id`),
  KEY `sales_baseprice_profile_revision_customer_approved_customer_id` (`approved`,`customer_id`),
  KEY `sales_baseprice_profile_revision_customer_approved_id` (`approved`,`baseprice_profile_revision_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_baseprice_profile_revision_customers`
--

INSERT INTO `sales_baseprice_profile_revision_customers` (`baseprice_profile_revision_customer_id`, `baseprice_profile_revision_id`, `customer_id`, `approved`, `future_approved_revision`, `init_date`, `approved_date`) VALUES
(1, 1, 6, 1, 0, 1489065459, 1489065459);

-- --------------------------------------------------------

--
-- Table structure for table `sales_baseprice_upload_temp`
--

CREATE TABLE IF NOT EXISTS `sales_baseprice_upload_temp` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `base_price_profile_id` int(11) NOT NULL,
  `product_num` varchar(100) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`row_id`),
  UNIQUE KEY `base_price_profile` (`base_price_profile_id`,`product_num`,`session_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_brands`
--

CREATE TABLE IF NOT EXISTS `sales_brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_categories`
--

CREATE TABLE IF NOT EXISTS `sales_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_clientfields`
--

CREATE TABLE IF NOT EXISTS `sales_clientfields` (
  `clientfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `fieldtype` enum('startpage','other') NOT NULL,
  `fieldcontent` text NOT NULL,
  PRIMARY KEY (`clientfield_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_discounts_brand`
--

CREATE TABLE IF NOT EXISTS `sales_discounts_brand` (
  `discount_brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `percentage` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`discount_brand_id`),
  UNIQUE KEY `brand_id` (`brand_id`,`profile_revision_id`),
  KEY `brand_id__prof_rev_id` (`profile_revision_id`,`brand_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_discounts_category`
--

CREATE TABLE IF NOT EXISTS `sales_discounts_category` (
  `discount_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `percentage` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`discount_category_id`),
  UNIQUE KEY `category_id` (`category_id`,`profile_revision_id`),
  KEY `category_id__prof_rev_id` (`category_id`,`profile_revision_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_discounts_global`
--

CREATE TABLE IF NOT EXISTS `sales_discounts_global` (
  `discount_global_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `percentage` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`discount_global_id`),
  UNIQUE KEY `profile_revision_id_2` (`profile_revision_id`),
  KEY `profile_revision_id` (`profile_revision_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_discounts_product`
--

CREATE TABLE IF NOT EXISTS `sales_discounts_product` (
  `discount_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `percentage` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`discount_product_id`),
  UNIQUE KEY `product_id` (`product_id`,`profile_revision_id`),
  KEY `prod_id__prof_rev_id` (`product_id`,`profile_revision_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_discount_upload_temp`
--

CREATE TABLE IF NOT EXISTS `sales_discount_upload_temp` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_name` varchar(150) NOT NULL,
  `type` varchar(100) NOT NULL,
  `nameid` varchar(150) NOT NULL,
  `pecentage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_lists`
--

CREATE TABLE IF NOT EXISTS `sales_lists` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `listname` char(60) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `mutation_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_list_contents`
--

CREATE TABLE IF NOT EXISTS `sales_list_contents` (
  `list_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_content_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE IF NOT EXISTS `sales_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_nr` char(50) NOT NULL DEFAULT '',
  `type` enum('web','oci') DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `order_date` int(10) unsigned NOT NULL DEFAULT '0',
  `shipto_company_name` char(255) NOT NULL DEFAULT '',
  `shipto_street` char(255) NOT NULL DEFAULT '',
  `shipto_zipcode` char(10) NOT NULL DEFAULT '',
  `shipto_city` char(50) NOT NULL DEFAULT '',
  `shipto_state` char(50) NOT NULL DEFAULT '',
  `shipto_country` char(50) NOT NULL DEFAULT '',
  `billto_company_name` char(255) NOT NULL DEFAULT '',
  `billto_street` char(255) NOT NULL DEFAULT '',
  `billto_zipcode` char(10) NOT NULL DEFAULT '',
  `billto_city` char(50) NOT NULL DEFAULT '',
  `billto_state` char(50) NOT NULL DEFAULT '',
  `billto_country` char(50) NOT NULL DEFAULT '',
  `company_name` char(255) NOT NULL DEFAULT '',
  `company_vat` char(30) DEFAULT '0',
  `contact_name` char(255) NOT NULL DEFAULT '',
  `contact_phone` char(50) NOT NULL DEFAULT '',
  `contact_mobile` char(50) NOT NULL DEFAULT '',
  `contact_fax` char(50) NOT NULL DEFAULT '',
  `contact_email` char(50) NOT NULL DEFAULT '',
  `total_price` decimal(21,9) DEFAULT '0.000000000',
  `total_discounted_price` decimal(21,9) DEFAULT '0.000000000',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_contents`
--

CREATE TABLE IF NOT EXISTS `sales_order_contents` (
  `order_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_nr` char(30) NOT NULL DEFAULT '',
  `name` char(100) NOT NULL DEFAULT '',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(21,9) DEFAULT '0.000000000',
  `discount_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discounted_price` decimal(21,9) DEFAULT '0.000000000',
  `total_price` decimal(21,9) DEFAULT '0.000000000',
  PRIMARY KEY (`order_content_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_prices_product`
--

CREATE TABLE IF NOT EXISTS `sales_prices_product` (
  `price_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(21,9) DEFAULT '0.000000000',
  PRIMARY KEY (`price_product_id`),
  KEY `prod_id__prof_rev_id` (`product_id`,`profile_revision_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_products`
--

CREATE TABLE IF NOT EXISTS `sales_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_nr` varchar(30) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `longname` text NOT NULL,
  `description` text,
  `price` decimal(18,6) DEFAULT '0.000000',
  `isounit` varchar(5) NOT NULL DEFAULT '',
  `textunit` varchar(50) DEFAULT NULL,
  `packageunit` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL DEFAULT '0',
  `unspsc` varchar(15) DEFAULT '',
  `weblink` varchar(200) DEFAULT '',
  `msdslink` varchar(200) DEFAULT '',
  `barcodenr` varchar(30) DEFAULT '',
  `additional1` varchar(200) DEFAULT '',
  `additional2` varchar(200) DEFAULT '',
  `additional3` varchar(200) NOT NULL DEFAULT '',
  `additional4` varchar(200) NOT NULL DEFAULT '',
  `additional5` varchar(200) NOT NULL DEFAULT '',
  `additional6` varchar(200) NOT NULL DEFAULT '',
  `stock` int(11) DEFAULT '-1',
  `canbeordered` tinyint(1) NOT NULL DEFAULT '1',
  `cleaned_searchable_text` text,
  `supplier_order_unit` int(11) DEFAULT NULL,
  `supplier_base_uom` int(11) DEFAULT NULL,
  `supplier_ordering_multiplier` int(11) DEFAULT NULL,
  `minimum_order_quantity` int(11) DEFAULT NULL,
  `step_order_quantity` int(11) DEFAULT NULL,
  `hazardous` tinyint(1) DEFAULT NULL,
  `radioactive` tinyint(1) DEFAULT NULL,
  `minor_radioactive` tinyint(1) DEFAULT NULL,
  `toxic` tinyint(1) DEFAULT NULL,
  `storage_temperature_multiplier` int(11) DEFAULT NULL,
  `storage_temprature_unit` enum('Celcius','Fahrenheit') DEFAULT NULL,
  `shipping_temprature_multiplier` int(11) DEFAULT NULL,
  `shipping_temprature_unit` enum('Celcius','Fahrenheit') DEFAULT NULL,
  `cas_number` varchar(10) DEFAULT NULL,
  `removal_costs` int(11) DEFAULT NULL,
  `fixed_shipping_costs` int(11) DEFAULT NULL,
  `ean_code_supplier_ordering_unit` int(11) DEFAULT NULL,
  `ean_code_supplier_base_unit` int(11) DEFAULT NULL,
  `manufacturer_product_number` varchar(30) DEFAULT NULL,
  `distributor_number` varchar(30) DEFAULT NULL,
  `average_delivery_time` int(11) DEFAULT NULL,
  `green_product` tinyint(1) DEFAULT NULL,
  `bio_product` tinyint(1) DEFAULT NULL,
  `vat` decimal(12,4) DEFAULT '0.0000',
  `sterile` tinyint(1) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `applications` text,
  `packsize` varchar(100) DEFAULT NULL,
  `main_product_code` varchar(255) DEFAULT NULL,
  `specification_description` text,
  `spec1_header` varchar(255) DEFAULT NULL,
  `spec1_value` text,
  `spec2_header` varchar(255) DEFAULT NULL,
  `spec2_value` text,
  `spec3_header` varchar(255) DEFAULT NULL,
  `spec3_value` text,
  `spec4_header` varchar(255) DEFAULT NULL,
  `spec4_value` text,
  `spec5_header` varchar(255) DEFAULT NULL,
  `spec5_value` text,
  `manual1_title` varchar(255) DEFAULT NULL,
  `manual1_link` varchar(255) DEFAULT NULL,
  `manual2_title` varchar(255) DEFAULT NULL,
  `manual2_link` varchar(255) DEFAULT NULL,
  `manual3_title` varchar(255) DEFAULT NULL,
  `manual3_link` varchar(255) DEFAULT NULL,
  `manual4_title` varchar(255) DEFAULT NULL,
  `manual4_link` varchar(255) DEFAULT NULL,
  `manual5_title` varchar(255) DEFAULT NULL,
  `manual5_link` varchar(255) DEFAULT NULL,
  `manual_description` text,
  `msds1_title` varchar(255) DEFAULT NULL,
  `msds1_link` varchar(255) DEFAULT NULL,
  `msds2_title` varchar(255) DEFAULT NULL,
  `msds2_link` varchar(255) DEFAULT NULL,
  `msds3_title` varchar(255) DEFAULT NULL,
  `msds3_link` varchar(255) DEFAULT NULL,
  `msds4_title` varchar(255) DEFAULT NULL,
  `msds4_link` varchar(255) DEFAULT NULL,
  `msds5_title` varchar(255) DEFAULT NULL,
  `msds5_link` varchar(255) DEFAULT NULL,
  `cofa` varchar(255) DEFAULT NULL,
  `related_product1` varchar(255) DEFAULT NULL,
  `related_product2` varchar(255) DEFAULT NULL,
  `related_product3` varchar(255) DEFAULT NULL,
  `related_product4` varchar(255) DEFAULT NULL,
  `related_product5` varchar(255) DEFAULT NULL,
  `product_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_nr` (`product_nr`),
  KEY `sp_c` (`category_id`),
  KEY `sp_b` (`brand_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `sales_products`
--
DROP TRIGGER IF EXISTS `insertCleanedTextSalesProducts`;
DELIMITER //
CREATE TRIGGER `insertCleanedTextSalesProducts` BEFORE INSERT ON `sales_products`
 FOR EACH ROW BEGIN SET NEW.cleaned_searchable_text = tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.name, NEW.longname, NEW.description, NEW.product_nr, NEW.additional1, NEW.additional2, NEW.additional3, NEW.additional4, NEW.additional5, NEW.additional6)); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `updateCleanedTextSalesProducts`;
DELIMITER //
CREATE TRIGGER `updateCleanedTextSalesProducts` BEFORE UPDATE ON `sales_products`
 FOR EACH ROW BEGIN SET NEW.cleaned_searchable_text = tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.name, NEW.longname, NEW.description, NEW.product_nr, NEW.additional1, NEW.additional2, NEW.additional3, NEW.additional4, NEW.additional5, NEW.additional6)); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_products_temp`
--

CREATE TABLE IF NOT EXISTS `sales_products_temp` (
  `temp_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `product_nr` varchar(30) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `longname` text NOT NULL,
  `description` text,
  `price` decimal(21,9) DEFAULT NULL,
  `isounit` varchar(5) NOT NULL DEFAULT '',
  `textunit` varchar(50) DEFAULT NULL,
  `packageunit` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL DEFAULT '0',
  `unspsc` varchar(15) DEFAULT '',
  `weblink` varchar(200) DEFAULT '',
  `msdslink` varchar(200) DEFAULT '',
  `barcodenr` varchar(30) DEFAULT '',
  `additional1` varchar(200) DEFAULT '',
  `additional2` varchar(200) DEFAULT '',
  `additional3` varchar(200) NOT NULL DEFAULT '',
  `additional4` varchar(200) NOT NULL DEFAULT '',
  `additional5` varchar(200) NOT NULL DEFAULT '',
  `additional6` varchar(200) NOT NULL DEFAULT '',
  `stock` int(11) DEFAULT '-1',
  `canbeordered` tinyint(1) NOT NULL DEFAULT '1',
  `supplier_order_unit` int(11) DEFAULT NULL,
  `supplier_base_uom` int(11) DEFAULT NULL,
  `supplier_ordering_multiplier` int(11) DEFAULT NULL,
  `minimum_order_quantity` int(11) DEFAULT NULL,
  `step_order_quantity` int(11) DEFAULT NULL,
  `hazardous` tinyint(1) DEFAULT NULL,
  `radioactive` tinyint(1) DEFAULT NULL,
  `minor_radioactive` tinyint(1) DEFAULT NULL,
  `toxic` tinyint(1) DEFAULT NULL,
  `storage_temperature_multiplier` int(11) DEFAULT NULL,
  `storage_temprature_unit` enum('Celcius','Fahrenheit') DEFAULT NULL,
  `shipping_temprature_multiplier` int(11) DEFAULT NULL,
  `shipping_temprature_unit` enum('Celcius','Fahrenheit') DEFAULT NULL,
  `cas_number` varchar(10) DEFAULT NULL,
  `removal_costs` int(11) DEFAULT NULL,
  `fixed_shipping_costs` int(11) DEFAULT NULL,
  `ean_code_supplier_ordering_unit` int(11) DEFAULT NULL,
  `ean_code_supplier_base_unit` int(11) DEFAULT NULL,
  `manufacturer_product_number` varchar(30) DEFAULT NULL,
  `distributor_number` varchar(30) DEFAULT NULL,
  `average_delivery_time` int(11) DEFAULT NULL,
  `green_product` tinyint(1) DEFAULT NULL,
  `bio_product` tinyint(1) DEFAULT NULL,
  `vat` decimal(12,4) DEFAULT '0.0000',
  `sterile` tinyint(1) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `applications` text,
  `packsize` varchar(100) DEFAULT NULL,
  `main_product_code` varchar(255) DEFAULT NULL,
  `specification_description` text,
  `spec1_header` varchar(255) DEFAULT NULL,
  `spec1_value` text,
  `spec2_header` varchar(255) DEFAULT NULL,
  `spec2_value` text,
  `spec3_header` varchar(255) DEFAULT NULL,
  `spec3_value` text,
  `spec4_header` varchar(255) DEFAULT NULL,
  `spec4_value` text,
  `spec5_header` varchar(255) DEFAULT NULL,
  `spec5_value` text,
  `manual1_title` varchar(255) DEFAULT NULL,
  `manual1_link` varchar(255) DEFAULT NULL,
  `manual2_title` varchar(255) DEFAULT NULL,
  `manual2_link` varchar(255) DEFAULT NULL,
  `manual3_title` varchar(255) DEFAULT NULL,
  `manual3_link` varchar(255) DEFAULT NULL,
  `manual4_title` varchar(255) DEFAULT NULL,
  `manual4_link` varchar(255) DEFAULT NULL,
  `manual5_title` varchar(255) DEFAULT NULL,
  `manual5_link` varchar(255) DEFAULT NULL,
  `manual_description` text,
  `msds1_title` varchar(255) DEFAULT NULL,
  `msds1_link` varchar(255) DEFAULT NULL,
  `msds2_title` varchar(255) DEFAULT NULL,
  `msds2_link` varchar(255) DEFAULT NULL,
  `msds3_title` varchar(255) DEFAULT NULL,
  `msds3_link` varchar(255) DEFAULT NULL,
  `msds4_title` varchar(255) DEFAULT NULL,
  `msds4_link` varchar(255) DEFAULT NULL,
  `msds5_title` varchar(255) DEFAULT NULL,
  `msds5_link` varchar(255) DEFAULT NULL,
  `cofa` varchar(255) DEFAULT NULL,
  `related_product1` varchar(255) DEFAULT NULL,
  `related_product2` varchar(255) DEFAULT NULL,
  `related_product3` varchar(255) DEFAULT NULL,
  `related_product4` varchar(255) DEFAULT NULL,
  `related_product5` varchar(255) DEFAULT NULL,
  `product_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`temp_product_id`),
  UNIQUE KEY `product_nr` (`product_nr`,`session_id`,`name`),
  KEY `category_id` (`category_id`,`brand_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_product_selections`
--

CREATE TABLE IF NOT EXISTS `sales_product_selections` (
  `product_selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_products` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_selection_id`),
  KEY `p_c` (`profile_revision_id`,`category_id`),
  KEY `p_b` (`profile_revision_id`,`brand_id`),
  KEY `p_p` (`profile_revision_id`,`product_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_product_selections`
--

INSERT INTO `sales_product_selections` (`product_selection_id`, `profile_revision_id`, `all_products`, `category_id`, `brand_id`, `product_id`) VALUES
(1, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_profiles`
--

CREATE TABLE IF NOT EXISTS `sales_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(150) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_profile_revisions`
--

CREATE TABLE IF NOT EXISTS `sales_profile_revisions` (
  `profile_revision_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision` int(10) unsigned NOT NULL DEFAULT '0',
  `start_date` int(10) unsigned NOT NULL DEFAULT '0',
  `end_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_revision_id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_profile_revision_customer`
--

CREATE TABLE IF NOT EXISTS `sales_profile_revision_customer` (
  `profile_revision_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `init_date` int(10) unsigned NOT NULL DEFAULT '0',
  `approved_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_revision_customer_id`),
  KEY `pr_rev_id__ok` (`profile_revision_id`,`approved`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_settings`
--

CREATE TABLE IF NOT EXISTS `sales_settings` (
  `setting_name` char(30) NOT NULL,
  `setting_value` char(100) NOT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB ;

--
-- Dumping data for table `sales_settings`
--

INSERT INTO `sales_settings` (`setting_name`, `setting_value`) VALUES
('activateFullAdminRights', 'false'),
('anonymous', 'false'),
('approverevesions', 'true'),
('approverevisions', 'false'),
('comma', '.'),
('currency', 'EUR'),
('decimals', '2'),
('def_lang', 'en'),
('defaultBasePriceId', '1'),
('priceformat', ',.'),
('quickshop', 'false'),
('registrable', 'true'),
('separator', ','),
('shop_mail', ''),
('showdiscounts', 'true'),
('stylesheet', 'default.css'),
('validate', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `sales_shoppingcarts`
--

CREATE TABLE IF NOT EXISTS `sales_shoppingcarts` (
  `shoppingcart_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `mutation_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shoppingcart_id`)
) ENGINE=InnoDB  COMMENT='current_status could be changed to enum once we know the exa' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shoppingcart_contents`
--

CREATE TABLE IF NOT EXISTS `sales_shoppingcart_contents` (
  `shoppingcart_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `shoppingcart_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shoppingcart_content_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_uom`
--

CREATE TABLE IF NOT EXISTS `sales_uom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` char(30) NOT NULL DEFAULT '',
  `uom_symbol` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supo_settings`
--

CREATE TABLE IF NOT EXISTS `supo_settings` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `editable_by_user` enum('yes','no') NOT NULL DEFAULT 'no',
  `visible` enum('yes','no') NOT NULL DEFAULT 'yes',
  `hash` int(7) NOT NULL DEFAULT '1',
  `edited_by` int(10) unsigned DEFAULT NULL,
  `edit_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `name` (`name`),
  KEY `edited_by` (`edited_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `supo_settings`
--

INSERT INTO `supo_settings` (`setting_id`, `name`, `value`, `editable_by_user`, `visible`, `hash`, `edited_by`, `edit_date`) VALUES
(1, 'invoice_sharing_username', NULL, 'no', 'no', 1, NULL, NULL),
(2, 'invoice_sharing_password', NULL, 'no', 'no', 1, NULL, NULL),
(3, 'tblox_username_for_invoicesharing', NULL, 'no', 'no', 1, NULL, NULL),
(4, 'tblox_password_for_invoicesharing', NULL, 'no', 'no', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_feedback`
--

CREATE TABLE IF NOT EXISTS `supplier_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `object` varchar(20) NOT NULL,
  `object_id` varchar(20) NOT NULL,
  `feedback` text NOT NULL,
  `posted_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblaanpasorder`
--

CREATE TABLE IF NOT EXISTS `tblaanpasorder` (
  `aanpas_id` int(11) NOT NULL AUTO_INCREMENT,
  `aanpas_nr` char(15) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `inkoop_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('TEMP','FINALIZED') NOT NULL DEFAULT 'TEMP',
  `bln_creditnota` enum('FALSE','TRUE') NOT NULL DEFAULT 'FALSE',
  `bln_fysiekretour` enum('FALSE','TRUE') NOT NULL DEFAULT 'FALSE',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aanpas_id`),
  KEY `status` (`status`),
  KEY `inkoopIdStatus` (`inkoop_id`,`status`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblaanpasorderinhoud`
--

CREATE TABLE IF NOT EXISTS `tblaanpasorderinhoud` (
  `inhoud_id` int(11) NOT NULL AUTO_INCREMENT,
  `aanpas_id` int(11) NOT NULL DEFAULT '0',
  `parent_aanpasorder_inhoud_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `aantal` int(11) NOT NULL DEFAULT '0',
  `price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `price_group` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `amount_group` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bhprice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bhprice_group` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bhamount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bhamount_group` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bln_bhcheck` enum('FALSE','TRUE') NOT NULL DEFAULT 'FALSE',
  `remark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `uom_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('RETOUR','ROLLBACK','PRICE_ADJUSTMENT') NOT NULL DEFAULT 'ROLLBACK',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` enum('TORECEIVE','STOCK','OUTSTOCK') NOT NULL DEFAULT 'TORECEIVE',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`inhoud_id`),
  KEY `aanpasProductType` (`aanpas_id`,`product_id`,`type`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbhinfo`
--

CREATE TABLE IF NOT EXISTS `tblbhinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `financeID` int(11) NOT NULL DEFAULT '0',
  `leverancierID` int(11) NOT NULL DEFAULT '0',
  `status` enum('NEW','WAITING','BATCH') NOT NULL DEFAULT 'NEW',
  `type` enum('PO','NOTPO','NOTPO_CONFIRMED','NOTPO_CANCELED','NOTPO_CNOTE_WAITING','NOTPO_CNOTE_CONFIRMED') NOT NULL DEFAULT 'PO',
  `batchID` int(11) NOT NULL DEFAULT '0',
  `boekjaar` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `dagboek` varchar(10) NOT NULL DEFAULT '',
  `omschrijving` varchar(255) NOT NULL DEFAULT '',
  `factuurdatum` date NOT NULL DEFAULT '0000-00-00',
  `vervaldatum` date NOT NULL DEFAULT '0000-00-00',
  `betalingsconditie` int(11) NOT NULL DEFAULT '0',
  `btwverwerking` char(1) NOT NULL DEFAULT '',
  `btwverwerking2` varchar(20) NOT NULL DEFAULT '',
  `BTWHperc` decimal(4,1) NOT NULL DEFAULT '0.0',
  `BTWHcode` varchar(10) NOT NULL DEFAULT '',
  `dblBTWH` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupBTWH` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `BTWLperc` decimal(4,1) NOT NULL DEFAULT '0.0',
  `BTWLcode` varchar(10) NOT NULL DEFAULT '',
  `dblBTWL` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupBTWL` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `BTW0perc` decimal(4,1) NOT NULL DEFAULT '0.0',
  `BTW0code` varchar(10) NOT NULL DEFAULT '',
  `dblBTW0` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupBTW0` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblDeposit` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupDeposit` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `internal_invoice_nr` varchar(16) NOT NULL DEFAULT '',
  `subcategory_id` int(11) unsigned NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `total_grootboek_id` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `invoice_supplier_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblboekhoud`
--

CREATE TABLE IF NOT EXISTS `tblboekhoud` (
  `lngID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `financeID` int(11) NOT NULL DEFAULT '0',
  `boekhoudID` char(100) NOT NULL DEFAULT '0',
  `invoiceID` char(100) NOT NULL DEFAULT '0',
  `inkoopID` int(11) NOT NULL DEFAULT '0',
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `dblBHPrice` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblBHGroupPrice` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblBHAmount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblBHGroupAmount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `boekhoudDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `boekhoudUser` int(11) NOT NULL DEFAULT '0',
  `strRemark` char(255) NOT NULL DEFAULT '',
  `dblTransp` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupTransp` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblAdmin` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dblGroupAdmin` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `valutaID` char(3) NOT NULL DEFAULT '',
  `uom_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('D','C') NOT NULL DEFAULT 'D',
  `aanpasinhoud_id` int(11) NOT NULL DEFAULT '0',
  `dbl_vat_perc` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `dbl_vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dbl_vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dbl_trans_vat_perc` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `dbl_trans_vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dbl_trans_vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dbl_admin_vat_perc` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `dbl_admin_vat_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dbl_admin_vat_group_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`lngID`),
  KEY `inkoopID` (`inkoopID`),
  KEY `productID` (`productID`),
  KEY `financeID` (`financeID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblheadcategory`
--

CREATE TABLE IF NOT EXISTS `tblheadcategory` (
  `headCategoryID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `headName` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`headCategoryID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblinkoop`
--

CREATE TABLE IF NOT EXISTS `tblinkoop` (
  `inkoopID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inkoopnr` varchar(12) NOT NULL DEFAULT '',
  `inkoopDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_date` int(10) unsigned DEFAULT NULL,
  `userID` int(10) unsigned NOT NULL DEFAULT '0',
  `leverancierID` int(10) unsigned NOT NULL DEFAULT '0',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `inkoopStatus` enum('TEMP','CREATED','ORDERED','INSTOCK','CANCELLED','AWAITING_RESPONSE') NOT NULL DEFAULT 'TEMP',
  `blnTemporary` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `blnOrdered` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `blnVoorraad` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `strRemark` varchar(255) NOT NULL DEFAULT '',
  `strRemarkAfter` varchar(255) NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `supplier_order_nr` varchar(150) NOT NULL DEFAULT '',
  `client_order_nr` varchar(100) NOT NULL DEFAULT '',
  `order_confirmation_date` int(11) unsigned DEFAULT NULL,
  `delivery_confirmation_date` int(11) unsigned DEFAULT NULL,
  `po_price_hidden` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`inkoopID`),
  KEY `leverancierID` (`leverancierID`),
  KEY `leverancierIdInkoopStatus` (`leverancierID`,`inkoopStatus`),
  KEY `userID` (`userID`),
  KEY `locationID` (`locationID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `tblinkoop`
--
DROP TRIGGER IF EXISTS `afterInsertTblinkoop`;
DELIMITER //
CREATE TRIGGER `afterInsertTblinkoop` AFTER INSERT ON `tblinkoop`
 FOR EACH ROW BEGIN CALL insertIproOcrPurchaseOrdersAfterInsertTblinkoop( NEW.inkoopId, NEW.inkoopnr, NEW.client_order_nr, NEW.supplier_order_nr ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateTblinkoop`;
DELIMITER //
CREATE TRIGGER `afterUpdateTblinkoop` AFTER UPDATE ON `tblinkoop`
 FOR EACH ROW BEGIN CALL updateIproOcrPurchaseOrdersAfterUpdateTblinkoop( NEW.inkoopId, NEW.inkoopnr, NEW.client_order_nr, NEW.supplier_order_nr ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblinkoopinhoud`
--

CREATE TABLE IF NOT EXISTS `tblinkoopinhoud` (
  `inhoudID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inkoopID` int(10) unsigned NOT NULL DEFAULT '0',
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `oldAantal` int(11) NOT NULL DEFAULT '0',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `dblPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblPriceOld` decimal(17,4) DEFAULT NULL,
  `dblGroupPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblGroupPriceOld` decimal(17,4) DEFAULT NULL,
  `dblAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblGroupAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `blnVoorraad` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `dblBHPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblBHGroupPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblBHAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblBHGroupAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `blnBHCheck` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `uom_id` int(11) NOT NULL DEFAULT '1',
  `vat` decimal(7,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`inhoudID`),
  KEY `inkoopID` (`inkoopID`),
  KEY `productID` (`productID`),
  KEY `blnVoorraad` (`blnVoorraad`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `tblinkoopinhoud`
--
DROP TRIGGER IF EXISTS `tblinkoopinhoudAfterInsertTrigger`;
DELIMITER //
CREATE TRIGGER `tblinkoopinhoudAfterInsertTrigger` AFTER INSERT ON `tblinkoopinhoud`
 FOR EACH ROW BEGIN  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tblinkoopinhoudAfterUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `tblinkoopinhoudAfterUpdateTrigger` AFTER UPDATE ON `tblinkoopinhoud`
 FOR EACH ROW BEGIN  END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblinternal_products`
--

CREATE TABLE IF NOT EXISTS `tblinternal_products` (
  `internal_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_product_code` char(100) NOT NULL DEFAULT '0',
  `internal_product_name` char(255) NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` enum('USUABLE','HIDDEN') NOT NULL DEFAULT 'USUABLE',
  `valutaID` char(3) NOT NULL DEFAULT 'EUR',
  PRIMARY KEY (`internal_product_id`),
  KEY `internal_product_code` (`internal_product_code`(20))
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `tblinternal_products`
--
DROP TRIGGER IF EXISTS `insertCleanedTblInternalProducts`;
DELIMITER //
CREATE TRIGGER `insertCleanedTblInternalProducts` AFTER INSERT ON `tblinternal_products`
 FOR EACH ROW BEGIN INSERT INTO tblinternal_products_ss (internal_product_id, cleaned_searchable_text) VALUES (NEW.internal_product_id, tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.internal_product_code, NEW.internal_product_name))); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `updateCleanedTblInternalProducts`;
DELIMITER //
CREATE TRIGGER `updateCleanedTblInternalProducts` AFTER UPDATE ON `tblinternal_products`
 FOR EACH ROW BEGIN UPDATE tblinternal_products_ss SET cleaned_searchable_text = tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.internal_product_code, NEW.internal_product_name)) WHERE internal_product_id = NEW.internal_product_id; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblinternal_products_ss`
--

CREATE TABLE IF NOT EXISTS `tblinternal_products_ss` (
  `internal_product_id` int(10) unsigned NOT NULL,
  `cleaned_searchable_text` text,
  PRIMARY KEY (`internal_product_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `tblleverancier`
--

CREATE TABLE IF NOT EXISTS `tblleverancier` (
  `leverancierID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leveranciernr` varchar(10) NOT NULL DEFAULT '0',
  `valutaID` char(3) NOT NULL DEFAULT 'EUR',
  `companyName` varchar(50) NOT NULL DEFAULT '',
  `adres` varchar(50) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `plaats` varchar(50) NOT NULL DEFAULT '',
  `land` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(255) DEFAULT NULL,
  `contactName` varchar(50) NOT NULL DEFAULT '',
  `strCountry` char(2) NOT NULL DEFAULT '',
  `klantNR` varchar(50) NOT NULL DEFAULT '',
  `strRemark` varchar(255) NOT NULL DEFAULT '',
  `intCatalogType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `txtCatalogLink` varchar(255) NOT NULL DEFAULT '',
  `ssTxtCatalogLink` varchar(255) DEFAULT NULL,
  `txtLinkDisplay` varchar(50) NOT NULL DEFAULT '',
  `intOrderingType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `txtOrderingMail` varchar(255) NOT NULL DEFAULT '',
  `txtOrderingLink` varchar(255) NOT NULL DEFAULT '',
  `OrderingSoldTo` varchar(35) NOT NULL DEFAULT '',
  `txtPostingLogin` varchar(25) NOT NULL DEFAULT '',
  `txtPostingPass` varchar(25) NOT NULL DEFAULT '',
  `status` enum('USUABLE','VIEWABLE','HIDDEN','TO_APPROVE') NOT NULL DEFAULT 'USUABLE',
  `betalingsconditie` int(11) NOT NULL DEFAULT '0',
  `bankrekening` varchar(15) NOT NULL DEFAULT '',
  `bank_country_code` char(2) DEFAULT NULL,
  `bank_bic` varchar(255) DEFAULT NULL,
  `bank_iban` varchar(255) DEFAULT NULL,
  `chamber_of_commerce_number` varchar(30) DEFAULT NULL,
  `vat_number` varchar(30) DEFAULT NULL,
  `sponsored` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ordering_format` int(11) NOT NULL DEFAULT '0',
  `ordering_transport` int(11) NOT NULL DEFAULT '0',
  `ordering_rule` enum('APPROVER','PURCHASER','FIXED_APPROVER','FIXED_PURCHASER') NOT NULL DEFAULT 'APPROVER',
  `ordering_schedule_enabled` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `ordering_minimal_amount` decimal(12,4) DEFAULT '0.0000',
  `ordering_delivery_date_addition` tinyint(4) DEFAULT '0',
  `order_confirmation_required` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `link_id` int(11) unsigned NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `invoice_supplier_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sub_category_id` int(10) NOT NULL,
  `supplier_attribute` enum('ONETIME') DEFAULT NULL,
  `external_id` varchar(35) DEFAULT NULL,
  `incoming_goods_hrs` int(11) NOT NULL,
  `edit_by` int(11) unsigned NOT NULL,
  `edit_date` int(11) unsigned NOT NULL,
  `invoicescan_id` int(11) unsigned DEFAULT NULL,
  `stop_payment` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `use_g_account` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `g_bank_account` varchar(15) DEFAULT '',
  `g_bank_country_code` char(2) DEFAULT NULL,
  `g_bank_bic` varchar(255) DEFAULT NULL,
  `g_bank_iban` varchar(255) DEFAULT NULL,
  `g_bank_account_percentage` tinyint(3) unsigned DEFAULT NULL,
  `purchaser_on_packing_slip` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `po_required` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `po_price_hidden_default` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `supplier_order_number_required` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_allowed` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_enabled` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_alternative_url` varchar(255) NOT NULL DEFAULT '',
  `ext_oci_validation_allowed` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_validation_enabled` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_validation_alternative_url` varchar(255) NOT NULL DEFAULT '',
  `ext_oci_timeout` tinyint(3) unsigned DEFAULT '30',
  `invoicesharing_status` enum('UNKNOWN','QUEUED','INVITATION_SENT','INVITATION_ACCEPTED','ACTIVATED') DEFAULT 'UNKNOWN',
  `max_exceedance_portion_percentage` int(10) unsigned DEFAULT NULL,
  `group_orders_for_po` enum('TRUE','FALSE','SETTING') NOT NULL DEFAULT 'SETTING',
  `fsp_supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `coupling_id` int(10) unsigned DEFAULT NULL,
  `automatic_receipt_incoming_goods` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `receive_goods_after_number_of_hours` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`leverancierID`),
  KEY `idx_supplierNumber` (`leveranciernr`),
  KEY `idx_status` (`status`),
  KEY `idx_enablePoProcessingAndHours` (`automatic_receipt_incoming_goods`,`receive_goods_after_number_of_hours`)
) ENGINE=InnoDB   AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblleverancier`
--

INSERT INTO `tblleverancier` (`leverancierID`, `leveranciernr`, `valutaID`, `companyName`, `adres`, `postcode`, `plaats`, `land`, `tel`, `fax`, `mobile`, `email`, `website`, `contactName`, `strCountry`, `klantNR`, `strRemark`, `intCatalogType`, `txtCatalogLink`, `ssTxtCatalogLink`, `txtLinkDisplay`, `intOrderingType`, `txtOrderingMail`, `txtOrderingLink`, `OrderingSoldTo`, `txtPostingLogin`, `txtPostingPass`, `status`, `betalingsconditie`, `bankrekening`, `bank_country_code`, `bank_bic`, `bank_iban`, `chamber_of_commerce_number`, `vat_number`, `sponsored`, `ordering_format`, `ordering_transport`, `ordering_rule`, `ordering_schedule_enabled`, `ordering_minimal_amount`, `ordering_delivery_date_addition`, `order_confirmation_required`, `link_id`, `priority`, `invoice_supplier_id`, `sub_category_id`, `supplier_attribute`, `external_id`, `incoming_goods_hrs`, `edit_by`, `edit_date`, `invoicescan_id`, `stop_payment`, `use_g_account`, `g_bank_account`, `g_bank_country_code`, `g_bank_bic`, `g_bank_iban`, `g_bank_account_percentage`, `purchaser_on_packing_slip`, `po_required`, `po_price_hidden_default`, `supplier_order_number_required`, `ext_oci_search_allowed`, `ext_oci_search_enabled`, `ext_oci_search_alternative_url`, `ext_oci_validation_allowed`, `ext_oci_validation_enabled`, `ext_oci_validation_alternative_url`, `ext_oci_timeout`, `invoicesharing_status`, `max_exceedance_portion_percentage`, `group_orders_for_po`, `fsp_supplier_id`, `coupling_id`, `automatic_receipt_incoming_goods`, `receive_goods_after_number_of_hours`) VALUES
(1, '0', 'EUR', 'Cartridge World', 'Nieuw Walden 56-64', '1394 PC', 'Nederhorst den Berg', 'NL', '0031 (0)294 - 78 71 23', '0031 (0)294 - 78 71 24', '', 'info@cartridgeworld.com', 'www.cartridgeworld.com', '', '', '761329', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'cartridgeworld@tblox.com', '', '', '', '', 'USUABLE', 30, '65.15.71.316', 'NL', '', 'NL87 INGB 0651 5713 16', '33267823', 'NL80 42 92 504 B01', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1510153985, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(2, '0', 'EUR', 'NV KAISER + KRAFT SA	', 'J. Emiel Mommaertslaan 20B', 'B-1831', 'Diegem', 'BE', '02-720.61.97', '02-720.00.16', '', 'info@kaiserkraft.com', 'www.kaiserkraft.com', 'Jack Rumpier', '', '0228722', '', 2, '', NULL, '', 0, 'kaiserkraft@tblox.com', '', '', '', '', 'USUABLE', 90, '437750320195', 'BE', 'KRED BE BB', 'BE 76 4377 5032 0195', '', 'BE 0414 348 960', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1510149993, NULL, 'FALSE', 'FALSE', '', 'BE', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(3, '1', 'EUR', 'TBlox test 3', 'Êêkõrsträât 1', '', 'Êêkõrsträât 1', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504881658, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL);

--
-- Triggers `tblleverancier`
--
DROP TRIGGER IF EXISTS `tblleverancierInsertTrigger`;
DELIMITER //
CREATE TRIGGER `tblleverancierInsertTrigger` AFTER INSERT ON `tblleverancier`
 FOR EACH ROW BEGIN CALL insertIproOcrSuppliersAfterInsertTblleverancier( NEW.leverancierID, NEW.companyName, NEW.adres, NEW.postcode, NEW.plaats, NEW.tel, NEW.fax, NEW.mobile, NEW.email, NEW.klantNR, NEW.bankrekening, NEW.bank_iban, NEW.bank_bic, NEW.chamber_of_commerce_number, NEW.vat_number, NEW.g_bank_account, NEW.g_bank_iban, NEW.g_bank_bic ); INSERT INTO tblleverancier_log ( leverancierID, leveranciernr, valutaID, companyName, adres, postcode, plaats, land, tel, fax, mobile, email, contactName, strCountry, klantNR, strRemark, intCatalogType, txtCatalogLink, ssTxtCatalogLink, txtLinkDisplay, intOrderingType, txtOrderingMail, txtOrderingLink, OrderingSoldTo, txtPostingLogin, txtPostingPass, status, betalingsconditie, bankrekening, bank_country_code, bank_bic, bank_iban, chamber_of_commerce_number, vat_number, sponsored, ordering_format, ordering_transport, ordering_rule, ordering_schedule_enabled, ordering_minimal_amount, ordering_delivery_date_addition, order_confirmation_required, link_id, priority, invoice_supplier_id, sub_category_id, supplier_attribute, external_id, incoming_goods_hrs, edit_by, edit_date, invoicescan_id, stop_payment, use_g_account, g_bank_account, g_bank_country_code, g_bank_bic, g_bank_iban, g_bank_account_percentage, purchaser_on_packing_slip, po_required, website, ext_oci_validation_allowed, ext_oci_search_allowed, ext_oci_search_enabled, ext_oci_timeout, supplier_order_number_required, invoicesharing_status, max_exceedance_portion_percentage, ext_oci_search_alternative_url, ext_oci_validation_alternative_url, ext_oci_validation_enabled, group_orders_for_po, fsp_supplier_id, coupling_id, automatic_receipt_incoming_goods, receive_goods_after_number_of_hours ) VALUES ( NEW.leverancierID, NEW.leveranciernr, NEW.valutaID, NEW.companyName, NEW.adres, NEW.postcode, NEW.plaats, NEW.land, NEW.tel, NEW.fax, NEW.mobile, NEW.email, NEW.contactName, NEW.strCountry, NEW.klantNR, NEW.strRemark, NEW.intCatalogType, NEW.txtCatalogLink, NEW.ssTxtCatalogLink, NEW.txtLinkDisplay, NEW.intOrderingType, NEW.txtOrderingMail, NEW.txtOrderingLink, NEW.OrderingSoldTo, NEW.txtPostingLogin, NEW.txtPostingPass, NEW.status, NEW.betalingsconditie, NEW.bankrekening, NEW.bank_country_code, NEW.bank_bic, NEW.bank_iban, NEW.chamber_of_commerce_number, NEW.vat_number, NEW.sponsored, NEW.ordering_format, NEW.ordering_transport, NEW.ordering_rule, NEW.ordering_schedule_enabled, NEW.ordering_minimal_amount, NEW.ordering_delivery_date_addition, NEW.order_confirmation_required, NEW.link_id, NEW.priority, NEW.invoice_supplier_id, NEW.sub_category_id, NEW.supplier_attribute, NEW.external_id, NEW.incoming_goods_hrs, NEW.edit_by, NEW.edit_date, NEW.invoicescan_id, NEW.stop_payment, NEW.use_g_account, NEW.g_bank_account, NEW.g_bank_country_code, NEW.g_bank_bic, NEW.g_bank_iban, NEW.g_bank_account_percentage, NEW.purchaser_on_packing_slip, NEW.po_required, NEW.website, NEW.ext_oci_validation_allowed, NEW.ext_oci_search_allowed, NEW.ext_oci_search_enabled, NEW.ext_oci_timeout, NEW.supplier_order_number_required, NEW.invoicesharing_status, NEW.max_exceedance_portion_percentage, NEW.ext_oci_search_alternative_url, NEW.ext_oci_validation_alternative_url, NEW.ext_oci_validation_enabled, NEW.group_orders_for_po, NEW.fsp_supplier_id, NEW.coupling_id, NEW.automatic_receipt_incoming_goods, NEW.receive_goods_after_number_of_hours ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tblleverancierUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `tblleverancierUpdateTrigger` AFTER UPDATE ON `tblleverancier`
 FOR EACH ROW BEGIN CALL updateIproOcrSuppliersAfterUpdateTblleverancier( NEW.leverancierID, NEW.companyName, NEW.adres, NEW.postcode, NEW.plaats, NEW.tel, NEW.fax, NEW.mobile, NEW.email, NEW.klantNR, NEW.bankrekening, NEW.bank_iban, NEW.bank_bic, NEW.chamber_of_commerce_number, NEW.vat_number, NEW.g_bank_account, NEW.g_bank_iban, NEW.g_bank_bic ); IF NEW.leveranciernr != OLD.leveranciernr OR NEW.valutaID != OLD.valutaID OR NEW.companyName != OLD.companyName OR NEW.adres != OLD.adres OR NEW.postcode != OLD.postcode OR NEW.plaats != OLD.plaats OR NEW.land != OLD.land OR NEW.tel != OLD.tel OR NEW.fax != OLD.fax OR NEW.mobile != OLD.mobile OR NEW.email != OLD.email OR NEW.contactName != OLD.contactName OR NEW.strCountry != OLD.strCountry OR NEW.klantNR != OLD.klantNR OR NEW.strRemark != OLD.strRemark OR NEW.intCatalogType != OLD.intCatalogType OR NEW.txtCatalogLink != OLD.txtCatalogLink OR NEW.ssTxtCatalogLink != OLD.ssTxtCatalogLink OR NEW.txtLinkDisplay != OLD.txtLinkDisplay OR NEW.intOrderingType != OLD.intOrderingType OR NEW.txtOrderingMail != OLD.txtOrderingMail OR NEW.txtOrderingLink != OLD.txtOrderingLink OR NEW.OrderingSoldTo != OLD.OrderingSoldTo OR NEW.txtPostingLogin != OLD.txtPostingLogin OR NEW.txtPostingPass != OLD.txtPostingPass OR NEW.status != OLD.status OR NEW.betalingsconditie != OLD.betalingsconditie OR NEW.bankrekening != OLD.bankrekening OR NEW.bank_country_code != OLD.bank_country_code OR NEW.bank_bic != OLD.bank_bic OR NEW.bank_iban != OLD.bank_iban OR NEW.chamber_of_commerce_number != OLD.chamber_of_commerce_number OR NEW.vat_number != OLD.vat_number OR NEW.sponsored != OLD.sponsored OR NEW.ordering_format != OLD.ordering_format OR NEW.ordering_transport != OLD.ordering_transport OR NEW.ordering_rule != OLD.ordering_rule OR NEW.ordering_schedule_enabled != OLD.ordering_schedule_enabled OR NEW.ordering_minimal_amount != OLD.ordering_minimal_amount OR NEW.ordering_delivery_date_addition != OLD.ordering_delivery_date_addition OR NEW.order_confirmation_required != OLD.order_confirmation_required OR NEW.link_id != OLD.link_id OR NEW.priority != OLD.priority OR NEW.invoice_supplier_id != OLD.invoice_supplier_id OR NEW.sub_category_id != OLD.sub_category_id OR IFNULL(NEW.supplier_attribute, '') != IFNULL(OLD.supplier_attribute, '') OR NEW.external_id != OLD.external_id OR NEW.incoming_goods_hrs != OLD.incoming_goods_hrs OR NEW.invoicescan_id != OLD.invoicescan_id OR NEW.stop_payment != OLD.stop_payment OR NEW.use_g_account != OLD.use_g_account OR NEW.g_bank_account != OLD.g_bank_account OR NEW.g_bank_country_code != OLD.g_bank_country_code OR NEW.g_bank_bic != OLD.g_bank_bic OR NEW.g_bank_iban != OLD.g_bank_iban OR NEW.g_bank_account_percentage != OLD.g_bank_account_percentage OR NEW.purchaser_on_packing_slip != OLD.purchaser_on_packing_slip OR NEW.po_required != OLD.po_required OR NEW.website != OLD.website OR NEW.ext_oci_validation_allowed != OLD.ext_oci_validation_allowed OR NEW.ext_oci_search_allowed != OLD.ext_oci_search_allowed OR NEW.ext_oci_search_enabled != OLD.ext_oci_search_enabled OR NEW.ext_oci_timeout != OLD.ext_oci_timeout OR NEW.supplier_order_number_required != OLD.supplier_order_number_required OR NEW.invoicesharing_status != OLD.invoicesharing_status OR NEW.max_exceedance_portion_percentage != OLD.max_exceedance_portion_percentage OR NEW.ext_oci_search_alternative_url != OLD.ext_oci_search_alternative_url OR NEW.ext_oci_validation_alternative_url != OLD.ext_oci_validation_alternative_url OR NEW.ext_oci_validation_enabled != OLD.ext_oci_validation_enabled OR NEW.group_orders_for_po != OLD.group_orders_for_po OR NEW.fsp_supplier_id != OLD.fsp_supplier_id OR NEW.coupling_id != OLD.coupling_id OR NEW.automatic_receipt_incoming_goods != OLD.automatic_receipt_incoming_goods OR IFNULL(NEW.receive_goods_after_number_of_hours, '') != IFNULL(OLD.receive_goods_after_number_of_hours, '') THEN INSERT INTO tblleverancier_log ( leverancierID, leveranciernr, valutaID, companyName, adres, postcode, plaats, land, tel, fax, mobile, email, contactName, strCountry, klantNR, strRemark, intCatalogType, txtCatalogLink, ssTxtCatalogLink, txtLinkDisplay, intOrderingType, txtOrderingMail, txtOrderingLink, OrderingSoldTo, txtPostingLogin, txtPostingPass, status, betalingsconditie, bankrekening, bank_country_code, bank_bic, bank_iban, chamber_of_commerce_number, vat_number, sponsored, ordering_format, ordering_transport, ordering_rule, ordering_schedule_enabled, ordering_minimal_amount, ordering_delivery_date_addition, order_confirmation_required, link_id, priority, invoice_supplier_id, sub_category_id, supplier_attribute, external_id, incoming_goods_hrs, edit_by, edit_date, invoicescan_id, stop_payment, use_g_account, g_bank_account, g_bank_country_code, g_bank_bic, g_bank_iban, g_bank_account_percentage, purchaser_on_packing_slip, po_required, website, ext_oci_validation_allowed, ext_oci_search_allowed, ext_oci_search_enabled, ext_oci_timeout, supplier_order_number_required, invoicesharing_status, max_exceedance_portion_percentage, ext_oci_search_alternative_url, ext_oci_validation_alternative_url, ext_oci_validation_enabled, group_orders_for_po, fsp_supplier_id, coupling_id, automatic_receipt_incoming_goods, receive_goods_after_number_of_hours ) VALUES ( NEW.leverancierID, NEW.leveranciernr, NEW.valutaID, NEW.companyName, NEW.adres, NEW.postcode, NEW.plaats, NEW.land, NEW.tel, NEW.fax, NEW.mobile, NEW.email, NEW.contactName, NEW.strCountry, NEW.klantNR, NEW.strRemark, NEW.intCatalogType, NEW.txtCatalogLink, NEW.ssTxtCatalogLink, NEW.txtLinkDisplay, NEW.intOrderingType, NEW.txtOrderingMail, NEW.txtOrderingLink, NEW.OrderingSoldTo, NEW.txtPostingLogin, NEW.txtPostingPass, NEW.status, NEW.betalingsconditie, NEW.bankrekening, NEW.bank_country_code, NEW.bank_bic, NEW.bank_iban, NEW.chamber_of_commerce_number, NEW.vat_number, NEW.sponsored, NEW.ordering_format, NEW.ordering_transport, NEW.ordering_rule, NEW.ordering_schedule_enabled, NEW.ordering_minimal_amount, NEW.ordering_delivery_date_addition, NEW.order_confirmation_required, NEW.link_id, NEW.priority, NEW.invoice_supplier_id, NEW.sub_category_id, NEW.supplier_attribute, NEW.external_id, NEW.incoming_goods_hrs, NEW.edit_by, NEW.edit_date, NEW.invoicescan_id, NEW.stop_payment, NEW.use_g_account, NEW.g_bank_account, NEW.g_bank_country_code, NEW.g_bank_bic, NEW.g_bank_iban, NEW.g_bank_account_percentage, NEW.purchaser_on_packing_slip, NEW.po_required, NEW.website, NEW.ext_oci_validation_allowed, NEW.ext_oci_search_allowed, NEW.ext_oci_search_enabled, NEW.ext_oci_timeout, NEW.supplier_order_number_required, NEW.invoicesharing_status, NEW.max_exceedance_portion_percentage, NEW.ext_oci_search_alternative_url, NEW.ext_oci_validation_alternative_url, NEW.ext_oci_validation_enabled, NEW.group_orders_for_po, NEW.fsp_supplier_id, NEW.coupling_id, NEW.automatic_receipt_incoming_goods, NEW.receive_goods_after_number_of_hours ); END IF; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblleverancier_log`
--

CREATE TABLE IF NOT EXISTS `tblleverancier_log` (
  `tblleverancier_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leverancierID` int(11) unsigned NOT NULL,
  `leveranciernr` varchar(10) NOT NULL DEFAULT '0',
  `valutaID` char(3) NOT NULL DEFAULT 'EUR',
  `companyName` varchar(50) NOT NULL DEFAULT '',
  `adres` varchar(50) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `plaats` varchar(50) NOT NULL DEFAULT '',
  `land` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(255) DEFAULT NULL,
  `contactName` varchar(50) NOT NULL DEFAULT '',
  `strCountry` char(2) NOT NULL DEFAULT '',
  `klantNR` varchar(50) NOT NULL DEFAULT '',
  `strRemark` varchar(255) NOT NULL DEFAULT '',
  `intCatalogType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `txtCatalogLink` varchar(255) NOT NULL DEFAULT '',
  `ssTxtCatalogLink` varchar(255) DEFAULT NULL,
  `txtLinkDisplay` varchar(50) NOT NULL DEFAULT '',
  `intOrderingType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `txtOrderingMail` varchar(50) NOT NULL DEFAULT '',
  `txtOrderingLink` varchar(255) NOT NULL DEFAULT '',
  `OrderingSoldTo` varchar(35) NOT NULL DEFAULT '',
  `txtPostingLogin` varchar(25) NOT NULL DEFAULT '',
  `txtPostingPass` varchar(25) NOT NULL DEFAULT '',
  `status` enum('USUABLE','VIEWABLE','HIDDEN','TO_APPROVE') NOT NULL DEFAULT 'USUABLE',
  `betalingsconditie` int(11) NOT NULL DEFAULT '0',
  `bankrekening` varchar(15) NOT NULL DEFAULT '',
  `bank_country_code` char(2) DEFAULT NULL,
  `bank_bic` varchar(255) DEFAULT NULL,
  `bank_iban` varchar(255) DEFAULT NULL,
  `chamber_of_commerce_number` varchar(30) DEFAULT NULL,
  `vat_number` varchar(30) DEFAULT NULL,
  `sponsored` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ordering_format` int(11) NOT NULL DEFAULT '0',
  `ordering_transport` int(11) NOT NULL DEFAULT '0',
  `ordering_rule` enum('APPROVER','PURCHASER','FIXED_APPROVER','FIXED_PURCHASER') NOT NULL DEFAULT 'APPROVER',
  `ordering_schedule_enabled` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `ordering_minimal_amount` decimal(12,4) DEFAULT '0.0000',
  `ordering_delivery_date_addition` tinyint(4) DEFAULT '0',
  `order_confirmation_required` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `link_id` int(11) unsigned NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `invoice_supplier_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sub_category_id` int(11) NOT NULL,
  `supplier_attribute` enum('ONETIME') DEFAULT NULL,
  `external_id` varchar(35) DEFAULT NULL,
  `incoming_goods_hrs` int(11) NOT NULL DEFAULT '0',
  `edit_by` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(11) unsigned NOT NULL DEFAULT '0',
  `invoicescan_id` int(11) unsigned DEFAULT NULL,
  `stop_payment` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `use_g_account` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `g_bank_account` varchar(15) DEFAULT '',
  `g_bank_country_code` char(2) DEFAULT NULL,
  `g_bank_bic` varchar(255) DEFAULT NULL,
  `g_bank_iban` varchar(255) DEFAULT NULL,
  `g_bank_account_percentage` tinyint(3) unsigned DEFAULT NULL,
  `purchaser_on_packing_slip` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `po_required` enum('TRUE','FALSE') DEFAULT 'FALSE',
  `po_price_hidden_default` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `supplier_order_number_required` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_allowed` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_enabled` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_search_alternative_url` varchar(255) NOT NULL DEFAULT '',
  `ext_oci_validation_allowed` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_validation_enabled` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `ext_oci_validation_alternative_url` varchar(255) NOT NULL DEFAULT '',
  `ext_oci_timeout` tinyint(3) unsigned DEFAULT '30',
  `invoicesharing_status` enum('UNKNOWN','QUEUED','INVITATION_SENT','INVITATION_ACCEPTED','ACTIVATED') DEFAULT 'UNKNOWN',
  `max_exceedance_portion_percentage` int(10) unsigned DEFAULT NULL,
  `group_orders_for_po` enum('TRUE','FALSE','SETTING') NOT NULL DEFAULT 'SETTING',
  `fsp_supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `coupling_id` int(10) unsigned DEFAULT NULL,
  `automatic_receipt_incoming_goods` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `receive_goods_after_number_of_hours` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`tblleverancier_log_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tblleverancier_log`
--

INSERT INTO `tblleverancier_log` (`tblleverancier_log_id`, `leverancierID`, `leveranciernr`, `valutaID`, `companyName`, `adres`, `postcode`, `plaats`, `land`, `tel`, `fax`, `mobile`, `email`, `website`, `contactName`, `strCountry`, `klantNR`, `strRemark`, `intCatalogType`, `txtCatalogLink`, `ssTxtCatalogLink`, `txtLinkDisplay`, `intOrderingType`, `txtOrderingMail`, `txtOrderingLink`, `OrderingSoldTo`, `txtPostingLogin`, `txtPostingPass`, `status`, `betalingsconditie`, `bankrekening`, `bank_country_code`, `bank_bic`, `bank_iban`, `chamber_of_commerce_number`, `vat_number`, `sponsored`, `ordering_format`, `ordering_transport`, `ordering_rule`, `ordering_schedule_enabled`, `ordering_minimal_amount`, `ordering_delivery_date_addition`, `order_confirmation_required`, `link_id`, `priority`, `invoice_supplier_id`, `sub_category_id`, `supplier_attribute`, `external_id`, `incoming_goods_hrs`, `edit_by`, `edit_date`, `invoicescan_id`, `stop_payment`, `use_g_account`, `g_bank_account`, `g_bank_country_code`, `g_bank_bic`, `g_bank_iban`, `g_bank_account_percentage`, `purchaser_on_packing_slip`, `po_required`, `po_price_hidden_default`, `supplier_order_number_required`, `ext_oci_search_allowed`, `ext_oci_search_enabled`, `ext_oci_search_alternative_url`, `ext_oci_validation_allowed`, `ext_oci_validation_enabled`, `ext_oci_validation_alternative_url`, `ext_oci_timeout`, `invoicesharing_status`, `max_exceedance_portion_percentage`, `group_orders_for_po`, `fsp_supplier_id`, `coupling_id`, `automatic_receipt_incoming_goods`, `receive_goods_after_number_of_hours`) VALUES
(1, 1, '0', 'EUR', 'TBlox BV', 'Claude Debussylaan 46', '1082MD', 'Amsterdam', 'NL', '', '', '', 'ashwin.jharihar@tblox.com', NULL, '', '', '', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'ashwin.jharihar@tblox.com', '', '', '', '', 'USUABLE', 0, '', NULL, NULL, NULL, NULL, NULL, 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 0, 0, NULL, 'FALSE', 'FALSE', '', NULL, NULL, NULL, NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(2, 2, '0', 'EUR', 'TBlox BV 2', 'Claude Debussylaan 46', '1082MD', 'Amsterdam', 'NL', '', '', '', 'ashwin.jharihar@tblox.com', NULL, '', '', '', '', 2, '', NULL, '', 0, 'ashwin.jharihar@tblox.com', '', '', '', '', 'USUABLE', 0, '', NULL, NULL, NULL, NULL, NULL, 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 0, 0, NULL, 'FALSE', 'FALSE', '', NULL, NULL, NULL, NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(3, 3, '', 'EUR', 'TBlox test 3', '', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504532302, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(4, 3, '1', 'EUR', 'TBlox test 3', '', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504532302, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(5, 1, '0', 'EUR', 'Cartridge World', 'Claude Debussylaan 46', '1082MD', 'Amsterdam', 'NL', '0031 (0)294 - 78 71 23', '0031 (0)294 - 78 71 24', '', 'info@cartridgeworld.com', 'www.cartridgeworld.com', '761329', '', '', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'cartridgeworld@tblox.com', '', '', '', '', 'USUABLE', 30, '65.15.71.316', 'NL', '', 'NL87 INGB 0651 5713 16', '33267823', 'NL80 42 92 504 B01', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1504532494, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(6, 2, '0', 'EUR', 'NV KAISER + KRAFT SA	', 'J. Emiel Mommaertslaan 20B', 'B-1831', 'Diegem', 'BE', '02-720.61.97', '02-720.00.16', '', 'info@kaiserkraft.com', 'www.kaiserkraft.com', 'Jack Rumpier', '', '', '', 2, '', NULL, '', 0, 'kaiserkraft@tblox.com', '', '', '', '', 'USUABLE', 90, '43.77.50.32.01.', 'BE', 'KRED BE BB', 'BE 76 4377 5032 0195', '', 'BE 0414 348 960', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1504536451, NULL, 'FALSE', 'FALSE', '', 'BE', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(7, 2, '0', 'EUR', 'NV KAISER + KRAFT SA	', 'J. Emiel Mommaertslaan 20B', 'B-1831', 'Diegem', 'BE', '02-720.61.97', '02-720.00.16', '', 'info@kaiserkraft.com', 'www.kaiserkraft.com', 'Jack Rumpier', '', '0228722', '', 2, '', NULL, '', 0, 'kaiserkraft@tblox.com', '', '', '', '', 'USUABLE', 90, '43.77.50.32.01.', 'BE', 'KRED BE BB', 'BE 76 4377 5032 0195', '', 'BE 0414 348 960', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1504536734, NULL, 'FALSE', 'FALSE', '', 'BE', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(8, 1, '0', 'EUR', 'Cartridge World', 'Claude Debussylaan 46', '1082MD', 'Amsterdam', 'NL', '0031 (0)294 - 78 71 23', '0031 (0)294 - 78 71 24', '', 'info@cartridgeworld.com', 'www.cartridgeworld.com', '761329', '', '761329', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'cartridgeworld@tblox.com', '', '', '', '', 'USUABLE', 30, '65.15.71.316', 'NL', '', 'NL87 INGB 0651 5713 16', '33267823', 'NL80 42 92 504 B01', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1504532494, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(9, 1, '0', 'EUR', 'Cartridge World', 'Claude Debussylaan 46', '1082MD', 'Amsterdam', 'NL', '0031 (0)294 - 78 71 23', '0031 (0)294 - 78 71 24', '', 'info@cartridgeworld.com', 'www.cartridgeworld.com', '', '', '761329', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'cartridgeworld@tblox.com', '', '', '', '', 'USUABLE', 30, '65.15.71.316', 'NL', '', 'NL87 INGB 0651 5713 16', '33267823', 'NL80 42 92 504 B01', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1504532494, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(10, 3, '1', 'EUR', 'TBlox test 3', 'ÃŠÃªkÃµrstrÃ¤Ã¢t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504861074, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(11, 3, '1', 'EUR', 'TBlox test 3', 'Êêkõrsträât 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504861074, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(12, 3, '1', 'EUR', 'TBlox test 3', '??k?rstr??t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504868987, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(13, 3, '1', 'EUR', 'TBlox test 3', 'ÃŠÃªkÃµrstrÃ¤Ã¢t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504869007, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(14, 3, '1', 'EUR', 'TBlox test 3', 'Êêkõrsträât 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504869007, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(15, 3, '1', 'EUR', 'TBlox test 3', '??k?rstr??t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504869258, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(16, 3, '1', 'EUR', 'TBlox test 3', 'ÃŠÃªkÃµrstrÃ¤Ã¢t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504869280, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(17, 3, '1', 'EUR', 'TBlox test 3', 'Â©Â®', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504871406, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(18, 3, '1', 'EUR', 'TBlox test 3', 'ÃŠÃªkÃµrstrÃ¤Ã¢t 1', '', '', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504873678, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(19, 3, '1', 'EUR', 'TBlox test 3', 'ÃŠÃªkÃµrstrÃ¤Ã¢t 1', '', 'Êêkõrsträât 1', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504873678, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(20, 3, '1', 'EUR', 'TBlox test 3', 'Êêkõrsträât 1', '', 'Êêkõrsträât 1', 'NL', '', '', '', '', '', '', '', '', '', 0, '', NULL, '', 0, 'test@teest.com', '', '', '', '', 'USUABLE', 0, '177870478', 'NL', 'ABNANL2A', 'NL62 ABNA 0177 8704 78', '', '', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 0, 1, 0, 0, NULL, NULL, 0, 2, 1504881658, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 0, NULL, 'FALSE', NULL),
(21, 2, '0', 'EUR', 'NV KAISER + KRAFT SA	', 'J. Emiel Mommaertslaan 20B', 'B-1831', 'Diegem', 'BE', '02-720.61.97', '02-720.00.16', '', 'info@kaiserkraft.com', 'www.kaiserkraft.com', 'Jack Rumpier', '', '0228722', '', 2, '', NULL, '', 0, 'kaiserkraft@tblox.com', '', '', '', '', 'USUABLE', 90, '437750320195', 'BE', 'KRED BE BB', 'BE 76 4377 5032 0195', '', 'BE 0414 348 960', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1510149993, NULL, 'FALSE', 'FALSE', '', 'BE', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL),
(22, 1, '0', 'EUR', 'Cartridge World', 'Nieuw Walden 56-64', '1394 PC', 'Nederhorst den Berg', 'NL', '0031 (0)294 - 78 71 23', '0031 (0)294 - 78 71 24', '', 'info@cartridgeworld.com', 'www.cartridgeworld.com', '', '', '761329', '', 2, 'https://asia.tblox.com/sales_new/_689ntn/?login=supplier1&password=f18de7749e1b1213baea56bffaab83e7', NULL, '', 0, 'cartridgeworld@tblox.com', '', '', '', '', 'USUABLE', 30, '65.15.71.316', 'NL', '', 'NL87 INGB 0651 5713 16', '33267823', 'NL80 42 92 504 B01', 'FALSE', 3, 1, 'APPROVER', 'FALSE', 0.0000, 0, 'FALSE', 3, 1, 0, 1, NULL, NULL, 0, 2, 1510153985, NULL, 'FALSE', 'FALSE', '', 'NL', '', '', NULL, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '', 'FALSE', 'FALSE', '', 30, 'UNKNOWN', NULL, 'SETTING', 1, 3, 'FALSE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbllists`
--

CREATE TABLE IF NOT EXISTS `tbllists` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `listname` char(60) NOT NULL DEFAULT '',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `product_type` enum('normal','internal') NOT NULL DEFAULT 'normal',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `mutation_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbllist_contents`
--

CREATE TABLE IF NOT EXISTS `tbllist_contents` (
  `list_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sort_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_content_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbllist_shares`
--

CREATE TABLE IF NOT EXISTS `tbllist_shares` (
  `list_share_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL DEFAULT '0',
  `share_type` enum('user','kpl','all') NOT NULL DEFAULT 'all',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `editable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_share_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbllocation`
--

CREATE TABLE IF NOT EXISTS `tbllocation` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `locationNameInt` varchar(90) NOT NULL DEFAULT '',
  `locationNameExt` varchar(90) NOT NULL DEFAULT '',
  `location_code` varchar(100) DEFAULT NULL,
  `department` char(50) NOT NULL DEFAULT '',
  `location_barcode` varchar(100) DEFAULT NULL,
  `address` char(50) NOT NULL DEFAULT '',
  `zip` char(10) NOT NULL DEFAULT '',
  `city` char(50) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT '',
  `bcc` char(100) DEFAULT NULL,
  `return_packing_slip_email` char(100) DEFAULT NULL,
  `tel` char(25) NOT NULL DEFAULT '',
  `fax` char(25) NOT NULL DEFAULT '',
  `VATNR` char(30) NOT NULL DEFAULT '',
  `purchaseHeadName` char(30) NOT NULL DEFAULT '',
  `emailPH` char(40) NOT NULL DEFAULT '',
  `telPH` char(20) NOT NULL DEFAULT '',
  `faxPH` char(20) NOT NULL DEFAULT '',
  `blnViewable` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `addBy` int(11) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `billingCompany` char(50) NOT NULL DEFAULT '',
  `billingDepartment` char(50) NOT NULL DEFAULT '',
  `editBy` int(11) NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `billingAddress` char(100) NOT NULL DEFAULT '',
  `billingZip` char(20) NOT NULL DEFAULT '',
  `billingCity` char(100) NOT NULL DEFAULT '',
  `billingCountry` char(2) NOT NULL DEFAULT '',
  `location_type` enum('DELIVERY','INVOICE','INTERNAL') NOT NULL DEFAULT 'DELIVERY',
  `ai_keyword` varchar(255) DEFAULT NULL,
  `default_invoice_location` int(11) NOT NULL DEFAULT '0',
  `default_user_id` int(11) NOT NULL DEFAULT '0',
  `default_project_id` int(11) NOT NULL DEFAULT '0',
  `default_kpl_id` int(11) NOT NULL DEFAULT '0',
  `location_attribute` enum('ONETIME') DEFAULT NULL,
  `supplier_remark_id` int(11) NOT NULL,
  `payment_condition_id` varchar(255) DEFAULT NULL,
  `location_group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`locationID`),
  KEY `payment_condition_id` (`payment_condition_id`(191))
) ENGINE=InnoDB   AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbllocation`
--

INSERT INTO `tbllocation` (`locationID`, `locationNameInt`, `locationNameExt`, `location_code`, `department`, `location_barcode`, `address`, `zip`, `city`, `country`, `bcc`, `return_packing_slip_email`, `tel`, `fax`, `VATNR`, `purchaseHeadName`, `emailPH`, `telPH`, `faxPH`, `blnViewable`, `addBy`, `addDate`, `billingCompany`, `billingDepartment`, `editBy`, `editDate`, `billingAddress`, `billingZip`, `billingCity`, `billingCountry`, `location_type`, `ai_keyword`, `default_invoice_location`, `default_user_id`, `default_project_id`, `default_kpl_id`, `location_attribute`, `supplier_remark_id`, `payment_condition_id`, `location_group`) VALUES
(1, 'Quantum Foam Solutions B.V.', 'Quantum Foam Solutions B.V.', NULL, 'Warehouse', '', 'Heermanskade 42a', '3031 AC', 'Rotterdam', 'NL', '', '', '010 - 14 25 870', '', 'NL 00 47 90 996 B15', '-', '-', '-', '', 'TRUE', 0, '0000-00-00 00:00:00', '', '', 2, '2017-09-04 15:36:58', '', '', '', '', 'DELIVERY', '', 0, 0, 0, 0, NULL, 0, NULL, NULL),
(2, 'Quantum Foam Solutions B.V.', 'Quantum Foam Solutions B.V.', NULL, 'Finance department', '', 'J. Wheelerlaan 8', '4581 GB', 'Moerdijk', 'NL', '', '', '047 - 15 32 007', '', 'NL004790996B15', '-', '-', '-', '-', 'TRUE', 0, '0000-00-00 00:00:00', '', '', 2, '2017-09-04 15:49:04', '', '', '', '', 'INVOICE', '', 0, 0, 0, 0, NULL, 0, NULL, NULL);

--
-- Triggers `tbllocation`
--
DROP TRIGGER IF EXISTS `afterInsertTbllocation`;
DELIMITER //
CREATE TRIGGER `afterInsertTbllocation` AFTER INSERT ON `tbllocation`
 FOR EACH ROW BEGIN CALL insertIproOcrLocationsAfterInsertTbllocation( NEW.locationId, NEW.location_type, NEW.locationNameExt, NEW.department, NEW.address, NEW.zip, NEW.city, NEW.VATNR ); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `afterUpdateTbllocation`;
DELIMITER //
CREATE TRIGGER `afterUpdateTbllocation` AFTER UPDATE ON `tbllocation`
 FOR EACH ROW BEGIN CALL updateIproOcrLocationsAfterUpdateTbllocation( NEW.locationId, NEW.location_type, NEW.locationNameExt, NEW.department, NEW.address, NEW.zip, NEW.city, NEW.VATNR ); END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbllocations_suppliers`
--

CREATE TABLE IF NOT EXISTS `tbllocations_suppliers` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `leverancierID` int(11) NOT NULL DEFAULT '0',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `extID` char(50) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblminvoorraad`
--

CREATE TABLE IF NOT EXISTS `tblminvoorraad` (
  `lngID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `orderAantal` int(11) NOT NULL DEFAULT '0',
  `addBy` int(11) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(11) NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location_type` enum('location','stock') NOT NULL DEFAULT 'location',
  `active` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`lngID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderinhoud`
--

CREATE TABLE IF NOT EXISTS `tblorderinhoud` (
  `inhoudID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderID` int(10) unsigned NOT NULL DEFAULT '0',
  `orderDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `order_internal_product_id` int(11) unsigned DEFAULT NULL,
  `dblPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblGroupPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `original_quantity` int(11) DEFAULT NULL,
  `intAantal_backup` int(11) DEFAULT NULL,
  `dblAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblGroupAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `inkoopID` int(11) NOT NULL DEFAULT '0',
  `blnPOstart` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `blnOrdered` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `blnVoorraad` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `strRemark` char(255) NOT NULL DEFAULT '',
  `strRemarkSupplier` char(255) NOT NULL DEFAULT '',
  `supplier_addition` varchar(50) DEFAULT NULL,
  `uom_id` int(11) NOT NULL DEFAULT '1',
  `subcategory_id` int(11) NOT NULL,
  `general_ledger` varchar(100) DEFAULT NULL,
  `vat` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `send_to_default` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`inhoudID`),
  KEY `inkoopID` (`inkoopID`),
  KEY `productID` (`productID`),
  KEY `orderID` (`orderID`),
  KEY `inkoopIdProductId` (`productID`,`inkoopID`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `ii_index` (`productID`,`inkoopID`) USING BTREE,
  KEY `order_internal_product_id` (`order_internal_product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `tblorderinhoud`
--
DROP TRIGGER IF EXISTS `tblorderinhoudBeforeInsert`;
DELIMITER //
CREATE TRIGGER `tblorderinhoudBeforeInsert` BEFORE INSERT ON `tblorderinhoud`
 FOR EACH ROW BEGIN SET NEW.original_quantity = NEW.intAantal; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE IF NOT EXISTS `tblorders` (
  `orderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordernr` varchar(12) NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT '0',
  `orderDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `supervisorID` int(11) NOT NULL DEFAULT '0',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `projectID` int(11) NOT NULL DEFAULT '0',
  `orderStatus` enum('TEMP','ORDERED','CHECKED','REJECTED') NOT NULL DEFAULT 'TEMP',
  `additional_status` enum('ASSIGNED','QUOTATION_REQUESTED','IN_NEGOTIATION','PROCESSED') DEFAULT NULL,
  `checkedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strReject` varchar(255) NOT NULL DEFAULT '',
  `strRemark` varchar(255) NOT NULL DEFAULT '',
  `supervisorUserID` int(11) NOT NULL DEFAULT '0',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `budget_period_scheme_child_id` int(11) unsigned DEFAULT NULL,
  `kpl_id` int(11) NOT NULL DEFAULT '0',
  `order_type` enum('normal','stock','internal','freetext') NOT NULL DEFAULT 'normal',
  `all_lines_in_pos` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `internal_location_id` int(11) NOT NULL DEFAULT '0',
  `parent_order_request_id` int(10) unsigned DEFAULT NULL,
  `supplier_order_nr` varchar(150) NOT NULL DEFAULT '',
  `client_order_nr` varchar(50) NOT NULL DEFAULT '',
  `order_remark` varchar(255) NOT NULL DEFAULT '',
  `concept` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`orderID`),
  KEY `order_type` (`order_type`),
  KEY `orderStatus` (`orderStatus`),
  KEY `locationID` (`locationID`),
  KEY `type_location` (`order_type`,`locationID`),
  KEY `status_type_content` (`orderStatus`,`order_type`,`all_lines_in_pos`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder_preferences`
--

CREATE TABLE IF NOT EXISTS `tblorder_preferences` (
  `order_id` int(11) NOT NULL,
  `preference` enum('HIGH_PRIORITY','STOCK_DIFF','INVESTMENT','CAP','RETROSPECTIVE','PRO_FORMA') NOT NULL,
  PRIMARY KEY (`order_id`,`preference`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `tblox_dimension_relationships`
--

CREATE TABLE IF NOT EXISTS `tblox_dimension_relationships` (
  `dimension_relationship_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blox_id` tinyint(2) unsigned NOT NULL,
  `lead_dimension_type` varchar(45) NOT NULL,
  `lead_dimension_id` int(11) unsigned NOT NULL,
  `follow_dimension_type` varchar(45) NOT NULL,
  `follow_dimension_id` int(11) unsigned NOT NULL,
  `added_by` int(11) unsigned NOT NULL,
  `added_date` int(11) NOT NULL,
  PRIMARY KEY (`dimension_relationship_id`),
  UNIQUE KEY `unique_fields` (`blox_id`,`lead_dimension_type`,`lead_dimension_id`,`follow_dimension_type`,`follow_dimension_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment_conditions`
--

CREATE TABLE IF NOT EXISTS `tblpayment_conditions` (
  `payment_condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_condition_code` varchar(255) DEFAULT NULL,
  `payment_condition_description` varchar(255) DEFAULT NULL,
  `payment_condition_days` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_condition_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE IF NOT EXISTS `tblproduct` (
  `productID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productCode` varchar(100) NOT NULL DEFAULT '',
  `productName` varchar(255) NOT NULL DEFAULT '',
  `leverancierID` int(10) unsigned NOT NULL DEFAULT '0',
  `subCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `grootboekID` varchar(100) NOT NULL DEFAULT '0',
  `packageunit` varchar(50) NOT NULL DEFAULT '0.0000',
  `valutaID` char(3) NOT NULL DEFAULT 'EUR',
  `dblPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dblDiscount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `productInfo` varchar(255) NOT NULL DEFAULT '',
  `unspscID` int(11) unsigned NOT NULL DEFAULT '0',
  `custProductCode` varchar(40) NOT NULL DEFAULT '',
  `cust_package_unit` varchar(50) NOT NULL DEFAULT '',
  `addBy` int(11) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `added_at` enum('manageProducts','fto','fto_inbox') DEFAULT NULL,
  `editBy` int(11) NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('USUABLE','HIDDEN') NOT NULL DEFAULT 'USUABLE',
  `priority` enum('NORMAL','HIGH','HIGHEST') NOT NULL DEFAULT 'NORMAL',
  `productline_unit` int(11) NOT NULL DEFAULT '1',
  `uom_id` int(11) NOT NULL DEFAULT '1',
  `internal_product_id` int(11) NOT NULL DEFAULT '0',
  `internal_preferred` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `product_url` varchar(255) NOT NULL DEFAULT '',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `supplier_product_url` varchar(255) DEFAULT NULL,
  `extended_info` text NOT NULL,
  `vat` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `cust_field1` varchar(10) DEFAULT NULL,
  `cust_field2` varchar(10) DEFAULT NULL,
  `cust_field3` varchar(10) DEFAULT NULL,
  `cust_field4` varchar(20) DEFAULT NULL,
  `cust_field5` varchar(50) DEFAULT NULL,
  `cust_field6` varchar(200) DEFAULT NULL,
  `product_type` enum('NORMAL','SERVICE') NOT NULL DEFAULT 'NORMAL',
  `avg_delivery` int(11) NOT NULL DEFAULT '0',
  `supplier_stock_quantity` int(11) DEFAULT NULL,
  `uom_type` enum('FIXED','EDITABLE') NOT NULL DEFAULT 'EDITABLE',
  `service_unit` int(11) NOT NULL DEFAULT '0',
  `track_and_trace` enum('true','false') NOT NULL DEFAULT 'false',
  `hosted_oci` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `lead_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `leverancierID` (`leverancierID`),
  KEY `unspscID` (`unspscID`),
  KEY `internal_product_id` (`internal_product_id`),
  KEY `productCode` (`productCode`(30))
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

--
-- Triggers `tblproduct`
--
DROP TRIGGER IF EXISTS `insertCleanedTblProduct`;
DELIMITER //
CREATE TRIGGER `insertCleanedTblProduct` AFTER INSERT ON `tblproduct`
 FOR EACH ROW BEGIN INSERT INTO tblproduct_ss (product_id, cleaned_searchable_text) VALUES (NEW.productID, tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.productName, NEW.productCode, NEW.productInfo, NEW.extended_info, NEW.custProductCode, NEW.cust_package_unit, NEW.cust_field1, NEW.cust_field2, NEW.cust_field3, NEW.cust_field4, NEW.cust_field5))); END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `updateCleanedTblProduct`;
DELIMITER //
CREATE TRIGGER `updateCleanedTblProduct` AFTER UPDATE ON `tblproduct`
 FOR EACH ROW BEGIN UPDATE tblproduct_ss SET cleaned_searchable_text = tblox_time_setup.TBLOX_REPLACE_NONWORD_V2(CONCAT_WS(' ', NEW.productName, NEW.productCode, NEW.productInfo, NEW.extended_info, NEW.custProductCode, NEW.cust_package_unit, NEW.cust_field1, NEW.cust_field2, NEW.cust_field3, NEW.cust_field4, NEW.cust_field5)) WHERE product_id = NEW.productID; END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct_ss`
--

CREATE TABLE IF NOT EXISTS `tblproduct_ss` (
  `product_id` int(10) unsigned NOT NULL,
  `cleaned_searchable_text` text,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct_stocklocation`
--

CREATE TABLE IF NOT EXISTS `tblproduct_stocklocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct_uom`
--

CREATE TABLE IF NOT EXISTS `tblproduct_uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_multiplier` int(11) NOT NULL DEFAULT '0',
  `base_unit` int(11) NOT NULL DEFAULT '0',
  `bestel_multiplier` int(11) NOT NULL DEFAULT '0',
  `bestel_unit` int(11) NOT NULL DEFAULT '0',
  `voorraad_multiplier` int(11) NOT NULL DEFAULT '0',
  `voorraad_unit` int(11) NOT NULL DEFAULT '0',
  `verbruik_multiplier` int(11) NOT NULL DEFAULT '0',
  `verbruik_unit` int(11) NOT NULL DEFAULT '0',
  `gem_waarde` int(11) NOT NULL DEFAULT '1',
  `gem_waarde_unit` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB   AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblproduct_uom`
--

INSERT INTO `tblproduct_uom` (`id`, `base_multiplier`, `base_unit`, `bestel_multiplier`, `bestel_unit`, `voorraad_multiplier`, `voorraad_unit`, `verbruik_multiplier`, `verbruik_unit`, `gem_waarde`, `gem_waarde_unit`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpurchase_actions`
--

CREATE TABLE IF NOT EXISTS `tblpurchase_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(20) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `action_type` char(20) NOT NULL DEFAULT '',
  `action_value` char(20) NOT NULL DEFAULT '',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `remark_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `added_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `current` (`current`),
  KEY `action_type` (`action_type`),
  KEY `type_id` (`type_id`,`type`,`current`,`action_type`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblrejorderinhoud`
--

CREATE TABLE IF NOT EXISTS `tblrejorderinhoud` (
  `inhoudID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderID` int(10) unsigned NOT NULL DEFAULT '0',
  `productID` int(10) unsigned NOT NULL DEFAULT '0',
  `dblPrice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `dblAmount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `inkoopID` int(10) unsigned NOT NULL DEFAULT '0',
  `blnPOstart` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `blnOrdered` enum('','TRUE','FALSE') NOT NULL DEFAULT '',
  `orderDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strRemark` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`inhoudID`),
  UNIQUE KEY `inhoudID` (`inhoudID`),
  KEY `inhoudID_2` (`inhoudID`),
  KEY `orderID` (`orderID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblsettings`
--

CREATE TABLE IF NOT EXISTS `tblsettings` (
  `settingID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `settingName` varchar(255) NOT NULL DEFAULT '',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`settingID`),
  KEY `text` (`text`(191))
) ENGINE=InnoDB   AUTO_INCREMENT=95 ;

--
-- Dumping data for table `tblsettings`
--

INSERT INTO `tblsettings` (`settingID`, `settingName`, `value`, `text`) VALUES
(1, 'BTW0', 0, ''),
(2, 'BTWH', 21, ''),
(3, 'BTWL', 6, ''),
(4, 'addProductsOrderedByBarcodeScannerToShoppingBasket', 0, 'false'),
(5, 'advancedShoppingBasket', 0, 'true'),
(6, 'allowServiceProducts', 0, 'false'),
(7, 'allowedLocationTypes', 0, 'delivery|invoice'),
(8, 'allowedToRegisterFinalizedInvoices', 0, ''),
(9, 'allowed_order_types', 0, 'normal'),
(10, 'approvalType', 0, 'normal'),
(11, 'approveInvoicesWithWorkflow', 0, 'false'),
(12, 'approvePoWithWorkflow', 0, 'false'),
(13, 'assignedFtoMailer', 0, 'false'),
(14, 'autoCreatePoFromFto', 0, 'false'),
(15, 'autoCreatePoFromFtoWithUnknownSupplierLines', 0, 'false'),
(16, 'autoStartupSupplier', 0, ''),
(17, 'barcodeLabelSize', 0, 'default'),
(18, 'batchOverviewType', 0, 'batchZorg'),
(19, 'canChangePricesInAO', 0, 'false'),
(20, 'categoryViewType', 0, 'unspsc'),
(21, 'check_fixed_product_category', 0, 'false'),
(22, 'check_product_uom', 0, 'false'),
(23, 'contactDetailsOnPO', 0, 'default'),
(24, 'customFieldNumberForLeadTime', 0, '4'),
(25, 'dagboek', 0, 'TBX'),
(26, 'defaultDeliveryLocation', 0, ''),
(27, 'defaultInvoiceLocation', 0, ''),
(28, 'default_currency', 0, 'EUR'),
(29, 'default_order_type', 0, 'normal'),
(30, 'default_timezone', 0, 'CET'),
(31, 'deliveryDateDefault', 0, ''),
(32, 'disableAttachmentGEClients', 0, 'false'),
(33, 'displayProjectInformationOnPo', 0, 'false'),
(34, 'displayProjectLayer', 0, 'true'),
(35, 'export_module', 0, ''),
(36, 'fixDiscountsForInternalProducts', 0, 'TRUE'),
(37, 'fixed_product_category', 0, 'none'),
(38, 'freetext_supplier', 0, ''),
(39, 'groupPoByCostcenter', 0, 'false'),
(40, 'groupPoByProject', 0, 'false'),
(41, 'groupPoBySupplierOrderNumber', 0, 'false'),
(42, 'group_by_order_id', 1, ''),
(43, 'hideHotLists', 0, ''),
(44, 'hideLastViewProducts', 0, ''),
(45, 'includeInvoicesInBudgetChecksFromStatus', 0, 'AWAITING_APPROVAL'),
(46, 'includeStockTransactionsInBudgetChecks', 0, 'true'),
(47, 'invoiceAllowAssignSelf', 0, 'true'),
(48, 'invoiceAllowManagerEditPOInvoices', 0, 'false'),
(49, 'invoiceLineAllocationFromStatus', 0, 'PROCESSED'),
(50, 'invoicePriceMargin', 250, '2.5'),
(51, 'invoiceScanBatchWithoutScans', 1, ''),
(52, 'invoiceScanningAllowed', 0, 'false'),
(53, 'invoicesAwaitingApprovalMailer', 0, 'false'),
(54, 'invoicingAdditionalSettingsAllowed', 0, 'false'),
(55, 'invoicingRejectionReasonsMandatory', 0, ''),
(56, 'myAccountSettings', 0, 'name|function|email|login|password'),
(57, 'nextSalesInvoiceId', 2018000001, 'SINV'),
(58, 'nextShoppingCartId', 2018000001, 'SC'),
(59, 'nextaanpasID', 2018000001, 'AO'),
(60, 'nextinvoiceID', 2018000001, 'INV'),
(61, 'nextorderID', 2018000001, 'OR'),
(62, 'nextpurchaseID', 2018000001, 'PO'),
(63, 'onOffCheckProductAvailability', 1, ''),
(64, 'onOffInvestmentOrder', 0, ''),
(65, 'onOffUrgentOrder', 0, ''),
(66, 'oracleProductCategory', 0, 'BUYER'),
(67, 'orderLayoutOptions', 0, 'condition|correction'),
(68, 'orderingCostCenterName', 0, 'costcenter'),
(69, 'orderingDimensionRelations', 0, 'false'),
(70, 'orderingProjectName', 0, 'project'),
(71, 'pendingFtoMailer', 0, 'false'),
(72, 'product_category_version', 0, ''),
(73, 'projectEditableForStockOrdersInStep4', 0, 'false'),
(74, 'receiveServiceProductsManuallyInSeperateMenu', 0, 'true'),
(75, 'removeMatgroupInOciMessage', 0, 'false'),
(76, 'reviewInvoiceWhenNewProposalManager', 0, ''),
(77, 'scannerNumbersThatOrderDefaultOrderQuantityIfEnteredQuantityIs1', 0, ''),
(78, 'showCompleteAdvancedShoppingCartPopUp', 0, 'true'),
(79, 'showFullHotlistOnOnePage', 0, 'false'),
(80, 'showOrderRequestRemarkForManagerInStep4', 0, 'false'),
(81, 'showPurchaserNameOnPo', 0, 'false'),
(82, 'showVatInPurchase', 0, 'false'),
(83, 'sortProductsByProductCode', 0, 'false'),
(84, 'supplierWorkflow', 0, 'false'),
(85, 'transportOrderToExpense', 0, 'false'),
(86, 'useAdditionalDimensionsDuringOrdering', 0, 'false'),
(87, 'useInvoiceLocationCode', 0, 'false'),
(88, 'useLeadTimeInOciMessage', 0, 'false'),
(89, 'useMultiDimensionalBudgets', 0, 'false'),
(90, 'useUNSPSCCodeInOciMessage', 0, 'false'),
(91, 'vatOptions', 0, '21.00|6.00|0.00'),
(92, 'workflowNewFTOSupplier', 0, 'false'),
(93, 'workflowResubmitOrders', 0, 'false'),
(94, 'allowConceptOrders', 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tblstocklocations`
--

CREATE TABLE IF NOT EXISTS `tblstocklocations` (
  `stockID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) NOT NULL DEFAULT '0',
  `stocklocationName` char(50) NOT NULL DEFAULT '',
  `addBy` int(11) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` int(11) NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `default_user_id` int(11) NOT NULL DEFAULT '0',
  `default_project_id` int(11) NOT NULL DEFAULT '0',
  `default_kpl_id` int(11) NOT NULL DEFAULT '0',
  `barcode` char(50) NOT NULL DEFAULT '',
  `hidden` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  PRIMARY KEY (`stockID`),
  KEY `locationID` (`locationID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE IF NOT EXISTS `tblsubcategory` (
  `subCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subName` char(50) NOT NULL DEFAULT '',
  `headCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `grootboekID` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`subCategoryID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblsupervisor`
--

CREATE TABLE IF NOT EXISTS `tblsupervisor` (
  `supervisorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL DEFAULT '0',
  `dblAmount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`supervisorID`)
) ENGINE=InnoDB   AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblsupervisor`
--

INSERT INTO `tblsupervisor` (`supervisorID`, `userID`, `dblAmount`) VALUES
(1, 1, 1000000.0000);

-- --------------------------------------------------------

--
-- Table structure for table `tblunspsc_settings`
--

CREATE TABLE IF NOT EXISTS `tblunspsc_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_unspsc_id` int(11) NOT NULL DEFAULT '0',
  `till_unspsc_id` int(11) NOT NULL DEFAULT '0',
  `row_title` char(60) NOT NULL DEFAULT '',
  `accounting_id` int(11) NOT NULL DEFAULT '0',
  `accounting_name` char(60) NOT NULL DEFAULT '',
  `subcategory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbluom`
--

CREATE TABLE IF NOT EXISTS `tbluom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` char(30) NOT NULL DEFAULT '',
  `uom_symbol` char(10) NOT NULL DEFAULT '',
  `uom_type` enum('NORMAL','SERVICE') NOT NULL DEFAULT 'NORMAL',
  `uom_quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB   AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbluom`
--

INSERT INTO `tbluom` (`uom_id`, `uom_name`, `uom_symbol`, `uom_type`, `uom_quantity`) VALUES
(1, 'PCE', 'PCE', 'NORMAL', 0),
(2, 'PCE', 'PCE', 'SERVICE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblvaluta`
--

CREATE TABLE IF NOT EXISTS `tblvaluta` (
  `lngID` int(11) NOT NULL AUTO_INCREMENT,
  `valutaID` char(3) NOT NULL DEFAULT '',
  `valutaSign` char(10) NOT NULL DEFAULT '',
  `yearID` int(4) unsigned NOT NULL DEFAULT '0',
  `monthID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`lngID`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblviews`
--

CREATE TABLE IF NOT EXISTS `tblviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  `type` enum('internalpicklist','warehouseorder') NOT NULL DEFAULT 'internalpicklist',
  `status` enum('OPEN','PROCESSED') NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`id`),
  KEY `creation_date` (`creation_date`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblview_details`
--

CREATE TABLE IF NOT EXISTS `tblview_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('orderinhoud','stock') NOT NULL DEFAULT 'orderinhoud',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `internal_quantity_modified` enum('TRUE','FALSE') DEFAULT 'FALSE',
  PRIMARY KEY (`id`),
  KEY `view_id` (`view_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblvoorraad`
--

CREATE TABLE IF NOT EXISTS `tblvoorraad` (
  `voorraadID` int(11) NOT NULL AUTO_INCREMENT,
  `voorraadType` enum('in','out','begin','plus','min') NOT NULL DEFAULT 'in',
  `locationID` int(11) NOT NULL DEFAULT '0',
  `stockID` int(11) NOT NULL DEFAULT '0',
  `inkoopID` int(11) NOT NULL DEFAULT '0',
  `inkoopinhoudID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  `orderinhoudID` int(11) NOT NULL DEFAULT '0',
  `projectID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `productID` int(10) NOT NULL DEFAULT '0',
  `intAantal` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strRemark` char(255) NOT NULL DEFAULT '',
  `lotnr_sup` char(30) NOT NULL DEFAULT '',
  `expiry_date` date DEFAULT NULL,
  `transfer_remark` char(100) NOT NULL DEFAULT '',
  `addBy` int(11) NOT NULL DEFAULT '0',
  `addDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `from_projectID` int(11) NOT NULL DEFAULT '0',
  `uom_id` int(11) NOT NULL DEFAULT '1',
  `aanpasinhoud_id` int(10) unsigned NOT NULL DEFAULT '0',
  `internalinhoud_id` int(11) NOT NULL DEFAULT '0',
  `internal_location_id` int(11) NOT NULL DEFAULT '0',
  `skip_export` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `portion_quantity` int(11) NOT NULL,
  `internal_transfer` enum('TRUE','FALSE') DEFAULT 'FALSE',
  PRIMARY KEY (`voorraadID`),
  KEY `locationID` (`locationID`),
  KEY `productID` (`productID`),
  KEY `inkoopID` (`inkoopID`),
  KEY `orderinhoudID` (`orderinhoudID`),
  KEY `voorraadType` (`voorraadType`,`date`),
  KEY `voorraadType_2` (`voorraadType`),
  KEY `internalinhoud_id` (`internalinhoud_id`),
  KEY `typeInkoopId` (`voorraadType`,`inkoopID`) USING BTREE,
  KEY `inkoopinhoudVoorraadType` (`inkoopinhoudID`,`voorraadType`,`intAantal`),
  KEY `uom_id` (`uom_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblxmlreport`
--

CREATE TABLE IF NOT EXISTS `tblxmlreport` (
  `idcode` int(11) NOT NULL AUTO_INCREMENT,
  `financeID` int(11) DEFAULT NULL,
  `poNumber` char(15) DEFAULT NULL,
  `invoiceID` int(11) DEFAULT NULL,
  `productID` char(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `report` char(250) DEFAULT NULL,
  `leverancierID` int(11) NOT NULL DEFAULT '0',
  `insertDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('NEW','OPEN','CLOSED') NOT NULL DEFAULT 'NEW',
  `editBy` int(11) NOT NULL DEFAULT '0',
  `editDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idcode`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_authentication`
--

CREATE TABLE IF NOT EXISTS `user_authentication` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `bloxID` tinyint(4) NOT NULL DEFAULT '0',
  `bitmask` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`,`bloxID`)
) ENGINE=InnoDB ;


-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE IF NOT EXISTS `years` (
  `yearID` int(10) unsigned NOT NULL DEFAULT '0',
  `blnActive` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`yearID`)
) ENGINE=InnoDB ;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`yearID`, `blnActive`) VALUES
(2017, 'TRUE');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genl_data`
--
ALTER TABLE `genl_data`
  ADD CONSTRAINT `genl_data_ibfk_1` FOREIGN KEY (`clear_id`) REFERENCES `genl_cleared_data` (`clear_id`);

--
-- Constraints for table `supo_settings`
--
ALTER TABLE `supo_settings`
  ADD CONSTRAINT `supo_settings_ibfk_1` FOREIGN KEY (`edited_by`) REFERENCES `users` (`userID`) ON UPDATE CASCADE;

--
-- Grant privileges
--
GRANT RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT, ALTER, CREATE ON *.* TO 'tbloxApps'@'%';

FLUSH PRIVILEGES;
