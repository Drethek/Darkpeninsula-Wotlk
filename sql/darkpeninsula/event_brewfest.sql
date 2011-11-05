-- #####################
-- #Brewfest Implements#
-- #####################


--
-- 	QUESTS
--

-- skip some bugged quests
UPDATE quest_template SET Method=0 /*restore 2 when fixed*/ WHERE entry IN 
(11318, -- Now this is ram racing...almost (A)
11409, -- Now this is ram racing...almost (H)
11122, -- There and Back Again (A)
11412, -- There and Back Again (H)
12022, -- Chug and Chuck! (A)
12191, -- Chug and Chuck! (H)
11407, -- Bark for Drohn's Distillery! (H) [DAILY] 
11408, -- Bark for T'chali's Voodoo Brewery! (H) [DAILY] 
11293, -- Bark for the Barleybrews! (A) [DAILY] 
11294); -- Bark for the Thunderbrews! (A) [DAILY] 

-- Fix redeem for ally quest "Say, There Wouldn't Happen to be a Souvenir This Year, Would There?"
DELETE FROM creature_involvedrelation WHERE quest=12193;
INSERT INTO creature_involvedrelation VALUES (23710, 12193);

-- Fix redeem for horde quest "Another year, another souvenir"
UPDATE creature_involvedrelation SET id=24495 WHERE quest=13931 LIMIT 1;

-- [H] "Say, There Wouldn't Happen to be a Souvenir This Year, Would There?" -- fix relations
DELETE FROM creature_questrelation WHERE quest=12194;
DELETE FROM creature_involvedrelation WHERE quest=12194;
INSERT INTO creature_questrelation VALUES (24510, 12194);
INSERT INTO creature_involvedrelation VALUES (24495, 12194);

-- [A/H] "Catch the wild Wolpertinger!"
SET @ENTRY := 23487;
SET @SPELL_NET := 41621;
SET @SPELL_CREATE_ITEM := 41622;
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=512 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,
`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,
`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,
`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,@SPELL_NET,0,0,0,11,@SPELL_CREATE_ITEM,2,0,0,0,0,7,0,0,0,0,0,0,0,"Wild Wolpertinger - On Spellhit - Cast Create Stunned Wolpertinger Item"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wild Wolpertinger - On Spellhit - Forced Despawn");
-- Fix relations: Ally version is already OK, there's no need to do this for it
DELETE FROM `creature_involvedrelation` WHERE `id`=24657 AND `quest`=11431;
INSERT INTO `creature_involvedrelation` (`id`,`quest`) VALUES (24657,11431);
DELETE FROM `creature_questrelation` WHERE `id`=24657 AND `quest`=11431;
INSERT INTO `creature_questrelation` (`id`,`quest`) VALUES (24657,11431);

-- [A/H] Chug and Chuck
-- Self-Turning and Oscillating Utility Target SAI
SET @ENTRY := 24108;
SET @SPELL_THROW_MUG := 42300;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,
`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,
`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,
`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,
`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,@SPELL_THROW_MUG,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,
"Self-Turning and Oscillating Utility Target - On Spellhit - Quest Credit");


-- Send a mail on quest complete "Brew of the Month Club" - (need core script to send it every month)
-- Alliance quest missed quest texts
SET @MAIL_A := 209;
SET @MAIL_H := 210;
UPDATE `quest_template` SET `RewMailTemplateId`=@MAIL_A,`OfferRewardText`="Your paperwork looks to be in order. Welcome to the club, $N!$B$BYou can expect to get our mail at the start of every month. If you like what you got, stop by and we can sell you some more. This is the club that keeps on giving.",
`RequestItemsText`="Do you have your membership forms filled out?" WHERE `entry`=12420;
UPDATE `quest_template` SET `RewMailTemplateId`=@MAIL_H WHERE `entry`=12306; -- 12420


-- [A/H] Save Brewfest!
-- fix relations
DELETE FROM creature_questrelation WHERE quest=12318;
INSERT INTO creature_questrelation VALUES
(27584,12318), -- A: Darna Honeybock
(28329,12318); -- H: Slurpo Fizzykeg
DELETE FROM creature_involvedrelation WHERE quest=12318;
INSERT INTO creature_involvedrelation VALUES
(26719,12318); -- A/H: Brewfest Spy
UPDATE quest_template SET nextquestid=0, ExclusiveGroup=0 WHERE entry IN (11446, 11447);
UPDATE quest_template SET nextquestid=12318, ExclusiveGroup=11442 WHERE entry IN (11442, 11447);
-- update horde npcflag -> questgiver
UPDATE creature_template SET npcflag=2 WHERE entry=28329;


-- [A/H] "This One Time, When I Was Drunk..." (need a lot of scripting !!)
UPDATE quest_template SET NextQuestId=12192 WHERE entry=12191; 
UPDATE quest_template SET PrevQuestId=12191 WHERE entry=12192;
UPDATE quest_template SET NextQuestId=12020 WHERE entry=12022;
UPDATE quest_template SET PrevQuestId=12022 WHERE entry=12020;
--hack-fix for now: the object is already spawned on the ground
DELETE FROM game_event_gameobject WHERE guid IN (SELECT guid FROM gameobject WHERE id=189989);
DELETE FROM gameobject WHERE id=189989;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation,
 rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(189990, 1, 1, 1, 1203.66, -4273.23, 21.197, 1.72651, 0, 0, 0.759962, 0.649968, 300, 0, 1),  -- (H)
(189990, 0, 1, 1, -5145.76, -620.814, 397.893, 2.65623, 0, 0, 0.970697, 0.240308, 300, 0, 1); -- (A)
SET @GUID_H := (SELECT min(guid) FROM gameobject WHERE id=189990);
SET @GUID_A := (SELECT max(guid) FROM gameobject WHERE id=189990);
DELETE FROM game_event_gameobject WHERE guid IN (@GUID_H, @GUID_A);
INSERT INTO game_event_gameobject VALUES (24, @GUID_H), (24, @GUID_A);

-- [A/H] Insult Coren Direbrew!
UPDATE quest_template SET CompleteScript=0 WHERE entry=12062;
DELETE FROM quest_end_scripts WHERE id=12062;
/* -- HACKFIX: >> DELETE WHEN COREN FACTION CHANGING IS FIXED <<
UPDATE quest_template SET CompleteScript=12062 where entry=12062;
DELETE FROM quest_end_scripts WHERE id=12062;
INSERT INTO quest_end_scripts(id, delay, command, datalong, datalong2,X, Y, z, o) VALUES
(12062, 5, 10, 26764, 300000, 908.355469, -136.154602, -49.750435, 3.402674), -- summon Ilsa Direbrew <Dark Iron Brewmaiden>
(12062, 5, 10, 26764, 300000, 904.734619, -130.875732, -49.747387, 4.129178), -- summon Ursula Direbrew
(12062, 1, 10, 100007, 300000, 905.882874, -134.991058, -49.750702, 3.763970); -- it should only change Coren faction
-- original position (x,y,z,o): 907.182068, -133.834641, -49.750526, 3.761604
-- make it spawn from "another" npc
DELETE FROM creature_template WHERE entry=100007;
INSERT INTO creature_template
(entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, 
KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, 
gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, 
speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, 
rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, 
trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, 
lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, 
resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, 
mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, 
questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, 
equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified) VALUES
(100007, 0, 0, 0, 0, 0, 21824, 0, 0, 0, "Coren Direbrew", NULL, NULL, 0, 80, 80, 2, 35, 35, 2, 1.1, 1.14286, 
1, 0, 422, 586, 0, 642, 7.5, 1500, 0, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 0, 0, 23872, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "" , 0, 3, 24, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 1);
-- >> END OF HACKFIX << */

--
-- 	NPCs
--

-- fix erroneus NPC left out after the event
SET @GUID := (SELECT guid FROM creature WHERE id=27215 LIMIT 1);
DELETE FROM game_event_creature WHERE eventEntry = 24 AND guid = @GUID;
INSERT INTO game_event_creature VALUES (24, @GUID);


-- Missing spawns
DELETE FROM `creature` WHERE `id` IN (24527,24545,27478,27820,27489,27707) AND `guid` BETWEEN 245270 AND 245276;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(245270,24527,1,1,1,0,0,837.6661,-4508.808,6.14751053,0.401425719,120,0,0,37800,0,0,0,0,0), -- Bok Dropcertain
(245271,24545,530,1,1,0,0,-1882.75891,5575.42041,-12.3448038,4.677482,120,0,0,2215,0,0,0,0,0), -- Thunderbrew "Apprentice"
(245273,27820,0,1,1,0,0,-4845.717773,-861.854248,501.914001,4.389036,120,0,0,2215,0,0,0,0,0), -- Brew Vendor
(245274,27489,1,1,1,0,0,1472.60767,-4209.172,43.2693062,4.43313646,120,0,0,2215,0,0,0,0,0), -- Ray'ma
(245275,27820,1,1,1,0,0,1476.217529,-4209.929199,43.186016,4.034046,120,0,0,2215,0,0,0,0,0), -- Brew Vendor
(245276,27707,1,1,1,0,0,1290.75476,-4430.792,26.9839077,2.14225173,120,0,0,55,0,0,0,0,0); -- Great Brewfest Kodo
-- Make them only spawn during Brewfest
DELETE FROM `game_event_creature` WHERE `eventEntry` IN (24) AND `guid` BETWEEN 245270 AND 245276;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(24,245270),(24,245271),(24,245273),(24,245274),(24,245275),(24,245276);
-- Update "missing spawns" factions -.-
UPDATE creature_template set faction_A=775, faction_H=775 WHERE entry IN (27820);

-- Larkin Thunderbrew <Brew of the Month Club>
DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id=27478);
DELETE FROM creature WHERE id=27478;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
 orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(27478, 0, 1, 1, 0, 356, -4838.72, -877.924, 501.659, 4.99508, 43200, 0, 0, 2215, 0, 0, 0, 0, 0);
SET @GUID := (SELECT guid FROM creature WHERE id=27478);
INSERT INTO game_event_creature VALUES (24, @GUID);


-- Brewfest Spy
DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id=26719);
DELETE FROM creature WHERE id=26719;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
 orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(26719, 230, 1, 1, 0, 0, 887.276, -159.096, -49.7598, 3.32178, 300, 0, 0, 2614, 0, 0, 0, 0, 0);
SET @GUID := (SELECT guid FROM creature WHERE id=26719);
INSERT INTO game_event_creature VALUES (24, @GUID);


-- Darna Honeybock <Brewfest Agent>
DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id=27584);
DELETE FROM creature WHERE id=27584;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
 orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(27584, 0, 1, 1, 0, 0, -5607.34, -458.634, 404.639, 5.13693, 300, 0, 0, 4050, 0, 0, 0, 0, 0);
SET @GUID := (SELECT guid FROM creature WHERE id=27584);
INSERT INTO game_event_creature VALUES (24, @GUID);
DELETE FROM creature_questrelation WHERE id=27584;
INSERT INTO creature_questrelation VALUES (27584, 12318); -- Save Brewfest!

-- Coren Direbrew
UPDATE creature_template SET faction_A=35, faction_H=35, AIName="SmartAI" WHERE entry=23872;
DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id=23872);
DELETE FROM creature WHERE id=23872;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
 orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(23872, 230, 1, 1, 0, 0, 908.401, -132.932, -49.7508, 3.29976, 300, 0, 0, 302400, 0, 0, 0, 0, 0);
SET @GUID := (SELECT guid FROM creature WHERE id=23872);
INSERT INTO game_event_creature VALUES (24, @GUID);
-- Coren's loot
DELETE FROM reference_loot_template WHERE entry=34284;
INSERT INTO reference_loot_template VALUES
(34284, 48663, 0, 1, 1, 1, 1),
(34284, 49074, 0, 1, 1, 1, 1),
(34284, 49076, 0, 1, 1, 1, 1),
(34284, 49078, 0, 1, 1, 1, 1),
(34284, 49080, 0, 1, 1, 1, 1),
(34284, 49116, 0, 1, 1, 1, 1),
(34284, 49118, 0, 1, 1, 1, 1),
(34284, 49120, 0, 1, 1, 1, 1);
DELETE FROM creature_loot_template WHERE entry=23872;
INSERT INTO creature_loot_template VALUES
(23872, 1, 100, 1, 0, -34284, 1),
(23872, 38280, 100, 1, 1, 1, 1),
(23872, 38281, 100, 1, 2, 1, 1),
(23872, 54535, 100, 1, 0, 1, 1); -- should be given by the DF, hackfix (to be deleted)
-- SAI
DELETE FROM creature_text WHERE entry=23872;
INSERT INTO creature_text VALUES
(23872, 0, 0, "What? What did you say? How dare you! 
My beer can stand up to any of that rot they serve at Brewfest! 
You'll pay for this insult, $C!", 12, 0, 100, 5, 0, 0, "Coren Direbrew: on aggro");
DELETE FROM smart_scripts WHERE entryorguid=23872;
INSERT INTO smart_scripts (entryorguid, source_type, id, event_type, event_flags, 
event_param1, event_param2, event_param3, event_param4, action_type,
action_param1, action_param2, action_param3, action_param4, action_param5,
action_param6, target_type, comment ) VALUES
(23872, 0, 0, 20, 0, 12062, 0, 0, 0, 2, 736, 0, 0, 0, 0, 0, 1, "Coren Direbrew - on quest completing - change faction to hostile"),
(23872, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 500, 0, 0, 0, 0, 0, "Coren Direbrew - on aggro - say aggro text"),
(23872, 0, 2, 0, 0, 1000, 2000, 15000, 20000, 11, 47310, 0, 0, 0, 0, 0, 2, "Coren Direbrew - cast Direbrew's Disarm"),
(23872, 0, 3, 2, 1, 0, 50, 0, 50, 12, 26764, 4, 0, 0, 0, 0, 0, "Coren Direbrew - when 50% health - summon Ilsa Direbrew"),
(23872, 0, 4, 2, 1, 0, 50, 0, 50, 12, 26822, 4, 0, 0, 0, 0, 0, "Coren Direbrew - when 50% health - summon Ursula Direbrew");

-- Ilsa Direbrew & Ursula Direbrew SAI
UPDATE creature_template SET faction_A=736, faction_H=736, AIName="SmartAI" WHERE entry IN (26764, 26822);
DELETE FROM smart_scripts WHERE entryorguid IN (26764, 26822);
INSERT INTO smart_scripts (entryorguid, source_type, id, event_type, 
event_param1, event_param2, event_param3, event_param4, action_type,
action_param1, action_param2, action_param3, action_param4, action_param5,
action_param6, target_type, comment ) VALUES
(26764, 0, 0, 0, 1000, 2000, 6000, 12000, 11, 50276, 0, 0, 0, 0, 0, 5, "Ilsa Direbrew - cast Chuck Mug"),
(26822, 0, 0, 0, 3000, 4000, 9000, 20000, 11, 50276, 0, 0, 0, 0, 0, 2, "Ursula Direbrew - cast Chuck Mug"),
(26822, 0, 1, 0, 1000, 2000, 10000, 15000, 11, 47442, 0, 0, 0, 0, 0, 5, "Ursula Direbrew - cast Barreled!");

-- Slurpo Fizzykeg <Brewfest Agent>
DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id=28329);
DELETE FROM creature WHERE id=28329;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z,
 orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(28329, 1, 1, 1, 0, 0, 831.331, -4505.4, 7.06825, 5.44657, 300, 0, 0, 4050, 0, 0, 0, 0, 0);
SET @GUID := (SELECT guid FROM creature WHERE id=28329);
INSERT INTO game_event_creature VALUES (24, @GUID);
--
-- ITEMs
--

-- Insert missing Pint-Sized Pink Pachyderm for 100 tokens
DELETE FROM `npc_vendor` WHERE `item`=46707;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES
(23710,0,46707,0,0,2275), -- Belbi Quikswitch
(27478,0,46707,0,0,2275), -- Larkin Thunderbrew
(24495,0,46707,0,0,2275), -- Blix Fixwidget
(27489,0,46707,0,0,2275); -- Ray'ma


--
-- EVENTs
--

-- ### BREW OF THE MONTH ###

-- The alliance vendors were selling wrong item - Ray'ma already had one but Blix was missing
DELETE FROM `npc_vendor` WHERE `item` IN (37571,37736,37599);
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES
(23710,0,37736,0,0,2276), -- Belbi Quikswitch
(27478,0,37736,0,0,2276), -- Larkin Thunderbrew
(24495,0,37599,0,0,2276); -- Blix Fixwidget
 -- Wild Winter Pilsner
-- Spell Weak Alcohol (42256) should make the ground shake
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-50098,42256) AND `spell_effect` IN (51655,50099);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-50098,50099,0,'Weak Alcohol will now also make the ground shake on removal'),
(42256,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Blackrock Lager
-- Spell Weak Alcohol (42257) should make you puke spit on aura removal
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-49738,42257) AND `spell_effect` IN (51655,49737);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-49738,49737,0,'Weak Alcohol will now also make the player spit fire on removal'),
(42257,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Draenic Pale Ale
-- Spell Weak Alcohol (42264) should make you mount a pink elekk for 30 seconds
-- www.youtube.com/watch?v=StZFzi3lZgo
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (42264) AND `spell_effect` IN (49908,51655);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42264,49908,1,'Weak Alcohol will now also mount the player a pink elekk'),
(42264,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Parading Pink Elekk's invisibility drunk
DELETE FROM `creature_template_addon` WHERE `entry`=27958;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27958,0,0,0,0,'36440');
 -- Metok's Bubble Bock
-- Spell Weak Alcohol (43961) should make you summon a bubble
-- www.youtube.com/watch?v=FMFkuxHcuMg&fmt=22
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (43961) AND `spell_effect` IN (50072,51655);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(43961,50072,1,'Weak Alcohol will now also summon a bubble'),
(43961,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Brew Bubble SAI
SET @ENTRY := 27882;
SET @SPELL_GROW := 49828;
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=33554432 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,7000,0,0,11,@SPELL_GROW,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brew Bubble - Out of Combat - Cast Bubble Build Up"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,89,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brew Bubble - Just Summoned - Set Random Movement");
 -- Izzard's Ever Flavor
-- Spell Weak Alcohol (42255) should make you puke on aura removal
-- www.youtube.com/watch?v=ZsP6UqOZpHU&fmt=22
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-49864,42255) AND `spell_effect` IN (51655,49860);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-49864,49860,0,'Weak Alcohol will now also make the player puke on removal'),
(42255,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Stranglethorn Brew
-- Needs core script I am afraid
-- Spell Weak Alcohol (43959) should make you summon a few jungle gnomes???
-- www.youtube.com/watch?v=Ek0BtY-JBoM
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (43959) AND `spell_effect` IN (51655);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(43959,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Binary Brew
-- Spell Weak Alcohol (42259) should make you summon a bubble
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (42259) AND `spell_effect` IN (50243,51655);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42259,50243,1,'Weak Alcohol will now also cast Teach Language'),
(42259,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');
 -- Bartlett's Bitter Brew
-- Spell Weak Alcohol (42258) should make you puke on aura removal
-- www.youtube.com/watch?v=ZsP6UqOZpHU&fmt=22
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-49869,42258) AND `spell_effect` IN (51655,49867);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-49869,49867,0,'Weak Alcohol will now also make the player puke on removal'),
(42258,51655,1,'Weak Alcohol will now also add an Empty Brew Bottle to the player');