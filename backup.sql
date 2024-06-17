SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `classification` (
  `classification_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `compileinfo` (
  `solution_id` int(11) NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contest` (
  `contest_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `defunct` char(1) NOT NULL DEFAULT 'N',
  `description` text DEFAULT NULL,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `langmask` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'bits for LANG to mask',
  `obi` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contest_problem` (
  `problem_id` int(11) NOT NULL DEFAULT 0,
  `contest_id` int(11) NOT NULL,
  `title` char(200) NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT 0,
  `c_accepted` int(11) NOT NULL DEFAULT 0,
  `c_submit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contest_programming_language` (
  `contest_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contest_user` (
  `contest_id` int(11) NOT NULL,
  `user_id` varchar(48) NOT NULL,
  `is_owner` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL,
  `user_id` varchar(48) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `user_id` varchar(48) NOT NULL DEFAULT '' COMMENT 'user_id',
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT '2016-05-13 19:24:00',
  `importance` tinyint(4) NOT NULL DEFAULT 0,
  `menu` int(11) NOT NULL DEFAULT 0,
  `defunct` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `online` (
  `hash` varchar(32) NOT NULL,
  `ip` varchar(46) NOT NULL DEFAULT '',
  `ua` varchar(255) NOT NULL DEFAULT '',
  `refer` varchar(255) DEFAULT NULL,
  `lastmove` int(11) NOT NULL,
  `firsttime` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `online_history` (
  `id` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `user_id` varchar(48) NOT NULL,
  `ip` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ua` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `refer` varchar(255) DEFAULT NULL,
  `lastmove` int(11) NOT NULL,
  `firsttime` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL,
  `user_id` char(48) NOT NULL DEFAULT '',
  `rightstr` char(30) NOT NULL DEFAULT '',
  `valuestr` char(11) NOT NULL DEFAULT 'true',
  `defunct` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `input` text DEFAULT NULL,
  `output` text DEFAULT NULL,
  `sample_input` text DEFAULT NULL,
  `sample_output` text DEFAULT NULL,
  `spj` char(1) NOT NULL DEFAULT '0',
  `hint` text DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `time_limit` decimal(10,3) NOT NULL DEFAULT 0.000,
  `memory_limit` int(11) NOT NULL DEFAULT 0,
  `defunct` char(1) NOT NULL DEFAULT 'N',
  `accepted` int(11) DEFAULT 0,
  `submit` int(11) DEFAULT 0,
  `solved` int(11) DEFAULT 0,
  `remote_oj` varchar(16) DEFAULT NULL,
  `remote_id` varchar(32) DEFAULT NULL,
  `tags2` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `langmask` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `problem_classification` (
  `problem_id` int(11) NOT NULL,
  `classification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `programing_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `remote_clients` (
  `client_id` int(11) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `token` text NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `runtimeinfo` (
  `solution_id` int(11) NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `similar_code` (
  `solution_id` int(11) NOT NULL,
  `similar_s_id` int(11) NOT NULL,
  `percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `solution` (
  `solution_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL DEFAULT 0,
  `user_id` char(48) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `memory` int(11) NOT NULL DEFAULT 0,
  `in_date` datetime NOT NULL DEFAULT current_timestamp(),
  `result` smallint(6) NOT NULL DEFAULT 0,
  `language` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ip` char(46) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `contest_id` int(11) DEFAULT 0,
  `valid` tinyint(4) NOT NULL DEFAULT 1,
  `num` tinyint(4) NOT NULL DEFAULT -1,
  `code_length` int(11) NOT NULL DEFAULT 0,
  `judgetime` timestamp NULL DEFAULT current_timestamp(),
  `pass_rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `is_remote_oj` int(1) NOT NULL DEFAULT 0,
  `remote_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `solution_client` (
  `id` int(11) NOT NULL,
  `solution_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `source_code` (
  `solution_id` int(11) NOT NULL,
  `source` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `users` (
  `user_id` varchar(48) NOT NULL DEFAULT '' COMMENT 'user_id',
  `ip` varchar(46) NOT NULL DEFAULT '',
  `accesstime` datetime DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_expires` datetime DEFAULT NULL,
  `is_active` bigint(20) DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_activity` (
  `user_id` varchar(48) NOT NULL DEFAULT '',
  `submit` int(11) DEFAULT 0,
  `solved` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_profiles` (
  `user_id` varchar(48) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `nick` varchar(100) NOT NULL DEFAULT '',
  `school` varchar(100) DEFAULT '',
  `lastname` varchar(15) DEFAULT NULL,
  `pais_id` int(11) DEFAULT 0,
  `ci` text DEFAULT NULL,
  `departament` int(11) NOT NULL DEFAULT 0,
  `district` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_roles` (
  `user_id` varchar(48) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_settings` (
  `user_id` varchar(48) NOT NULL DEFAULT '',
  `volume` int(11) NOT NULL DEFAULT 1,
  `language` int(11) NOT NULL DEFAULT 1,
  `obi` int(11) DEFAULT NULL,
  `institucion_id` int(11) NOT NULL DEFAULT 0,
  `vcyt` text DEFAULT NULL,
  `rude` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `classification`
  ADD PRIMARY KEY (`classification_id`),
  ADD KEY `topic_id` (`topic_id`);

ALTER TABLE `compileinfo`
  ADD PRIMARY KEY (`solution_id`);

ALTER TABLE `contest`
  ADD PRIMARY KEY (`contest_id`);

ALTER TABLE `contest_problem`
  ADD PRIMARY KEY (`contest_id`,`problem_id`),
  ADD KEY `Index_contest_id` (`contest_id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `problem_id` (`problem_id`);

ALTER TABLE `contest_programming_language`
  ADD PRIMARY KEY (`contest_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

ALTER TABLE `contest_user`
  ADD PRIMARY KEY (`contest_id`,`user_id`),
  ADD KEY `contest_id` (`contest_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `loginlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_log_index` (`user_id`,`time`),
  ADD KEY `user_time_index` (`user_id`,`time`);

ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `online`
  ADD PRIMARY KEY (`hash`),
  ADD UNIQUE KEY `hash` (`hash`);

ALTER TABLE `online_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`);

ALTER TABLE `privilege`
  ADD PRIMARY KEY (`privilege_id`),
  ADD KEY `user_id_index` (`user_id`);

ALTER TABLE `problem`
  ADD PRIMARY KEY (`problem_id`);

ALTER TABLE `problem_classification`
  ADD PRIMARY KEY (`problem_id`,`classification_id`),
  ADD KEY `classification_id` (`classification_id`);

ALTER TABLE `programing_language`
  ADD PRIMARY KEY (`language_id`);

ALTER TABLE `remote_clients`
  ADD PRIMARY KEY (`client_id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

ALTER TABLE `runtimeinfo`
  ADD PRIMARY KEY (`solution_id`);

ALTER TABLE `similar_code`
  ADD PRIMARY KEY (`solution_id`,`similar_s_id`);

ALTER TABLE `solution`
  ADD PRIMARY KEY (`solution_id`),
  ADD KEY `uid` (`user_id`),
  ADD KEY `pid` (`problem_id`),
  ADD KEY `res` (`result`),
  ADD KEY `cid` (`contest_id`);

ALTER TABLE `solution_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solution_id` (`solution_id`),
  ADD KEY `client_id` (`client_id`);

ALTER TABLE `source_code`
  ADD PRIMARY KEY (`solution_id`);

ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_ibfk_1` (`user_id`),
  ADD KEY `user_roles_ibfk_2` (`role_id`);

ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);


ALTER TABLE `classification`
  MODIFY `classification_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `contest`
  MODIFY `contest_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `loginlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `online_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `privilege`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `problem`
  MODIFY `problem_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `programing_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `remote_clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `solution`
  MODIFY `solution_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `solution_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `classification`
  ADD CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON UPDATE CASCADE;

ALTER TABLE `compileinfo`
  ADD CONSTRAINT `compileinfo_ibfk_1` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`solution_id`) ON UPDATE CASCADE;

ALTER TABLE `contest_problem`
  ADD CONSTRAINT `contest_problem_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contest_problem_ibfk_2` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON UPDATE CASCADE;

ALTER TABLE `contest_programming_language`
  ADD CONSTRAINT `contest_programming_language_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contest_programming_language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `programing_language` (`language_id`) ON UPDATE CASCADE;

ALTER TABLE `contest_user`
  ADD CONSTRAINT `contest_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contest_user_ibfk_2` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`) ON UPDATE CASCADE;

ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `problem_classification`
  ADD CONSTRAINT `problem_classification_ibfk_1` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `problem_classification_ibfk_2` FOREIGN KEY (`classification_id`) REFERENCES `classification` (`classification_id`) ON UPDATE CASCADE;

ALTER TABLE `runtimeinfo`
  ADD CONSTRAINT `runtimeinfo_ibfk_1` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`solution_id`) ON UPDATE CASCADE;

ALTER TABLE `solution`
  ADD CONSTRAINT `solution_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `solution_ibfk_2` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON UPDATE CASCADE;

ALTER TABLE `solution_client`
  ADD CONSTRAINT `solution_client_ibfk_1` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`solution_id`),
  ADD CONSTRAINT `solution_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `remote_clients` (`client_id`);

ALTER TABLE `source_code`
  ADD CONSTRAINT `source_code_ibfk_1` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`solution_id`) ON UPDATE CASCADE;

ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE;

ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;
