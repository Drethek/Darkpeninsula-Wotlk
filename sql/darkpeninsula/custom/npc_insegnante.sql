-- Creating a custom trainer for ALL ABILITIES in order to support GM Porting system

DELETE FROM creature_template WHERE entry=100003;
INSERT INTO creature_template
(entry, modelid1, NAME, subname, gossip_menu_id, minlevel, maxlevel, faction_A, faction_H, npcflag,
rank, mindmg, maxdmg, attackpower, dmg_multiplier, baseattacktime, unit_class, trainer_type, minrangedmg,
maxrangedmg, rangedattackpower, TYPE, Health_mod, flags_extra) VALUES
(100003, 26779, "L'Insegnante", "DPR Porting", 5271, 76, 76, 35, 35, 81, 1, 85, 112, 206, 2.4, 1500, 1, 2,
58, 86, 20, 7, 7, 2); 

DELETE FROM creature_template_addon WHERE entry=100003;
INSERT INTO creature_template_addon (entry, bytes2) VALUES (100003, 4097);

DELETE FROM npc_trainer WHERE entry=100003;
INSERT INTO npc_trainer (entry, spell, spellcost) VALUES
(100003, 196, 1), -- 1H AXE
(100003, 197, 1), -- 2H AXE
(100003, 264, 1), -- BOW
(100003, 15590, 1), -- FIST WEAPON
(100003, 266, 1), -- GUN
(100003, 198, 1), -- 1H MACE
(100003, 199, 1), -- 2H MACE
(100003, 2567, 1), -- THROWN
(100003, 5011, 1), -- CROSSBOW
(100003, 1180, 1), -- DAGGER
(100003, 200, 1), -- POLEARM
(100003, 227, 1), -- STAFF
(100003, 201, 1), -- 1H SWORD
(100003, 202, 1); -- 2H SWORD