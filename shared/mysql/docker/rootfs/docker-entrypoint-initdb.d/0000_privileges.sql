CREATE USER 'tbloxApps'@'%' IDENTIFIED BY 'dev';
GRANT SELECT, INSERT, UPDATE, DELETE, LOCK TABLES ON `tblox_%`.* TO 'tbloxApps'@'%';

CREATE USER 'dbadmin'@'%' IDENTIFIED BY 'dev';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `tblox_%`.* TO 'dbadmin'@'%';
UPDATE mysql.user SET Super_Priv='Y' WHERE user='dbadmin' AND host='%'; /* Needed in MySQL 5.1 to create triggers, remove when upgrading to newer MySQL version */

FLUSH PRIVILEGES;