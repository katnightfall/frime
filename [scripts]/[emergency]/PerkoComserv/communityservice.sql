SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `communityservice` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `actions_remaining` int(11) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `comserv_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `identifier_2` (`identifier`);

ALTER TABLE `communityservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

