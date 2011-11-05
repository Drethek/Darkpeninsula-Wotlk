-- fix faction for NPC Instructor Hroegar
UPDATE creature_template SET faction_A=1885,faction_H=1885 WHERE entry=29915;

-- fix loot
DELETE FROM creature_loot_template WHERE entry=29915;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance) VALUES 
(29915, 33454, 4),
(29915, 33445, 2),
(29915, 33447, 2),
(29915, 33470, 25),
(29915, 41843, -100),
(29915, 43089, -100);


-- Thanks to "Aure" for giving us this fix