
CREATE TABLE IF NOT EXISTS `roadshop_carplay_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(30) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `mail` varchar(80) NOT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `profile` varchar(265) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mail` (`mail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `roadshop_music_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL,
  `title` varchar(25) NOT NULL,
  `image` varchar(265) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_music_playlists_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlistId` int(11) DEFAULT NULL,
  `songid` varchar(50) NOT NULL DEFAULT '0',
  `song` varchar(200) NOT NULL DEFAULT '0',
  `artist` varchar(200) NOT NULL DEFAULT '0',
  `image` varchar(265) NOT NULL DEFAULT '0',
  `length` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playlistId` (`playlistId`),
  CONSTRAINT `FK__roadshop_music_playlists` FOREIGN KEY (`playlistId`) REFERENCES `roadshop_music_playlists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;