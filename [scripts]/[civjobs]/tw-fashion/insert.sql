CREATE TABLE IF NOT EXISTS `tw_fashion` (
  `identifier` char(50) DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL,
  `dailymission` longtext DEFAULT NULL,
  `tutorial` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE IF NOT EXISTS `fashion_tbx` (
  `tbx` longtext DEFAULT NULL,
  `active` tinyint(2) DEFAULT NULL,
  `xpCount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;