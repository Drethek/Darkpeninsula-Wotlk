-- ###############
-- Immunity Masks#
-- ###############

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`
|1 -- CHARM
|2 -- DISORIENTED
|4 -- DISARM
|8 -- DISTRACT
|16 -- FEAR
|32 -- GRIP
|64 -- ROOT
|128 -- PACIFY
|256 -- SILENCE
|512 -- SLEEP
|1024 -- SNARE
|2048 -- STUN
|4096 -- FREEZE
|8192 -- KNOCKOUT
|65536 -- POLYMORPH
|131072 -- BANISH
|524288 -- SHACKLE
|4194304 -- TURN
|8388608 -- HORROR
|67108864 -- DAZE
|536870912 -- SAPPED
WHERE `entry` IN
(36789, 38174,37534, 38219,37533, 38220);

-- ##############
-- Trash EventAI#
-- ##############

-- Cleanup
DELETE FROM creature_ai_scripts WHERE creature_id IN (
37007, 38031, -- Deathbound Ward
37011, 38061, -- The Damned
36724, 38057, -- Servant of the Throne
36725, 38058, -- Nerub'ar Broodkeeper
37012, 38059  -- Acient Skeletal Soldier
);

INSERT INTO creature_ai_scripts 
(id, creature_id, event_type, event_flags, event_param1, event_param2, event_param3, event_param4,
action1_type, action1_param1, action1_param2, action1_param3, comment) VALUES
-- (3803101, 38031, 0, -->4<--, 6000, 10000, 8000, 10000, 11, 71022, 1, 1, "Deathbound Ward 25N - Cast Disrupting Shout"),
-- (3803102, 38031, 0, -->4<--, 3000, 5000, 5000, 10000, 11, 71021, 1, 1, "Deathbound Ward 25N - Cast Saber Lash"),

(3700701, 37007, 0, 7, 3000, 5000, 12000, 15000, 11, 71022, 1, 1, "Deathbound Ward - Cast Disrupting Shout"),
(3700702, 37007, 0, 7, 5000, 10000, 6000, 12000, 11, 71021, 4, 1, "Deathbound Ward - Cast Saber Lash"),

(3701101, 37011, 0, 6, 1000, 5000, 8000, 15000, 11, 70960, 0, 1, "The Damned - Cast Bone Flurry"), 
(3701102, 37011, 6, 6, 0, 0, 0, 0, 11, 70961, 1, 1, "The Damned - Cast Shattered Bones"),

-- (7102901, 71029, 0, 7, 4000, 6000, 12000, 15000, 11, 71029, 1, 1, "Servant of the Throne - Cast Glacial Blast"),

(3672501, 36725, 0, 7, 20000, 22000, 30000, 40000, 11, 70965, 1, 1, "Nerub'ar Broodkeeper - Cast Crypt Scarabs"),
(3672502, 36725, 0, 7, 15000, 20000, 25000, 30000, 11, 71020, 0, 1, "Nerub'ar Broodkeeper - Cast Dark Mending"),
(3672503, 36725, 0, 7, 5000, 50000, 10000, 15000, 11, 70965, 1, 1, "Nerub'ar Broodkeeper - Cast Web Wrap"),

(3701201, 37012, 0, 7, 2000, 8000, 8000, 10000, 11, 70964, 4, 1, "Acient Skeletal Soldier - Cast Shield Bash"); 

UPDATE creature_template SET AIname="EventAI" WHERE entry IN (
37007, -- Deathbound Ward
37011, -- The Damned
36724, -- Servant of the Throne
36725, -- Nerub'ar Broodkeeper
37012  -- Acient Skeletal Soldier
);

-- Spawn Skybreaker Lieutenant in 10 man normal
DELETE FROM creature where id=38492;
INSERT INTO creature
(id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(38492,631,1,1,0,2445,-554.687,2204.44,199.91,2.59399,300,0,0,18900,0,0,0,0,0);

-- Cache of the Dreamwalker
UPDATE gameobject_template SET data13='1' WHERE entry IN (201959,202338,202339,202340);

-- ###########
-- Lich King #
-- ###########

-- Lich King Plataform Entities Spawn Relocation
UPDATE `creature` SET `position_z` = 1064.96, `orientation` = 0.120937 WHERE `id` = 36597;
UPDATE `creature` SET `position_z` = 1040.94, `orientation` = 3.14159 WHERE `id` = 38995;
UPDATE `gameobject` SET `position_z` = 1036.61, `rotation0` = 7.7568, `rotation3` = 0, `animprogress` = 100 WHERE `id` = 202161;
UPDATE `gameobject` SET `position_z` = 1036.61, `rotation0` = 5.855, `animprogress` = 100 WHERE `id` = 202078;
UPDATE `gameobject` SET `position_z` = 1040.52, `animprogress` = 100 WHERE `id` = 202190;
UPDATE `gameobject` SET `position_z` = 1040.86, `animprogress` = 100 WHERE `id` IN (202144, 202141, 202142);
UPDATE `gameobject` SET `position_z` = 1058.68, `animprogress` = 100 WHERE `id` = 202437;
UPDATE `gameobject` SET `position_z` = 1064.89, `animprogress` = 100 WHERE `id` = 202436;
UPDATE `spell_target_position` SET `target_position_z` =1040.859985 WHERE `id` = 70860;

-- Achievement criteria for The Lich King
-- The Frozen Throne (10 player) 
-- The Frozen Throne (25 player)
-- Bane of the Fallen King (10 player heroic)
-- The Light of Dawn (25 player heroic) 
-- Realm First! Fall of the Lich King (25 player heroic) 
DELETE FROM `achievement_criteria_data` where `criteria_id` IN (12764,12909,12825,12826,12818);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(12764, 12, 0, 0, ''),
(12909, 12, 1, 0, ''),
(12825, 12, 2, 0, ''),
(12826, 12, 3, 0, ''),
(12818, 12, 3, 0, '');

-- Additional Lich King Script Data
DELETE FROM `spell_linked_spell` WHERE `comment` IN ('The Lich King: Necrotic plague initial cast', 'The Lich King: Necrotic plague immun', 'The Lich King: Necrotic jump', 'The Lich King: Raging Spirit', 'The Licg King: Plague Siphon');
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-70337,70338,0, 'The Lich King: Necrotic plague initial cast'),
(-70337,72846,0, 'The Lich King: Necrotic plague immun'),
(-70338,70338,0, 'The Lich King: Necrotic jump'),
(-69200,69201,0, 'The Lich King: Raging Spirit'),
(-70338,74074,0, 'The Licg King: Plague Siphon');

DELETE FROM `conditions` WHERE `Comment`='The Lich King - Plague Siphon';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,74074,0,18,1,36597,0,0, '', 'The Lich King - Plague Siphon');

DELETE FROM `spell_scripts`WHERE `id`=72429;
INSERT INTO `spell_scripts` VALUE
('72429','0','3','15','72423','0','0','0','0','0','0');

-- Lich King Script Names
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE `entry` = 36597;
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE `entry`= 38995;
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_shadowguard' WHERE `entry` = 36609;
UPDATE `creature_template` SET `ScriptName`='npc_vile_spirit' WHERE `entry`= 37799;
UPDATE `creature_template` SET `ScriptName`='npc_shadow_trap', faction_A = '14', faction_H = '14' WHERE `entry`= 39137;

-- Spell Script Names
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_lich_king_necrotic_plague', 'spell_lich_king_infection', 'spell_lich_king_valkyr_summon', 'spell_lich_king_winter', 'spell_vile_spirit_distance_check', 'spell_ice_burst_distance_check', 'spell_lich_king_quake', 'spell_lich_king_play_movie', 'spell_valkyr_carry_can_cast', 'spell_valkyr_target_search', 'spell_vile_spirit_target_search');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(70338,'spell_lich_king_necrotic_plague'),
(73785,'spell_lich_king_necrotic_plague'),
(73786,'spell_lich_king_necrotic_plague'),
(73787,'spell_lich_king_necrotic_plague'),
(70541,'spell_lich_king_infection'),
(73779,'spell_lich_king_infection'),
(73780,'spell_lich_king_infection'),
(73781,'spell_lich_king_infection'),
(74361,'spell_lich_king_valkyr_summon'),
(72259,'spell_lich_king_winter'),
(74273,'spell_lich_king_winter'),
(74274,'spell_lich_king_winter'),
(74275,'spell_lich_king_winter'),
(70534,'spell_vile_spirit_distance_check'),
(69110,'spell_ice_burst_distance_check'),
(72262,'spell_lich_king_quake'),
(73159,'spell_lich_king_play_movie'),
(74506,'spell_valkyr_carry_can_cast'),
(69030,'spell_valkyr_target_search'),
(70501,'spell_vile_spirit_target_search');

-- Creature Templates Lich King Script
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 36609;
UPDATE `creature_template` SET `vehicleid` = 533 WHERE `entry` IN (36609, 39120, 39121, 39122);
UPDATE `creature` SET `position_z` = 1040 WHERE `id` = 22515 AND `map` = 631;
UPDATE `creature_template` SET `modelid1` = 11686 WHERE `entry` IN (36633, 39305, 39306, 39307);
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` = 15214;
UPDATE `creature` SET `id` = 36823, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86812;
UPDATE `creature` SET `id` = 36824, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86813;
UPDATE `creature_template` SET `dmg_multiplier` = 52 WHERE `entry` = 36824;
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` = 36823;
-- Fix for Startup Errors
UPDATE `creature` SET `MovementType` = 0 WHERE `id` = 32865;

-- Lich King Additional Script Names
UPDATE `creature_template` SET `ScriptName` = 'npc_shambling_horror' WHERE `entry` = 37698;
UPDATE `creature_template` SET `ScriptName` = 'npc_raging_spirit' WHERE `entry` = 36701;
UPDATE `creature_template` SET `ScriptName` = 'npc_ice_sphere' WHERE `entry` = 36633;
UPDATE `creature_template` SET `ScriptName` = 'npc_defile' WHERE `entry` = 38757;
UPDATE `creature_template` SET `ScriptName` = 'npc_terenas_menethil' WHERE `entry` = 36823;
UPDATE `creature_template` SET `ScriptName` = 'npc_spirit_warden' WHERE `entry` = 36824;

-- Lich King Additional Spell Script Names
DELETE FROM `spell_script_names` WHERE `spell_id` = 68765;
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_lich_king_defile', 'spell_lich_king_tirion_mass_resurrection', 'spell_lich_king_pain_and_suffering', 'spell_valkyr_eject_passenger', 'spell_lich_king_pain_and_suffering_effect', 'spell_lich_king_vile_spirit_summon', 'spell_lich_king_vile_spirit_summon_visual', 'spell_lich_king_harvest_soul');
INSERT INTO `spell_script_names` VALUES
(72743, 'spell_lich_king_defile'),
(72429, 'spell_lich_king_tirion_mass_resurrection'),
(74115, 'spell_lich_king_pain_and_suffering'),
(68576, 'spell_valkyr_eject_passenger'),
(72133, 'spell_lich_king_pain_and_suffering_effect'),
(73789, 'spell_lich_king_pain_and_suffering_effect'),
(73788, 'spell_lich_king_pain_and_suffering_effect'),
(73790, 'spell_lich_king_pain_and_suffering_effect'),
(70498, 'spell_lich_king_vile_spirit_summon'),
(70500, 'spell_lich_king_vile_spirit_summon_visual'),
(68980, 'spell_lich_king_harvest_soul'),
(74296, 'spell_lich_king_harvest_soul'),
(74297, 'spell_lich_king_harvest_soul'),
(74325, 'spell_lich_king_harvest_soul');

-- Lich King Script Texts
DELETE FROM `script_texts` where `entry` IN (-1810001,-1810002,-1810003,-1810004,-1810005,-1810006,-1810007,-1810008,-1810009,-1810010,-1810011,-1810012,-1810013,-1810014,-1810015,-1810016,-1810017,-1810018,-1810019,-1810020,-1810021,-1810022,-1810023,-1810024,-1810025,-1810026,-1810027,-1810028,-1810029,-1810030,-1810031,-1810032);
INSERT INTO script_texts (npc_entry,entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(36597,-1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',null,null,null,null,null,null,null,null,17349,1,0,0,''),
(38995,-1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',null,null,null,null,null,null,null,null,17390,1,0,0,''),
(36597,-1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.',null,null,null,null,null,null,null,null,17350,1,0,0,''),
(38995,-1810004, 'So be it. Champions, attack!',null,null,null,null,null,null,null,null,17391,1,0,0,''),
(36597,-1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',null,null,null,null,null,null,null,null,17351,1,0,0,''),
(38995,-1810006, 'Come then champions, feed me your rage!',null,null,null,null,null,null,null,null,17352,1,0,0,''),
(36597,-1810007, 'I will freeze you from within until all that remains is an icy husk!',null,null,null,null,null,null,null,null,17369,1,0,0,''),
(36597,-1810008, 'Apocalypse!',null,null,null,null,null,null,null,null,17371,1,0,0,''),
(36597,-1810009, 'Bow down before your lord and master!',null,null,null,null,null,null,null,null,17372,1,0,0,''),
(36597,-1810010, 'Hope wanes!',null,null,null,null,null,null,null,null,17363,1,0,0,''),
(36597,-1810011, 'The end has come!',null,null,null,null,null,null,null,null,17364,1,0,0,''),
(36597,-1810012, 'Face now your tragic end!',null,null,null,null,null,null,null,null,17365,1,0,0,''),
(36597,-1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.',null,null,null,null,null,null,null,null,17353,1,0,0,''),
(36597,-1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',null,null,null,null,null,null,null,null,17355,1,0,0,''),
(36597,-1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',null,null,null,null,null,null,null,null,17356,1,0,0,''),
(36597,-1810016, 'I delight in the irony.',null,null,null,null,null,null,null,null,17357,1,0,0,''),
(38995,-1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',null,null,null,null,null,null,null,null,17392,1,0,0,''),
(36597,-1810018, 'Impossible...',null,null,null,null,null,null,null,null,17358,1,0,0,''),
(38995,-1810020, 'No more, Arthas! No more lives will be consumed by your hatred!',null,null,null,null,null,null,null,null,17393,1,0,0,''),
(38579,-1810021, 'Free at last! It is over, my son. This is the moment of reckoning.',null,null,null,null,null,null,null,null,17397,1,0,0,''),
(38995,-1810022, 'The Lich King must fall!',null,null,null,null,null,null,null,null,17389,1,0,0,''),
(38579,-1810023, 'Rise up, champions of the Light!',null,null,null,null,null,null,null,null,17398,1,0,0,''),
(36597,-1810024, 'Now I stand, the lion before the lambs... and they do not fear.',null,null,null,null,null,null,null,null,17361,1,0,0,''),
(36597,-1810025, 'They cannot fear.',null,null,null,null,null,null,null,null,17362,1,0,0,''),
(0,-1810026, 'Argh... Frostmourne, obey me!',null,null,null,null,null,null,null,null,17367,1,0,0,''),
(36597,-1810027, 'Frostmourne hungers...',null,null,null,null,null,null,null,null,17366,1,0,0,''),
(0,-1810028, 'Frostmourne feeds on the soul of your fallen ally!',null,null,null,null,null,null,null,null,17368,1,0,0,''),
(36597,-1810029, 'Val''kyr, your master calls!',null,null,null,null,null,null,null,null,17373,1,0,0,''),
(36597,-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(36597,-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,''),
(36597,-1810032, 'The Lich King begins to cast Defile',null,null,null,null,null,null,null,null,0,3,0,0,'');

-- The Lich King
DELETE FROM  script_texts WHERE entry BETWEEN -1810001 AND -1810032;
UPDATE `creature_template` SET `exp` = 2, `faction_A` = 974, `faction_H` = 974, `speed_walk` = 2, `speed_run` = 1.71429, `unit_flags` = 768, `mechanic_immune_mask` = 667631615 WHERE `entry` IN (36597, 39166, 39167, 39168);
UPDATE `creature_template` SET `mindmg` = 351, `maxdmg` = 526, `attackpower` = 132, `dmg_multiplier` = 133.4, `rangeattacktime` = 1500, `minrangedmg` = 281, `maxrangedmg` = 421, `rangedattackpower` = 106 WHERE `entry` = 36597;
UPDATE `creature_template` SET `mindmg` = 468, `maxdmg` = 702, `attackpower` = 175, `dmg_multiplier` = 150, `minrangedmg` = 374, `maxrangedmg` = 562, `rangedattackpower` = 140 WHERE `entry` IN (39166, 39167, 39168);
-- Tirion Fordring
UPDATE `creature_template` SET `exp` = 2, `mindmg` = 468, `maxdmg` = 702, `attackpower` = 175, `dmg_multiplier` = 47.2, `rangeattacktime` = 2000, `unit_class` = 2, `minrangedmg` = 374, `maxrangedmg` = 562, `rangedattackpower` = 140, `mechanic_immune_mask` = 12584976 WHERE `entry` = 38995;
-- Val'kyr Shadowguard
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 2, `speed_run` = 1.71429, `mindmg` = 318, `maxdmg` = 478, `attackpower` = 119, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_class` = 8, `unit_flags` = 33554944, `dynamicflags` = 8, `minrangedmg` = 254, `maxrangedmg` = 382, `rangedattackpower` = 95, `mechanic_immune_mask` = 12584976 WHERE `entry` IN (36609, 39120, 39121, 39122);
-- Vile Spirit
UPDATE `creature_template` SET `mindmg` = 391, `maxdmg` = 585, `attackpower` = 146, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_class` = 2, `dynamicflags` = 8, `minrangedmg` = 313, `maxrangedmg` = 468, `rangedattackpower` = 117 WHERE `entry` IN (37799, 39284, 39285, 39286);
-- Shambling Horror
UPDATE `creature_template` SET `mindmg` = 468, `maxdmg` = 702, `attackpower` = 175, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `dynamicflags` = 8, `minrangedmg` = 313, `maxrangedmg` = 562, `rangedattackpower` = 140 WHERE `entry` IN (37698, 39299, 39300, 39301);
UPDATE `creature_template` SET `dmg_multiplier` = 47.2 WHERE `entry` = 37698;
UPDATE `creature_template` SET `dmg_multiplier` = 70.8 WHERE `entry` = 39299;
UPDATE `creature_template` SET `dmg_multiplier` = 70.8 WHERE `entry` = 39300;
UPDATE `creature_template` SET `dmg_multiplier` = 94.4 WHERE `entry` = 39301;
-- Raging Spirit
UPDATE `creature_template` SET `difficulty_entry_1` = 39302 WHERE `entry` = 36701;
UPDATE `creature_template` SET `difficulty_entry_2` = 39303 WHERE `entry` = 36701;
UPDATE `creature_template` SET `difficulty_entry_3` = 39304 WHERE `entry` = 36701;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 2, `speed_run` = 1.42857, `mindmg` = 468, `maxdmg` = 702, `attackpower` = 175, `dmg_multiplier` = 47.2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `dynamicflags` = 8, `minrangedmg` = 374, `maxrangedmg` = 562, `rangedattackpower` = 140, `mechanic_immune_mask` = 12584976 WHERE `entry` IN (36701, 39302, 39303, 39304);
-- Ice Sphere
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 1.2, `speed_run` = 0.428571, `mindmg` = 468, `maxdmg` = 702, `attackpower` = 175, `dmg_multiplier` = 47.2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `dynamicflags` = 8, `minrangedmg` = 374, `maxrangedmg` = 562, `rangedattackpower` = 140, `mechanic_immune_mask` = 12584976 WHERE `entry` IN (36633, 39305, 39306, 39307);
-- Defile
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 1.2, `speed_run` = 0.428571, `mindmg` = 436, `maxdmg` = 654, `attackpower` = 163, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_flags` = 33554944, `minrangedmg` = 349, `maxrangedmg` = 523, `rangedattackpower` = 130, `mechanic_immune_mask` = 12584976 WHERE `entry` = 38757;
-- Spirit Warden
UPDATE `creature_template` SET `difficulty_entry_1` = 39296 WHERE `entry` = 36824;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `exp` = 2, `faction_A` = 14, `faction_H` = 14, `speed_walk` = 1, `speed_run` = 1.14286, `mindmg` = 420, `maxdmg` = 630, `attackpower` = 157, `dmg_multiplier` = 2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `dynamicflags` = 8, `minrangedmg` = 336, `maxrangedmg` = 504, `rangedattackpower` = 126 WHERE `entry` IN (36824, 39296);
-- Terenas Menethil
UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 1.14286, `mindmg` = 391, `maxdmg` = 585, `attackpower` = 146, `dmg_multiplier` = 2.2, `baseattacktime` = 2000, `rangeattacktime` = 2000, `minrangedmg` = 313, `maxrangedmg` = 468, `rangedattackpower` = 117 WHERE `entry` IN (36824, 39296);

-- Stats for broken frostmourne
DELETE FROM `item_template` WHERE (`entry`=50840);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `unk0`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `WDBVerified`) VALUES 
(50840, 2, 7, -1, 'Monster - Frostmourne, Broken (Arthas Only Special)', 64086, 4, 0, 0, 1, 0, 0, 17, -1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 4, 4, 14, 3, 20, 7, 10, 14, 20, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 20, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhanler', 0, 0, 0, 0, 1);

-- FoF SpellScript
DELETE FROM `spell_script_names` WHERE (`spell_id` = 72350);
INSERT INTO `spell_script_names` VALUES
(72350, 'spell_lich_king_fury_of_frostmourne');

-- Lich King: Soul Barrage should make him fly for outro
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger` = 72305);
INSERT INTO `spell_linked_spell` VALUES
(72305, 34873, 2, 'Soul Barrage linked to Fly');

-- Fix Quake Visual (DO NOT EXECUTE MORE THAN ONCE!!!)
UPDATE creature SET position_z = position_z + 1 WHERE id = 22515 AND map = 631;
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) values(13, 0, 72262, 0, 18, 1, 22515, 0, 0,'','Quake visual');

-- Spawn Artas Platform
DELETE FROM `gameobject` WHERE `id` = '202161' AND `map` = '631';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(202161, 631, 15, 1, 503.62, -2124.66, 1036.61, 3.14159, 7.7568, 0, 0, 0, 604800, 100, 1);

-- Spawn Spirit Warden and Terenas Menethil
DELETE FROM `creature` WHERE `id` = '36823' AND `map` = '631';
DELETE FROM `creature` WHERE `id` = '36824' AND `map` = '631';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(36823, 631, 15, 1, 0, 0, 495, -2502, 1050, 5.49385, 300, 0, 0, 315000, 59910, 0, 0, 0, 0),
(36824, 631, 15, 1, 0, 0, 495, -2546, 1050.23, 1.72709, 300, 0, 0, 252000, 0, 0, 0, 0, 0);

-- Valkyre
UPDATE creature_template SET unit_flags=512 WHERE entry IN (36609,39120,39121,39122);
UPDATE creature_template SET mechanic_immune_mask=2 WHERE entry IN (36609,39120,39121,39122);
UPDATE creature_template SET speed_walk=1.2 WHERE entry IN (36609,39120,39121,39122);

-- Update Risen Archmage Position
UPDATE `creature` SET `position_x` = 4183.32,`position_y` = 2465.11,`position_z` = 364.87, `orientation` = 0.758864 WHERE `guid` = 137748 AND `id` = 37868;
UPDATE `creature` SET `position_x` = 4224.26,`position_y` = 2466.19,`position_z` = 364.869,`orientation` = 2.30454  WHERE `guid` = 137749 AND `id` = 37868;
UPDATE `creature` SET `position_x` = 4226.3, `position_y` = 2502.22,`position_z` = 364.877,`orientation` = 3.67663  WHERE `guid` = 137750 AND `id` = 37868;
UPDATE `creature` SET `position_x` = 4183.01,`position_y` = 2503.93,`position_z` = 364.877,`orientation` = 5.56943  WHERE `guid` = 137751 AND `id` = 37868;

-- Set Correct creature_ai_scripts
UPDATE creature_ai_scripts SET creature_id=36724 WHERE id=7102901;