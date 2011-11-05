-- Fix quest loot (unique-looted) for quest #13654
UPDATE creature_template SET lootid=33499 WHERE entry=33499;
DELETE FROM creature_loot_template WHERE entry=33499;
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(33499, 45080, -100, 1, 0, 1, 1);