DELETE FROM `command` WHERE `name` = 'rds';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('rds', 1, 'Syntax: .rds [$name]');