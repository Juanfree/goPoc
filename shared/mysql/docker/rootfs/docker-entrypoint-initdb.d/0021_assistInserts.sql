USE tblox_assist;

INSERT INTO `actions` (`action_id`, `action_name`, `action_description`, `blox_id`) VALUES
(1, 'Ticket Created', 'Ticket Created! Number: [[ticketId]]', 8),
(2, 'Ticket Reply', 'User replied on Ticket #[[ticketId]]', 8),
(5, 'Project Creation', 'Created project [[project_name]] (ID: [[project_id]])', 12),
(6, 'Project Modification', 'Modified project [[project_name]] (ID: [[project_id]])', 12),
(7, 'Project Deletion', 'Deleted project [[project_name]] (ID: [[project_id]])', 12),
(8, 'File Added', 'Added file ''[[fileName]]'' to project ''[[projectName]]''', 12),
(9, 'File Modification', 'Modified file ''[[fileName]]'' in project ''[[projectName]]''', 12),
(10, 'File Deletion', 'Deleted file ''[[fileName]]'' from project ''[[projectName]]''', 12),
(11, 'Event Added', 'Added event of type ''[[type]]'' on [[date]] at [[time]] for project ''[[projectName]]''', 12),
(12, 'Event Modification', 'Modified event of type ''[[type]]'' on [[date]] at [[time]] for project ''[[projectName]]''', 12),
(13, 'Event Deletion', 'Deleted event of type ''[[type]]'' on [[date]] at [[time]] for project ''[[projectName]]''', 12),
(14, 'Projectmember Added', 'Added [[userName]] to project ''[[projectName]]''', 12),
(15, 'Projectmember Modification', 'Modified member [[userName]] of project ''[[projectName]]''', 12),
(16, 'Projectmember Deletion', 'Deleted member [[userName]] from project ''[[projectName]]''', 12),
(17, 'News Added', 'Added news item ''[[newsTitle]]'' to project ''[[projectName]]''', 12),
(18, 'News Modification', 'Modified news item ''[[newsTitle]]'' for project ''[[projectName]]''', 12),
(19, 'News Deletion', 'Deleted news item ''[[newsTitle]]'' for project ''[[projectName]]''', 12),
(20, 'Archive a Project', 'Setting ''[[projectName]]'' as being archived', 12),
(21, 'Remove Archived Status from a Project', 'Lifting the archived status for project ''[[projectName]]''', 12),
(22, 'UserLogin', 'A user has succesfully logged in', 8),
(23, 'User logged in', 'User logged in! Resolution: [[resolution]] User-Agent: [[agent]]', 8),
(24, 'User Activity', 'User Activity log action', 8),
(25, 'expense_row', 'Expense Row Mutation', 6),
(26, 'Userrights', 'This action logs the changes on userrights in TBlox Cockpit', 8),
(27, 'Userrights changes', 'Changed [[oldRights]] to [[newRights]]', 8),
(28, 'Userrights changes', 'Changed [[oldRights]] to [[newRights]] on bloxid [[bloxId]] for user [[userId]]', 8),
(29, 'Dashboard Universal Login Check', 'User [[loggedIn]] logged in as [[newUser]]', 17),
(30, 'Userrights Changes', 'Changed from [[oldRights]] to [[newRights]] for module [[bloxId]] by [[byUserId]]', 8),
(36, 'Scanbatch reicevied on mail manager', 'System received Scanbatch [[batchId]] from mailmanager\r\n', 4),
(37, 'Scanbatch uploaded by user.', 'User [[userId]] uploaded scanbatch [[batchId]]', 4),
(38, 'Approved Scan in Step 2', 'User [[userId]] approved invoicescan [[invoiceScanId]] from supplier [[supplierId]] [[batchId]]', 4),
(39, 'Scanbatch Processed', 'User [[userId]] processed scanbatch [[batchId]]', 4),
(40, 'Automatically approved invoicescan for supplier', 'System approved invoicescan [[invoiceScanId]] from supplier [[supplierId]]\r\n', 4),
(41, 'Automatically invoice creation step 3', 'User [[userId]] changed setting [[settingName]] to [[status]] for supplier [[supplierId]], based on invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]\r\n', 4),
(42, 'Pages auto added to scan', 'System assigned invoicescanpage [[invoiceScanPageId]] to invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(43, 'Automatically invoice processing step 4', 'User [[userId]] changed setting [[settingName]] to [[status]] for supplier [[supplierId]], based on invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(44, 'Automatically recognize frontpages step 2', 'User [[userId]] changed setting [[settingName]] to [[status]] for supplier [[supplierId]], based on invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(45, 'Created invoice', 'User [[userId]] created Invoice [[invoiceId]] [[invoiceType]] [[debetCredit]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(46, 'System processed scanbatch', 'System processed Scanbatch [[batchId]]\r\n', 4),
(47, 'Automatically created invoiceScan', 'System recognized invoicescanpage [[invoiceScanPageId]] as first page, and created invoicescan [[invoiceScanId]] batch [[batchId]]\r\n', 4),
(48, 'User rejected invoicescanPage', 'User [[userId]] rejected invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(49, 'User rejected invoicescan', 'User [[userId]] rejected invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(50, 'Automatically scan composition', 'User [[userId]] marked supplier [[supplierId]] as trustable AIC supplier, based on invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]\r\n', 4),
(51, 'Non trustable AIC supplier', 'User [[userId]] marked supplier [[supplierId]] as non-trustable AIC supplier, based on invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(52, 'Added PO to invoicescan', 'User [[userId]] added purchase order [[poId]] to invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(53, 'Automatically added PO to invoicescan', 'System added purchase order [[poId]] to invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(54, 'Removed PO from invoicescan', 'User [[userId]] removed purchase order [[poId]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(55, 'Reverted invoicescan to step 2', 'User [[userId]] returned invoicescan [[invoiceScanId]] to invoicescan creation batch [[batchId]]\r\n', 4),
(56, 'Automatically invoice creation', 'System created Invoice [[invoiceId]] [[invoiceType]] [[debet_credit]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(57, 'User created InvoiceScan', 'User [[userId]] recognized invoicescanpage [[invoiceScanPageId]] as first page, and created invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(58, 'Changed Invoice Status', 'User [[userId]] changed Invoice [[invoiceId]] [[invoiceType]] [[debetCredit]] to status [[status]] batch [[batchId]]', 4),
(59, 'User assigned page', 'User [[userId]] assigned invoicescanpage [[invoiceScanPageId]] to invoicescan [[invoiceScanId]] batch [[batchId]]\r\n', 4),
(60, 'User deleted InvoiceScanPage', 'User [[userId]] deleted invoicescanpage [[invoiceScanPageId]] batch [[batchId]]', 4),
(61, 'Changed setting status', 'User [[userId]] changed setting [[settingName]] to [[status]] for supplier [[supplierId]]', 4),
(62, 'Changed Supplier Project', 'User [[userId]] changed default project to [[projectId]] for supplier [[supplierId]]\r\n ', 4),
(63, 'Automatic Invoice Processing', 'User [[userId]] marked supplier [[supplierId]] as trustable AIP supplier, based on invoice [[invoiceId]]', 4),
(64, 'Not Automatic Invoice Processing', 'User [[userId]] marked supplier [[supplierId]] as non-trustable AIP supplier, based on invoice [[invoiceId]]\r\n', 4),
(65, 'System Created Invoice', 'System changed Invoice [[invoiceId]] [[invoiceType]] [[debetCredit]] to status [[status]] batch [[batchId]]', 4),
(66, 'Changed Supplier Costcenter', 'User [[userId]] changed default costcenter to [[costcenterId]] for supplier [[supplierId]]', 4),
(67, 'Revert page from step 3 to step 2', 'User [[userId]] removed invoicescanpage [[invoiceScanPageId]] from invoicescan [[invoiceScanId]] batch [[batchId]]', 4),
(68, 'Changed Supplier ProductName', 'User [[userId]] changed default product name to [[productName]] for supplier [[supplierId]] ', 4),
(69, 'Changed Supplier Vat Percentage', 'User [[userId]] changed default vat percentage to [[vatPercentage]] for supplier [[supplierId]] ', 4),
(70, 'Changed Supplier subCategory', 'User [[userId]] changed default sub category to [[subCategoryId]] for supplier [[supplierId]] ', 4),
(71, 'Revert page from step 4 to step 3', 'User [[userId]] returned invoicescan [[invoiceScanId]] back to invoice creation batch [[batchId]]', 4),
(72, 'Changed Supplier Supervisor', 'User [[userId]] changed default supervisor to [[supervisorId]] for supplier [[supplierId]] ', 4),
(73, 'Slow Queries from Reporting', 'Filename: [[filename]] | Linenumber: [[line]] | Start time: [[startTime]] | End time: [[endTime]] ', 10),
(74, 'Role permission change', '[[permission]] permission [[operation]] in [[bloxId]] to role [[roleId]] for [[ownerBloxId]] [[transaction]] [[objectId]]', 8),
(75, 'User permission change', '[[permission]] permission [[operation]] in [[bloxId]] to user [[userId]] for [[ownerBloxId]] [[transaction]] [[objectId]]', 8),
(76, 'Role parent added', '[[roleId]] now inherits the rights and visibilities of [[inheritedRoleId]]', 8),
(77, 'Role parent removed', '[[roleId]] no longer inherits the rights and visibilities of [[inheritedRoleId]]', 8),
(78, 'User roles, rights and visibilities removed', 'All roles, rights and visibilities for [[userId]] have been removed', 8),
(79, 'User role assigned', 'Assigned role [[roleId]] to user [[userId]] for [[bloxId]]', 8),
(80, 'User role unassigned', 'Unassigned role [[roleId]] from user [[userId]] for [[bloxId]]', 8),
(81, 'User roles copied', 'Copied all role assignments for [[fromUserId]] to [[toUserId]]', 8),
(82, 'User permissions copied', 'Copied all rights and visibilities for [[fromUserId]] to [[toUserId]]', 8),
(83, 'User roles removed', 'Removed all role assignments for user [[userId]]', 8),
(84, 'User rights and visibilities removed', 'Removed all rights and visibilities for user [[userId]]', 8);