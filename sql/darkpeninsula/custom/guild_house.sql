-- ######################## --
-- DPR'S GUILD_HOUSE SYSTEM --
--   Database's implements  --
-- ######################## --


-- STEP1: Inserting Guild Houses teleport locations
DELETE FROM game_tele where name LIKE "Guildhouse%" LIMIT 20;
INSERT INTO game_tele (id, position_x, position_y, position_z, orientation, map, name) VALUES
(1434, -3534.21, 2033.46, 66.5111, 4.20108, 530, "Guildhouse1"),
(1437, -2137.84, 7765.88, 151.073, 5.34642, 530, "Guildhouse2"), 
(1438, 1803.21, 6298.67, 1.91334, 6.11641, 530, "Guildhouse3"), 
(1439, 4176.56, 3536.31, 139.7, 5.11546, 530, "Guildhouse4"), 
(1440, -1120.68, 3077.79, 436.051, 0.633537, 530, "Guildhouse5"), 
(1441, -3762.46, 5056.5, -22, 6.27537, 530, "Guildhouse6"), 
(1442, 572.715, 8842, 29.3725, 5.12423, 530, "Guildhouse7"), 
(1443, -8783.3, -2535.65, 12.3102, 1.92111, 1, "Guildhouse8"), 
(1444, -6345.33, 1801.09, 3.20361, 0.112495, 1, "Guildhouse9"), 
(1445, -4414.37, 3672.73, 1.67336, 3.54952, 1, "Guildhouse10"), 
(1446, -8345.5, -5088.71, 2.57283, 1.49168, 1, "Guildhouse11"), 
(1447, 8020.38, -3917.32, 687.023, 4.66979, 1, "Guildhouse12"), 
(1448, -14809.6, -182.089, 3.52382, 0.15628, 0, "Guildhouse13"), 
(1449, -7044.99, -2989.8, 241.667, 2.19746, 0, "Guildhouse14"), 
(1450, -1081.38, -1518.43, 48.1463, 1.90508, 0, "Guildhouse15"), 
(1451, -344.676, -173.156, 60.0234, 2.3227, 0, "Guildhouse16"), 
(1452, -12116.6, 927.847, 2.46516, 3.7547, 0, "Guildhouse17"), 
(1453, -5704.82, -2005.08, 396.374, 5.86722, 0, "Guildhouse18"), 
(1454, -913.178, -1643.31, 91.7347, 1.82558, 1, "Guildhouse19"), 
(1455, -1543.44, 2021.71, 61.9962, 4.39657, 1, "Guildhouse20");


-- STEP2: creating Porcottero & Porcottera (welcome back boys!)
DELETE FROM creature_template WHERE entry IN (100005, 100006);
INSERT INTO creature_template (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`,
`KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,
`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`,
`scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`,
`unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`,
`minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, 
`resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, 
`spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, 
`MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, 
`questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, 
`flags_extra`, `ScriptName`, `WDBVerified`) 
VALUES
('100006','0','0','0','0','0','18217','0','0','0','Porcottera','DPR Staff','Speak','60000','77','77','2','35','35','1','1',
'1.14286','1','0','76','100','0','184','1','2000','0','2','0','8','0','0','0','0','0','52','76','17','7','0','0','0','0','0',
'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1',
'0','0','2','','1'),
('100005','0','0','0','0','0','17568','0','0','0','Porcottero','DPR Staff','Speak','60000','78','78','2','35','35','1','1',
'1.14286','1','0','76','100','0','184','1','2000','0','2','0','8','0','0','0','0','0','52','76','17','7','0','0','0','0','0',
'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1.2','1','1','0','0','0','0','0','0','0','0','1',
'0','0','2','','1');
-- Insert gossip options (DEMO)
DELETE FROM gossip_menu WHERE entry IN (60000, 60001);
INSERT INTO gossip_menu VALUES 
(60000,600000),
(60001,600001);
DELETE FROM npc_text where id IN (600000, 600001);
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0) VALUES 
(600000,"Salve $N.$B$BLo Staff di DPR ti saluta calorosamente.", "Salve $N.$B$BLo Staff di DPR ti saluta calorosamente.", 0, 1),
(600001,"bella domanda...$B$BSiamo due personaggi che vi guideranno nella creazione della vostra Guild House.$BUlteriori spiegazioni al riguardo vi verranno date in seguito...", "bella domanda...$B$BSiamo due personaggi che vi guideranno nella creazione della vostra Guild House.$BUlteriori spiegazioni al riguardo vi verranno date in seguito...", 0, 1);
DELETE FROM gossip_menu_option where menu_id=60000;
INSERT INTO gossip_menu_option (menu_id, id, option_text, option_id, npc_option_npcflag, action_menu_id) VALUES
(60000, 0, "Come mai sei qui?", 1, 1, 60001);
-- Spawning positions
DELETE FROM creature WHERE id IN (100005, 100006);
INSERT INTO creature (id, map, position_x, position_y, position_z, orientation) VALUES
(100006, 1, 16255.8, 16301.4, 20.8448, 3.05752),
(100006, 571, 5820.75, 537.58, 651.1, 1.97694),
(100006, 0, -8861.54, 680.31, 97.9035, 4.03023),
(100006, 1, 1636.14, -4444.31, 15.6337, 2.77127),
(100005, 1, 16256.4, 16307.8, 20.8448, 3.04966),
(100005, 571, 5823.83, 538.537, 651.102, 2.15365),
(100005, 0, -8862.62, 681.335, 97.9035, 3.89671),
(100005, 1, 1637.01, -4442.96, 15.6337, 2.68722);
