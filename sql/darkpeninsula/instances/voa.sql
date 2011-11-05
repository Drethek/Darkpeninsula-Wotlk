-- Fix All VoA Achievement (10/25 Man)

-- Fix Archavon the Stone Watcher 10 Man and 25 Man Achievement
UPDATE `achievement_criteria_data` SET type = '12', value1 = '0', value2 = '0' WHERE `criteria_id` IN (6385);
UPDATE `achievement_criteria_data` SET type = '12', value1 = '1', value2 = '0' WHERE `criteria_id` IN (6384);

-- Fix Emalon the Storm Watcher 10 Man and 25 Man Achievement
UPDATE `achievement_criteria_data` SET type = '12', value1 = '0', value2 = '0' WHERE `criteria_id` IN (10338);
UPDATE `achievement_criteria_data` SET type = '12', value1 = '1', value2 = '0' WHERE `criteria_id` IN (10339);

-- Fix Koralon the Flame Watcher 10 Man and 25 Man Achievement
UPDATE `achievement_criteria_data` SET type = '12', value1 = '0', value2 = '0' WHERE `criteria_id` IN (11478);
UPDATE `achievement_criteria_data` SET type = '12', value1 = '1', value2 = '0' WHERE `criteria_id` IN (11479);

-- Fix Toravon the Ice Watcher 10 Man and 25 Man Achievement
UPDATE `achievement_criteria_data` SET type = '12', value1 = '0', value2 = '0' WHERE `criteria_id` IN (12827);
UPDATE `achievement_criteria_data` SET type = '12', value1 = '1', value2 = '0' WHERE `criteria_id` IN (12828);

-- Spawn Emalon the Storm Watcher in 25 Man Mode
UPDATE `creature` SET spawnMask = '3' WHERE `id` = '33993';