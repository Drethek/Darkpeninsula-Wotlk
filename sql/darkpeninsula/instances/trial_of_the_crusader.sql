DELETE FROM `spell_script_names` WHERE `spell_id` IN (67590,67602,67603,67604,68576,66316,67100,67101,67102,66149,68396,65684,67176,67177,67178,);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(66316, 'spell_spinning_pain_strike'),
(67100, 'spell_spinning_pain_strike'),
(67101, 'spell_spinning_pain_strike'),
(67102, 'spell_spinning_pain_strike');

UPDATE `creature_template` SET `VehicleId` = 442 WHERE  `entry` IN (34796,35438,35439,35440);

UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN(34796, 35144, 34799, 34797,35438, 35439, 35440, 35447, 35448, 35449, 35514, 35515, 35516,35511, 35512, 35513);
UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN(34780, 35216, 35268, 35269);
UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN(34496, 35347, 35348, 35349, 34497, 35350, 35351, 35352);
UPDATE creature_template SET mechanic_immune_mask = 8388624   WHERE entry IN(34607, 34648, 35655, 35656);
UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN(34564, 34566, 35615, 35616);
UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN(34813,35265,35266,35267,34825,35278,35279,35280);

UPDATE `creature_template` SET `scriptname`='npc_tirion_toc' WHERE `entry` = 34996;
UPDATE `creature_template` SET `scriptname`='npc_garrosh_toc' WHERE `entry` = 34995;
UPDATE `creature_template` SET `scriptname`='npc_varian_toc' WHERE `entry` = 34990;
UPDATE `creature_template` SET `scriptname`='mob_bullet_controller' WHERE `entry` = 34743;

DELETE FROM `spell_target_position` WHERE `id`=71512;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES 
(71512,571,5804.15,624.77,647.77,1.64);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 34796;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(34796, 34800, 0, 1, 'Gormok the Impaler', 5, 0),
(34796, 34800, 1, 1, 'Gormok the Impaler', 5, 0),
(34796, 34800, 2, 1, 'Gormok the Impaler', 5, 0),
(34796, 34800, 3, 1, 'Gormok the Impaler', 5, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 35438;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(35438, 35441, 0, 1, 'Gormok the Impaler', 5, 0),
(35438, 35441, 1, 1, 'Gormok the Impaler', 5, 0),
(35438, 35441, 2, 1, 'Gormok the Impaler', 5, 0),
(35438, 35441, 3, 1, 'Gormok the Impaler', 5, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 35439;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(35439, 35442, 0, 1, 'Gormok the Impaler', 5, 0),
(35439, 35442, 1, 1, 'Gormok the Impaler', 5, 0),
(35439, 35442, 2, 1, 'Gormok the Impaler', 5, 0),
(35439, 35442, 3, 1, 'Gormok the Impaler', 5, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 35440;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(35440, 35443, 0, 1, 'Gormok the Impaler', 5, 0),
(35440, 35443, 1, 1, 'Gormok the Impaler', 5, 0),
(35440, 35443, 2, 1, 'Gormok the Impaler', 5, 0),
(35440, 35443, 3, 1, 'Gormok the Impaler', 5, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34796,35438,35439,35440);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(34796,46598,0,0,0,0,0,0,0),
(35438,46598,0,0,0,0,0,0,0),
(35439,46598,0,0,0,0,0,0,0),
(35440,46598,0,0,0,0,0,0,0);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`IN (66948);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(66948, 66324, 2, 'Submerge Visual');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 67864;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 67864, 0, 18, 1, 17965, 0, 0, '', 'Wilfred Open Portal Target');

-- Fix Mariel's Sorrow Loot Chance on TOC Heroic (thanks to Vika)
UPDATE gameobject_loot_template SET ChanceOrQuestChance=13 WHERE entry=27416 AND item=47509;

-- Temp Fix Jaraxxus
UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` IN (34780,35216,35268,35269);

UPDATE `creature_template` SET `modelid1` = '20024' WHERE `entry` =17965;
UPDATE `creature_template` SET `modelid1` = '29890',`modelid2` = '29890' WHERE `entry` =35651;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`IN (67864);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(67864, 68424, 1, 'Wilfred Portal');
