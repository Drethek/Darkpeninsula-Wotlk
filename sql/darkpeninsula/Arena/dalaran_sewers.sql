-- Dalaran Sewers
UPDATE `gameobject_template` SET `flags` = '36' WHERE `entry` = 192642 LIMIT 1;
UPDATE `gameobject_template` SET `flags` = '36' WHERE `entry` = 192643 LIMIT 1;
UPDATE `battleground_template` SET `MinPlayersPerTeam` = '0', `MaxPlayersPerTeam` = '2' WHERE `id` = 10 LIMIT 1;
DELETE FROM `disables` WHERE `entry` = 10;