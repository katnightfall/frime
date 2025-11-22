DROP TABLE IF EXISTS `ak47_qb_territories_turf`;
CREATE TABLE IF NOT EXISTS `ak47_qb_territories_turf` (
  `uid` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELETE FROM `ak47_qb_territories_turf`;
INSERT INTO `ak47_qb_territories_turf` (`uid`, `data`) VALUES
  ('105.09-1940.63', '{"start":{"y":-1940.6326904296876,"z":19.8037109375,"x":105.08545684814452},"items":[],"setting":{"addinfuence":45,"coprequired":0,"duration":5,"showblip":true,"cooldown":30,"gangrequired":3,"zoneradius":40,"chancecalmult":3,"alertcops":true},"position":{"y":-1940.6326904296876,"z":19.8037109375,"x":105.08545684814452},"name":"Grove St"}');
