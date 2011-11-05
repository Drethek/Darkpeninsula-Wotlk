-- HORDE QUEST
-- Inside the Frozen Citadel
UPDATE `quest_template` SET `PrevQuestId`='0', `NextQuestId`='24511' WHERE `entry` = 24506;
-- Echoes of Tortured Souls
UPDATE `quest_template` SET `PrevQuestId`='24506', `NextQuestId`='24682' WHERE `entry` = 24511;
-- The Pit of Saron
UPDATE `quest_template` SET `PrevQuestId`='24511', `NextQuestId`='24507' WHERE `entry` = 24682;
-- The Path to the Citadel
UPDATE `quest_template` SET `PrevQuestId`='24682', `NextQuestId`='24712' WHERE `entry` = 24507;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='-201969' WHERE `entry` = 24507;
-- Deliverance from the Pit
UPDATE `quest_template` SET `PrevQuestId`='24507', `NextQuestId`='24713' WHERE `entry` = 24712;
-- Frostmourne
UPDATE `quest_template` SET `PrevQuestId`='24712', `NextQuestId`='0' WHERE `entry` = 24713;

-- ALLY QUEST
-- Inside the Frozen Citadel
UPDATE `quest_template` SET `PrevQuestId`='0', `NextQuestId`='24499' WHERE `entry` = 24510;
-- Echoes of Tortured Souls
UPDATE `quest_template` SET `PrevQuestId`='24510', `NextQuestId`='24683' WHERE `entry` = 24499;
-- The Pit of Saron
UPDATE `quest_template` SET `PrevQuestId`='24499', `NextQuestId`='24498' WHERE `entry` = 24683;
-- The Path to the Citadel
UPDATE `quest_template` SET `PrevQuestId`='24683', `NextQuestId`='24710' WHERE `entry` = 24498;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='-201969' WHERE `entry` = 24498;
-- Deliverance from the Pit
UPDATE `quest_template` SET `PrevQuestId`='24498', `NextQuestId`='24711' WHERE `entry` = 24710;
-- Frostmourne
UPDATE `quest_template` SET `PrevQuestId`='24710', `NextQuestId`='0' WHERE `entry` = 24711;

-- [System-GameMaster] Add Teleport location: "ForgeOfSouls"
DELETE FROM game_tele WHERE name="ForgeOfSouls";
INSERT INTO game_tele (position_x, position_y, position_z, orientation, map, name)
VALUES (5663.29, 2011.56, 798.042, 5.50119, 571, "ForgeOfSouls");

-- [System-Instance] Fix ForgeOfSouls Jaina Proudmoore template (Ally quest)
UPDATE creature_template SET faction_A=534, faction_H=534 WHERE entry=37597;

-- Fix loot entries in FoS normal mode
DELETE FROM creature_loot_template WHERE entry=36497 AND item=47241; -- Bronjahm, remove emblems in normal run
DELETE FROM creature_loot_template WHERE entry=36502 AND item=47241; -- Devourer of Souls, remove emblems in normal run

-- Forge of Souls immunity masks, in order:
-- charm, cofused, disarm, distract, fear, root, pacified, silence, sleep, snare, stun, freeze, knockout, polymorph, banish, shackle, horror, daze, sapped
UPDATE creature_template SET mechanic_immune_mask=1|2|4|8|16|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|8388608|67108864|536870912 WHERE entry IN
(36497, 36498, -- Bronjahm
 36502, 37677);-- Devourer of Souls
 
-- Achievements: Soul Power
DELETE FROM `disables` WHERE `entry`=12752 AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=12752;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(12752,12,1,0,''),
(12752,11,0,0,'achievement_soul_power');