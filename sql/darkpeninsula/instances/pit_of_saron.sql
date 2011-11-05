-- Fix Tyrannus
UPDATE `creature_template` SET `speed_run`=1.857143,`speed_walk`=3.2,`unit_flags`=0x00000040,`faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`equipment_id`=1872 WHERE `entry` IN (36658,36938); -- Scourgelord Tyrannus

-- Lady Sylvanas Windrunner
DELETE FROM `creature` WHERE `id` = '38189';
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`)
VALUES (38189,658,3,1,0,0,1078.66,204.125,628.156,2.99852,300,0,0,6972500,85160,0);

-- Fix go_ball_and_chain GameObject
UPDATE `gameobject_template` SET `ScriptName`='go_ball_and_chain' WHERE `entry` = '201969';

-- Immunity mask and final boss respawn time via DB
UPDATE creature_template SET mechanic_immune_mask=684670975 WHERE entry IN (36658, 36938, 36476, 36477, 37627, 37629, 36494, 37613);
UPDATE creature_template SET rank=3 WHERE entry IN (36658, 36938); /* rank should be setted to 1 (rare) and the respawn time should be handled by the core) */

-- Add Teleport location: "PitOfSaron"
DELETE FROM game_tele WHERE name="PitOfSaron";
INSERT INTO game_tele (position_x, position_y, position_z, orientation, map, name)
VALUES (5598.34, 2015.64, 798.041, 3.81101, 571, "PitOfSaron");

-- Fix loot entries in PoS normal mode
DELETE FROM creature_loot_template WHERE entry=36494 AND item=47241; -- Forgemaster Garfrost, remove emblems in normal run
DELETE FROM creature_loot_template WHERE entry=36476 AND item=47241; -- Ick, remove emblems in normal run
DELETE FROM creature_loot_template WHERE entry=36477 AND item=47241; -- Krick, remove emblems in normal run
DELETE FROM creature_loot_template WHERE entry=36658 AND item=47241; -- Scourgelord Tyrannus, remove emblems in normal run

-- Gorkun Ironskull
DELETE FROM `creature` WHERE `id` = '37592';
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`)
VALUES (37592,658,1,1,0,254,672.888,-164.455,526.857,0.823864,300,0,0,12600,0,0);

-- Tyrannus NPC SpellClick
UPDATE `npc_spellclick_spells` SET `cast_flags`='0' WHERE `npc_entry`= '36661';