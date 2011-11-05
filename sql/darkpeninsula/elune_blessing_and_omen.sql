-- Lunar Festival
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 15467;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 15467;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(15467, 0, 0, 0, 0, 0, 100, 0, 35000, 35000, 35000, 35000, 11, 26540, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Omen Cast Starfall On Self'),
(15467, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 43273, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Omen Cast Cleave On Victim'),
(15467, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 26392, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Omen Cast Moonlight On Death');

DELETE FROM `creature` WHERE `id` = 15467;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(208789, 15467, 1, 1, 1, 0, 0, 7544.55, -2803.19, 448.74, 4, 300, 0, 0, 5578000, 0, 0, 0, 0, 0);

DELETE FROM `game_event_creature` WHERE `eventEntry` = 7 and `guid` = 208789;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES ('7', '208789');

UPDATE `creature_template` SET `unit_flags` = '33554448' WHERE `entry` = 15902;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('15902', '0', '0', '0', '0', '0', '50236');
