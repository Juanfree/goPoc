USE tblox_client_000001;

INSERT INTO `kpl` (`kplID`, `kplName`, `buID`, `checkID`, `kplCode`) VALUES (1, 'General', 0, 'TRUE', '');
INSERT INTO `projects` (`projectID`, `projectName`, `addBy`, `addDate`, `editBy`, `editDate`, `blnWbso`, `priority`, `description`, `beginDate`, `endDate`, `projectCode`, `scope`, `risks`, `status`, `archived`) VALUES (1, 'General', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 'FALSE', 3, '', 0, 0, '', '', '', 'active', '0');
INSERT INTO `subs` (`subID`, `subName`, `addBy`, `addDate`, `editBy`, `editDate`, `subCode`) VALUES (1, 'General', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '');
INSERT INTO `groups` (`groupID`, `groupName`, `addBy`, `addDate`, `editBy`, `editDate`, `groupCode`) VALUES (1, 'General', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '');
INSERT INTO `project_list` (`listID`, `projectID`, `subID`, `groupID`, `yearID`, `blnRemark`, `blnWritable`, `blnIllness`, `blnHoliday`, `addBy`, `addDate`, `editBy`, `editDate`, `blnPurchase`, `blnOvertimeAdd`, `blnOvertimeComp`, `blnOvertimeUse`, `blnAdvAdd`, `blnAdvComp`, `blnAdvUse`) VALUES (1, 1, 1, 1, 2018, 'TRUE', 'TRUE', 'FALSE', 'FALSE', 0, '2018-01-01 13:10:16', 0, '0000-00-00 00:00:00', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE');

INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (1,4,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (2,4,'visibilityRights','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (3,4,'internalProduct','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (4,4,'location','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (5,4,'product','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (6,4,'subcategory','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (7,4,'supplier','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (8,8,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (9,8,'costCenter','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (10,8,'project','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (11,8,'projectList','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (12,8,'group','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (13,8,'subGroup','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (14,8,'user','blox',NULL,'restriction');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (15,53,'generalRight','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (16,53,'invoiceOverviewRight','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (17,53,'settingsRight','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (18,53,'step1Right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (19,53,'step2Right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (20,53,'step3Right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (21,53,'step4Right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (22,53,'step5Right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (23,53,'approveInvoicesRight','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (24,9,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (25,18,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (26,21,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (27,36,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`)VALUES (28,38,'right','blox',NULL,'right');
INSERT INTO `rbac_transaction_cache` (`transaction_cache_id`, `blox_id`, `transaction`, `source`, `owner_blox_id`, `type`) VALUES (29,38,'account','blox',NULL,'restriction');

INSERT INTO `rbac_transaction_cache_names` (`transaction_cache_name_id`, `transaction_cache_id`, `language_id`, `name`, `description`) VALUES
	(1,1,1,'Right',NULL),
	(2,1,2,'Recht',NULL),
	(3,1,3,'Recht',NULL),
	(4,1,4,'Correct',NULL),
	(5,1,5,'Right',NULL),
	(6,1,6,'Right',NULL),
	(7,1,7,'Right',NULL),
	(8,1,8,'Right',NULL),
	(9,1,9,'Right',NULL),
	(10,1,10,'Right',NULL),
	(11,1,11,'Right',NULL),
	(12,2,1,'Visibility rights',NULL),
	(13,2,2,'Zichtbaarheden rechten',NULL),
	(14,2,3,'Sichtbarkeitsrechte',NULL),
	(15,2,4,'Droits de visibilité',NULL),
	(16,2,5,'Visibility rights',NULL),
	(17,2,6,'Visibility rights',NULL),
	(18,2,7,'Visibility rights',NULL),
	(19,2,8,'Visibility rights',NULL),
	(20,2,9,'Visibility rights',NULL),
	(21,2,10,'Visibility rights',NULL),
	(22,2,11,'Visibility rights',NULL),
	(23,3,1,'Internal products',NULL),
	(24,3,2,'Interne producten',NULL),
	(25,3,3,'Interne Produkte',NULL),
	(26,3,4,'Produits internes',NULL),
	(27,3,5,'Internal products',NULL),
	(28,3,6,'Internal products',NULL),
	(29,3,7,'Internal products',NULL),
	(30,3,8,'Internal products',NULL),
	(31,3,9,'Internal products',NULL),
	(32,3,10,'Internal products',NULL),
	(33,3,11,'Internal products',NULL),
	(34,4,1,'Locations',NULL),
	(35,4,2,'Locaties',NULL),
	(36,4,3,'Standorte',NULL),
	(37,4,4,'Lieux',NULL),
	(38,4,5,'Locations',NULL),
	(39,4,6,'Locations',NULL),
	(40,4,7,'Locations',NULL),
	(41,4,8,'Locations',NULL),
	(42,4,9,'Locations',NULL),
	(43,4,10,'Locations',NULL),
	(44,4,11,'Locations',NULL),
	(45,5,1,'Products',NULL),
	(46,5,2,'Producten',NULL),
	(47,5,3,'Produkte',NULL),
	(48,5,4,'Produits',NULL),
	(49,5,5,'Products',NULL),
	(50,5,6,'Products',NULL),
	(51,5,7,'Products',NULL),
	(52,5,8,'Products',NULL),
	(53,5,9,'Products',NULL),
	(54,5,10,'Products',NULL),
	(55,5,11,'Products',NULL),
	(56,6,1,'Subcategories',NULL),
	(57,6,2,'Subcategorieen',NULL),
	(58,6,3,'Unterkategorien',NULL),
	(59,6,4,'Sous-catégories',NULL),
	(60,6,5,'Subcategories',NULL),
	(61,6,6,'Subcategories',NULL),
	(62,6,7,'Subcategories',NULL),
	(63,6,8,'Subcategories',NULL),
	(64,6,9,'Subcategories',NULL),
	(65,6,10,'Subcategories',NULL),
	(66,6,11,'Subcategories',NULL),
	(67,7,1,'Suppliers',NULL),
	(68,7,2,'Leveranciers',NULL),
	(69,7,3,'Lieferanten',NULL),
	(70,7,4,'Fournisseurs',NULL),
	(71,7,5,'Suppliers',NULL),
	(72,7,6,'Suppliers',NULL),
	(73,7,7,'Suppliers',NULL),
	(74,7,8,'Suppliers',NULL),
	(75,7,9,'Suppliers',NULL),
	(76,7,10,'Suppliers',NULL),
	(77,7,11,'Suppliers',NULL),
	(78,8,1,'Rights',NULL),
	(79,8,2,'Rechten',NULL),
	(80,8,3,'Rechte',NULL),
	(81,8,4,'Rights',NULL),
	(82,8,5,'Rights',NULL),
	(83,8,6,'Rights',NULL),
	(84,8,7,'Rights',NULL),
	(85,8,8,'Rights',NULL),
	(86,8,9,'Rights',NULL),
	(87,8,10,'Rights',NULL),
	(88,8,11,'Rights',NULL),
	(89,9,1,'Cost centers',NULL),
	(90,9,2,'Kostenplaatsen',NULL),
	(91,9,3,'Kostenstelle',NULL),
	(92,9,4,'Cost centers',NULL),
	(93,9,5,'Cost centers',NULL),
	(94,9,6,'Cost centers',NULL),
	(95,9,7,'Cost centers',NULL),
	(96,9,8,'Cost centers',NULL),
	(97,9,9,'Cost centers',NULL),
	(98,9,10,'Cost centers',NULL),
	(99,9,11,'Cost centers',NULL),
	(100,10,1,'Projects',NULL),
	(101,10,2,'Projecten',NULL),
	(102,10,3,'Projekt',NULL),
	(103,10,4,'Projects',NULL),
	(104,10,5,'Projects',NULL),
	(105,10,6,'Projects',NULL),
	(106,10,7,'Projects',NULL),
	(107,10,8,'Projects',NULL),
	(108,10,9,'Projects',NULL),
	(109,10,10,'Projects',NULL),
	(110,10,11,'Projects',NULL),
	(111,11,1,'Project lists',NULL),
	(112,11,2,'Projectlijsten',NULL),
	(113,11,3,'Projektliste',NULL),
	(114,11,4,'Project lists',NULL),
	(115,11,5,'Project lists',NULL),
	(116,11,6,'Project lists',NULL),
	(117,11,7,'Project lists',NULL),
	(118,11,8,'Project lists',NULL),
	(119,11,9,'Project lists',NULL),
	(120,11,10,'Project lists',NULL),
	(121,11,11,'Project lists',NULL),
	(122,12,1,'Groups',NULL),
	(123,12,2,'Groepen',NULL),
	(124,12,3,'Gruppen',NULL),
	(125,12,4,'Groups',NULL),
	(126,12,5,'Groups',NULL),
	(127,12,6,'Groups',NULL),
	(128,12,7,'Groups',NULL),
	(129,12,8,'Groups',NULL),
	(130,12,9,'Groups',NULL),
	(131,12,10,'Groups',NULL),
	(132,12,11,'Groups',NULL),
	(133,13,1,'Subgroups',NULL),
	(134,13,2,'Subgroepen',NULL),
	(135,13,3,'Untergruppen',NULL),
	(136,13,4,'Subgroups',NULL),
	(137,13,5,'Subgroups',NULL),
	(138,13,6,'Subgroups',NULL),
	(139,13,7,'Subgroups',NULL),
	(140,13,8,'Subgroups',NULL),
	(141,13,9,'Subgroups',NULL),
	(142,13,10,'Subgroups',NULL),
	(143,13,11,'Subgroups',NULL),
	(144,14,1,'Users',NULL),
	(145,14,2,'Gebruikers',NULL),
	(146,14,3,'Benutzer',NULL),
	(147,14,4,'Utilisateurs',NULL),
	(148,14,5,'Usuarios',NULL),
	(149,14,6,'Brugere',NULL),
	(150,14,7,'Users',NULL),
	(151,14,8,'Users',NULL),
	(152,14,9,'Users',NULL),
	(153,14,10,'Users',NULL),
	(154,14,11,'Brugere',NULL),
	(155,15,1,'General',NULL),
	(156,15,2,'General',NULL),
	(157,15,3,'General',NULL),
	(158,15,4,'General',NULL),
	(159,15,5,'General',NULL),
	(160,15,6,'General',NULL),
	(161,15,7,'General',NULL),
	(162,15,8,'General',NULL),
	(163,15,9,'General',NULL),
	(164,15,10,'General',NULL),
	(165,15,11,'General',NULL),
	(166,16,1,'Invoice overview',NULL),
	(167,16,2,'Invoice overview',NULL),
	(168,16,3,'Invoice overview',NULL),
	(169,16,4,'Invoice overview',NULL),
	(170,16,5,'Invoice overview',NULL),
	(171,16,6,'Invoice overview',NULL),
	(172,16,7,'Invoice overview',NULL),
	(173,16,8,'Invoice overview',NULL),
	(174,16,9,'Invoice overview',NULL),
	(175,16,10,'Invoice overview',NULL),
	(176,16,11,'Invoice overview',NULL),
	(177,17,1,'Settings',NULL),
	(178,17,2,'Settings',NULL),
	(179,17,3,'Settings',NULL),
	(180,17,4,'Settings',NULL),
	(181,17,5,'Settings',NULL),
	(182,17,6,'Settings',NULL),
	(183,17,7,'Settings',NULL),
	(184,17,8,'Settings',NULL),
	(185,17,9,'Settings',NULL),
	(186,17,10,'Settings',NULL),
	(187,17,11,'Settings',NULL),
	(188,18,1,'Step 1',NULL),
	(189,18,2,'Step 1',NULL),
	(190,18,3,'Step 1',NULL),
	(191,18,4,'Step 1',NULL),
	(192,18,5,'Step 1',NULL),
	(193,18,6,'Step 1',NULL),
	(194,18,7,'Step 1',NULL),
	(195,18,8,'Step 1',NULL),
	(196,18,9,'Step 1',NULL),
	(197,18,10,'Step 1',NULL),
	(198,18,11,'Step 1',NULL),
	(199,19,1,'Step 2',NULL),
	(200,19,2,'Step 2',NULL),
	(201,19,3,'Step 2',NULL),
	(202,19,4,'Step 2',NULL),
	(203,19,5,'Step 2',NULL),
	(204,19,6,'Step 2',NULL),
	(205,19,7,'Step 2',NULL),
	(206,19,8,'Step 2',NULL),
	(207,19,9,'Step 2',NULL),
	(208,19,10,'Step 2',NULL),
	(209,19,11,'Step 2',NULL),
	(210,20,1,'Step 3',NULL),
	(211,20,2,'Step 3',NULL),
	(212,20,3,'Step 3',NULL),
	(213,20,4,'Step 3',NULL),
	(214,20,5,'Step 3',NULL),
	(215,20,6,'Step 3',NULL),
	(216,20,7,'Step 3',NULL),
	(217,20,8,'Step 3',NULL),
	(218,20,9,'Step 3',NULL),
	(219,20,10,'Step 3',NULL),
	(220,20,11,'Step 3',NULL),
	(221,21,1,'Step 4',NULL),
	(222,21,2,'Step 4',NULL),
	(223,21,3,'Step 4',NULL),
	(224,21,4,'Step 4',NULL),
	(225,21,5,'Step 4',NULL),
	(226,21,6,'Step 4',NULL),
	(227,21,7,'Step 4',NULL),
	(228,21,8,'Step 4',NULL),
	(229,21,9,'Step 4',NULL),
	(230,21,10,'Step 4',NULL),
	(231,21,11,'Step 4',NULL),
	(232,22,1,'Step 5',NULL),
	(233,22,2,'Step 5',NULL),
	(234,22,3,'Step 5',NULL),
	(235,22,4,'Step 5',NULL),
	(236,22,5,'Step 5',NULL),
	(237,22,6,'Step 5',NULL),
	(238,22,7,'Step 5',NULL),
	(239,22,8,'Step 5',NULL),
	(240,22,9,'Step 5',NULL),
	(241,22,10,'Step 5',NULL),
	(242,22,11,'Step 5',NULL),
	(243,23,1,'Approve invoices',NULL),
	(244,23,2,'Approve invoices',NULL),
	(245,23,3,'Approve invoices',NULL),
	(246,23,4,'Approve invoices',NULL),
	(247,23,5,'Approve invoices',NULL),
	(248,23,6,'Approve invoices',NULL),
	(249,23,7,'Approve invoices',NULL),
	(250,23,8,'Approve invoices',NULL),
	(251,23,9,'Approve invoices',NULL),
	(252,23,10,'Approve invoices',NULL),
	(253,23,11,'Approve invoices',NULL),
	(254,24,1,'Rights',NULL),
	(255,24,2,'Rechten',NULL),
	(256,24,3,'Rechte',NULL),
	(257,24,4,'Rights',NULL),
	(258,24,5,'Rights',NULL),
	(259,24,6,'Rights',NULL),
	(260,24,7,'Rights',NULL),
	(261,24,8,'Rights',NULL),
	(262,24,9,'Rights',NULL),
	(263,24,10,'Rights',NULL),
	(264,24,11,'Rights',NULL),
	(265,25,1,'Rights',NULL),
	(266,25,2,'Rechten',NULL),
	(267,25,3,'Rechte',NULL),
	(268,25,4,'Rights',NULL),
	(269,25,5,'Rights',NULL),
	(270,25,6,'Rights',NULL),
	(271,25,7,'Rights',NULL),
	(272,25,8,'Rights',NULL),
	(273,25,9,'Rights',NULL),
	(274,25,10,'Rights',NULL),
	(275,25,11,'Rights',NULL),
	(276,26,1,'Rights',NULL),
	(277,26,2,'Rechten',NULL),
	(278,26,3,'Rechte',NULL),
	(279,26,4,'Rights',NULL),
	(280,26,5,'Rights',NULL),
	(281,26,6,'Rights',NULL),
	(282,26,7,'Rights',NULL),
	(283,26,8,'Rights',NULL),
	(284,26,9,'Rights',NULL),
	(285,26,10,'Rights',NULL),
	(286,26,11,'Rights',NULL),
	(287,27,1,'Rights',NULL),
	(288,27,2,'Rechten',NULL),
	(289,27,3,'Rechte',NULL),
	(290,27,4,'Rights',NULL),
	(291,27,5,'Rights',NULL),
	(292,27,6,'Rights',NULL),
	(293,27,7,'Rights',NULL),
	(294,27,8,'Rights',NULL),
	(295,27,9,'Rights',NULL),
	(296,27,10,'Rights',NULL),
	(297,27,11,'Rights',NULL),
	(298,28,1,'Rights',NULL),
	(299,28,2,'Rechten',NULL),
	(300,28,3,'Rechte',NULL),
	(301,28,4,'Rights',NULL),
	(302,28,5,'Rights',NULL),
	(303,28,6,'Rights',NULL),
	(304,28,7,'Rights',NULL),
	(305,28,8,'Rights',NULL),
	(306,28,9,'Rights',NULL),
	(307,28,10,'Rights',NULL),
	(308,28,11,'Rights',NULL),
	(309,29,1,'General ledger accounts',NULL),
	(310,29,2,'Grootboekrekeningen',NULL),
	(311,29,3,'Hauptbuchkonto',NULL),
	(312,29,4,'General ledger accounts',NULL),
	(313,29,5,'General ledger accounts',NULL),
	(314,29,6,'General ledger accounts',NULL),
	(315,29,7,'General ledger accounts',NULL),
	(316,29,8,'General ledger accounts',NULL),
	(317,29,9,'General ledger accounts',NULL),
	(318,29,10,'General ledger accounts',NULL),
	(319,29,11,'General ledger accounts',NULL);

INSERT INTO `rbac_transaction_cache_operation_names` (`transaction_cache_operation_names_id`, `transaction_cache_operation_id`, `language_id`, `name`) VALUES
	(1,1,1,'Right'),
	(2,1,2,'Recht'),
	(3,1,3,'Recht'),
	(4,1,4,'Correct'),
	(5,1,5,'Right'),
	(6,1,6,'Right'),
	(7,1,7,'Right'),
	(8,1,8,'Right'),
	(9,1,9,'Right'),
	(10,1,10,'Right'),
	(11,1,11,'Right'),
	(12,2,1,'Order history'),
	(13,2,2,'Bestelgeschiedenis'),
	(14,2,3,'Auftragshistorie'),
	(15,2,4,'Histoire de commandes'),
	(16,2,5,'Order history'),
	(17,2,6,'Order history'),
	(18,2,7,'Order history'),
	(19,2,8,'Order history'),
	(20,2,9,'Order history'),
	(21,2,10,'Order history'),
	(22,2,11,'Order history'),
	(23,3,1,'Purchase order history'),
	(24,3,2,'Inkoopgeschiedenis'),
	(25,3,3,'Bestellhistorie'),
	(26,3,4,'Histoire de commandes d\'achat'),
	(27,3,5,'Purchase order history'),
	(28,3,6,'Purchase order history'),
	(29,3,7,'Purchase order history'),
	(30,3,8,'Purchase order history'),
	(31,3,9,'Purchase order history'),
	(32,3,10,'Purchase order history'),
	(33,3,11,'Purchase order history'),
	(34,4,1,'Invoice history'),
	(35,4,2,'Factuurgeschiedenis'),
	(36,4,3,'Rechnungshistorie'),
	(37,4,4,'Histoire de facture'),
	(38,4,5,'Invoice history'),
	(39,4,6,'Invoice history'),
	(40,4,7,'Invoice history'),
	(41,4,8,'Invoice history'),
	(42,4,9,'Invoice history'),
	(43,4,10,'Invoice history'),
	(44,4,11,'Invoice history'),
	(45,5,1,'Restriction'),
	(46,5,2,'Restrictie'),
	(47,5,3,'Beschränkungen'),
	(48,5,4,'Restriction'),
	(49,5,5,'Restriction'),
	(50,5,6,'Restriction'),
	(51,5,7,'Restriction'),
	(52,5,8,'Restriction'),
	(53,5,9,'Restriction'),
	(54,5,10,'Restriction'),
	(55,5,11,'Restriction'),
	(56,6,1,'Restriction'),
	(57,6,2,'Restrictie'),
	(58,6,3,'Beschränkungen'),
	(59,6,4,'Restriction'),
	(60,6,5,'Restriction'),
	(61,6,6,'Restriction'),
	(62,6,7,'Restriction'),
	(63,6,8,'Restriction'),
	(64,6,9,'Restriction'),
	(65,6,10,'Restriction'),
	(66,6,11,'Restriction'),
	(67,7,1,'Restriction'),
	(68,7,2,'Restrictie'),
	(69,7,3,'Beschränkungen'),
	(70,7,4,'Restriction'),
	(71,7,5,'Restriction'),
	(72,7,6,'Restriction'),
	(73,7,7,'Restriction'),
	(74,7,8,'Restriction'),
	(75,7,9,'Restriction'),
	(76,7,10,'Restriction'),
	(77,7,11,'Restriction'),
	(78,8,1,'Restriction'),
	(79,8,2,'Restrictie'),
	(80,8,3,'Beschränkungen'),
	(81,8,4,'Restriction'),
	(82,8,5,'Restriction'),
	(83,8,6,'Restriction'),
	(84,8,7,'Restriction'),
	(85,8,8,'Restriction'),
	(86,8,9,'Restriction'),
	(87,8,10,'Restriction'),
	(88,8,11,'Restriction'),
	(89,9,1,'Restriction'),
	(90,9,2,'Restrictie'),
	(91,9,3,'Beschränkungen'),
	(92,9,4,'Restriction'),
	(93,9,5,'Restriction'),
	(94,9,6,'Restriction'),
	(95,9,7,'Restriction'),
	(96,9,8,'Restriction'),
	(97,9,9,'Restriction'),
	(98,9,10,'Restriction'),
	(99,9,11,'Restriction'),
	(100,10,1,'Right'),
	(101,10,2,'Recht'),
	(102,10,3,'Rechts'),
	(103,10,4,'Right'),
	(104,10,5,'Right'),
	(105,10,6,'Right'),
	(106,10,7,'Right'),
	(107,10,8,'Right'),
	(108,10,9,'Right'),
	(109,10,10,'Right'),
	(110,10,11,'Right'),
	(111,11,1,'Use'),
	(112,11,2,'Gebruik'),
	(113,11,3,'Benutzen'),
	(114,11,4,'Use'),
	(115,11,5,'Use'),
	(116,11,6,'Use'),
	(117,11,7,'Use'),
	(118,11,8,'Use'),
	(119,11,9,'Use'),
	(120,11,10,'Use'),
	(121,11,11,'Use'),
	(122,12,1,'Use'),
	(123,12,2,'Gebruik'),
	(124,12,3,'Benutzen'),
	(125,12,4,'Use'),
	(126,12,5,'Use'),
	(127,12,6,'Use'),
	(128,12,7,'Use'),
	(129,12,8,'Use'),
	(130,12,9,'Use'),
	(131,12,10,'Use'),
	(132,12,11,'Use'),
	(133,13,1,'Use'),
	(134,13,2,'Gebruik'),
	(135,13,3,'Benutzen'),
	(136,13,4,'Use'),
	(137,13,5,'Use'),
	(138,13,6,'Use'),
	(139,13,7,'Use'),
	(140,13,8,'Use'),
	(141,13,9,'Use'),
	(142,13,10,'Use'),
	(143,13,11,'Use'),
	(144,14,1,'Use'),
	(145,14,2,'Gebruik'),
	(146,14,3,'Benutzen'),
	(147,14,4,'Use'),
	(148,14,5,'Use'),
	(149,14,6,'Use'),
	(150,14,7,'Use'),
	(151,14,8,'Use'),
	(152,14,9,'Use'),
	(153,14,10,'Use'),
	(154,14,11,'Use'),
	(155,15,1,'Use'),
	(156,15,2,'Gebruik'),
	(157,15,3,'Benutzen'),
	(158,15,4,'Use'),
	(159,15,5,'Use'),
	(160,15,6,'Use'),
	(161,15,7,'Use'),
	(162,15,8,'Use'),
	(163,15,9,'Use'),
	(164,15,10,'Use'),
	(165,15,11,'Use'),
	(166,16,1,'Use'),
	(167,16,2,'Gebruik'),
	(168,16,3,'Benutzen'),
	(169,16,4,'Use'),
	(170,16,5,'Use'),
	(171,16,6,'Use'),
	(172,16,7,'Use'),
	(173,16,8,'Use'),
	(174,16,9,'Use'),
	(175,16,10,'Use'),
	(176,16,11,'Use'),
	(177,17,1,'Right'),
	(178,17,2,'Right'),
	(179,17,3,'Right'),
	(180,17,4,'Right'),
	(181,17,5,'Right'),
	(182,17,6,'Right'),
	(183,17,7,'Right'),
	(184,17,8,'Right'),
	(185,17,9,'Right'),
	(186,17,10,'Right'),
	(187,17,11,'Right'),
	(188,18,1,'Right'),
	(189,18,2,'Right'),
	(190,18,3,'Right'),
	(191,18,4,'Right'),
	(192,18,5,'Right'),
	(193,18,6,'Right'),
	(194,18,7,'Right'),
	(195,18,8,'Right'),
	(196,18,9,'Right'),
	(197,18,10,'Right'),
	(198,18,11,'Right'),
	(199,19,1,'Right'),
	(200,19,2,'Right'),
	(201,19,3,'Right'),
	(202,19,4,'Right'),
	(203,19,5,'Right'),
	(204,19,6,'Right'),
	(205,19,7,'Right'),
	(206,19,8,'Right'),
	(207,19,9,'Right'),
	(208,19,10,'Right'),
	(209,19,11,'Right'),
	(210,20,1,'Right'),
	(211,20,2,'Right'),
	(212,20,3,'Right'),
	(213,20,4,'Right'),
	(214,20,5,'Right'),
	(215,20,6,'Right'),
	(216,20,7,'Right'),
	(217,20,8,'Right'),
	(218,20,9,'Right'),
	(219,20,10,'Right'),
	(220,20,11,'Right'),
	(221,21,1,'Right'),
	(222,21,2,'Right'),
	(223,21,3,'Right'),
	(224,21,4,'Right'),
	(225,21,5,'Right'),
	(226,21,6,'Right'),
	(227,21,7,'Right'),
	(228,21,8,'Right'),
	(229,21,9,'Right'),
	(230,21,10,'Right'),
	(231,21,11,'Right'),
	(232,22,1,'Right'),
	(233,22,2,'Right'),
	(234,22,3,'Right'),
	(235,22,4,'Right'),
	(236,22,5,'Right'),
	(237,22,6,'Right'),
	(238,22,7,'Right'),
	(239,22,8,'Right'),
	(240,22,9,'Right'),
	(241,22,10,'Right'),
	(242,22,11,'Right'),
	(243,23,1,'Right'),
	(244,23,2,'Right'),
	(245,23,3,'Right'),
	(246,23,4,'Right'),
	(247,23,5,'Right'),
	(248,23,6,'Right'),
	(249,23,7,'Right'),
	(250,23,8,'Right'),
	(251,23,9,'Right'),
	(252,23,10,'Right'),
	(253,23,11,'Right'),
	(254,24,1,'Right'),
	(255,24,2,'Right'),
	(256,24,3,'Right'),
	(257,24,4,'Right'),
	(258,24,5,'Right'),
	(259,24,6,'Right'),
	(260,24,7,'Right'),
	(261,24,8,'Right'),
	(262,24,9,'Right'),
	(263,24,10,'Right'),
	(264,24,11,'Right'),
	(265,25,1,'Right'),
	(266,25,2,'Right'),
	(267,25,3,'Right'),
	(268,25,4,'Right'),
	(269,25,5,'Right'),
	(270,25,6,'Right'),
	(271,25,7,'Right'),
	(272,25,8,'Right'),
	(273,25,9,'Right'),
	(274,25,10,'Right'),
	(275,25,11,'Right'),
	(276,26,1,'Right'),
	(277,26,2,'Recht'),
	(278,26,3,'Rechts'),
	(279,26,4,'Right'),
	(280,26,5,'Right'),
	(281,26,6,'Right'),
	(282,26,7,'Right'),
	(283,26,8,'Right'),
	(284,26,9,'Right'),
	(285,26,10,'Right'),
	(286,26,11,'Right'),
	(287,27,1,'Right'),
	(288,27,2,'Recht'),
	(289,27,3,'Rechts'),
	(290,27,4,'Right'),
	(291,27,5,'Right'),
	(292,27,6,'Right'),
	(293,27,7,'Right'),
	(294,27,8,'Right'),
	(295,27,9,'Right'),
	(296,27,10,'Right'),
	(297,27,11,'Right'),
	(298,28,1,'Right'),
	(299,28,2,'Recht'),
	(300,28,3,'Rechts'),
	(301,28,4,'Right'),
	(302,28,5,'Right'),
	(303,28,6,'Right'),
	(304,28,7,'Right'),
	(305,28,8,'Right'),
	(306,28,9,'Right'),
	(307,28,10,'Right'),
	(308,28,11,'Right'),
	(309,29,1,'Right'),
	(310,29,2,'Recht'),
	(311,29,3,'Rechts'),
	(312,29,4,'Right'),
	(313,29,5,'Right'),
	(314,29,6,'Right'),
	(315,29,7,'Right'),
	(316,29,8,'Right'),
	(317,29,9,'Right'),
	(318,29,10,'Right'),
	(319,29,11,'Right'),
	(320,30,1,'Right'),
	(321,30,2,'Recht'),
	(322,30,3,'Rechts'),
	(323,30,4,'Right'),
	(324,30,5,'Right'),
	(325,30,6,'Right'),
	(326,30,7,'Right'),
	(327,30,8,'Right'),
	(328,30,9,'Right'),
	(329,30,10,'Right'),
	(330,30,11,'Right'),
	(331,31,1,'Use'),
	(332,31,2,'Gebruik'),
	(333,31,3,'Benutzen'),
	(334,31,4,'Use'),
	(335,31,5,'Use'),
	(336,31,6,'Use'),
	(337,31,7,'Use'),
	(338,31,8,'Use'),
	(339,31,9,'Use'),
	(340,31,10,'Use'),
	(341,31,11,'Use');

INSERT INTO `rbac_user_permission` (`user_permission_id`, `user_id`, `blox_id`, `owner_blox_id`, `transaction`, `object_id`, `operation`, `permission`) VALUES
(1, 2, 8, 8, 'right', 3, 'right', 'GRANT'),
(2, 2, 8, 8, 'right', 7, 'right', 'GRANT'),
(3, 1, 4, 4, 'right', NULL, 'right', 'REVOKE'),
(4, 1, 4, 4, 'right', 2, 'right', 'GRANT'),
(5, 1, 4, 4, 'right', 4, 'right', 'GRANT'),
(6, 1, 4, 4, 'right', 8, 'right', 'GRANT'),
(7, 1, 4, 4, 'right', 128, 'right', 'GRANT'),
(8, 1, 4, 4, 'right', 1024, 'right', 'GRANT'),
(9, 1, 4, 4, 'right', 2048, 'right', 'GRANT'),
(10, 1, 4, 4, 'right', 65536, 'right', 'GRANT'),
(11, 1, 4, 4, 'right', 16777216, 'right', 'GRANT'),
(12, 1, 4, 4, 'right', 536870912, 'right', 'GRANT'),
(13, 2, 4, 4, 'right', NULL, 'right', 'GRANT'),
(14, 2, 4, 4, 'right', 2, 'right', 'GRANT'),
(15, 2, 4, 4, 'right', 4, 'right', 'GRANT'),
(16, 2, 4, 4, 'right', 8, 'right', 'GRANT'),
(17, 2, 4, 4, 'right', 128, 'right', 'GRANT'),
(18, 2, 4, 4, 'right', 1024, 'right', 'GRANT'),
(19, 2, 4, 4, 'right', 2048, 'right', 'GRANT'),
(20, 2, 4, 4, 'right', 65536, 'right', 'GRANT'),
(21, 2, 4, 4, 'right', 16777216, 'right', 'GRANT'),
(22, 2, 4, 4, 'right', 536870912, 'right', 'GRANT'),
(23, 2, 4, 4, 'right', 1, 'right', 'GRANT'),
(24, 1, 36, 36, 'right', 1, 'right', 'GRANT'),
(25, 1, 36, 36, 'right', 4, 'right', 'GRANT'),
(26, 1, 36, 36, 'right', 8, 'right', 'GRANT'),
(27, 1, 36, 36, 'right', 16, 'right', 'GRANT'),
(28, 1, 36, 36, 'right', 32, 'right', 'GRANT'),
(29, 1, 36, 36, 'right', 64, 'right', 'GRANT'),
(30, 1, 36, 36, 'right', 128, 'right', 'GRANT'),
(31, 1, 36, 36, 'right', 256, 'right', 'GRANT'),
(32, 1, 18, 18, 'right', 1, 'right', 'GRANT'),
(33, 1, 9, 9, 'right', 1, 'right', 'GRANT'),
(34, 1, 9, 9, 'right', 2, 'right', 'GRANT'),
(35, 1, 9, 9, 'right', 4, 'right', 'GRANT'),
(36, 1, 9, 9, 'right', 8, 'right', 'GRANT'),
(37, 1, 9, 9, 'right', 16, 'right', 'GRANT'),
(38, 1, 9, 9, 'right', 32, 'right', 'GRANT'),
(39, 1, 9, 9, 'right', 64, 'right', 'GRANT'),
(40, 1, 8, 8, 'right', 1, 'right', 'GRANT'),
(41, 1, 8, 8, 'right', 2, 'right', 'GRANT'),
(42, 1, 8, 8, 'right', 8, 'right', 'GRANT'),
(43, 1, 8, 8, 'right', 262144, 'right', 'GRANT'),
(44, 1, 8, 8, 'right', 1073741824, 'right', 'GRANT'),
(45, 2, 36, 36, 'right', 1, 'right', 'GRANT'),
(46, 2, 36, 36, 'right', 2, 'right', 'GRANT'),
(47, 2, 36, 36, 'right', 4, 'right', 'GRANT'),
(48, 2, 36, 36, 'right', 8, 'right', 'GRANT'),
(49, 2, 36, 36, 'right', 16, 'right', 'GRANT'),
(50, 2, 36, 36, 'right', 32, 'right', 'GRANT'),
(51, 2, 36, 36, 'right', 64, 'right', 'GRANT'),
(52, 2, 36, 36, 'right', 128, 'right', 'GRANT'),
(53, 2, 36, 36, 'right', 256, 'right', 'GRANT'),
(54, 2, 18, 18, 'right', 1, 'right', 'GRANT'),
(55, 2, 9, 9, 'right', 1, 'right', 'GRANT'),
(56, 2, 9, 9, 'right', 2, 'right', 'GRANT'),
(57, 2, 9, 9, 'right', 4, 'right', 'GRANT'),
(58, 2, 9, 9, 'right', 8, 'right', 'GRANT'),
(59, 2, 9, 9, 'right', 16, 'right', 'GRANT'),
(60, 2, 9, 9, 'right', 32, 'right', 'GRANT'),
(61, 2, 9, 9, 'right', 64, 'right', 'GRANT'),
(62, 2, 8, 8, 'right', 1, 'right', 'GRANT'),
(63, 2, 8, 8, 'right', 2, 'right', 'GRANT'),
(64, 2, 8, 8, 'right', 4, 'right', 'GRANT'),
(65, 2, 8, 8, 'right', 8, 'right', 'GRANT'),
(66, 2, 8, 8, 'right', 64, 'right', 'GRANT'),
(67, 2, 8, 8, 'right', 2048, 'right', 'GRANT'),
(68, 2, 8, 8, 'right', 32768, 'right', 'GRANT'),
(69, 2, 8, 8, 'right', 262144, 'right', 'GRANT'),
(70, 2, 8, 8, 'right', 1048576, 'right', 'GRANT'),
(71, 2, 8, 8, 'right', 4194304, 'right', 'GRANT'),
(72, 2, 8, 8, 'right', 8388608, 'right', 'GRANT'),
(73, 2, 8, 8, 'right', 268435456, 'right', 'GRANT'),
(74, 2, 8, 8, 'right', 2147483648, 'right', 'GRANT'),
(75, 1, NULL, 4, 'location', NULL, 'restriction', 'GRANT'),
(76, 2, NULL, 4, 'location', NULL, 'restriction', 'GRANT'),
(78, 1, NULL, 8, 'project', NULL, 'restriction', 'GRANT'),
(79, 2, NULL, 8, 'project', NULL, 'restriction', 'GRANT'),
(81, 1, NULL, 4, 'supplier', NULL, 'restriction', 'GRANT'),
(82, 2, NULL, 4, 'supplier', NULL, 'restriction', 'GRANT'),
(84, 1, NULL, 8, 'costCenter', NULL, 'restriction', 'GRANT'),
(85, 2, NULL, 8, 'costCenter', NULL, 'restriction', 'GRANT'),
(87, 1, NULL, 8, 'group', NULL, 'restriction', 'GRANT'),
(88, 2, NULL, 8, 'group', NULL, 'restriction', 'GRANT'),
(90, 1, NULL, 8, 'subGroup', NULL, 'restriction', 'GRANT'),
(91, 2, NULL, 8, 'subGroup', NULL, 'restriction', 'GRANT'),
(93, 1, NULL, 20, 'template', NULL, 'restriction', 'GRANT'),
(94, 2, NULL, 20, 'template', NULL, 'restriction', 'GRANT'),
(96, 1, NULL, 20, 'container', NULL, 'restriction', 'GRANT'),
(97, 2, NULL, 20, 'container', NULL, 'restriction', 'GRANT'),
(99, 1, NULL, 20, 'category', NULL, 'restriction', 'GRANT'),
(100, 2, NULL, 20, 'category', NULL, 'restriction', 'GRANT'),
(102, 1, NULL, 20, 'field', NULL, 'restriction', 'GRANT'),
(103, 2, NULL, 20, 'field', NULL, 'restriction', 'GRANT'),
(105, 1, NULL, 20, 'document', NULL, 'restriction', 'GRANT'),
(106, 2, NULL, 20, 'document', NULL, 'restriction', 'GRANT'),
(108, 1, NULL, 8, 'projectList', NULL, 'restriction', 'GRANT'),
(109, 2, NULL, 8, 'projectList', NULL, 'restriction', 'GRANT'),
(111, 1, NULL, 2, 'product', NULL, 'restriction', 'GRANT'),
(112, 2, NULL, 2, 'product', NULL, 'restriction', 'GRANT'),
(114, 1, NULL, 2, 'status', NULL, 'restriction', 'GRANT'),
(115, 2, NULL, 2, 'status', NULL, 'restriction', 'GRANT'),
(117, 1, NULL, 2, 'sector', NULL, 'restriction', 'GRANT'),
(118, 2, NULL, 2, 'sector', NULL, 'restriction', 'GRANT'),
(120, 1, NULL, 2, 'category', NULL, 'restriction', 'GRANT'),
(121, 2, NULL, 2, 'category', NULL, 'restriction', 'GRANT'),
(123, 1, NULL, 4, 'product', NULL, 'restriction', 'GRANT'),
(124, 2, NULL, 4, 'product', NULL, 'restriction', 'GRANT'),
(126, 1, NULL, 4, 'internalProduct', NULL, 'restriction', 'GRANT'),
(127, 2, NULL, 4, 'internalProduct', NULL, 'restriction', 'GRANT'),
(129, 1, NULL, 4, 'subcategory', NULL, 'restriction', 'GRANT'),
(130, 2, NULL, 4, 'subcategory', NULL, 'restriction', 'GRANT'),
(132, 1, NULL, 38, 'account', NULL, 'restriction', 'GRANT'),
(133, 2, NULL, 38, 'account', NULL, 'restriction', 'GRANT'),
(135, 1, 17, 17, 'right', 1, 'right', 'GRANT'),
(136, 1, 53, 53, 'approveInvoicesRight', NULL, 'right', 'GRANT'),
(137, 1, 53, 53, 'generalRight', NULL, 'right', 'GRANT'),
(138, 1, 53, 53, 'invoiceOverviewRight', NULL, 'right', 'GRANT'),
(139, 1, 53, 53, 'settingsRight', NULL, 'right', 'GRANT'),
(140, 1, 53, 53, 'step1Right', NULL, 'right', 'GRANT'),
(141, 1, 53, 53, 'step2Right', NULL, 'right', 'GRANT'),
(142, 1, 53, 53, 'step3Right', NULL, 'right', 'GRANT'),
(143, 1, 53, 53, 'step4Right', NULL, 'right', 'GRANT'),
(144, 1, 53, 53, 'step5Right', NULL, 'right', 'GRANT'),
(145, 6, 53, 53, 'generalRight', NULL, 'right', 'GRANT'),
(146, 6, 53, 53, 'invoiceOverviewRight', NULL, 'right', 'GRANT'),
(147, 6, 53, 53, 'settingsRight', NULL, 'right', 'GRANT'),
(148, 6, 53, 53, 'step1Right', NULL, 'right', 'GRANT'),
(149, 6, 53, 53, 'step2Right', NULL, 'right', 'GRANT'),
(150, 6, 53, 53, 'step3Right', NULL, 'right', 'GRANT'),
(151, 6, 53, 53, 'step4Right', NULL, 'right', 'GRANT'),
(152, 6, 53, 53, 'step5Right', NULL, 'right', 'GRANT'),
(153, 2, 53, 53, 'approveInvoicesRight', NULL, 'right', 'GRANT'),
(154, 2, 53, 53, 'generalRight', NULL, 'right', 'GRANT'),
(155, 2, 53, 53, 'invoiceOverviewRight', NULL, 'right', 'GRANT'),
(156, 2, 53, 53, 'settingsRight', NULL, 'right', 'GRANT'),
(157, 2, 53, 53, 'step1Right', NULL, 'right', 'GRANT'),
(158, 2, 53, 53, 'step2Right', NULL, 'right', 'GRANT'),
(159, 2, 53, 53, 'step3Right', NULL, 'right', 'GRANT'),
(160, 2, 53, 53, 'step4Right', NULL, 'right', 'GRANT'),
(161, 2, 53, 53, 'step5Right', NULL, 'right', 'GRANT'),
(162, 2, 8, 8, 'right', 1073741824, 'right', 'GRANT'),
(163, 15, 53, 53, 'approveInvoicesRight', NULL, 'right', 'GRANT'),
(164, 15, 53, 53, 'generalRight', NULL, 'right', 'GRANT'),
(165, 15, 53, 53, 'invoiceOverviewRight', NULL, 'right', 'GRANT'),
(166, 15, 53, 53, 'settingsRight', NULL, 'right', 'GRANT'),
(167, 15, 53, 53, 'step1Right', NULL, 'right', 'GRANT'),
(168, 15, 53, 53, 'step2Right', NULL, 'right', 'GRANT'),
(169, 15, 53, 53, 'step3Right', NULL, 'right', 'GRANT'),
(170, 15, 53, 53, 'step4Right', NULL, 'right', 'GRANT'),
(171, 15, 53, 53, 'step5Right', NULL, 'right', 'GRANT'),
(172, 1, 38, 38, 'right', NULL, 'right', 'GRANT'),
(173, 1, 21, 21, 'right', NULL, 'right', 'GRANT');

INSERT INTO `skill` (`skillID`, `skillName`, `skillDescription`) VALUES (0, 'Non Skill', 'no skill needed');

INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (1, 'USD', '$', 'US Dollar', 0.832640, 1);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (2, 'AFA', 'AFA', 'Afghanistan Afghani', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (3, 'ALL', 'ALL', 'Albanian Lek', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (4, 'DZD', 'DZD', 'Algerian Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (5, 'ADF', 'ADF', 'Andorran Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (6, 'ADP', 'ADP', 'Andorran Peseta', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (7, 'AON', 'AON', 'Angolan New Kwanza', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (8, 'ARS', 'ARS', 'Argentine Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (9, 'AWG', 'AWG', 'Aruban Florin', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (10, 'AUD', 'AUD', 'Australian Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (11, 'ATS', 'ATS', 'Austrian Schilling', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (12, 'BSD', 'BSD', 'Bahamian Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (13, 'BHD', 'BHD', 'Bahraini Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (14, 'BDT', 'BDT', 'Bangladeshi Taka', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (15, 'BBD', 'BBD', 'Barbados Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (16, 'BEF', 'BEF', 'Belgian Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (17, 'BZD', 'BZD', 'Belize Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (18, 'BMD', 'BMD', 'Bermudian Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (19, 'BTN', 'BTN', 'Bhutan Ngultrum', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (20, 'BOB', 'BOB', 'Bolivian Boliviano', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (21, 'BWP', 'BWP', 'Botswana Pula', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (22, 'BRL', 'BRL', 'Brazilian Real', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (23, 'GBP', '&pound;', 'British Pound', 1.472210, 1);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (24, 'BND', 'BND', 'Brunei Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (25, 'BGL', 'BGL', 'Bulgarian Lev', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (26, 'BIF', 'BIF', 'Burundi Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (27, 'XOF', 'XOF', 'CFA Franc BCEAO', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (28, 'XAF', 'XAF', 'CFA Franc BEAC', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (29, 'XPF', 'XPF', 'CFP Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (30, 'KHR', 'KHR', 'Cambodian Riel', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (31, 'CAD', 'CAD', 'Canadian Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (32, 'CVE', 'CVE', 'Cape Verde Escudo', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (33, 'KYD', 'KYD', 'Cayman Islands Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (34, 'CLP', 'CLP', 'Chilean Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (35, 'CNY', 'CNY', 'Chinese Yuan Renminbi', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (36, 'COP', 'COP', 'Colombian Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (37, 'KMF', 'KMF', 'Comoros Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (38, 'CRC', 'CRC', 'Costa Rican Colon', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (39, 'HRK', 'HRK', 'Croatian Kuna', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (40, 'CUC', 'CUC', 'Cuban Convertible Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (41, 'CUP', 'CUP', 'Cuban Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (42, 'CYP', 'CYP', 'Cyprus Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (43, 'CZK', 'CZK', 'Czech Koruna', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (44, 'DKK', 'DKK', 'Danish Krone', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (45, 'DJF', 'DJF', 'Djibouti Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (46, 'DOP', 'DOP', 'Dominican R. Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (47, 'NLG', 'NLG', 'Dutch Guilder', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (48, 'XEU', 'XEU', 'ECU', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (49, 'XCD', 'XCD', 'East Caribbean Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (50, 'ECS', 'ECS', 'Ecuador Sucre', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (51, 'EGP', 'EGP', 'Egyptian Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (52, 'SVC', 'SVC', 'El Salvador Colon', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (53, 'EEK', 'EEK', 'Estonian Kroon', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (54, 'ETB', 'ETB', 'Ethiopian Birr', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (55, 'EUR', '&euro;', 'Euro', 1.000000, 1);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (56, 'FKP', 'FKP', 'Falkland Islands Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (57, 'FJD', 'FJD', 'Fiji Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (58, 'FIM', 'FIM', 'Finnish Markka', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (59, 'FRF', 'FRF', 'French Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (60, 'GMD', 'GMD', 'Gambian Dalasi', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (61, 'DEM', 'DEM', 'German Mark', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (62, 'GHC', 'GHC', 'Ghanaian Cedi', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (63, 'GIP', 'GIP', 'Gibraltar Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (64, 'XAU', 'XAU', 'Gold (oz.)', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (65, 'GRD', 'GRD', 'Greek Drachma', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (66, 'GTQ', 'GTQ', 'Guatemalan Quetzal', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (67, 'GNF', 'GNF', 'Guinea Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (68, 'GYD', 'GYD', 'Guyanese Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (69, 'HTG', 'HTG', 'Haitian Gourde', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (70, 'HNL', 'HNL', 'Honduran Lempira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (71, 'HKD', 'HKD', 'Hong Kong Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (72, 'HUF', 'HUF', 'Hungarian Forint', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (73, 'ISK', 'ISK', 'Iceland Krona', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (74, 'INR', 'INR', 'Indian Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (75, 'IDR', 'IDR', 'Indonesian Rupiah', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (76, 'IRR', 'IRR', 'Iranian Rial', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (77, 'IQD', 'IQD', 'Iraqi Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (78, 'IEP', 'IEP', 'Irish Punt', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (79, 'ILS', 'ILS', 'Israeli New Shekel', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (80, 'ITL', 'ITL', 'Italian Lira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (81, 'JMD', 'JMD', 'Jamaican Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (82, 'JPY', '&yen;', 'Japanese Yen', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (83, 'JOD', 'JOD', 'Jordanian Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (84, 'KZT', 'KZT', 'Kazakhstan Tenge', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (85, 'KES', 'KES', 'Kenyan Shilling', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (86, 'KWD', 'KWD', 'Kuwaiti Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (87, 'LAK', 'LAK', 'Lao Kip', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (88, 'LVL', 'LVL', 'Latvian Lats', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (89, 'LBP', 'LBP', 'Lebanese Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (90, 'LSL', 'LSL', 'Lesotho Loti', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (91, 'LRD', 'LRD', 'Liberian Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (92, 'LYD', 'LYD', 'Libyan Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (93, 'LTL', 'LTL', 'Lithuanian Litas', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (94, 'LUF', 'LUF', 'Luxembourg Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (95, 'MOP', 'MOP', 'Macau Pataca', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (96, 'MGA', 'MGA', 'Malagasy Ariary', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (97, 'MGF', 'MGF', 'Malagasy Franc', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (98, 'MWK', 'MWK', 'Malawi Kwacha', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (99, 'MYR', 'MYR', 'Malaysian Ringgit', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (100, 'MVR', 'MVR', 'Maldive Rufiyaa', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (101, 'MTL', 'MTL', 'Maltese Lira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (102, 'MRO', 'MRO', 'Mauritanian Ouguiya', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (103, 'MUR', 'MUR', 'Mauritius Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (104, 'MXN', 'MXN', 'Mexican Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (105, 'MNT', 'MNT', 'Mongolian Tugrik', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (106, 'MAD', 'MAD', 'Moroccan Dirham', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (107, 'MZM', 'MZM', 'Mozambique Metical', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (108, 'MMK', 'MMK', 'Myanmar Kyat', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (109, 'ANG', 'ANG', 'NL Antillian Guilder', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (110, 'NAD', 'NAD', 'Namibia Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (111, 'NPR', 'NPR', 'Nepalese Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (112, 'NZD', 'NZD', 'New Zealand Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (113, 'NIO', 'NIO', 'Nicaraguan Cordoba Oro', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (114, 'NGN', 'NGN', 'Nigerian Naira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (115, 'KPW', 'KPW', 'North Korean Won', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (116, 'NOK', 'NOK', 'Norwegian Kroner', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (117, 'OMR', 'OMR', 'Omani Rial', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (118, 'PKR', 'PKR', 'Pakistan Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (119, 'XPD', 'XPD', 'Palladium (oz.)', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (120, 'PAB', 'PAB', 'Panamanian Balboa', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (121, 'PGK', 'PGK', 'Papua New Guinea Kina', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (122, 'PYG', 'PYG', 'Paraguay Guarani', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (123, 'PEN', 'PEN', 'Peruvian Nuevo Sol', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (124, 'PHP', 'PHP', 'Philippine Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (125, 'XPT', 'XPT', 'Platinum (oz.)', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (126, 'PLN', 'PLN', 'Polish Zloty', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (127, 'PTE', 'PTE', 'Portuguese Escudo', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (128, 'QAR', 'QAR', 'Qatari Rial', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (129, 'ROL', 'ROL', 'Romanian Lei', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (130, 'RON', 'RON', 'Romanian New Lei', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (131, 'RUB', 'RUB', 'Russian Rouble', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (132, 'WST', 'WST', 'Samoan Tala', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (133, 'STD', 'STD', 'Sao Tome/Principe Dobra', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (134, 'SAR', 'SAR', 'Saudi Riyal', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (135, 'CSD', 'CSD', 'Serbian Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (136, 'SCR', 'SCR', 'Seychelles Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (137, 'SLL', 'SLL', 'Sierra Leone Leone', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (138, 'XAG', 'XAG', 'Silver (oz.)', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (139, 'SGD', 'SGD', 'Singapore Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (140, 'SKK', 'SKK', 'Slovak Koruna', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (141, 'SIT', 'SIT', 'Slovenian Tolar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (142, 'SBD', 'SBD', 'Solomon Islands Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (143, 'SOS', 'SOS', 'Somali Shilling', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (144, 'ZAR', 'ZAR', 'South African Rand', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (145, 'KRW', 'KRW', 'South-Korean Won', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (146, 'ESP', 'ESP', 'Spanish Peseta', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (147, 'LKR', 'LKR', 'Sri Lanka Rupee', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (148, 'SHP', 'SHP', 'St Helena Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (149, 'SDD', 'SDD', 'Sudanese Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (150, 'SDP', 'SDP', 'Sudanese Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (151, 'SRD', 'SRD', 'Suriname Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (152, 'SRG', 'SRG', 'Suriname Guilder', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (153, 'SZL', 'SZL', 'Swaziland Lilangeni', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (154, 'SEK', 'SEK', 'Swedish Krona', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (155, 'CHF', 'CHF', 'Swiss Franc', 0.645090, 1);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (156, 'SYP', 'SYP', 'Syrian Pound', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (157, 'TWD', 'TWD', 'Taiwan Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (158, 'TZS', 'TZS', 'Tanzanian Shilling', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (159, 'THB', 'THB', 'Thai Baht', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (160, 'TOP', 'TOP', 'Tonga Pa''anga', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (161, 'TTD', 'TTD', 'Trinidad/Tobago Dollar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (162, 'TND', 'TND', 'Tunisian Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (163, 'TRL', 'TRL', 'Turkish Lira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (164, 'TRY', 'TRY', 'Turkish New Lira', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (165, 'UGS', 'UGS', 'Uganda Shilling', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (166, 'UAH', 'UAH', 'Ukraine Hryvnia', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (167, 'UYP', 'UYP', 'Uruguayan Peso', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (168, 'AED', 'AED', 'Utd Dirham', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (169, 'VUV', 'VUV', 'Vanuatu Vatu', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (170, 'VEB', 'VEB', 'Venezuelan Bolivar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (171, 'VND', 'VND', 'Vietnamese Dong', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (172, 'YER', 'YER', 'Yemeni Rial', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (173, 'YUN', 'YUN', 'Yugoslav Dinar', 1.000000, 0);
INSERT INTO `valuta` (`intID`, `valutaID`, `valutaSign`, `valutaName`, `exchangeRate`, `showvaluta`) VALUES (174, 'ZMK', 'ZMK', 'Zambian Kwacha', 1.000000, 0);

INSERT INTO `users` (`userID`, `companyID`, `languageID`, `yearID`, `userName`, `kplID`, `fteID`, `statusInOut`, `dateIn`, `dateOut`, `functionName`, `login`, `password`, `passwordText`, `mail`, `editLast`, `editBy`, `blnComplete`, `extID`, `sofinr`, `roleID`, `password_lastchange`, `last_passwords`, `wrong_passwords`, `is_locked`, `is_support_account`) VALUES (1, 1, 1, 2018, 'TBlox Developer', 1, 100.000, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Administrator', 'dev', 'e77989ed21758e78331b20e477fc5582', '', 'tbloxdev@tblox.com', '2017-08-31 12:28:11', 0, '', '', '', 0, 0, NULL, 0, 0, '');
INSERT INTO `users` (`userID`, `companyID`, `languageID`, `yearID`, `userName`, `kplID`, `fteID`, `statusInOut`, `dateIn`, `dateOut`, `functionName`, `login`, `password`, `passwordText`, `mail`, `editLast`, `editBy`, `blnComplete`, `extID`, `sofinr`, `roleID`, `password_lastchange`, `last_passwords`, `wrong_passwords`, `is_locked`, `is_support_account`) VALUES (2, 1, 2, 2018, 'sup1', 0, 0.000, 1, '2017-08-31 00:00:00', '0000-00-00 00:00:00', 'TBlox Support', 'sup1', '21232f297a57a5a743894a0e4a801fc3', '', 'support@tblox.com', '2018-06-07 11:27:03', 0, '', '', '', 0, 0, NULL, 0, 0, '');

INSERT INTO `years` (`yearID`, `blnActive`) VALUES (2018, 'TRUE');