-- Lillehoff <The Sons of Hodir Quartermaster>
UPDATE `creature_template` SET `faction_A`='35',`faction_H`='35' WHERE `entry`=32540;
UPDATE `creature` SET `phaseMask`='1' WHERE `id`=32540;

-- Examples to be Made
UPDATE `creature` SET `unit_flags` = 512 WHERE `guid` IN ('118746', '118747', '118748') and `id` = '29426';

-- Taking on All Challengers
UPDATE `creature_template` SET `faction_A`='35',`faction_H`='35' WHERE `entry`=30012;

-- Going Bearback
UPDATE `creature_template` SET `spell3` = 0 WHERE `entry` = '29602';

-- Add Lok'lira the Crone
DELETE FROM creature WHERE id = 29975;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(29975, 571, 1, 1, 0, 0, 6921.87, -1534.93, 835.971, 4.78489, 300, 0, 0, 12175, 0, 0, 0, 0, 0);

-- Cold Hearted --
-- Summon Freed Proto Drake
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=29708;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(29708,55028,12856,1,12856,1,0,0,0);
-- Spells Free Proto Drake
UPDATE `creature_template` SET `spell1` = '55046' WHERE `entry`=29709;
-- set inhabit type to 4, so he can fly
UPDATE `creature_template` SET  `InhabitType` =  '4' WHERE  `creature_template`.`entry` =29709;
-- Add flight aura, so he can fly
DELETE FROM `creature_template_addon` WHERE `entry`=29709;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('29709', '0', '0', '0', '0', '0', '61307');
-- set speed to 1 so it does not stack with flight aura
UPDATE `creature_template` SET  `speed_walk` =  '1',`speed_run` =  '1' WHERE  `creature_template`.`entry` =29709;
-- Set extra_flags to CREATURE_FLAG_EXTRA_CIVILIAN to Brunnhildar Prisoner, so the frost giants can't kill them while frozen
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`=29639;
-- Set Friendly Faction on Brunnhildar Prisoner
UPDATE `creature_template` SET `faction_A`='35',`faction_H`='35' WHERE `entry`=29639;

-- Add Spawn Fjorn's Anvil
DELETE FROM `gameobject` WHERE `id` = '192060';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(192060, 571, 1, 1, 7219.79, -3644.76, 822.636, 1.80599, 0, 0, 0.785184, 0.619263, 300, 0, 1);