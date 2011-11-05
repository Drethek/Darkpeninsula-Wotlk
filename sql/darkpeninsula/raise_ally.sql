-- Raise Ally
UPDATE `creature_template` SET `spell1` = 62225, `spell2` = 47480, `spell3` = 47481, `spell4` = 47482, `spell5` = 47484, `spell6` = 67866, `ScriptName` = 'npc_risen_ally' WHERE `entry` = 30230;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (46619,61999);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('46619', 'spell_dk_raise_ally_effect');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('61999', 'spell_dk_raise_ally');