DROP TABLE IF EXISTS `ak47_qb_housing`;
CREATE TABLE IF NOT EXISTS `ak47_qb_housing` (
  `id` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `needagent` tinyint(1) DEFAULT NULL,
  `agentinfo` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labs` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `polyzone` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enter` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `interior` tinyint(1) DEFAULT NULL,
  `reseller` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `furnitures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cam` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exterior` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garagevehicles` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doors` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rent` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxweed` int(11) DEFAULT NULL,
  `shellopened` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ak47_qb_housing_commissions`;
CREATE TABLE IF NOT EXISTS `ak47_qb_housing_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
